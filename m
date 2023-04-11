Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4980A6DE7A4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F31410E1D6;
	Tue, 11 Apr 2023 22:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99CF10E26F;
 Tue, 11 Apr 2023 22:57:45 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 60-20020a17090a09c200b0023fcc8ce113so12565073pjo.4; 
 Tue, 11 Apr 2023 15:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681253864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wlvnl6FahWn1EEVl5XEqTBS0ldcLDlAbSv9n0bbBLA=;
 b=sSxYCJhTMTGU4c9Pr4qhDhsZfPVfOfKUG4uV1ydWafAmd0E+M5cWAblMYfH4KzE23t
 jKT3tVVNVyzQM6LeWIZGZhukwqNX21TvB7MC+Q1+WJvKoqSHuY2u8Ektt+FuXQgSNSw4
 Qv9v4YAA8Fhpf8drpjvsGwME/RWJx0dQ1oGlztFbkZ39DsDLjz9Ewo4Z9KdGHI6m5wsT
 iuiscFq4uDiVT26V7kpj4jUmbmVrBvevzvprvNog39h8+7bSmYSPApFrLrnW7yvu/54x
 7nEIVcFRP0U45V22III7fp7v7nlXx2a9nEQXgc1Qyyu5I36EDUCCZzMtAOV9eQGfj8fN
 Px1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681253864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wlvnl6FahWn1EEVl5XEqTBS0ldcLDlAbSv9n0bbBLA=;
 b=pS6atDwVWH1fe1jFieWww5nv3LncDs/fcfvCyO2CLWBaY3mToPp7/+v60AzIBuuJVL
 ziboVjX+zo/ek1AVCAmgXzv//+dteoNWayiczKq1fMC8eXHW/c5aecKFpoNe1poC60G2
 pVmxok/MO4K+xrQ37KjTLmWWbZXlU7tzBw7l7Q2kfYEnVBCSJBUP36vXGYEdancneyn1
 j72BmviYkh+FZUZkc0qev89dkRW5LC/+FGy6TCbgYwpKuzVAnCNSOztStGbmkeRX6ELA
 StIVFjhr3+x94uJQ6WZc/doRjEokESrUV6SNpz3srjjOTMmGVHUCqujwyboQltVn8xlf
 zMFg==
X-Gm-Message-State: AAQBX9ffCe6iRzTbGwS3OJw1w2JF2eUGuh/Yv6jDPlm1ylHXxR9933Qy
 dicYZgbGaqHVzTQu1gH78/G9w5xSzZc=
X-Google-Smtp-Source: AKy350aqH2UsVc7wl7kw/6JAvQjJ+lsRZo3f39HCLfgoMvhVUL96lEwXMeh+l46oB5pYB21Mvicm7w==
X-Received: by 2002:a17:902:d4d1:b0:19b:dbf7:f9ca with SMTP id
 o17-20020a170902d4d100b0019bdbf7f9camr23621397plg.0.1681253864547; 
 Tue, 11 Apr 2023 15:57:44 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1709028a8100b001a06eb43880sm10213699plo.153.2023.04.11.15.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 15:57:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/msm: Switch to fdinfo helper
Date: Tue, 11 Apr 2023 15:56:07 -0700
Message-Id: <20230411225725.2032862-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411225725.2032862-1-robdclark@gmail.com>
References: <20230411225725.2032862-1-robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
 drivers/gpu/drm/msm/msm_gpu.c |  2 --
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5a10d28de9dd..e516a3544505 100644
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
+	.show_fdinfo = drm_fop_show_fdinfo,
 };
 
 static const struct drm_driver msm_driver = {
@@ -1070,7 +1068,7 @@ static const struct drm_driver msm_driver = {
 				DRIVER_SYNCOBJ_TIMELINE |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
-	.postclose           = msm_postclose,
+	.postclose          = msm_postclose,
 	.lastclose          = drm_fb_helper_lastclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
@@ -1081,6 +1079,7 @@ static const struct drm_driver msm_driver = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
+	.show_fdinfo        = msm_show_fdinfo,
 	.ioctls             = msm_ioctls,
 	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 26ebda40be4f..c403912d13ab 100644
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

