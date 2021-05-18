Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015C3873E8
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 10:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C186E860;
	Tue, 18 May 2021 08:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D656E860;
 Tue, 18 May 2021 08:27:38 +0000 (UTC)
IronPort-SDR: M2JGsQYAc5Cx9z+AUxzP2nvl8MP6QYrb6d3khltxg5/ffpwb+MaqTBr4b7qvBEM1XxFX37KAL8
 NTi/5N8r6Oqg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180937169"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="180937169"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:37 -0700
IronPort-SDR: 9SixtBSdRigY3EOZGHPrkGHxFYTiyvef14ws8xZgZxRqy9YlN+MKZKWkTCYn88jMzYgb9ZcUJ2
 J1HOfvy6pL9g==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="611892298"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/15] drm/ttm: Export functions to initialize and finalize
 the ttm range manager standalone
Date: Tue, 18 May 2021 10:26:50 +0200
Message-Id: <20210518082701.997251-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915 mock selftests are run without the device set up. In order to be able
to run the region related mock selftests, export functions in order for the
TTM range manager to be set up without a device to attach it to.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 55 +++++++++++++++++--------
 include/drm/ttm/ttm_bo_driver.h         | 23 +++++++++++
 2 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index b9d5da6e6a81..6957dfb0cf5a 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -125,55 +125,76 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.debug = ttm_range_man_debug
 };
 
-int ttm_range_man_init(struct ttm_device *bdev,
-		       unsigned type, bool use_tt,
-		       unsigned long p_size)
+struct ttm_resource_manager *
+ttm_range_man_init_standalone(unsigned long size, bool use_tt)
 {
 	struct ttm_resource_manager *man;
 	struct ttm_range_manager *rman;
 
 	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
 	if (!rman)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	man = &rman->manager;
 	man->use_tt = use_tt;
 
 	man->func = &ttm_range_manager_func;
 
-	ttm_resource_manager_init(man, p_size);
+	ttm_resource_manager_init(man, size);
 
-	drm_mm_init(&rman->mm, 0, p_size);
+	drm_mm_init(&rman->mm, 0, size);
 	spin_lock_init(&rman->lock);
 
-	ttm_set_driver_manager(bdev, type, &rman->manager);
+	return man;
+}
+EXPORT_SYMBOL(ttm_range_man_init_standalone);
+
+int ttm_range_man_init(struct ttm_device *bdev,
+		       unsigned int type, bool use_tt,
+		       unsigned long p_size)
+{
+	struct ttm_resource_manager *man;
+
+	man = ttm_range_man_init_standalone(p_size, use_tt);
+	if (IS_ERR(man))
+		return PTR_ERR(man);
+
 	ttm_resource_manager_set_used(man, true);
+	ttm_set_driver_manager(bdev, type, man);
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_range_man_init);
 
+void ttm_range_man_fini_standalone(struct ttm_resource_manager *man)
+{
+	struct ttm_range_manager *rman = to_range_manager(man);
+	struct drm_mm *mm = &rman->mm;
+
+	spin_lock(&rman->lock);
+	drm_mm_clean(mm);
+	drm_mm_takedown(mm);
+	spin_unlock(&rman->lock);
+
+	ttm_resource_manager_cleanup(man);
+	kfree(rman);
+}
+EXPORT_SYMBOL(ttm_range_man_fini_standalone);
+
 int ttm_range_man_fini(struct ttm_device *bdev,
 		       unsigned type)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
-	struct ttm_range_manager *rman = to_range_manager(man);
-	struct drm_mm *mm = &rman->mm;
 	int ret;
 
 	ttm_resource_manager_set_used(man, false);
-
 	ret = ttm_resource_manager_evict_all(bdev, man);
 	if (ret)
 		return ret;
 
-	spin_lock(&rman->lock);
-	drm_mm_clean(mm);
-	drm_mm_takedown(mm);
-	spin_unlock(&rman->lock);
-
-	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(bdev, type, NULL);
-	kfree(rman);
+	ttm_range_man_fini_standalone(man);
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_range_man_fini);
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index dbccac957f8f..734b1712ea72 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -321,6 +321,20 @@ int ttm_range_man_init(struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
 		       unsigned long p_size);
 
+/**
+ * ttm_range_man_init_standalone - Initialize a ttm range manager without
+ * device interaction.
+ * @size: Size of the area to be managed in pages.
+ * @use_tt: The memory type requires tt backing.
+ *
+ * This function is intended for selftests. It initializes a range manager
+ * without any device interaction.
+ *
+ * Return: pointer to a range manager on success. Error pointer on failure.
+ */
+struct ttm_resource_manager *
+ttm_range_man_init_standalone(unsigned long size, bool use_tt);
+
 /**
  * ttm_range_man_fini
  *
@@ -332,4 +346,13 @@ int ttm_range_man_init(struct ttm_device *bdev,
 int ttm_range_man_fini(struct ttm_device *bdev,
 		       unsigned type);
 
+/**
+ * ttm_range_man_fini_standalone
+ * @man: The range manager
+ *
+ * Tear down a range manager initialized with
+ * ttm_range_manager_init_standalone().
+ */
+void ttm_range_man_fini_standalone(struct ttm_resource_manager *man);
+
 #endif
-- 
2.31.1

