Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775B681E0CB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 14:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3E10E179;
	Mon, 25 Dec 2023 13:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397A710E162
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 13:09:00 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cc6b5a8364so35082491fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 05:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703509738; x=1704114538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKgjg/qwWLdf/Rc3gV8ov6vt9tgKlbpQ12GfaOf7LUw=;
 b=RQKQscRU0HCInLMuA7S26oPN4Xu6tjcCUEEvHH1L1eZSUFrFJGUIH+cvC0PsGxKCqt
 /hM7mtfze6JtVR0obiXxsaXojAXaPtEW0ftv4O1AcS/rtjNNyFpdZ6sVqwWKEwI25rPq
 U4L4u+giH27o5FYuFINuY7u3Hq6+kXwWSqd0frb+QfsKvzsMjaOsePdaGUIvCTQnLrjg
 EXCIsOo8LltS+zc7N4VT0ikccNk4mefYtE/BiFivJbDHMPV4foIyDynNujmbutrmHXDV
 /hzvHPxElmh+x97pjllxNEtSaOTzyShZcial5Xo6zhJlaz0hxPFfMf3EsBq2etZVD/Ob
 QMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703509738; x=1704114538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKgjg/qwWLdf/Rc3gV8ov6vt9tgKlbpQ12GfaOf7LUw=;
 b=vgHKRBij7lB9O8byeK1Rd2+iofR35p9iADfHSdk0+OAZYmUqhGqvsOYtmT8+oiYs32
 s3pMsYl++gYKZScWWH9bDoMXKDK1tVdqRlWW/4msxlGshr9i0xscpU5tpsIQzQXg+PRJ
 anXG1RAa2Vd2VCcSJf9rNrhrT4roOQKK1fO/74Pkw6SVAwl6/qZ9ERJAK0TKCoTweOnt
 +hxBFTEHNiwIemaGOAbkXay92lcrjP172oMbOwoX+zLURsWUyHojWyzT9ZE4tNHs/g5I
 DcRwI4KaQKjRMuPRbVFiklFW9m+WX4YueChH2/p0FfSQq0wEV6wdDON40FRiY3+WSzla
 L5ww==
X-Gm-Message-State: AOJu0YzZJ1PLUpJpN5Jc0GKi9zuJiKgE4RxCfKry3eYZkmhCyfCWjK9S
 d6gQ8tO9yV81AM1N/uCFMSYl4vSu+eSbHg==
X-Google-Smtp-Source: AGHT+IFvnNd4ZodENjjaNpbB5lSq6HlUlpm7IHCA6RCuU/Kqx9HKB3fMEvdE3t4VLitELQtsDWJJag==
X-Received: by 2002:a2e:5c42:0:b0:2cc:932e:6bc8 with SMTP id
 q63-20020a2e5c42000000b002cc932e6bc8mr1992924ljb.6.1703509738514; 
 Mon, 25 Dec 2023 05:08:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 05:08:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 5/5] drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
Date: Mon, 25 Dec 2023 15:08:53 +0200
Message-Id: <20231225130853.3659424-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Writeback was the last user of dpu_encoder_phys_ops's atomic_check()
callback. As the code was moved to the dpu_writeback.c, the callback
becomes unused. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5022d0b9b4b4..8a8aae850a3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -584,7 +584,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_global_state *global_state;
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
-	int i = 0;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -605,20 +604,6 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	/* perform atomic check on the first physical encoder (master) */
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.atomic_check)
-			ret = phys->ops.atomic_check(phys, crtc_state,
-					conn_state);
-		if (ret) {
-			DPU_ERROR_ENC(dpu_enc,
-					"mode unsupported, phys idx %d\n", i);
-			return ret;
-		}
-	}
-
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 7eb8bdfe6bbe..dd9e3603d120 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -71,7 +71,6 @@ struct dpu_encoder_phys;
  *				on split_role and current mode (CMD/VID).
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
- * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -96,9 +95,6 @@ struct dpu_encoder_phys_ops {
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
-	int (*atomic_check)(struct dpu_encoder_phys *encoder,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
-- 
2.39.2

