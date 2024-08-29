Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9E9645E2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2468E10E67A;
	Thu, 29 Aug 2024 13:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iP1HODw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8B310E67E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZFsdFTsJ7pl8kf7rLTyNa9jHJjwc/97US6EtYpMrySM=; b=iP1HODw+N15FO/iMnYZWp5oz09
 CLIPCcQnMYAO+74yVAyXifJHw5vdqo8ZhnAKDAolT7+DjP3+8fw4TqjYBePUswXRuZ1x1rlkikCTt
 7RUjo2m4PGGO79umhHlg4jbOtVKuNbQUjobj4YaAmsrGS9OPo+adZ/11MkY7AOb46yRvR2loJrnFF
 hG1sw/bmupcWAt6UZAK9A1xpRMuEaLBwSNY2GnpRt8qWMyagpBmpj4dZDhnp+vp/scKz5Mp3i9IjC
 WmGA0Gn2yGWciean8GuZyEyTrp4vTq8SYTfep8IXmyGweLdqtVfVW2e+cvWaI21Jqgvyuhouv6oUN
 yoY0Z+Sw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sjevT-006jlG-NG; Thu, 29 Aug 2024 15:10:59 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 06/10] drm/gem: Create shmem GEM object in a given
 mountpoint
Date: Thu, 29 Aug 2024 10:05:14 -0300
Message-ID: <20240829130954.2439316-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829130954.2439316-1-mcanal@igalia.com>
References: <20240829130954.2439316-1-mcanal@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a function `drm_gem_shmem_create_with_mnt()`, similar to
`drm_gem_shmem_create()`, that has a mountpoint as a argument. This
function will create a shmem GEM object in a given tmpfs mountpoint.

This function will be useful for drivers that have a special mountpoint
with flags enabled.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 30 ++++++++++++++++++++++----
 include/drm/drm_gem_shmem_helper.h     |  3 +++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 53c003983ad1..8508060a1a95 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -49,7 +49,8 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 };
 
 static struct drm_gem_shmem_object *
-__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
+__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
+		       struct vfsmount *gemfs)
 {
 	struct drm_gem_shmem_object *shmem;
 	struct drm_gem_object *obj;
@@ -76,7 +77,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 		drm_gem_private_object_init(dev, obj, size);
 		shmem->map_wc = false; /* dma-buf mappings use always writecombine */
 	} else {
-		ret = drm_gem_object_init(dev, obj, size);
+		ret = drm_gem_object_init_with_mnt(dev, obj, size, gemfs);
 	}
 	if (ret) {
 		drm_gem_private_object_fini(obj);
@@ -123,10 +124,31 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
  */
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size)
 {
-	return __drm_gem_shmem_create(dev, size, false);
+	return __drm_gem_shmem_create(dev, size, false, NULL);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+/**
+ * drm_gem_shmem_create_with_mnt - Allocate an object with the given size in a
+ * given mountpoint
+ * @dev: DRM device
+ * @size: Size of the object to allocate
+ * @gemfs: tmpfs mount where the GEM object will be created
+ *
+ * This function creates a shmem GEM object in a given tmpfs mountpoint.
+ *
+ * Returns:
+ * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *dev,
+							   size_t size,
+							   struct vfsmount *gemfs)
+{
+	return __drm_gem_shmem_create(dev, size, false, gemfs);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
+
 /**
  * drm_gem_shmem_free - Free resources associated with a shmem GEM object
  * @shmem: shmem GEM object to free
@@ -765,7 +787,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 	size_t size = PAGE_ALIGN(attach->dmabuf->size);
 	struct drm_gem_shmem_object *shmem;
 
-	shmem = __drm_gem_shmem_create(dev, size, true);
+	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
 	if (IS_ERR(shmem))
 		return ERR_CAST(shmem);
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index efbc9f27312b..d22e3fb53631 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -97,6 +97,9 @@ struct drm_gem_shmem_object {
 	container_of(obj, struct drm_gem_shmem_object, base)
 
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
+struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *dev,
+							   size_t size,
+							   struct vfsmount *gemfs);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
-- 
2.46.0

