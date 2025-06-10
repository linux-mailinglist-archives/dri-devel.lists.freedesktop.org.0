Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FA2AD3A63
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3496C10E592;
	Tue, 10 Jun 2025 14:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lq6xiV78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCD310E588
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4531898b208so1003215e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564397; x=1750169197; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fhJitdsInvgOOCf0kNoqN1nTD4JPV3++bcIAyD0Ca8I=;
 b=lq6xiV78DqRgn3MmHDKcRbs37sTFRFm5Y4bs0g6J/sIRUeBcCXCv1SvSfOdzZbKi/j
 KFa05qcUz8xyeXEzH6OlVC+wgZxMdDWSmKU5ix8jRG0PvL+pH8oOTRrgQlVoEuKKLVmN
 Vn47H/zr6noEda0sYd8u58vRu53PRoo9cHY1Q/FX9Qvr373UFYs7s5kBXNZ637rhwE0Z
 89rLf8ir0zNMFSHhu6n6gQAgZy6rN+HJ5gVxcd6ZsTi0DdSYlYU0Sfvvj8xwe70yvHg4
 fZt0O8f4Wp1yT8Nkb412xCCDfFjKk+aUdZXvARbhsVE8uCmhl5mxUS888V3INWPsj/KD
 NRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564397; x=1750169197;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhJitdsInvgOOCf0kNoqN1nTD4JPV3++bcIAyD0Ca8I=;
 b=JrYhKts0Cu86zlqc9Srb0zBmZjqZmxSU+sLb2mSyML7bS+JNNrxMDRou8lkKbLe1B7
 AGC8S+wSapJcloIqrHaor4WKpXj51pgpCFfy2s8v9Is3zvQlgVgUY8VPErWm4NvG4s8R
 dp76xOHNmRE8W4vJPeWLSCcJzBjpU3A4L/qKqLrObPnV1EluT9k+UWubsGMZcZUxF1y3
 nE3WIm7VTaQUdXmFv7oiCcnZgyyNlxbl/9JqIK/THD3JNz/faIOK/PQU3/mqRypplyHW
 BiJxAfjii7tsBYUlq4v5CnNwCXDdZSzrYKMpovU6N6yLk3UutHnTOGpeNbj+yf1rFP75
 yTuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4JUqiL5sPg4n9wm14ZoJRJlP+uzyAxNwqOO066cUvm1qHc6WfYSYQnkRPQChvXaQ9o2XQKAk1rQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw8FqQApOG+dGZlZWvYA3lyKxO2I0PQwlN8dyrlZzpAJf5T9Tv
 Fm4Hro/FxpGjScQIyDTjO0wtssnYPQXUkkj+NdWeaebt0IIGTzPwG6wdN3GWd2QwUaA=
X-Gm-Gg: ASbGncsVokwXgIo0wJoTbfbaEr8jc4w93gZxEoQ7AWYZyvgLqX3FXbc+DdDOjid2Y4t
 UKrV+Rt1H/pYld4rTL42EVJKh88EjD293Ltpy/EKSDN2dVfWv206UKm8Ny4IkHl6cLK41w+djtx
 N/Uqx9AUvEpZmfLC+kUTK3ilWIPilqeCo9GZLLHVxvTa2XroqmFJLwHzZdfl1E6bKniZcMgUGFo
 I86pqBPt8CjxRObilibqShqG4FZLUrvuoyrQRjyAzw062fCU6dIjJW6e4jDHYfJBGmf3F8GyksM
 WtwRiqtCu/sqMGcLRRhE7cHYPAZ4KsdoFVXT79o9u0RZfJhAA52QDmZB5HKWkR0KCdJY6fvjqYq
 zcFLf4g==
X-Google-Smtp-Source: AGHT+IEkH48jxAjPmiEs0V1xdB1+qZh5Jetyjq3/Ap+Rl/OUN1o0Eg/cerOxzkAbgtRzEPBpAjOIVw==
X-Received: by 2002:a7b:c4c9:0:b0:453:bf1:8895 with SMTP id
 5b1f17b1804b1-4530bf18a02mr23985445e9.5.1749564396855; 
 Tue, 10 Jun 2025 07:06:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:51 +0200
Subject: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of uint32_t
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
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
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ez4rm6PFGrlujB66CVWxeGwNOdP1q/LlPEEBuX2j8C8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvKYX8JuZ1utyAFUJbhgbb79o5eUdq4TvxK1
 hFfk9Ce+16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7ygAKCRDBN2bmhouD
 19NHEACKFn9KQdCuFYHuUiAx1SJj6eWYi2vMCctzJy0GkaTeERePkDCenqfQWHqMJqqGadJIt01
 beXorV+bpdEiyCuukJ2gh16oYGdLswG4iyUIlqD35bMqNv6OXQgHA+AfRoq44t/QPJwL4yu4eQU
 UjdTG+5B2AyD8RfNX8FfdUaOh5PPOjyvgcWeGxf4m7ZFNVOB2ar33N9nvwLupa9ecRX6z9wRchB
 6RTSdwwUn4kc7pwnOn3Ei0eorgR+VreMbzEi6sXDkOYJ5Ghat71CissNbX7lSBqofFjyBdMXMsY
 pgRx9IPqUbyVhI+4IpS0ntiYI/WysKbLt5dyD3HJMpb03iQZ8dDJqeBTGuquJ2YW6gwx/KSI5LI
 X/xL9Np6O5MesXjYg39F+DNK4SsyZE5HMRpNqP25BNWVH3fuRla3f36tS1Xswr6uWwajfsyal6G
 u1ksimaH4DA7MIgnq7CT3sThAqCMKuYiewP5+KHR6pw0DpijUS2cOiEmv7SQQOxktzlUrjdWvtO
 P4yEAIMQqRJpN5WK9Tzsdo6LUbLi+hYj6oX/M3W2ECeq1JNV2htKxnkAmiekL1uDnOkXuyl3Hlg
 3yZvxfv5wQndm/A/+hk3LfZgnKLgnavxakOlW08NB+ZcCvgKVJLM0FecSicaxQZz8aHE5nfa7Ja
 ambj9gvO8vvfGDw==
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

Linux coding style asks to use kernel types like u32 instead of uint32_t
and code already has it in other places, so unify the remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v6:
1. New patch
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..92f6c39eee3dc090bd957239e58793e5b0437548 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -323,8 +323,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		struct dpu_plane_state *pstate, const struct msm_format *format)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
-	uint32_t blend_op;
-	uint32_t fg_alpha, bg_alpha;
+	u32 blend_op;
+	u32 fg_alpha, bg_alpha;
 
 	fg_alpha = pstate->base.alpha >> 8;
 	bg_alpha = 0xff - fg_alpha;
@@ -402,7 +402,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_hw_stage_cfg *stage_cfg
 				      )
 {
-	uint32_t lm_idx;
+	u32 lm_idx;
 	enum dpu_sspp sspp_idx;
 	struct drm_plane_state *state;
 
@@ -442,8 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-
-	uint32_t lm_idx;
+	u32 lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 

-- 
2.45.2

