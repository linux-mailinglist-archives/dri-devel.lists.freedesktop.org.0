Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4792855DC0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E6110E4AE;
	Thu, 15 Feb 2024 09:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pGgfbaH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9E610E475
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:20:37 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51187830d6dso682264e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 01:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707988836; x=1708593636; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wz/R+OttvCXysokn6zYBH1UjPAsuemNSOQvMKQiaZxo=;
 b=pGgfbaH+FxvArnlyXUFJMsPEBCOasutpZwQA5BtFJgENdPhcJFl/F4ZnzYA2Q2ZK3o
 oL0hw+G7+RpaHgUDgWDJYXZ1HxbMC04ExifQuC08gBBVeNwYoMdSNlZAKlqJJ5iwcgbv
 mfFrpmqpSjL02qWVnjlXUnv3HnUXeIZGBdo+75MLMWw6GRr11Nk13Dkkp11EI9w+s+Eo
 Kcfbykix8qd/CSpP3BqHcKune1ROiJE2Fix4xtFWAn9mrzRJGwKeiJxhWjxdJxTeGkr5
 nJoJui/zfdWZUnCwmWguFHlG8Uyv2UBXIM7/TS5ALfqBfRsDyCoVSJs4OICc0Ww1bLSE
 IRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707988836; x=1708593636;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wz/R+OttvCXysokn6zYBH1UjPAsuemNSOQvMKQiaZxo=;
 b=T5Aa9F4y6oTMIq1qio7+/uRNInhN6R7CinUU1kQE34GnR6eGJVb4X2h3zVOl7Xilxu
 QuhyRojnppW9BBeEZs1d37KACp+esOvkRMmJLDFlAqMrYFCfhbMCVAo2qplA2Fwl5+FR
 OhiPGnzXrA7yhkF2UxvsuRyLoGCa2kaSrXpX4KLOiyxwliz7hRZGD/4jV+kyNNOC2wOa
 hTiffyASMP5YU5mJFrqpS26RmfjLWI62UjHe0b+iIedNbdlnHgRvewvlHtJN+C8WXadS
 MViShDTSwy/cGyXTNoLGJLoEEjQSBDZqHjtTNbEid5xRdayw+JzQqylbLZrOjg+vg/Kz
 AF7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCULz8wpCrkJlRFFFM8mvt0rXSWHcqp/dYmhjwrvhVrAIQzBVGWhZAVFSx8SRUefSoMiLiOTRlyB0+7yDZsmdcSAsTWxELzg3yMHusiQdMHa
X-Gm-Message-State: AOJu0YxKtmwHgYYDL4b+GW4v9DHFVrXIlKQe1mLcnqnsXuRuKiDFKFju
 y6fKahcL5a7wxqJQqERcsx5xs7zCN32UDa8Anv3ROrBZX/W4pVpaiMxMoPog5yg=
X-Google-Smtp-Source: AGHT+IHBmz4GVIy7zAi8s3FiY53U4JGKrIlZnsRERqf4vG0ewFy912D5q7no0BNnnpGjpNZ9tS3lbw==
X-Received: by 2002:ac2:4e6b:0:b0:511:4f21:4517 with SMTP id
 y11-20020ac24e6b000000b005114f214517mr811967lfs.33.1707988835788; 
 Thu, 15 Feb 2024 01:20:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adfa388000000b0033b66c2d61esm1156435wrb.48.2024.02.15.01.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 01:20:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 15 Feb 2024 10:20:26 +0100
Subject: [PATCH v2 4/6] drm/msm: add support for A750 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-topic-sm8650-gpu-v2-4-6be0b4bf2e09@linaro.org>
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5285;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ixdWRZ9//fnKbR3faHjO8JwXZWGtnv2p+6cX0KLfh90=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlzddcnLjmvv0nTN8GFLC9Fke9petDEfzJ7VXUKlfj
 +3W/SP2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc3XXAAKCRB33NvayMhJ0RGvD/
 9QocmR+Xa8sAWfqhRHvsj7tM+SuPd43FlQR3B7be5t+4qWg95KJW0oalbulAmlNPrCjMG9Jx+hlg3U
 YwSh+MQ3mRH+SjE6SqjVnnlO6YxgHgF7X+c2IjebRQX/BIx3W5wgsJanACdEmA8BRhfynOmxLFFVDN
 9YvBn2jeyx6Zs8vj69Q72rjFO7eLKvUcOBr9CA06EhV0N5qCYe85rJkzHc86GcjEQB2EULNlv5iOCO
 ZH0juLzthp5OM9URIHs7jV8aKTnFxQbK7stw9XMnXLFrZANah/SaOECKbFbK+5aHcPpzZiUlVjA5Vq
 QMMjIw5TvYC2Xas8ZkO4rN04vNCDom3mDETtjcIz5TdZw2aiPqwzd7I3RgpGIFBoNH/68Plmm1oBkG
 JP+zRjZgES2o8MecLmeLwJBIY+OE5cfmohzi5o9Im9jha0aDVTFOqBn294/X4Sp/XnowpOh5CtjtCP
 r3isnEgxpAvj8ZUXfVun2YNSnyfCeUla+2RRLRLUB4BvMdAu08JvIqRsrnUtYyP5lcFsLCsJ0IAmdA
 EI51WCbV0mqxPil1zWVq3VbzewR/QsQLjHwtBTb76Tw0lm7JZbMltmajK9QsbXIi/EKSrfjThqWB/p
 +yyu5M8x6WVOpzG5KdLu3dDCQoiqW4k6oWZxCrWpVk8hm7RBx9UtYM4vsxMA==
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

The A750 GPU info are added under the adreno_is_a750() macro and
the ADRENO_7XX_GEN3 family id.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 28 +++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++++++--
 4 files changed, 49 insertions(+), 5 deletions(-)

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
index c9c55e2ea584..475b601a48ee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -961,7 +961,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	unsigned int i;
 	u32 val, clock_cntl_on, cgc_mode;
 
-	if (!adreno_gpu->info->hwcg)
+	if (!(adreno_gpu->info->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
 
 	if (adreno_is_a630(adreno_gpu))
@@ -982,6 +982,25 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
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
+					     val & A7XX_RBBM_CGC_P2S_STATUS_TXDONE, 1, 10)) {
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
@@ -1239,7 +1258,9 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
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
@@ -2880,7 +2901,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
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
index bc14df96feb0..9e9415df2cea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -48,6 +48,7 @@ enum adreno_family {
 	ADRENO_6XX_GEN4,  /* a660 family */
 	ADRENO_7XX_GEN1,  /* a730 family */
 	ADRENO_7XX_GEN2,  /* a740 family */
+	ADRENO_7XX_GEN3,  /* a750 family */
 };
 
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
@@ -423,12 +424,17 @@ static inline int adreno_is_a740(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x43050a01;
 }
 
-/* Placeholder to make future diffs smaller */
+static inline int adreno_is_a750(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x43051401;
+}
+
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

