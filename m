Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0492228ABC2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1126E20B;
	Mon, 12 Oct 2020 02:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F2E6E1E0;
 Mon, 12 Oct 2020 02:09:30 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d23so7762595pll.7;
 Sun, 11 Oct 2020 19:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ycYG7+4yZf0+EawqBCWFVGsugPtbJtT4YGGzzwI3EFY=;
 b=afbaQ4gVwtW7UpRdOzzW2yXOcH1/zUxpxTtkIMNtP7+mHx5erxv40REjWFquDcrnu7
 aKtsd7Ny1Kgeb2np5L4Tk6gVFnLei/u8KKP6szTjkLPm8/XeQtaa3yieh71HEy7UOGob
 swQDSNZWnXlbMLD6bmylhV2w0o/B7ELqBaEaCxgihbIGhDKOK2Ishd2Dwphu8fiYzYbP
 hQvPa4GZSug7CD54x8aLpJGPlJ8ZcQNht/53yGmoYcmZddTLxtzv/R/btas+my/I0xqt
 ideudZNuUUDjVtj9Bze7+Jk/rPeOITf7g8aMOGvDLZexHzZ8XybPZFa8Av/MOpTPTF45
 gGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ycYG7+4yZf0+EawqBCWFVGsugPtbJtT4YGGzzwI3EFY=;
 b=Ja2R6xko7fxor+s1PrBEvYRCFG82uQMC3mwngrCdek069jiBrAitHtAH5YQj9DwCCk
 7gPdfh+RF1WAassW13GQgm3vDHcelq+5KaGEyBq/okiBA+o6LOLSGPZYSyOZYdVmpgjp
 589u5te2ZuA5+bVYIxly0tRu89RbVGrAU0MwY1D3v+OGNvta8twQLURVyTAxur/7wtt7
 raQu4Yw7XvESIPHpYXSxNnEjvtSZwQXThgYPFiQkGX0G2IEm5nuXn7Y/BMj2eg9W+mCi
 bKfIJ3+ThaaAwBkvIZFQKj4xqGUqw+id0n0oDENOQZ6XuAX0PQxaptSuWmv1YKJVAtx0
 9irA==
X-Gm-Message-State: AOAM532vIaZYtiNbHeTzdO6Gb9DD4G8SdlGMCC5dNVnP7T/9RWdy+e6n
 8VbCaqMbsIv1AYRf49yVBz5UJdTrCe0iErt5
X-Google-Smtp-Source: ABdhPJz4Kg/jGVAqQXCBqhA6ZjgK+Nv2BP6zRV2+ijSWDL3K4XKVh1dGgPPwaINSnIHTRCVz5ZZ9lg==
X-Received: by 2002:a17:902:8307:b029:d3:89e2:7866 with SMTP id
 bd7-20020a1709028307b02900d389e27866mr21601707plb.42.1602468569792; 
 Sun, 11 Oct 2020 19:09:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 i1sm22456217pjh.52.2020.10.11.19.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:09:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/22] drm/msm: Drop struct_mutex from the retire path
Date: Sun, 11 Oct 2020 19:09:44 -0700
Message-Id: <20201012020958.229288-18-robdclark@gmail.com>
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

Now that we are not relying on dev->struct_mutex to protect the
ring->submits lists, drop the struct_mutex lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8278a4df331a..a754e84b8b5d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -707,7 +707,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 		msm_gem_active_put(&msm_obj->base);
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
-		drm_gem_object_put_locked(&msm_obj->base);
+		drm_gem_object_put(&msm_obj->base);
 	}
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
@@ -722,11 +722,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 static void retire_submits(struct msm_gpu *gpu)
 {
-	struct drm_device *dev = gpu->dev;
 	int i;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* Retire the commits starting with highest priority */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -756,15 +753,12 @@ static void retire_submits(struct msm_gpu *gpu)
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
