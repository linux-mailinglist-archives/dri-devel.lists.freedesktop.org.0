Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A04DAB6F22
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C566810E66E;
	Wed, 14 May 2025 15:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FrCkVyIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1A610E26D;
 Wed, 14 May 2025 15:11:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 327C1A4DDEF;
 Wed, 14 May 2025 15:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B1DC4CEE9;
 Wed, 14 May 2025 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235487;
 bh=8vFBBFkANtsmYpw7u9ShKN7OZ6pGN3oX85txA4NE5C4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FrCkVyIjBy+7hBjjjBvWJAF2ufhimAcTKHHtUh8ukNR5WQhv/tILsQ4OkPBDBWoVp
 CHPoZYUBBheIDYo8wUG0YTOJxT6kkUkQ1A3SXB5Ge88L3IWxx/0UDRx7dyvyi2tOgL
 ij9Y8eHsZnCpjeoUgxYMunJS/ytNc/GSqplVCDYFk6Fi5CdL3sgDAc+1bGn78KklBb
 k5a7cg4XlmAiPT8mLy/FKV4aKTlVZ2CCQ7v0A8dyXZOxovSrEpOXC6DAzy0Bok2uZh
 2JOXoYVtAKZWXEcU5sVLhjnDQwU/X9TeRPQDpmoWjjUkpD/1g6G/FwmRCRwCGW5FDh
 9lcH7GW1P923Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:28 +0200
Subject: [PATCH RFT v2 08/15] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=1102;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aq41AJ+CzzhfYkDV7JJuH70H0YYlEAmbgWDhxQTkUnE=;
 b=INHuunGn6WgUb1RypXS0icmYTK1fWq4PDk4QbVLfVHOF+IYHd8QAiUXoE3oHmPX32GpAVkTNQ
 Ng6jYlycixODeSBUunBipyE/D3KB0DhSdXz+9KbitpWSDBp1avieC5X
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

ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6af4e70c1b936a30c1934dd49f2889be13c9780d..0a08837ab01b724489baeb217cc49779ddcdf146 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -669,11 +669,11 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.49.0

