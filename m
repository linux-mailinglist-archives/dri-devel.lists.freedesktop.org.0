Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B377692D2D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD0C10EE73;
	Sat, 11 Feb 2023 02:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC50710EE68
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:22 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jg8so20203885ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aL2edqo6KDYx6sYRiaj4UMh7ljorLtIgUzS84s66Pvs=;
 b=syji7ogZFBwzTLInBmVuGWKr0ndydMVQXekoAx51PsekZCZUTi4msTK0WYB25BxyUo
 2TMtpy9rbjD6Ls50h9ELF0WKBeszljaHxpTEzZhs0PnwF/eCl4lIxcteKKtUuhkUCBMM
 3XxEDOu8MQAdD4tDAYpEBbRszaWn+6BipsEN5csCbYukMDR4ODugs9QoxT37XAEx2tQ8
 0cYyRuKWSMeqMiIITv5cPlYTWufeSgHeifMaCdqpHdvsHOKe8U9C412EIeCIm9Q7U3J8
 fpX72Z2+gwLVkYBRzWs/K9unUgQTc2xDESXzyO4y8Jw0mr5zuMwMaCfpagG/EBaQp504
 u5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aL2edqo6KDYx6sYRiaj4UMh7ljorLtIgUzS84s66Pvs=;
 b=hXoyuxbPEjpRFY5NIbokRbP97rDUi/ckYmqZUxdbCJrPFPQKU/c7t+0iBIIQxhsybd
 N7Hgml85OBJtZBJVrRxuQGI0UyqmIXelKRHZu0VPadzY3MQTfLzFKWK/CfRKFsfb9c50
 0SqIVSaotL2ACq9Ul0mUKQ8b99ufqPGfzQjqL2jSLrYpUMxt702jTLZQyYT6kzaGMIK1
 NIOrjKdLIgdjCCOACAZSSLrBQq43+3iEUfj7w8e/bPRa+5EOEcmbNNXqNsFstxmL1rfh
 JkAbraKCC11x7n932WOQtk0M1GVZcuBvA3Y5OQYG3voqRHiwkm2DndN11/K7tZ1okXaB
 b2ZQ==
X-Gm-Message-State: AO0yUKUVpwzWL679+2cIOt94eCNCPc6KLS+YNysc2B1pfRq34ZA0X3wy
 3hL2j1qCtgR3K6u6anIkIa1RvzyH9L16t+v5
X-Google-Smtp-Source: AK7set8fLKeN5SoZcBxnITXcJ2zjFAvYtTaQt5TQL5NMB31kq4UDrcrQxQAHgwQ+ED0xNB7wyIh1cw==
X-Received: by 2002:a17:907:62a1:b0:86f:64bb:47eb with SMTP id
 nd33-20020a17090762a100b0086f64bb47ebmr24553481ejc.3.1676081482536; 
 Fri, 10 Feb 2023 18:11:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 26/43] drm/msm/dpu: correct sm8550 scaler
Date: Sat, 11 Feb 2023 04:10:36 +0200
Message-Id: <20230211021053.1078648-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm8550. Fix the DPU caps structure and used feature masks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 2103ccfc22f0..8a81ce0cc0ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -10,7 +10,7 @@
 static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ff507acc6ff6..48ee66f52ddc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -424,13 +424,13 @@ static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
-- 
2.39.1

