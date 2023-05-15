Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B3702FC8
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB4510E1FC;
	Mon, 15 May 2023 14:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DEB10E1F8;
 Mon, 15 May 2023 14:30:53 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-643bb9cdd6eso10656137b3a.1; 
 Mon, 15 May 2023 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684161052; x=1686753052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPtbgHx5pvKBNpqMIwwso4Kz83kyTXBOXbUJsvgFKio=;
 b=h7IgYrEFwajKVJ586ZDDv70DkO3URA7qqNdbXJOx6+Hy4RCSrL2yPbZXywpq5w6+y4
 OcoXUxVoAoSkDrQ4pUVNlZHW4Q+gOGshZ0pzsm/pRn0m2/+qqVnYLEyj/nmVo+E2PCjA
 oAGUhjP5fB/ZEu8VEDM0iixekXob7I7Fkmh0xnZtD1ZyNM3EiaCW3nvDp88RklNt1ahl
 rPCpSkv8Z61oCgLpUUVqiqyvDpj/s4bkH1xNGTtZ0P6ZSczXe3gnr7vQXr1H0zdmRRY5
 vS65EHnMET4ad642Ra39vqN01oJqPOMw3McMQGgdAt+e0OTKBK1sme3h5tYjYJ6vjw7h
 /vKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161052; x=1686753052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPtbgHx5pvKBNpqMIwwso4Kz83kyTXBOXbUJsvgFKio=;
 b=URpT5RMjC4D7ObTQaNAqS10GeiTRvDt6dYThz3tehWlW3EdlKbeaUTCHWXxON1GAa9
 aMoSbYdeLttYT2cnGr4Bmka91m91GA1RYlXyca1fXb0JaCg9Y+BGZlR5B0eZutoR7F1y
 HyI3aiUiu8VFztwY2vZ9E+4sz9XjaxCaNkrSG9iuCtdeDih7O/cqxAipsAQ7LCWeKMFc
 ZrcGN4DxZiquI+gdGYGvlx+S5+cr1lTGnY0+wgRPWBgz8UjzUmHH0kkuSrXllX+wSa7G
 CgR53K2AZ2JDmOy0StZuc9MfHq9zg5zreJezfCnV5RmEbhkSF1UjG0GW0Rmj1Cj1Lkxl
 fe2w==
X-Gm-Message-State: AC+VfDwtQfhx9h/Kkf3THsqOqc+yz10CbWDBdgFgkrcrpYF1hxirtRWp
 TQbzbOGtEkJSu6L0NciVs52TM0+U1Q4=
X-Google-Smtp-Source: ACHHUZ5W5LyVqcEpb0f8ngjuy8aCj0jQZi+Th7CZErNuBgiTOji2SVBxyRpp2T43jz8bd0rNaKk8Mg==
X-Received: by 2002:a05:6a21:9988:b0:100:3964:6cb with SMTP id
 ve8-20020a056a21998800b00100396406cbmr36102198pzb.40.1684161052599; 
 Mon, 15 May 2023 07:30:52 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 s145-20020a632c97000000b0050bc4ca9024sm11564000pgs.65.2023.05.15.07.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:30:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/9] drm/msm: Switch to fdinfo helper
Date: Mon, 15 May 2023 07:30:10 -0700
Message-Id: <20230515143023.801167-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515143023.801167-1-robdclark@gmail.com>
References: <20230515143023.801167-1-robdclark@gmail.com>
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
index 2f2f9e42c519..467c689a95f2 100644
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
2.40.1

