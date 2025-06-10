Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297EAD3A68
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5909210E593;
	Tue, 10 Jun 2025 14:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VeJ8mxNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCC210E591
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a4ebbfb18fso482492f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564403; x=1750169203; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CBcl3mtlA2qXlHBtwB5KJDW+hrhCZib9hqqSTtK3hgY=;
 b=VeJ8mxNHNTegl3DYSrEfbGrqQYHAuc6C0PIgg2d1dw2TeudaqIL5CKrkPvTb+PzP1g
 b2l0ViRGHeV7vkW19ubFguxtYaZbyr0M91XyX4ryc9VtGrikFwYpDlB6wW06ErSEx2oC
 G7AQDPeS/GePuLgPuJ5Iq3oj3CbgA6EU1MlPtgfxxAqxs02n9WI1kKHfGys9TByBiZ8N
 JU+focCofYNJwUaV9J3FWJgzTHy100gaAtPe+uLtiZ4O6Y5+UZI/zYXtmZwyYxsfePDp
 85hqRGafn4p+P1PrKoRuvXzBG2z9ZpISTANE/HxP0yoJfROk2mHLHMhh0wfbTZEmnjZ2
 U43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564403; x=1750169203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBcl3mtlA2qXlHBtwB5KJDW+hrhCZib9hqqSTtK3hgY=;
 b=eALXDRl9jEAsAVcpEi8muec1mDOmzrDRXPZEQqRqpEq9WuVCLly/kgYheyr3dHBdGg
 5/v1iQq+QmSJALRQ93vncQFJM0lz+0UKBsTgE62jdNgujnawB3cwlV9yhmP3RBf0ybOG
 /zzyZdAsDYnL1GzgIW9zbeyVgXA0AAoNQDoQOWxJHg4RfhEzNGoc7M7bINcN1n9NmF/s
 ujh9Rv8MAfyUPV3X6dcSeaIv844VAA2mlSH3BNfNCuT7D6dUsS7UJnM6/YxtgDS9C6/G
 Fzgx2zwP9yJidObwiWk7SrV/yOCew22oKWiJGPtswNysNcF01y71aAqINhDUguUs9Nwp
 adyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBbZnYhTWO1Edv5ooCqnODpNlDIdg9NiFtXyirXPiua7C9YrmEjKFAfnPS6fovegA6PhF1bLqjD4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt4HtQ5xJjTJ9FXLSe5auMuIcllOxfeNHKFaye7xdMm1B5+3Go
 M4ZIUPNnG/+9A0MjYxksSvzuP5o+FobA+caVhxR0apaKrFKQzIU2wUrrqa7Bv7eXJwI=
X-Gm-Gg: ASbGncsXmqoVMrCaYlWwuwjzBf6ipmMiREIdI2Nuk2S1oqswWovQoT2h9k57XnrNH0o
 ohc0M97Ql4KgUmMjMJ2n+HlEAYF4G2vfdzPjO3eZlWwuwcbLPdYvIQ6vCge9etZoDuMOTcafB6a
 QMrcu81PwqbSVJSlfPKPjLZYTgfRHH/IMDjbdcgAXJXJE1dDz+PWY/zw03YuIHxnuphtStIFg7g
 a4waxxSUay/Fr9Eaq1nrunFkxHKMOlwOc8YP3CruJzhMAMF2Uy12S1u/+29obDD67bo5q2Cw5Dx
 jaKvB85DjPu1q0XeRBWNaxu8YmphEUFQX9knZNIVDH1pdxZ1TiZIeIbmaX0JuVTF6nDHuvx+Vbq
 1wpeqtg==
X-Google-Smtp-Source: AGHT+IFnue5hc35VVNgvb+VArzqO/xMlK9wQa6Q2rScaAFY6GDOjKfFaMoYtpeOxRfR6atMZBXHMzQ==
X-Received: by 2002:a5d:5f8b:0:b0:3a4:e0e1:8dc8 with SMTP id
 ffacd0b85a97d-3a53319cb6emr4791148f8f.9.1749564401173; 
 Tue, 10 Jun 2025 07:06:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:53 +0200
Subject: [PATCH v6 15/17] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-15-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6580;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PDdJg5qIS7HbPoHRu893zZjvEEa3IuzpHJO/F1Hc654=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvMj11z6OwjHQNIAPJQ3fXNkq2xWlp9svl9k
 1pofTOhOXOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7zAAKCRDBN2bmhouD
 1/mRD/9fsunALr5xCqYqRm1+udEXhJyuzA6VBVaxqH36ReMkUZmNkTtGNZ5l5Bkv1AXIaRw98aT
 xStOZ0TJ1wpjKwGkcOnYZ1ocBgKQabXSYrGe/bMRcrkLW96WcvZrzKXsaZz1uMiCn9HKUh/ZhrI
 UleqjsoasJPBeWWkWFgbeWUgriFkpxpQy9vw3M9Q6oMFjlzPlqiNEssXcZMZpQWIlJD40XPQl7o
 92G2z5hfXZn5XQWtstlQzp01i5+2pvLONcDjvfbAptVVhPHXkMqleVJsMCjr21b9UbDtTE3IomF
 hewtTpeGEE5ADFDtmqB20bb85WUvqPYksxzlQHRGhx++xNdJ/DCVv0SOL/KHOt8BdE+nL7zv+90
 qaC9z7ywNg3NM449nP7Bv3TDEfd/R4bUc/9KctsX2EFAv0VME/OdkzML5/czCqRBcSEAcA3PBz2
 M8nXXk+9kloa+Sd2w87pbKQToYTfmhL37mVvsDaTFW1xdc8HJXUfbGcmHJYmuCe65/GjBFpFFz1
 2mV3fKYv4C3pQ04PiNwl2kA14e/blcPmzLdNbsqpRTFmCv0PcvWoF5dR3x0PsoIMT9mni2bAo30
 HjtvO14oNWMPN975mal2ojmvqppLb2o5dCUXDjHyiv0luugrGYODx0epiMGNCkx0bI+Z7g9quHF
 VkNSkYypmckAJlQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

v12.0 DPU on SM8750 comes with new CTL_PIPE_ACTIVE register for
selective activation of pipes, which replaces earlier
dpu_hw_ctl_setup_blendstage() code path for newer devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. Lowercase hex
2. Add Dmitry's tag

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 29 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  8 ++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5e986640c8ce5b49d0ce2f91cc47f677a2e3f061..50897de0ab55c2d8dc2e6547b9f3a033a3ca9b45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -453,8 +453,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	u32 lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
+	DECLARE_BITMAP(active_pipes, SSPP_MAX);
 
 	memset(active_fetch, 0, sizeof(active_fetch));
+	memset(active_pipes, 0, sizeof(active_pipes));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -472,6 +474,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 			bg_alpha_enable = true;
 
 		set_bit(pstate->pipe.sspp->idx, active_fetch);
+		set_bit(pstate->pipe.sspp->idx, active_pipes);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -480,6 +483,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		if (pstate->r_pipe.sspp) {
 			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
+			set_bit(pstate->r_pipe.sspp->idx, active_pipes);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -503,6 +507,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	if (ctl->ops.set_active_fetch_pipes)
 		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
+	if (ctl->ops.set_active_pipes)
+		ctl->ops.set_active_pipes(ctl, active_pipes);
+
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
 
@@ -529,6 +536,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 					mixer[i].lm_ctl);
 		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
 			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
+		if (mixer[i].lm_ctl->ops.set_active_pipes)
+			mixer[i].lm_ctl->ops.set_active_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c0ed110a7d30fa1282676e3ae4c9f1316a3a3bf1..a52d5a74759ed9b1b12a0f00ee2417d9ee37fef9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2197,6 +2197,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 
 		if (ctl->ops.set_active_fetch_pipes)
 			ctl->ops.set_active_fetch_pipes(ctl, NULL);
+
+		if (ctl->ops.set_active_pipes)
+			ctl->ops.set_active_pipes(ctl, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index fe4fdfb8774b176fb024d76dc0bd269d9736d226..4299e94351d5e5371a86608f5ec1246f0cbe4290 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -42,6 +42,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
+#define   CTL_PIPE_ACTIVE               0x12c
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -681,6 +682,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (ctx->ops.set_active_fetch_pipes)
 		ctx->ops.set_active_fetch_pipes(ctx, NULL);
 
+	if (ctx->ops.set_active_pipes)
+		ctx->ops.set_active_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);
@@ -737,6 +741,23 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
 }
 
+static void dpu_hw_ctl_set_active_pipes(struct dpu_hw_ctl *ctx,
+					unsigned long *active_pipes)
+{
+	int i;
+	u32 val = 0;
+
+	if (active_pipes) {
+		for (i = 0; i < SSPP_MAX; i++) {
+			if (test_bit(i, active_pipes) &&
+			    fetch_tbl[i] != CTL_INVALID_BIT)
+				val |= BIT(fetch_tbl[i]);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, CTL_PIPE_ACTIVE, val);
+}
+
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -800,8 +821,12 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
 	c->ops.reset = dpu_hw_ctl_reset_control;
 	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	if (mdss_ver->core_major_ver < 12) {
+		c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+		c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	} else {
+		c->ops.set_active_pipes = dpu_hw_ctl_set_active_pipes;
+	}
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
 	if (mdss_ver->core_major_ver >= 7)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 9cd9959682c21cc1c6d8d14b8fb377deb33cc10d..ca8f34ff3964c1adaaacdd3f0a60572da53870e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -258,6 +258,14 @@ struct dpu_hw_ctl_ops {
 
 	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
+
+	/**
+	 * Set active pipes attached to this CTL
+	 * @ctx: ctl path ctx pointer
+	 * @active_pipes: bitmap of enum dpu_sspp
+	 */
+	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+				 unsigned long *active_pipes);
 };
 
 /**

-- 
2.45.2

