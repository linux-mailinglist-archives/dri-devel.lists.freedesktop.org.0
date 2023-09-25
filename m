Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF87ADA81
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD3E10E275;
	Mon, 25 Sep 2023 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A179210E275
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:50:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso793892666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653448; x=1696258248; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wRuhYFmeJYeOhpdGvidJgpSBYRlHbBQ/NQfQGIIKiSI=;
 b=ZMy7K88tQcV7vWNDhbgbwUMODd6WnDQuIFJSpI9JZULwNDD4VYgUAQnkPUw9rIkSpr
 o0BlNooy1T5+L2MsDoooTO5FAB7jt/+RCvilshCQaQHTkrTpJehqYykL0TbptbvZAgws
 HUHYn+gpEpNPIGXQrmgprBb4ZjzC0UvtgMXoqUyuoEHRQ9PLfc3WcmrSVkxylOhdklqz
 x+saMxKT0pgpR4PLW9NetQ9MWB/r2HkEu+/soY32C3zU9ayYgGK+gC/saHpz9ba2YDM6
 YMrgVKAYhEc/w6uG6TMgw9hk1QaGa6+6FqtvkRaihT3DtxMhcd+swgxPO8A2Y61uFCfh
 4ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653448; x=1696258248;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRuhYFmeJYeOhpdGvidJgpSBYRlHbBQ/NQfQGIIKiSI=;
 b=UHnEBETXh6vk6aauLU8xrJNENzTTD+eqL6qxsTP3zteBi81xk9cIpaHUct5SWFwwC5
 lCmehkzp5PBZrqJPtP8bv74RXqmYsZEe4o60kOSoa4SYtVm2BXBpThzO0Wx5UDZavlu1
 R4dljyPzkCoAoPYNUjc1cu3IEFI4r/8NCYCYkLGIcxauLVjBuhGQVCYdwa//5SzTiljy
 Mt7L0OYBiqhHvGHWuH+1T6bYJsLCsbo5mu/FICq0+RuRZ1b2QSmSnict9Z+ku8KUF20g
 r3HRLgfUh9ICzJjSETFBuHnW1X/hP/twV/VFAAE/gxMPehLp12HAwzHQimtJoSexzSAz
 203A==
X-Gm-Message-State: AOJu0Ywbyz0p5gTl5PIbP3MLPq/cPxXCrORr/3c3Gr/dUyRs2DM2v7lT
 Sp2qEiHllpy/lqRX4/Un9TEaDVUotNJ0ZyXjhI3NRQ==
X-Google-Smtp-Source: AGHT+IFjqccs011WgQ9Ya5lBtX8QYdIOnnvSmCFOEFGvSgKp74joBgcY0VthehN4Pgj1o3aQUvIpMA==
X-Received: by 2002:a17:906:76d6:b0:9ae:40d1:9993 with SMTP id
 q22-20020a17090676d600b009ae40d19993mr5879799ejn.14.1695653447882; 
 Mon, 25 Sep 2023 07:50:47 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b0099bc2d1429csm6426640ejz.72.2023.09.25.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:50:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 25 Sep 2023 16:50:36 +0200
Subject: [PATCH v5 07/10] drm/msm/a6xx: Mostly implement A7xx gpu_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v5-7-3dc527b472d7@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andy Gross <agross@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695653434; l=7067;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6MV56+TNUPaIc6xCukG1x1SkhHcWoULQWAbjzRARu+w=;
 b=8jwK/XiWH/Q34rkEXstv5Vu14nU5W5DaurZA8ScZLw/2qsLdwSRmAWQkGtIp6snafYjcpLxZP
 e+XjHBfM0NuAkvYquzM9KOtHKNCfodvKXJqLYY0iTDaZqY8n3z7BbV8
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

