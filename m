Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0736DF94
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 21:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1298A6E17A;
	Wed, 28 Apr 2021 19:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D496F6E17A;
 Wed, 28 Apr 2021 19:33:37 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id m37so2911306pgb.8;
 Wed, 28 Apr 2021 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+lmKItKrAdr+h8p3ruijedafGbkKyueE2AuvEgRCac=;
 b=qYlJ2VEfyrAilXphT6LMQZseZ/Mg5kUYyif7CDgmad4LP/HJ5+wcOaAQkc5NDGURjj
 R52xjlsMLr7H2z9n5xEwCwH5MSeTB+4dpzmp4xGb8/cvthxXyfHxscgjrbVSuWw7A9i1
 JpzZzs/l9Gy0Qwb3CYGlq3rKu7pkOl+kK7c4NagP5txwplWxLwDXg1mKrItHBPZZu3Jq
 TOI1VIjZQLRhC/eMvL9jlH06pHqnkir3g2UVjekzfcAHewCkWYwxf/k8ldFM1qZGcbHA
 iP50zMau4LdHci3cGkpE5XdPPYJbi5LuzTq+T0xuP6oncccsBJovio4KBKqkn7iHkiGP
 ky2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+lmKItKrAdr+h8p3ruijedafGbkKyueE2AuvEgRCac=;
 b=EZifQGVmuDoWRhxQruI+d/IQ7VG+O9DuPwuNYRoA4M7svz/gnBKUZ9Hm5lJxvJl9jl
 sx7NVuX7FhJrx9lm+ZLq+pP43buN7D+sQTgLkIGoVITgGoXsE0pL/bqa/WC377V++ckx
 upxuO1nn1xnSqdyz8nXeoBSmvsYboOtfvCQAna5CiasdFdIfm7DHyLpKhrNMRG16QOkx
 mrQJQPbYhTCE5wzbDBiNojTsr05HBs7XYnI3aPC/VGoj2L9OAoI1cey2J47/yS7BFtt7
 zZsfgTJ9Ccg1pzS9c3MGWXKU9TfVyRQ7t20q5PtzqQMqRUSruT5CFCvAFFAAYtgxEFm+
 TFkA==
X-Gm-Message-State: AOAM532g5mrnlNPSSxjHhMi+igoXiFhqAiKQCMi9nio2X/2CmonBLFml
 kbBtUAIWYIbE4jGferUPWenJIAeQoes=
X-Google-Smtp-Source: ABdhPJxTpx9iewlg3qxXZInGbpx750+kJ4lEWx5U3rs4GnaYqWU+mLe6Y8bPLPpkBeW+Zg8TLah2Ow==
X-Received: by 2002:a05:6a00:2389:b029:261:abe:184 with SMTP id
 f9-20020a056a002389b02902610abe0184mr30234121pfc.52.1619638416806; 
 Wed, 28 Apr 2021 12:33:36 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 nh10sm266238pjb.49.2021.04.28.12.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:33:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: Periodically update RPTR shadow
Date: Wed, 28 Apr 2021 12:36:49 -0700
Message-Id: <20210428193654.1498482-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428193654.1498482-1-robdclark@gmail.com>
References: <20210428193654.1498482-1-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

On a5xx and a6xx devices that are using CP_WHERE_AM_I to update a
ringbuffer read-ptr shadow value, periodically emit a CP_WHERE_AM_I
every 32 commands, so that a later submit waiting for ringbuffer
space to become available sees partial progress, rather than not
seeing rptr advance at all until the GPU gets to the end of the
submit that it is currently chewing on.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 29 ++++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++------
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 0c8faad3b328..5202f1498a48 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -18,6 +18,18 @@ static void a5xx_dump(struct msm_gpu *gpu);
 
 #define GPU_PAS_ID 13
 
+static void update_shadow_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+
+	if (a5xx_gpu->has_whereami) {
+		OUT_PKT7(ring, CP_WHERE_AM_I, 2);
+		OUT_RING(ring, lower_32_bits(shadowptr(a5xx_gpu, ring)));
+		OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
+	}
+}
+
 void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		bool sync)
 {
@@ -30,11 +42,8 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	 * Most flush operations need to issue a WHERE_AM_I opcode to sync up
 	 * the rptr shadow
 	 */
-	if (a5xx_gpu->has_whereami && sync) {
-		OUT_PKT7(ring, CP_WHERE_AM_I, 2);
-		OUT_RING(ring, lower_32_bits(shadowptr(a5xx_gpu, ring)));
-		OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
-	}
+	if (sync)
+		update_shadow_rptr(gpu, ring);
 
 	if (unlikely(ring->overflow))
 		return;
@@ -171,6 +180,16 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			ibs++;
 			break;
 		}
+
+		/*
+		 * Periodically update shadow-wptr if needed, so that we
+		 * can see partial progress of submits with large # of
+		 * cmds.. otherwise we could needlessly stall waiting for
+		 * ringbuffer state, simply due to looking at a shadow
+		 * rptr value that has not been updated
+		 */
+		if ((ibs % 32) == 0)
+			update_shadow_rptr(gpu, ring);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4a4728a774c0..2986e36ffd8d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -52,21 +52,25 @@ static bool a6xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return true;
 }
 
-static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+static void update_shadow_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	uint32_t wptr;
-	unsigned long flags;
 
 	/* Expanded APRIV doesn't need to issue the WHERE_AM_I opcode */
 	if (a6xx_gpu->has_whereami && !adreno_gpu->base.hw_apriv) {
-		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-
 		OUT_PKT7(ring, CP_WHERE_AM_I, 2);
 		OUT_RING(ring, lower_32_bits(shadowptr(a6xx_gpu, ring)));
 		OUT_RING(ring, upper_32_bits(shadowptr(a6xx_gpu, ring)));
 	}
+}
+
+static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	uint32_t wptr;
+	unsigned long flags;
+
+	update_shadow_rptr(gpu, ring);
 
 	if (unlikely(ring->overflow))
 		return;
@@ -148,7 +152,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
-	unsigned int i;
+	unsigned int i, ibs = 0;
 
 	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
 
@@ -184,8 +188,19 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, submit->cmd[i].size);
+			ibs++;
 			break;
 		}
+
+		/*
+		 * Periodically update shadow-wptr if needed, so that we
+		 * can see partial progress of submits with large # of
+		 * cmds.. otherwise we could needlessly stall waiting for
+		 * ringbuffer state, simply due to looking at a shadow
+		 * rptr value that has not been updated
+		 */
+		if ((ibs % 32) == 0)
+			update_shadow_rptr(gpu, ring);
 	}
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
