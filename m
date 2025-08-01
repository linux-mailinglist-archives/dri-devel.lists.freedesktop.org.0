Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F3B18481
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05BD10E8AA;
	Fri,  1 Aug 2025 15:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TLAD51Dg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0659510E8A5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:17 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b42254ea4d5so653844a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060896; x=1754665696; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=TLAD51Dg1PxaQMIKSTxD2GNx3RSzjtXUa/JSK2BmAtKyd51GN/wZVgSPniXbyyGC69
 ufmISVEXK085cgYdBFXFQ7rit6aPhXlD63nvhwMQ9dCiGLe45yGhfLPn90YNikRC1Zr0
 KSmKO+eX2qjtq30oOR2WRYkiVxLmJNxVjNYRdslN6UoPJfjbalcwtjHw4HYLNr1lUKqi
 S/PJt1baxQnoqEBkEzPgNJos900n/QcWglOsIYqWvKdfKpJyEbaGEKE4CL8xOrjBHuw8
 1pQxleVuUxF2/FzvGtSLGFEKA1wfbGz2lrcVeUWZxu8afK+Ro6RWC9GjEWeO9W68NzVL
 lBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060896; x=1754665696;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=aQ7CKKoNcSOrZ9VQVu2PV5lpcJCTiXosxhIWXjuDKsPBQOQCqxqxZEf7yDdmyayT7l
 5wNdT960GfWNvJKeR+i6rzkA9lcYqRVIetfBzHVugY0Dr81SG/HK63H3H9GZaIMTDiu2
 4ZZZ0kGwSXVNKZwiEO+yECPec3OO5dwrSXs6zSAbOOJ8QbckriPbifbI7iaDi8MGgvkJ
 TaZ7Lm1TCa+HCxD6Srne0ODvcbXWTBv1ehVT8FdC5hvfUruuTu9ewpFYDudVSh82BD5Q
 akBimZzA9RKaUL54olBee6xDCcwNnkchwL7UVhKzFKm9FCnDPGtT4MigFj8inL3CcVcC
 5esQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7SSpP0ftc9nwRjSIr4apC2/yrITdt6WixOf/IjU1hZA9bGZVSQu171Rbeu/CGaKlGSG3WWPTX89o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyy/RQZM4Js1egLRgtvEYllOwWonR+7YT0kTE+r2kgACKLkUjh
 R6yxoMsJHy+pgxjG3H5r64vljoAH0XTQb4OOHVPXVHAQ/Qd5Zf+roVYxOgv/o6bEcxi6EzYZVey
 vv04Y2yp7uQ==
X-Gm-Gg: ASbGncsv3NQgjMs26Hjm4hT21EUHxRnyDPQDD0Ge5ffRMFBTNzVYP5dFahyQ5xuo9Rq
 tSUn2la09j+oSGMgg3Orn/1pIFChw5whEOVPo2MC4diNV2q0No5RHXT+PcEVbDBe9evqzUqRaH8
 591SP5xSyMDh1GxGrVHF1J57IwyiY5fVkYBjOTXZB8SbHLDQF9Kx67/qxp2oDaYKR/GC53E6kHT
 b2DFPNMWgvE/KzK05iPgnmaOFCUrSgnKjMlENi2CheLJSRX4U2xejPpBTIvt7dnSWFGZPhjEqZW
 sTTewKFsZheEWauaGRpws0RUx29sq3z6MleuT2nh+xAhgG/zHtLXboFZgniYxPpudSjDB/mYKAl
 W59OPTNtDteladxX7s+J2u6jHja6e
X-Google-Smtp-Source: AGHT+IHudz1t4fJf3sr8khfrKOYSdpVB9IVdyhQgqd2MsVqkvh+5HSblDsMSI50Mcf3k+J4yGJSyHQ==
X-Received: by 2002:a17:902:e78e:b0:240:52c8:2555 with SMTP id
 d9443c01a7336-24096b3f541mr149384245ad.42.1754060896367; 
 Fri, 01 Aug 2025 08:08:16 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:08:16 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:29 +0800
Subject: [PATCH v14 05/13] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-5-b626236f4c31@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
 b=piKOAwo5yTEkcr2BKcOKNaF1Sf+XaCU5mD8ANyKGtHNopaY0lKYvdcYkzc6Ljvv8AJiJv1oFF
 3tJ60/0cxGuAYLKcYSUzmhTMvdls+3vKwYdvvosKNc6928YAsDKk9Hv
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
index b476d3c97ac9b6b4c5ca2963aa4a5805d57c8d7e..2d88d9129ec787df6dac70e6f4488ab77c6aeeed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1158,7 +1158,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1237,10 +1237,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
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

