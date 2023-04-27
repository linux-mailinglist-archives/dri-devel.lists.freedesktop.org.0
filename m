Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABA56F0B89
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A6D10E360;
	Thu, 27 Apr 2023 17:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D1B10E24D;
 Thu, 27 Apr 2023 17:53:59 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64115eef620so6795971b3a.1; 
 Thu, 27 Apr 2023 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682618038; x=1685210038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBfxB8yEA4WhI7T5i4/ckAUY1Fu23yRgn7oYj27vnCU=;
 b=L1nF7BCZaBP86QA8Op3mSkjT2UtT+S15flbFR0f0eOTvMVCmfniMiX5dID5EGdz61P
 ieBXt1NAw2rxJgHrdwYLvYF8ntYs4uwj/nCjpgEGDfTseJ92qQ5SGsYki0aaWcyh2fyK
 G8prdb/NM5zCZStwSZi/WFKVIIR3AGA9eVpOdScXgRqb3uSpdJLJxSSElMl7cbPBDeAH
 Y1Y0nlker1Z8x5URSZwMVkAevF7c3TIg3usf5LEI/IxnihLFUOeJBclUBbdpOjzhgFsp
 lTvKPPaqKjwWiBCGAuNgFYnPNzSurCA4dhFw+DIsH2gG0WZx4gYezqrHFX7eHOlkgZzU
 zwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682618038; x=1685210038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBfxB8yEA4WhI7T5i4/ckAUY1Fu23yRgn7oYj27vnCU=;
 b=bksb4YI/+yIW1GUmCutnfpz5YNz/d9CF4SViXqX9uYfm3Q/RJwoaUDJqQGjTK5jLsJ
 1S4gek/T9uNR0KFkf/CJTGQhn7ZgRlLUD9R6uVLCVmtE/UYRyDi+3Ys28khvIhzYMLEI
 VKtrh/mQdvyvZRbbc71W8ZfKoX+FyOwbyNseTjiC1qmoDE3Pc/eEPFXLlhxSQh9ht22j
 hRR1DlzomMqllpzoe9+Nee/21NXt08BWgX6opuH2ctaGtETCbSty5i8CsxuGtFvt4bMJ
 hzTP9Lr/GQ8gsVyvIIRtbaAkPMtlrjPlmIa0Cl0PZZ9sSz5kADVLo/1YM4paDRrPcaPt
 mSmA==
X-Gm-Message-State: AC+VfDxCiejESf7Lx0JOvA8oYJ02LZ43mBJr9+wjke89EWv7xCt2KI1U
 9ACCVeCCbJeQd8xuHvz9USlL5Im6/68=
X-Google-Smtp-Source: ACHHUZ4RY8lUy/Z4Ld9c0UFYaaSoWErxG6HLfP2eNZlkE1GaZYLb1I87VbW+l/YJFqATDwzqwkRTig==
X-Received: by 2002:a17:902:d484:b0:1a9:68d2:e4ae with SMTP id
 c4-20020a170902d48400b001a968d2e4aemr8298243plg.2.1682618038445; 
 Thu, 27 Apr 2023 10:53:58 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e80d00b0019719f752c5sm1638484plg.59.2023.04.27.10.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:53:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/msm: Switch to fdinfo helper
Date: Thu, 27 Apr 2023 10:53:27 -0700
Message-Id: <20230427175340.1280952-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427175340.1280952-1-robdclark@gmail.com>
References: <20230427175340.1280952-1-robdclark@gmail.com>
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
@@ -1043,23 +1043,21 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
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
@@ -1069,7 +1067,7 @@ static const struct drm_driver msm_driver = {
 				DRIVER_MODESET |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
-	.postclose           = msm_postclose,
+	.postclose          = msm_postclose,
 	.lastclose          = drm_fb_helper_lastclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
@@ -1080,6 +1078,7 @@ static const struct drm_driver msm_driver = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
+	.show_fdinfo        = msm_show_fdinfo,
 	.ioctls             = msm_ioctls,
 	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b1647b851018..52db90e34ead 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -151,8 +151,6 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			 struct drm_printer *p)
 {
-	drm_printf(p, "drm-driver:\t%s\n", gpu->dev->driver->name);
-	drm_printf(p, "drm-client-id:\t%u\n", ctx->seqno);
 	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
 	drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
 	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
-- 
2.39.2

