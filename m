Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60492E40F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 12:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F4410E9FE;
	Thu, 11 Jul 2024 10:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NR1kx2XG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E6310E9FE;
 Thu, 11 Jul 2024 10:03:17 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eea8ea8bb0so11530431fa.1; 
 Thu, 11 Jul 2024 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720692195; x=1721296995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mpDedd6FGX+sxnS7G9+Mxa2s/rVU6BfMCskO3N0uDSI=;
 b=NR1kx2XG5N+ZXPvPt9WX6Usx7VzqV75ZUhs7jz3Vdmy8ZQJ9bCPadvOF7efog1micr
 9RLimpGbXdTzJiWCxAu3EnIpLefInMCaDjckyr15AzC8Xqpu7DSs0zBu5LcG/kRZfUod
 nPwzN9HVIhZbb9MFMZJkGG8D3f2L9FFV9mpZuJEfyAbfu31EhfDmC60wVXbHpDGGD8yP
 AbYVa5s4uQRE8DxbAE8LhcpxWgHgyc77EzHvGEft6ji0qr+mCCx3vBBvzsQtCZWHRAtY
 q/tqrUBNFaNviNnN/lLRTBbWgiTVvu8H4BmuILTaD7duU6h1oYMZi60shk3idNrmDRJh
 Uzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720692195; x=1721296995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mpDedd6FGX+sxnS7G9+Mxa2s/rVU6BfMCskO3N0uDSI=;
 b=CoTRtAAU5NmHoGygX5OKKc/j4swuu5TOcoeS8ER5FHgLjHwunpVuAecyrJF+1eLEL5
 CAacW8nh58oWkr5ZqCKh5l6VvUs0RVwGLevW/LVwft7XvbI+Ylm1WDqyaZ72+FVLbzOm
 nI+Zk+fWzJUKcaGTTULLojCBdVm5WXHY5Hd0X+W1N31fpMAGWsEGFlrYJQF8hFWPd3+e
 7qsSnljxt3mtCaU/xAbS0CZQHuOL1vXuUPRnQnxKJw42p8Ljdqu1vQzlLor+7ltdceXh
 wtOp8GmmU+lLYl7uPIP4i+HnTj1f4byzfuAy+vgHvv6Uu0zip1FQqquRgxyJOhkdxJIU
 lBYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBn51XNLg/l62AAwOnUu7+C47uwHprrFOYyGKuoNsicpwtSahYo5a1WdyPkm7zjaA6qxtubLDdX0L3dpB8ER98fvIhLbi7SRK6Lvihnr2nFamuGAmrjEDEnGOY/kAgQuAGh96r14FZNDA8D3B4OGOR
X-Gm-Message-State: AOJu0Yxy0OMUWCkrftC9JRAirIgiW0PskwPldZGIP7oowCkgJsvYivcb
 ZknuatTGsoMdfGKQDabv8eP4X0Bk33COktFmE4Pt88uH7UQihnzJ
X-Google-Smtp-Source: AGHT+IF+kagTgZb7DqrII/Qk3hyi7AMAFxbVeLFxW2dkrUO2yG/P59umyNCJLiRJCSUtvid+bzrC6A==
X-Received: by 2002:a2e:a36c:0:b0:2ec:51b5:27be with SMTP id
 38308e7fff4ca-2eeb30e3c73mr59200321fa.12.1720692195273; 
 Thu, 11 Jul 2024 03:03:15 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 03:03:14 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/msm/a5xx: fix races in preemption evaluation stage
Date: Thu, 11 Jul 2024 10:00:20 +0000
Message-ID: <20240711100038.268803-4-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711100038.268803-1-vladimir.lypak@gmail.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On A5XX GPUs when preemption is used it's invietable to enter a soft
lock-up state in which GPU is stuck at empty ring-buffer doing nothing.
This appears as full UI lockup and not detected as GPU hang (because
it's not). This happens due to not triggering preemption when it was
needed. Sometimes this state can be recovered by some new submit but
generally it won't happen because applications are waiting for old
submits to retire.

One of the reasons why this happens is a race between a5xx_submit and
a5xx_preempt_trigger called from IRQ during submit retire. Former thread
updates ring->cur of previously empty and not current ring right after
latter checks it for emptiness. Then both threads can just exit because
for first one preempt_state wasn't NONE yet and for second one all rings
appeared to be empty.

To prevent such situations from happening we need to establish guarantee
for preempt_trigger to be called after each submit. To implement it this
patch adds trigger call at the end of a5xx_preempt_irq to re-check if we
should switch to non-empty or higher priority ring. Also we find next
ring in new preemption state "EVALUATE". If the thread that updated some
ring with new submit sees this state it should wait until it passes.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++----
 3 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6c80d3003966..266744ee1d5f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 	}
 
 	a5xx_flush(gpu, ring, true);
-	a5xx_preempt_trigger(gpu);
+	a5xx_preempt_trigger(gpu, true);
 
 	/* we might not necessarily have a cmd from userspace to
 	 * trigger an event to know that submit has completed, so
@@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a5xx_flush(gpu, ring, false);
 
 	/* Check to see if we need to start preemption */
-	a5xx_preempt_trigger(gpu);
+	a5xx_preempt_trigger(gpu, true);
 }
 
 static const struct adreno_five_hwcg_regs {
@@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 		a5xx_gpmu_err_irq(gpu);
 
 	if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
-		a5xx_preempt_trigger(gpu);
+		a5xx_preempt_trigger(gpu, false);
 		msm_gpu_retire(gpu);
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index c7187bcc5e90..1120824853d4 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
  * through the process.
  *
  * PREEMPT_NONE - no preemption in progress.  Next state START.
- * PREEMPT_START - The trigger is evaulating if preemption is possible. Next
- * states: TRIGGERED, NONE
+ * PREEMPT_EVALUATE - The trigger is evaulating if preemption is possible. Next
+ * states: START, ABORT
  * PREEMPT_ABORT - An intermediate state before moving back to NONE. Next
  * state: NONE.
+ * PREEMPT_START - The trigger is preparing for preemption. Next state:
+ * TRIGGERED
  * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Next
  * states: FAULTED, PENDING
  * PREEMPT_FAULTED: A preemption timed out (never completed). This will trigger
@@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
 
 enum preempt_state {
 	PREEMPT_NONE = 0,
-	PREEMPT_START,
+	PREEMPT_EVALUATE,
 	PREEMPT_ABORT,
+	PREEMPT_START,
 	PREEMPT_TRIGGERED,
 	PREEMPT_FAULTED,
 	PREEMPT_PENDING,
@@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
 
 void a5xx_preempt_init(struct msm_gpu *gpu);
 void a5xx_preempt_hw_init(struct msm_gpu *gpu);
-void a5xx_preempt_trigger(struct msm_gpu *gpu);
+void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
 void a5xx_preempt_irq(struct msm_gpu *gpu);
 void a5xx_preempt_fini(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 67a8ef4adf6b..f8d09a83c5ae 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_list *t)
 }
 
 /* Try to trigger a preemption switch */
-void a5xx_preempt_trigger(struct msm_gpu *gpu)
+void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	unsigned long flags;
 	struct msm_ringbuffer *ring;
+	enum preempt_state state;
 
 	if (gpu->nr_rings == 1)
 		return;
 
 	/*
-	 * Try to start preemption by moving from NONE to START. If
-	 * unsuccessful, a preemption is already in flight
+	 * Try to start preemption by moving from NONE to EVALUATE. If current
+	 * state is EVALUATE/ABORT we can't just quit because then we can't
+	 * guarantee that preempt_trigger will be called after ring is updated
+	 * by new submit.
 	 */
-	if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
+	state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
+			       PREEMPT_EVALUATE);
+	while (new_submit && (state == PREEMPT_EVALUATE ||
+			      state == PREEMPT_ABORT)) {
+		cpu_relax();
+		state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
+				       PREEMPT_EVALUATE);
+	}
+
+	if (state != PREEMPT_NONE)
 		return;
 
 	/* Get the next ring to preempt to */
@@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 		return;
 	}
 
+	set_preempt_state(a5xx_gpu, PREEMPT_START);
+
 	/* Make sure the wptr doesn't update while we're in motion */
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 	a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
@@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
 	update_wptr(gpu, a5xx_gpu->cur_ring);
 
 	set_preempt_state(a5xx_gpu, PREEMPT_NONE);
+
+	a5xx_preempt_trigger(gpu, false);
 }
 
 void a5xx_preempt_hw_init(struct msm_gpu *gpu)
-- 
2.45.2

