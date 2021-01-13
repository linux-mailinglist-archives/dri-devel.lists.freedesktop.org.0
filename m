Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E12F5D55
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A866E12E;
	Thu, 14 Jan 2021 09:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F576E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 18:33:44 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5607A3F1FA;
 Wed, 13 Jan 2021 19:33:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: robdclark@gmail.com
Subject: [PATCH v3 3/7] drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
Date: Wed, 13 Jan 2021 19:33:35 +0100
Message-Id: <20210113183339.446239-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
References: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Botka <martin.botka1@gmail.com>, martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Adreno 508/509/512 GPUs are stripped versions of the Adreno
5xx found in the mid-end SoCs such as SDM630, SDM636, SDM660 and
SDA variants; these SoCs are usually provided with ZAP firmwares,
but they have no available GPMU.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Tested-by: Martin Botka <martin.botka1@gmail.com>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 172 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  52 +++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  15 ++
 4 files changed, 223 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 8c96fc0fc1b7..04ffd84c1190 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -222,7 +222,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a5xx_preempt_trigger(gpu);
 }
 
-static const struct {
+static const struct adreno_five_hwcg_regs {
 	u32 offset;
 	u32 value;
 } a5xx_hwcg[] = {
@@ -318,16 +318,124 @@ static const struct {
 	{REG_A5XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
 	{REG_A5XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
 	{REG_A5XX_RBBM_CLOCK_DELAY_VFD, 0x00002222}
+}, a50x_hwcg[] = {
+	{REG_A5XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A5XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_TP0, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST3_TP0, 0x00007777},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY3_TP0, 0x00001111},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_HYST_UCHE, 0x00FFFFF4},
+	{REG_A5XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RB0, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_CCU0, 0x00022220},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RAC, 0x05522222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RAC, 0x00505555},
+	{REG_A5XX_RBBM_CLOCK_HYST_RB_CCU0, 0x04040404},
+	{REG_A5XX_RBBM_CLOCK_HYST_RAC, 0x07444044},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RB_CCU_L1_0, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RAC, 0x00010011},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A5XX_RBBM_CLOCK_MODE_GPC, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A5XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A5XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+}, a512_hwcg[] = {
+	{REG_A5XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_SP1, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_SP1, 0x02222220},
+	{REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A5XX_RBBM_CLOCK_HYST_SP1, 0x0000F3CF},
+	{REG_A5XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A5XX_RBBM_CLOCK_DELAY_SP1, 0x00000080},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TP1, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_TP1, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_TP0, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_TP1, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST_TP1, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST2_TP1, 0x77777777},
+	{REG_A5XX_RBBM_CLOCK_HYST3_TP0, 0x00007777},
+	{REG_A5XX_RBBM_CLOCK_HYST3_TP1, 0x00007777},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TP1, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY2_TP1, 0x11111111},
+	{REG_A5XX_RBBM_CLOCK_DELAY3_TP0, 0x00001111},
+	{REG_A5XX_RBBM_CLOCK_DELAY3_TP1, 0x00001111},
+	{REG_A5XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_HYST_UCHE, 0x00444444},
+	{REG_A5XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RB1, 0x22222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RB0, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RB1, 0x00222222},
+	{REG_A5XX_RBBM_CLOCK_CNTL_CCU0, 0x00022220},
+	{REG_A5XX_RBBM_CLOCK_CNTL_CCU1, 0x00022220},
+	{REG_A5XX_RBBM_CLOCK_CNTL_RAC, 0x05522222},
+	{REG_A5XX_RBBM_CLOCK_CNTL2_RAC, 0x00505555},
+	{REG_A5XX_RBBM_CLOCK_HYST_RB_CCU0, 0x04040404},
+	{REG_A5XX_RBBM_CLOCK_HYST_RB_CCU1, 0x04040404},
+	{REG_A5XX_RBBM_CLOCK_HYST_RAC, 0x07444044},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RB_CCU_L1_0, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RB_CCU_L1_1, 0x00000002},
+	{REG_A5XX_RBBM_CLOCK_DELAY_RAC, 0x00010011},
+	{REG_A5XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A5XX_RBBM_CLOCK_MODE_GPC, 0x02222222},
+	{REG_A5XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A5XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A5XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A5XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A5XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
 };
 
 void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	unsigned int i;
+	const struct adreno_five_hwcg_regs *regs;
+	unsigned int i, sz;
+
+	if (adreno_is_a508(adreno_gpu)) {
+		regs = a50x_hwcg;
+		sz = ARRAY_SIZE(a50x_hwcg);
+	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
+		regs = a512_hwcg;
+		sz = ARRAY_SIZE(a512_hwcg);
+	} else {
+		regs = a5xx_hwcg;
+		sz = ARRAY_SIZE(a5xx_hwcg);
+	}
 
-	for (i = 0; i < ARRAY_SIZE(a5xx_hwcg); i++)
-		gpu_write(gpu, a5xx_hwcg[i].offset,
-			state ? a5xx_hwcg[i].value : 0);
+	for (i = 0; i < sz; i++)
+		gpu_write(gpu, regs[i].offset,
+			  state ? regs[i].value : 0);
 
 	if (adreno_is_a540(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_DELAY_GPMU, state ? 0x00000770 : 0);
@@ -538,11 +646,13 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+	u32 regbit;
 	int ret;
 
 	gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
 
-	if (adreno_is_a540(adreno_gpu))
+	if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
+	    adreno_is_a540(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
 
 	/* Make all blocks contribute to the GPU BUSY perf counter */
@@ -604,22 +714,29 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	if (adreno_is_a510(adreno_gpu)) {
+	if (adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x20);
-		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
+		if (adreno_is_a508(adreno_gpu))
+			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
+		else
+			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x40000030);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100D0A);
 	} else {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
 		if (adreno_is_a530(adreno_gpu))
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x40);
-		if (adreno_is_a540(adreno_gpu))
+		else
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
 	}
 
-	if (adreno_is_a510(adreno_gpu))
+	if (adreno_is_a508(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
+			  (0x100 << 11 | 0x100 << 22));
+	else if (adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
+		 adreno_is_a512(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x200 << 11 | 0x200 << 22));
 	else
@@ -629,6 +746,14 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
 
+	/*
+	 * Disable the RB sampler datapath DP2 clock gating optimization
+	 * for 1-SP GPUs, as it is enabled by default.
+	 */
+	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	    adreno_is_a512(adreno_gpu))
+		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
+
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
@@ -654,10 +779,17 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
 	/* Set the highest bank bit */
-	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, 2 << 7);
-	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, 2 << 1);
 	if (adreno_is_a540(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, 2);
+		regbit = 2;
+	else
+		regbit = 1;
+
+	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, regbit << 7);
+	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, regbit << 1);
+
+	if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
+	    adreno_is_a540(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, regbit);
 
 	/* Protect registers from the CP */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
@@ -694,7 +826,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
 
-	if (adreno_is_a530(adreno_gpu) || adreno_is_a510(adreno_gpu))
+	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	    adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
+	    adreno_is_a530(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
 			ADRENO_PROTECT_RW(0x10000, 0x8000));
 
@@ -736,7 +870,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (!adreno_is_a510(adreno_gpu))
+	if (!(adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	      adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu)))
 		a5xx_gpmu_ucode_init(gpu);
 
 	ret = a5xx_ucode_init(gpu);
@@ -1169,7 +1304,8 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (adreno_is_a510(adreno_gpu)) {
+	/* Adreno 508, 509, 510, 512 needs manual RBBM sus/res control */
+	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
 		/* Halt the sp_input_clk at HM level */
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
 		a5xx_set_hwcg(gpu, true);
@@ -1211,8 +1347,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	u32 mask = 0xf;
 	int i, ret;
 
-	/* A510 has 3 XIN ports in VBIF */
-	if (adreno_is_a510(adreno_gpu))
+	/* A508, A510 have 3 XIN ports in VBIF */
+	if (adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
 	/* Clear the VBIF pipe before shutting down */
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index f176a6f3eff6..5ccc9da455a1 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -298,7 +298,7 @@ int a5xx_power_init(struct msm_gpu *gpu)
 	int ret;
 
 	/* Not all A5xx chips have a GPMU */
-	if (adreno_is_a510(adreno_gpu))
+	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu)))
 		return 0;
 
 	/* Set up the limits management */
@@ -330,7 +330,7 @@ void a5xx_gpmu_ucode_init(struct msm_gpu *gpu)
 	unsigned int *data, *ptr, *cmds;
 	unsigned int cmds_size;
 
-	if (adreno_is_a510(adreno_gpu))
+	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu)))
 		return;
 
 	if (a5xx_gpu->gpmu_bo)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 12e75ba360f9..14efcb974312 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -133,6 +133,41 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
+	}, {
+		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
+		.revn = 508,
+		.name = "A508",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_128K + SZ_8K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a508_zap.mdt",
+	}, {
+		.rev   = ADRENO_REV(5, 0, 9, ANY_ID),
+		.revn = 509,
+		.name = "A509",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_256K + SZ_16K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		/* Adreno 509 uses the same ZAP as 512 */
+		.zapfw = "a512_zap.mdt",
 	}, {
 		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
 		.revn = 510,
@@ -148,6 +183,23 @@ static const struct adreno_info gpulist[] = {
 		 */
 		.inactive_period = 250,
 		.init = a5xx_gpu_init,
+	}, {
+		.rev   = ADRENO_REV(5, 1, 2, ANY_ID),
+		.revn = 512,
+		.name = "A512",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_256K + SZ_16K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a512_zap.mdt",
 	}, {
 		.rev = ADRENO_REV(5, 3, 0, 2),
 		.revn = 530,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b3d9a333591b..8a7e10b1ae16 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -197,11 +197,26 @@ static inline int adreno_is_a430(struct adreno_gpu *gpu)
        return gpu->revn == 430;
 }
 
+static inline int adreno_is_a508(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 508;
+}
+
+static inline int adreno_is_a509(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 509;
+}
+
 static inline int adreno_is_a510(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 510;
 }
 
+static inline int adreno_is_a512(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 512;
+}
+
 static inline int adreno_is_a530(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 530;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
