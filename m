Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2940D58BBCD
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 18:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EC610FF12;
	Sun,  7 Aug 2022 16:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85A711AC8C;
 Sun,  7 Aug 2022 16:08:29 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id f28so6230243pfk.1;
 Sun, 07 Aug 2022 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=5LZXNn7pnpmQJ9fitC0ymrlN4xtjBHI2SmcGn+8C2hU=;
 b=MlaYW+6iOUFKWzQ+Rbg9UNxvCteOXhlxwIiJRJ6hjtXeWXtVnr34mlZJr3TzkZtGyu
 WiYG1+YiWdu21dvUEGqW8+gOsjDojLAW6g+DJB9C6e0mJP1J1+lZUQ8Zwbcvtnqb8S44
 EgZ4S3b5mgGfJtsr6pN803E0HPlosIV34N1fGNVkaFYW2vwdqQ3zAxoZCF8q0Y1iMYNW
 QCqzcjeaAZHk7HnQqQsZ4qiQ19vqIWIcCYtKb9jMd/LIvMzX+eSNXk8MUaTL0HF94WXo
 qbci2YS384PoSkwu0Na4O9xjlY0T0upgzUPdqdp35jDwA7W5jXqw7CPcgz/RXu7aWrtH
 LVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=5LZXNn7pnpmQJ9fitC0ymrlN4xtjBHI2SmcGn+8C2hU=;
 b=oo/Y7y3wZJ5ssDzrgbTW3+G82/WTFodW4vhgA8yMUCihV5lZiekt9x3HGe1+DT7/c6
 mdMYiFSwfjI2JQw7fKw/UuXjXX5ggl+MBifR9aB2zD1Hh/3Fm3YMm7JCA7J664MhfLMe
 a9JZkVWdjwWHh2Ai5+XR7noBAfBwziOlIsxE+9y4JALvvwkA74e3OvLJHPqa0ez6Lisu
 RP1Sl9wL57O7x4HqV4XQ6dibtItped8tSnyEPv5hO4k+KK4zrK3EURXPgJ18Nhxae5n1
 dmANzrzzT5uMcs2C2b4P8ocw1XIgpLSh75Djc+dBh9CzD0kUv7yvcHfWQ6dJLQsJ/xtm
 PZyg==
X-Gm-Message-State: ACgBeo2hDgMSlG0Hx3v3rXP0JU056/ohDRGCoK9P4yd5Cl3v9T9QGKm0
 HKCBDdi+A26p880FWs45u9h1mEz2kV8=
X-Google-Smtp-Source: AA6agR4ovtqBAWw/GdrxlybKf+QUZMi07LtPvSAXrIFSiyw7Do2MuwxwOAUK1JFh656lYB/iHLMa3g==
X-Received: by 2002:a05:6a00:22c8:b0:52d:586f:19c3 with SMTP id
 f8-20020a056a0022c800b0052d586f19c3mr14778379pfj.80.1659888508416; 
 Sun, 07 Aug 2022 09:08:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090a075600b001f21f5c81a5sm8930336pje.19.2022.08.07.09.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 09:08:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm: Move hangcheck timer restart
Date: Sun,  7 Aug 2022 09:09:00 -0700
Message-Id: <20220807160901.2353471-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Don't directly restart the hangcheck timer from the timer handler, but
instead start it after the recover_worker replays remaining jobs.

If the kthread is blocked for other reasons, there is no point to
immediately restart the timer.  Fixes a random symptom of the problem
fixed in the next patch.

v2: Keep the hangcheck timer restart in the timer handler in the case
    where we aren't scheduling recover_worker

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fba85f894314..6762001d9945 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -328,6 +328,7 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 }
 
 static void retire_submits(struct msm_gpu *gpu);
+static void hangcheck_timer_reset(struct msm_gpu *gpu);
 
 static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
 {
@@ -420,6 +421,8 @@ static void recover_worker(struct kthread_work *work)
 	}
 
 	if (msm_gpu_active(gpu)) {
+		bool restart_hangcheck = false;
+
 		/* retire completed submits, plus the one that hung: */
 		retire_submits(gpu);
 
@@ -436,10 +439,15 @@ static void recover_worker(struct kthread_work *work)
 			unsigned long flags;
 
 			spin_lock_irqsave(&ring->submit_lock, flags);
-			list_for_each_entry(submit, &ring->submits, node)
+			list_for_each_entry(submit, &ring->submits, node) {
 				gpu->funcs->submit(gpu, submit);
+				restart_hangcheck = true;
+			}
 			spin_unlock_irqrestore(&ring->submit_lock, flags);
 		}
+
+		if (restart_hangcheck)
+			hangcheck_timer_reset(gpu);
 	}
 
 	mutex_unlock(&gpu->lock);
@@ -498,6 +506,7 @@ static void hangcheck_handler(struct timer_list *t)
 	struct drm_device *dev = gpu->dev;
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 	uint32_t fence = ring->memptrs->fence;
+	bool restart_hangcheck = true;
 
 	if (fence != ring->hangcheck_fence) {
 		/* some progress has been made.. ya! */
@@ -513,10 +522,16 @@ static void hangcheck_handler(struct timer_list *t)
 				gpu->name, ring->fctx->last_fence);
 
 		kthread_queue_work(gpu->worker, &gpu->recover_work);
+
+		/* If we do recovery, we want to defer restarting the hangcheck
+		 * timer until recovery completes and the remaining non-guilty
+		 * jobs are re-played.
+		 */
+		restart_hangcheck = false;
 	}
 
 	/* if still more pending work, reset the hangcheck timer: */
-	if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
+	if (restart_hangcheck && fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
 		hangcheck_timer_reset(gpu);
 
 	/* workaround for missing irq: */
-- 
2.36.1

