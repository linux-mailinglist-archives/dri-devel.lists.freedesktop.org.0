Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428FEAB0254
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E05A10E953;
	Thu,  8 May 2025 18:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U/Ogt0UY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F9010E957;
 Thu,  8 May 2025 18:14:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5187BA4E14B;
 Thu,  8 May 2025 18:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE8BC4CEE7;
 Thu,  8 May 2025 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746728064;
 bh=WveUhGhrtwZKyhlbx/JZP0djDAE6iGTAASLA4GSoKq8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=U/Ogt0UYTJqIzcVw/WVZUAeiVfqxGS1MATU0J/eVEq/TqTq5hyBL4HBf7Stl8jODR
 SY5Lja1jbjrEE62Yv6ehAPiTpVIMdLgK7BxTZcDPcvlOYPl2TA8AEMshHUgtXHSKXJ
 NobecadE3GURQ+HIHLX+uAxmiVAJZ628WJJOeWsIpdHvW/JyuyrTsMgSaQpjvJ8IeZ
 J8psJ694f4IpHPSResB0UrszkrAXPXgGbk4yRib4E86Iij4BXVbKEM6plceWTlqFrS
 ntOII7N05k3rFgWVFp+K0yG/fQxT1Ff36m5de1Zen2K6x8+bZiIt5ZusAFMf9YDQIW
 HwLEV466udvdw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:45 +0200
Subject: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=1329;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QjPo7mRzkyky2v7OT2NwqggCjsaxe9ZY2P7ES9pQ+Ms=;
 b=hUkxZsMFQYp0KMXnZx6JjiiaS+YsYNUHP+LK5nHiwQ10VsfZl5sc4/2xpLMYRqb98tLUW/0iw
 x9bNPa2dtEeAVDS3qmpnMVsy9xlR1Eok2iJEH5WmBJ1+7x3LvqSJMUX
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

On A663 (SA8775P) the value matches exactly.

On A610, the value matches on SM6115, but is different on SM6125. That
turns out not to be a problem, as the bits that differ aren't even
interpreted.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 28ba0cddd7d222b0a287c7c3a111e123a73b1d39..d96f8cec854a36a77896d39b88c320c29c787edd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -597,13 +597,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	*cfg = *common_cfg;
 
-	cfg->ubwc_swizzle = 0x6;
 	cfg->highest_bank_bit = 2;
 
-	if (adreno_is_a610(gpu)) {
+	if (adreno_is_a610(gpu))
 		cfg->highest_bank_bit = 0;
-		cfg->ubwc_swizzle = 0x7;
-	}
 
 	if (adreno_is_a618(gpu))
 		cfg->highest_bank_bit = 1;
@@ -630,10 +627,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		cfg->highest_bank_bit = 3;
 	}
 
-	if (adreno_is_a663(gpu)) {
+	if (adreno_is_a663(gpu))
 		cfg->highest_bank_bit = 0;
-		cfg->ubwc_swizzle = 0x4;
-	}
 
 	if (adreno_is_7c3(gpu))
 		cfg->highest_bank_bit = 1;

-- 
2.49.0

