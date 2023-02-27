Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111266A4B2B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2678210E47A;
	Mon, 27 Feb 2023 19:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE4E10E4A6;
 Mon, 27 Feb 2023 19:36:27 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id l1so7353728pjt.2;
 Mon, 27 Feb 2023 11:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hrRR+74wlbtFKJjI1vePCtLY+UXSH6ONksg5TtlCrQ=;
 b=ZgI3xUvsC8eoOc7I4Py64awS2DJ2+wg6ioRtOJmNhnTlQaoPbrRKnsX9V1TIw9UDwu
 Ue3x1CGF6b0DLfDJpaReKLB27UfoUJ58T5b3NyX40icCvf1vTlZldKjJvcgsszIm2ucx
 xgPj++X2E9vko7dsqWj6eGzt2kNrDkmFBgRVb4RpFSGs8G83MYl0z2UAbiGEqvnVSeaQ
 FyiFwohXdg1nClk+Uz62LSDHUZxfB/Nrmoi3hG/hiWlpHkIgKNku6/d0WILMpWZHOGIX
 2r/ZPRGrJurvm3mYl8V/geq4sNb02kYH8aRWUSgKGKzrOg6Zrn+ktO1F9WZf1/vyU8RK
 jFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hrRR+74wlbtFKJjI1vePCtLY+UXSH6ONksg5TtlCrQ=;
 b=vBtVxePMdz/7hLUlg8T+fwUR+8AdqXy3UpluAXknXAy3pRH5KEivD/hneazilm06l+
 TqeSr93Kvu3nsodNhDm2ROOH/jfvGANiaeyTfJCfY7Nv4VO1f6WlileCKROJJmtAWPXF
 FMxiBkp+0UWEt/S9cd9gJxBmZ46AmzbYBSkzneMkSBf9shgCZ0l5IO6b4x/QWDPYgDCN
 7PipGUtG5lT7GtbdadKpT03I93kETCH5VdxFyvNNuomHXhrJgA6+BBS2DZzRVwO8wJhq
 vFeARbbZi6bc05m3q7lMmosMo2st6G8oFn+VsWcP8xVTIa0wKySv6hiEm1bJgiVm12xs
 7ZVA==
X-Gm-Message-State: AO0yUKV1BQoStdSx6R3CY6b3G/QK2d36EMnJyISpduOrUU3oMvnozQ9G
 GxXeY5Ujt73fbqdph6PWMbTYzWkRdsI=
X-Google-Smtp-Source: AK7set/iHm/pa4BOJh52yq5ccDN/6smBG259ieEdaE8ikLcGABkiG2tXYxHILc0sq6Q8GoQkT7wmRA==
X-Received: by 2002:a17:90a:345:b0:236:75d3:fedc with SMTP id
 5-20020a17090a034500b0023675d3fedcmr403161pjf.8.1677526587042; 
 Mon, 27 Feb 2023 11:36:27 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a17090a3d4800b00233ebab3770sm4815295pjf.23.2023.02.27.11.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:36:26 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 14/15] drm/msm/atomic: Switch to vblank_start helper
Date: Mon, 27 Feb 2023 11:35:20 -0800
Message-Id: <20230227193535.2822389-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227193535.2822389-1-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
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
Cc: open list <linux-kernel@vger.kernel.org>,
 Liu Shixin <liushixin2@huawei.com>, Rob Clark <robdclark@chromium.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Drop our custom thing and switch to drm_crtc_next_vblank_start() for
calculating the time of the start of the next vblank period.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ---------------
 drivers/gpu/drm/msm/msm_atomic.c        |  8 +++++---
 drivers/gpu/drm/msm/msm_kms.h           |  8 --------
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a683bd9b5a04..43996aecaf8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -411,20 +411,6 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
-static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
-{
-	struct drm_encoder *encoder;
-
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
-		ktime_t vsync_time;
-
-		if (dpu_encoder_vsync_time(encoder, &vsync_time) == 0)
-			return vsync_time;
-	}
-
-	return ktime_get();
-}
-
 static void dpu_kms_prepare_commit(struct msm_kms *kms,
 		struct drm_atomic_state *state)
 {
@@ -953,7 +939,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq             = dpu_core_irq,
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
-	.vsync_time      = dpu_kms_vsync_time,
 	.prepare_commit  = dpu_kms_prepare_commit,
 	.flush_commit    = dpu_kms_flush_commit,
 	.wait_flush      = dpu_kms_wait_flush,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 1686fbb611fd..de7ce17489cc 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -186,8 +186,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct msm_kms *kms = priv->kms;
 	struct drm_crtc *async_crtc = NULL;
 	unsigned crtc_mask = get_crtc_mask(state);
-	bool async = kms->funcs->vsync_time &&
-			can_do_async(state, &async_crtc);
+	bool async = can_do_async(state, &async_crtc);
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
@@ -231,7 +230,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 			kms->pending_crtc_mask |= crtc_mask;
 
-			vsync_time = kms->funcs->vsync_time(kms, async_crtc);
+			if (!drm_crtc_next_vblank_start(async_crtc, &vsync_time))
+				goto fallback;
+
 			wakeup_time = ktime_sub(vsync_time, ms_to_ktime(1));
 
 			msm_hrtimer_queue_work(&timer->work, wakeup_time,
@@ -253,6 +254,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		return;
 	}
 
+fallback:
 	/*
 	 * If there is any async flush pending on updated crtcs, fold
 	 * them into the current flush.
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f8ed7588928c..086a3f1ff956 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -59,14 +59,6 @@ struct msm_kms_funcs {
 	void (*enable_commit)(struct msm_kms *kms);
 	void (*disable_commit)(struct msm_kms *kms);
 
-	/**
-	 * If the kms backend supports async commit, it should implement
-	 * this method to return the time of the next vsync.  This is
-	 * used to determine a time slightly before vsync, for the async
-	 * commit timer to run and complete an async commit.
-	 */
-	ktime_t (*vsync_time)(struct msm_kms *kms, struct drm_crtc *crtc);
-
 	/**
 	 * Prepare for atomic commit.  This is called after any previous
 	 * (async or otherwise) commit has completed.
-- 
2.39.1

