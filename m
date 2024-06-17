Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611590BF40
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 00:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A49F10E51F;
	Mon, 17 Jun 2024 22:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YHmHHKQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADB610E51C;
 Mon, 17 Jun 2024 22:51:39 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-70df2135439so280847a12.1; 
 Mon, 17 Jun 2024 15:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718664698; x=1719269498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qs2LRDL25XC0eQkz6GWFbApIQSCbebyxejk4WZxajq8=;
 b=YHmHHKQCFrqpvgBynPjmyR2FkC89Wuy1NUZig6I2PJDc2iGFl54M2YLvlZ5aKiWE07
 hJkWenj4or7CPH/9hE+xDZHicPy5BRgkSc78MwlUQXhsd+HYzRCc7cNJNuCJptjAeFHo
 j3nAhAnZDStYSISc6VULaClcRS/YEgB6X4+oNKI7k4T6z9ps/4h3pWhiw+SB2y0CDQBO
 YNtgDR791NxtBEKLFJ4Ar7E1WscYSq+qOKtQJpi8PbtXLWHR467svKmxsvePCE6LyTqZ
 VRkigkxs4GM7JAIEfbU5wEPgp/ljMrOenpIip8JIh2PQSTPs+7QzsBvJn3vftcxsGie8
 rhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718664698; x=1719269498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qs2LRDL25XC0eQkz6GWFbApIQSCbebyxejk4WZxajq8=;
 b=ZplO2TYJg7+N3u7wDIW/NQhfreEx4j2o5NJ5SK9zpMv4k6fC37pz1M6u+oRjzFtq9O
 IiIjSQsv2YEXeRnA6G1WaSOlqPrxky2pKDJeYTRrxocH5zrUTONg7qo7IxBj4uHzyyDB
 2QgX7Q8t1SJ+IKGCHH6kNRa7F11Cjt7P5AvaKz7aN6gAcDLuoBea0lrpUlHru0HqXGso
 YGoEqkwiBgmxgnB5kLioUwe8+AdoI63YcqQ/Lfo03g72iYDTmY3ZSMU/J1bYu/nNRgzj
 dNhzKBy/oNXyV+Nvqpm/3mruxsxswOiAv3sHaHGCnjZ6Bfp7KgbHbuK8jHIJIgP78cA6
 Ekhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa/5nlGthS/ICILRhHFgV7pUQt2FZKbfm5eMzvXDAeo4vQIN8Za5+Cx4qFha/DfdJ8IMgZ35spjKPd75XCHG2Ynos9kIGQOn0wm/jsE5yy
X-Gm-Message-State: AOJu0Yyprs8GhohSE3xZTbyfvBhD0TeaODzRYV1B4Wfc7FDq6pS12svN
 rHJrxqxbX6v50yUvP7HaeprjHAEdGkZjOL4LlgtdvwMTeFMP/iWEJkN5Mw==
X-Google-Smtp-Source: AGHT+IEaAiKjYNf7072YC2nmsUK+DKB2ZdSAsLbwIvU5u9RYMSEOAnGoHZPtrxLuWdXPMpVXDZ7x1g==
X-Received: by 2002:a17:90a:da01:b0:2c2:deda:8561 with SMTP id
 98e67ed59e1d1-2c4dbd44edemr9586647a91.41.1718664697116; 
 Mon, 17 Jun 2024 15:51:37 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c6fa904db7sm200904a91.27.2024.06.17.15.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 15:51:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/5] drm/msm/adreno: Split up giant device table
Date: Mon, 17 Jun 2024 15:51:11 -0700
Message-ID: <20240617225127.23476-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617225127.23476-1-robdclark@gmail.com>
References: <20240617225127.23476-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Split into a separate table per generation, in preparation to move each
gen's device table to it's own file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
 2 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..a57659eaddc2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
 MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
 module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
-static const struct adreno_info gpulist[] = {
+static const struct adreno_info a2xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
 		.family = ADRENO_2XX_GEN1,
@@ -54,7 +54,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a2xx);
+
+static const struct adreno_info a3xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
 		.family = ADRENO_3XX,
 		.fw = {
@@ -116,7 +121,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a3xx);
+
+static const struct adreno_info a4xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
 		.family = ADRENO_4XX,
 		.revn  = 405,
@@ -149,7 +159,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a4xx);
+
+static const struct adreno_info a5xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
 		.revn = 506,
@@ -274,7 +289,12 @@ static const struct adreno_info gpulist[] = {
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a5xx);
+
+static const struct adreno_info a6xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 610,
@@ -520,7 +540,12 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
 		.address_space_size = SZ_16G,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a6xx);
+
+static const struct adreno_info a7xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
@@ -582,7 +607,17 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.address_space_size = SZ_16G,
-	},
+	}
+};
+DECLARE_ADRENO_GPULIST(a7xx);
+
+static const struct adreno_gpulist *gpulists[] = {
+	&a2xx_gpulist,
+	&a3xx_gpulist,
+	&a4xx_gpulist,
+	&a5xx_gpulist,
+	&a6xx_gpulist,
+	&a6xx_gpulist,
 };
 
 MODULE_FIRMWARE("qcom/a300_pm4.fw");
@@ -617,13 +652,17 @@ MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 static const struct adreno_info *adreno_info(uint32_t chip_id)
 {
 	/* identify gpu: */
-	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
-		const struct adreno_info *info = &gpulist[i];
-		if (info->machine && !of_machine_is_compatible(info->machine))
-			continue;
-		for (int j = 0; info->chip_ids[j]; j++)
-			if (info->chip_ids[j] == chip_id)
-				return info;
+	for (int i = 0; i < ARRAY_SIZE(gpulists); i++) {
+		for (int j = 0; j < gpulists[i]->gpus_count; j++) {
+			const struct adreno_info *info = &gpulists[i]->gpus[j];
+
+			if (info->machine && !of_machine_is_compatible(info->machine))
+				continue;
+
+			for (int k = 0; info->chip_ids[k]; k++)
+				if (info->chip_ids[k] == chip_id)
+					return info;
+		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..17aba8c58f3d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -114,6 +114,16 @@ struct adreno_info {
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
 
+struct adreno_gpulist {
+	const struct adreno_info *gpus;
+	unsigned gpus_count;
+};
+
+#define DECLARE_ADRENO_GPULIST(name)                  \
+const struct adreno_gpulist name ## _gpulist = {      \
+	name ## _gpus, ARRAY_SIZE(name ## _gpus)      \
+}
+
 /*
  * Helper to build a speedbin table, ie. the table:
  *      fuse | speedbin
-- 
2.45.2

