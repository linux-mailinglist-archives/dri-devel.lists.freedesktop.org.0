Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A88C096F2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806AD10E31E;
	Sat, 25 Oct 2025 16:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ILoUSIvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B89C10E31E;
 Sat, 25 Oct 2025 16:26:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0D1C661106;
 Sat, 25 Oct 2025 16:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1971C4CEFB;
 Sat, 25 Oct 2025 16:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409606;
 bh=0OZHReyP13vsx4ci+6B/OmcZCKP/5tUOKvKDRHGfo+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ILoUSIvyc2xBZnNhDRWvrmK78iTJVrol3s8XafbbSVUADbBW5N1s/WZkl+eZU/1CB
 6EW5SvCl0vp6M8dgS35oAZhN7cE5BKeCWwEJ5xXqD1LrZDCr7UMDr7xpRbyD/4zLQ1
 Zq2ld8J/nu590IUNhiYZWgNiBpq3xMsCt4lWiwZy0/3VC1nW7FUa2+SFe0uPHS89Yd
 L2sQ9OPKnRBTGg9y+AM9ksfL8zfTMhxHDCanytKLKjIHrJxZZyUdGv0fnSMzVxca78
 GxzZWcZZQRjCgPLpKUnEAoBU3bygEx6qMMW7r9Ljp0xnak5opU0MRZLxTQBa5cphyX
 GOISd/HcJDLSg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Sasha Levin <sashal@kernel.org>,
 lumag@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/msm: Fix 32b size truncation
Date: Sat, 25 Oct 2025 12:00:20 -0400
Message-ID: <20251025160905.3857885-389-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Rob Clark <robin.clark@oss.qualcomm.com>

[ Upstream commit 6d6a29a19b232e29b61a14d58b71fefc2e003fa4 ]

Somehow we never noticed this when arm64 became a thing, many years ago.

v2: also fix npages

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Connor Abbott <cwabbott0@gmail.com>
Patchwork: https://patchwork.freedesktop.org/patch/669785/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Prevents 32-bit truncation of buffer sizes passed from userspace and
    via dma-buf import on 64-bit systems. The MSM UAPI uses a 64-bit
    size field (`__u64 size`) for GEM allocation requests
    (include/uapi/drm/msm_drm.h:168), but prior code funneled this
    through `uint32_t`, silently truncating >4GiB sizes.
  - This can lead to incorrect object sizing, wrong page counts and
    scatterlist handling, and partial mappings/imports on arm64.
    Symptoms range from allocation failures to subtle correctness bugs
    when buffers exceed 4GiB.

- Key changes (type-widening to eliminate truncation)
  - Function parameters and locals changed from 32-bit to native
    `size_t`:
    - `msm_gem_new_handle()` size argument widened to `size_t`
      (drivers/gpu/drm/msm/msm_gem.h:286,
      drivers/gpu/drm/msm/msm_gem.c:1150). This directly fixes the UAPI
      path where `__u64 size` from `DRM_IOCTL_MSM_GEM_NEW`
      (drivers/gpu/drm/msm/msm_drv.c:344,
      include/uapi/drm/msm_drm.h:168) was previously implicitly
      truncated to 32-bit.
    - `msm_gem_new()` size argument widened to `size_t`
      (drivers/gpu/drm/msm/msm_gem.h:288,
      drivers/gpu/drm/msm/msm_gem.c:1220). Ensures internal object init
      uses full 64-bit size.
    - `msm_gem_kernel_new()` size argument widened to `size_t`
      (drivers/gpu/drm/msm/msm_gem.h:289,
      drivers/gpu/drm/msm/msm_gem.c:1356). Fixes internal kernel
      allocations exceeding 4GiB.
    - `npages` variables derived from object sizes converted to
      `size_t`:
      - `get_pages()` uses `size_t npages = obj->size >> PAGE_SHIFT;`
        (drivers/gpu/drm/msm/msm_gem.c:188) instead of `int npages`.
      - `msm_gem_import()` uses `size_t size, npages;`
        (drivers/gpu/drm/msm/msm_gem.c:1300), preventing truncation when
        importing large dma-bufs.
      - `msm_gem_prime_get_sg_table()` uses `size_t npages = obj->size
        >> PAGE_SHIFT;` (drivers/gpu/drm/msm/msm_gem_prime.c:15).
  - Removes an unused `size` parameter from the internal
    `msm_gem_new_impl()` to avoid perpetuating 32-bit type usage
    (drivers/gpu/drm/msm/msm_gem.c:1217, 1267, 1312). This is an
    internal/static helper; the change is mechanical and risk-free.

- Why this meets stable rules
  - Important bugfix: Correctly honors 64-bit sizes throughout the MSM
    GEM allocation and import paths. Without it, large buffers on 64-bit
    systems are mishandled.
  - Minimal and contained: All changes are confined to the MSM DRM
    driver and its internal header. No UAPI changes, no architectural
    refactors.
  - Low regression risk:
    - On 32-bit kernels, `size_t` remains 32-bit, so behavior is
      unchanged.
    - The widened types align driver internals with existing DRM core
      and UAPI expectations. Callers within the MSM driver already pass
      native-sized values (e.g., a6xx GMU alloc uses `size_t size`;
      drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1338).
    - Passing `size_t npages` into helpers like
      `drm_prime_pages_to_sg()` (which take an `unsigned int`) is
      harmless in practice; page counts at which truncation would occur
      are not realistic.
  - No new features or behavioral changes beyond fixing size handling.
    No locking, lifetime, or resource management changes.

- Concrete impact examples
  - Userspace `DRM_IOCTL_MSM_GEM_NEW` submits `__u64 size`; now
    `msm_ioctl_gem_new()` forwards the size without truncation to
    `msm_gem_new_handle()` and `msm_gem_new()`
    (drivers/gpu/drm/msm/msm_drv.c:344,
    drivers/gpu/drm/msm/msm_gem.c:1150, 1220).
  - Import path: `msm_gem_import()` correctly derives `size` from
    `dmabuf->size` as `size_t` and computes `npages` as `size_t` before
    allocating the page array and initializing the object
    (drivers/gpu/drm/msm/msm_gem.c:1300–1320). Previously, `uint32_t
    size` and `int npages` could undercount for large imports.

Given this is a clear, localized bugfix preventing real truncation on
64-bit systems with negligible regression risk, this commit is a good
candidate for stable backport.

 drivers/gpu/drm/msm/msm_gem.c       | 21 ++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       |  6 +++---
 drivers/gpu/drm/msm/msm_gem_prime.c |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e7631f4ef5309..07d8cdd6bb2ee 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -191,7 +191,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
 		struct page **p;
-		int npages = obj->size >> PAGE_SHIFT;
+		size_t npages = obj->size >> PAGE_SHIFT;
 
 		p = drm_gem_get_pages(obj);
 
@@ -1148,7 +1148,7 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 /* convenience method to construct a GEM buffer object, and userspace handle */
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle,
+		size_t size, uint32_t flags, uint32_t *handle,
 		char *name)
 {
 	struct drm_gem_object *obj;
@@ -1214,9 +1214,8 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.vm_ops = &vm_ops,
 };
 
-static int msm_gem_new_impl(struct drm_device *dev,
-		uint32_t size, uint32_t flags,
-		struct drm_gem_object **obj)
+static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
+			    struct drm_gem_object **obj)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1250,7 +1249,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	return 0;
 }
 
-struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32_t flags)
+struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1265,7 +1264,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
-	ret = msm_gem_new_impl(dev, size, flags, &obj);
+	ret = msm_gem_new_impl(dev, flags, &obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1305,12 +1304,12 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
-	uint32_t size;
-	int ret, npages;
+	size_t size, npages;
+	int ret;
 
 	size = PAGE_ALIGN(dmabuf->size);
 
-	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
+	ret = msm_gem_new_impl(dev, MSM_BO_WC, &obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1353,7 +1352,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 751c3b4965bcd..a4cf31853c500 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -297,10 +297,10 @@ bool msm_gem_active(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
+		size_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+		size_t size, uint32_t flags);
+void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova);
 void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index c0a33ac839cb6..036d34c674d9a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -15,7 +15,7 @@
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	int npages = obj->size >> PAGE_SHIFT;
+	size_t npages = obj->size >> PAGE_SHIFT;
 
 	if (msm_obj->flags & MSM_BO_NO_SHARE)
 		return ERR_PTR(-EINVAL);
-- 
2.51.0

