Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F129750E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BE36F8F4;
	Fri, 23 Oct 2020 16:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE5E6F8FF;
 Fri, 23 Oct 2020 16:50:56 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id r10so1220770plx.3;
 Fri, 23 Oct 2020 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Df41UALTBav1hw0+WsIt5rNabe6ifDpe4GxP6jKIpnQ=;
 b=DMTsSiYJK25SGd/0+1hIyuxSfglDtzT9Hkhj/i/mQWML3GxA41gGn7MWti3yhltgdp
 3WKCth+stns7x8gcM/2vkx5Ma8KYb69VIwWUJboD6znalztOJMBNstPI7VqO3t5/6ZSi
 lDZghHso4lJJS/fzeTuRGhK9zp8GUJ8hVa5vu1M+pYsZzP6SzKHUvcSh5uxNqwC86MhC
 uZDYTLbpMBNtcLaNYzVhUFrQg4udllwyN0Zg38GVe8mI5XcOSHoU9Z6aQASMsyoxCgFk
 O/UjpkAGM7goFs2v2VpxePXXGty3j2p5COhddrlA2sp2lsCFOsYXAgD45qeaM8wGTt//
 3qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Df41UALTBav1hw0+WsIt5rNabe6ifDpe4GxP6jKIpnQ=;
 b=IP+ewGRQ8eEkKBD9YtxeJt1bZrr3BN3NCVG58p73vVNcK7Tlw/YjklzfR9x2Tjx5T6
 h2YLSNWfjatLBEUoP1B+dOP7DX3nzdI3Jm8HxhQM9f2R/p66qxY9+QDbkhqbqaBaXAJ7
 OlEMgYWxNKFX7wqbMI9dEI1/3K+ujmkEj4iT2C+zYuOP2ay0z/PGAS88KG+nr4O+1fH9
 wenyVCkkbd066+H0gR/uPpEF1PYc09csCh0gW72Jm7cksb+zgwfXsmhf7hnVxLN4pIRG
 tvPtq5wGD/w+DBSUXWInZ4ovIXM+QEBkXAH2vhoWH2F14Yc0yvabjr78zHxizg2Wv8C/
 F+/g==
X-Gm-Message-State: AOAM532HtnRGzXWhMa1vI/fHPtZGHldX8j4Od/66k6a7tF0RRo0U+c5D
 pWxFtwBl7b2HBts4r6DAIk/I9gKFsPlYFg==
X-Google-Smtp-Source: ABdhPJwacuI4x3hfJSueVi7qQmkhVY3B1dqPHxRyOQifYIc3coSseB3KJNP3ta+ecucFUC9MjAfAFA==
X-Received: by 2002:a17:902:b945:b029:d5:f385:237e with SMTP id
 h5-20020a170902b945b02900d5f385237emr3183603pls.84.1603471855522; 
 Fri, 23 Oct 2020 09:50:55 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n12sm3100042pjt.16.2020.10.23.09.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:54 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 18/23] drm/msm: Drop struct_mutex from the retire path
Date: Fri, 23 Oct 2020 09:51:19 -0700
Message-Id: <20201023165136.561680-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that we are not relying on dev->struct_mutex to protect the
ring->submits lists, drop the struct_mutex lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
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
