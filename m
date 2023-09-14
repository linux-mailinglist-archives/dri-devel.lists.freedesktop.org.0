Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFE87A0E3F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 21:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AA610E591;
	Thu, 14 Sep 2023 19:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0B010E58F;
 Thu, 14 Sep 2023 19:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694719622; x=1726255622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rr161wN0MuqsRzkLzQBjgeVlZVLuc/Z8RG20ltImKAE=;
 b=VosKegKm7koy583mUIRdLo6xXFbJbkT4ar5++F5gV8VJTOwwmpX/E0CG
 NtGdQMSCameORmjHDFCqzTQ3me8CebTGDKcZKkM37gT+LMRfByYYZUxu9
 B9/VEWpLaoPTd9IoLGP+cidwjF/2rlerDxZaHFWWKqT2HrLzD3CFTsbwj
 dgsd45XssJwmkASOmG6bgFVCUjZLeCK7G2C6w7yMHzc1lU+CpQ4bCQapf
 XX/HHL80XW4aRuDAA+Y1eJGcyfnZNrgO9OY9XJ07y3sZkLrw1VZiX2kNA
 PoMLuf08fne57yBVzk2kEZ4vfD+or/ntP84ww7ouDQsXw5+K8dBCTczO+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465421740"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="465421740"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779790589"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779790589"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:27:00 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 14/25] drm/dp_mst: Add helper to determine if an MST port
 is downstream of another port
Date: Thu, 14 Sep 2023 22:26:48 +0300
Message-Id: <20230914192659.757475-15-imre.deak@intel.com>
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
index db97aa76575c1..22a901493d24c 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5136,6 +5136,58 @@ static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
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
index 5de0c3d28794b..aecce52cae167 100644
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
2.37.2

