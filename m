Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CBE70FB2B
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3DB10E48C;
	Wed, 24 May 2023 16:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E003810E67B;
 Wed, 24 May 2023 16:00:37 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-53482b44007so346240a12.2; 
 Wed, 24 May 2023 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684944037; x=1687536037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jm+2eVuJ9R4bEqEphmNY+ONsUg1tV+e6toSMo5kMY6k=;
 b=q1VpPZyD+nYPnYezdhRT00RybGny9C4lNkC4miOFMe4161KJ43bBPpVu95XgkMlmxL
 mX4VNz2KWsGQyqERKRIyjzfl/4ZaXfv1/GdTv8+Qk8Xa2Ir0qqa6HUJ0uBtP7ymnAlBs
 ioz7ArkMdhtQdnfnGmwU40avtqQzPNgU5GhZMKPlUfPLkY8Wcd9fqL793zMPh9XfceZi
 zPFkwlGVMNCRsRRsWGwK/RIs1QKX/AImVQ85WSwxdwJgG0eyDUTCt2MGkKQhcl8Z7byP
 sKaZmP/NMt7yyRT8guvwS3r7Cig36TA393sasu1tae77JZ6e+RFnrtSh8Dc8b1GRQuG2
 VGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944037; x=1687536037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jm+2eVuJ9R4bEqEphmNY+ONsUg1tV+e6toSMo5kMY6k=;
 b=AI0wzbIij8zX79PUKRLnnYoQDuMMFBALYsxogrotWGhP9GMsIMGHOmWCmDF6i4WxMv
 QqDn9r85DpKJok6dp0O4/hTPZRdWCKXTZgUzwmnLPUvR420mxuBZC1Dg1q3Nwisealhz
 x+9qzSa2PWklCn82Klm0YvnzRWzTSOwAc8ySCcXs1kdzpW1fWDH1AHFlmH00vokQPLm0
 vMHN2/jocQu8T+MEOG+SCztQZu1M3Plpr03pKBzjC9ZM5ZIks1lfaLPXIfw7SPwMyY0t
 MKtSBpAT32w8u9spxZRun4OF58lrcipzjXOyo+byo/qUzMELK+S24uf4qinntkOGoXjZ
 HdKg==
X-Gm-Message-State: AC+VfDyPHMrDzosZjddYDdq8XxvNfjkKBmGe6lmzdriez1owLuQeda0L
 tXOjTpID5uhW7/3au/dopt0oVOZIX4U=
X-Google-Smtp-Source: ACHHUZ5/AKM5rkM7PzF/QTY24ajzauhpViEEpLlFzZy/a838vAMr/lNMwq5NczwDPFVd7bvqBTk5yQ==
X-Received: by 2002:a17:902:a989:b0:1af:e63f:5bb1 with SMTP id
 bh9-20020a170902a98900b001afe63f5bb1mr1739595plb.7.1684944036844; 
 Wed, 24 May 2023 09:00:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a170902a38100b001ae6b4b28adsm9041318pla.130.2023.05.24.09.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:00:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/7] drm/msm: Add memory stats to fdinfo
Date: Wed, 24 May 2023 08:59:36 -0700
Message-Id: <20230524155956.382440-7-robdclark@gmail.com>
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

Use the new helper to export stats about memory usage.

v2: Drop unintended hunk
v3: Rebase

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Acked-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  2 ++
 drivers/gpu/drm/msm/msm_gem.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 02fd6093f9b0..58264ff2c4b1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1059,20 +1059,22 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 
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
index db6c4e281d75..c32264234ea1 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1089,34 +1089,49 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
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
2.40.1

