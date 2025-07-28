Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43C4B13B2F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 15:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2C110E51A;
	Mon, 28 Jul 2025 13:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qvlWicAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E301410E51B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:34 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-748e63d4b05so2671353b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708534; x=1754313334; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=qvlWicAhiv/0VQkqyKAm0lhiLwvc2CcHhXVlkRy0GP7FRHJ+IbkInKL+xPGaCsd6Ex
 Zml/ExrXR87DUd/lbn9rR/XGPkTZZhQpL2KzCV3X0e88wU+PnVmxIw86pu1FmuV5jGJ/
 vI14Rlf29dA60+DFJY08fOP+sFcCo+YwTcH2rHYk873riRVd804cm+f+53zZVhCX+4Uc
 mLnO2xLDDzUHWB5wYAAluVqTai24jadixQl1Q+YnUbL4k+7H/87U5gN/5fNaPotU9zn4
 Dk1/uueKzAz4sPmYhp0/cLAiPjS7CY4vDD33JZkX3dq6ahra31EvcpPR8dfyr91IFjcj
 /TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708534; x=1754313334;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=cjmiOTfgEG3n0N30ymxdf6GpuMt22harCaTbzzHvjNIGKt2FceMIsTLURHG9xkWq0f
 PDRKwAW4t3lxa9hOMmDzbyk+bwBotj3xo9TD8l3OcGqoP7qBQN3/H6uyG6xCI3cT3d9L
 iFi2jV2oc7mYiWZ/sg3bg6hsLMlb5hyF684X9PuskzPrrO31jh/B18ES48KT4Z1o+C1C
 QahXX0f2UqPwmmHEh+wDcFSSfK0Ie1/5LOpO0P9+pb9XcdZv+J0WzEplwQ/PM+E9cUGH
 3ALYw6FBBvDe12zukvjSIRwUcgdqrbTjZbiyLbu2RjfkUnyZXCBh4cHemnP/3xcDOFyC
 9kPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgkmezD13tGamFKQc8J8rbH4IQVQTPm5Y9JNaol2ru71gXS5RCcceglUm2R5n6sYniR2m6aBi6ePc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbpzd+hghpJPipYlJzAEK7oZ2c1RYlCPXwqhcKhZQvp4oLt174
 Zv5PRliR7H4/8QffMaGNZ86eEor3I6gPuAFDvOeic2KsKHLW/GcmcovoYYfpTaxQgEk=
X-Gm-Gg: ASbGncsp2u3fCaGXbdTRDjT6TsbHrUSp36HKx+Y9Y/0FBAczve6kHaFQdC4KrEYIu5W
 x+sbzSbYEuxxExJQezC3qiYetWRQcw/lc8naCSARb9fFTVoio/f5r6HvWu52sgOqaUBqJD454qN
 yqvf5Q5J6KfCHTOgkx8sIg3MIA/QMwklQPdCl1nYJy7ZrGIEQ+bKvdItcZnfqaIkMNSlNse/CZ8
 9+wxPLphYsgBZp+UBp2x7lTuuW5G0IKeTiTRGPUUSk0twWi2R7x6JHG6xCPpx9tV/+YNLpqj49H
 +dVXdACdf7AoAIAqU7tt089pjMb22U3jj0cTtDho5ZE+o4+esDX9wyk8T5WZPQ9XIsn0FeyiTgy
 SHG3SixNhi1b0s0Cawg==
X-Google-Smtp-Source: AGHT+IElrHLNSRkpp4TakILrjVkGR3hmg5svUQ09qVc4AkdHMg4ce49+EeLlHcIrX1twXM5xf+MZYQ==
X-Received: by 2002:a05:6a00:84d:b0:74c:efae:ffae with SMTP id
 d2e1a72fcca58-763345c684cmr16447602b3a.5.1753708532589; 
 Mon, 28 Jul 2025 06:15:32 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:32 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:32 +0800
Subject: [PATCH v13 08/12] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-8-954e4917fe4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=xe1ZNuk2g1U5vK3Ph3VfwdF2b6l7drvSd2mIRWLMeIWDq2L02tMs0TBCIuNmzVK6YMSZ5DLJG
 4/13SEi/vvUB+fEMRFsAovtZCSEuvCFTCsIGTdwHQXd/zYCgDuRsLG8
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

