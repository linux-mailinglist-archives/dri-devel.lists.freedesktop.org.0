Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7228ABC0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487AA6E1AA;
	Mon, 12 Oct 2020 02:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F0389FF9;
 Mon, 12 Oct 2020 02:09:28 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id y14so12795034pgf.12;
 Sun, 11 Oct 2020 19:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1sDR5wASc9ZPDU+65532Xft9syZCOfG7kJBBHeoYHbg=;
 b=qs9Kwg6vcM9brPA6GlK1ADDUgEHmOOGzqCiBb2QaNa5kkmW0jkbU3dTeogS1OfDHaZ
 QeSRR77mwxQV6UCUPmtvIaO8UhLnmZHtl7U8HY90kvy2d/bgVuI6kx0O/bD0EycyIvU0
 W9TCbQkLW34ikTZ7CnHlhcRWhQQVtiSogLFTHf7RqpAQtxtavdef5MxSCyhjCfCZk/Hs
 IpcRZK5E5o0bydx9ymSirQmPKu/RFBF6ZVYo/fnnIeGkfZtYWXmB5ztu4H+I5ghZqt8B
 u1Cabn83lwSPn8Sl/Bnz0qJjpQUNuwTqvSPHRYiRNOz1SMWBGLLek+R4/YmKI4KoA+Th
 L9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1sDR5wASc9ZPDU+65532Xft9syZCOfG7kJBBHeoYHbg=;
 b=c98puwzJp7X0QDznGtj4zLQxgK2Lq9wmQ65Zc7BLcLhteU1Nq1D8UzqFIQ8Q6i1F/U
 xupdTU47H8N82T7hiUNhV/UW7sdTFpt1zX0NW6MDq5tYd9DnjwYWfNgJs7RWp2ejQ6yj
 i+wh5yheGe2lyi9Alkk3AZu0bObmGUqhWMDGy3e5SCMUB72Qh/dlXilJ1MuR47NP73UN
 WcJkGk1iq1IPpGz2LtW9vYo9qyZm7g3HC3I5f/oNh95ddZYWn3nwnLEbPPQwQ/hF4NAu
 ePlVGaOYAYnU1RkwTvkpLFGkUV5SDUy2HWtm8ZVrPx+5zQHFtE3NQ+xYi1HAuLTvyAYp
 tOXQ==
X-Gm-Message-State: AOAM531FJLV/wa4q4Rj2QXntPskc8tindJKspJ7kHa/Gvj1KFU/vHSKm
 Tw3qmP3FJd91APP0xA9DK/NrQi4ReJTSpoL9
X-Google-Smtp-Source: ABdhPJwSmhu5yL3ga9OwBqL7M0FfmLC6fLlO0LI7uhSL0N+DrMYZdHT9en3D+tK808DyrOX1zSVS4w==
X-Received: by 2002:aa7:9358:0:b029:152:b349:8af8 with SMTP id
 24-20020aa793580000b0290152b3498af8mr22631648pfn.9.1602468567273; 
 Sun, 11 Oct 2020 19:09:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p6sm21597805pjd.1.2020.10.11.19.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:09:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/22] drm/msm: Remove obj->gpu
Date: Sun, 11 Oct 2020 19:09:43 -0700
Message-Id: <20201012020958.229288-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
index 15f81ed2e154..cdbbdd848fe3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -760,7 +760,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = gpu;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 		mutex_unlock(&priv->mm_lock);
@@ -776,7 +775,6 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 
 	if (!atomic_dec_return(&msm_obj->active_count)) {
 		mutex_lock(&priv->mm_lock);
-		msm_obj->gpu = NULL;
 		list_del_init(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
 		mutex_unlock(&priv->mm_lock);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 93ee73c620ed..bf5f9e94d0d3 100644
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
index 18a7948ac437..8278a4df331a 100644
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
 		msm_gem_get_and_pin_iova_locked(&msm_obj->base, submit->aspace, &iova);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
