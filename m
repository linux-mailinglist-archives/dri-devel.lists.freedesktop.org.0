Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FF282D10
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903E889F47;
	Sun,  4 Oct 2020 19:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D83F89F3B;
 Sun,  4 Oct 2020 19:21:27 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id n14so5086123pff.6;
 Sun, 04 Oct 2020 12:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEBEzHX4FK8oW5uL67k1FNFvzQH83mQw0CZJtsDsaKw=;
 b=Hzjye1b980xxUdFLsacO7q0N6hoEnDM3nQWNzKYMilrw33DARbC/5FepZSqAxq7Ki3
 i/UmpWsE8CXF9AY7kWKEoCCO4QCkygaK5mhPGW+Aqe8br15sDIbcTv1+iW3fr8gfHPeV
 oP9ASgE5PqY7PLNOVJf+GGDVy+IugIVkJG7wEb3jFMoxbgdnZk9uX4Nh+3CdsYHoh/dh
 u/PgrmuHq1QbLebRAb5UV76b8RRALp74tIeM7cAUDgwo06Nwd1mwT8wZyk4XvoD1b9q/
 19ZpBMJPMOY+Y/n5MyDn6nIdpK1vP69bMDY2yE+zUgM82IiGYMuPyRPSfM7JWfJggrS/
 TvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEBEzHX4FK8oW5uL67k1FNFvzQH83mQw0CZJtsDsaKw=;
 b=Cq6H71+6kqM0OFDMkY1NdAmaKx5SfjIXJBA4Gc/T+BmMlkDch/9WwYoI1wFlDAljop
 bWU+XbF2pUNTfcm8gW0zffrwaQ6V91A0Xjv5/rZvsO09t+7p4wVWb1om+G+Tepub1vnA
 h/9gTxFIThTwTHLMwE7NZeiUJ4yvShyflPjVF5GaSD9TFCnpZVhoWMp5FeElIrBQBStX
 F9P5xqDCvaebFbwbFilCQU2IMZPTNkXl9Xs4TFucVbZ2yeyxX5KVh3kvSTdYgQu/20sv
 1k7kT/2GPrSGcv6fukUapHoYFW0rI7rMifdKRsxAR7OkU6VCoR+pEhMEyX4JRSA6lSFT
 eiHQ==
X-Gm-Message-State: AOAM531pgDokKUcbRI62wSuYjEKIgyuUIQml+hemNmU/EntU0w9cxPga
 KfyAlO4GShKuv35rcNPmmL//3EmVs4g+q2SL
X-Google-Smtp-Source: ABdhPJxEXUizQpJydRPL5ncBxX0cny9DJU36ltWrqRo5u/wcFIoY6p7FzGE8l3EOH6JuFvZ6fqAecw==
X-Received: by 2002:a62:dd02:0:b029:142:2501:398c with SMTP id
 w2-20020a62dd020000b02901422501398cmr12607535pff.81.1601839286605; 
 Sun, 04 Oct 2020 12:21:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q66sm5106416pfc.109.2020.10.04.12.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/14] drm/msm: Remove obj->gpu
Date: Sun,  4 Oct 2020 12:21:40 -0700
Message-Id: <20201004192152.3298573-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It cannot be atomically updated with obj->active_count, and the only
purpose is a useless WARN_ON() (which becomes a buggy WARN_ON() once
retire_submits() is not serialized with incoming submits via
struct_mutex)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 --
 drivers/gpu/drm/msm/msm_gem.h | 1 -
 drivers/gpu/drm/msm/msm_gpu.c | 5 -----
 3 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b04ed8b52f9d..c52a3969e60b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -753,7 +753,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = gpu;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 		mutex_unlock(&priv->mm_lock);
@@ -769,7 +768,6 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 
 	if (!atomic_dec_return(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = NULL;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
 		mutex_unlock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index e05b1530aca6..61147bd96b06 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -64,7 +64,6 @@ struct msm_gem_object {
 	 *
 	 */
 	struct list_head mm_list;
-	struct msm_gpu *gpu;     /* non-null if active */
 
 	/* Transiently in the process of submit ioctl, objects associated
 	 * with the submit are on submit->bo_list.. this only lasts for
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fd3fc6f36ab1..c9ff19a75169 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -800,11 +800,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		struct drm_gem_object *drm_obj = &msm_obj->base;
 		uint64_t iova;
 
-		/* can't happen yet.. but when we add 2d support we'll have
-		 * to deal w/ cross-ring synchronization:
-		 */
-		WARN_ON(is_active(msm_obj) && (msm_obj->gpu != gpu));
-
 		/* submit takes a reference to the bo and iova until retired: */
 		drm_gem_object_get(&msm_obj->base);
 		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
