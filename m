Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547689676E7
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 15:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42B110E15A;
	Sun,  1 Sep 2024 13:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hN+MApfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B6C10E15A;
 Sun,  1 Sep 2024 13:59:16 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f504652853so38082451fa.0; 
 Sun, 01 Sep 2024 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725199155; x=1725803955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T92lHW8RUNhDHAQvibb0adZUC3Zfr3PwSsvkl+HJFgA=;
 b=hN+MApfYLic0GNXS46PiefamVuiE6VbLMf2UEjIRkT4UGI2+JpaZkeaxllpHkHYR/w
 4Z5MFYn4s5H6vxvJWJP8GjwxEpHaK3M4M4QSHCcv7Y3qbOComQHtXf9LmzOO3KtRWt7Q
 FHtNfglIW5vT9naqhfZMTsSj1v7sIZmwNTFn8/s8QPcEVET4p79sVCPHUWGLAxK5OAz6
 T9Q6xBziCyUJsD9F+S+TnjuJHLCLpwB3LWZYOucdGLgZHQlAIM22dep1RkdF8rQ49TMl
 dJ/pHfnMvlGeQt/9wIfOTcleb0OW/wtfQt1reB6nfkwuHRl5ew1I36c6Ojjz9QF178FI
 DsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725199155; x=1725803955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T92lHW8RUNhDHAQvibb0adZUC3Zfr3PwSsvkl+HJFgA=;
 b=MkFfNweo7RxSpyZs2Tibi659jvF+v6mjA4wMf3wt5C5C4cKsSF3cubXc5LDksG8Old
 +K7gHAqU+UHkEfWKKRH/u+9uV0FF3Sy23Qb6Ei0HDWn9LJEtcj9c7dm0bZiQIp5SZt6X
 dhybD7Ejzl8Xi4k4BlHW5xBqXjHcVAPkwZD5mTPxM1ryM2JWN36oCOPW4wGmccN3G8nl
 /ntquakymB7FuCycHeYmCdwIMI9DdXXbc+z5dC8T+pHIbgWq+aWY95Bv4ffug7iNwnd5
 NrOqKdd/W3xSa0gAM5bV7CQibMnClXF/5hdX7IZIENxK3gTFx+O8qCXhI4IjrOR6VH5T
 1sJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHgy+a0jCXk9G+bGdwJ32JxyRKAHI6aXG/ZuKW7ZCU+fgtshbqoR1jKmaAP2yiiRNbvlBg8SW2xvh1@lists.freedesktop.org,
 AJvYcCXuXdbuTyYCiN5bTFHl2NeebOAR2BSG840v5+LZciPT+NPLyeeaGerfemibZ7jTlKuv3aWnrAvSwcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCVbRW54lVnwfGCBHZAIJnFgBM42eUM1gSFRMbN6VAnfyjvSSa
 XxHD8e3DSeDyEaXYS/BeqciBzLnjQPzGl0Dumdtb48uoU+HAqTvL
X-Google-Smtp-Source: AGHT+IFwUQ0fX0i6XjltYeo1Dom59dNY1fFMpQnob6UlvVpTnE3Q+SJIj64awZOB1p5Wn1LEwZqoVA==
X-Received: by 2002:a05:651c:198c:b0:2f3:d560:ed9f with SMTP id
 38308e7fff4ca-2f61e025823mr55094181fa.5.1725199153752; 
 Sun, 01 Sep 2024 06:59:13 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 06:59:13 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/msm/a5xx: fix races in preemption evaluation stage
Date: Sun,  1 Sep 2024 13:54:02 +0000
Message-ID: <20240901135419.1075412-4-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
References: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
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
for preempt_trigger to make decision after each submit or retire. To
implement this we serialize preemption initiation using spinlock. If
switch is already in progress we need to re-trigger preemption when it
finishes.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index c7187bcc5e90..b4d06ca3e499 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -36,6 +36,7 @@ struct a5xx_gpu {
 	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
 
 	atomic_t preempt_state;
+	spinlock_t preempt_start_lock;
 	struct timer_list preempt_timer;
 
 	struct drm_gem_object *shadow_bo;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 67a8ef4adf6b..c65b34a4a8cc 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -97,12 +97,19 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 	if (gpu->nr_rings == 1)
 		return;
 
+	/*
+	 * Serialize preemption start to ensure that we always make
+	 * decision on latest state. Otherwise we can get stuck in
+	 * lower priority or empty ring.
+	 */
+	spin_lock_irqsave(&a5xx_gpu->preempt_start_lock, flags);
+
 	/*
 	 * Try to start preemption by moving from NONE to START. If
 	 * unsuccessful, a preemption is already in flight
 	 */
 	if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
-		return;
+		goto out;
 
 	/* Get the next ring to preempt to */
 	ring = get_next_ring(gpu);
@@ -127,9 +134,11 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 		set_preempt_state(a5xx_gpu, PREEMPT_ABORT);
 		update_wptr(gpu, a5xx_gpu->cur_ring);
 		set_preempt_state(a5xx_gpu, PREEMPT_NONE);
-		return;
+		goto out;
 	}
 
+	spin_unlock_irqrestore(&a5xx_gpu->preempt_start_lock, flags);
+
 	/* Make sure the wptr doesn't update while we're in motion */
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 	a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
@@ -152,6 +161,10 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 
 	/* And actually start the preemption */
 	gpu_write(gpu, REG_A5XX_CP_CONTEXT_SWITCH_CNTL, 1);
+	return;
+
+out:
+	spin_unlock_irqrestore(&a5xx_gpu->preempt_start_lock, flags);
 }
 
 void a5xx_preempt_irq(struct msm_gpu *gpu)
@@ -188,6 +201,12 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
 	update_wptr(gpu, a5xx_gpu->cur_ring);
 
 	set_preempt_state(a5xx_gpu, PREEMPT_NONE);
+
+	/*
+	 * Try to trigger preemption again in case there was a submit or
+	 * retire during ring switch
+	 */
+	a5xx_preempt_trigger(gpu);
 }
 
 void a5xx_preempt_hw_init(struct msm_gpu *gpu)
@@ -300,5 +319,6 @@ void a5xx_preempt_init(struct msm_gpu *gpu)
 		}
 	}
 
+	spin_lock_init(&a5xx_gpu->preempt_start_lock);
 	timer_setup(&a5xx_gpu->preempt_timer, a5xx_preempt_timer, 0);
 }
-- 
2.46.0

