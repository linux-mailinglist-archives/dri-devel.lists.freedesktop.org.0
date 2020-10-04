Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB4282D12
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0386D89F55;
	Sun,  4 Oct 2020 19:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4558789F47;
 Sun,  4 Oct 2020 19:21:29 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y14so1832755pfp.13;
 Sun, 04 Oct 2020 12:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQDv9qIxfo9dLvFA8eAM/RvSpOEqDt7DqCgJQnSkF2g=;
 b=cwzFQmZfAdfXp0bNqEXXYtFrzbDUEWHIcvy2jgZDLsdLVzHxLNY0pi0IRZ9cnwwS5A
 SZ7h3np2ofACQq1T28kFs6VRsonTnhAoPtW+/BY2X2qfZ2gkLvdRfZuDe77h1qSUkwPm
 jMm7Lk/tbqF59ZFnWHPsMUAEVdpWV7WjujveCj9odqxixbhkvjcRg+Pft5q0CfHKyo/x
 mkAqDeP0KKLLjwszFhXfhbUeqaIl12cUq2A51Zxs6AUytjWts1KAYtAG5Widp45CBnir
 FOB2G0rHii338QzygGN28F4iFavxqBRY13F5ZAnevNQs9GTTVwOvN2HlI677T17RUMEx
 1i0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQDv9qIxfo9dLvFA8eAM/RvSpOEqDt7DqCgJQnSkF2g=;
 b=JEE0MOPpxuDJW9CiLj0re+p3+b6BkkMXzaZwsuCCyl1+uyL3G6BfTzYhrWEiGSDthx
 S7AMR29xi2qde+d7eAo02tDbL5/dLNkogLVe9eblMuVgARy/XpkqlPIYi3iEjmDyc1rz
 UdYoNbG6E3moNEhaWeMNxeD9rM0vbbttwaY5RA318unJPfCIvmswToxBn63T4cai6qUw
 ttziCD//iUDTwkkrAUpnbwfW7Bu8u9xqBm/jYoMJxZ0pYLXbHfBkYwPFcPwFewvCT5Zc
 3jB3Je0ORjnpHGrpDLpdMxBq6kPuPYhCa/VbBFtCKA44Ts2bQJ3MWzyp8jCbmoFXmRNw
 0sNQ==
X-Gm-Message-State: AOAM533hSmhq5Wx0TJZv0NvXMCZGEqg6XTsvwDhAnSDPUa++NNnPon3f
 4m2lX+ZOcUs0G9jBRkGPhXFXkxdMxx5LDAF+
X-Google-Smtp-Source: ABdhPJw3vlcyj1RE09j9A4+U3ke0Uu7ufkZiGJqKrFh6RUJK5jwfMyQdxSzvx3K3DZdmxPpEpzKjKQ==
X-Received: by 2002:a63:140e:: with SMTP id u14mr10479449pgl.91.1601839288416; 
 Sun, 04 Oct 2020 12:21:28 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 ie13sm8103315pjb.5.2020.10.04.12.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/14] drm/msm: Drop struct_mutex from the retire path
Date: Sun,  4 Oct 2020 12:21:41 -0700
Message-Id: <20201004192152.3298573-10-robdclark@gmail.com>
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

Now that we are not relying on dev->struct_mutex to protect the
ring->submits lists, drop the struct_mutex lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c9ff19a75169..5e351d1c00e9 100644
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
