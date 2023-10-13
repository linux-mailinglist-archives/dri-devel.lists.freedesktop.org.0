Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E746D7C87ED
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3743410E10E;
	Fri, 13 Oct 2023 14:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9890410E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697207692; x=1728743692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x9TAgWn1t+sPUilXVrm5Zzp5IO0+tb79z0zkmZZdkjg=;
 b=M8Djm9fofiNnBy6ca4G/t+fjtoT7A3s4k30BSSp7Q2olXtgYQTv/yEka
 Nvk57uelqp2s96hvG2CS4ytArrFLwJ+LMoy4CRRa4V0AjODiXPAS8Xfga
 AHbyKqnFhW9v93Wa+7PCxN4h9hU6pC8IJd8jK85KxSN57r7LnEzZEpx6C
 LO99pDJ20AKomeXI8mIddE79lmqokUQN+R1/ZkykidgEF6tmg1bvK39jY
 s8fuvrdMC5HwWWjh8+/Z5wntztRIg2uHqBwcIlrUGcT9NaaW3LHJntdWq
 TgiS8/4B1vJ++PJJPafeDpdR4yx66CxOGkVDOjFiZiwPoqPGZgKNV2+67 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364555862"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="364555862"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 07:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825074594"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="825074594"
Received: from mmach-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.17.253])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 07:34:22 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Drain workqueue before sys manager release
Date: Fri, 13 Oct 2023 16:34:23 +0200
Message-Id: <20231013143423.1503088-1-karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In rare cases, a delayed destruction of a BO with a system resource
could stay in the workqueue until drain_workqueue() is called
in ttm_device_fini(). An attempt to free a resource from an already
released manager results in NULL pointer dereference. Move the step
of draining and destroying the workqueue so it happens before
the ttm_sys_manager cleanup.

Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers")
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
Some background: I stumbled upon this issue when testing
ttm_bo_pipeline_gutting() with BO with an active dma_resv fence. In ~2% of
the runs, the delayed destruction of the ghost wouldn't happen until the
drain_queue() step. man->func->free(man, *res) got called via
ttm_bo_cleanup_memtype_use(), the manager and its functions were nowhere to
be seen, resulting in a nulptr deref.

 drivers/gpu/drm/ttm/ttm_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 7726a72befc5..753126581620 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -232,6 +232,9 @@ void ttm_device_fini(struct ttm_device *bdev)
 	struct ttm_resource_manager *man;
 	unsigned i;
 
+	drain_workqueue(bdev->wq);
+	destroy_workqueue(bdev->wq);
+
 	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
 	ttm_resource_manager_set_used(man, false);
 	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
@@ -240,9 +243,6 @@ void ttm_device_fini(struct ttm_device *bdev)
 	list_del(&bdev->device_list);
 	mutex_unlock(&ttm_global_mutex);
 
-	drain_workqueue(bdev->wq);
-	destroy_workqueue(bdev->wq);
-
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		if (list_empty(&man->lru[0]))
-- 
2.25.1

