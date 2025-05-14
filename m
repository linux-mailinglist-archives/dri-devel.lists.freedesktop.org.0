Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF03AB6F1E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2131A10E66C;
	Wed, 14 May 2025 15:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ehU7Q17n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72EB10E26D;
 Wed, 14 May 2025 15:11:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3CAEF629D3;
 Wed, 14 May 2025 15:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027C1C4CEE3;
 Wed, 14 May 2025 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235481;
 bh=FuU6k5Adlwy1+B7b57bvaytQ6sRhVZFNWGjHNcC2jgM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ehU7Q17nIXINrK0YEIzDXQhAfxbtUsz3RZFZoRYNBKpq03enbwjit3zAR6DgsCfnQ
 2HxfcpHrlPqMYW+3Uh+cIlvXaqdpxPTL7fFksVP1Lg7W4NZ7LishgoeEg474R4PYAf
 7jWWKpjUJxpsdYgral68+vXdKqX8GcvWpfeAmaRi/Zz/kqr26wLQNRQ+H5GooMJkN7
 vWkH8COsycMmtYw5WWUNt2hwrapevyfT9aCTLs3y7M7NccdHj1Rc069RKMV4qm1RSm
 0nFMa9DxMmXFBljLqNLxrn7pKdZ4cG5MT4+BWXFOw6/J385aHUlh1T3N+D1/EdIY7q
 P0K/19IV/8fmw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:27 +0200
Subject: [PATCH RFT v2 07/15] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=1096;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=OTb7pyJT4/w1gM/ve6hjlXPBv3Lngyv7JnLIisn/gtA=;
 b=WpAInuOrWGGVmZSkmvyAE/FOIFXBLxH1FkzjX6vOMtENm01f9miAc/a6nkH/x72aggF4XPvuf
 cmCxWnzyMKdAdGXEN0c2kprb01BcCO34TWAKP/y6CtJNppek9LrVIyn
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

This bit is set iff the UBWC version is 1.0. That notably does not
include QCM2290's "no UBWC".

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e7c89f9c7d89798699848743843eed6a58b94bd3..6af4e70c1b936a30c1934dd49f2889be13c9780d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -669,10 +669,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
 	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,

-- 
2.49.0

