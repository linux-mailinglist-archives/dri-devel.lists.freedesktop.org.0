Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8947A0E40
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 21:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3252710E590;
	Thu, 14 Sep 2023 19:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D2A10E590;
 Thu, 14 Sep 2023 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694719624; x=1726255624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/6uECFiiAsVPqzzHFLj/v42YQGg3Xt9FsD2CAWLOtv8=;
 b=gl9aPtdb/DBMsT+wkyAXXcVB5/SlQ0uT/P4u9F3F18R3vOvjUYZ8BGkZ
 MxJu1wTu+SEj1/SgxQLtgPGVEiU6BfLZu0gLlOaYtO56hiIZTuRNz+Hp+
 Ch0faohhY/gMag6XmfL1hghbYLzlyB9oN0Tll3FtBjQPnj9vqojWVrC6h
 vtR+nuV5ZzThM75Oiiezqm+W2Q5ChtWMSTW1QgGEBZgqYD+OvdVFy3szt
 eElgoRVNKUp/UluEOpNuDEc2oz1yPJi4iAI258FVP8WGd6/CaI/JxTqV4
 gKWur4E6al3b64eMMAPhzlV2d/Uh+zVnHjtqH8mhZytO6xoIjyoqkj+bt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465421747"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="465421747"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779790593"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779790593"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:27:02 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 15/25] drm/dp_mst: Factor out a helper to check the atomic
 state of a topology manager
Date: Thu, 14 Sep 2023 22:26:49 +0300
Message-Id: <20230914192659.757475-16-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230914192659.757475-1-imre.deak@intel.com>
References: <20230914192659.757475-1-imre.deak@intel.com>
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

Factor out a helper to check the atomic state for one MST topology
manager, returning the MST port where the BW limit check has failed.
This will be used in a follow-up patch by the i915 driver to improve the
BW sharing between MST streams.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 93 +++++++++++++++----
 include/drm/display/drm_dp_mst_helper.h       |  4 +
 2 files changed, 78 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 22a901493d24c..3d93bc093c46c 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5190,11 +5190,13 @@ EXPORT_SYMBOL(drm_dp_mst_port_downstream_of_parent);
 
 static int
 drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
-				      struct drm_dp_mst_topology_state *state);
+				      struct drm_dp_mst_topology_state *state,
+				      struct drm_dp_mst_port **failing_port);
 
 static int
 drm_dp_mst_atomic_check_mstb_bw_limit(struct drm_dp_mst_branch *mstb,
-				      struct drm_dp_mst_topology_state *state)
+				      struct drm_dp_mst_topology_state *state,
+				      struct drm_dp_mst_port **failing_port)
 {
 	struct drm_dp_mst_atomic_payload *payload;
 	struct drm_dp_mst_port *port;
@@ -5223,7 +5225,7 @@ drm_dp_mst_atomic_check_mstb_bw_limit(struct drm_dp_mst_branch *mstb,
 		drm_dbg_atomic(mstb->mgr->dev, "[MSTB:%p] Checking bandwidth limits\n", mstb);
 
 	list_for_each_entry(port, &mstb->ports, next) {
-		ret = drm_dp_mst_atomic_check_port_bw_limit(port, state);
+		ret = drm_dp_mst_atomic_check_port_bw_limit(port, state, failing_port);
 		if (ret < 0)
 			return ret;
 
@@ -5235,7 +5237,8 @@ drm_dp_mst_atomic_check_mstb_bw_limit(struct drm_dp_mst_branch *mstb,
 
 static int
 drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
-				      struct drm_dp_mst_topology_state *state)
+				      struct drm_dp_mst_topology_state *state,
+				      struct drm_dp_mst_port **failing_port)
 {
 	struct drm_dp_mst_atomic_payload *payload;
 	int pbn_used = 0;
@@ -5256,13 +5259,15 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 			drm_dbg_atomic(port->mgr->dev,
 				       "[MSTB:%p] [MST PORT:%p] no BW available for the port\n",
 				       port->parent, port);
+			*failing_port = port;
 			return -EINVAL;
 		}
 
 		pbn_used = payload->pbn;
 	} else {
 		pbn_used = drm_dp_mst_atomic_check_mstb_bw_limit(port->mstb,
-								 state);
+								 state,
+								 failing_port);
 		if (pbn_used <= 0)
 			return pbn_used;
 	}
@@ -5271,6 +5276,7 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 		drm_dbg_atomic(port->mgr->dev,
 			       "[MSTB:%p] [MST PORT:%p] required PBN of %d exceeds port limit of %d\n",
 			       port->parent, port, pbn_used, port->full_pbn);
+		*failing_port = port;
 		return -ENOSPC;
 	}
 
@@ -5448,20 +5454,79 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
 
+/**
+ * drm_dp_mst_atomic_check_mgr - Check the atomic state of an MST topology manager
+ * @state: The global atomic state
+ * @mgr: Manager to check
+ * @mst_state: The MST atomic state for @mgr
+ * @failing_port: Returns the port with a BW limitation
+ *
+ * Checks the given MST manager's topology state for an atomic update to ensure
+ * that it's valid. This includes checking whether there's enough bandwidth to
+ * support the new timeslot allocations in the atomic update.
+ *
+ * Any atomic drivers supporting DP MST must make sure to call this or
+ * the drm_dp_mst_atomic_check() function after checking the rest of their state
+ * in their &drm_mode_config_funcs.atomic_check() callback.
+ *
+ * See also:
+ * drm_dp_mst_atomic_check()
+ * drm_dp_atomic_find_time_slots()
+ * drm_dp_atomic_release_time_slots()
+ *
+ * Returns:
+ *   - 0 if the new state is valid
+ *   - %-ENOSPC, if the new state is invalid, because of BW limitation
+ *         @failing_port is set to:
+ *         - The non-root port where a BW limit check failed
+ *           The returned port pointer is valid until at least
+ *           one payload downstream of it exists.
+ *         - %NULL if the BW limit check failed at the root port
+ *   - %-EINVAL, if the new state is invalid, because the root port has
+ *     too many payloads.
+ */
+int drm_dp_mst_atomic_check_mgr(struct drm_atomic_state *state,
+				struct drm_dp_mst_topology_mgr *mgr,
+				struct drm_dp_mst_topology_state *mst_state,
+				struct drm_dp_mst_port **failing_port)
+{
+	int ret;
+
+	*failing_port = NULL;
+
+	if (!mgr->mst_state)
+		return 0;
+
+	ret = drm_dp_mst_atomic_check_payload_alloc_limits(mgr, mst_state);
+	if (ret)
+		return ret;
+
+	mutex_lock(&mgr->lock);
+	ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr->mst_primary,
+						    mst_state,
+						    failing_port);
+	mutex_unlock(&mgr->lock);
+
+	return ret < 0 ? ret : 0;
+}
+EXPORT_SYMBOL(drm_dp_mst_atomic_check_mgr);
+
 /**
  * drm_dp_mst_atomic_check - Check that the new state of an MST topology in an
  * atomic update is valid
  * @state: Pointer to the new &struct drm_dp_mst_topology_state
  *
  * Checks the given topology state for an atomic update to ensure that it's
- * valid. This includes checking whether there's enough bandwidth to support
- * the new timeslot allocations in the atomic update.
+ * valid, calling drm_dp_mst_atomic_check_mgr() for all MST manager in the
+ * atomic state. This includes checking whether there's enough bandwidth to
+ * support the new timeslot allocations in the atomic update.
  *
  * Any atomic drivers supporting DP MST must make sure to call this after
  * checking the rest of their state in their
  * &drm_mode_config_funcs.atomic_check() callback.
  *
  * See also:
+ * drm_dp_mst_atomic_check_mgr()
  * drm_dp_atomic_find_time_slots()
  * drm_dp_atomic_release_time_slots()
  *
@@ -5476,21 +5541,11 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
 	int i, ret = 0;
 
 	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
-		if (!mgr->mst_state)
-			continue;
+		struct drm_dp_mst_port *tmp_port;
 
-		ret = drm_dp_mst_atomic_check_payload_alloc_limits(mgr, mst_state);
+		ret = drm_dp_mst_atomic_check_mgr(state, mgr, mst_state, &tmp_port);
 		if (ret)
 			break;
-
-		mutex_lock(&mgr->lock);
-		ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr->mst_primary,
-							    mst_state);
-		mutex_unlock(&mgr->lock);
-		if (ret < 0)
-			break;
-		else
-			ret = 0;
 	}
 
 	return ret;
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index aecce52cae167..0e570b67563b5 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -916,6 +916,10 @@ int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
 int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
 		struct drm_dp_mst_port *port,
 		struct drm_dp_query_stream_enc_status_ack_reply *status);
+int __must_check drm_dp_mst_atomic_check_mgr(struct drm_atomic_state *state,
+					     struct drm_dp_mst_topology_mgr *mgr,
+					     struct drm_dp_mst_topology_state *mst_state,
+					     struct drm_dp_mst_port **failing_port);
 int __must_check drm_dp_mst_atomic_check(struct drm_atomic_state *state);
 int __must_check drm_dp_mst_root_conn_atomic_check(struct drm_connector_state *new_conn_state,
 						   struct drm_dp_mst_topology_mgr *mgr);
-- 
2.37.2

