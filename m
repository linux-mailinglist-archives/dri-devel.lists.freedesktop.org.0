Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7567358913C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 19:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D049911B0AA;
	Wed,  3 Aug 2022 17:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B242810FC65;
 Wed,  3 Aug 2022 17:22:30 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w14so3950895plp.9;
 Wed, 03 Aug 2022 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=rm9GxJHf4bMp41yMMJ7kHX0LNzG+Q8tVx0zjX0fL5Eg=;
 b=Q+y4N05F6bbrA0KTd1dyGcJCIJqVn7sRmV5SaPGauTQkvOrW8lcA1nzpq/Cnxtyten
 B+WTtQBhfxWMiIY9oD+v+Hv3yz+BgMc41r3ruHOBd4emBH1YkkVHLhkyNZ27Io6wmG1b
 kvqztKsDuYNfSI2qsQiYSV1OmEMziJqAql3pq7UMLCMKePIqDag6k1WgqX3lSf9BcACr
 54OyYAsmrzS92zZWS90j1oEKOd61FN3KxENQXcnnAVjORamMdsjKB7bFXJOczf1idzbY
 9Tut5EM5VdPAmX1rKNperE0sVDqZfCx/FSUo9jAMMd8AheD5tLphb43lbsDCDtHLbJUE
 cinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=rm9GxJHf4bMp41yMMJ7kHX0LNzG+Q8tVx0zjX0fL5Eg=;
 b=cx+TL/lK3YPRHqOxKo5ErkylJSCWEReyMQ11r+vTw36Qu9lRX0MVKC6IpgyEj0EKcw
 84k0Xu+Uyqr3hFDojzC9bnMOLMZkWI29TRfO+fWZRpROONIU5x6eiwDox0os6eIEqeZZ
 dFSp/s1jYGZc8Akg7jlh/79OQBhgOcGm8Iua341VMXyX0qjL8cjJkI/RI+NIxvDRkyrI
 s7+nXahBxZPjEVbPTn207Ynv45/6Ckvb/fd/3YAlgXQKXseAovK+QbFxlEa7IGrRe+A3
 aQ233OyRHXyDi3dT1/fb5iYTsmSUVA4z+osqeZDdOWtyvIz6Ll9kHyFEqGH1mVWJG2pc
 +ugg==
X-Gm-Message-State: ACgBeo2dKi4nR0EAUrjefR3lenY2/zFko274I6SVKuUg4x5kS7+l1fQz
 r6dDXyUDdfltKmDWbuOlRLbTHmMTCfM=
X-Google-Smtp-Source: AA6agR6pXPAuirMDUgBbJXkQS1bmQjv10jiSXKUS29WnbnLBrvkAXU7IYSzphYn8d1V5pdrLO2khRQ==
X-Received: by 2002:a17:902:ccc4:b0:156:5d37:b42f with SMTP id
 z4-20020a170902ccc400b001565d37b42fmr27186057ple.157.1659547349427; 
 Wed, 03 Aug 2022 10:22:29 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a17090a4bc500b001f239783e3dsm1857657pjl.34.2022.08.03.10.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 10:22:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: Move hangcheck timer restart
Date: Wed,  3 Aug 2022 10:23:01 -0700
Message-Id: <20220803172302.1976981-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fba85f894314..8f9c48eabf7d 100644
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
@@ -515,10 +523,6 @@ static void hangcheck_handler(struct timer_list *t)
 		kthread_queue_work(gpu->worker, &gpu->recover_work);
 	}
 
-	/* if still more pending work, reset the hangcheck timer: */
-	if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
-		hangcheck_timer_reset(gpu);
-
 	/* workaround for missing irq: */
 	msm_gpu_retire(gpu);
 }
-- 
2.36.1

