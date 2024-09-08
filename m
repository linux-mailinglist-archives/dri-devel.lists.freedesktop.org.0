Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40F970740
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C334C10E252;
	Sun,  8 Sep 2024 12:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="xfcRh4PX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6472910E252
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 12:11:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725797497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zp0+gJ8zC1+4EYinnSYnf2yVlAatGRkLD73KizOpAxQ=;
 b=xfcRh4PXGDmceJejZcEs7Ib47DGRqGTT4t4Ajb1hGGUQpRNyB/xfjSS4ZfaVSOT8j4vtvC
 pRYvBgAG3/JnOxqT2R2zFMwlrECbvo7x2QdO/c9q9gmWQL3WN0Hctw0Tjwk7GOr8QakUQC
 siPWWONvvPzl4zJXWXqbzAo8qgCoPFE=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Christian Gmeiner <cgmeiner@igalia.com>
Subject: [PATCH v2 4/5] drm/etnaviv: Fix missing mutex_destroy()
Date: Sun,  8 Sep 2024 20:11:06 +0800
Message-ID: <20240908121107.328740-4-sui.jingfeng@linux.dev>
In-Reply-To: <20240908121107.328740-1-sui.jingfeng@linux.dev>
References: <20240908121107.328740-1-sui.jingfeng@linux.dev>
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

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---

 v2: Pick up tags and fix one more missing mutex_destroy() 

 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 2 ++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c    | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c    | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c    | 5 +++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c    | 2 +-
 5 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
index 721d633aece9..66a407f1b3ee 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
@@ -55,6 +55,7 @@ etnaviv_cmdbuf_suballoc_new(struct device *dev)
 	return suballoc;
 
 free_suballoc:
+	mutex_destroy(&suballoc->lock);
 	kfree(suballoc);
 
 	return ERR_PTR(ret);
@@ -79,6 +80,7 @@ void etnaviv_cmdbuf_suballoc_destroy(struct etnaviv_cmdbuf_suballoc *suballoc)
 {
 	dma_free_wc(suballoc->dev, SUBALLOC_SIZE, suballoc->vaddr,
 		    suballoc->paddr);
+	mutex_destroy(&suballoc->lock);
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
index 4ce3d2ea7767..4247a10f8d4f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -514,6 +514,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 	etnaviv_obj->ops->release(etnaviv_obj);
 	drm_gem_object_release(obj);
 
+	mutex_destroy(&etnaviv_obj->lock);
 	kfree(etnaviv_obj);
 }
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..3c869970cba4 100644
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
index 1661d589bf3e..02d9408d41bc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -358,7 +358,7 @@ static void etnaviv_iommu_context_free(struct kref *kref)
 		container_of(kref, struct etnaviv_iommu_context, refcount);
 
 	etnaviv_cmdbuf_suballoc_unmap(context, &context->cmdbuf_mapping);
-
+	mutex_destroy(&context->lock);
 	context->global->ops->free(context);
 }
 void etnaviv_iommu_context_put(struct etnaviv_iommu_context *context)
-- 
2.43.0

