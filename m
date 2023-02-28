Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C06A6325
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2AB10E0FA;
	Tue, 28 Feb 2023 22:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A4A10E1A0;
 Tue, 28 Feb 2023 22:59:11 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so4069091pjg.4; 
 Tue, 28 Feb 2023 14:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0nD4m6G0f9CfPGzBReP4EZd5C0mCrWqHJ9ftGkbyJg=;
 b=gUA/NmJlbxgtGNRvdFcfO9PfFQFNVypjuJ9W3yppmy0ZggF+18qkZZWR4aQ63qwdr/
 Yj1TGSyn3eZbef73fCCtBwSrc1CkS4P5ALb0XNpNNlSyIrh25NkdEq7hqgzRLMlvnO4I
 TqfzA5ERQbMw9kC+Xb+00pmLu/XYsF34v9jd1CZZJ+NcvHNzVKTpAFs072Dhnlm0Hy1q
 ftmU+RHuggF2s94pTyGySQLEQOqg9tcnNwfaJCVMKQC/mhSUcSseLxhBuvNSH4MgSG5J
 EQIYVae5DT25QnQP/zWnqLuUrCX3l3c4dQ3zX7Cg2jIr6ny4hF2lfTH6S6LgHjolrW6g
 VUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0nD4m6G0f9CfPGzBReP4EZd5C0mCrWqHJ9ftGkbyJg=;
 b=ijnFr+ylGg5sJo5QhYBKhpSlANuHcwQJnLboLQeVu1BJ/u+TtNpGhnM3Rd8oCz2drV
 EjGw6Ti2KdtB0/tWL3An+aKOuHkWWlO1tnPlIDLTTyclF64ueJ3WtZbm0jTmH8k6BExh
 iLU1EOW6R/0Uu+kzpINaElsHSd446VJ9SehFyEl0kmYUdO1hSA0gxrfDxFgFH7Eq5Q+b
 mZswelNBNBwst64lgweoAXtD/UUnrQc3nvk51KVyIjIJcDfj0WBtlf0IKjwVcS2paSQv
 HVMc89XjPThTJ7cn2H06/RMqKN+CgazEnAMVdY2kX/88ST8LGidwjZDR1JdVkxBqoQ0T
 tD6Q==
X-Gm-Message-State: AO0yUKXY1fhrIlkyblr41u9U7smJFKQl66o/IQ6N0A+bW0jzAyH8bEIL
 iZBWdVy43g4MiL0LT51+kHRMYNjfj4/LEg==
X-Google-Smtp-Source: AK7set/jLbFEjK+nfqFYTgyaKwy4NH2PI3B02lebHRLtpVzfVAHrM3iXehckhrlAUofwzr4gGEqDLg==
X-Received: by 2002:a17:903:27cd:b0:19c:a6ba:69f6 with SMTP id
 km13-20020a17090327cd00b0019ca6ba69f6mr3780498plb.31.1677625150956; 
 Tue, 28 Feb 2023 14:59:10 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a17090282c900b0019472226769sm6992784plz.251.2023.02.28.14.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:59:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 15/16] drm/msm/atomic: Switch to vblank_start helper
Date: Tue, 28 Feb 2023 14:58:19 -0800
Message-Id: <20230228225833.2920879-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228225833.2920879-1-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
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
 Konrad Dybcio <konrad.dybcio@linaro.org>,
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
index 1686fbb611fd..c5e71c05f038 100644
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
+			if (drm_crtc_next_vblank_start(async_crtc, &vsync_time))
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

