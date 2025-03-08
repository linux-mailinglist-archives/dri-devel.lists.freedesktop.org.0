Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E74A57888
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 06:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C78D10E29E;
	Sat,  8 Mar 2025 05:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kxag/M3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48110E20A;
 Sat,  8 Mar 2025 05:38:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F1D15C02EF;
 Sat,  8 Mar 2025 05:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972A1C4CEE7;
 Sat,  8 Mar 2025 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741412315;
 bh=KIF/gpZzjp1qJUxyZwx7NERtKxqbEMkwiHYb2P2nTt8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Kxag/M3W40pb5nnbpvP6TJsptjxVDJHzbrU8zHVYwJOjfGNCLN49M2SP/DkRfdpK1
 +F5B8YxxgwYubtPcYt+r8qCsGF4UBwZYNq8gWAz5hvR9b8qcacHsHvMKbkq4StTBRt
 A9PEWzuPw/FTxdeALgiM4trCatwPGWXDm0f3WP1uXDNh7k0xgOsIumrHmc709cR4At
 z1dc/dZ1T+bXyspXS1Ni4lMwREXBYaOITmuuQCS5oVU+j+QEFO1320+dPJ03X8bM8Q
 rnkS/jlZ62TkDNOOrBp3FEmZt/NNUpAVek2Xg9jYD3uCKwGvl98LsUfCROgb7oyLDk
 ZO31hhPdQHm4g==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 07:38:25 +0200
Subject: [PATCH 2/5] drm/msm/dpu: enable SmartDMA on SC8180X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-dpu-rework-vig-masks-v1-2-f1b5d101ae0b@linaro.org>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
In-Reply-To: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3199;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ESu0GYllHy5o1kKCrlQTczJy25kDP1UXYmGH8T/qf3M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny9fT3VTJwm1ua/LkP74+dlhwM8IlULrGg2nyd
 X65yRPU77eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8vX0wAKCRCLPIo+Aiko
 1YueB/92sBL+7E4zqZbjh7Vb0+QXjhVPljCGVPFhsXcffbA7j9BXdcm7vEJqzXHoQwuBBzIYqSC
 x6TijpglmQE9/TR3BQWl8qHoqPEMZFjYV9xwi7LZFO6NzEiHOBJSZmfjkRMKWelTVr2yfukXb1F
 CJPqkRZziN5ovpa8K3bZH+03ht2GVaWEtEQgwX/gXbqOhMGQF9mDVEF343iRySNjDlWJmOiHtDk
 1WMMiwpuC9LeJE9Hv6ZZZIY7JmeJaLl57S5rxtker0MWk9EyWYa6VV5VEChh1Bi7JCYfYdiqySW
 Nfm9pieW7xJQY/YRtG4hnK/M2kfrg0aWW9JVQs0js/sj7wLU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reworking of the catalog dropped the SmartDMA feature bit on the SC8180X
platform. Renable SmartDMA support on this SoC.

Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index de8ccf589f1fe026ca0697d48f9533befda4659d..330490d10247e6347df71927ce601da1468f466e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

