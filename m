Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C590D992
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2DF10E732;
	Tue, 18 Jun 2024 16:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c/2vHJk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC43E10E72A;
 Tue, 18 Jun 2024 16:43:10 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5b9706c84e5so3273084eaf.1; 
 Tue, 18 Jun 2024 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718728989; x=1719333789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DT2W54XHt1fLDl14LZ4vb765yKuSefzWt8eaySrAzbM=;
 b=c/2vHJk2596JNktDkT5C7qdZVgiMaaJj/vbHB7so+mvTR/wey90cmSvod6v2Iw18Vt
 Q7rg8OlNiSA0CzyBTIayuagaxNX6x2B7PKlcA8uZbPxYdtihLsQfOvRsX3Vc2aanmbkt
 y+jqZRy61BcIGfofRTPlZIYa4SS4oURpXljFbubY4o9Fjb0TBf6ofjZhf59SgmL88DeF
 i+jAiU1VRjPGdpReskQrM8ksK3L7RIUK/VY87vVaUMD40Rd+hTZrr/mSVma1fDxsk/fM
 7fBGRr8rCXirue4xtfsi1zEX68LDQjf9ooAiBuyVlda2mdQWnBXwzChtXAdH+8nLPDiz
 z/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718728989; x=1719333789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DT2W54XHt1fLDl14LZ4vb765yKuSefzWt8eaySrAzbM=;
 b=Ce74UhslW9keT0NYwaHzA1udMthTebA3Zi5ZaMXLRIhOFtPdPZlli7lW2Clkru5jqD
 /yRRKHDvS2EVAa65v79U64jE6tjrJXl9UqcRmJ6H2POVR01R7IBVY/bdJPsQxoaMSoyp
 t2tRl900vvCF4f37GE0X2Iu8a13j12FihrJ66Y9u7rOxPg8a6npOwTo8QG3zWuvM8SNQ
 AGLq+7Ht9YM5qoJi+6SLvn6u9QWLJOH7za0en52YkygLejWVBgRHEVH9Ug4SvS+QwBwt
 RDPPDeNaUrRTV0Ul7EfoM1HJj7IcYls6lWx+4keLgSwKD09t/AsTF3Uvfr2Av+RIESU4
 0W6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzpIviocxpsXPEZirOlRot3bv+c40jXL73Gds9DYKcn3xy2/6V16lozcumMIGTF8OvhEQYbU7siUiAmClplR9HoMu+DNFjsD1CKvdRu3s0
X-Gm-Message-State: AOJu0YzyP4FXPmmHHRAyEuFVEBGz5YHvSt9+FC7tGOvJkZTKEc2/22q7
 rkXOfoSh94oQaJEw6FR9WhSGDcBHhKPO8NdGmIObw6bA5ljkD8itv3aBMg==
X-Google-Smtp-Source: AGHT+IELxjMBPl9nkbYtcm0qF2QaoCcUcAFTALpCWjUZ3M3MRjUE6itYvT5wn9+xMLnTRwZF0WKDqA==
X-Received: by 2002:a05:6358:5e04:b0:19f:424f:d08a with SMTP id
 e5c5f4694b2df-1a1fd63a662mr40561955d.29.1718728988981; 
 Tue, 18 Jun 2024 09:43:08 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6fede16af59sm8293969a12.30.2024.06.18.09.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 09:43:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/5] drm/msm/adreno: Split up giant device table
Date: Tue, 18 Jun 2024 09:42:47 -0700
Message-ID: <20240618164303.66615-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618164303.66615-1-robdclark@gmail.com>
References: <20240618164303.66615-1-robdclark@gmail.com>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

