Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCCF46F3E7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 20:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A4E10E272;
	Thu,  9 Dec 2021 19:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4AE10E270;
 Thu,  9 Dec 2021 19:26:00 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q16so5943559pgq.10;
 Thu, 09 Dec 2021 11:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkH8G74nuWliFsm56RBshmsnPHnGtaW2iQYxsG6KvQw=;
 b=Q4FTRkOslqkiYzs3+L+pSSEDFqt2hwbAbCHgGrusaS25Te/F1xLyzKgOHvu5ZGUFtl
 D+VxfsGK/ZOTstV5sEeTmwNjppmlfAbdvX+BrDm3GqG8OK0vAdVTgt2KM/73Lilk3hBb
 MaHdU8aTPgunUuzcdCFWU96rZP6ujD4iORQZidXzkZ6L3thNwT9MDq53i2M9QGMAWd5y
 SdTHPge5DyFSSdJXFZx/UY6fX29pgV1Ar4FlDQEtwPdxgexgBbN5bCOqB7Yj9PUvJK4Z
 UD666kuGXIh8aM2aTO88ErtQ+p2v4pFt03NMJxANn5VWD7kntlrD+hpi7fDw7fXlkTSL
 lDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkH8G74nuWliFsm56RBshmsnPHnGtaW2iQYxsG6KvQw=;
 b=GxEPn5jOFMrRXmpV7m7l+7aFNLFGWJO/FEA+Yk236JQmm98eUTyelLgAqKJoUcL2DF
 1P1IIbZ3Xnl5WKnTKTj1+mVAbtwfYlV3m1YWNnDFJ2C9CJte8zOqDIMFVN6+Tow5pnp2
 iX140RJrHvpvGZOx1ALZGuuP4UuwYYRoPq0Dz4Nayq3vl0leNf60f3mBMJZ0IjZr0VS7
 mjDDx57aBL3k67H0iE6pqWIJfJrbUpBrKooqqLcYSOl7ROvaALPyG/EO8CNdjlXy0ZnO
 XCnCqgltGf6Tkd4WkYGYX224ViEFZcICCnP0AjlhXgb3EGfFDnyQj/HamnQQNkLKolR/
 PP7Q==
X-Gm-Message-State: AOAM531d5wGKh8vWTPuTIjrsdfrQbjbWv0lWvCk9X5vQsSx8iiUngl0O
 D1aQFcxxl6yi71/5wL1BDYetafBkSAM=
X-Google-Smtp-Source: ABdhPJydqKflGOi1hge6N+O2b3mSxiXuASG9UA2XUCgDxjYLtu6lIBMKfmCnDSSHCzjQQZ+uk1Qx9A==
X-Received: by 2002:a63:4f42:: with SMTP id p2mr36200370pgl.381.1639077959882; 
 Thu, 09 Dec 2021 11:25:59 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 pc1sm11107656pjb.5.2021.12.09.11.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 11:25:58 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Skip crashdumper state if GPU needs_hw_init
Date: Thu,  9 Dec 2021 11:31:13 -0800
Message-Id: <20211209193118.1163248-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I am seeing some crash logs which imply that we are trying to use
crashdumper hw to read back GPU state when the GPU isn't initialized.
This doesn't go well (for example, GPU could be in 32b address mode
and ignoring the upper bits of buffer that it is trying to dump state
to).

I'm not *quite* sure how we get into this state in the first place,
but lets not make a bad situation worse by triggering iova fault
crashes.

While we're at it, also add the information about whether the GPU is
initialized to the devcore dump to make this easier to see in the
logs (which makes the WARN_ON() redundant and even harmful because
it fills up the small bit of dmesg we get with the crash report).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 9 ++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     | 1 -
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index bdd0059a81ff..55f443328d8e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -49,6 +49,8 @@ struct a6xx_gpu_state {
 	s32 hfi_queue_history[2][HFI_HISTORY_SZ];
 
 	struct list_head objs;
+
+	bool gpu_initialized;
 };
 
 static inline int CRASHDUMP_WRITE(u64 *in, u32 reg, u32 val)
@@ -1001,7 +1003,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	 * write out GPU state, so we need to skip this when the SMMU is
 	 * stalled in response to an iova fault
 	 */
-	if (!stalled && !a6xx_crashdumper_init(gpu, &_dumper)) {
+	if (!stalled && !gpu->needs_hw_init &&
+	    !a6xx_crashdumper_init(gpu, &_dumper)) {
 		dumper = &_dumper;
 	}
 
@@ -1018,6 +1021,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	if (snapshot_debugbus)
 		a6xx_get_debugbus(gpu, a6xx_state);
 
+	a6xx_state->gpu_initialized = !gpu->needs_hw_init;
+
 	return  &a6xx_state->base;
 }
 
@@ -1246,6 +1251,8 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 	if (IS_ERR_OR_NULL(state))
 		return;
 
+	drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
+
 	adreno_show(gpu, state, p);
 
 	drm_puts(p, "gmu-log:\n");
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 47cb40bdbd43..f33cfa4ef1c8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -504,7 +504,6 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int i, count = 0;
 
-	WARN_ON(gpu->needs_hw_init);
 	WARN_ON(!mutex_is_locked(&gpu->lock));
 
 	kref_init(&state->ref);
-- 
2.33.1

