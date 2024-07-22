Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BCA9392C7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC7D10E1E6;
	Mon, 22 Jul 2024 16:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAXg0vds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA1910E1DB;
 Mon, 22 Jul 2024 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721667293; x=1753203293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OV88/kwK4YvT9DlYHmoldMp9mSj0Nsri8FX4J1bLmR4=;
 b=KAXg0vdsW47FXQVDXazRFNErnIyFN7AP7IxJh/dugtYRytTFQeytcpk8
 OAQYQkCD+d7R+0Fv3RpwWtw1CROYkw+a9AFUyjDScVFK6NEyp0MAu6h8C
 aggSR/pen+eEE4eTav8I4E9nQ7LgSxhR10GOsCsHKq9cn4c7c24s9Z8Is
 FIx1vfF7UkY4eDOqSKavxHmjBNDpXO5GgTuZlKtgpEpYow4heACZaiMcf
 VXAVtwITt8CUKL54c68DWlm5O98kGrzuenIrHZqKgg2RSO4zvPqGkVc72
 JAmAnJQVHs4w3OApNXbAiu7/JSTHa6sezd0bSFCuxru4QaBovXCIvE/Iy Q==;
X-CSE-ConnectionGUID: R6xwfpOGR1yTTzyUVYFqGQ==
X-CSE-MsgGUID: r9gR8KOdTN65CpJlwfA1cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23117303"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="23117303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:54:53 -0700
X-CSE-ConnectionGUID: ZR4DAZ4wSKGD409R4uptZg==
X-CSE-MsgGUID: vdheB8qHRrGa85wyeJn3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="57056203"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:54:52 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/14] drm/dp_mst: Simplify the condition when to enumerate
 path resources
Date: Mon, 22 Jul 2024 19:54:52 +0300
Message-ID: <20240722165503.2084999-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722165503.2084999-1-imre.deak@intel.com>
References: <20240722165503.2084999-1-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the
	if (old_ddps != port->ddps || !created)
		if (port->ddps && !port->input)
			ret = drm_dp_send_enum_path_resources();

sequence the first if's condition is true if the port exists already
(!created) or the port was created anew (hence old_ddps==0) and it was
in the plugged state (port->ddps==1). The second if's condition is true
for output ports in the plugged state. So the function is called for an
output port in the plugged state, regardless if it already existed or
not and regardless of the old plugged state. In all other cases
port->full_pbn can be zeroed as the port is either an input for which
full_pbn is never set, or an output in the unplugged state for which
full_pbn was already zeroed previously or the port was just created
(with port->full_pbn==0).

Simplify the condition, making it clear that the path resources are
always enumerated for an output port in the plugged state.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 70e4bfc3532e0..bcc5bbed9bd04 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2339,7 +2339,7 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
 {
 	struct drm_dp_mst_topology_mgr *mgr = mstb->mgr;
 	struct drm_dp_mst_port *port;
-	int old_ddps = 0, ret;
+	int ret;
 	u8 new_pdt = DP_PEER_DEVICE_NONE;
 	bool new_mcs = 0;
 	bool created = false, send_link_addr = false, changed = false;
@@ -2372,7 +2372,6 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
 		 */
 		drm_modeset_lock(&mgr->base.lock, NULL);
 
-		old_ddps = port->ddps;
 		changed = port->ddps != port_msg->ddps ||
 			(port->ddps &&
 			 (port->ldps != port_msg->legacy_device_plug_status ||
@@ -2407,15 +2406,13 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
 	 * Reprobe PBN caps on both hotplug, and when re-probing the link
 	 * for our parent mstb
 	 */
-	if (old_ddps != port->ddps || !created) {
-		if (port->ddps && !port->input) {
-			ret = drm_dp_send_enum_path_resources(mgr, mstb,
-							      port);
-			if (ret == 1)
-				changed = true;
-		} else {
-			port->full_pbn = 0;
-		}
+	if (port->ddps && !port->input) {
+		ret = drm_dp_send_enum_path_resources(mgr, mstb,
+						      port);
+		if (ret == 1)
+			changed = true;
+	} else {
+		port->full_pbn = 0;
 	}
 
 	ret = drm_dp_port_set_pdt(port, new_pdt, new_mcs);
-- 
2.44.2

