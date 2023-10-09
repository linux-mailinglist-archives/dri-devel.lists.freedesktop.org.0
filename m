Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35117BE775
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D5010E289;
	Mon,  9 Oct 2023 17:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F0810E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:11:15 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so5626866e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871474; x=1697476274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yj6njcBJvVSdEt/itrCaxDqmJfa3khgLnrpbIsNXMlQ=;
 b=WAxXBS1s8wZft5xayMMV2tf0xvc3KYVZy4cZAySjMgqQqOHo0f3+KENDxbXrKNbkSg
 AqdWRayE9tZRR5boUrfvLiHILbyAErq1uEht+N9m1anPKgZxqNFMGq4l8xE0XB0Ux0IP
 1R8X0CVVGghVGY1flZauXVKNO5oVDYxGuJWUDl7fdA1Ho5aEdzm2XpAhuKrTkwZSnnh3
 NYpTCsyKmBR1KtYgiaRxCLbeHHUz+bp2bgazI3F2fUTuF6cCizZ+QGsynCLSSLqZuLhO
 PGeVzr1LThX04rS0v3w95X3a/blqIWeUDaZD0MHrZPpedme1gUCmxpVPrdLVGczatsUb
 nMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871474; x=1697476274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yj6njcBJvVSdEt/itrCaxDqmJfa3khgLnrpbIsNXMlQ=;
 b=wxFn7wgH7mAiAkocE4YXimN1SZHKhJI8WZ4o2y2DOnBf/Z6a8MwO2gLL26Qu0U4I45
 QB53d82bNL4klYQyyL+brgLqWipCXPusKB+r6x9Hv28jVFgp9ZR+/jSHSzUZIS2C5Y8H
 s6/Pzc/pAsb0NA0TCqHkL3LRfKDVXM7oQ1ylakP4MVDV/ve0h+b295AUHtwmBtqzuAkq
 TpOoQ1bXRt0yFNbWW0QoBNtVfvnJ/kI52BR5E/2M1YoMnddBGRb0h5/+eFYIoWn8Esb8
 6/OBwoW05rfMRUJf0GdkpHz/ZBpMRwwBTrjE6lr2CLNm2UGFLOJlPkVWp7cn8fDv2qk1
 lPQQ==
X-Gm-Message-State: AOJu0YzRb85SwYWcLGKxXImp/B2pxx5hTNJHhw+U++SXcHKZMCKKSzU+
 VBH1P5oBRUQYs3g7gi+rtgxbdQ==
X-Google-Smtp-Source: AGHT+IF6x9eUIfqM1YlOqJeCkA5+e7lU1HnygagGf6z5gj4tauD5DVNCC9HYvmV7lqMjEci6dxJsVA==
X-Received: by 2002:a19:771d:0:b0:505:6ede:20b0 with SMTP id
 s29-20020a19771d000000b005056ede20b0mr12446558lfc.58.1696871473848; 
 Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 3/3] drm/msm/dpu: enable writeback on SM8450
Date: Mon,  9 Oct 2023 20:11:10 +0300
Message-Id: <20231009171110.2691115-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
References: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d0214edcbb0e..9a3d1286d160 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -32,6 +32,7 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -326,6 +327,21 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8450_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -423,6 +439,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.dsc = sm8450_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
 	.merge_3d = sm8450_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8450_wb),
+	.wb = sm8450_wb,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

