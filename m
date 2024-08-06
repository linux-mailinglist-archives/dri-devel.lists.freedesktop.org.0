Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2761949A62
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 23:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CEA10E409;
	Tue,  6 Aug 2024 21:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OFKg6Qla";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13FA10E0C1;
 Tue,  6 Aug 2024 21:45:08 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-49288fafca9so381881137.3; 
 Tue, 06 Aug 2024 14:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722980707; x=1723585507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miICkqtphbuqoVPCrRUsXPD2jAyziYTMNx3H/IAui6o=;
 b=OFKg6Qlatq1c90zomsXvX9SidWqpSeomEJNax/Kco+WiUYLFa+ctTCwaoyPhiHuLEw
 RAuhYjR96RcKha9C7N64Zf7TQ8NpvKlraYbdvG+otLuO3rB+vRY6Oek0+1YKzg+VHGSD
 JjqSx10J+GtAOeMiPl0Ri41+lIjKTFLMXFIDtV6bdlUYf1AQD4pc+QO8BtYX3icnOlDB
 2sdm3g8wJvl7THwLCar+ehNB36AZCQ1T7hM7evG4QiiMgI5EiuZDQMSJGjlyIq6rrrid
 Fmfa1CYx6dpJGxjq+nTBjBk5aLf2sZ3MGm5dhvnyMSA55mMfCccE/pLSwnhvxgqanDSI
 NW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722980707; x=1723585507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miICkqtphbuqoVPCrRUsXPD2jAyziYTMNx3H/IAui6o=;
 b=RaeL42ah/YnJTKXT6R6PFe3HjLFrcdpb6PbvzkluS/7cbUx6G23W6yap78f4A9OZKL
 evFS5TiwMO2HH2Uy3GVkM7XhX9c5KDT3CJf7SsYyvPkTLxUoftFz1nv/LJnLCiUIWqeg
 kTzA8IpYgVXNAI0LrPenbQsImQh+N2HaCiasOY/yKj//pShlwel/+gC3onytBKh4HX8f
 ey1xLRkL9o++LPvSdvp6cF2htQcMmjDq8wlJhlZVrcguAHIvYQLghfZKzz9crrE75P+S
 pEGyXcHPpUl0GvJ+mlZHJdslSdSDtUxhy221zZK/CpeiL358b5+uVVXv+lYhuZgIRaH1
 EaOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCnKibV7bWrXq35y6yC5isG+a6jeGRVys1rztT+TYgYZcBFHb1feHlGgQ+qMquFsmuCZD/sf234j/Tcsxr9694PV/rDLcKeaOejQsL7b2zEdNC99rSiOYOj/yrJgtJGYdp2XkA/AdCDhS8/NV8sPpE
X-Gm-Message-State: AOJu0YwRFBHjna3QGtJHvn6AQXBEGZrLOrtSvjpsxYB6X/XzDGilxQ7R
 YUTzr1T2wJw5ELmUkTE/GPyyNvOJSEjXJdq2e3cPdQNMtE7P1+Dm
X-Google-Smtp-Source: AGHT+IE5r8vnEgfmQl8S4kMnDUmuI+D85mg6HCI9z9cAUB9cKYy5kzfXGy5KxXqa2aS2d60cWur+Tg==
X-Received: by 2002:a05:6102:374e:b0:492:99d6:e71a with SMTP id
 ada2fe7eead31-4945be1d04emr20422152137.18.1722980707286; 
 Tue, 06 Aug 2024 14:45:07 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c8631d0sm49722606d6.106.2024.08.06.14.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 14:45:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/4] drm/msm/adreno: add a615 support
Date: Tue,  6 Aug 2024 17:44:56 -0400
Message-ID: <20240806214452.16406-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Adreno A615 is used in SDM670. Add an entry to support it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..fc4fa2a9547d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -651,6 +651,33 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 615,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			/*
+			 * The default speed bin (0) has the same values as
+			 * speed bin 90 which goes up to 432 MHz.
+			 */
+			{ 0,   0 },
+			{ 90,  0 },
+			{ 105, 1 },
+			{ 146, 2 },
+			{ 163, 3 },
+		),
 	}, {
 		.machine = "qcom,sm7150",
 		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
-- 
2.46.0

