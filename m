Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C449470E8A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 00:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CD810E58B;
	Fri, 10 Dec 2021 23:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1D510E574;
 Fri, 10 Dec 2021 23:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639178650; x=1670714650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SOPMVTs5Hlkg0tFd/BAzmjmZm2U52sWmpbiZ1hRSr8E=;
 b=e54Fwbi9rrYa06IVSk4Q96XJNe1bVX5mZzBIerjg29mDfatEQdWOz9/4
 mHKsoOW4OXCXKlhlUselFDwknN0JhOtZyRBoPu3f8Nye5JfntddJQZuKD
 F2hMr/xBFptZ9K78EdTINHMFkS1u9MXxp6KhpspkZ/A843e0MfxilDQZs
 9YDgk47MzQxdF+V0bum0qBHV1velHMztaoZkd2Sp/fQ7m6A6TUlUwXi8r
 ELLI7GrLFIMDLDQ+4tboEkT4nOy+W6k2j84sg1sFlZusLN1xcxpei4mhz
 0yz3uago8Fj3vHSxQoBTJ17X5i1V726Uxv5Ek1IhfXyN+kHONOK2a1sXh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237212362"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="237212362"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 15:24:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="463861437"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 15:24:09 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/7] drm/i915: Replace kmap() with kmap_local_page()
Date: Fri, 10 Dec 2021 15:23:58 -0800
Message-Id: <20211210232404.4098157-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210232404.4098157-1-ira.weiny@intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 4 ++--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       | 4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c              | 4 ++--
 drivers/gpu/drm/i915/i915_gem.c                    | 8 ++++----
 drivers/gpu/drm/i915/i915_gpu_error.c              | 4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index d77da59fae04..fa8b820e14aa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -597,9 +597,9 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
 		if (err < 0)
 			goto fail;
 
-		vaddr = kmap(page);
+		vaddr = kmap_local_page(page);
 		memcpy(vaddr, data, len);
-		kunmap(page);
+		kunmap_local(vaddr);
 
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
index 0683b27a3890..cba4f210d093 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -104,7 +104,7 @@ static int __shmem_rw(struct file *file, loff_t off,
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		vaddr = kmap(page);
+		vaddr = kmap_local_page(page);
 		if (write) {
 			memcpy(vaddr + offset_in_page(off), ptr, this);
 			set_page_dirty(page);
@@ -112,7 +112,7 @@ static int __shmem_rw(struct file *file, loff_t off,
 			memcpy(ptr, vaddr + offset_in_page(off), this);
 		}
 		mark_page_accessed(page);
-		kunmap(page);
+		kunmap_local(vaddr);
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

