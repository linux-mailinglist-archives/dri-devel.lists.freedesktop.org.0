Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0BDAB6F2F
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04F310E665;
	Wed, 14 May 2025 15:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sFa0ARNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E022010E669;
 Wed, 14 May 2025 15:11:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 20DE8A4DE40;
 Wed, 14 May 2025 15:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B92C4CEE3;
 Wed, 14 May 2025 15:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235509;
 bh=JzooyhzkBSW9hiU1yFfTPNeqnr9cyX5PvetIXhtLpb8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sFa0ARNG3D8I23WRX7deZdYMBeXK5Q2foX0/kTvVFbZQ82b0gMpt/XypHMJ9mBQYz
 TKT/u5lftZ3Zy7yjGx98AYPZbcUldb+ta34R+YlkCYXxp0wMsAkrlP1h2djXU5x4d4
 STrGGqhZ2zLxyXTjptwx5PKpfPRtUGTTvGZFUWUb7KtSeyLG4sAVTkHFtLQjRFIAiD
 OaqLhFS23gUWvNRkYCld++vbaidixhezxO7XNYHCVGgmj1DcRvCBRJeOTfhOyBXJ4i
 V+tBIl9x/mFdLMaUuoZgM8/epp7MzU27xvPvCE/oOjD/dWTIKKE74BTnnQUXCaolFl
 Am4YPQNsQ673g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:33 +0200
Subject: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=984;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=alnhMVYvqUsDl9VBStZIhfR74aMwsIemObYjxdGrHhQ=;
 b=kb/pNJE5oczTtgeRkk4h908ZcFLhblgrk+Oi24syoakU4SqD5fOQGD01+P+LVh11yWnBP+K5N
 rOgmWKXedbODM5i42UgGKhsXF9CVbOomakFszF6LVgJSd3Rpmq7L4uZ
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

The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
swizzling) is what we want on this platform (and others with a UBWC
1.0 encoder).

Fix it to make mesa happy (the hardware doesn't care about the 2 higher
bits, as they weren't consumed on this platform).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.ubwc_swizzle = 1,
+	.ubwc_swizzle = 7,
 	.highest_bank_bit = 14,
 };
 

-- 
2.49.0

