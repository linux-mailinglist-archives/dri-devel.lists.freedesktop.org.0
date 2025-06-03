Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F70ACC0DD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AF910E652;
	Tue,  3 Jun 2025 07:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ARAq5RkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC5210E687
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:10:54 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-747fc7506d4so439159b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934654; x=1749539454; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
 b=ARAq5RkNCY6EjHlpan4j592o0OPVgQxQYvFTT7f20E0g90xZwNoYrSh19fEuX8y2LE
 b/XKDGCnc++1TK+cgL0z1MuxHlK8AMFllO+gxAHe1wKPOI9ttFD93NePeVdSqyTnSTEC
 bALnhWuSONqWjL/47vuCU1GWWndV0P4/YilC+mFja307trH5OG+86T3R/bti1qXCkbhF
 lYoRnQ6/yKzonAdqwrdxv3mS2OZ6d86YhAXd/pnpZ7BnygTOzpOweCBrTLWIN7UGaYxZ
 IxsUhM+B0xVJ76Ux3uXcYHlE5vuyPBv3Gmkx3rKrCL7uqAELgGrvttQ1lfg8RhYkbNw5
 Y5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934654; x=1749539454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
 b=vJu8Tp1DxPl1CKGc7poG+y5s4d4jUhTcfok6c9ch0b4xpSTDwRV90reU8Lr+Unarev
 4fyTsi7gz8UU74Szzcsg+VA/rnlBjTARw9lB6aF+/ESf6sjnqy9nB3z8qQembSxWYyH/
 L9hUj5iV6nEBp+E328EucvJFSSTcfw/5nKER4I0p08lrkxslov6BHPNGR81vGIte9IdU
 HgdvKLWPjUzIsx3Q9cXb4NYpeW8hqJgxQhlaPkbzdhqBuauafCJ520okt264z1AJasXF
 hLn4me5rnbTT2qbAeV04gHJ+DrBVqiBXiMyVQ7sXNNWh72uwlQ8+s4sm4FwX8ZHS0aQx
 CYUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLImMXgjbF2Fziyo+/BjOSg2g9m13s1obSG69qk8fLRISIoPhlI7+50a0baWsuTDcglyHGgeJncTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym0z+arD0CB3xaM0cy9xgOyDFSzE4FiLirP3AtP6d6Z6HXW/aP
 Sy2gTtlA+Hr/Usp+vdbe8BXQJ2k9aqNtOVQ5nQA7MtlW0Z5tz86lVT34MSDp6qT+Dkc=
X-Gm-Gg: ASbGnctBuRWCsec+1e2oZok89WkDDR8cRSdw7q3/rpRqucm/wEBKoqZ9YoO7vrcl8u2
 5CRGSOleDdXGp1eE+ptLN/AaIwlfBOMNgoxiPrfnZHE9Q1ZDghFN2bsHgof95qIWFohzwNdGiru
 CNVCJFBEbh4sjrR6iCYBoSTYia5GFi4V6iqCcvmwAIfAGpoJsendFJTQZfBEs/QHMtpXhKjHUB7
 YCqhY9WcOiIcAGUd2pUP7besCyAg70AZHhVmhbxvWWSaUvY8t6L6TvLa5GE29mO+2pYAwuRmiCQ
 ZMBdzcJEeR59tjGOubBBhmK4ddOsZLvBtdyHnrHPuTRzx7WOHg==
X-Google-Smtp-Source: AGHT+IEjJGNuidzGcf6sJ/A0meCFZ2p/UGTGDCh8kd70ximZ8dtNCwm1meXyCFhsmKPr3Tv9lyZmUw==
X-Received: by 2002:a05:6a20:a11b:b0:216:1476:f5c with SMTP id
 adf61e73a8af0-21bad120c57mr16078986637.25.1748934653870; 
 Tue, 03 Jun 2025 00:10:53 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:10:53 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:03 +0800
Subject: [PATCH v11 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-4-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=uDQ4bz8vnlfaTdZAeHvnaqmYz1iezU6QmXEPd3wO/d8=;
 b=HYENK6zyOmddtj3kw/I4EdLhSrfkzfZ0p/SQUiDA02c89wQHKvf9pcRyzEdpvnvPF6bqlrhpk
 Ql/a0CaLDNpB6KEqsa8tRrmCptdMW8z86dhWOE+3vIpDR0s53qbgC+X
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
index 7020098360e474ee149824a488d912a7ad8ed06a..be8102691b99d3b381476ff844ddfd28fe17dc7c 100644
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

