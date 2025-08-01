Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19AB1847A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFED810E16E;
	Fri,  1 Aug 2025 15:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nj9ScLpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E2A10E8A5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:05 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2402bbb4bf3so13180365ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060885; x=1754665685; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=Nj9ScLpZKoEFkAV+wsln/kK4y9DaIWftzpf9kFUo3aODpBwNm5NN4RB2q7tyXGI0aX
 I+b0MZac7BoyuSOmlsKDQp+BoZu/yXcmeg7SgbDwoypAezrTHuEmOGJ+cqnQS1vGC5JP
 8xkEBP3DfM0JkmFenke2LarVO6mF0G7zEvE0BdIeMb13T2wX+q6fLg9omXMYVbGe6J7i
 IY5QtuZ7eGleHw8A+dwa4UhE37uGbyqff5BKnDAh1BVGj+wr8Q2JrlG0K5VgWIiHQ+lL
 dLTGmJJGEf+Qgr2V00An/0jEl2GWT1DU+XHVHsEM8H+Qds+gooXDmuCXSJA6oGZLBASJ
 nnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060885; x=1754665685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=FxNSthz4oxRt+vUfxBQiz+DokYgw/TyEDN3U8k1vAw6fHbQ0on6xOheerE5NVoSF84
 9SLBrRiK/OyFEgH5kRK4WIthhEfCxHNELtyR/WSq/HcQuKG8pHjBZrKrp331kxGqIL+k
 Jtsue/0mVAc/NnCRHFxwvWclMHIy2u9ghhgf4GxBh41g3V7DIa62hfHZGKvXQyRS/yna
 SYio/MM0EIOgLK95CylrbX/DDNWsV4P2yNJ77M38IrEFygdY8kEgdzoszYUQP/bX3Dh5
 dE1d3YZXJ97E75fIinE0FLeNZDEuOmrbGLgRY0Qr2QRdxSQj8tOz4pOcYhrv8f2YAyDn
 I80A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQQfoiD8i6CXbtUkt5ROdc2AwMLKvrHcvuo8u1/4Av6DLzittOasYqYBH57ORWAhO18Msxt++ep4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxplG9ixPmdQn5mfmmxr/BlWtl51U3koMSFUTmPl7Ij4SzfW6dy
 4Zo1A+s231PqwhV+KK9LfXOTidZ9NG4+FQKlTfvdBa6x4vtglu5EbTNrtff0s4TXadk=
X-Gm-Gg: ASbGncv2j7B9+GXpfgNc3b/GT9q8Sem0keeuNF7K4LzPHXwfRoEzJiNJ/UbkboLD8ky
 GwFsRrrsh7VhzPybqpdUaohni2ZJVmzPC3cCW5Wlrz75XEpLAo5WLvXpr42vf8UlsONio4MtZRa
 Qlg8ZxC0Jz3mUKgMbGqv5zHqC2DOtUMwFLAamXNsw3Zm8SHCOkkPkh5StPUipVGe5Ask3ddCb8c
 cpURfd1p31qwXbZCzD3UZWgjf+1Fui23iGb5Jp4Jpg5J1HCiD4YbFEb5KXJcmtbZWhqFAF9m2QI
 ZLBuPEvsjFJ5bI0JfzqSg+AisID4Ji59UN4suXbiC4l2RVtZMfhx4Z4dQRMeM7gIqKOenv8h662
 O16ZDfnVPbbQ2pFyzfA==
X-Google-Smtp-Source: AGHT+IGiwYm32MVhjAi/R8SAhYPDtoGfgkZqyTUOInwqu82Q9+Cr13JsjqnX0HH3RV2AGlVvh596rA==
X-Received: by 2002:a17:902:d2cd:b0:223:619e:71da with SMTP id
 d9443c01a7336-24096bb3420mr176856955ad.49.1754060885202; 
 Fri, 01 Aug 2025 08:08:05 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:08:04 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:27 +0800
Subject: [PATCH v14 03/13] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-3-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
 b=pF1qZrZf2S+wUGQF/vCeb1xQMwFfn3f+VOwpEVhumT1JmRUWshKxSjhwjlppjnAQvIBf1Y7p3
 1qpy5d8fWD1BpBpuiMdy9fhYKpn68tPwOZpZ/FxZvmQCDofhsmcoE1N
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

