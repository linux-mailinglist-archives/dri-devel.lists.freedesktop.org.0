Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDBFB13B1D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 15:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C862010E513;
	Mon, 28 Jul 2025 13:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wl4RHOCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40BA10E511
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:14:55 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso5036912b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708495; x=1754313295; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=wl4RHOCOPC9Hg44FKL6U3wWU6sbnrnvnjbRF1CQSM0ODQM4z73gk7FyIcO6UGzQCNz
 Emg9FTLY1XO9JfbdjK7LTjFU3QIy3ks+wFzrds7EylWXXbt6giYYoBXYspc5uNCDGc7K
 f/4pn4mpeZCYyvO/0iVueW2dxQ5nekAF6iDHf75uMFN2gGzWtLSeY+R1QwhxmkdZMd7g
 uTm9t58qR+X0BiMhluiQ6Q0tKHaQnt5vF70gDZAWYg5DP6WuKIMpSsH87k5CUhtqX0Ul
 QPF+ejDIXKfV4fADt1rFUXxPydhp/xICwY/kGgaBWJh+/6RsmaW0EyVdvIL+QchVMqoX
 G+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708495; x=1754313295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=sM9hfdbGsfDG0Ts9Fmr+S9CL1WD0j0G9AQnwum+4bPRJc8NOoOvzFH3d4Dj0CqCTvg
 qEBhzOaaT76Hgpos1f9AzpRJNHPecbgcp4NJ4rFCOa0VjwtHoIRMZWEF4mj7vKgQd3n1
 zBdRC17CJA5u84N6TwctiU4crwoX4iBZze9GDjlBn0cXVuUKBa3i2/NYi4T9RM5lRg4w
 LbGZOieBdOImGJy3aro14A7moPzHIcImtUqQP+S9Ga7dJPemVXFGf7enTXcIxENvSNdl
 sLZ4sjVDOwUjifFMLh8iE2KUj2eJfdDhUsWZuRV6tb4xsI1cxUytZfP1HMeBTA90n6Pn
 r1hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUls8wst+iThW+nfLHmDjujRrJxST9OpsfkzFeqfLHaCHtY9ZijuM+7ItNVvVY1GDJqupgvgxABPA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziSdgAJ5x6L8lo/hJaihOdCkofVYPR25/3wv6uBU3r05MHxker
 0Xuby6DqOetC6PhXWrWB0mtbEjyete6QiAc+o0gA2joSlUtv6VZJeoOF4iT9UoQvpsg=
X-Gm-Gg: ASbGncsZ+lQp/b0n0veUS+ih/dU3Q7xb72rJwqUCoy5s06zYONMAmo22YDiKB6RYWlP
 34FhkWf0/bOOipU6c3LP7lzAdQjeFBNecLuD55N32bBLRIgkOVWcVixmWuFxHkb4U06Y+xR1OyI
 KHZEnhVWqxqD7KHhorT9yJn96B4HNWADyoJSQnQt2vaU57IFAzq7oL4qlRdpjZlEVYqNb8TaZPF
 GqNe68s4SV7+inTZszsWOxEkuW88nxWK1w/jPgvwzlbcDwG1yGe472ZtinhlvLEhrR03ENzAo0i
 eBouVQnave3XACOG5FzH4nVoRm01Da0ICTHCHpoCsvLMM568oM6ix33hG7lSfT+jGOpLaZ8UCKM
 +2Xn9FEGPznW4nnDmJw==
X-Google-Smtp-Source: AGHT+IG/D20ljLwf5AcuzW3YqgNM4owFJUcPZ3fslmNc2hdmZkKFoi04pLcGuW1KmbQW5dWUBibnNw==
X-Received: by 2002:a05:6a00:190d:b0:756:d026:10a7 with SMTP id
 d2e1a72fcca58-763379f0131mr18993904b3a.21.1753708495406; 
 Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:26 +0800
Subject: [PATCH v13 02/12] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-2-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
 b=ZmJJ2xnajYYZ10cD4MTxNnsob6Z2eKXOrG0hOMYC3PDZkQlNWn7dslvtXy+0zhgHpER50XAor
 EIFkXa35K7fAnUdjUnJ25DdlJ3xkpoimu8Hm2MxCMUMfW7WgWHvZg5r
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the mixer as left one;
otherwise, select the mixer as right one for all pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..9a40492e5aa961f7180ba4ac6c86e06fcccef8c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -377,11 +377,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
-	int lm_idx, lm_horiz_position;
+	int lm_idx;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
 
-	lm_horiz_position = 0;
 	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
 		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
 		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
@@ -392,7 +391,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1

