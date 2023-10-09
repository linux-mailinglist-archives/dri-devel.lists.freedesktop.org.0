Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11017BE907
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A564A10E2C3;
	Mon,  9 Oct 2023 18:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D103D10E2AE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:53 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c296e6543fso58308171fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875052; x=1697479852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fSKwyY0AUZT7nYjKEozVOtIdyccNepLFZtN63/GLx98=;
 b=hJLvTpqcI4gWxuyWm/gj4y77tNgFUnWZFP4fU/77fJx7JXfZP/kqpyXsNLjNmwZaOQ
 iHwBH7OEc8wp04P1K5juHeWJZMccjupzobnWeYM8Si8kGFxFlGt2vM6rO9R8WjTFgu2T
 /h4hf2xbyj/fNjdxqhTPiHyrY3IklKJ1JI4A3f3PzwID4z9kmEMbQE5WHFwTEaHSLx8f
 NK96tt4sMEOi62ecsZXhBCZje/yq8+iM0eGrx3x+gO5zx/F5gNrneJsI5XJWqXFu7qBx
 ETYH/WU0oIviUh4QTpQjH3eEvZ3DbdwNl5TvHBVt+oeLSkmBcUqq8tmC6Usj8nhb5uwT
 aC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875052; x=1697479852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fSKwyY0AUZT7nYjKEozVOtIdyccNepLFZtN63/GLx98=;
 b=vqlVj+X06hNUz/1s5Vgxa8bS1l/GSb/pb4z3q1B3kp3zJNiREvnnkSanJNZkD6v9TB
 cDw7186aiqJSQ2xir4gEFnfqIpVQrBhggH56lNhX2iw8X3ImzwK4dLs/9jEY+pDy0O2M
 6jyJUCEW3tb+1U1L5Ki4gWssX8z3kkLlsjd7/b0jYekTXVSPF20agnzKbNAkmoInGB6N
 onB5rshtijH28OjmWTyub6ayVtC38x8aZSddl+gro8t8QPboFWth8NecA4uumQA7EH9Q
 lylA17a1fYOGFc9lrlRmENIa3MY7HZh+d1h5h1kmoTOg3E3mGn6j/C6ZdjXo1QCG7quX
 6GPA==
X-Gm-Message-State: AOJu0YzpuyA4RXjArsyPTkzybTfvetGp1ilBc5SDaVe7tUC9/pB5p+ey
 0j2bNLdVZ8enyfZmhcFLyc7H9Q==
X-Google-Smtp-Source: AGHT+IHuqxqoWKJc6nLsbCsGeXJTbqf54oc+eTQuVaowih6JBFl2Xb3GYsvxZt9bha+J0gxeav1yxw==
X-Received: by 2002:ac2:44cb:0:b0:4fe:279b:8a02 with SMTP id
 d11-20020ac244cb000000b004fe279b8a02mr13372329lfm.67.1696875052002; 
 Mon, 09 Oct 2023 11:10:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 13/13] drm/msm: carve out KMS code from msm_drv.c
Date: Mon,  9 Oct 2023 21:10:40 +0300
Message-Id: <20231009181040.2743847-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile  |   1 +
 drivers/gpu/drm/msm/msm_drv.c | 346 ++--------------------------------
 drivers/gpu/drm/msm/msm_kms.c | 345 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |   3 +
 4 files changed, 365 insertions(+), 330 deletions(-)
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
index 00ed71c3d503..1efb31420094 100644
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
-	struct drm_crtc *crtc;
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
-		kms->funcs->enable_vblank(kms, vbl_work->crtc);
-	else
-		kms->funcs->disable_vblank(kms,	vbl_work->crtc);
-
-	kfree(vbl_work);
-}
-
-static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
-					struct drm_crtc *crtc, bool enable)
-{
-	struct msm_vblank_work *vbl_work;
-
-	vbl_work = kzalloc(sizeof(*vbl_work), GFP_ATOMIC);
-	if (!vbl_work)
-		return -ENOMEM;
-
-	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
-
-	vbl_work->crtc = crtc;
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
@@ -400,8 +211,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
-	struct msm_kms *kms;
-	struct drm_crtc *crtc;
 	int ret;
 
 	if (drm_firmware_drivers_only())
@@ -438,9 +247,11 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
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
@@ -453,98 +264,33 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_deinit_vram;
 
-	/* the fw fb could be anywhere in memory */
-	ret = drm_aperture_remove_framebuffers(drv);
-	if (ret)
-		goto err_msm_uninit;
-
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
 		goto err_msm_uninit;
 
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
-	drm_for_each_crtc(crtc, ddev) {
-		struct msm_drm_thread *ev_thread;
-
-		/* initialize event thread */
-		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
-		ev_thread->dev = ddev;
-		ev_thread->worker = kthread_create_worker(0, "crtc_event:%d", crtc->base.id);
-		if (IS_ERR(ev_thread->worker)) {
-			ret = PTR_ERR(ev_thread->worker);
-			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			ev_thread->worker = NULL;
-			goto err_msm_uninit;
-		}
-
-		sched_set_fifo(ev_thread->worker->task);
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
-
-	if (kms)
+	if (priv->kms_init) {
+		drm_kms_helper_poll_init(ddev);
 		msm_fbdev_setup(ddev);
+	}
 
 	return 0;
 
@@ -635,28 +381,6 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	context_close(ctx);
 }
 
-int msm_crtc_enable_vblank(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	if (!kms)
-		return -ENXIO;
-	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
-	return vblank_ctrl_queue_work(priv, crtc, true);
-}
-
-void msm_crtc_disable_vblank(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	if (!kms)
-		return;
-	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
-	vblank_ctrl_queue_work(priv, crtc, false);
-}
-
 /*
  * DRM ioctls:
  */
@@ -1099,28 +823,6 @@ static const struct drm_driver msm_driver = {
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
@@ -1277,22 +979,6 @@ static void msm_pdev_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &msm_drm_ops);
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
 	.remove_new = msm_pdev_remove,
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
new file mode 100644
index 000000000000..84c21ec2ceea
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
+	struct drm_crtc *crtc;
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
+		kms->funcs->enable_vblank(kms, vbl_work->crtc);
+	else
+		kms->funcs->disable_vblank(kms,	vbl_work->crtc);
+
+	kfree(vbl_work);
+}
+
+static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
+				  struct drm_crtc *crtc, bool enable)
+{
+	struct msm_vblank_work *vbl_work;
+
+	vbl_work = kzalloc(sizeof(*vbl_work), GFP_ATOMIC);
+	if (!vbl_work)
+		return -ENOMEM;
+
+	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
+
+	vbl_work->crtc = crtc;
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
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	if (!kms)
+		return -ENXIO;
+	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	return vblank_ctrl_queue_work(priv, crtc, true);
+}
+
+void msm_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	if (!kms)
+		return;
+	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	vblank_ctrl_queue_work(priv, crtc, false);
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
+	struct drm_crtc *crtc;
+	int ret;
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
+	drm_for_each_crtc(crtc, ddev) {
+		struct msm_drm_thread *ev_thread;
+
+		/* initialize event thread */
+		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
+		ev_thread->dev = ddev;
+		ev_thread->worker = kthread_create_worker(0, "crtc_event:%d", crtc->base.id);
+		if (IS_ERR(ev_thread->worker)) {
+			ret = PTR_ERR(ev_thread->worker);
+			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
+			ev_thread->worker = NULL;
+			goto err_msm_uninit;
+		}
+
+		sched_set_fifo(ev_thread->worker->task);
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

