Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BD3AAC9E4
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4670F10E6F1;
	Tue,  6 May 2025 15:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hoDlIQ8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3A010E6F1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:48:34 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-30a8c929220so862688a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546514; x=1747151314; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dlKc5OKCjraOL5Xq+zClMPaANGiwyVoqcG5MXUiBedI=;
 b=hoDlIQ8SK2DLdO6bxMyo2t9xCdepuMaTv6oooCv4nSeytEGjFDj65nhEAy3QagRpvo
 hz0qs3dcr43SQX1hUXThzMYQpx3tD2aSTeboXMT5fD1tUjeo9bsajGb071aeYM4zY074
 SsB8l0YW90hKpYtC7VDM8u2dMsXq3DpefXnWxMEAejKo2twZzN/FBqPciMFZU9GlVIwM
 W4+spyxJw35T8IUSNbDluiJdK+C/lO8jsjRY2sF6hsE+p5fo/OcitTlLjVqjp9OXzgvC
 Hfh4HQCrCDHYv+7SDshyFT1W57zUd5XMEMtp6x8lPf2Eb2desR0bRHqAJ4SqI0HG0GyA
 V/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546514; x=1747151314;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dlKc5OKCjraOL5Xq+zClMPaANGiwyVoqcG5MXUiBedI=;
 b=NG8UGE7okk1LgurYTr3m9w2QUI8dni61YxfZY6cciUwH1+zGiR46tm/+J/Uq1E5k7+
 xupUZzmg76YSbO9P2WbFAjqiX6BFXnfu+QNtZ4aucLNm/Vm7Li0hV6XETdmBndDUX3XJ
 AkHKeYj/4yZtm1zlOIWNEHhKStIoMzOHoCSTTZ2azh87ZWmYPB091HOadQx0PYEaU8mg
 aPwSpUgWrKk060KamvwEWMW5XWHKY0FqQv8QBQpcNOLbYLZgyp67K7gvKtu0WB+9AF0B
 FBFSa2SxhkeMMyZE2Zlg3L3YH8uN0ixvFORnAN7Joy/pePY0mQW4tPnW2rWPeuQ31ndQ
 It2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxxR8IjVbEpRm7kxr+IlY6kziusOFvknwe6jk3vTFpCV5ZgFUm81oLNgz7gjclgB/TW8muY4z7HYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFWuNeWX4U0Jpscv4MjTxb0n9xM/umypmPM8vectxdK5JimWCO
 VzRHzhVIkvvhi7rCPXjN4p5ofRAmb97lfHna8tbCaz9DIblMq30AJOQDfFjRjeY=
X-Gm-Gg: ASbGncvzwneXAqsrpA3QqUmnkKHxk2Hw8JjyirtjdJw2nckxHjJwnKbDTiisCTdNPFJ
 D+4pib1EFH8J/wpFy6m4SoRPCEhFrnVrpX9V5ZoIcmJZKHh4+WljNfwfMATi38fxE4x6uUmj7RJ
 QcxhE08avXXAOZMsJKf7FwjA5qQLu5hL04Nnqzvf8BtDF1i6gOYVmkSIDw+0tZGpic2693Ik3EP
 DHoNtqaZYYKwfEb1Lrcw8uU1v7BCG4/BubBL90ABfIsYAS6IsEg71244ZUYOwL0Tznb5D+mwE4R
 1BWLsPI0OZF1oY18rvjxZUBdS/yIaKQWAQo0nQ==
X-Google-Smtp-Source: AGHT+IGoJn2EvCDGjtDpBNSI5Ux2FQ5/eerIPyReEspy9plxak4A9pNzUDInz/bSoQf2uKP3NKltmQ==
X-Received: by 2002:a17:90a:e706:b0:306:b78a:e22d with SMTP id
 98e67ed59e1d1-30a619a1979mr16535974a91.20.1746546514126; 
 Tue, 06 May 2025 08:48:34 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:48:33 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:36 +0800
Subject: [PATCH v9 06/14] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-6-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=/Vf7BSjg/MaihhtMFivLw4bpSJ257f4gu0+UsGFzZC4=;
 b=VB+iiFa0JUzWXa8nR4U0Xk1+uQn3FrT56o24OMqbgG10ZXKL2Je/ktWohVnSjsezBF+tleH6C
 HFvipTLbJuOBlSSOKgpzp9EPkIEOUPCzdDibIEupyUzU23Yu+/IPIUQ
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

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3edfcd7d49c1efb2b7ed2b9f0cc38a4b3073acf6..3e4ff345bd6d9c0e2a08274874fac40690409cf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1157,7 +1157,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1236,10 +1236,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

