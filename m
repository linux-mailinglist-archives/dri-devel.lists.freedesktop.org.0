Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E866DA51E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 23:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F8510ED39;
	Thu,  6 Apr 2023 21:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B297210ECDD;
 Thu,  6 Apr 2023 21:59:36 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id o11so38714497ple.1;
 Thu, 06 Apr 2023 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680818376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMDj3adSFOes8c4RulM+RRmxsL0r8xM8YpSu25MRY/M=;
 b=Yblq2nHitw7vSa46fVeSrpQOC+mlt7hYVYKAGPAn2GTbTSQiKY8IKr3X9ouFCF1UFY
 OUf3cV9cnqyTMflhMlkMNrdtb7CsoeMq5ta2Fj7uXcBrviyfhAaQwdYCFdedqd8djI4I
 trOoXFizmsKbxPg0bHdszRKgXVTmFnuwe2tWAqUm22P5wKuMzLPb7mHZksKrkdbRCmon
 H4mARk40fEFRDleMlCPqRS89F2as1UviHP1ZzGOfCWDM1RiiF3/DZm4k2shK3MMwiNSS
 KIWP7HpbXbELJugRn82UV+Srv6QURGPS842GBePZRfoLS6q9mlcZS54AvuoEJxe1UGDY
 we1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680818376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HMDj3adSFOes8c4RulM+RRmxsL0r8xM8YpSu25MRY/M=;
 b=QsUvoigXR6LZk4D3vwLRXs5NbVtOWz2b1W5DqBgTJEgLi3ktdcw1wCp1dFEFhs+8rr
 Gqjeu4UZelvGatxDUErepLVHrqXeYwgDt0OUSG9TeGjAm3xKJiJPyXPG8S39flw2lZ39
 kaAIbeB8JpMq09rvf9G1Nn/U6K/TLqljab+LM57qdJWEXGokYf4ZGznEcbcDBObqJBZI
 8MOgPv1yLgQRoFXxkShZonOnhMdMHYyLJkPhAaJ8FaYERZCSbD229b1TraIUnM2IQs6e
 z3oeL1Bny6uyaJeLniBscEPENBVY/vqR38N7G1rtK57kS3dYpiZb6r8uRhPHQkjw8zhZ
 GFkw==
X-Gm-Message-State: AAQBX9ezZzBdKzG3Y7/8QVZTL2DYOMtQjYzJXOec49EGBt5tuW0Hme24
 S2amO7tJp//4kift7P2gudT4Ac2FbKY=
X-Google-Smtp-Source: AKy350bJFPhkA5oP8PFqWPtRwZB24Y6FtqcHMt/vUTEJBVqnYj1Y/hGGiH6gg3cmocGVhKR+qnDcGQ==
X-Received: by 2002:a17:90b:1810:b0:237:752f:1af0 with SMTP id
 lw16-20020a17090b181000b00237752f1af0mr52603pjb.29.1680818375761; 
 Thu, 06 Apr 2023 14:59:35 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a17090a024f00b00244b6899ce5sm19034pje.3.2023.04.06.14.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 14:59:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 2/2] drm/msm: Add memory stats to fdinfo
Date: Thu,  6 Apr 2023 14:59:17 -0700
Message-Id: <20230406215917.1475704-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406215917.1475704-1-robdclark@gmail.com>
References: <20230406215917.1475704-1-robdclark@gmail.com>
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
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Use the new helper to export stats about memory usage.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c |  2 --
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b6f17b1261f..385776f6a531 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1043,17 +1043,40 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
 };
 
+enum drm_gem_object_status gem_status(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	enum drm_gem_object_status status = 0;
+
+	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
+		status |= DRM_GEM_OBJECT_ACTIVE;
+
+	if (msm_obj->pages)
+		status |= DRM_GEM_OBJECT_RESIDENT;
+
+	if (msm_obj->madv == MSM_MADV_DONTNEED)
+		status |= DRM_GEM_OBJECT_PURGEABLE;
+
+	return status;
+}
+
 static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
 {
 	struct drm_file *file = f->private_data;
 	struct drm_device *dev = file->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_file_private *ctx = file->driver_priv;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	if (!priv->gpu)
 		return;
 
-	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
+	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
+	drm_printf(&p, "drm-client-id:\t%u\n", ctx->seqno);
+
+	msm_gpu_show_fdinfo(priv->gpu, ctx, &p);
+
+	drm_print_memory_stats(file, &p, gem_status);
 }
 
 static const struct file_operations fops = {
@@ -1067,6 +1090,7 @@ static const struct drm_driver msm_driver = {
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
+				DRIVER_SYNCOBJ_TIMELINE |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose           = msm_postclose,
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

