Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A819A917F3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963DC10EA72;
	Thu, 17 Apr 2025 09:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OOfZW4j3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C988510EA72
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744882369;
 bh=6R54jRkVbnIuUBhh+YWnQ0BzT9a7r2MYtuyairVrAf8=;
 h=From:To:Cc:Subject:Date:From;
 b=OOfZW4j3g5RuBXGtg48MCB+BeH1xTpvVOHOy20iWjHm1Bgak9Mty2Sdm8/xXKii59
 YEHjZnN74OHXkJYhajbxgx42Q+V9KDBUShAXe1nU3FXQmWNGPkk9973l1TMcFq0fTY
 ulsjNgIYsLDWbDUIKkP4kMC5uVUBJLjgVbjL/n8nfwPw/DoYAtfFAhjXGyGRG5nbtu
 /t+A3p9gKdVBP4/129ym3VCqfrC/OPqyFEkQaJiJSKAkO43gZw2otYvqPTN6nIRUce
 t0q7auHAvOCMS1s5kF3R3WinJkTkDq4ZWYTQG8JP74f5lpQynqqAVfvvjtJuALBEpa
 cewSl+UbALlgw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 25A2B17E00A3;
 Thu, 17 Apr 2025 11:32:49 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2] drm/panthor: Don't create a file offset for NO_MMAP BOs
Date: Thu, 17 Apr 2025 11:32:47 +0200
Message-ID: <20250417093247.3455096-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now the DRM_PANTHOR_BO_NO_MMAP flag is ignored by
panthor_ioctl_bo_mmap_offset(), meaning BOs with this flag set can
have a file offset but can't be mapped anyway, because
panthor_gem_mmap() will filter them out.

If we error out at mmap_offset creation time, we can get rid of
panthor_gem_mmap() and call drm_gem_shmem_object_mmap directly, and
we get rid of this inconsistency of having an mmap offset for a
BO that can never be mmap-ed.

Changes in v2:
- Get rid of panthor_gem_mmap()
- Get rid of the Fixes tag and adjust the commit message accordingly
- Return ENOPERM instead of EINVAL

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c |  5 +++++
 drivers/gpu/drm/panthor/panthor_gem.c | 13 +------------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..7cd131af340d 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -940,6 +940,7 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
 					struct drm_file *file)
 {
 	struct drm_panthor_bo_mmap_offset *args = data;
+	struct panthor_gem_object *bo;
 	struct drm_gem_object *obj;
 	int ret;
 
@@ -950,6 +951,10 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
 	if (!obj)
 		return -ENOENT;
 
+	bo = to_panthor_bo(obj);
+	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
+		return -EPERM;
+
 	ret = drm_gem_create_mmap_offset(obj);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index fd014ccc3bfc..22d78cef9c66 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -129,17 +129,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	return ERR_PTR(ret);
 }
 
-static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
-{
-	struct panthor_gem_object *bo = to_panthor_bo(obj);
-
-	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
-	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
-		return -EINVAL;
-
-	return drm_gem_shmem_object_mmap(obj, vma);
-}
-
 static struct dma_buf *
 panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
@@ -169,7 +158,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = panthor_gem_mmap,
+	.mmap = drm_gem_shmem_object_mmap,
 	.status = panthor_gem_status,
 	.export = panthor_gem_prime_export,
 	.vm_ops = &drm_gem_shmem_vm_ops,
-- 
2.49.0

