Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A5732377
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417FE10E57A;
	Thu, 15 Jun 2023 23:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76A610E568
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:42 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f841b7a697so2158091e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871301; x=1689463301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H5OQWuvJy/T3xHAc2qI22ip6fixXu1CAHhQ7rMwwOdM=;
 b=GGQGGwvZzGEoyEYuwcCs6zm5K8nI6wrdIr8o54UDXC2fVW42uTgXhoou5Q9DD6gEyJ
 Jsy51cZAsKsGNiFwgjFJomgL13NF+dDtVdKllY6lPm3Xo3FUdHPMaXT4TlMALp3pDxut
 oDQP8F7BnQeMoYtogfAsOmjgBewRBp0HGGzB7odhpdqHCkaQpGj5GhEFl5nFChA/TGM4
 TiJ+NzsBPABaCm604IpF/swJBouCTQq52vdzvyQfSbMSx6NI0g2GV9QeRirjzMaAFuh7
 yu3RpHMy5SzwO4u8B+rPMSB7SKLHdXzDNL7nxjgWclbvqtovJQSMkn9iCxm5LaSDpZw1
 R95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871301; x=1689463301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5OQWuvJy/T3xHAc2qI22ip6fixXu1CAHhQ7rMwwOdM=;
 b=fqiNFCsy7ldVEHzcL0vo1WYqBPl6csggeFbIgcdKiMgo3epqYU5+QdpcRs/Ja8/0E0
 us+lp6+zvcLrTH/oNQZnMf8lJ20AlRy2+sOijRz3WPGOv8Q+tVROiwmem7SHMKFIBpOO
 +EyhFc3+Nbw0M/dZ8ACLYr4LczDLOZ4fV2eS+M+II8pYT2RNfBUBgtiQ+iIcxy8hvre5
 4HqRkZr5JRROQK+ZQEM50OC8sTqNOosYwVM9GUI06BJqQcUPIeXalaKzI+4nGcIluVSO
 WkMfKVW8Cdu7rBhiPFY9U5PPgYiBBpGK9X115ckxZgA7YPRS1eDZwbeGdti9Vf8tUM2M
 oWZQ==
X-Gm-Message-State: AC+VfDx5El54+W73CpqE5w0VMKXcnfavQm+L6HurCwxuq2zMI/DsboCe
 N4+bsG6U1PIKKNpkj1cMjI2kz1qYRgc8zxYRP7s=
X-Google-Smtp-Source: ACHHUZ7aPfCvg81ro54l5dgMsYNGWj3BbHYZbmr3xwW6JEpyT3r7SGAa/MV/kHNBCHCyGCoLZujDxA==
X-Received: by 2002:a19:8c1d:0:b0:4f8:4d46:aa9e with SMTP id
 o29-20020a198c1d000000b004f84d46aa9emr78961lfd.52.1686871301182; 
 Thu, 15 Jun 2023 16:21:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:56 +0200
Subject: [PATCH v9 15/20] drm/msm/a6xx: Add A610 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-15-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=10797;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=o1jpKvRp4VpeNX3sBcuDTmgqNGNcqTvXnAAs/T7l/OE=;
 b=slpXbwZogsvwgsh8jIvnGAYfqRUkgGGMB7R6iwOVmNDvzNtDsSTavqHBds3Kqew3yEJvVHXx3
 T6Ka1icytmVBH73KLRWhUlUYa8tgopE4UceQxnsp9W+5YrGLZjrZpq9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A610 is one of (if not the) lowest-tier SKUs in the A6XX family. It
features no GMU, as it's implemented solely on SoCs with SMD_RPM.
What's more interesting is that it does not feature a VDDGX line
either, being powered solely by VDDCX and has an unfortunate hardware
quirk that makes its reset line broken - after a couple of assert/
deassert cycles, it will hang for good and will not wake up again.

This GPU requires mesa changes for proper rendering, and lots of them
at that. The command streams are quite far away from any other A6XX
GPU and hence it needs special care. This patch was validated both
by running an (incomplete) downstream mesa with some hacks (frames
rendered correctly, though some instructions made the GPU hangcheck
which is expected - garbage in, garbage out) and by replaying RD
traces captured with the downstream KGSL driver - no crashes there,
ever.

Add support for this GPU on the kernel side, which comes down to
pretty simply adding A612 HWCG tables, altering a few values and
adding a special case for handling the reset line.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 99 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_device.c | 12 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  8 ++-
 3 files changed, 107 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2ca9e0440396..47aafc9deaf8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -252,6 +252,56 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a6xx_flush(gpu, ring);
 }
 
+const struct adreno_reglist a612_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{},
+};
+
 /* For a615 family (a615, a616, a618 and a619) */
 const struct adreno_reglist a615_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0,  0x02222222},
@@ -659,6 +709,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
+	else if (adreno_is_a610(adreno_gpu))
+		clock_cntl_on = 0xaaa8aa82;
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
@@ -669,13 +721,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
+	if (!adreno_is_a610(adreno_gpu))
+		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
+	if (!adreno_is_a610(adreno_gpu))
+		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
 }
@@ -907,6 +961,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	/* Unknown, introduced with A640/680 */
 	u32 amsbc = 0;
 
+	if (adreno_is_a610(adreno_gpu)) {
+		/* HBB = 14 */
+		hbb_lo = 1;
+		min_acc_len = 1;
+		ubwc_mode = 1;
+	}
+
 	/* a618 is using the hw default values */
 	if (adreno_is_a618(adreno_gpu))
 		return;
@@ -1181,13 +1242,13 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
-	if (adreno_is_a640_family(adreno_gpu) ||
+	if (adreno_is_a610(adreno_gpu) ||
+	    adreno_is_a640_family(adreno_gpu) ||
 	    adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
-		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
 	} else {
 		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
@@ -1215,18 +1276,26 @@ static int hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
 	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 
-	if (adreno_is_a640_family(adreno_gpu) ||
-	    adreno_is_a650_family(adreno_gpu))
+	if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
-	else
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
+	} else if (adreno_is_a610(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x00800060);
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x40201b16);
+	} else {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
-	gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
+		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
+	}
 
 	if (adreno_is_a660_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
 
 	/* Setting the mem pool size */
-	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
+	if (adreno_is_a610(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
+	} else
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
 	/* Setting the primFifo thresholds default values,
 	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
@@ -1237,6 +1306,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a610(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
 
@@ -1252,8 +1323,10 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
-		(1 << 30) | 0x1fffff);
+	if (adreno_is_a610(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
+	else
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
 
 	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
 
@@ -1813,6 +1886,10 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
 {
+	/* 11nm chips (e.g. ones with A610) have hw issues with the reset line! */
+	if (adreno_is_a610(to_adreno_gpu(gpu)))
+		return;
+
 	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
 	/* Perform a bogus read and add a brief delay to ensure ordering. */
 	gpu_read(gpu, REG_A6XX_RBBM_SW_RESET_CMD);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6ea24b8ddcf8..cb94cfd137a8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -253,6 +253,18 @@ static const struct adreno_info gpulist[] = {
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
+	}, {
+		.rev = ADRENO_REV(6, 1, 0, ANY_ID),
+		.revn = 610,
+		.name = "A610",
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+		},
+		.gmem = (SZ_128K + SZ_4K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a610_zap.mdt",
+		.hwcg = a612_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
 		.revn = 618,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index efd35b7bc4cf..3a8af5fdaea8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -55,7 +55,8 @@ struct adreno_reglist {
 	u32 value;
 };
 
-extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[], a690_hwcg[];
+extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[];
+extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
 
 struct adreno_info {
 	struct adreno_rev rev;
@@ -253,6 +254,11 @@ static inline int adreno_is_a540(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 540);
 }
 
+static inline int adreno_is_a610(const struct adreno_gpu *gpu)
+{
+	return adreno_is_revn(gpu, 610);
+}
+
 static inline int adreno_is_a618(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 618);

-- 
2.41.0

