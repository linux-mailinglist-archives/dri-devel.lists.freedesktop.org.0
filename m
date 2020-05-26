Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3C19D833
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF526EBB6;
	Fri,  3 Apr 2020 13:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7F16EBB5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id e9so7821399wme.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4vj1gNHl+Ga4BHJIvNFWTND78aqZmhX5iOaPBHUaRkg=;
 b=PV7tgTcrn+E0qjeBBrlSk4AqBqBx2KWMBQqZUnSQujRl689p79Nc+NC+2IB9y+uC/t
 jvxJVV443LeDKNqbDM090YG3CIOJBqlWjAOGyMzYd9MuQdR07GM/JtJf6Nqw2hVHkT2g
 D42vmNYC2zHQ+h+jdod57v3GVp7lSUMPReMBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4vj1gNHl+Ga4BHJIvNFWTND78aqZmhX5iOaPBHUaRkg=;
 b=MZmQ3jU6y0rfNsHKHdGFxUu8eMxqWNxqs0dm1ghN+fBypYAg35ILO6hFtU73sWwOjZ
 4WJxZt314xUygXOOCuelTZQ1gjVyKnf9SFnEJ2Ox5nD+tlgUszSAgDMTkkIWErKFjrPU
 1vMZhq0M8yMBzqYuVqWJ5ssIOEKoXVSWPWx5sxM0KSz9aUm0v1ojZEwzV61fyNYtZTV7
 v29sZJyC7hFuzdm2AUYWRK8M2GUmRClJ2osM8ixJSkZnQsrj8xaPyNt3pjQUuM83HmqE
 f811mpc2n7y2gCI6EFQ4bl6U9qZJLdvfW0QhkbpkBe1T01UPAjqrPu+AD1Gc+vtiFbgb
 u1YA==
X-Gm-Message-State: AGi0Pua5TXTkKfsxI/X/+hE1KhhMP/vY1RW3dpmRA9yPIJtZhntUS8MG
 MsI/eo4vbWMcdd18CQiokFrebBkqlUFpFQ==
X-Google-Smtp-Source: APiQypKydZphfI/BK77HmwHwnspcuOC7q/kEsQZ2ZbgtAOotm7F6g7fAvfd7KVMKcQ5dYsBFACW9bA==
X-Received: by 2002:a1c:1942:: with SMTP id 63mr9308693wmz.133.1585922330429; 
 Fri, 03 Apr 2020 06:58:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/44] drm/v3d: Delete v3d_dev->dev
Date: Fri,  3 Apr 2020 15:57:57 +0200
Message-Id: <20200403135828.2542770-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already have it in v3d_dev->drm.dev with zero additional pointer
chasing. Personally I don't like duplicated pointers like this
because:
- reviewers need to check whether the pointer is for the same or
  different objects if there's multiple
- compilers have an easier time too

But also a bit a bikeshed, so feel free to ignore.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 12 ++++++------
 drivers/gpu/drm/v3d/v3d_drv.c     | 12 ++++++------
 drivers/gpu/drm/v3d/v3d_drv.h     |  2 --
 drivers/gpu/drm/v3d/v3d_gem.c     | 17 +++++++++--------
 drivers/gpu/drm/v3d/v3d_irq.c     | 12 ++++++------
 drivers/gpu/drm/v3d/v3d_mmu.c     | 10 +++++-----
 drivers/gpu/drm/v3d/v3d_sched.c   | 10 +++++-----
 7 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 2b0ea5f8febd..e76b24bb8828 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -132,7 +132,7 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	u32 ident0, ident1, ident2, ident3, cores;
 	int ret, core;
 
-	ret = pm_runtime_get_sync(v3d->dev);
+	ret = pm_runtime_get_sync(v3d->drm.dev);
 	if (ret < 0)
 		return ret;
 
@@ -187,8 +187,8 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 			   (misccfg & V3D_MISCCFG_OVRTMUOUT) != 0);
 	}
 
-	pm_runtime_mark_last_busy(v3d->dev);
-	pm_runtime_put_autosuspend(v3d->dev);
+	pm_runtime_mark_last_busy(v3d->drm.dev);
+	pm_runtime_put_autosuspend(v3d->drm.dev);
 
 	return 0;
 }
@@ -219,7 +219,7 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	int measure_ms = 1000;
 	int ret;
 
-	ret = pm_runtime_get_sync(v3d->dev);
+	ret = pm_runtime_get_sync(v3d->drm.dev);
 	if (ret < 0)
 		return ret;
 
@@ -245,8 +245,8 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 		   cycles / (measure_ms * 1000),
 		   (cycles / (measure_ms * 100)) % 10);
 
-	pm_runtime_mark_last_busy(v3d->dev);
-	pm_runtime_put_autosuspend(v3d->dev);
+	pm_runtime_mark_last_busy(v3d->drm.dev);
+	pm_runtime_put_autosuspend(v3d->drm.dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index f57d408ef371..37cb880f2826 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -105,7 +105,7 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		if (args->value != 0)
 			return -EINVAL;
 
-		ret = pm_runtime_get_sync(v3d->dev);
+		ret = pm_runtime_get_sync(v3d->drm.dev);
 		if (ret < 0)
 			return ret;
 		if (args->param >= DRM_V3D_PARAM_V3D_CORE0_IDENT0 &&
@@ -114,8 +114,8 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		} else {
 			args->value = V3D_READ(offset);
 		}
-		pm_runtime_mark_last_busy(v3d->dev);
-		pm_runtime_put_autosuspend(v3d->dev);
+		pm_runtime_mark_last_busy(v3d->drm.dev);
+		pm_runtime_put_autosuspend(v3d->drm.dev);
 		return 0;
 	}
 
@@ -237,7 +237,7 @@ map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *name)
 	struct resource *res =
 		platform_get_resource_byname(v3d->pdev, IORESOURCE_MEM, name);
 
-	*regs = devm_ioremap_resource(v3d->dev, res);
+	*regs = devm_ioremap_resource(v3d->drm.dev, res);
 	return PTR_ERR_OR_ZERO(*regs);
 }
 
@@ -255,7 +255,6 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (IS_ERR(v3d))
 		return PTR_ERR(v3d);
 
-	v3d->dev = dev;
 	v3d->pdev = pdev;
 	drm = &v3d->drm;
 
@@ -345,7 +344,8 @@ static int v3d_platform_drm_remove(struct platform_device *pdev)
 
 	v3d_gem_destroy(drm);
 
-	dma_free_wc(v3d->dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
+	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
+		    v3d->mmu_scratch_paddr);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 112d80aed5f6..4d2d1f2fe1af 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -14,7 +14,6 @@
 #include "uapi/drm/v3d_drm.h"
 
 struct clk;
-struct device;
 struct platform_device;
 struct reset_control;
 
@@ -47,7 +46,6 @@ struct v3d_dev {
 	int ver;
 	bool single_irq_line;
 
-	struct device *dev;
 	struct platform_device *pdev;
 	void __iomem *hub_regs;
 	void __iomem *core_regs[3];
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 549dde83408b..09a7639cf161 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -370,8 +370,8 @@ v3d_job_free(struct kref *ref)
 	dma_fence_put(job->irq_fence);
 	dma_fence_put(job->done_fence);
 
-	pm_runtime_mark_last_busy(job->v3d->dev);
-	pm_runtime_put_autosuspend(job->v3d->dev);
+	pm_runtime_mark_last_busy(job->v3d->drm.dev);
+	pm_runtime_put_autosuspend(job->v3d->drm.dev);
 
 	kfree(job);
 }
@@ -439,7 +439,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->v3d = v3d;
 	job->free = free;
 
-	ret = pm_runtime_get_sync(v3d->dev);
+	ret = pm_runtime_get_sync(v3d->drm.dev);
 	if (ret < 0)
 		return ret;
 
@@ -458,7 +458,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	return 0;
 fail:
 	xa_destroy(&job->deps);
-	pm_runtime_put_autosuspend(v3d->dev);
+	pm_runtime_put_autosuspend(v3d->drm.dev);
 	return ret;
 }
 
@@ -886,12 +886,12 @@ v3d_gem_init(struct drm_device *dev)
 	 */
 	drm_mm_init(&v3d->mm, 1, pt_size / sizeof(u32) - 1);
 
-	v3d->pt = dma_alloc_wc(v3d->dev, pt_size,
+	v3d->pt = dma_alloc_wc(v3d->drm.dev, pt_size,
 			       &v3d->pt_paddr,
 			       GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
 	if (!v3d->pt) {
 		drm_mm_takedown(&v3d->mm);
-		dev_err(v3d->dev,
+		dev_err(v3d->drm.dev,
 			"Failed to allocate page tables. "
 			"Please ensure you have CMA enabled.\n");
 		return -ENOMEM;
@@ -903,7 +903,7 @@ v3d_gem_init(struct drm_device *dev)
 	ret = v3d_sched_init(v3d);
 	if (ret) {
 		drm_mm_takedown(&v3d->mm);
-		dma_free_coherent(v3d->dev, 4096 * 1024, (void *)v3d->pt,
+		dma_free_coherent(v3d->drm.dev, 4096 * 1024, (void *)v3d->pt,
 				  v3d->pt_paddr);
 	}
 
@@ -925,5 +925,6 @@ v3d_gem_destroy(struct drm_device *dev)
 
 	drm_mm_takedown(&v3d->mm);
 
-	dma_free_coherent(v3d->dev, 4096 * 1024, (void *)v3d->pt, v3d->pt_paddr);
+	dma_free_coherent(v3d->drm.dev, 4096 * 1024, (void *)v3d->pt,
+			  v3d->pt_paddr);
 }
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 662e67279a7b..f4ce6d057c90 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -128,7 +128,7 @@ v3d_irq(int irq, void *arg)
 	 * always-allowed mode.
 	 */
 	if (intsts & V3D_INT_GMPV)
-		dev_err(v3d->dev, "GMP violation\n");
+		dev_err(v3d->drm.dev, "GMP violation\n");
 
 	/* V3D 4.2 wires the hub and core IRQs together, so if we &
 	 * didn't see the common one then check hub for MMU IRQs.
@@ -189,7 +189,7 @@ v3d_hub_irq(int irq, void *arg)
 				client = v3d41_axi_ids[axi_id];
 		}
 
-		dev_err(v3d->dev, "MMU error from client %s (%d) at 0x%llx%s%s%s\n",
+		dev_err(v3d->drm.dev, "MMU error from client %s (%d) at 0x%llx%s%s%s\n",
 			client, axi_id, (long long)vio_addr,
 			((intsts & V3D_HUB_INT_MMU_WRV) ?
 			 ", write violation" : ""),
@@ -221,12 +221,12 @@ v3d_irq_init(struct v3d_dev *v3d)
 	if (irq1 == -EPROBE_DEFER)
 		return irq1;
 	if (irq1 > 0) {
-		ret = devm_request_irq(v3d->dev, irq1,
+		ret = devm_request_irq(v3d->drm.dev, irq1,
 				       v3d_irq, IRQF_SHARED,
 				       "v3d_core0", v3d);
 		if (ret)
 			goto fail;
-		ret = devm_request_irq(v3d->dev, platform_get_irq(v3d->pdev, 0),
+		ret = devm_request_irq(v3d->drm.dev, platform_get_irq(v3d->pdev, 0),
 				       v3d_hub_irq, IRQF_SHARED,
 				       "v3d_hub", v3d);
 		if (ret)
@@ -234,7 +234,7 @@ v3d_irq_init(struct v3d_dev *v3d)
 	} else {
 		v3d->single_irq_line = true;
 
-		ret = devm_request_irq(v3d->dev, platform_get_irq(v3d->pdev, 0),
+		ret = devm_request_irq(v3d->drm.dev, platform_get_irq(v3d->pdev, 0),
 				       v3d_irq, IRQF_SHARED,
 				       "v3d", v3d);
 		if (ret)
@@ -246,7 +246,7 @@ v3d_irq_init(struct v3d_dev *v3d)
 
 fail:
 	if (ret != -EPROBE_DEFER)
-		dev_err(v3d->dev, "IRQ setup failed: %d\n", ret);
+		dev_err(v3d->drm.dev, "IRQ setup failed: %d\n", ret);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 395e81d97163..3b81ea28c0bb 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -40,7 +40,7 @@ static int v3d_mmu_flush_all(struct v3d_dev *v3d)
 	ret = wait_for(!(V3D_READ(V3D_MMU_CTL) &
 			 V3D_MMU_CTL_TLB_CLEARING), 100);
 	if (ret)
-		dev_err(v3d->dev, "TLB clear wait idle pre-wait failed\n");
+		dev_err(v3d->drm.dev, "TLB clear wait idle pre-wait failed\n");
 
 	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
 		  V3D_MMU_CTL_TLB_CLEAR);
@@ -52,14 +52,14 @@ static int v3d_mmu_flush_all(struct v3d_dev *v3d)
 	ret = wait_for(!(V3D_READ(V3D_MMU_CTL) &
 			 V3D_MMU_CTL_TLB_CLEARING), 100);
 	if (ret) {
-		dev_err(v3d->dev, "TLB clear wait idle failed\n");
+		dev_err(v3d->drm.dev, "TLB clear wait idle failed\n");
 		return ret;
 	}
 
 	ret = wait_for(!(V3D_READ(V3D_MMUC_CONTROL) &
 			 V3D_MMUC_CONTROL_FLUSHING), 100);
 	if (ret)
-		dev_err(v3d->dev, "MMUC flush wait idle failed\n");
+		dev_err(v3d->drm.dev, "MMUC flush wait idle failed\n");
 
 	return ret;
 }
@@ -109,7 +109,7 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 		     shmem_obj->base.size >> V3D_MMU_PAGE_SHIFT);
 
 	if (v3d_mmu_flush_all(v3d))
-		dev_err(v3d->dev, "MMU flush timeout\n");
+		dev_err(v3d->drm.dev, "MMU flush timeout\n");
 }
 
 void v3d_mmu_remove_ptes(struct v3d_bo *bo)
@@ -122,5 +122,5 @@ void v3d_mmu_remove_ptes(struct v3d_bo *bo)
 		v3d->pt[page] = 0;
 
 	if (v3d_mmu_flush_all(v3d))
-		dev_err(v3d->dev, "MMU flush timeout\n");
+		dev_err(v3d->drm.dev, "MMU flush timeout\n");
 }
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 8c2df6d95283..0747614a78f0 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -403,7 +403,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     msecs_to_jiffies(hang_limit_ms),
 			     "v3d_bin");
 	if (ret) {
-		dev_err(v3d->dev, "Failed to create bin scheduler: %d.", ret);
+		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
 		return ret;
 	}
 
@@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     msecs_to_jiffies(hang_limit_ms),
 			     "v3d_render");
 	if (ret) {
-		dev_err(v3d->dev, "Failed to create render scheduler: %d.",
+		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
 			ret);
 		v3d_sched_fini(v3d);
 		return ret;
@@ -425,7 +425,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     msecs_to_jiffies(hang_limit_ms),
 			     "v3d_tfu");
 	if (ret) {
-		dev_err(v3d->dev, "Failed to create TFU scheduler: %d.",
+		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
 			ret);
 		v3d_sched_fini(v3d);
 		return ret;
@@ -438,7 +438,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     msecs_to_jiffies(hang_limit_ms),
 				     "v3d_csd");
 		if (ret) {
-			dev_err(v3d->dev, "Failed to create CSD scheduler: %d.",
+			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
 				ret);
 			v3d_sched_fini(v3d);
 			return ret;
@@ -450,7 +450,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     msecs_to_jiffies(hang_limit_ms),
 				     "v3d_cache_clean");
 		if (ret) {
-			dev_err(v3d->dev, "Failed to create CACHE_CLEAN scheduler: %d.",
+			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
 				ret);
 			v3d_sched_fini(v3d);
 			return ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
