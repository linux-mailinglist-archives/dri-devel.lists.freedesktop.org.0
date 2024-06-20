Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B06911526
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 23:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC4310E0E4;
	Thu, 20 Jun 2024 21:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qnxv201+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386CF10E0E4;
 Thu, 20 Jun 2024 21:52:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-57d21b1c8efso1331524a12.3; 
 Thu, 20 Jun 2024 14:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718920333; x=1719525133; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4PfbEs1C8SkvZmo4+nwHcxpTvuiwrdBVKtL6B4M3SqY=;
 b=Qnxv201+5B2ujgLQ/WBZ32XRKKfjNTiA7qZJafnbYX937hwGLsA46iOK7nBpbEGfKC
 D7cYRP3FHgmqFS1kwX3OeewIMAisCHN8bBUWobSyQOKV9sp7vsELR/fCfLOWQboWGKlI
 PLBH10Ta5Y2aI3uWdMhyGWwi6+6Q0MxsutwALGsVWPQDOqRDpycKGftqRLUzv7b3dLhL
 KXwfqrmrCDWik7+NsDp43bcPV4ZytIVlJF1HPGCGFSAN5uFxoTvvO1kP6lodIw2OwOjm
 PTVjFgpE+3Xb2GX7KZIyIm262zG6rtgWbeh47H/+t7gnSv2KB1LILkGPhzxg0embkppX
 mZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718920333; x=1719525133;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4PfbEs1C8SkvZmo4+nwHcxpTvuiwrdBVKtL6B4M3SqY=;
 b=bQ6F39Mt7t9sVUVR4GYJgZb+ds3+joUxIudmyZegglZI/mbe5B141dSBVtRcFbSa8M
 qlhpNrohAaayg+zgqSxyTLwaSIfu33DMbA90wpd27N4Dqh+Blf2G4fctWk2ADsMCw7/B
 c2FqHFbBf4HhBjQb752+8pnnAowyUYSmojcps7e2Q3TtPFNk+Ffh2INQ44StTDAQjfD/
 T3nblCj4rmZE6goEHa9b2NY4HLTaeMa1ZN4A7zBCPcjgi84LMpmCo+XeLb2+D93OX9bF
 IFwnoeFAEa6UD0R7fOHAMGvXAQ2rZ/STHEn57v6nneaLELT2EQN0838QUQscJVKyZIQ7
 K0Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEM2SxlpULgLvUrw5rGNMG07LocF8KxkecxqCgSa00O9b2s+FU+rYjc6kXgzLPj6DtiZOj2XOh5LT4kJvYKKKG5fppQMBb3UqVq0MNQtD8y+e8T9Ws1LsK5w/cTGz4o/bek+qGAJbn8Ds3RXTQ+HEv
X-Gm-Message-State: AOJu0YyyG/9cyHpJD11IL1GnolU4YHOuukZV/u9OqaVRrcJfusJfDkie
 mpRDYpoQIvp/4jYwPhHjvPkjzpwIv4ox14nSMXUy0UO3eocsW/WP
X-Google-Smtp-Source: AGHT+IGnc2o/KQaEM68uGi8PrWr3sDLJsmNHZL8AdbVkEJ5WsQzrQZoRNCK9RAXEoutmUgSecDByug==
X-Received: by 2002:a50:d4da:0:b0:57c:68fd:2bc6 with SMTP id
 4fb4d7f45d1cf-57d07eaab61mr3355795a12.26.1718920332879; 
 Thu, 20 Jun 2024 14:52:12 -0700 (PDT)
Received: from [192.168.1.90]
 (20014C4E1812920074CAF9406985B739.dsl.pool.telekom.hu.
 [2001:4c4e:1812:9200:74ca:f940:6985:b739])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30535005sm60919a12.69.2024.06.20.14.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 14:52:12 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 20 Jun 2024 23:52:09 +0200
Subject: [PATCH v2] drm/msm/adreno: Add A306A support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240620-a306a-v2-1-0d388e1deebf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIikdGYC/13OTWrDMBCG4asYraugH3s8MiX0HiWLkTROROO4k
 VzTEnL3Ks6i0OU3DA/vTRTOiYsYmpvIvKaS5ksd5qUR4USXI8sU6xZGmVZ1BiVZBSRbZN3b3rQ
 Rgqi/n5nH9L0574e6T6ksc/7Z2FU/rv+FVUstlSWASCFi6N+OE6XzLsyTONyfZObrVy1anq6Yu
 BTaiobmdeNAo4bWKrsDAN1VMc8+hjPljz9u/wj0VFjWMaVlaLxzxvcuEPpgLYyEbAIq55TvaET
 FEcd6jjXk/gvuY3GTIgEAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 20240618164303.66615-1-robdclark@gmail.com
X-Mailer: b4 0.14.0
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

From: Otto Pflüger <otto.pflueger@abscue.de>

Add support for Adreno 306A GPU what is found in MSM8917 SoC.
This GPU marketing name is Adreno 308.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
[use internal name of the GPU, reword the commit message]
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v2:
- Rebase on https://patchwork.freedesktop.org/series/127393/
- Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@gmail.com
---
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
index 0de8465b6cf0..61aeac5054a2 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] = {
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
+		.family = ADRENO_3XX,
+		.revn  = 308,
+		.fw = {
+			[ADRENO_FW_PM4] = "a300_pm4.fw",
+			[ADRENO_FW_PFP] = "a300_pfp.fw",
+		},
+		.gmem  = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03020000,
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5273dc849838..b46ff49f47cf 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -145,6 +145,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x0000000a);
+	} else if (adreno_is_a306a(adreno_gpu)) {
+		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000010);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000010);
 	} else if (adreno_is_a320(adreno_gpu)) {
 		/* Set up 16 deep read/write request queues: */
 		gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x10101010);
@@ -237,7 +241,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
 
 	/* Enable Clock gating: */
-	if (adreno_is_a305b(adreno_gpu) || adreno_is_a306(adreno_gpu))
+	if (adreno_is_a305b(adreno_gpu) ||
+	    adreno_is_a306(adreno_gpu) ||
+	    adreno_is_a306a(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
 	else if (adreno_is_a320(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
@@ -334,8 +340,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_CP_PFP_UCODE_DATA, ptr[i]);
 
 	/* CP ROQ queue sizes (bytes) - RB:16, ST:16, IB1:32, IB2:64 */
-	if (adreno_is_a305(adreno_gpu) || adreno_is_a306(adreno_gpu) ||
-			adreno_is_a320(adreno_gpu)) {
+	if (adreno_is_a305(adreno_gpu) ||
+	    adreno_is_a306(adreno_gpu) ||
+	    adreno_is_a306a(adreno_gpu) ||
+	    adreno_is_a320(adreno_gpu)) {
 		gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS,
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2) |
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6) |
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b8ee9320a315..3b361a077688 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -292,6 +292,12 @@ static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 307);
 }
 
+static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
+{
+	/* a306a marketing name is a308 */
+	return adreno_is_revn(gpu, 308);
+}
+
 static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 320);

---
base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
change-id: 20240528-a306a-48e173724d6c
prerequisite-message-id: <20240618164303.66615-1-robdclark@gmail.com>
prerequisite-patch-id: b26cd6e5aa23ea623fec94f938a06d1e3359de55
prerequisite-patch-id: 301e8fe4c2687a4606ee7debce95a5ada732e27f
prerequisite-patch-id: 24a5654d9b52079c010b0594d8599d84af1659c7
prerequisite-patch-id: b09a3d28d04b7ebe968e05835ebf8397c27f8d7d
prerequisite-patch-id: a74556e25862c22f0ec543b8a7c7d92cb2e55099

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

