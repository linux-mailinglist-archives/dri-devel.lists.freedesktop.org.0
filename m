Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A500F1ED7D8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 23:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ED389E3F;
	Wed,  3 Jun 2020 21:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A2289DA2;
 Wed,  3 Jun 2020 21:10:45 +0000 (UTC)
IronPort-SDR: qX4d8cTJdq7sf/oVMbVuYkrgIbpcDgCo9N/N2r25QSWlYgJ3CzsaReMVSkSNZ3Z+H+iJRGjZ09
 2ML9HP23BPPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 14:10:44 -0700
IronPort-SDR: QZK9j0hJeAGQu7VKZDfEAagfOBafcA7pYtYbxTWG+XJS9DCZ1vxXz0n9EwDXrPVlGCVnhh9HwM
 AvAi3jitfzFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,469,1583222400"; d="scan'208";a="269199544"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 03 Jun 2020 14:10:43 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/dp_mst: Work around out-of-spec adapters
 filtering short pulses
Date: Thu,  4 Jun 2020 00:10:40 +0300
Message-Id: <20200603211040.8190-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.23.1
In-Reply-To: <20200603211040.8190-1-imre.deak@intel.com>
References: <20200603211040.8190-1-imre.deak@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some TypeC -> native DP adapters, at least the Club CAC-1557 adapter,
incorrectly filter out HPD short pulses with a duration less than ~540
usec, leading to MST probe failures.

According to the DP alt mode specification adapters should forward short
pulses with a duration greater than 250 usec. According to the DP
specificatin DP sources should detect short pulses in the
500 usec -> 2 ms range. Based on this filtering out short pulses with a
duration less than 540 usec is incorrect.

To make such adapters work add support for a driver polling on MST
inerrupt flags, and wire this up in the i915 driver. The sink can clear
an interrupt it raised after 110 ms if the source doesn't respond, so
use a 50 ms poll period to avoid missing an interrupt. Polling of the
MST interrupt flags is explicitly allowed by the DP specification.

This fixes MST probe failures I saw using this adapter and a DELL U2515H
monitor.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c       | 18 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 15 +++++++++++++++
 include/drm/drm_dp_mst_helper.h             |  1 +
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 5bc72e800b85..d1bf340a95a8 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1178,11 +1178,23 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 				    struct drm_dp_sideband_msg_tx *txmsg)
 {
 	struct drm_dp_mst_topology_mgr *mgr = mstb->mgr;
+	unsigned long wait_expires = jiffies + msecs_to_jiffies(4000);
 	int ret;
 
-	ret = wait_event_timeout(mgr->tx_waitq,
-				 check_txmsg_state(mgr, txmsg),
-				 (4 * HZ));
+	for (;;) {
+		ret = wait_event_timeout(mgr->tx_waitq,
+					 check_txmsg_state(mgr, txmsg),
+					 mgr->cbs->update_hpd_irq_state ?
+						msecs_to_jiffies(50) :
+						wait_expires);
+
+		if (ret || !mgr->cbs->update_hpd_irq_state ||
+		    time_after(jiffies, wait_expires))
+			break;
+
+		mgr->cbs->update_hpd_irq_state(mgr);
+	}
+
 	mutex_lock(&mgr->qlock);
 	if (ret > 0) {
 		if (txmsg->state == DRM_DP_SIDEBAND_TX_TIMEOUT) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d18b406f2a7d..1ff7d0096262 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -765,8 +765,23 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	return NULL;
 }
 
+static void
+intel_dp_mst_update_hpd_irq_state(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct intel_dp *intel_dp = container_of(mgr, struct intel_dp, mst_mgr);
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+
+	spin_lock_irq(&i915->irq_lock);
+	i915->hotplug.short_port_mask |= BIT(dig_port->base.port);
+	spin_unlock_irq(&i915->irq_lock);
+
+	queue_work(i915->hotplug.dp_wq, &i915->hotplug.dig_port_work);
+}
+
 static const struct drm_dp_mst_topology_cbs mst_cbs = {
 	.add_connector = intel_dp_add_mst_connector,
+	.update_hpd_irq_state = intel_dp_mst_update_hpd_irq_state,
 };
 
 static struct intel_dp_mst_encoder *
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 9e1ffcd7cb68..c902f4380200 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -475,6 +475,7 @@ struct drm_dp_mst_topology_mgr;
 struct drm_dp_mst_topology_cbs {
 	/* create a connector for a port */
 	struct drm_connector *(*add_connector)(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port, const char *path);
+	void (*update_hpd_irq_state)(struct drm_dp_mst_topology_mgr *mgr);
 };
 
 #define DP_MAX_PAYLOAD (sizeof(unsigned long) * 8)
-- 
2.23.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
