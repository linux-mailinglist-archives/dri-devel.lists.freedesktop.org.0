Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3A0AE83EA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB4D10E129;
	Wed, 25 Jun 2025 13:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LTiWWK6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EABA10E720;
 Wed, 25 Jun 2025 13:11:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 44E1D4A35A;
 Wed, 25 Jun 2025 13:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EBEC4CEEA;
 Wed, 25 Jun 2025 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750857061;
 bh=Jzp4H5XI2mNdXY7mf+xttkOOu68Xs66xVgu2w4KaY6c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=LTiWWK6y8gbaXagk6u8Unpy/hH9iI8XRKZBMJKcMBcp2IBPYvJxudKZFbF2JxTouL
 P9m7T7A06zBbot5VGNWVyl1wl/rax21phiWt0/T8V5O46wnDrkb41TbRLLjPx5Gteo
 Gubl6mBwBeey3B4n/oyuNDXX7Dzq3XHapCmsJWtI9wDhs4aVUHqG/O0wzxDqYi7PmT
 qJYGtxBUMVM6snRY5EVIZT/hREcuQxZHZZjj9l+Lh0jiZguJ/awofBB6URn3eBSKzk
 eW8V16MTfKMyAa1e5eSonuqNHT+UhUDsxtAaKuO6JcPJHN1Klm9HWEGWAVsJHfomSC
 v/7id41v4sB1w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:17 +0200
Subject: [PATCH v5 09/14] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-9-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=2509;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XfAVKpXihNq5QYjqmv6bbx9jLqRnqYwolc2Cu9hDUvU=;
 b=cZf5zaKtql+E6lptsfMHrBRSoGTZvXv25nzP5qh+HyvX4tmWL1iBmkq6ZEHWeSYv7gMXEZ3Jz
 SYWgEeFqZtwAoZwr5rni4HVrmObHx3LoZPUhL3/Wr1aktafVXjqyDtu
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It's supposed to be on when the UBWC encoder version is >= 4.0.
Drop the per-GPU assignments.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 78782f94ee678e13baa6eb1a009a412e13557d59..53493f68ead2113143dab594bfedf492014d5aaa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -610,7 +610,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (IS_ERR(gpu->common_ubwc_cfg))
 		return PTR_ERR(gpu->common_ubwc_cfg);
 
-	gpu->ubwc_config.rgb565_predicator = 0;
 	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
 	gpu->ubwc_config.macrotile_mode = 0;
@@ -637,7 +636,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a623(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
@@ -651,13 +649,11 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.macrotile_mode = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x4;
 	}
@@ -686,6 +682,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
@@ -698,7 +695,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
-		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
+		  rgb565_predicator << 11 |
 		  hbb_hi << 10 | amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);

-- 
2.50.0

