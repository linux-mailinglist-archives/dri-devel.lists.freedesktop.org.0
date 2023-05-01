Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE36F3608
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FA110E245;
	Mon,  1 May 2023 18:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF08110E245;
 Mon,  1 May 2023 18:45:13 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-52867360efcso1834785a12.2; 
 Mon, 01 May 2023 11:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682966713; x=1685558713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9TduxMlN6FHewLrO+zh81TjJ8J6pSF1/l3zfTKBuCoA=;
 b=pbDCxE0gxpMORIzDv5ufSDD4Cwhb6fG38OM/mI8pUhoP2nHMH/BuM8h40pXoXWfD2B
 2HSm7znuwK0F9YqpXYk+smBFsD2w5Qn6HQI4y7jBnbOfrzUjE5kvLluxpe6iIzbRheF8
 vz1kGmJppucdox89cT8qG8Pn3bE5AzNDR50aY/iIIwXyJW5YQoBCcrv3Z4LYdB/K+LMK
 xUDdHvndgdWehotplHMVODbOuUhh5PrrIjomi3bB3QFPFda+X6cB8D2VHI6HzfKuESGE
 YKz92jPLomNOevc3fYN2uLeCyUZKagiNDCGq74aFZjQhGldGTnCdfTkcYzhQ5AX0TrC+
 NSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966713; x=1685558713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9TduxMlN6FHewLrO+zh81TjJ8J6pSF1/l3zfTKBuCoA=;
 b=bJ9H3MG0jTnRB3hYXyXVnWcbYLk/u+qpog0PggeCDZkHf1P0n+pKVK1kuka2kHoLoS
 QQXxTOdmWujoel3kNmL324fqu/uCCEJx1S7jxcGTSRs7eF2v1j1fJnMvOWzM4mB34Ktv
 7unZZTgddMsYwvN6YwVRySRoZwXI5186g7q3VgiYW5VpOVq3KEdnZU2EM8wnjaiZ7hzz
 jYaOSQuzYH+ZzvVftmoswwduU4XVonFGpthb6yZ45x42jt/nd9yTgJvffAjjCJigQ9F+
 vBmgCcVxaJjDW0oh0axwZOu1oYMI7NC87L1yxi+FxFbqKY0vjghPG1KuDfoof7J9u2LA
 rGyw==
X-Gm-Message-State: AC+VfDykg6EmoOTgpqFM0Omg+K8Ygk4SBhV8noAzqSYOgmGcqr4Fx7xx
 7DoTmjGjXMV54jfiI6DvxTvBw1Gcjco=
X-Google-Smtp-Source: ACHHUZ5PXdAU5V8zv7AbOm6OW63czG63yjlCOeZwJReqrF8100LfyQPQ8YRzmHo0eqCEjFIf2vdQwQ==
X-Received: by 2002:a17:90b:4f82:b0:23f:582d:f45f with SMTP id
 qe2-20020a17090b4f8200b0023f582df45fmr14866590pjb.1.1682966713106; 
 Mon, 01 May 2023 11:45:13 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a17090a941700b00247bdd05fe5sm6090019pjo.29.2023.05.01.11.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 11:45:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] drm/msm: Switch to fdinfo helper
Date: Mon,  1 May 2023 11:44:49 -0700
Message-Id: <20230501184502.1620335-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501184502.1620335-1-robdclark@gmail.com>
References: <20230501184502.1620335-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that we have a common helper, use it.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
 drivers/gpu/drm/msm/msm_gpu.c |  2 --
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b6f17b1261f..1e941aa77609 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1036,57 +1036,56 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_SUBMIT,   msm_ioctl_gem_submit,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_WAIT_FENCE,   msm_ioctl_wait_fence,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
 };
 
-static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
+static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_file *file = f->private_data;
 	struct drm_device *dev = file->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_printer p = drm_seq_file_printer(m);
 
 	if (!priv->gpu)
 		return;
 
-	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
+	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
 }
 
 static const struct file_operations fops = {
 	.owner = THIS_MODULE,
 	DRM_GEM_FOPS,
-	.show_fdinfo = msm_fop_show_fdinfo,
+	.show_fdinfo = drm_show_fdinfo,
 };
 
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
-	.postclose           = msm_postclose,
+	.postclose          = msm_postclose,
 	.lastclose          = drm_fb_helper_lastclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 	.gem_prime_mmap     = msm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
+	.show_fdinfo        = msm_show_fdinfo,
 	.ioctls             = msm_ioctls,
 	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
 	.name               = "msm",
 	.desc               = "MSM Snapdragon DRM",
 	.date               = "20130625",
 	.major              = MSM_VERSION_MAJOR,
 	.minor              = MSM_VERSION_MINOR,
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b1647b851018..52db90e34ead 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -144,22 +144,20 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 		return ret;
 
 	gpu->suspend_count++;
 
 	return 0;
 }
 
 void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			 struct drm_printer *p)
 {
-	drm_printf(p, "drm-driver:\t%s\n", gpu->dev->driver->name);
-	drm_printf(p, "drm-client-id:\t%u\n", ctx->seqno);
 	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
 	drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
 	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
 }
 
 int msm_gpu_hw_init(struct msm_gpu *gpu)
 {
 	int ret;
 
 	WARN_ON(!mutex_is_locked(&gpu->lock));
-- 
2.39.2

