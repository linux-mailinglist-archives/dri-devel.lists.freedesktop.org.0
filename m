Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B1A5CE8A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC4410E67A;
	Tue, 11 Mar 2025 19:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IPG3TPZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C804810E67B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-39123ad8a9fso371402f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719762; x=1742324562; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FoHt8+Qv2KBvycEBRbSOT+7Q4Tanwbir/+be358nDD8=;
 b=IPG3TPZGWClA9b6wY21G8rHqKQs+UZxwtwV5FiX8pAoGVn8RuQAFp4xphjhQvDFHol
 fUBrVOj7Bwt49TYG9tKeg99e+4dHLsrq5GoJy5x6GHpDO0VX4GD5x74S1pmb11I8sauR
 ZXFUj9IA2lknOAWcAib9EjNVmQ/AK4sNJzfvLcZ9fKuUzadSNzz7vKTK0CtrtGmcentc
 47mVByZThmZddE0KP15zsI9dMjUe2w8GuRhewU+HsRmpSI7MOyEVMP0AGBh7oqcAOVUV
 HYGey/SWCzIXTdXiCIEeUl/q6aMB7YHacSnP+pKsqQRDV8YO3BDzLEhDGP5PgWcIzWSu
 vlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719762; x=1742324562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FoHt8+Qv2KBvycEBRbSOT+7Q4Tanwbir/+be358nDD8=;
 b=P8rV3SpoRGv8dXkODIeXd7ctHs+JBALaZEMDUybLIv4c+hBcHy8kJcDJ6gH29UMGVp
 0mfVxsKqsvWYnaao4sdhPTIK2H0maNuOwAvtKzKVIK3iMkVMXh8J3KOYWaOjKaBQnjS7
 z8ZfSRpNbUk9VBudRB7UINLLXwDPNV2rFN3hSs6dIujYY9DnTu/DZhZL1iW0hmzXWOGc
 uImuq8aOZ0NjM50iwQxp26DGsYZdFEaIMkh5Vymz0HNNmuCzfmGTwxWBjIjlmb7s8E2C
 c8uRhsl2D5q54i6lmDpvd8m2B6pgPQCse0nE7iVDIX/cBSrhzZrerU2DKUy5OKv1coYt
 HrlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUj93WQM8Z/w7KyVtjlDrpymw+TWiGq+EP+bUVIftV7gV+SEVE/FlBMREHXm7l0esLmGT0SZFIO1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1wU8jBkhN+RyqBOCGk9wBA5Sv6Bm4kKziTa8csrhcTcXZmJ8q
 oIbfSjEprRLdlXFtF3K8vlSrgNV74utw8Y1l2xAAQuJEVsU5xvY2BaDr6qwST00=
X-Gm-Gg: ASbGncsJawwGisHieVgq6+LGyBYUKnfcGErvIMwpnyyXEnVCp3wB/SHxIkuj7PdZ3RD
 Po5dO0FgV+ozZP/2J6Ai7U7sDAp7FtnV759LnQBIMl1wPc4Z8rrgL0VgHXd/QWej1q1GpZ0LxOK
 jhb+3t+bP+ya7U3KwpxBRQbHZ//fkblbFkZQcEjmhqm8xqDPmS2EqQEpGQlgdFasebHfyR3azFy
 CevZASbomJ/G5QbGlrC0R/WHyiby67yInu5qvcyp5JYjih726WeUC8PRYsmP1eVOwix1vLODubn
 ezz+lSTbC/FBb9ZwKigcJGKmlH1vWQtYN8l2lLeE9WaEI/kUoZit0TK1Cok=
X-Google-Smtp-Source: AGHT+IGtubQYzLqe6qMHPh2YhYmcldjpGkwHVseYKBCi8jZBCwCNslEBMj62gHB7lTtanzJPhgFk1w==
X-Received: by 2002:a05:600c:3113:b0:43b:d547:6336 with SMTP id
 5b1f17b1804b1-43d01c3105dmr22168095e9.8.1741719762312; 
 Tue, 11 Mar 2025 12:02:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:02:00 +0100
Subject: [PATCH v4 10/19] drm/msm/dpu: Drop useless comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-10-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3xk0pyKS4szEe/9MhLY0udi1S0AkDYWMQ5qVNXd7KNA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IitXyBOAqRPMp/KeWk+fUVdkX6Z9R8/hGg9S
 IEiI9aoyTiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIrQAKCRDBN2bmhouD
 1/VkD/41O3QOWYZQCz/a0hGAcXFdCxiwdt52Ij6fy7kFN9HC8l+eoOd3C+t73FbxyP7vOOpTEB6
 ldE1DezPsO3nMYCBNS6xWz2nfXKkZCPsD0yQFauOBzlr9DlY7vSj+be9QELlrCtQ9LCvGLL3ofC
 9m4IenWnpfH0nCkPEPeB7A+BizuF9GFMTqLIIauaHYiGtkieTPZ0c5eSV7Cb9WeEbirH4+WqM6H
 huEJo6H6WJinBZ2KDBNyO9fGP+XgEpkZSHSvY3VLdsXiPO5pkxfKyM5C9c+iYuGUeJzmKjRB1vb
 qDcGUrLd4xCX7CaBXqX/92oeIGIcXOoAIY/KO4ScEcoIMoyvvAFYCZm/L43vJpST6F3Rq2hEKdP
 sTGrMWlRwfWPAbCx6ROKVSUDrSyCf/n+b1KWfU82+G8X5NSYC/YAiW/9s4gNXsU45AIC4ZHtCPz
 K2VH3kaOFUulwd+OVtqnvv29bFVuliq4DP8BGw/FnlYPpVokRPc5DjCbNYvxWzdXmS7Vf2wzW9d
 w++w+S9/b86Ls8p4vmJ+mwbXWy5ZYZJtld+2KOgAZ7ITmlyMVghTehYUGfC/hBz24V5L1F85fkn
 IjLcdFIxoIE+lfmrr86j0xbqzyPewR1QmPz7twsAfiQi+WdIINP/+wsn7V/JY5uy6Z+5fUzqY9O
 AOHbyo42s2JjvQQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
SoC because it's duplicating the actual name of structure.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2db27c55787791309962acf796d5c49aaf018fc1..a310a5234e99ea4886e82ac2100c4099e6a1841e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -331,8 +331,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
  * MIXER sub blocks config
  *************************************************************/
 
-/* MSM8998 */
-
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -342,8 +340,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-/* SDM845 */
-
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -353,8 +349,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -363,8 +357,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */

-- 
2.43.0

