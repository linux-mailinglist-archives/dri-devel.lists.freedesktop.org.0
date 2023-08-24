Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6378695D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B867C10E4C6;
	Thu, 24 Aug 2023 08:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DA710E4DD;
 Thu, 24 Aug 2023 08:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692864317; x=1724400317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Yl1kj2bzWHWYVr+O90bGX+JMr8MmOgmbCkmm3bTzIc=;
 b=TgNvf1hF5GQp3XB9UQS+TgkMG8KUnAL/tIsskNoOL8ltsZltKAlIA4yR
 LADSKlyotzDNFYt59wu5EldWpUBLthLsLpbfiyBaO2vumAgUA7I3clmTn
 lOcjUao6OBC/7fjrw5soKhiGPXl5XsQv9iWOsGbh/aQJ5lU0LmnlPQF27
 Nogsd8d+/8OnEn8I6Rt8YRB8YigqGAvhVGAFEaIwPxnlk8AkYcdOAVlBR
 8SKPvbWcmXZ2Yun9/fDJIDPvgevy/AGACgsHhycVl33AgOzEyOtmS7+gt
 SbSt76P0umS+MlCTG6B9Q2ogGN/EthxnVJVst3OVzEDqdS7h5S2LMJZ4t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374345876"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374345876"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 01:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880710328"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 01:05:20 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/22] drm/dp_mst: Add helper to determine if an MST port
 is downstream of another port
Date: Thu, 24 Aug 2023 11:05:06 +0300
Message-Id: <20230824080517.693621-12-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230824080517.693621-1-imre.deak@intel.com>
References: <20230824080517.693621-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm_dp_mst_port_downstream_of_parent() required by the i915
driver in a follow-up patch to resolve a BW overallocation of MST
streams going through a given MST port.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 52 +++++++++++++++++++
 include/drm/display/drm_dp_mst_helper.h       |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index e26f1b7f5a701..ced9ae36a9177 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5105,6 +5105,58 @@ static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
 	return false;
 }
 
+static bool
+drm_dp_mst_port_downstream_of_parent_locked(struct drm_dp_mst_topology_mgr *mgr,
+					    struct drm_dp_mst_port *port,
+					    struct drm_dp_mst_port *parent)
+{
+	if (!mgr->mst_primary)
+		return false;
+
+	port = drm_dp_mst_topology_get_port_validated_locked(mgr->mst_primary,
+							     port);
+	if (!port)
+		return false;
+
+	if (!parent)
+		return true;
+
+	parent = drm_dp_mst_topology_get_port_validated_locked(mgr->mst_primary,
+							       parent);
+	if (!parent)
+		return false;
+
+	if (!parent->mstb)
+		return false;
+
+	return drm_dp_mst_port_downstream_of_branch(port, parent->mstb);
+}
+
+/**
+ * drm_dp_mst_port_downstream_of_parent - check if a port is downstream of a parent port
+ * @mgr: MST topology manager
+ * @port: the port being looked up
+ * @parent: the parent port
+ *
+ * The function returns %true if @port is downstream of @parent. If @parent is
+ * %NULL - denoting the root port - the function returns %true if @port is in
+ * @mgr's topology.
+ */
+bool
+drm_dp_mst_port_downstream_of_parent(struct drm_dp_mst_topology_mgr *mgr,
+				     struct drm_dp_mst_port *port,
+				     struct drm_dp_mst_port *parent)
+{
+	bool ret;
+
+	mutex_lock(&mgr->lock);
+	ret = drm_dp_mst_port_downstream_of_parent_locked(mgr, port, parent);
+	mutex_unlock(&mgr->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_dp_mst_port_downstream_of_parent);
+
 static int
 drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 				      struct drm_dp_mst_topology_state *state);
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 0953b7b16a51b..097c4204ffae4 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -879,6 +879,9 @@ drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
 struct drm_dp_mst_atomic_payload *
 drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state,
 				 struct drm_dp_mst_port *port);
+bool drm_dp_mst_port_downstream_of_parent(struct drm_dp_mst_topology_mgr *mgr,
+					  struct drm_dp_mst_port *port,
+					  struct drm_dp_mst_port *parent);
 int __must_check
 drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 			      struct drm_dp_mst_topology_mgr *mgr,
-- 
2.37.2

