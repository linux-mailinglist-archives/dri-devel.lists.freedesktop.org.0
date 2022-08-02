Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B30587F68
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E5F12AA82;
	Tue,  2 Aug 2022 15:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBB89048D;
 Tue,  2 Aug 2022 15:51:29 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id u133so7274886pfc.10;
 Tue, 02 Aug 2022 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6E5wGlWgwtmRN55cq/vUaSJZuL1NyuRgvoYtJGWwhUY=;
 b=GEfOJB7gdA4SxlaauM6Ugt1tZF4JKhQxQH244oEQIqhh9LV1XJGzasRjPRwFOhk6nj
 LqCY2Zm8HojS7Ghpd7BFD0y/3AEM4H/VSjoCC7jnTy5WxAZF4Cis+szcEaa3F0BtcWaQ
 OEgtEdaN7O56vF8AlFJTMSQ70vMFGNsQpwIfD0E1IK2s8rLZwRFXNm6iFW5CfwrN72LX
 bxegJs1R/Myor9Wf2/nRrbu5F5Cj3JEI9p3qBIL38QLw56hBPFlHBSy3rKEQTflMdgXn
 6xoFT/4AAos4XOP2Vc0dT+/Xa2uSn43q5vGyGQClCkgeFbcxV2t3ev+fOYpno61xx7eH
 i5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6E5wGlWgwtmRN55cq/vUaSJZuL1NyuRgvoYtJGWwhUY=;
 b=7uUaSGqipWn2MpSnAXC7oJ37vd6lE/YaMx2+yaDUxMp+FErotqLaPAGhmfgHcfEL8T
 f2UGXltt7XXmUwunQPePCvYsmhUfqIs1jVDgTzgUek7beNPEK1PAUVsV3uylp7sxO15z
 /NnLXNQVgAnwJKoJ5Cm5BTkG4okWkGLCGQOaI/Dq9QoAZejbZpxrC94HQ+h33i/Fi2gM
 VDTO5gxrI4f1tiVjMhfGD7x41nG6wRZzU2XxoegX0JJBKZ53eg6BL4g4RTdWQFWv2lUe
 /SwwSucmPE8Hqwf9xsOn/KbdBxDrr1WrafFQgpRzfrM9Ea5dHfSkje+AoStZ27g0/V97
 YY3A==
X-Gm-Message-State: ACgBeo2nURKo2v7udYAA11fdyYZdmbIhbEIdymJRnELYOe5GVQO99jw4
 0lHZDvnHs4Ahvy9oxZCLbmAMj/ODDVk=
X-Google-Smtp-Source: AA6agR5hyY6tEw30Evo0Mcd6KS/1UZLdeHQ2xVV06qRPr03qk2v+YkINNRhwe6EVTfVeOpSWQkvuWw==
X-Received: by 2002:a63:448:0:b0:41b:b3a6:c005 with SMTP id
 69-20020a630448000000b0041bb3a6c005mr14712235pge.201.1659455488843; 
 Tue, 02 Aug 2022 08:51:28 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 c189-20020a624ec6000000b0052b6ed5ca40sm4871314pfb.192.2022.08.02.08.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/15] drm/msm/gem: Check for active in shrinker path
Date: Tue,  2 Aug 2022 08:51:37 -0700
Message-Id: <20220802155152.1727594-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220802155152.1727594-1-robdclark@gmail.com>
References: <20220802155152.1727594-1-robdclark@gmail.com>
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

Currently in our shrinker path we shouldn't be encountering anything
that is active, but this will change in subsequent patches.  So check
if there are unsignaled fences.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gem.h          |  1 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 8ddbd2e001d4..b55d252aef17 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -870,6 +870,16 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 	mutex_unlock(&priv->mm_lock);
 }
 
+bool msm_gem_active(struct drm_gem_object *obj)
+{
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+
+	if (to_msm_bo(obj)->pin_count)
+		return true;
+
+	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+}
+
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 {
 	bool write = !!(op & MSM_PREP_WRITE);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 432032ad4aed..0ab0dc4f8c25 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -173,6 +173,7 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj);
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
 void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
 void msm_gem_active_put(struct drm_gem_object *obj);
+bool msm_gem_active(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 6e39d959b9f0..ea8ed74982c1 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -43,6 +43,9 @@ purge(struct msm_gem_object *msm_obj)
 	if (!is_purgeable(msm_obj))
 		return false;
 
+	if (msm_gem_active(&msm_obj->base))
+		return false;
+
 	/*
 	 * This will move the obj out of still_in_list to
 	 * the purged list
@@ -58,6 +61,9 @@ evict(struct msm_gem_object *msm_obj)
 	if (is_unevictable(msm_obj))
 		return false;
 
+	if (msm_gem_active(&msm_obj->base))
+		return false;
+
 	msm_gem_evict(&msm_obj->base);
 
 	return true;
-- 
2.36.1

