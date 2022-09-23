Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD25E85F5
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 00:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F7D10EB2A;
	Fri, 23 Sep 2022 22:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F7D10EB2A;
 Fri, 23 Sep 2022 22:41:11 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id a29so1420506pfk.5;
 Fri, 23 Sep 2022 15:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=oOI1w1RpGPXrz/NU70+BlU1qHXDFQzQmtw6vEH42xjs=;
 b=ndQOEMU3yBWN/RaJFUoxcBG8JODdya6truLZHSKj35iTY3iuiFdXa54rNGAcTTNLa1
 44qzi5WwzLqs/tWUW8d1Civy+XnhhcdSz0+M6JoL8QQegwhcT0AKils5mdwdkWb+HgrI
 syeSknpoFpJHmpFR8sGzFgLqvQ62EQQtHVOzLFGIh77aY1WPDrflvQ4BIN3dESJbPXyZ
 YGr4CteT+J+rJPXf0OOS/qWePukr4xrxfZ3WOPxpwDTjDrs7Xt4A4ADI/VKStbZuzagV
 g3hAI/N9vs1GLaCHaJXHzYDEUrtaS+0wuVaMLqap8AIXxVVrmzG0qMWLtOd0Sc4Y5Jld
 u40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=oOI1w1RpGPXrz/NU70+BlU1qHXDFQzQmtw6vEH42xjs=;
 b=1MSfRMMTgM0YkbMka/1r0m0/V/HwjI3bVSjNcq+CQTzQ9c5aRWmdZlmuLLr5I7EQMP
 cS1env/WTAz8tfrgYlg9ijkrfH73lQtDOR0dUeU6b4tdaVGPHiJXCC5T9wfZnkJmotdd
 0UN8zBnGNgcDte1FvOGvLJrmGvd9xi22dEWHpckkFGW7liXFcxN4k7Zv5XjELnJnQ+bj
 qQ1gDqStuENmjiB9k+LP+ngTBIhnzhcLuel9yPr6hfPoAS7ZtAqdzWbCIY6XSXPbG/v6
 +9FHd1DT1FjX6FrUcIgCnrvcWtjRZLQPBG6dUrsjmiSKlTDWW7m612ji9bv7Y0khOQyF
 M54w==
X-Gm-Message-State: ACrzQf1DmAgg4TyLZ/nY2nx7wjfVhtfHc+AnfiRwRyiJEGGbSmumeIl/
 qILA+A5YbELB1+NrZiQ8Wbs5Wn8zrB0=
X-Google-Smtp-Source: AMsMyM7iSk/g+tzazFBHrdHLO7817yrGTQYIUzyZk+Y1xplU0QyZaPrFUlaCUkO/MvnMIQubBg6jxA==
X-Received: by 2002:a63:5144:0:b0:43b:ed4b:224 with SMTP id
 r4-20020a635144000000b0043bed4b0224mr9610350pgl.594.1663972870693; 
 Fri, 23 Sep 2022 15:41:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902d38600b00173411a4385sm6506514pld.43.2022.09.23.15.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 15:41:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gem: Unpin objects slightly later
Date: Fri, 23 Sep 2022 15:40:44 -0700
Message-Id: <20220923224043.2449152-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.2
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

The introduction of 025d27239a2f exposes a problem with f371bcc0c2ac, in
that we need to keep the object pinned in the time the submit is queued
up in the gpu scheduler.  Otherwise the shrinker will see it as a thing
that can be evicted if we wait for it to be signaled.  But if the
shrinker path is waiting on it with the obj lock held, the job cannot be
scheduled, as that also requires briefly grabbing the obj lock, leading
to deadlock.  (Not to mention, we don't want the shrinker to evict an
obj queued up in gpu scheduler.)

Fixes: f371bcc0c2ac ("drm/msm/gem: Unpin buffers earlier")
Fixes: 025d27239a2f ("drm/msm/gem: Evict active GEM objects when necessary")
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/19
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
 drivers/gpu/drm/msm/msm_ringbuffer.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5599d93ec0d2..c670591995e6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -501,11 +501,11 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
  */
 static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
-	unsigned cleanup_flags = BO_LOCKED | BO_OBJ_PINNED;
+	unsigned cleanup_flags = BO_LOCKED;
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_VMA_PINNED;
+		cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index cad4c3525f0b..57a8e9564540 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -25,7 +25,8 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 
 		msm_gem_lock(obj);
 		msm_gem_unpin_vma_fenced(submit->bos[i].vma, fctx);
-		submit->bos[i].flags &= ~BO_VMA_PINNED;
+		msm_gem_unpin_locked(obj);
+		submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
 		msm_gem_unlock(obj);
 	}
 
-- 
2.37.2

