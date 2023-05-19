Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C5709242
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 10:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8DF10E06A;
	Fri, 19 May 2023 08:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AB810E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 08:55:32 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 85C7A66065B2;
 Fri, 19 May 2023 09:55:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684486529;
 bh=2fMIh+Pw+nopPlX1ZUe7ANuFvI8mDtZfIrLJgxIN26o=;
 h=From:To:Cc:Subject:Date:From;
 b=AtW7yl/am7yUM67U33H6I/ZTIqeuhuIyo5uIMGses225EIJF1cyobZKcfJ5NVQ2HN
 e83vkEegG3n8QB1RQCiDvDwCV1Op+BQXsIV6/v0/h895nVBKxW3lHHgCAalbmi1Py5
 51OLeLNAiayK09lPzyjYye6Qn2NQ03/wHWFfaeWRVF5gC0A/LC5j89IBug5dXGOB4n
 GbMZ8vx8kDT+qHcTkIe22dofk+RzNaKIATIAKXuXX7RmZnnk6VQTdU7YiVyqcaYcMG
 +5coq9FywqHikqXuDN4YniJtXI2emvUgMmaUPDS7xFXRAThALHlFmrOyUzNW3XD8n6
 Yag8AlfTlRErA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/managed: Define drmm_mutex_init() as a macro to fix
 lockdep
Date: Fri, 19 May 2023 10:55:25 +0200
Message-Id: <20230519085525.1275339-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drmm_mutex_init() needs to be defined as a macro if we want
lockdep to classify locks properly. If we don't do that, all locks
will be considered as belonging to the same lock class, leading to
false positive deadlock reports.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reported-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/drm_managed.c | 26 --------------------------
 include/drm/drm_managed.h     | 30 +++++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 4cf214de50c4..71c49819a7a2 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -263,29 +263,3 @@ void drmm_kfree(struct drm_device *dev, void *data)
 	free_dr(dr_match);
 }
 EXPORT_SYMBOL(drmm_kfree);
-
-static void drmm_mutex_release(struct drm_device *dev, void *res)
-{
-	struct mutex *lock = res;
-
-	mutex_destroy(lock);
-}
-
-/**
- * drmm_mutex_init - &drm_device-managed mutex_init()
- * @dev: DRM device
- * @lock: lock to be initialized
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise.
- *
- * This is a &drm_device-managed version of mutex_init(). The initialized
- * lock is automatically destroyed on the final drm_dev_put().
- */
-int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
-{
-	mutex_init(lock);
-
-	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
-}
-EXPORT_SYMBOL(drmm_mutex_init);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 359883942612..87ffb92a16ba 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -105,6 +105,34 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
 
 void drmm_kfree(struct drm_device *dev, void *data);
 
-int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
+/* Private function, don't use. */
+static inline void __drmm_mutex_release(struct drm_device *dev, void *res)
+{
+	struct mutex *lock = res;
+
+	mutex_destroy(lock);
+}
+
+/**
+ * drmm_mutex_init - &drm_device-managed mutex_init()
+ * @dev: DRM device
+ * @lock: lock to be initialized
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ *
+ * This is a &drm_device-managed version of mutex_init(). The initialized
+ * lock is automatically destroyed on the final drm_dev_put().
+ *
+ * This needs to be defined as a macro to let lockdep classify locks
+ * properly. If we don't do that, all locks will be considered as
+ * belonging to the same lock class, leading to false positive lockdep
+ * reports.
+ */
+#define drmm_mutex_init(dev, lock) \
+	({\
+		mutex_init(lock); \
+		drmm_add_action_or_reset(dev, __drmm_mutex_release, lock); \
+	})
 
 #endif
-- 
2.40.1

