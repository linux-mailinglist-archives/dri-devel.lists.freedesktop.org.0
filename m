Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3AABD5FF
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 13:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3BD10E417;
	Tue, 20 May 2025 11:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rIyOyvAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6762310E47B;
 Tue, 20 May 2025 11:07:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3920DA4E7D8;
 Tue, 20 May 2025 11:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EECC4CEF1;
 Tue, 20 May 2025 11:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747739270;
 bh=9E2qhR1XaU3B9sjO9pEDTpnqS+zWbcGow6sqQsSeS1Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rIyOyvAS+6Ygf1rHnGexlesngyts/GS1KtBdCFlfvOXlsiWaWdmQ1BFiFb1VJHubm
 QPyWnoQig39shqyg5kZ0FIgjxXe7kHhdj3InQKsNHQTx9WWc63bKcCar0xo1zxBBHQ
 aICVv8dTvL3eEYHfKjqN6aL6VxnD6qRMkIFDJAtuKXy7widBJiKBBfqc+cpeBXtVeD
 J4AYKH0XVyMq1q6s8/LffZpZW2RrGVJi8krxNjBEeuQHTtfbjnNPWdw8uih9H3bW4O
 1IPy6vCGhbrBsWpgXPzxVA9JIEXSAhTERZuv9kNjStVbmEjb3CisqYqlmtu7HC/2jx
 1nQI7TUH+CHQw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 May 2025 13:07:12 +0200
Subject: [PATCH RFT v4 07/14] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-topic-ubwc_central-v4-7-2a461d32234a@oss.qualcomm.com>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
In-Reply-To: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747739235; l=2107;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=WkH2SlmLcTrbMzzovYIdalcdD3bgOciNzfnRMkMKcOQ=;
 b=chOh+BQDrbE20xh5knam9+Hcg0ktabJdn9z51zEGoNifSXSQv58/xzXCFTQJtRhYdW3EMRejp
 0DkaHB4wIqWAVgL1S6rhhSnpbxkryHE8N5FFXYULkYt+/f92MySuqu0
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

This commit is intentionally cross-subsystem to ease review, as the
patchset is intended to be merged together, with a maintainer
consensus.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 00a928fee07290951b69263dd1d902ce85400fc0..154346591365f3f89d467674952abb2f067e7ce3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -668,11 +668,11 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
 	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index d0ef22fb04c5b5549a86f450a687d9ff477c871f..7f87a0981fe19eea3373ee2cc79cd11c84ddbc8c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -61,4 +61,14 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 }
 #endif
 
+static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
+
+	if (ret && !(cfg->ubwc_swizzle & BIT(0)))
+		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
+
+	return ret;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.49.0

