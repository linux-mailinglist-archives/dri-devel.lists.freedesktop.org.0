Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDEA791C2E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 19:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8540B10E3DB;
	Mon,  4 Sep 2023 17:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1100510E3D5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MInRjyjscEBOnZfW5d5L3p863wPuEBOVo5Iv/be4Zk8=; b=So+ueg8QrmUDwFkZALHXS8bGIc
 PorGNQgazPp0N9zeLlYiEryZdW2t6gEB1f4tQ5QY+V+V7+FUf8orODe7tUQ4pBuk53hgWVELmOWr1
 S+QBzZzmMj3K6m3BO1zASrpQLYdXB9t8+rIl4ij+QuoQfWK3TbrBBQh1/wX0uJ5G9FCiMiYMWs6M+
 5r/hHKJMVxUrqn9jEYABGqtMZz3MK5X+O7dovtg/06GqI46aoOxW7Lqo5Rm1bZR9H6ixU7lvx7c4D
 GmAXYGlvdUoByHhfbF0FA7NZ060GyqSF4kXQKScP7FGM2kmhgvBxufpUqKTQE+2BQ7i8Tr2vVzKH6
 V4/tLCEw==;
Received: from [187.36.235.191] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdDjh-0028nB-CW; Mon, 04 Sep 2023 19:51:41 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/17] drm/v3d: Enable BO mapping
Date: Mon,  4 Sep 2023 14:38:59 -0300
Message-ID: <20230904175019.1172713-12-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904175019.1172713-1-mcanal@igalia.com>
References: <20230904175019.1172713-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the indirect CSD CPU job, we will need to access the internal
contents of the BO with the dispatch parameters. Therefore, create
methods to allow the mapping and unmapping of the BO.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 357a0da7e16a..1bdfac8beafd 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -33,6 +33,9 @@ void v3d_free_object(struct drm_gem_object *obj)
 	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
 	struct v3d_bo *bo = to_v3d_bo(obj);
 
+	if (bo->vaddr)
+		v3d_put_bo_vaddr(bo);
+
 	v3d_mmu_remove_ptes(bo);
 
 	mutex_lock(&v3d->bo_lock);
@@ -134,6 +137,7 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
 	bo = to_v3d_bo(&shmem_obj->base);
+	bo->vaddr = NULL;
 
 	ret = v3d_bo_create_finish(&shmem_obj->base);
 	if (ret)
@@ -167,6 +171,20 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 	return obj;
 }
 
+void v3d_get_bo_vaddr(struct v3d_bo *bo)
+{
+	struct drm_gem_shmem_object *obj = &bo->base;
+
+	bo->vaddr = vmap(obj->pages, obj->base.size >> PAGE_SHIFT, VM_MAP,
+			 pgprot_writecombine(PAGE_KERNEL));
+}
+
+void v3d_put_bo_vaddr(struct v3d_bo *bo)
+{
+	vunmap(bo->vaddr);
+	bo->vaddr = NULL;
+}
+
 int v3d_create_bo_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 2a3f3beb272c..7940b6b1efd0 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -179,6 +179,8 @@ struct v3d_bo {
 	 * v3d_render_job->unref_list
 	 */
 	struct list_head unref_head;
+
+	void *vaddr;
 };
 
 static inline struct v3d_bo *
@@ -361,6 +363,8 @@ struct drm_gem_object *v3d_create_object(struct drm_device *dev, size_t size);
 void v3d_free_object(struct drm_gem_object *gem_obj);
 struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 			     size_t size);
+void v3d_get_bo_vaddr(struct v3d_bo *bo);
+void v3d_put_bo_vaddr(struct v3d_bo *bo);
 int v3d_create_bo_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv);
 int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
-- 
2.41.0

