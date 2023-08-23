Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DED785856
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 14:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603AA10E42F;
	Wed, 23 Aug 2023 12:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BD210E428
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 12:56:13 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so33052591fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692795371; x=1693400171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wRuhYFmeJYeOhpdGvidJgpSBYRlHbBQ/NQfQGIIKiSI=;
 b=JGAobr9R/mZmR9IOxXPUrVlju0EMjzr5pmrm1flDb3Xt3LCwDmS3PChizrBx/jkjPp
 w8NZCCdy9isEHTAG7wSTqMh1WzNvY+PCzuu4TsZ5phQvqtTIL01DPLCplYq5tfSkKNri
 0py6C0oxGlg/dhTP3MW2g7xTh1/Az2WOt1RD2Gv8GDsPSAd2Qor8/F15Ok2qK7aM4nVb
 wyBawbSE5XyVuTSg35kI+VVw7IFlPfRZ/0DtZwM58akBtJzfveBjMA8I9rqZEraB8LOs
 d8X0ZnHbrHLrLwXRufOFfbRldnkJhMeWyKcVnCHvAQWSaMYVTAsW9p8/KBj/MDKT6oeP
 OvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692795371; x=1693400171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRuhYFmeJYeOhpdGvidJgpSBYRlHbBQ/NQfQGIIKiSI=;
 b=W1i+bTG9favif5iIbtB+AOVmMIsbrRzj7RE5rc2SuuFAzcprsXnp6fQBdZVVxkOOpQ
 7AVLEvFaVeTLSSy6hGE7XTQ6NdXD313OYd5q1/+pgCj3D5yYkUpdzUR3e6WsuC/WNUrL
 B4/6vZXkJ8nQy1oR1niAiwhVQIUF9Rb74xtPOgzdhR2F2M0iTbYEzrQKUcU8A6sjYVhr
 2KZ2JsmE9i38NMHdFOpHNVkfsd0qEjKshmCOWUc5aRijKi23W/JxFULUKYHkmAy2V1Ma
 g5GvabMaVvvjXOL5jHmuIYPs4vF/nPAvjw/2N2YN1xyUvsXsVFQ/eL04wBUjRBxZeaZM
 tw1g==
X-Gm-Message-State: AOJu0YxGcgLK/MA5IOi8Y++8SF4RWhyABprLpHaiqSSipOKD4QTRG27n
 R8tWQBigOpBM2/yjxhGQ8zIaZQ==
X-Google-Smtp-Source: AGHT+IEXLWi8l+6IlS5wqCtLyi++/5V0DFQvw2sJROkN1ZVFUAEeCJrXfdYMw+AC4MtUyQqUl5ficQ==
X-Received: by 2002:a2e:8883:0:b0:2b7:764:3caf with SMTP id
 k3-20020a2e8883000000b002b707643cafmr8755123lji.10.1692795370799; 
 Wed, 23 Aug 2023 05:56:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj76.neoplus.adsl.tpnet.pl. [83.9.29.76])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05651c011200b002b6db0ed72fsm3220256ljb.48.2023.08.23.05.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 05:56:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 23 Aug 2023 14:56:00 +0200
Subject: [PATCH v3 07/10] drm/msm/a6xx: Mostly implement A7xx gpu_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v3-7-4ee67ccbaf9d@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692795358; l=7067;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6MV56+TNUPaIc6xCukG1x1SkhHcWoULQWAbjzRARu+w=;
 b=iGwc+jJLe0+hFFuu15vHCxtufPQ9S09KOJIL/TXr3Kg6vv4AOhHONTR33IctLFF2BwvQQJ0yX
 XCku5DnBBoXAsXoimXmtYUGrRRdPBfeVUvFpk+DBVCfFV5emBD4Z/p/
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide the necessary alternations to mostly support state dumping on
A7xx. Newer GPUs will probably require more changes here. Crashdumper
and debugbus remain untested.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 52 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 61 ++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 4e5d650578c6..18be2d3bde09 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -948,6 +948,18 @@ static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu)
 	return gpu_read(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2) >> 14;
 }
 
+static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu)
+{
+	/*
+	 * The value at CP_ROQ_THRESHOLDS_2[20:31] is in 4dword units.
+	 * That register however is not directly accessible from APSS on A7xx.
+	 * Program the SQE_UCODE_DBG_ADDR with offset=0x70d3 and read the value.
+	 */
+	gpu_write(gpu, REG_A6XX_CP_SQE_UCODE_DBG_ADDR, 0x70d3);
+
+	return 4 * (gpu_read(gpu, REG_A6XX_CP_SQE_UCODE_DBG_DATA) >> 20);
+}
+
 /* Read a block of data from an indexed register pair */
 static void a6xx_get_indexed_regs(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
@@ -1019,8 +1031,40 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 
 	/* Restore the size in the hardware */
 	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, mempool_size);
+}
+
+static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
+		struct a6xx_gpu_state *a6xx_state)
+{
+	int i, indexed_count, mempool_count;
+
+	indexed_count = ARRAY_SIZE(a7xx_indexed_reglist);
+	mempool_count = ARRAY_SIZE(a7xx_cp_bv_mempool_indexed);
 
-	a6xx_state->nr_indexed_regs = count;
+	a6xx_state->indexed_regs = state_kcalloc(a6xx_state,
+					indexed_count + mempool_count,
+					sizeof(*a6xx_state->indexed_regs));
+	if (!a6xx_state->indexed_regs)
+		return;
+
+	a6xx_state->nr_indexed_regs = indexed_count + mempool_count;
+
+	/* First read the common regs */
+	for (i = 0; i < indexed_count; i++)
+		a6xx_get_indexed_regs(gpu, a6xx_state, &a7xx_indexed_reglist[i],
+			&a6xx_state->indexed_regs[i]);
+
+	gpu_rmw(gpu, REG_A6XX_CP_CHICKEN_DBG, 0, BIT(2));
+	gpu_rmw(gpu, REG_A7XX_CP_BV_CHICKEN_DBG, 0, BIT(2));
+
+	/* Get the contents of the CP_BV mempool */
+	for (i = 0; i < mempool_count; i++)
+		a6xx_get_indexed_regs(gpu, a6xx_state, a7xx_cp_bv_mempool_indexed,
+			&a6xx_state->indexed_regs[indexed_count - 1 + i]);
+
+	gpu_rmw(gpu, REG_A6XX_CP_CHICKEN_DBG, BIT(2), 0);
+	gpu_rmw(gpu, REG_A7XX_CP_BV_CHICKEN_DBG, BIT(2), 0);
+	return;
 }
 
 struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
@@ -1056,6 +1100,12 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 		return &a6xx_state->base;
 
 	/* Get the banks of indexed registers */
+	if (adreno_is_a7xx(adreno_gpu)) {
+		a7xx_get_indexed_registers(gpu, a6xx_state);
+		/* Further codeflow is untested on A7xx. */
+		return &a6xx_state->base;
+	}
+
 	a6xx_get_indexed_registers(gpu, a6xx_state);
 
 	/*
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index e788ed72eb0d..8d7e6f26480a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -338,6 +338,28 @@ static const struct a6xx_registers a6xx_vbif_reglist =
 static const struct a6xx_registers a6xx_gbif_reglist =
 			REGS(a6xx_gbif_registers, 0, 0);
 
+static const u32 a7xx_ahb_registers[] = {
+	/* RBBM_STATUS */
+	0x210, 0x210,
+	/* RBBM_STATUS2-3 */
+	0x212, 0x213,
+};
+
+static const u32 a7xx_gbif_registers[] = {
+	0x3c00, 0x3c0b,
+	0x3c40, 0x3c42,
+	0x3c45, 0x3c47,
+	0x3c49, 0x3c4a,
+	0x3cc0, 0x3cd1,
+};
+
+static const struct a6xx_registers a7xx_ahb_reglist[] = {
+	REGS(a7xx_ahb_registers, 0, 0),
+};
+
+static const struct a6xx_registers a7xx_gbif_reglist =
+	REGS(a7xx_gbif_registers, 0, 0);
+
 static const u32 a6xx_gmu_gx_registers[] = {
 	/* GMU GX */
 	0x0000, 0x0000, 0x0010, 0x0013, 0x0016, 0x0016, 0x0018, 0x001b,
@@ -384,14 +406,17 @@ static const struct a6xx_registers a6xx_gmu_reglist[] = {
 };
 
 static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
+static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);
 
-static struct a6xx_indexed_registers {
+struct a6xx_indexed_registers {
 	const char *name;
 	u32 addr;
 	u32 data;
 	u32 count;
 	u32 (*count_fn)(struct msm_gpu *gpu);
-} a6xx_indexed_reglist[] = {
+};
+
+static struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
@@ -402,11 +427,43 @@ static struct a6xx_indexed_registers {
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a6xx_get_cp_roq_size},
 };
 
+static struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
+	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
+		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
+	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
+		REG_A6XX_CP_DRAW_STATE_DATA, 0x100, NULL },
+	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x8000, NULL },
+	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_SQE_STAT_ADDR,
+		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x33, NULL },
+	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x100, NULL },
+	{ "CP_BV_SQE_UCODE_DBG_ADDR", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
+		REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA, 0x8000, NULL },
+	{ "CP_SQE_AC_STAT_ADDR", REG_A7XX_CP_SQE_AC_STAT_ADDR,
+		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x33, NULL },
+	{ "CP_LPAC_DRAW_STATE_ADDR", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
+		REG_A7XX_CP_LPAC_DRAW_STATE_DATA, 0x100, NULL },
+	{ "CP_SQE_AC_UCODE_DBG_ADDR", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
+		REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA, 0x8000, NULL },
+	{ "CP_LPAC_FIFO_DBG_ADDR", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
+		REG_A7XX_CP_LPAC_FIFO_DBG_DATA, 0x40, NULL },
+	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+		REG_A6XX_CP_ROQ_DBG_DATA, 0, a7xx_get_cp_roq_size },
+};
+
 static struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
 	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060, NULL,
 };
 
+static struct a6xx_indexed_registers a7xx_cp_bv_mempool_indexed[] = {
+	{ "CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2100, NULL },
+	{ "CP_BV_MEMPOOL", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
+		REG_A7XX_CP_BV_MEM_POOL_DBG_DATA, 0x2100, NULL },
+};
+
 #define DEBUGBUS(_id, _count) { .id = _id, .name = #_id, .count = _count }
 
 static const struct a6xx_debugbus_block {

-- 
2.42.0

