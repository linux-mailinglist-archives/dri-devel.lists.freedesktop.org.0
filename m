Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D63292FAD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0136EA84;
	Mon, 19 Oct 2020 20:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCE56EA84;
 Mon, 19 Oct 2020 20:45:31 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o3so670321pgr.11;
 Mon, 19 Oct 2020 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4MJy1bUVBg4Uoq6rWvQpmAg9Tlj+L8XO2hEQrVc/oM=;
 b=G0ZnwW1sjoIjGVTL7cNoShRRn1RtiWlnzQJ5p1b4SbcfYd/+30XZKtD08OFJrRe8xS
 tpr5Ufz5ICTvTAxh82kWnsALUd2ismmc5ykNjDQcLh7luo+QBhEwWrkh3UCH4/ibSP9l
 2GDXHIsH40tZruSN1pQhRYg424gHNoQBDvMt+AtDus2NMw3icPI27gPsRrru5NgQ3257
 78rtWkKXJ2DQ6sasTJx4tUtmP9lJd5bpu7jgg23gKImBf3pMSc9ky5MtnsugrRMs4KIT
 kfGtiCdgxMSGceyO/ShIkeIkQFq+EiE1CIr2DmXcCQ8YlVct87c1Bfd+YTZvWTxf8bHq
 Eiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4MJy1bUVBg4Uoq6rWvQpmAg9Tlj+L8XO2hEQrVc/oM=;
 b=uXc3YBNz/5kRFEdJ7NArwf0cJ34TuwrVXDdcMxPNLBkl6ynbRG0mooloCjglstAPOw
 ga5gk/gBU+6LluY7JyP2uKyI1NANp/o+DO5tpkoL0CbsaKSbpK6aiMkbAXaA+EOJSqBY
 ctIq94bsBj1XQOtEKsaCuNflyv3SJumqpDEJW+p8Cma11gqIeFCttoXrpoB1PEpYx0i0
 OI/2mA3u3NvRyGvrpH8JO420JyH8wfKB9XP+lMCu7pMW0kh7/yRu57jPDVaBLT6/YnUv
 C8bYeZ3GmTbYY2cHhIGo67UBKSZr67EFlJwHdnjLHMGzCxugtEY+EoOGzgFAOiCGfCTI
 mI4g==
X-Gm-Message-State: AOAM532Frl9+/kjzgFRVpPjJgJQ5COy4gHd2hlzWtCzK+F6hWytnUAO9
 9EKUUQv3hqGAYcDh4bW5MULZYKgnMr5WPA==
X-Google-Smtp-Source: ABdhPJwLrstK2u0urDtxmJrlsy4AQgWdWsVWyp8Wn9DKSOzTpHNJjHoSe52rHU/IxlfQa5Vf56LfPw==
X-Received: by 2002:a62:e915:0:b029:156:551a:c948 with SMTP id
 j21-20020a62e9150000b0290156551ac948mr1377979pfh.50.1603140330152; 
 Mon, 19 Oct 2020 13:45:30 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t15sm330914pjy.33.2020.10.19.13.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/23] drm/msm/gem: Add obj->lock wrappers
Date: Mon, 19 Oct 2020 13:46:03 -0700
Message-Id: <20201019204636.139997-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will make it easier to transition over to obj->resv locking for
everything that is per-bo locking.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 99 ++++++++++++++++-------------------
 drivers/gpu/drm/msm/msm_gem.h | 28 ++++++++++
 2 files changed, 74 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 14e14caf90f9..afef9c6b1a1c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -178,15 +178,15 @@ struct page **msm_gem_get_pages(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct page **p;
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
-		mutex_unlock(&msm_obj->lock);
+		msm_gem_unlock(obj);
 		return ERR_PTR(-EBUSY);
 	}
 
 	p = get_pages(obj);
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 	return p;
 }
 
@@ -252,14 +252,14 @@ vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	 * vm_ops.open/drm_gem_mmap_obj and close get and put
 	 * a reference on obj. So, we dont need to hold one here.
 	 */
-	err = mutex_lock_interruptible(&msm_obj->lock);
+	err = msm_gem_lock_interruptible(obj);
 	if (err) {
 		ret = VM_FAULT_NOPAGE;
 		goto out;
 	}
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
-		mutex_unlock(&msm_obj->lock);
+		msm_gem_unlock(obj);
 		return VM_FAULT_SIGBUS;
 	}
 
@@ -280,7 +280,7 @@ vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 
 	ret = vmf_insert_mixed(vma, vmf->address, __pfn_to_pfn_t(pfn, PFN_DEV));
 out_unlock:
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 out:
 	return ret;
 }
@@ -289,10 +289,9 @@ vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 static uint64_t mmap_offset(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int ret;
 
-	WARN_ON(!mutex_is_locked(&msm_obj->lock));
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	/* Make it mmapable */
 	ret = drm_gem_create_mmap_offset(obj);
@@ -308,11 +307,10 @@ static uint64_t mmap_offset(struct drm_gem_object *obj)
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 {
 	uint64_t offset;
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 	offset = mmap_offset(obj);
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 	return offset;
 }
 
@@ -322,7 +320,7 @@ static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
-	WARN_ON(!mutex_is_locked(&msm_obj->lock));
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
@@ -341,7 +339,7 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
-	WARN_ON(!mutex_is_locked(&msm_obj->lock));
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
 		if (vma->aspace == aspace)
@@ -360,14 +358,14 @@ static void del_vma(struct msm_gem_vma *vma)
 	kfree(vma);
 }
 
-/* Called with msm_obj->lock locked */
+/* Called with msm_obj locked */
 static void
 put_iova(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma, *tmp;
 
-	WARN_ON(!mutex_is_locked(&msm_obj->lock));
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->aspace) {
@@ -382,11 +380,10 @@ static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 	int ret = 0;
 
-	WARN_ON(!mutex_is_locked(&msm_obj->lock));
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	vma = lookup_vma(obj, aspace);
 
@@ -421,7 +418,7 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (msm_obj->flags & MSM_BO_MAP_PRIV)
 		prot |= IOMMU_PRIV;
 
-	WARN_ON(!mutex_is_locked(&msm_obj->lock));
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
 		return -EBUSY;
@@ -446,11 +443,10 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	u64 local;
 	int ret;
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 
 	ret = msm_gem_get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
@@ -461,7 +457,7 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 	if (!ret)
 		*iova = local;
 
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 	return ret;
 }
 
@@ -479,12 +475,11 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int ret;
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 	ret = msm_gem_get_iova_locked(obj, aspace, iova, 0, U64_MAX);
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 
 	return ret;
 }
@@ -495,12 +490,11 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 uint64_t msm_gem_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 	vma = lookup_vma(obj, aspace);
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 	WARN_ON(!vma);
 
 	return vma ? vma->iova : 0;
@@ -514,16 +508,15 @@ uint64_t msm_gem_iova(struct drm_gem_object *obj,
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 	vma = lookup_vma(obj, aspace);
 
 	if (!WARN_ON(!vma))
 		msm_gem_unmap_vma(aspace, vma);
 
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 }
 
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
@@ -564,20 +557,20 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	if (obj->import_attach)
 		return ERR_PTR(-ENODEV);
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 
 	if (WARN_ON(msm_obj->madv > madv)) {
 		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
 			msm_obj->madv, madv);
-		mutex_unlock(&msm_obj->lock);
+		msm_gem_unlock(obj);
 		return ERR_PTR(-EBUSY);
 	}
 
 	/* increment vmap_count *before* vmap() call, so shrinker can
-	 * check vmap_count (is_vunmapable()) outside of msm_obj->lock.
+	 * check vmap_count (is_vunmapable()) outside of msm_obj lock.
 	 * This guarantees that we won't try to msm_gem_vunmap() this
 	 * same object from within the vmap() call (while we already
-	 * hold msm_obj->lock)
+	 * hold msm_obj lock)
 	 */
 	msm_obj->vmap_count++;
 
@@ -595,12 +588,12 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 		}
 	}
 
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 	return msm_obj->vaddr;
 
 fail:
 	msm_obj->vmap_count--;
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 	return ERR_PTR(ret);
 }
 
@@ -624,10 +617,10 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 	WARN_ON(msm_obj->vmap_count < 1);
 	msm_obj->vmap_count--;
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 }
 
 /* Update madvise status, returns true if not purged, else
@@ -637,7 +630,7 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 
 	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
 
@@ -646,7 +639,7 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 
 	madv = msm_obj->madv;
 
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 
 	return (madv != __MSM_MADV_PURGED);
 }
@@ -683,14 +676,14 @@ void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass)
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping,
 			0, (loff_t)-1);
 
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 }
 
 static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	WARN_ON(!mutex_is_locked(&msm_obj->lock));
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	if (!msm_obj->vaddr || WARN_ON(!is_vunmapable(msm_obj)))
 		return;
@@ -705,7 +698,7 @@ void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass)
 
 	mutex_lock_nested(&msm_obj->lock, subclass);
 	msm_gem_vunmap_locked(obj);
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 }
 
 /* must be called before _move_to_active().. */
@@ -816,7 +809,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 
 	switch (msm_obj->madv) {
 	case __MSM_MADV_PURGED:
@@ -884,7 +877,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 		describe_fence(fence, "Exclusive", m);
 	rcu_read_unlock();
 
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 }
 
 void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
@@ -929,7 +922,7 @@ static void free_object(struct msm_gem_object *msm_obj)
 
 	list_del(&msm_obj->mm_list);
 
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 
 	put_iova(obj);
 
@@ -950,7 +943,7 @@ static void free_object(struct msm_gem_object *msm_obj)
 
 	drm_gem_object_release(obj);
 
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 	kfree(msm_obj);
 }
 
@@ -1070,10 +1063,10 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 		struct msm_gem_vma *vma;
 		struct page **pages;
 
-		mutex_lock(&msm_obj->lock);
+		msm_gem_lock(obj);
 
 		vma = add_vma(obj, NULL);
-		mutex_unlock(&msm_obj->lock);
+		msm_gem_unlock(obj);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);
 			goto fail;
@@ -1157,22 +1150,22 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	npages = size / PAGE_SIZE;
 
 	msm_obj = to_msm_bo(obj);
-	mutex_lock(&msm_obj->lock);
+	msm_gem_lock(obj);
 	msm_obj->sgt = sgt;
 	msm_obj->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
 	if (!msm_obj->pages) {
-		mutex_unlock(&msm_obj->lock);
+		msm_gem_unlock(obj);
 		ret = -ENOMEM;
 		goto fail;
 	}
 
 	ret = drm_prime_sg_to_page_addr_arrays(sgt, msm_obj->pages, NULL, npages);
 	if (ret) {
-		mutex_unlock(&msm_obj->lock);
+		msm_gem_unlock(obj);
 		goto fail;
 	}
 
-	mutex_unlock(&msm_obj->lock);
+	msm_gem_unlock(obj);
 
 	mutex_lock(&dev->struct_mutex);
 	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a1bf741b9b89..f6482154e8bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -93,6 +93,34 @@ struct msm_gem_object {
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
+static inline void
+msm_gem_lock(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	mutex_lock(&msm_obj->lock);
+}
+
+static inline int
+msm_gem_lock_interruptible(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	return mutex_lock_interruptible(&msm_obj->lock);
+}
+
+static inline void
+msm_gem_unlock(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	mutex_unlock(&msm_obj->lock);
+}
+
+static inline bool
+msm_gem_is_locked(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	return mutex_is_locked(&msm_obj->lock);
+}
+
 static inline bool is_active(struct msm_gem_object *msm_obj)
 {
 	return atomic_read(&msm_obj->active_count);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
