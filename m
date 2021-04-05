Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656535461E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 19:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED93289E41;
	Mon,  5 Apr 2021 17:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F29D89E41;
 Mon,  5 Apr 2021 17:42:06 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so2450184pji.5; 
 Mon, 05 Apr 2021 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LRG1eNUpIgk81CY0UQCJ60bzUUpB9qtBpu3ufoR+j8=;
 b=D2nAzJtLwxoOX4+J3mJWz1OAewqduQtqpN7T3ykt5zK2TjS6SI6mqeMmSymhQEj41R
 l5BPcZXonPzP61SokcJy5jVjjmwRW6TctN0gzvPRiobbK7Q3T+cAXm9wiUAwcOrgFj3h
 nxz/iUi5Gg4hvYMzg/cdRk3i9YCTajXS6fY9JzAQxuMp6JP7nnIdKivAMplgv3Pekzos
 Ws76fl8miMvvrJapX/rZySzy+VEzGkZjltO3CxxqJH44sSHoxw2BYcBKi5isM/xURs0d
 J2aUc2mTr5O1LxTQj3r33GsZ7kgYFHYToSf03x8+tNuG8/5ytDYMS2qjPNMziST2pJVz
 J1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LRG1eNUpIgk81CY0UQCJ60bzUUpB9qtBpu3ufoR+j8=;
 b=nbZEy4ng4Pi9IH4Kd26sGD0VMEz+z9nSBPJJS4UqVPJ27QjzRHgyw7iNcbm6TkBM+E
 nWaVMJTHl3CphDO7GKa8qpYg7WsuzN5nLJ/O8iErfK41ZpNVv2aZ78e/bh8TfpJmq4Tr
 qxlUM1pDxnw13wKU3HMhTgds3syQJabHd0UAf6cS+RV4UFnfIeeW8ktFA+uTqP6+Dt60
 K+KIkem+ltAQQ+IMmolFc/cdIuwZUGOJ+7DsBf6Bpp7+5G4pZ59QdsfNhpBE+UbmlJb8
 yyI6YsGNd5qIzJeqgaFvxLdwcqw0s1DyB7sHnBPJaLOwsGQZGoHyPbtcZC3cRwDHlUTI
 vsJg==
X-Gm-Message-State: AOAM531eSNYZkuFobZbw7Iz43ziQb3dv4JYmmxerusAZ6nYjHWObQGM3
 0hAEOzp9uNMAvDBIHWAXIpPxAfOabHHJYA==
X-Google-Smtp-Source: ABdhPJy/zdAuuM/6jfnh/2mhjg0lpJ3vI3c+BeHxPWhAnanktVOdB6B3lc6p9HXSa6pbd8RUV4sqSg==
X-Received: by 2002:a17:902:8685:b029:e6:5ff6:f7df with SMTP id
 g5-20020a1709028685b02900e65ff6f7dfmr25046456plo.40.1617644525372; 
 Mon, 05 Apr 2021 10:42:05 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t12sm16731786pga.85.2021.04.05.10.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:42:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/msm: ratelimit GEM related WARN_ON()s
Date: Mon,  5 Apr 2021 10:45:24 -0700
Message-Id: <20210405174532.1441497-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If you mess something up, you don't really need to see the same warn on
splat 4000 times pumped out a slow debug UART port..

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 66 +++++++++++++++++------------------
 drivers/gpu/drm/msm/msm_gem.h | 19 ++++++----
 2 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4e91b095ab77..d5abe8aa9978 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -96,7 +96,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
@@ -180,7 +180,7 @@ struct page **msm_gem_get_pages(struct drm_gem_object *obj)
 
 	msm_gem_lock(obj);
 
-	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
+	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
 		msm_gem_unlock(obj);
 		return ERR_PTR(-EBUSY);
 	}
@@ -256,7 +256,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 		goto out;
 	}
 
-	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
+	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
 		msm_gem_unlock(obj);
 		return VM_FAULT_SIGBUS;
 	}
@@ -289,7 +289,7 @@ static uint64_t mmap_offset(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	int ret;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	/* Make it mmapable */
 	ret = drm_gem_create_mmap_offset(obj);
@@ -318,7 +318,7 @@ static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
@@ -337,7 +337,7 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
 		if (vma->aspace == aspace)
@@ -363,7 +363,7 @@ put_iova_spaces(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
 		if (vma->aspace) {
@@ -380,7 +380,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma, *tmp;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		del_vma(vma);
@@ -394,7 +394,7 @@ static int get_iova_locked(struct drm_gem_object *obj,
 	struct msm_gem_vma *vma;
 	int ret = 0;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	vma = lookup_vma(obj, aspace);
 
@@ -429,13 +429,13 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (msm_obj->flags & MSM_BO_MAP_PRIV)
 		prot |= IOMMU_PRIV;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
-	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
+	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
 		return -EBUSY;
 
 	vma = lookup_vma(obj, aspace);
-	if (WARN_ON(!vma))
+	if (GEM_WARN_ON(!vma))
 		return -EINVAL;
 
 	pages = get_pages(obj);
@@ -453,7 +453,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 	u64 local;
 	int ret;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	ret = get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
@@ -524,7 +524,7 @@ uint64_t msm_gem_iova(struct drm_gem_object *obj,
 	msm_gem_lock(obj);
 	vma = lookup_vma(obj, aspace);
 	msm_gem_unlock(obj);
-	WARN_ON(!vma);
+	GEM_WARN_ON(!vma);
 
 	return vma ? vma->iova : 0;
 }
@@ -537,11 +537,11 @@ void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
 {
 	struct msm_gem_vma *vma;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	vma = lookup_vma(obj, aspace);
 
-	if (!WARN_ON(!vma))
+	if (!GEM_WARN_ON(!vma))
 		msm_gem_unmap_vma(aspace, vma);
 }
 
@@ -593,12 +593,12 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int ret = 0;
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	if (obj->import_attach)
 		return ERR_PTR(-ENODEV);
 
-	if (WARN_ON(msm_obj->madv > madv)) {
+	if (GEM_WARN_ON(msm_obj->madv > madv)) {
 		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
 			msm_obj->madv, madv);
 		return ERR_PTR(-EBUSY);
@@ -664,8 +664,8 @@ void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	WARN_ON(!msm_gem_is_locked(obj));
-	WARN_ON(msm_obj->vmap_count < 1);
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(msm_obj->vmap_count < 1);
 
 	msm_obj->vmap_count--;
 }
@@ -707,8 +707,8 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	WARN_ON(!is_purgeable(msm_obj));
-	WARN_ON(obj->import_attach);
+	GEM_WARN_ON(!is_purgeable(msm_obj));
+	GEM_WARN_ON(obj->import_attach);
 
 	put_iova_spaces(obj);
 
@@ -739,9 +739,9 @@ void msm_gem_vunmap(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
-	if (!msm_obj->vaddr || WARN_ON(!is_vunmapable(msm_obj)))
+	if (!msm_obj->vaddr || GEM_WARN_ON(!is_vunmapable(msm_obj)))
 		return;
 
 	vunmap(msm_obj->vaddr);
@@ -789,9 +789,9 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
-	WARN_ON(!msm_gem_is_locked(obj));
-	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
-	WARN_ON(msm_obj->dontneed);
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
+	GEM_WARN_ON(msm_obj->dontneed);
 
 	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
@@ -806,7 +806,7 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	might_sleep();
-	WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	if (--msm_obj->active_count == 0) {
 		update_inactive(msm_obj);
@@ -818,7 +818,7 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
 
 	mutex_lock(&priv->mm_lock);
-	WARN_ON(msm_obj->active_count != 0);
+	GEM_WARN_ON(msm_obj->active_count != 0);
 
 	if (msm_obj->dontneed)
 		mark_unpurgable(msm_obj);
@@ -830,7 +830,7 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
 		mark_purgable(msm_obj);
 	} else {
-		WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
+		GEM_WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
 	}
 
@@ -1010,12 +1010,12 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	msm_gem_lock(obj);
 
 	/* object should not be on active list: */
-	WARN_ON(is_active(msm_obj));
+	GEM_WARN_ON(is_active(msm_obj));
 
 	put_iova_spaces(obj);
 
 	if (obj->import_attach) {
-		WARN_ON(msm_obj->vaddr);
+		GEM_WARN_ON(msm_obj->vaddr);
 
 		/* Don't drop the pages for imported dmabuf, as they are not
 		 * ours, just free the array we allocated:
@@ -1131,7 +1131,7 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	else if ((flags & (MSM_BO_STOLEN | MSM_BO_SCANOUT)) && priv->vram.size)
 		use_vram = true;
 
-	if (WARN_ON(use_vram && !priv->vram.size))
+	if (GEM_WARN_ON(use_vram && !priv->vram.size))
 		return ERR_PTR(-EINVAL);
 
 	/* Disallow zero sized objects as they make the underlying
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7c7d54bad189..917af526a5c5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -11,6 +11,11 @@
 #include <linux/dma-resv.h>
 #include "msm_drv.h"
 
+/* Make all GEM related WARN_ON()s ratelimited.. when things go wrong they
+ * tend to go wrong 1000s of times in a short timespan.
+ */
+#define GEM_WARN_ON(x)  WARN_RATELIMIT(x, "%s", __stringify(x))
+
 /* Additional internal-use only BO flags: */
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
 #define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
@@ -203,7 +208,7 @@ msm_gem_is_locked(struct drm_gem_object *obj)
 
 static inline bool is_active(struct msm_gem_object *msm_obj)
 {
-	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
+	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 	return msm_obj->active_count;
 }
 
@@ -221,7 +226,7 @@ static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 
 static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 {
-	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
+	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
@@ -229,12 +234,12 @@ static inline void mark_purgable(struct msm_gem_object *msm_obj)
 {
 	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+	GEM_WARN_ON(!mutex_is_locked(&priv->mm_lock));
 
 	if (is_unpurgable(msm_obj))
 		return;
 
-	if (WARN_ON(msm_obj->dontneed))
+	if (GEM_WARN_ON(msm_obj->dontneed))
 		return;
 
 	priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
@@ -245,16 +250,16 @@ static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
 {
 	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+	GEM_WARN_ON(!mutex_is_locked(&priv->mm_lock));
 
 	if (is_unpurgable(msm_obj))
 		return;
 
-	if (WARN_ON(!msm_obj->dontneed))
+	if (GEM_WARN_ON(!msm_obj->dontneed))
 		return;
 
 	priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
-	WARN_ON(priv->shrinkable_count < 0);
+	GEM_WARN_ON(priv->shrinkable_count < 0);
 	msm_obj->dontneed = false;
 }
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
