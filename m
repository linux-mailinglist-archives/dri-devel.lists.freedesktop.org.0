Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA1AB6F32
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3951410E66D;
	Wed, 14 May 2025 15:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ne11gRYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA8410E66A;
 Wed, 14 May 2025 15:12:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B5D0DA4DE40;
 Wed, 14 May 2025 15:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7831CC4CEE3;
 Wed, 14 May 2025 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235520;
 bh=Hf3yeg1WG/z7INDo4b2QRGGuu17lQVYeFJrtiNhG/f4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ne11gRYWj3lgEpcZrYSohDydfOYZvORQ1fzMRn23X7XgnG5NBJu5ZptVagwkDDdWB
 77mnYKrnKHaO/0a7UIUGmw12f13ew0CjDDoOgdvdLoi0Zsz/armAGlQL02TKvHS4bX
 qQtnX1PE5cJ8ahIAEPBwl0FF1I9J7EgZUMgMmxJ2Nvo6dVY0muBQYrdJXH/a8qzG4V
 fVSsnfpEkoDSacxo2OUEAlSGPgc43vNl1txhBeTvO4eBgnbyY85bx3awQi0W520EpZ
 K4ThhfSrDds0sCys1P8rOo/Ny3zyBJLVEx4iCX2mSiFnQ6QFwM2iLMppH5OSqNlrtn
 4Q9syGAR98YxA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:35 +0200
Subject: [PATCH RFC RFT v2 15/15] drm/msm/a6xx: Warn if the
 highest_bank_bit value is overwritten
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=1451;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NNwmHE/NXY7JNBB9ewjFIbDQ2ogaNlnpROm0GZClv6g=;
 b=c2HWY6JbvvY3r20QpOfuIVaoNxVaYPVeIJTkCQio4TyRUikHhSB6rqKK5+IfpP8nIUNZkkGbk
 03TnjpR85eqAiGlt0YgcL7Dc/g0lQUQA6bnpCfJUs4vsAjvI2pUmGSK
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

In preparation to resolve the issue of hardcoding HBB, throw a warning
if the value is being overwritten in the GPU driver.

The HBB value is directly correlated with the memory configuration.
On platforms where more than one is supported, the value must differ
for proper functioning of the hardware, but it also must be consistent
across all UBWC producers/consumers.

On platforms supporting only a single DRAM setup, the value may still
be wrong, or at least inconsistent.

Print a warning to help catch such cases, until we declare full trust
to the central database.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index eaf468b67f97ff153e92a73a45581228fcf75e46..ab812338739568d5908ca439e5c53e230a02de5d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -637,6 +637,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a702(gpu))
 		cfg->highest_bank_bit = 14;
 
+	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
+		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
+			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
+
 	gpu->ubwc_config = &gpu->_ubwc_config;
 
 	return 0;

-- 
2.49.0

