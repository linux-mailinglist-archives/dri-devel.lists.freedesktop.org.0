Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE2A5CE7F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176EF10E678;
	Tue, 11 Mar 2025 19:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tTtxhkbr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C324E10E677
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:32 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3912b75c0f2so337399f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719751; x=1742324551; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SYVsKKZXPbcsvKhlX6Fd5jgnf07udLWPUc7NV4+Tv/w=;
 b=tTtxhkbrQXbFpKQfnTf2x0N2ssTNUQOrkbbsMF/4sD3WxvJJmO1+Sk90jGXevGB6re
 3ktzHChPTesORThKvwzF9goikBHCqtxceWj8ogyzmpt+uPmN45FapCcB//D8fddKPRUU
 NQis6iiDcwNmq32aS27P4MRuXsIMUbjMJiIkz3Pe1HRRz0GnGBwkxjXk6mXZTjD1LKqb
 9RfaFPW3hYhcxJMJbScDXsXedNN5FmxooOYL56pa/aiBEKRSOB4EwaSkcUvMm4dk/aUB
 d3t326ulVeBoMV47az81jski500apOsROAZlqOYOYGdNI8vSDIsH6dypqa8Xzqjz+2XN
 +jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719751; x=1742324551;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYVsKKZXPbcsvKhlX6Fd5jgnf07udLWPUc7NV4+Tv/w=;
 b=cz+uGOZuaIuiH1JzCCHGtXMBLEW3glg547Rzw+uwih61HKgzIsNckQGkBwT+tBnc7i
 Np/eIWLvsOMiXFuokaso3uSBUfjzhnvvm+Jx0HuVMy+gXU4swrdzL/YUZNVYSJj8BVKY
 WudAKBWf4Dk848eHiI4ea9ZY+fpdxhsxIBzJ3FQnLXvT9/8o5F2wpz0X/7xEBsyBNSij
 CXAyWIARdANh5vqZx0DzB6tGp7FoIJumWt3QTjmU7tnBzrvXyxBrj4AnPVC1hxnpc9AZ
 6NHFbIMeXRgohTzvUbW7GqNTIMbKkFmKhK0lHmJHQoJBHEIj1+VLrr2NQao9+15QoOne
 MJSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFxmEHw3UPsVzd8KGmt/wlkRp0DChOGBe9wTyuZVdqy8zQMrc+GTFn/in+cns4Is+i5+oHCzg1Ppk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJW9X0Hjs0RSLcDeuxml7iCSy1GR1Lm4LSoNq/hUExoinH86RQ
 aQSXCHqmEbJpqjttCXTz4KTKFQD9AxajDU7GsxkH5BFpfiQ6tGKpFFQQnZSlz6k=
X-Gm-Gg: ASbGncuOaWWk9xApKc8XhXStIkAeGfrd9cidetIiWuaNn5oXozHrsWjpnKk+iarBwgV
 HzRGyM41YknStfluCA8of9h3nb00fpQiAB6oTaMHGHr8rL1N2WlwQDiEb1NnAn+rA5AfnphlzBR
 js+VGK1HYzoqZleOLLyfDMOHiIM4JC2+LP8AwT7duggb/gSJkY9sH4Xs4zNYEBNrqVE4pT7aoZO
 Pt8RFjhcI23XSdC8jOiTnvhJDXmWlLudNeM7wpa80wY0bPG4N0We8l+SgMRQMjq3hYKIfNq1va1
 EeLE9YGTy2kOZergliM2D6SLt0MRIqDW7hOSeGPfHpiSbIOIDAIT8JARa18=
X-Google-Smtp-Source: AGHT+IFeAj+5/SP+w+sioHObmuTMmOAxjZrAJ1qq2pGl7Cp+Hhprgf1sKwAtJrii7xugoWDGpTYx/g==
X-Received: by 2002:a5d:648a:0:b0:391:c42:dae with SMTP id
 ffacd0b85a97d-39263edca4emr2158682f8f.4.1741719751259; 
 Tue, 11 Mar 2025 12:02:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:56 +0100
Subject: [PATCH v4 06/19] drm/msm/dpu: Add missing "fetch" name to
 set_active_pipes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-6-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ydQVVgPonZ6qPuLltGk9wSNaGdVcoqspWvQbVsOodfM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IiqfzAgIoP9umfZorOErCkdQm4O0c00MtUUw
 PWEMw/1mDmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqgAKCRDBN2bmhouD
 10XwD/44cSmku2CjH8R6xEDkxg919YvbUcx9L4KjIhmXMt2VP2vGrRTr890lvff0+7KyBpaLMzz
 jmARiJu0porgJeiUrLpGBOi8Iv9LQzXW45mzD143grC/CXBpFnwsTxo3BBSYF6/GqmJKq3kvrEE
 Ur0nkhgBdc2cwdVWGm9AgRZaLuh9S1KZzvLe5xg1FgZ7DPsOE2qiYYMPaDJnmRxke/6NICRo/1y
 7sS20wyuzpoRCLT0jMg6WC4cCOt+36g7CAJ1zWZ1joLa+JJFMTOqJta1E5ZaSMg7PQV1BXNDrM8
 TjleUcmurjihWBkFEVl2KFRk+bpbl79tVM+fGzk9e1U29Pz0aiFx5qRejVUmlkGBmoP3qU2UWks
 zMfpZD+v/f6A7s9sBVzqjGCYl6MlgrAqcXY/qmRBIGIEhy1fFUfYv9D78HYU0rMIPMu+Lek6kIS
 Ddp69/dpbCdD5aRYNP1YEku3B65ykmTEc2/Q/tYMlRVBSJJmy0GrZ1jOXoirwTp0atdw6hdn3c4
 C/j2sPRo/+8XT2lyZ1bCpNf5xY0ENRqFW4rg7FuJuI4eVpZaNxOQSXnPECyJaxUSGjZ3b2S6+sg
 UTzPnIaMNz0ni+dtgVDDkP8hkExPCDm59aHosoi7c0YAg/ftlMsD1VHmZStmk7SsXqSKjf2cwnk
 ubNuPzr5ItQt0nw==
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

The set_active_pipes() callback configures CTL_FETCH_PIPE_ACTIVE and
newer DPU v12.0 comes with CTL_PIPE_ACTIVE, thus rename it to
set_active_fetch_pipes() to better match the purpose.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d883523e5c53bfb42f932234db76c58db..2d7af6fff2708c12520a78cc6c979b9930dffc95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -445,9 +445,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
-	DECLARE_BITMAP(fetch_active, SSPP_MAX);
+	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 
-	memset(fetch_active, 0, sizeof(fetch_active));
+	memset(active_fetch, 0, sizeof(active_fetch));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -464,7 +464,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		set_bit(pstate->pipe.sspp->idx, fetch_active);
+		set_bit(pstate->pipe.sspp->idx, active_fetch);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -472,7 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   &pstate->pipe, 0, stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
-			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
+			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -492,8 +492,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		}
 	}
 
-	if (ctl->ops.set_active_pipes)
-		ctl->ops.set_active_pipes(ctl, fetch_active);
+	if (ctl->ops.set_active_fetch_pipes)
+		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 216dfcabcb92d410ce185c0d34db69c99930d2b8..951d5dccab6faf34a519d06683514aea1ee6ef60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -698,8 +698,8 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	}
 }
 
-static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
-	unsigned long *fetch_active)
+static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
+					      unsigned long *fetch_active)
 {
 	int i;
 	u32 val = 0;
@@ -787,7 +787,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
 	if (mdss_ver->core_major_ver >= 7)
-		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index aa560df698ed4e57a25e4a893d7333e19b065fe8..1b40d8cc92865e31e5ac4a8c3ee8fac8c5499bbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -254,7 +254,7 @@ struct dpu_hw_ctl_ops {
 	void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
 		enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
 
-	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
 };
 

-- 
2.43.0

