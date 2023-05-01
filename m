Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E56F360E
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496D110E427;
	Mon,  1 May 2023 18:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F7D10E327;
 Mon,  1 May 2023 18:45:22 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-63b7096e2e4so2197390b3a.2; 
 Mon, 01 May 2023 11:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682966721; x=1685558721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txqLAX2ZeHUuYfn7+/gjt1ln/mVXpEI+QLx8SJDIN6g=;
 b=f4LGwvAuK/XoawhvaLRsbVd1xHVXJgaE/ouTNYpKVg8zlmvLXVogFG4Yovwb42Qd57
 ujUvo6+nHg//g4U/jxpAh6eSa/qUfyQwZzjNDXTq1XKnvYCLKc4TKA079BDU7kMxPicO
 yzSk78ao4uAY7b2Xh4rY9awJtE0qXX5TRTvzjc0DEbheXcUVEgpKMmZ4xvdUTPkMepwm
 kBKUG8/qE28kz6tSUv/M/IgDPCZ63kD0OOhfgOdkEbjqaGO1b4joKsXE7mxC9PzZMBXv
 LT9v+hEzfTtEN5JKmvtXRG0KdmICx+5h+4MiaZ9vPFPH19dG91BOf7wK/32zlYVlwWNu
 UWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966721; x=1685558721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=txqLAX2ZeHUuYfn7+/gjt1ln/mVXpEI+QLx8SJDIN6g=;
 b=hPAhM0Npdy+jUW/OUaPoiQw6kWc0IWMURHZuS1donVOVv1TNZKo2w892StksKuRuq5
 6e++EfJkZyAVjzgyKlHIK2Jh6VRk1FXAFBmix+b6s5oE2y4Bs/Oc9jpGwLlt5pkbl64X
 yZTdZIOnblShyJksVlYBOuu/OD9p4dKyCPainO0RlZs/88LrRXRVJI2tp+9hpuKJP7wz
 WMqL1N26GdBBvDJ18fDFd8ZWKiYvSRn8h0JUa9v3Mw1zoDQ532OssHZUvBxmz993/YnG
 LG18op2ZYn1C4cMmc8qK23pUgPZIqD8vW83AbQSdZ0szBakzNYe3WS2WG49rPcWpMTbP
 1gRA==
X-Gm-Message-State: AC+VfDz1unLL/tjoBbrzS2zMzUZjVd/BLllQWiR9ee29i433XoklMQDd
 sxzMDXmNcUFT+a81ShS0y0l7Ef7WXxU=
X-Google-Smtp-Source: ACHHUZ5ufftVV8BZl4Vx8rWA4zRjQDkDsiNR5Pk+vNtG9t2sDNjTIzPdswaBLma6goGyfFkSJ5n99w==
X-Received: by 2002:a05:6a00:2485:b0:641:4d30:7922 with SMTP id
 c5-20020a056a00248500b006414d307922mr10351853pfv.4.1682966721437; 
 Mon, 01 May 2023 11:45:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 c192-20020a621cc9000000b0063d44634d8csm20199690pfc.71.2023.05.01.11.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 11:45:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/9] drm/msm: Add memory stats to fdinfo
Date: Mon,  1 May 2023 11:44:52 -0700
Message-Id: <20230501184502.1620335-7-robdclark@gmail.com>
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

Use the new helper to export stats about memory usage.

v2: Drop unintended hunk
v3: Rebase

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  2 ++
 drivers/gpu/drm/msm/msm_gem.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1e941aa77609..81a1371c0307 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1045,20 +1045,22 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_device *dev = file->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
 	if (!priv->gpu)
 		return;
 
 	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
+
+	drm_show_memory_stats(p, file);
 }
 
 static const struct file_operations fops = {
 	.owner = THIS_MODULE,
 	DRM_GEM_FOPS,
 	.show_fdinfo = drm_show_fdinfo,
 };
 
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index cd39b9d8abdb..20cfd86d2b32 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1083,34 +1083,49 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		msm_gem_object_set_name(obj, "%s", name);
 
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
 	drm_gem_object_put(obj);
 
 	return ret;
 }
 
+static enum drm_gem_object_status msm_gem_status(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	enum drm_gem_object_status status = 0;
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
 static const struct vm_operations_struct vm_ops = {
 	.fault = msm_gem_fault,
 	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
 };
 
 static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
 	.vmap = msm_gem_prime_vmap,
 	.vunmap = msm_gem_prime_vunmap,
 	.mmap = msm_gem_object_mmap,
+	.status = msm_gem_status,
 	.vm_ops = &vm_ops,
 };
 
 static int msm_gem_new_impl(struct drm_device *dev,
 		uint32_t size, uint32_t flags,
 		struct drm_gem_object **obj)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 
-- 
2.39.2

