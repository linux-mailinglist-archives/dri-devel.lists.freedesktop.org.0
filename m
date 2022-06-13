Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706CE549DF6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 21:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6F910F396;
	Mon, 13 Jun 2022 19:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF5710F396;
 Mon, 13 Jun 2022 19:46:14 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id gd1so6569674pjb.2;
 Mon, 13 Jun 2022 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8PJJNUcJj53ev3AqJRn3xVtb+ZpTb0J1fJRS/I1pZqo=;
 b=j/Xl5g9NFS0JUQC69FXYr+svQcCT14l0bivAxI2nyR+X8FM6UQZKcoEoVsihPU7lWO
 i19+z9tQemZeYruJR5ghpoevoYa3r7x8g0nl3neKATakG/axZF+CQjn/qn2PI4lSotee
 KYczE/L1R/e483aBjj2+BU4xanG3sJNL7fWdDHp5OFltj46W7ATvG74EoiTBroqErfDi
 W1C0Z95EMYGO94zakXZqcFOTKs/AMONEiRpxMGTKDr2S1YSPOWjBlMgE24ZNe/8TOjZI
 H5P5vzZJqzaiaRsSaUyFu0QeMK7GW/Gbv1uEjmS858q+Y/E1Nz88iDCZ3IzUta4UvgAX
 FBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8PJJNUcJj53ev3AqJRn3xVtb+ZpTb0J1fJRS/I1pZqo=;
 b=IJoZDeFs/wK1H0drcjRQgOX1xWNeztHQt0lGqztprVBVpP0iHpVHLt0JLdE/TaKyMH
 Vs2BsTcz2fs5tYFk/oxq+xBhMtE6PpX+FNU+/5xS2F3iD8EMiV560htVip6sDP7uXjwm
 JMcHwuoyFSbu5RtUelCeriEH6UtFAosaYalgUN3ZWzTBLbKtnyko5QGdapwlxRt0mOFi
 AzSvHgv5lrhZywRzUI4CBvtuaf4jlDxkPVxcf+6UeMVj/2PYkDKxC2ZmDXNd8A+Z0nDw
 No7395HW0M2iODUIlW5y+FfE6+6DyEi7fnq8Kzyn2WOMUgH9hfgdeN78Uksq/DIGmkQD
 I4/w==
X-Gm-Message-State: AOAM530pbaOJNGVbqw+KHbQQPFAcEC0BFAo4G4KfsJA343wZQYlvDLlE
 pBeSDvR6JhjG9wHUUXC0fRbsDMOrTmk=
X-Google-Smtp-Source: AGRyM1thfR5WcCUpEKNj9m6vRAIv50Kk1vGSAieTTtgXiETCAqb603bEsvDIQhWxcu3vrC8MEVnyoA==
X-Received: by 2002:a17:903:2c2:b0:168:e323:d471 with SMTP id
 s2-20020a17090302c200b00168e323d471mr667931plk.147.1655149573799; 
 Mon, 13 Jun 2022 12:46:13 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 jj18-20020a170903049200b0015ee24acf38sm5474487plb.212.2022.06.13.12.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 12:46:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Deprecate MSM_BO_UNCACHED harder
Date: Mon, 13 Jun 2022 12:46:23 -0700
Message-Id: <20220613194623.2588353-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Handle the demotion to MSM_BO_WC at the userspace ABI level, and fix
the remaining internal MSM_BO_UNCACHED user.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_gem.c |  7 +++----
 drivers/gpu/drm/msm/msm_gpu.c |  2 +-
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 57a66093e671..acc940d32ab4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -633,12 +633,25 @@ static int msm_ioctl_gem_new(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
 	struct drm_msm_gem_new *args = data;
+	uint32_t flags = args->flags;
 
 	if (args->flags & ~MSM_BO_FLAGS) {
 		DRM_ERROR("invalid flags: %08x\n", args->flags);
 		return -EINVAL;
 	}
 
+	/*
+	 * Uncached CPU mappings are deprecated, as of:
+	 *
+	 * 9ef364432db4 ("drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)")
+	 *
+	 * So promote them to WC.
+	 */
+	if (flags & MSM_BO_UNCACHED) {
+		flags &= ~MSM_BO_CACHED;
+		flags |= MSM_BO_WC;
+	}
+
 	return msm_gem_new_handle(dev, file, args->size,
 			args->flags, &args->handle, NULL);
 }
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9a73e48a3049..35845e273d81 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -129,7 +129,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		/* For non-cached buffers, ensure the new pages are clean
 		 * because display controller, GPU, etc. are not coherent:
 		 */
-		if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
+		if (msm_obj->flags & MSM_BO_WC)
 			sync_for_device(msm_obj);
 
 		update_inactive(msm_obj);
@@ -160,7 +160,7 @@ static void put_pages(struct drm_gem_object *obj)
 			 * pages are clean because display controller,
 			 * GPU, etc. are not coherent:
 			 */
-			if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
+			if (msm_obj->flags & MSM_BO_WC)
 				sync_for_cpu(msm_obj);
 
 			sg_free_table(msm_obj->sgt);
@@ -213,7 +213,7 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
 
 static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
 {
-	if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
+	if (msm_obj->flags & MSM_BO_WC)
 		return pgprot_writecombine(prot);
 	return prot;
 }
@@ -1122,7 +1122,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	struct msm_gem_object *msm_obj;
 
 	switch (flags & MSM_BO_CACHE_MASK) {
-	case MSM_BO_UNCACHED:
 	case MSM_BO_CACHED:
 	case MSM_BO_WC:
 		break;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index f99292eaf529..e59a757578df 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -952,7 +952,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	memptrs = msm_gem_kernel_new(drm,
 		sizeof(struct msm_rbmemptrs) * nr_rings,
-		check_apriv(gpu, MSM_BO_UNCACHED), gpu->aspace, &gpu->memptrs_bo,
+		check_apriv(gpu, MSM_BO_WC), gpu->aspace, &gpu->memptrs_bo,
 		&memptrs_iova);
 
 	if (IS_ERR(memptrs)) {
-- 
2.36.1

