Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703FD47CCD3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 07:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD1710F0C6;
	Wed, 22 Dec 2021 06:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2469A10F0C6;
 Wed, 22 Dec 2021 06:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640153343; x=1671689343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckaMJ+H0/TF9SKL+CkhWzBkJvEUKaEsg9J96VhyiPio=;
 b=JKzFzzQcadx5fZAzuIL6w1+uqhxGc2gHNJFIWMWUCPmMMx9n1bUL6QQn
 fTtUzjv647Xrrsmpv014iVFp7uEvgo2wcw7aniHOzy/3R97AwxmpyMuBm
 9peyiNGQ7d0Ksh/vqWgZjFmCZhLe17+X11aK10UsHHurokX4ILDWfo+62
 FEpylndQPSkpascus1WBx0vdRP3TmkQab3H7tpCtIN91YCFqfEShDpHZZ
 DU+MsNK6Re/P5qF15Ho+cE6mchL4/KnNWvB0Jq7H8zVuNeRRWk1moTp+9
 0PqLsYofhsX5tZ5ouTgAdwp1QsSJCfvroElwQvE0aTOjqEh2pZfkG8Z3f A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240359189"
X-IronPort-AV: E=Sophos;i="5.88,225,1635231600"; d="scan'208";a="240359189"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 22:09:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,225,1635231600"; d="scan'208";a="521548248"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 22:09:00 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH V2] drm/i915: Replace kmap() with kmap_local_page()
Date: Tue, 21 Dec 2021 22:08:57 -0800
Message-Id: <20211222060857.21791-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210232404.4098157-2-ira.weiny@intel.com>
References: <20211210232404.4098157-2-ira.weiny@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

kmap() is being deprecated and these usages are all local to the thread
so there is no reason kmap_local_page() can't be used.

Replace kmap() calls with kmap_local_page().

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
NOTE: I'm sending as a follow on to the V1 patch.  Please let me know if you
prefer the entire series instead.

Changes for V2:
	From Christoph Helwig
	Prefer the use of memcpy_*_page() where appropriate.
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 6 ++----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       | 4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c              | 7 ++-----
 drivers/gpu/drm/i915/i915_gem.c                    | 8 ++++----
 drivers/gpu/drm/i915/i915_gpu_error.c              | 4 ++--
 6 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index d77da59fae04..842e089aaaa5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -589,7 +589,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
 	do {
 		unsigned int len = min_t(typeof(size), size, PAGE_SIZE);
 		struct page *page;
-		void *pgdata, *vaddr;
+		void *pgdata;
 
 		err = pagecache_write_begin(file, file->f_mapping,
 					    offset, len, 0,
@@ -597,9 +597,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
 		if (err < 0)
 			goto fail;
 
-		vaddr = kmap(page);
-		memcpy(vaddr, data, len);
-		kunmap(page);
+		memcpy_to_page(page, 0, data, len);
 
 		err = pagecache_write_end(file, file->f_mapping,
 					  offset, len, len,
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 6d30cdfa80f3..e59e1725e29d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -144,7 +144,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
 
 	p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
-	cpu = kmap(p) + offset_in_page(offset);
+	cpu = kmap_local_page(p) + offset_in_page(offset);
 	drm_clflush_virt_range(cpu, sizeof(*cpu));
 	if (*cpu != (u32)page) {
 		pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
@@ -162,7 +162,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	}
 	*cpu = 0;
 	drm_clflush_virt_range(cpu, sizeof(*cpu));
-	kunmap(p);
+	kunmap_local(cpu);
 
 out:
 	__i915_vma_put(vma);
@@ -237,7 +237,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
 
 		p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
-		cpu = kmap(p) + offset_in_page(offset);
+		cpu = kmap_local_page(p) + offset_in_page(offset);
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
 		if (*cpu != (u32)page) {
 			pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
@@ -255,7 +255,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		}
 		*cpu = 0;
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
-		kunmap(p);
+		kunmap_local(cpu);
 		if (err)
 			return err;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index f8948de72036..743a414f86f3 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -743,7 +743,7 @@ static void swizzle_page(struct page *page)
 	char *vaddr;
 	int i;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	for (i = 0; i < PAGE_SIZE; i += 128) {
 		memcpy(temp, &vaddr[i], 64);
@@ -751,7 +751,7 @@ static void swizzle_page(struct page *page)
 		memcpy(&vaddr[i + 64], temp, 64);
 	}
 
-	kunmap(page);
+	kunmap_local(vaddr);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 0683b27a3890..d47f262d2f07 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -97,22 +97,19 @@ static int __shmem_rw(struct file *file, loff_t off,
 		unsigned int this =
 			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
 		struct page *page;
-		void *vaddr;
 
 		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
 						   GFP_KERNEL);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		vaddr = kmap(page);
 		if (write) {
-			memcpy(vaddr + offset_in_page(off), ptr, this);
+			memcpy_to_page(page, offset_in_page(off), ptr, this);
 			set_page_dirty(page);
 		} else {
-			memcpy(ptr, vaddr + offset_in_page(off), this);
+			memcpy_from_page(ptr, page, offset_in_page(off), this);
 		}
 		mark_page_accessed(page);
-		kunmap(page);
 		put_page(page);
 
 		len -= this;
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 981e383d1a5d..af5adb187ca4 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -196,14 +196,14 @@ shmem_pread(struct page *page, int offset, int len, char __user *user_data,
 	char *vaddr;
 	int ret;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	if (needs_clflush)
 		drm_clflush_virt_range(vaddr + offset, len);
 
 	ret = __copy_to_user(user_data, vaddr + offset, len);
 
-	kunmap(page);
+	kunmap_local(vaddr);
 
 	return ret ? -EFAULT : 0;
 }
@@ -618,7 +618,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
 	char *vaddr;
 	int ret;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	if (needs_clflush_before)
 		drm_clflush_virt_range(vaddr + offset, len);
@@ -627,7 +627,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
 	if (!ret && needs_clflush_after)
 		drm_clflush_virt_range(vaddr + offset, len);
 
-	kunmap(page);
+	kunmap_local(vaddr);
 
 	return ret ? -EFAULT : 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 2a2d7643b551..c526d7892081 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1094,9 +1094,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 
 			drm_clflush_pages(&page, 1);
 
-			s = kmap(page);
+			s = kmap_local_page(page);
 			ret = compress_page(compress, s, dst, false);
-			kunmap(page);
+			kunmap_local(s);
 
 			drm_clflush_pages(&page, 1);
 
-- 
2.31.1

