Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F022AA4C59
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B949210E795;
	Wed, 30 Apr 2025 13:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SyAbwySZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346910E795
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:57 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43f106a3591so8098635e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018116; x=1746622916; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yzhYahmw+H9gbm4Y3D2con7mrJ5Tg0tJCNCQTODTDkE=;
 b=SyAbwySZl7GLmCYcMM1DFPAhAZ9kYvfXasRndS/hPdN6QA470aLTkNg1YNysGdwpia
 j9SOheP+GbXu6ZoZ1Hx3MLrBr70YC7/f7heaSUX52hShG+d4/hZTx2kjCPXMTkA76GWR
 OVjEcx11vuMiGgr0DO4UlfoNPVCYJ6SgSWSnmgT+ho31wMyaTmhQXbEtJygCUjlwx6E/
 SEc6SXGJ4y29wxFC325zzRA6PIpeClMPzy5TJU3KZZxcjYNLmatzPw40/qWQKexpaB4b
 gS9iHSi6DmNBRZtM2L3zilvXvHFP+zPlVH1Hpsuwt2kWKVzKGKRQeDHAiKtgKY2Gzjd+
 Vlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018116; x=1746622916;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzhYahmw+H9gbm4Y3D2con7mrJ5Tg0tJCNCQTODTDkE=;
 b=o5NhxJ0r6AJuazDkWydKTsoxuaCZ65N69AK38mJdkneHD7KcEbEFE5IVg88DksAnOv
 EJ27x10dMyxyWyCmNeUoclXD+O7qDjRSPbkKbHnHPttQp4Lz1v2WjR6TFh9cP8CKIECw
 wKCxEETwMjgLQDnyGGv6OXHRoStyd4pzeLtcARWpI7TwRhtjwPVqEs868SC5Hhi4+2pm
 cbWePA3UwtKNa/V/nSBjclUor9j/SqZARvAMcOjTXBMtihm2k6GxRoNV1UUWRBxGEjX6
 7akRwK4+fwM8Sn62QI8vcGnNPJ/195CrZoMgmWGmzrHfLBYMMnjYr1K/QV7jhPHVF+tg
 dTvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK0LIIkC830/LbZw+j6/BV3IZRmYOnVIHOnUzLCcrtDmiBxD0YHHI5o2Wyffjm3Fl4vqzImIxzrG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr9G9d64BxBKap5GfzZ4uylSXLUsh8NE1WqC17KCqh2AAwlZT/
 MUq+qyP2JUIKlZaDZML9IIqChTXMURQGaBNyIYL5z5BxKxg/2HI8wmJCwkHsNVI=
X-Gm-Gg: ASbGnctDwL6wxZMlvjI1LnCBWU7yZ0OAy5OpN5rZ/wIn+noJEhk7k5ICRxjmeBKDevJ
 8EPEsaT/NNbIYOb1uEn+k+Ir+tBWz5qiso0hFZ3fghFqJAVut+1Mhu9uXVg+jplTAkfv9bZhydN
 tZeKDqc0lTEcapwOM4D843J1f/2rH+JvYVzK1st1eOUIGKxYzs/ZE690w4epDv5VYkhdwUNMpTM
 +w+C2+QWXLRlRrLjKvFDR/fWScI1nrqoA03Xac+O0/b/whT/++FOmhwak3qigDww2IgcTwIxJTW
 DErLxo6CjM8PIhi2UDcNtY3t0ytvDrWcEzf7RlQ9+TfMHxD2FHX6VOVuNgQ=
X-Google-Smtp-Source: AGHT+IFo8VYUzDRMuke8HVTHKbT7+GYbcmtPP9UcvYmMIiw8q6+WF0aQ66fhD1Qy5CZZGjuuyjgm9Q==
X-Received: by 2002:a05:6000:4310:b0:3a0:6c12:237e with SMTP id
 ffacd0b85a97d-3a0900a04efmr639548f8f.16.1746018116187; 
 Wed, 30 Apr 2025 06:01:56 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:52 +0200
Subject: [PATCH v5 22/24] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-22-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6585;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lLu9J0xPeh4fuQnpuP/MCXYnoAZidwfX8MWsr+QfFO0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8NDpTfcMj3riE0rJJaQ5xUnJcx5vw2CyyKG
 othtTenXcqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfDQAKCRDBN2bmhouD
 1yixEACYQsRE7+v/65z+xt6hErsoAzd8s43zL6EfpZ3gyUpMeIRXrlxceCWtW4BFU0xCNkQtmMR
 FKIi4tpjuAEjguqmN5V9YSOY/wkyJiBOHY1LRcNeeigAfZa27hC7Tqv43ZeIzgJYtZzzOHGhI2L
 1dhsV1c/FKxHmM/WRlZAmRpx7lkbtVfw3ak8fSmDnpw2qQ6rtziIbgWfuW3ljopWb7/tW6o9D0S
 gk6YKjbhI+BFUb6zseUAfX++G6orteCdQ/cjG3uOIZRZpiXjo4gWFl/IlPK5sEBWprCSBIh25/4
 mRPw598Vl5WPq/pkf2C4HUIP3KJnB13otDaSptqn5vFU8MdE7SPMmtjD38tAffJboQe33aLGqAy
 442UjKWPXUlLlZqCySHdbJLT1rL57bhM5hWVDqiHJcmNNqC3kwthPGg7rvV4uIBFmNHeoJS8xr3
 WJ8KtWCDXYVvfbov0VwEg+gSnMbBwppCqO87Pneh/3O0Ohy+ZFDdV14qXAxyeMHJPI60pEx6QTH
 3sSTUUNnX73llYQv8M8XNPtczpEEJn08dN/nXCJXEDdH0OoM3cMq4z8DVRchfVAtlQkGIxwDmIS
 W8A4QA4FXc8LBhH5zCyzvwttYexO+/Zd+7e0UQ2xDHaWJcfGdz23ar5vKVbGJK1Wd2li5jFP+Ey
 VERNd1WzNl0/oMg==
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
index 90f47fc15ee5708795701d78a1380f4ab01c1427..3135e5ab9e8121f3dbd93dde9458f007ae45392a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -452,8 +452,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
+	DECLARE_BITMAP(active_pipes, SSPP_MAX);
 
 	memset(active_fetch, 0, sizeof(active_fetch));
+	memset(active_pipes, 0, sizeof(active_pipes));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -471,6 +473,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 			bg_alpha_enable = true;
 
 		set_bit(pstate->pipe.sspp->idx, active_fetch);
+		set_bit(pstate->pipe.sspp->idx, active_pipes);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -479,6 +482,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		if (pstate->r_pipe.sspp) {
 			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
+			set_bit(pstate->r_pipe.sspp->idx, active_pipes);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -502,6 +506,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	if (ctl->ops.set_active_fetch_pipes)
 		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
+	if (ctl->ops.set_active_pipes)
+		ctl->ops.set_active_pipes(ctl, active_pipes);
+
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
 
@@ -528,6 +535,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 					mixer[i].lm_ctl);
 		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
 			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
+		if (mixer[i].lm_ctl->ops.set_active_pipes)
+			mixer[i].lm_ctl->ops.set_active_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3d4000611656f2d3173aac27891a51402f68ddf3..52ae79fe8ba8537b13948d924b68e39c5ff4c753 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2193,6 +2193,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 
 		if (ctl->ops.set_active_fetch_pipes)
 			ctl->ops.set_active_fetch_pipes(ctl, NULL);
+
+		if (ctl->ops.set_active_pipes)
+			ctl->ops.set_active_pipes(ctl, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 3e5e1e09e9d00ade74371489b2b4e50e648e2d16..c9c65d5e9d36d3a4ce2aef9f57da631f2acd9123 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -42,6 +42,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
+#define   CTL_PIPE_ACTIVE               0x12c
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -676,6 +677,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (ctx->ops.set_active_fetch_pipes)
 		ctx->ops.set_active_fetch_pipes(ctx, NULL);
 
+	if (ctx->ops.set_active_pipes)
+		ctx->ops.set_active_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);
@@ -724,6 +728,23 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
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
@@ -786,8 +807,12 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
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
index 1b40d8cc92865e31e5ac4a8c3ee8fac8c5499bbd..186c467e1a64e71116b65b19dd8ecdbb09dac114 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -256,6 +256,14 @@ struct dpu_hw_ctl_ops {
 
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

