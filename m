Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C67DBD0D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 16:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C9A10E307;
	Mon, 30 Oct 2023 15:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0972710E308;
 Mon, 30 Oct 2023 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698681501; x=1730217501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Os9vjAs3NAshuBAE/Iluuvbe4iXWPuh64EHUG2H99Vs=;
 b=I4pXn/du0S160gKhCQVJ3ncs3cZA7CBCLJZklTV2B0nlVj2EQELxmRiK
 h9hxZ2BYkq9uJAT+C34W/uBcic5WSzGXb3btR0IjD0SEQr1rThNrsBw+z
 zUIaEh9N/HhTGs4QT0A7R50xUc841JnaKdSDeriZsAN6z3pjVdaevGZFK
 IFIj5S6g6oxugjluUrb8Q0Q8r4eCHWltJuPz24QK7e0aRB/lOgQYmfgS4
 dpoZsTSU+KCeN3SE2lVUgZroI7dsokfP0Tivo+O0aAx+17sDkDBiuaoJI
 Ur4qA4XQdtnlQ+L0394ruwh2sdaA0FKIdRd9XAbo7+lvjCTIRgcwVxcqi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="974377"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="974377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="789493947"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="789493947"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:58:18 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 03/30] drm/dp_mst: Add helper to determine if an MST port
 is downstream of another port
Date: Mon, 30 Oct 2023 17:58:16 +0200
Message-Id: <20231030155843.2251023-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030155843.2251023-1-imre.deak@intel.com>
References: <20231030155843.2251023-1-imre.deak@intel.com>
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 52 +++++++++++++++++++
 include/drm/display/drm_dp_mst_helper.h       |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 772b00ebd57bd..f733f620347f6 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5126,6 +5126,58 @@ static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
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
index 655862b3d2a49..e44485aa74e94 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -892,6 +892,9 @@ drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
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
2.39.2

