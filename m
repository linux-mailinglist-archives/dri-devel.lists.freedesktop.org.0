Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C7851119
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAFA10EC40;
	Mon, 12 Feb 2024 10:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lRhkUZf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AD710EC12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:37:39 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33b0ecb1965so1631582f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707734258; x=1708339058; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qwfVS+Td8YMY3ebZOXzlWppW1EsDh7tKAqBML4ltt8s=;
 b=lRhkUZf3hMvA3VYMqdUQ/Puny2dzLZwR7QHGdCyAHBmwkVNjhwCygrblJ7QaaYJV/7
 d6Vvxs0pdoe2mJG6FpwfPGGbbdfjyfEfIsurDkL063x8/hUqHEkLTlXH4voz5GZniyny
 sAd0VUhUonXkQ/kjre1wlETYz2DQnnKNvriGUy9zjmm4nl22+TdYl+Nh6RVabXfzH8Ed
 mK2PK1iLDS8w0GOtYk2DZ0T1ckdf9AUn2T+wrrBq3JMmvrpMezqPavuFXwK+hLUIs99x
 jQXWvUy6LpT0NLLQAhzlE/YmpOcmUkZqXpBIQJEd4RcRARZWfEuaUYouJntYjWvqoGxl
 WXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707734258; x=1708339058;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwfVS+Td8YMY3ebZOXzlWppW1EsDh7tKAqBML4ltt8s=;
 b=nTJq3tg7536922A+lSRJzYjd/hxrF6ffFEMUU6uEmoWDG3yBgeRNz09FiJa2VLFA3I
 AEApBDukmD3Mf3PGEPH1gDTrz39iOjdEUmv1KuTuiSI24N7pvLUkWHK0KmKR53mzrLwU
 CD2ky8CXvf4lAFgY+daGnAVecRbYCBmXSLf631CtSg0lWu+yEtg6SWdqLX4IR3kkOw3l
 Rjh32UM8hpB4zKLBDimdbEorP3yORyJ71JiQBRIFFhTm5NlBydRj/S3AFjcTdHn5ZuxS
 ZNCL2rzd6ccgFsTrmdgq3bUMOWsiUiwAkC5GoXm0nivdiCys+OzJlvDyTu+b3RG+DSJU
 sSFg==
X-Gm-Message-State: AOJu0YyS4ucmeS6hkVCXz1kjrnjrR2l3Uz865JwTbNLf7gsMmIFygUbW
 21Xsoj/sh6Qp8lzNq7MIM7+J4CwB6BW8qf+d9Y+x7VpG9MUw/Uzsh+O4D+CdMD0=
X-Google-Smtp-Source: AGHT+IEQtq2AHm4t9HcgSlYTWQXT0RGCuNdj6soxDlrJUvyimvD1jZUMhQaLHejrTv+rWCw34YghDQ==
X-Received: by 2002:adf:f686:0:b0:33b:28c1:e06c with SMTP id
 v6-20020adff686000000b0033b28c1e06cmr5092634wrp.15.1707734258245; 
 Mon, 12 Feb 2024 02:37:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUIk1JNz8mk2hoGGhDXh/2srQQ9PK2tPz398CDMBZ/y7jFw8TZy7KjbDIwmeh3Q6h6vjMpCVm54t4/0HJf/K18Nad7wbJhaGc/S2ld0CSkCDJfkLt8604oBoc8hzYsKfR3DeseSfJK9MF4qfvFxYHRgj8vyjhrwL0YqpWptYo3vpYsAUOAFGKZnSVroM7YCcamRWJYuhHu3vKmsVQHI2t0ca6LeDiwrjwqhD0UH94UekC4xwS9OxshOb+997v2KV7t1rkwesCtjskdMWP7qmqbGcfY4qjpmiQRXWDLZKzdWdGq/RpQWeByzDo2ZQLZWiVYUL/cg0zrIkhR908yE+XoJ+0wFU7flyZwS/I+8zaGg/CZcV7sQ2wmZRVhPviB1zMFDDdwBK8iEvAmPzSvN5DUnGkEFjiHZtTrEWjughjrsK92mAOLEn2gKWP+np9pUL/UspE1ohRhrE2KOojHAAp4XYd8sFIS8gIunzheilDO1xAofpQlQeLCDIG/Q8SID8/g8TmwAjplzr94leaduoiIb6Nk3oX2aKfeTYjXDvJ/qxv2Qlp2ZDLa8WbVaVlONRzRP6Dcnj+F3QqfJYzeKHwqd7jKnnimRaev4cfUvEhtXN/r5q3ClEKNU9z3Uuy0BkTs209Us5f/yNLOBAyUbsc4RihEoNNzjIwSUVul0s/g2hTPQLfpIJ3BswRLXOPXYBnWdb7RR2xzORMh46P73WSe9RF1el6V3qtwY1pkqMMKRzgS1Q7pUnxr8+630RPccjSWyeq12TpQ0IKMskkOqqySfF0KnRq5vDX7IjzJ20peDkDYVSW9FWJpQ5YUTJgsKf7DEuZ+RKpEikNJdTleP8ogrRA22PuiFmJHkeQ=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056000128e00b0033b50e0d493sm6404188wrx.59.2024.02.12.02.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:37:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Feb 2024 11:37:32 +0100
Subject: [PATCH 3/5] drm: msm: add support for A750 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-topic-sm8650-gpu-v1-3-708a40b747b5@linaro.org>
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
In-Reply-To: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6851;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RNniP+qswI5RqcE3Ubm/zb68mwKOg5y2zMVsmk5nLVc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlyfTse4tXxKdK0Ywk9dyZ5FE187+1tsRdMdBdtBKV
 +FU+rgqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcn07AAKCRB33NvayMhJ0VSiD/
 9yQKgsdOzLVqOdaLDryQN50v7Vu/kchj8l/EzwMdgEPssFZIdywNz6fNnhb/8WJ87LzarAE22TJNOr
 GdNa0WHnNZc0yqQupGbpNKiBiRyjCO5J0kiUwOVG3zPenppu3saPIHKIDj1tPSiITWZzjjpc7CG4Vt
 9V7Q4YMZr59FkFGjUX7sjuu3JhWlE+/tREe2KJ7LhzsWAJxmQeoD/vP9TuCgJHx2MUI81UX5gm8Emy
 mO7C0IezPwiBApxDaWmFk7IwLStq/QkLxApd2WZbGCmr0yPrCaPeheOJx+TYGLBXgxPQ9t49GY0ixc
 U8fFJ227wxB/4I5Hn+H/Q9Kk+kWAsZjq8mvR5H5v0z3asYEQukvHhrZVa0o7hlAbhaE/TNNq+uJmaf
 cgWAWoOVExxcSdIt31aPLNtD+HfOuaNLkDeyccfo75JZ9GKiA0nEBxTDLdZ3WszGEo4k3hV8vyH95b
 ygOLD5D77VXcShl+y+jA/3v4xdlbbcuBPlElNnRPcvFOPVj65UbGxMDgZpS3FGTOwhlW1ppAEe+Fuo
 5//f1G1otr0lFJN1L4hPPxAzdZn6kseINvZvtgFCujSC+ouv4Qdql19v4lsBc+TG8n3wt5hiIbYj+8
 oAplH9eR+t9YB1jNTMWqkJNuX+l9+r3Za1otXOTScLyqst68ORJS5BRrjDwg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Add support for the A750 GPU found on the SM8650 platform

Unlike the the very close A740 GPU on the SM8550 SoC, the A750 GPU
doesn't have an HWCFG block but a separate register set.

The missing registers are added in the a6xx.xml.h file that would
require a subsequent sync and the non-existent hwcfg is handled
in a6xx_set_hwcg().

The A750 GPU info are added under the adreno_is_a750() macro and
the ADRENO_7XX_GEN3 family id.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |  8 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 29 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  9 ++++++++-
 5 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 863b5e3b0e67..c4db4e0c0819 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1725,6 +1725,8 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_BLOCK_SW_RESET_CMD2			0x00000046
 
+#define REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL				0x000000ad
+
 #define REG_A6XX_RBBM_CLOCK_CNTL				0x000000ae
 
 #define REG_A6XX_RBBM_CLOCK_CNTL_SP0				0x000000b0
@@ -1939,12 +1941,18 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_CLOCK_HYST_HLSQ				0x0000011d
 
+#define REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD			0x0000011e
+
+#define REG_A7XX_RBBM_CGC_P2S_TRIG_CMD				0x0000011f
+
 #define REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE			0x00000120
 
 #define REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE			0x00000121
 
 #define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
 
+#define REG_A7XX_RBBM_CGC_P2S_STATUS				0x00000122
+
 #define REG_A7XX_RBBM_CLOCK_HYST2_VFD				0x0000012f
 
 #define REG_A6XX_RBBM_LPAC_GBIF_CLIENT_QOS_CNTL			0x000005ff
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8c4900444b2c..325881d8ff08 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -842,6 +842,8 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		 */
 		if (adreno_is_a740(adreno_gpu))
 			chipid_min = 2;
+		else if (adreno_is_a750(adreno_gpu))
+			chipid_min = 9;
 		else
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c0bc924cd302..472991584053 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -958,10 +958,11 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
+	bool skip_programming = !(adreno_gpu->info->hwcg || adreno_is_a7xx(adreno_gpu));
 	unsigned int i;
 	u32 val, clock_cntl_on, cgc_mode;
 
-	if (!adreno_gpu->info->hwcg)
+	if (skip_programming)
 		return;
 
 	if (adreno_is_a630(adreno_gpu))
@@ -982,6 +983,25 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 			  state ? 0x5555 : 0);
 	}
 
+	if (!adreno_gpu->info->hwcg) {
+		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
+		gpu_write(gpu, REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);
+
+		if (state) {
+			gpu_write(gpu, REG_A7XX_RBBM_CGC_P2S_TRIG_CMD, 1);
+
+			if (gpu_poll_timeout(gpu, REG_A7XX_RBBM_CGC_P2S_STATUS, val,
+					     val & BIT(0), 1, 10)) {
+				dev_err(&gpu->pdev->dev, "RBBM_CGC_P2S_STATUS TXDONE Poll failed\n");
+				return;
+			}
+
+			gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 0);
+		}
+
+		return;
+	}
+
 	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
 
 	/* Don't re-program the registers if they are already correct */
@@ -1239,7 +1259,9 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		count = ARRAY_SIZE(a660_protect);
 		count_max = 48;
 		BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
-	} else if (adreno_is_a730(adreno_gpu) || adreno_is_a740(adreno_gpu)) {
+	} else if (adreno_is_a730(adreno_gpu) ||
+		   adreno_is_a740(adreno_gpu) ||
+		   adreno_is_a750(adreno_gpu)) {
 		regs = a730_protect;
 		count = ARRAY_SIZE(a730_protect);
 		count_max = 48;
@@ -2880,7 +2902,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	/* gpu->info only gets assigned in adreno_gpu_init() */
 	is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
-		  config->info->family == ADRENO_7XX_GEN2;
+		  config->info->family == ADRENO_7XX_GEN2 ||
+		  config->info->family == ADRENO_7XX_GEN3;
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2ce7d7b1690d..e2582c91d7e7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -522,6 +522,20 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
+		.family = ADRENO_7XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen70900_sqe.fw",
+			[ADRENO_FW_GMU] = "gmu_gen70900.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "gen70900_zap.mbn",
+		.address_space_size = SZ_16G,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index bc14df96feb0..744fa18067f8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -48,6 +48,7 @@ enum adreno_family {
 	ADRENO_6XX_GEN4,  /* a660 family */
 	ADRENO_7XX_GEN1,  /* a730 family */
 	ADRENO_7XX_GEN2,  /* a740 family */
+	ADRENO_7XX_GEN3,  /* a750 family */
 };
 
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
@@ -423,12 +424,18 @@ static inline int adreno_is_a740(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x43050a01;
 }
 
+static inline int adreno_is_a750(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x43051401;
+}
+
 /* Placeholder to make future diffs smaller */
 static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
 		return false;
-	return gpu->info->family == ADRENO_7XX_GEN2;
+	return gpu->info->family == ADRENO_7XX_GEN2 ||
+	       gpu->info->family == ADRENO_7XX_GEN3;
 }
 
 static inline int adreno_is_a7xx(struct adreno_gpu *gpu)

-- 
2.34.1

