Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE054292FDF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6146EACE;
	Mon, 19 Oct 2020 20:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1140E6EA7D;
 Mon, 19 Oct 2020 20:46:14 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 10so681536pfp.5;
 Mon, 19 Oct 2020 13:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DjvKpJElljP1CGKDtyawiR3HJwFiK2kIC8fsb2FEuqQ=;
 b=OidWH+e5WlxD+T+8SIqVgzIV0i57nSDWJzr8VsRClLS9yF3wX3zBj1yfnQp7tmCcPb
 1zse+ri+TKCix/FWRIeuSFDzhusItfK4B0cc8xH/bet7cUNNzMGcHWvIbBC2I9bC2QB9
 uT/3O55E+w4b/BEVAU3YaoE1kN0spOpIELIuhKL/EUYGACTtShBjQLu+kvKNEVGWA9Ug
 hxuUOXrlidD47Ixp2+g8lZ266tUI+Nly9/OSeA4xM4y3KpW4a7ms5Z9jHOaRlLyzKn5d
 yPbyZws1wS0dcj+imFZSta+mXIn/uwqraMBdKbaB2mxguT04kh0AHY/FzqYD2lWSvs3y
 Mejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjvKpJElljP1CGKDtyawiR3HJwFiK2kIC8fsb2FEuqQ=;
 b=Ok8Zx+aBJrUFzMDoV8CMZsZX1I11rQWXURDD5MyTH5TTX6nVfTXpOHEaJFrIh0dKBe
 plw723d8IOlUTfoXLsbdQsXtljRQmoPOnc++25H/2+biJXDJ3ytwzZldE2Idlc1BM7bP
 AjxFAmXeeVHXGj7cYvceXJA5lWRZr7nuz3E1PcPXIzaZ4cC+UVQfRisIKyWy2zo96gbs
 NQuF7VyeJNX2+CRCHHEDGxbAGsCuMqbEV6qYG7YNSYGAUp22uJYMeURUeSk9fzFXXkQr
 MT8TpNS7zeVH//jND1D3fXifi/RlV/hVziF5Z0/h0IRqJbBAkls/VeNhUSH1m/4DGLyZ
 M+PQ==
X-Gm-Message-State: AOAM5314cq91Xc0xqOmYGAy6J2l+w+YOyw1RqFMJo5y0AJlPPHrz4WrA
 gNfizZNSAbYCN2MZJW58QG3csh52kmBppg==
X-Google-Smtp-Source: ABdhPJy4A2xGRFyNaIiOmsSayiLrZ8+3WMkfP8VzoC7DsZ27VqqF4SvAljhJDjshN/gS2YxPj4quHg==
X-Received: by 2002:a63:370f:: with SMTP id e15mr1360758pga.124.1603140373089; 
 Mon, 19 Oct 2020 13:46:13 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y10sm612527pff.119.2020.10.19.13.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:46:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 18/23] drm/msm: Drop struct_mutex from the retire path
Date: Mon, 19 Oct 2020 13:46:19 -0700
Message-Id: <20201019204636.139997-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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

Now that we are not relying on dev->struct_mutex to protect the
ring->submits lists, drop the struct_mutex lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d0f625112a97..30ba3beaad0a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -717,7 +717,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 		msm_gem_active_put(&msm_obj->base);
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
-		drm_gem_object_put_locked(&msm_obj->base);
+		drm_gem_object_put(&msm_obj->base);
 	}
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
@@ -732,11 +732,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 static void retire_submits(struct msm_gpu *gpu)
 {
-	struct drm_device *dev = gpu->dev;
 	int i;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* Retire the commits starting with highest priority */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -766,15 +763,12 @@ static void retire_submits(struct msm_gpu *gpu)
 static void retire_worker(struct work_struct *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, retire_work);
-	struct drm_device *dev = gpu->dev;
 	int i;
 
 	for (i = 0; i < gpu->nr_rings; i++)
 		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
 
-	mutex_lock(&dev->struct_mutex);
 	retire_submits(gpu);
-	mutex_unlock(&dev->struct_mutex);
 }
 
 /* call from irq handler to schedule work to retire bo's */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
