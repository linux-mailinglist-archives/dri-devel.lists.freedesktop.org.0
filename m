Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1374B70FB23
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97BF10E5B1;
	Wed, 24 May 2023 16:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B9A10E583;
 Wed, 24 May 2023 16:00:17 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ae3ed1b08eso4270465ad.0; 
 Wed, 24 May 2023 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684944017; x=1687536017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZdffD1rbmzqNwR9ysIIe02HLLzxNGaBoHLlHROGv/g=;
 b=Lr/1jT6n8l1wbPqAqWhMiQRhI6C6gqZlwmYElMzq3VCGGrIBhTCYH1fkG+SFK/cALY
 lG59mSrbKE+CTFADfy8folwN8YsbdrvBSxsNt+0qu0JBkta70l5Xdzc+drKUHNVErqLF
 Zz4bxqw6wRlNxkG09h1w4oD4iZo25Hd7O/38LHooqpDz0LOE+35F5v4G0GZcNa4+6ksL
 rDPWVW5Td9Dkyw5Fhza9RHZvyhEiv2qwwfeHFVLUO0l1MqcpjB9diguzsduFp9oDX0/5
 XkPXI6C1tEy3U/WYiw4NgpfRyowtvRjjH8Mp6GguV/WUfzAy+nibovNX2vJnMWrtD+v9
 6SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944017; x=1687536017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZdffD1rbmzqNwR9ysIIe02HLLzxNGaBoHLlHROGv/g=;
 b=TInyzRUyFkO4NW8pP89A76gmzoB7N9dCtpJNaZx9vK0GspVB7nOOsFaeQbEmEz1U7K
 +Lso+1cEmZ21nYKPawVcMb7Wbw4sb5lKQ5iGC6Tgj+QnYfu6hkCCyGmEkbEyFdP3NUiR
 2EjuHjCQqbejABj1yu/yigggb1LNKbJ3dfyaQt4VUfpxxjJLU5/8XTfvHHi1bcJ1i7Re
 GJjJqgVvaO5aYkTp8ohnMNHitTH2D1sD59XWCXboa5K+2XO6nIzgUWtkE1H9ByIrnGwW
 m/JPJqstq2bDxgF1TjwkgBhJzmCCmD3xpc5PHCPlnVjTu76mniGwEe5RoyH63gS+f4Bl
 Yr+A==
X-Gm-Message-State: AC+VfDx0ad1F+d7jeLNkjmd7eRDE4bmERwWgHV3F79ImjUP+giB1E8PU
 kyPGwUFImZruNcZzIgtmhCMSkQHQXy0=
X-Google-Smtp-Source: ACHHUZ5b/PXeIbi81JP2M0rufyrxO74igPjls7nP2EP/NzkiZARbH215dXzrWXuI4QDdzWnY7iSH/Q==
X-Received: by 2002:a17:902:e74f:b0:1af:ccc9:ce4a with SMTP id
 p15-20020a170902e74f00b001afccc9ce4amr6603942plf.25.1684944017044; 
 Wed, 24 May 2023 09:00:17 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902c21300b001ae626afed4sm8933758pll.220.2023.05.24.09.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:00:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/7] drm/msm: Switch to fdinfo helper
Date: Wed, 24 May 2023 08:59:33 -0700
Message-Id: <20230524155956.382440-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155956.382440-1-robdclark@gmail.com>
References: <20230524155956.382440-1-robdclark@gmail.com>
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
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that we have a common helper, use it.

v2: Rebase on drm-misc-next

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
 drivers/gpu/drm/msm/msm_gpu.c |  2 --
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 060c7689a739..02fd6093f9b0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1050,56 +1050,55 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
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
index 26ebda40be4f..c403912d13ab 100644
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

