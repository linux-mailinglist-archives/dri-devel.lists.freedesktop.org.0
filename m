Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479A990ECC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 21:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02FD10EAAA;
	Fri,  4 Oct 2024 19:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="nmKW5i2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com
 [91.218.175.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9D510EAA9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 19:42:34 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1728070952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTAxN9/zmMnDPsplxNnmT42fuUHuWnOXQlHSEscsWkI=;
 b=nmKW5i2D+P1qcdVW0y93755NHYZ0TDQmGCCwtOGCP6ESI3Wy2aEpLk4XSDjlF73K0FfYBw
 NIiIxftpUyMFEYnAbYEdzHUQnwNhqDF33qFstV/BWkAuMdnjzddMoTy8QELroqIgGV/8az
 opv34krwACamJUI9A0eecsc/AbmERSw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 1/3] drm/etnaviv: Track GPU VA size separately
Date: Sat,  5 Oct 2024 03:42:05 +0800
Message-Id: <20241004194207.1013744-2-sui.jingfeng@linux.dev>
In-Reply-To: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Etnaviv assumes that GPU page size is 4KiB, yet on some systems, the CPU
page size is 16KiB. The size of etnaviv buffer objects will be aligned
to CPU page size on kernel side, however, userspace still assumes the
page size is 4KiB and doing allocation with 4KiB page as unit. This
results in userspace allocated GPU virtual address range collision and
therefore unable to be inserted to the specified hole exactly.

The root cause is that kernel side BO takes up bigger address space than
userspace assumes when the size of it is not CPU page size aligned. To
Preserve GPU VA continuous as much as possible, track the size that
userspace/GPU think of it is.

Yes, we still need to overallocate to suit the CPU, but there is no need
to waste GPU VA space anymore.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 8 +++++---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 8 ++++----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 5c0c9d4e3be1..943fc20093e6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -543,7 +543,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.vm_ops = &vm_ops,
 };
 
-static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
+static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
 	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
 {
 	struct etnaviv_gem_object *etnaviv_obj;
@@ -570,6 +570,7 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
 	if (!etnaviv_obj)
 		return -ENOMEM;
 
+	etnaviv_obj->user_size = size;
 	etnaviv_obj->flags = flags;
 	etnaviv_obj->ops = ops;
 
@@ -588,11 +589,12 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 {
 	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct drm_gem_object *obj = NULL;
+	unsigned int user_size = size;
 	int ret;
 
 	size = PAGE_ALIGN(size);
 
-	ret = etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops, &obj);
+	ret = etnaviv_gem_new_impl(dev, user_size, flags, &etnaviv_gem_shmem_ops, &obj);
 	if (ret)
 		goto fail;
 
@@ -627,7 +629,7 @@ int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
 	struct drm_gem_object *obj;
 	int ret;
 
-	ret = etnaviv_gem_new_impl(dev, flags, ops, &obj);
+	ret = etnaviv_gem_new_impl(dev, size, flags, ops, &obj);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index a42d260cac2c..c6e27b9abb0c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -36,6 +36,7 @@ struct etnaviv_gem_object {
 	const struct etnaviv_gem_ops *ops;
 	struct mutex lock;
 
+	u32 user_size;
 	u32 flags;
 
 	struct list_head gem_node;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 1661d589bf3e..6fbc62772d85 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -281,6 +281,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 {
 	struct sg_table *sgt = etnaviv_obj->sgt;
 	struct drm_mm_node *node;
+	unsigned int user_size;
 	int ret;
 
 	lockdep_assert_held(&etnaviv_obj->lock);
@@ -303,13 +304,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 	}
 
 	node = &mapping->vram_node;
+	user_size = etnaviv_obj->user_size;
 
 	if (va)
-		ret = etnaviv_iommu_insert_exact(context, node,
-						 etnaviv_obj->base.size, va);
+		ret = etnaviv_iommu_insert_exact(context, node, user_size, va);
 	else
-		ret = etnaviv_iommu_find_iova(context, node,
-					      etnaviv_obj->base.size);
+		ret = etnaviv_iommu_find_iova(context, node, user_size);
 	if (ret < 0)
 		goto unlock;
 
-- 
2.34.1

