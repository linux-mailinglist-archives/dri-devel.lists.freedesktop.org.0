Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C070A9392C8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CB210E1E5;
	Mon, 22 Jul 2024 16:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRcqS4CP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2332310E1D4;
 Mon, 22 Jul 2024 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721667292; x=1753203292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AodyJN6SRyMgd7ViejlGYKmejthVAj4PEvqXXIlxLLE=;
 b=kRcqS4CP7r8F386INc1A1tjEzXpFvQ8aTZh4TUnwJzjs7RkXKoUhbG6P
 M252QH1BXYb/gttKZ6+ZzTeS7sb8fCRVUbmTP9SK7q8Cs0Ff1peCbJGtY
 c1OC+BGPDBjzZZVX1FXh7s0JQesvcqWt3bmuiXagjsYLH9dkZjZI+kcH+
 3tkfh9M7Vi9J//OahW4ZpZAWughAZ4M5KEfNst/6Jl7hQZpa2PFfjmMx4
 6qGgvg+8B9wtMeWImsXghzGoyOIBm17v+lYkkffcKzpvJ33xo7faWHfFe
 iSTUFRV1zioZMowVUU1QI3in8jjan7uJUx4xZatUftcahhnEI7BONBsBm w==;
X-CSE-ConnectionGUID: 2Da/0DpRTMqeSa7R9X6iHQ==
X-CSE-MsgGUID: 4uZ97U9vQm6WY3/dXSKCcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23117297"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="23117297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:54:51 -0700
X-CSE-ConnectionGUID: EYZGFMl7T7+SEWy7z/m0Aw==
X-CSE-MsgGUID: shUHNWt3RUmgG1PEs6NBtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="57056196"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:54:50 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/14] drm/dp_mst: Add a helper to queue a topology probe
Date: Mon, 22 Jul 2024 19:54:51 +0300
Message-ID: <20240722165503.2084999-3-imre.deak@intel.com>
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

A follow up i915 patch will need to reprobe the MST topology after the
initial probing, add a helper for this.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 27 +++++++++++++++++++
 include/drm/display/drm_dp_mst_helper.h       |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index b185b3b38bd2f..70e4bfc3532e0 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3728,6 +3728,33 @@ drm_dp_mst_topology_mgr_invalidate_mstb(struct drm_dp_mst_branch *mstb)
 			drm_dp_mst_topology_mgr_invalidate_mstb(port->mstb);
 }
 
+/**
+ * drm_dp_mst_topology_queue_probe - Queue a topology probe
+ * @mgr: manager to probe
+ *
+ * Queue a work to probe the MST topology. Driver's should call this only to
+ * sync the topology's HW->SW state after the MST link's parameters have
+ * changed in a way the state could've become out-of-sync. This is the case
+ * for instance when the link rate between the source and first downstream
+ * branch device has switched between UHBR and non-UHBR rates. Except of those
+ * cases - for instance when a sink gets plugged/unplugged to a port - the SW
+ * state will get updated automatically via MST UP message notifications.
+ */
+void drm_dp_mst_topology_queue_probe(struct drm_dp_mst_topology_mgr *mgr)
+{
+	mutex_lock(&mgr->lock);
+
+	if (drm_WARN_ON(mgr->dev, !mgr->mst_state || !mgr->mst_primary))
+		goto out_unlock;
+
+	drm_dp_mst_topology_mgr_invalidate_mstb(mgr->mst_primary);
+	drm_dp_mst_queue_probe_work(mgr);
+
+out_unlock:
+	mutex_unlock(&mgr->lock);
+}
+EXPORT_SYMBOL(drm_dp_mst_topology_queue_probe);
+
 /**
  * drm_dp_mst_topology_mgr_suspend() - suspend the MST manager
  * @mgr: manager to suspend
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index cfe096389d94f..02b037d3a93f7 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -885,6 +885,8 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
 void drm_dp_mst_dump_topology(struct seq_file *m,
 			      struct drm_dp_mst_topology_mgr *mgr);
 
+void drm_dp_mst_topology_queue_probe(struct drm_dp_mst_topology_mgr *mgr);
+
 void drm_dp_mst_topology_mgr_suspend(struct drm_dp_mst_topology_mgr *mgr);
 int __must_check
 drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
-- 
2.44.2

