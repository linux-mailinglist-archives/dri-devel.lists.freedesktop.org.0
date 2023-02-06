Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC868BC08
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 12:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F221A10E394;
	Mon,  6 Feb 2023 11:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B5610E391;
 Mon,  6 Feb 2023 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675684147; x=1707220147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WjpMaXLFh1RPQqCpfsf+7xTazQ4XyK3s5mfDv/APk9Q=;
 b=XI3hYrBx35K6ffHbCLVitQg+VGTDf7NqKiehq5NPJfTbxbswdgMvZvw4
 bl1Xmuc7S5+mHxnaGaCpnV6LbZRdRF+DmbNHZAGdacVKP403T89tp0Du7
 MOyyuYGXR49dDse7tDlSnsPv/pVZE/d+fpdYEJXPc65NZsYa952UpoIAP
 eUvxB03yeVR3l6c30Tm5uA59NLZXOomgFyQgkaXHpOZAbqHo9jYvdEToY
 0lcGuAcLl/zrBFUw5k46JGNZQBmizBbzHCBPYeNtVyQqZ4OqIxPzEeXqu
 B6AHzaXXKiFGx36Nq7PPMgxBfFRqBjWJb3TaUXyq0EPddblCe8hSKxfvz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308829059"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="308829059"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 03:49:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="696850351"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="696850351"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 03:49:04 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 3/4] drm/display/dp_mst: Add
 drm_atomic_get_old_mst_topology_state()
Date: Mon,  6 Feb 2023 13:48:55 +0200
Message-Id: <20230206114856.2665066-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230206114856.2665066-1-imre.deak@intel.com>
References: <20230206114856.2665066-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function to get the old MST topology state, required by a
follow-up i915 patch.

While at it clarify the code comment of
drm_atomic_get_new_mst_topology_state() and add _new prefix
to the new state pointer to remind about its difference from the old
state.

v2: Use old_/new_ prefixes for the state pointers. (Ville)

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: stable@vger.kernel.org # 6.1
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 33 ++++++++++++++++---
 include/drm/display/drm_dp_mst_helper.h       |  3 ++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 1990ff5dc7ddd..38dab76ae69ea 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5364,28 +5364,53 @@ struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_a
 }
 EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
 
+/**
+ * drm_atomic_get_old_mst_topology_state: get old MST topology state in atomic state, if any
+ * @state: global atomic state
+ * @mgr: MST topology manager, also the private object in this case
+ *
+ * This function wraps drm_atomic_get_old_private_obj_state() passing in the MST atomic
+ * state vtable so that the private object state returned is that of a MST
+ * topology object.
+ *
+ * Returns:
+ *
+ * The old MST topology state, or NULL if there's no topology state for this MST mgr
+ * in the global atomic state
+ */
+struct drm_dp_mst_topology_state *
+drm_atomic_get_old_mst_topology_state(struct drm_atomic_state *state,
+				      struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct drm_private_state *old_priv_state =
+		drm_atomic_get_old_private_obj_state(state, &mgr->base);
+
+	return old_priv_state ? to_dp_mst_topology_state(old_priv_state) : NULL;
+}
+EXPORT_SYMBOL(drm_atomic_get_old_mst_topology_state);
+
 /**
  * drm_atomic_get_new_mst_topology_state: get new MST topology state in atomic state, if any
  * @state: global atomic state
  * @mgr: MST topology manager, also the private object in this case
  *
- * This function wraps drm_atomic_get_priv_obj_state() passing in the MST atomic
+ * This function wraps drm_atomic_get_new_private_obj_state() passing in the MST atomic
  * state vtable so that the private object state returned is that of a MST
  * topology object.
  *
  * Returns:
  *
- * The MST topology state, or NULL if there's no topology state for this MST mgr
+ * The new MST topology state, or NULL if there's no topology state for this MST mgr
  * in the global atomic state
  */
 struct drm_dp_mst_topology_state *
 drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
 				      struct drm_dp_mst_topology_mgr *mgr)
 {
-	struct drm_private_state *priv_state =
+	struct drm_private_state *new_priv_state =
 		drm_atomic_get_new_private_obj_state(state, &mgr->base);
 
-	return priv_state ? to_dp_mst_topology_state(priv_state) : NULL;
+	return new_priv_state ? to_dp_mst_topology_state(new_priv_state) : NULL;
 }
 EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
 
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index f5eb9aa152b14..32c764fb9cb56 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -868,6 +868,9 @@ struct drm_dp_mst_topology_state *
 drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
 				  struct drm_dp_mst_topology_mgr *mgr);
 struct drm_dp_mst_topology_state *
+drm_atomic_get_old_mst_topology_state(struct drm_atomic_state *state,
+				      struct drm_dp_mst_topology_mgr *mgr);
+struct drm_dp_mst_topology_state *
 drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
 				      struct drm_dp_mst_topology_mgr *mgr);
 struct drm_dp_mst_atomic_payload *
-- 
2.37.1

