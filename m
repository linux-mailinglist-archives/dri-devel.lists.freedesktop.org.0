Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E2A3AC7D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C771610E463;
	Tue, 18 Feb 2025 23:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="M2r2mMvi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C721D10E779
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739921340; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RnCgSv/BfIU54AQTpHckROhV7AhgvZ2s5yE1hiYtY4HI7OCmRj3pgWpm9HbVTvp9MZ84V6hJJfXKvForuQ3i+q4wX+ssJm+mXzGG88sPn5/AYr84mJDF8NwzJWxPZUfbPjCM/+7MA1Rpw/aDaD3zPM4uqk1kXgOFrd2yv1zELiE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739921340;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=n3MGcvZJ2jssBxw31RXxSN0eBDZxEkdm3sXeyoWiJR4=; 
 b=lGA4gdInt0uvqni3N8MDyjGAYMCuR3KXVnl7XRj1tXZqc5Mx/90xMmmQchkfQED960y0qecQL6MKsrkPt5d9aFfU12xg47H+fqm4KJ9xkw3MPTUhGU5YeSmU+JywQXPb7Dt47ZDvH22NXtDMQXaNNHgv9UMhtL7kEs0K+KsF3Sw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739921340; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=n3MGcvZJ2jssBxw31RXxSN0eBDZxEkdm3sXeyoWiJR4=;
 b=M2r2mMviKC8pmuNGhWoKa6o3u99Kcp1TEkCLHqjdKKOgdX2x2VgEWzAFBXICR3Ep
 yOBNJMWCw1kbO14NcMuLcmP68AKt0KHww1jhaUIMZpD5t+Dd2M2ZTe2Ly7s24+5pReW
 kCsQCIMAqIIFOFFO0vMcbAswrIady1ubXJUsU8hA=
Received: by mx.zohomail.com with SMTPS id 1739921339255606.5607224644493;
 Tue, 18 Feb 2025 15:28:59 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [RFC PATCH 4/7] drm/shmem: Introduce the notion of sparse objects
Date: Tue, 18 Feb 2025 23:25:34 +0000
Message-ID: <20250218232552.3450939-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
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

Sparse DRM objects will store their backing pages in an xarray, to avoid the
overhead of preallocating a huge struct page pointer array when only a very
small range of indices might be assigned.

For now, only the definition of a sparse object as a union alternative to a
'dense' object is provided, with functions that exploit it being part of later
commits.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 42 +++++++++++++++++++++++---
 include/drm/drm_gem_shmem_helper.h     | 18 ++++++++++-
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5ab351409312..d63e42be2d72 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -10,6 +10,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/xarray.h>
 
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
@@ -50,7 +51,7 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 
 static struct drm_gem_shmem_object *
 __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
-		       struct vfsmount *gemfs)
+		       bool sparse, struct vfsmount *gemfs)
 {
 	struct drm_gem_shmem_object *shmem;
 	struct drm_gem_object *obj;
@@ -90,6 +91,11 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
 
 	INIT_LIST_HEAD(&shmem->madv_list);
 
+	if (unlikely(sparse))
+		xa_init_flags(&shmem->xapages, XA_FLAGS_ALLOC);
+
+	shmem->sparse = sparse;
+
 	if (!private) {
 		/*
 		 * Our buffers are kept pinned, so allocating them
@@ -124,10 +130,16 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
  */
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size)
 {
-	return __drm_gem_shmem_create(dev, size, false, NULL);
+	return __drm_gem_shmem_create(dev, size, false, false, NULL);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+struct drm_gem_shmem_object *drm_gem_shmem_create_sparse(struct drm_device *dev, size_t size)
+{
+	return __drm_gem_shmem_create(dev, size, false, true, NULL);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_create_sparse);
+
 /**
  * drm_gem_shmem_create_with_mnt - Allocate an object with the given size in a
  * given mountpoint
@@ -145,7 +157,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *de
 							   size_t size,
 							   struct vfsmount *gemfs)
 {
-	return __drm_gem_shmem_create(dev, size, false, gemfs);
+	return __drm_gem_shmem_create(dev, size, false, false, gemfs);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
 
@@ -173,7 +185,9 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
-		if (shmem->pages)
+
+		if ((!shmem->sparse && shmem->pages) ||
+		    (shmem->sparse && !xa_empty(&shmem->xapages)))
 			drm_gem_shmem_put_pages(shmem);
 
 		drm_WARN_ON(obj->dev, shmem->pages_use_count);
@@ -191,11 +205,19 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
 
+	if (drm_WARN_ON(obj->dev, shmem->sparse))
+		return -EINVAL;
+
 	dma_resv_assert_held(shmem->base.resv);
 
 	if (shmem->pages_use_count++ > 0)
 		return 0;
 
+	/* We only allow increasing the user count in the case of
+	  sparse shmem objects with some backed pages for now */
+	if (shmem->sparse && xa_empty(&shmem->xapages))
+		return -EINVAL;
+
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
 		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
@@ -541,6 +563,8 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	struct page *page;
 	pgoff_t page_offset;
 
+	drm_WARN_ON(obj->dev, shmem->sparse);
+
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
@@ -567,6 +591,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->dev, shmem->sparse);
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
@@ -666,6 +691,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	if (shmem->base.import_attach)
 		return;
 
+	if (drm_WARN_ON(shmem->base.dev, shmem->sparse))
+		return;
+
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
@@ -691,6 +719,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 	struct drm_gem_object *obj = &shmem->base;
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->dev, shmem->sparse);
 
 	return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_SHIFT);
 }
@@ -702,6 +731,9 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	int ret;
 	struct sg_table *sgt;
 
+	if (drm_WARN_ON(obj->dev, shmem->sparse))
+		return ERR_PTR(-EINVAL);
+
 	if (shmem->sgt)
 		return shmem->sgt;
 
@@ -787,7 +819,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 	size_t size = PAGE_ALIGN(attach->dmabuf->size);
 	struct drm_gem_shmem_object *shmem;
 
-	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
+	shmem = __drm_gem_shmem_create(dev, size, true, false, NULL);
 	if (IS_ERR(shmem))
 		return ERR_CAST(shmem);
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d22e3fb53631..902039cfc4ce 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -6,6 +6,7 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -29,7 +30,11 @@ struct drm_gem_shmem_object {
 	/**
 	 * @pages: Page table
 	 */
-	struct page **pages;
+	union {
+
+		struct page **pages;
+		struct xarray xapages;
+	};
 
 	/**
 	 * @pages_use_count:
@@ -91,6 +96,11 @@ struct drm_gem_shmem_object {
 	 * @map_wc: map object write-combined (instead of using shmem defaults).
 	 */
 	bool map_wc : 1;
+
+	/**
+	 * @sparse: the object's virtual memory space is only partially backed by pages
+	 */
+	bool sparse : 1;
 };
 
 #define to_drm_gem_shmem_obj(obj) \
@@ -229,6 +239,9 @@ static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
+	if (shmem->sparse)
+		return -EACCES;
+
 	return drm_gem_shmem_vmap(shmem, map);
 }
 
@@ -263,6 +276,9 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
+	if (shmem->sparse)
+		return -EACCES;
+
 	return drm_gem_shmem_mmap(shmem, vma);
 }
 
-- 
2.47.1

