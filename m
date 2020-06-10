Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4DF1F561D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 15:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829866E593;
	Wed, 10 Jun 2020 13:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894C56E593;
 Wed, 10 Jun 2020 13:47:13 +0000 (UTC)
IronPort-SDR: 7pV/PBZQVtbNkpIFDEM7VYBixXBMGykgModubut7Z2LtJlUN8CTRJeCa9YcKM5oNj+Lw5yoXuj
 UxyYtzq/bFqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 06:47:12 -0700
IronPort-SDR: 6gO/UNH81sXGT14EqkgC5ZKwG++YoFXn2qw0hOrDHwwmT62XP+cU2Zi2i/u8Ck72HZ0AioTzzp
 tkGf8s+LOSIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; d="scan'208";a="271250892"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 10 Jun 2020 06:47:11 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/dp_mst: Fix flushing the delayed port/mstb destroy
 work
Date: Wed, 10 Jun 2020 16:47:04 +0300
Message-Id: <20200610134704.25270-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.23.1
In-Reply-To: <20200607212522.16935-3-imre.deak@intel.com>
References: <20200607212522.16935-3-imre.deak@intel.com>
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Atm, a pending delayed destroy work during module removal will be
canceled, leaving behind MST ports, mstbs. Fix this by using a dedicated
workqueue which will be drained of requeued items as well when
destroying it.

v2:
- Check if wq is NULL before calling destroy_workqueue().

Cc: Lyude Paul <lyude@redhat.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 19 ++++++++++++++++---
 include/drm/drm_dp_mst_helper.h       |  8 ++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index eff8d6ac0273..a5f67b9db7fa 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1604,7 +1604,7 @@ static void drm_dp_destroy_mst_branch_device(struct kref *kref)
 	mutex_lock(&mgr->delayed_destroy_lock);
 	list_add(&mstb->destroy_next, &mgr->destroy_branch_device_list);
 	mutex_unlock(&mgr->delayed_destroy_lock);
-	schedule_work(&mgr->delayed_destroy_work);
+	queue_work(mgr->delayed_destroy_wq, &mgr->delayed_destroy_work);
 }
 
 /**
@@ -1721,7 +1721,7 @@ static void drm_dp_destroy_port(struct kref *kref)
 	mutex_lock(&mgr->delayed_destroy_lock);
 	list_add(&port->next, &mgr->destroy_port_list);
 	mutex_unlock(&mgr->delayed_destroy_lock);
-	schedule_work(&mgr->delayed_destroy_work);
+	queue_work(mgr->delayed_destroy_wq, &mgr->delayed_destroy_work);
 }
 
 /**
@@ -5182,6 +5182,15 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	INIT_LIST_HEAD(&mgr->destroy_port_list);
 	INIT_LIST_HEAD(&mgr->destroy_branch_device_list);
 	INIT_LIST_HEAD(&mgr->up_req_list);
+
+	/*
+	 * delayed_destroy_work will be queued on a dedicated WQ, so that any
+	 * requeuing will be also flushed when deiniting the topology manager.
+	 */
+	mgr->delayed_destroy_wq = alloc_ordered_workqueue("drm_dp_mst_wq", 0);
+	if (mgr->delayed_destroy_wq == NULL)
+		return -ENOMEM;
+
 	INIT_WORK(&mgr->work, drm_dp_mst_link_probe_work);
 	INIT_WORK(&mgr->tx_work, drm_dp_tx_work);
 	INIT_WORK(&mgr->delayed_destroy_work, drm_dp_delayed_destroy_work);
@@ -5226,7 +5235,11 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr)
 {
 	drm_dp_mst_topology_mgr_set_mst(mgr, false);
 	flush_work(&mgr->work);
-	cancel_work_sync(&mgr->delayed_destroy_work);
+	/* The following will also drain any requeued work on the WQ. */
+	if (mgr->delayed_destroy_wq) {
+		destroy_workqueue(mgr->delayed_destroy_wq);
+		mgr->delayed_destroy_wq = NULL;
+	}
 	mutex_lock(&mgr->payload_lock);
 	kfree(mgr->payloads);
 	mgr->payloads = NULL;
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 9e1ffcd7cb68..17b568c6f4f8 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -672,6 +672,14 @@ struct drm_dp_mst_topology_mgr {
 	 * @destroy_branch_device_list.
 	 */
 	struct mutex delayed_destroy_lock;
+
+	/**
+	 * @delayed_destroy_wq: Workqueue used for delayed_destroy_work items.
+	 * A dedicated WQ makes it possible to drain any requeued work items
+	 * on it.
+	 */
+	struct workqueue_struct *delayed_destroy_wq;
+
 	/**
 	 * @delayed_destroy_work: Work item to destroy MST port and branch
 	 * devices, needed to avoid locking inversion.
-- 
2.23.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
