Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E92745354
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182BB10E191;
	Mon,  3 Jul 2023 00:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB9410E181
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:59 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b6c5ede714so46797861fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344677; x=1690936677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wI3eBgte9sHeWQKSCdUg3RIfWZjMlvurOH35U+XVJwA=;
 b=iS9dR34RQY9TZaEPihIGjvIo7mKsKWzG+1bC1ihzrnmJz8xhUI2XimSsDJ+CgpzrPK
 VVATcrQVJl8GnidBSwE069L6MgkIe4GOwGh9aQ1f33lYZvpcp/Xt4QiElJXCKkCVp2Kw
 kdLFHpRmVZX5+s3PcFtMjkBFOuewZd4wqR62i9+ekHy80tNcedG4tseyeNONmXzjGYee
 xCZ9/Rgdq5o26q7pkekVLWvkPL0lzjzy/2yFIl55pC7ZMzLfWfi+Dyjj5E9ABDtejphh
 HeWe/P7aDr7LcAgFjKQ8w+JjJ/7p+lKJWI30Qjy0hTx8IKn/Pgb7sT/oNSt5Ux4kGe0I
 07Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344677; x=1690936677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wI3eBgte9sHeWQKSCdUg3RIfWZjMlvurOH35U+XVJwA=;
 b=HnGEbac6gFqQF2Q0GqqLiZD4eGSNOcnh9ILq0wOPfoAp/iWD0B11p6RiIzgjt8LRyT
 7OUe96w1hiM+GtVF4MJFIlLgmheXT5Z0FAVCXk+QCHBEulDcim08pR2jHteAn6exTrV1
 7rpgrTh+8GJ5TqRgPpXVr1TH0QmxHG6KGuQ5Cw30ts3rRyWnBLkn8xRX6mlDqqdmOtI1
 aJlbbeOgFGOSidADXbhaxUCJ/KwUHXggy1+4YZSjhp5izH9A78CdErZYtB1yW5XmW+8i
 SZRfeeOB0K/6GdtkkFL4KnvFnx04P7fhur256HzCIH59XTbwad/GJkJfqQtX/j8/lrcL
 mpRg==
X-Gm-Message-State: ABy/qLaWTczuzvY1hIP2lu24bE7V1EtpUtRWMZbJJwV/nlN3SZ5nFYbk
 JwspIwfjmqFty8bOFn+zaZhCCA==
X-Google-Smtp-Source: APBJJlEwe8+kubu0uuuKjXA9bQQ7USh4cJODDNjuPNz+MVsQOA8CcroBaLriy3RRZK1aabxXvoFwCA==
X-Received: by 2002:a05:651c:1189:b0:2b6:dbb3:65a0 with SMTP id
 w9-20020a05651c118900b002b6dbb365a0mr1488852ljo.3.1688344677530; 
 Sun, 02 Jul 2023 17:37:57 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 13/13] drm/msm: carve out KMS code from msm_drv.c
Date: Mon,  3 Jul 2023 03:37:45 +0300
Message-Id: <20230703003745.34239-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm_drv.c contains generic code intermixed with KMS handling code.
Move all KMS-related code to a separate msm_kms.c file, cleaning up init
code while doing this move. This also prevents msm driver from registering
modesetting / atomic interfaces in the headless case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile  |   1 +
 drivers/gpu/drm/msm/msm_drv.c | 347 ++--------------------------------
 drivers/gpu/drm/msm/msm_kms.c | 345 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |   3 +
 4 files changed, 366 insertions(+), 330 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_kms.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 8d02d8c33069..49671364fdcf 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -106,6 +106,7 @@ msm-y += \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
+	msm_kms.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6b734be17f3f..73a063f507ee 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -6,30 +6,17 @@
  */
 
 #include <linux/dma-mapping.h>
-#include <linux/fault-inject.h>
-#include <linux/kthread.h>
 #include <linux/of_address.h>
-#include <linux/sched/mm.h>
 #include <linux/uaccess.h>
-#include <uapi/linux/sched/types.h>
 
-#include <drm/drm_aperture.h>
-#include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_prime.h>
 #include <drm/drm_of.h>
-#include <drm/drm_vblank.h>
 
-#include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
 #include "msm_debugfs.h"
-#include "msm_fence.h"
-#include "msm_gem.h"
-#include "msm_gpu.h"
 #include "msm_kms.h"
-#include "msm_mmu.h"
 #include "adreno/adreno_gpu.h"
 
 /*
@@ -56,16 +43,6 @@
 
 static void msm_deinit_vram(struct drm_device *ddev);
 
-static const struct drm_mode_config_funcs mode_config_funcs = {
-	.fb_create = msm_framebuffer_create,
-	.atomic_check = msm_atomic_check,
-	.atomic_commit = drm_atomic_helper_commit,
-};
-
-static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
-	.atomic_commit_tail = msm_atomic_commit_tail,
-};
-
 static char *vram = "16m";
 MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
 module_param(vram, charp, 0);
@@ -83,125 +60,11 @@ DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 #endif
 
-static irqreturn_t msm_irq(int irq, void *arg)
-{
-	struct drm_device *dev = arg;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	BUG_ON(!kms);
-
-	return kms->funcs->irq(kms);
-}
-
-static void msm_irq_preinstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	BUG_ON(!kms);
-
-	kms->funcs->irq_preinstall(kms);
-}
-
-static int msm_irq_postinstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	BUG_ON(!kms);
-
-	if (kms->funcs->irq_postinstall)
-		return kms->funcs->irq_postinstall(kms);
-
-	return 0;
-}
-
-static int msm_irq_install(struct drm_device *dev, unsigned int irq)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	int ret;
-
-	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
-
-	msm_irq_preinstall(dev);
-
-	ret = request_irq(irq, msm_irq, 0, dev->driver->name, dev);
-	if (ret)
-		return ret;
-
-	kms->irq_requested = true;
-
-	ret = msm_irq_postinstall(dev);
-	if (ret) {
-		free_irq(irq, dev);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void msm_irq_uninstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	kms->funcs->irq_uninstall(kms);
-	if (kms->irq_requested)
-		free_irq(kms->irq, dev);
-}
-
-struct msm_vblank_work {
-	struct work_struct work;
-	int crtc_id;
-	bool enable;
-	struct msm_drm_private *priv;
-};
-
-static void vblank_ctrl_worker(struct work_struct *work)
-{
-	struct msm_vblank_work *vbl_work = container_of(work,
-						struct msm_vblank_work, work);
-	struct msm_drm_private *priv = vbl_work->priv;
-	struct msm_kms *kms = priv->kms;
-
-	if (vbl_work->enable)
-		kms->funcs->enable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
-	else
-		kms->funcs->disable_vblank(kms,	priv->crtcs[vbl_work->crtc_id]);
-
-	kfree(vbl_work);
-}
-
-static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
-					int crtc_id, bool enable)
-{
-	struct msm_vblank_work *vbl_work;
-
-	vbl_work = kzalloc(sizeof(*vbl_work), GFP_ATOMIC);
-	if (!vbl_work)
-		return -ENOMEM;
-
-	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
-
-	vbl_work->crtc_id = crtc_id;
-	vbl_work->enable = enable;
-	vbl_work->priv = priv;
-
-	queue_work(priv->wq, &vbl_work->work);
-
-	return 0;
-}
-
 static int msm_drm_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *ddev = priv->dev;
-	struct msm_kms *kms = priv->kms;
-	int i;
 
 	/*
 	 * Shutdown the hw if we're far enough along where things might be on.
@@ -212,7 +75,8 @@ static int msm_drm_uninit(struct device *dev)
 	 */
 	if (ddev->registered) {
 		drm_dev_unregister(ddev);
-		drm_atomic_helper_shutdown(ddev);
+		if (priv->kms)
+			drm_atomic_helper_shutdown(ddev);
 	}
 
 	/* We must cancel and cleanup any pending vblank enable/disable
@@ -222,30 +86,13 @@ static int msm_drm_uninit(struct device *dev)
 
 	flush_workqueue(priv->wq);
 
-	/* clean up event worker threads */
-	for (i = 0; i < priv->num_crtcs; i++) {
-		if (priv->event_thread[i].worker)
-			kthread_destroy_worker(priv->event_thread[i].worker);
-	}
-
 	msm_gem_shrinker_cleanup(ddev);
 
-	drm_kms_helper_poll_fini(ddev);
-
 	msm_perf_debugfs_cleanup(priv);
 	msm_rd_debugfs_cleanup(priv);
 
-	if (kms)
-		msm_disp_snapshot_destroy(ddev);
-
-	if (kms) {
-		pm_runtime_get_sync(dev);
-		msm_irq_uninstall(ddev);
-		pm_runtime_put_sync(dev);
-	}
-
-	if (kms && kms->funcs)
-		kms->funcs->destroy(kms);
+	if (priv->kms)
+		msm_drm_kms_uninit(dev);
 
 	msm_deinit_vram(ddev);
 
@@ -259,42 +106,6 @@ static int msm_drm_uninit(struct device *dev)
 	return 0;
 }
 
-struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
-{
-	struct msm_gem_address_space *aspace;
-	struct msm_mmu *mmu;
-	struct device *mdp_dev = dev->dev;
-	struct device *mdss_dev = mdp_dev->parent;
-	struct device *iommu_dev;
-
-	/*
-	 * IOMMUs can be a part of MDSS device tree binding, or the
-	 * MDP/DPU device.
-	 */
-	if (device_iommu_mapped(mdp_dev))
-		iommu_dev = mdp_dev;
-	else
-		iommu_dev = mdss_dev;
-
-	mmu = msm_iommu_new(iommu_dev, 0);
-	if (IS_ERR(mmu))
-		return ERR_CAST(mmu);
-
-	if (!mmu) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
-	}
-
-	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
-		0x1000, 0x100000000 - 0x1000);
-	if (IS_ERR(aspace)) {
-		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
-		mmu->funcs->destroy(mmu);
-	}
-
-	return aspace;
-}
-
 bool msm_use_mmu(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -400,8 +211,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
-	struct msm_kms *kms;
-	int ret, i;
+	int ret;
 
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
@@ -437,9 +247,11 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	might_lock(&priv->lru.lock);
 	fs_reclaim_release(GFP_KERNEL);
 
-	ret = drmm_mode_config_init(ddev);
-	if (ret)
-		goto err_destroy_wq;
+	if (priv->kms_init) {
+		ret = drmm_mode_config_init(ddev);
+		if (ret)
+			goto err_destroy_wq;
+	}
 
 	ret = msm_init_vram(ddev);
 	if (ret)
@@ -452,95 +264,32 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_deinit_vram;
 
-	/* the fw fb could be anywhere in memory */
-	ret = drm_aperture_remove_framebuffers(drv);
-	if (ret)
-		goto err_msm_uninit;
-
 	msm_gem_shrinker_init(ddev);
 
 	if (priv->kms_init) {
-		ret = priv->kms_init(ddev);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "failed to load kms\n");
-			priv->kms = NULL;
+		ret = msm_drm_kms_init(dev, drv);
+		if (ret)
 			goto err_msm_uninit;
-		}
-		kms = priv->kms;
 	} else {
 		/* valid only for the dummy headless case, where of_node=NULL */
 		WARN_ON(dev->of_node);
-		kms = NULL;
-	}
-
-	/* Enable normalization of plane zpos */
-	ddev->mode_config.normalize_zpos = true;
-
-	if (kms) {
-		kms->dev = ddev;
-		ret = kms->funcs->hw_init(kms);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-			goto err_msm_uninit;
-		}
-	}
-
-	drm_helper_move_panel_connectors_to_head(ddev);
-
-	ddev->mode_config.funcs = &mode_config_funcs;
-	ddev->mode_config.helper_private = &mode_config_helper_funcs;
-
-	for (i = 0; i < priv->num_crtcs; i++) {
-		/* initialize event thread */
-		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
-		priv->event_thread[i].dev = ddev;
-		priv->event_thread[i].worker = kthread_create_worker(0,
-			"crtc_event:%d", priv->event_thread[i].crtc_id);
-		if (IS_ERR(priv->event_thread[i].worker)) {
-			ret = PTR_ERR(priv->event_thread[i].worker);
-			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			priv->event_thread[i].worker = NULL;
-			goto err_msm_uninit;
-		}
-
-		sched_set_fifo(priv->event_thread[i].worker->task);
-	}
-
-	ret = drm_vblank_init(ddev, priv->num_crtcs);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
-		goto err_msm_uninit;
-	}
-
-	if (kms) {
-		pm_runtime_get_sync(dev);
-		ret = msm_irq_install(ddev, kms->irq);
-		pm_runtime_put_sync(dev);
-		if (ret < 0) {
-			DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
-			goto err_msm_uninit;
-		}
+		ddev->driver_features &= ~DRIVER_MODESET;
+		ddev->driver_features &= ~DRIVER_ATOMIC;
 	}
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
 		goto err_msm_uninit;
 
-	if (kms) {
-		ret = msm_disp_snapshot_init(ddev);
-		if (ret)
-			DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
-	}
-	drm_mode_config_reset(ddev);
-
 	ret = msm_debugfs_late_init(ddev);
 	if (ret)
 		goto err_msm_uninit;
 
-	drm_kms_helper_poll_init(ddev);
+	if (priv->kms_init) {
+		drm_kms_helper_poll_init(ddev);
 
-	if (kms)
 		msm_fbdev_setup(ddev);
+	}
 
 	return 0;
 
@@ -631,30 +380,6 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	context_close(ctx);
 }
 
-int msm_crtc_enable_vblank(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	if (!kms)
-		return -ENXIO;
-	drm_dbg_vbl(dev, "crtc=%u", pipe);
-	return vblank_ctrl_queue_work(priv, pipe, true);
-}
-
-void msm_crtc_disable_vblank(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	if (!kms)
-		return;
-	drm_dbg_vbl(dev, "crtc=%u", pipe);
-	vblank_ctrl_queue_work(priv, pipe, false);
-}
-
 /*
  * DRM ioctls:
  */
@@ -1100,28 +825,6 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-int msm_kms_pm_prepare(struct device *dev)
-{
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
-	struct drm_device *ddev = priv ? priv->dev : NULL;
-
-	if (!priv || !priv->kms)
-		return 0;
-
-	return drm_mode_config_helper_suspend(ddev);
-}
-
-void msm_kms_pm_complete(struct device *dev)
-{
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
-	struct drm_device *ddev = priv ? priv->dev : NULL;
-
-	if (!priv || !priv->kms)
-		return;
-
-	drm_mode_config_helper_resume(ddev);
-}
-
 /*
  * Componentized driver support:
  */
@@ -1280,22 +983,6 @@ static int msm_pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-void msm_kms_shutdown(struct platform_device *pdev)
-{
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct drm_device *drm = priv ? priv->dev : NULL;
-
-	/*
-	 * Shutdown the hw if we're far enough along where things might be on.
-	 * If we run this too early, we'll end up panicking in any variety of
-	 * places. Since we don't register the drm device until late in
-	 * msm_drm_init, drm_dev->registered is used as an indicator that the
-	 * shutdown will be successful.
-	 */
-	if (drm && drm->registered && priv->kms)
-		drm_atomic_helper_shutdown(drm);
-}
-
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
new file mode 100644
index 000000000000..00ec30ab2381
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2018, 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <linux/kthread.h>
+#include <linux/sched/mm.h>
+#include <uapi/linux/sched/types.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_mode_config.h>
+#include <drm/drm_vblank.h>
+
+#include "disp/msm_disp_snapshot.h"
+#include "msm_drv.h"
+#include "msm_gem.h"
+#include "msm_kms.h"
+#include "msm_mmu.h"
+
+static const struct drm_mode_config_funcs mode_config_funcs = {
+	.fb_create = msm_framebuffer_create,
+	.atomic_check = msm_atomic_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
+	.atomic_commit_tail = msm_atomic_commit_tail,
+};
+
+static irqreturn_t msm_irq(int irq, void *arg)
+{
+	struct drm_device *dev = arg;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	BUG_ON(!kms);
+
+	return kms->funcs->irq(kms);
+}
+
+static void msm_irq_preinstall(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	BUG_ON(!kms);
+
+	kms->funcs->irq_preinstall(kms);
+}
+
+static int msm_irq_postinstall(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	BUG_ON(!kms);
+
+	if (kms->funcs->irq_postinstall)
+		return kms->funcs->irq_postinstall(kms);
+
+	return 0;
+}
+
+static int msm_irq_install(struct drm_device *dev, unsigned int irq)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	int ret;
+
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
+
+	msm_irq_preinstall(dev);
+
+	ret = request_irq(irq, msm_irq, 0, dev->driver->name, dev);
+	if (ret)
+		return ret;
+
+	kms->irq_requested = true;
+
+	ret = msm_irq_postinstall(dev);
+	if (ret) {
+		free_irq(irq, dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void msm_irq_uninstall(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	kms->funcs->irq_uninstall(kms);
+	if (kms->irq_requested)
+		free_irq(kms->irq, dev);
+}
+
+struct msm_vblank_work {
+	struct work_struct work;
+	int crtc_id;
+	bool enable;
+	struct msm_drm_private *priv;
+};
+
+static void vblank_ctrl_worker(struct work_struct *work)
+{
+	struct msm_vblank_work *vbl_work = container_of(work,
+						struct msm_vblank_work, work);
+	struct msm_drm_private *priv = vbl_work->priv;
+	struct msm_kms *kms = priv->kms;
+
+	if (vbl_work->enable)
+		kms->funcs->enable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
+	else
+		kms->funcs->disable_vblank(kms,	priv->crtcs[vbl_work->crtc_id]);
+
+	kfree(vbl_work);
+}
+
+static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
+					int crtc_id, bool enable)
+{
+	struct msm_vblank_work *vbl_work;
+
+	vbl_work = kzalloc(sizeof(*vbl_work), GFP_ATOMIC);
+	if (!vbl_work)
+		return -ENOMEM;
+
+	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
+
+	vbl_work->crtc_id = crtc_id;
+	vbl_work->enable = enable;
+	vbl_work->priv = priv;
+
+	queue_work(priv->wq, &vbl_work->work);
+
+	return 0;
+}
+
+int msm_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	if (!kms)
+		return -ENXIO;
+	drm_dbg_vbl(dev, "crtc=%u", pipe);
+	return vblank_ctrl_queue_work(priv, pipe, true);
+}
+
+void msm_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	if (!kms)
+		return;
+	drm_dbg_vbl(dev, "crtc=%u", pipe);
+	vblank_ctrl_queue_work(priv, pipe, false);
+}
+
+struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
+{
+	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
+	struct device *mdp_dev = dev->dev;
+	struct device *mdss_dev = mdp_dev->parent;
+	struct device *iommu_dev;
+
+	/*
+	 * IOMMUs can be a part of MDSS device tree binding, or the
+	 * MDP/DPU device.
+	 */
+	if (device_iommu_mapped(mdp_dev))
+		iommu_dev = mdp_dev;
+	else
+		iommu_dev = mdss_dev;
+
+	mmu = msm_iommu_new(iommu_dev, 0);
+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
+
+	if (!mmu) {
+		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
+		return NULL;
+	}
+
+	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
+		0x1000, 0x100000000 - 0x1000);
+	if (IS_ERR(aspace)) {
+		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
+		mmu->funcs->destroy(mmu);
+	}
+
+	return aspace;
+}
+
+void msm_drm_kms_uninit(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+	struct msm_kms *kms = priv->kms;
+	int i;
+
+	BUG_ON(!kms);
+
+	/* clean up event worker threads */
+	for (i = 0; i < priv->num_crtcs; i++) {
+		if (priv->event_thread[i].worker)
+			kthread_destroy_worker(priv->event_thread[i].worker);
+	}
+
+	drm_kms_helper_poll_fini(ddev);
+
+	msm_disp_snapshot_destroy(ddev);
+
+	pm_runtime_get_sync(dev);
+	msm_irq_uninstall(ddev);
+	pm_runtime_put_sync(dev);
+
+	if (kms && kms->funcs)
+		kms->funcs->destroy(kms);
+}
+
+int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
+{
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct drm_device *ddev = priv->dev;
+	struct msm_kms *kms = priv->kms;
+	int ret, i;
+
+	/* the fw fb could be anywhere in memory */
+	ret = drm_aperture_remove_framebuffers(drv);
+	if (ret)
+		return ret;
+
+	ret = priv->kms_init(ddev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to load kms\n");
+		priv->kms = NULL;
+		return ret;
+	}
+
+	/* Enable normalization of plane zpos */
+	ddev->mode_config.normalize_zpos = true;
+
+	ddev->mode_config.funcs = &mode_config_funcs;
+	ddev->mode_config.helper_private = &mode_config_helper_funcs;
+
+	kms->dev = ddev;
+	ret = kms->funcs->hw_init(kms);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+		goto err_msm_uninit;
+	}
+
+	drm_helper_move_panel_connectors_to_head(ddev);
+
+	for (i = 0; i < priv->num_crtcs; i++) {
+		/* initialize event thread */
+		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
+		priv->event_thread[i].dev = ddev;
+		priv->event_thread[i].worker = kthread_create_worker(0,
+			"crtc_event:%d", priv->event_thread[i].crtc_id);
+		if (IS_ERR(priv->event_thread[i].worker)) {
+			ret = PTR_ERR(priv->event_thread[i].worker);
+			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
+			priv->event_thread[i].worker = NULL;
+			goto err_msm_uninit;
+		}
+
+		sched_set_fifo(priv->event_thread[i].worker->task);
+	}
+
+	ret = drm_vblank_init(ddev, priv->num_crtcs);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
+		goto err_msm_uninit;
+	}
+
+	pm_runtime_get_sync(dev);
+	ret = msm_irq_install(ddev, kms->irq);
+	pm_runtime_put_sync(dev);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
+		goto err_msm_uninit;
+	}
+
+	ret = msm_disp_snapshot_init(ddev);
+	if (ret)
+		DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
+
+	drm_mode_config_reset(ddev);
+
+	return 0;
+
+err_msm_uninit:
+	return ret;
+}
+
+int msm_kms_pm_prepare(struct device *dev)
+{
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct drm_device *ddev = priv ? priv->dev : NULL;
+
+	if (!priv || !priv->kms)
+		return 0;
+
+	return drm_mode_config_helper_suspend(ddev);
+}
+
+void msm_kms_pm_complete(struct device *dev)
+{
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct drm_device *ddev = priv ? priv->dev : NULL;
+
+	if (!priv || !priv->kms)
+		return;
+
+	drm_mode_config_helper_resume(ddev);
+}
+
+void msm_kms_shutdown(struct platform_device *pdev)
+{
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *drm = priv ? priv->dev : NULL;
+
+	/*
+	 * Shutdown the hw if we're far enough along where things might be on.
+	 * If we run this too early, we'll end up panicking in any variety of
+	 * places. Since we don't register the drm device until late in
+	 * msm_drm_init, drm_dev->registered is used as an indicator that the
+	 * shutdown will be successful.
+	 */
+	if (drm && drm->registered && priv->kms)
+		drm_atomic_helper_shutdown(drm);
+}
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a3f1ff956..44aa435d68ce 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -195,4 +195,7 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	drm_for_each_crtc_reverse(crtc, dev) \
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
+int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv);
+void msm_drm_kms_uninit(struct device *dev);
+
 #endif /* __MSM_KMS_H__ */
-- 
2.39.2

