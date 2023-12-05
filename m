Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10674806158
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 23:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487D210E635;
	Tue,  5 Dec 2023 22:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC02D10E634;
 Tue,  5 Dec 2023 22:05:52 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d05199f34dso30615705ad.3; 
 Tue, 05 Dec 2023 14:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701813951; x=1702418751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5yrZcj0L7R5fVIqHHQw88+R5BW4TNBtSToLE9gd5Nw=;
 b=c3aXrzIcyO9Qk2JHHfGfaIWzOJSXOJvcAg4hF0+Ial7rH78K8A/HXUvd3MK3wF182z
 A95sfC12PPW44zk3G/mbVTMWPEKx6hoQfAaL+m38NvVbqOR7BXeRZm6ykQXRcXKOtptg
 tFNnsEYvpWA2x0Iht6UxlxJP6MBfkfO8kL+gexPl6PCOibB6wmUTFgKlMyABdphMmHKA
 XzOGqWnGInrgB7/USbZ5eYfi26ptoDd5Stbuas7j5fuyVwhL8tWS/XH9JZxLfccIG7l6
 TgGwKKAfDptUcoxBD1JzHCs/rUKydJy5RCWjAO8yMHKrLBIrvRW4qTvWrT88fT3CynlV
 okzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701813951; x=1702418751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5yrZcj0L7R5fVIqHHQw88+R5BW4TNBtSToLE9gd5Nw=;
 b=vgi3LRS6wYlAmYYfwZBYT+xGdI1eoP1ZRevuzSDeEkSUhKRnMYqa2TapxmHCvnVP0l
 S9xCihDlFEypxunnKQzTwn0xS/bfku/s5iwWxKXNT/hbtGVpex2kvq2i7ka8pZsiJqwf
 87O1voUsWX9hbxWf9PlQgG0qvGh5urBYDFh7ef9lRAUrUh/KUBnFUnW0kO7jiYOThGAp
 RXmh4tP17zeJSWdgjcc+fJrKmS1cIZl02uhGAlkz0h3CZtqHJ0YzM+avKpZY/IpdCNLp
 +B4baR1ww+KfXpSTxa/PlTxBvv17FBOprKQ0heErUu/hF2b809dCTwcCTLpDR57eGr6P
 WllQ==
X-Gm-Message-State: AOJu0YxJ+YwEM/0viWuFqaumBlxQ6r43AAi+SNKBZwsn1lJqr4N4ONlI
 8FY7Y/yTW2RnHYCD1UX1bT+TybbKvKo=
X-Google-Smtp-Source: AGHT+IEmaGG+tvdz3a+ByDoEWPtAOLL0wsA7CrDJmtjIDNBf344HXBzcHlTMPCAHS06IrzcbU/e9gw==
X-Received: by 2002:a17:903:2d0:b0:1d0:6ffd:6e66 with SMTP id
 s16-20020a17090302d000b001d06ffd6e66mr5008100plk.94.1701813951180; 
 Tue, 05 Dec 2023 14:05:51 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a170902eec400b001cc436e9806sm2186997plb.81.2023.12.05.14.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 14:05:49 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/msm/adreno: Split up giant device table
Date: Tue,  5 Dec 2023 14:03:27 -0800
Message-ID: <20231205220526.417719-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205220526.417719-1-robdclark@gmail.com>
References: <20231205220526.417719-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Split into a separate table per generation, in preparation to move each
gen's device table to it's own file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 59 +++++++++++++++++++---
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 41b13dec9bef..36392801f929 100644
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
@@ -55,6 +55,12 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
 	}, {
+		/* sentinal */
+	}
+};
+
+static const struct adreno_info a3xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03000512,
 			0x03000520
@@ -110,6 +116,12 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
 	}, {
+		/* sentinal */
+	}
+};
+
+static const struct adreno_info a4xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
 		.family = ADRENO_4XX,
 		.revn  = 405,
@@ -143,6 +155,12 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
 	}, {
+		/* sentinal */
+	}
+};
+
+static const struct adreno_info a5xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
 		.revn = 506,
@@ -268,6 +286,12 @@ static const struct adreno_info gpulist[] = {
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
 	}, {
+		/* sentinal */
+	}
+};
+
+static const struct adreno_info a6xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 610,
@@ -493,6 +517,12 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a690_hwcg,
 		.address_space_size = SZ_16G,
 	}, {
+		/* sentinal */
+	}
+};
+
+static const struct adreno_info a7xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
 		.family = ADRENO_7XX_GEN1,
 		.fw = {
@@ -522,7 +552,18 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
-	},
+	}, {
+		/* sentinal */
+	}
+};
+
+static const struct adreno_info *gpulist[] = {
+	a2xx_gpus,
+	a3xx_gpus,
+	a4xx_gpus,
+	a5xx_gpus,
+	a6xx_gpus,
+	a7xx_gpus,
 };
 
 MODULE_FIRMWARE("qcom/a300_pm4.fw");
@@ -557,12 +598,14 @@ static const struct adreno_info *adreno_info(uint32_t chip_id)
 {
 	/* identify gpu: */
 	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
-		const struct adreno_info *info = &gpulist[i];
-		if (info->machine && !of_machine_is_compatible(info->machine))
-			continue;
-		for (int j = 0; info->chip_ids[j]; j++)
-			if (info->chip_ids[j] == chip_id)
-				return info;
+		for (int j = 0; gpulist[i][j].chip_ids; j++) {
+			const struct adreno_info *info = &gpulist[i][j];
+			if (info->machine && !of_machine_is_compatible(info->machine))
+				continue;
+			for (int k = 0; info->chip_ids[k]; k++)
+				if (info->chip_ids[k] == chip_id)
+					return info;
+		}
 	}
 
 	return NULL;
-- 
2.42.0

