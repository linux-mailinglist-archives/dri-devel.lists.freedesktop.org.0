Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FECA95E33B
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 14:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD6E10E0CE;
	Sun, 25 Aug 2024 12:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="HlaRxmPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C3010E0B8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 12:15:03 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1724588101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KYBUuOZ77RsbonBNPjWaQa/LDzXOSCA+09B7u42eC7s=;
 b=HlaRxmPnRISY7Zfc3te2rd46fklNc828HXME+YpMd1Xjb6mYXl8Rwz/MgAY2wzZzviIH2u
 VHtN1Zf9DZP9TQi8QRRTfRk/oe3G47dVU2C4sVDSsX/SgqWVmTY+cr+pxoimQq6Aj+QipW
 I90Ff3nmsnTg5/iWseLsqY7eVwVQgK4=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/etnaviv: Fix missing mutex_destroy()
Date: Sun, 25 Aug 2024 20:14:52 +0800
Message-Id: <20240825121452.363342-1-sui.jingfeng@linux.dev>
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

Currently, the calling of mutex_destroy() is ignored on error handling
code path. It is safe for now, since mutex_destroy() actually does
nothing in non-debug builds. But the mutex_destroy() is used to mark
the mutex uninitialized on debug builds, and any subsequent use of the
mutex is forbidden.

It also could lead to problems if mutex_destroy() gets extended, add
missing mutex_destroy() to eliminate potential concerns.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 3 +++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c    | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c    | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c    | 5 +++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c    | 2 +-
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
index 721d633aece9..1edc02022be4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
@@ -79,6 +79,9 @@ void etnaviv_cmdbuf_suballoc_destroy(struct etnaviv_cmdbuf_suballoc *suballoc)
 {
 	dma_free_wc(suballoc->dev, SUBALLOC_SIZE, suballoc->vaddr,
 		    suballoc->paddr);
+
+	mutex_destroy(&suballoc->lock);
+
 	kfree(suballoc);
 }
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..7844cd961a29 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -564,6 +564,7 @@ static int etnaviv_bind(struct device *dev)
 out_destroy_suballoc:
 	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
 out_free_priv:
+	mutex_destroy(&priv->gem_lock);
 	kfree(priv);
 out_put:
 	drm_dev_put(drm);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index fe665ca20c02..b68e3b235a7d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -515,6 +515,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 	etnaviv_obj->ops->release(etnaviv_obj);
 	drm_gem_object_release(obj);
 
+	mutex_destroy(&etnaviv_obj->lock);
 	kfree(etnaviv_obj);
 }
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index af52922ff494..d6acc4c68102 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1929,8 +1929,13 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 
 static void etnaviv_gpu_platform_remove(struct platform_device *pdev)
 {
+	struct etnaviv_gpu *gpu = dev_get_drvdata(&pdev->dev);
+
 	component_del(&pdev->dev, &gpu_ops);
 	pm_runtime_disable(&pdev->dev);
+
+	mutex_destroy(&gpu->lock);
+	mutex_destroy(&gpu->sched_lock);
 }
 
 static int etnaviv_gpu_rpm_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index e3be16165c86..ed6c42384856 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -361,7 +361,7 @@ static void etnaviv_iommu_context_free(struct kref *kref)
 		container_of(kref, struct etnaviv_iommu_context, refcount);
 
 	etnaviv_cmdbuf_suballoc_unmap(context, &context->cmdbuf_mapping);
-
+	mutex_destroy(&context->lock);
 	context->global->ops->free(context);
 }
 void etnaviv_iommu_context_put(struct etnaviv_iommu_context *context)
-- 
2.34.1

