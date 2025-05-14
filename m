Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DA4AB6F2B
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8279810E674;
	Wed, 14 May 2025 15:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TDnbjE9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36B910E66D;
 Wed, 14 May 2025 15:11:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 44DDD61360;
 Wed, 14 May 2025 15:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B556C4CEED;
 Wed, 14 May 2025 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235506;
 bh=JYsg4GBGu7X8acSehoDPknZmWOwg4HDhvlW5y2u+xS0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TDnbjE9HEDLBe1QaFNmphHhODDrja+c9rBGNtYPBwELIWKQvYscSif2lWi/3sMC8Y
 ZcMWEIQ76++TbC11PpxGW3KxTKuGuKOFo4AK2vzerCfLmfA0FDyjwGfoKqMHPKag56
 DJUBTIOW9uAnkoMUZGx7gtqn3Y5YzcKrKT5VgFUp9PJm1d1HJN3clPEP5EX6btINl/
 o68MQwxWg+FxXr47ajylY5yVX0LZtdeYcAvh3+/0fe4KNvgzFF4VUNeppCUhQ4rOv6
 Cp1CaWc8Qi17mQGV99il7fVke1frQLRf7uKg3urwH4N5Ki3tW4Hgt7ghLOGoGsuQip
 4ZQoq2wTtol3A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:32 +0200
Subject: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=1422;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=02lpGjZZUsNexzqxCrDQcZcbt5CcbZ+U+CYKmP30dAg=;
 b=lRcF9bzG3eYOlJ0ICMbtnj107R5FDgBAYugBbKk6ghiXGqK5sgd3ichMyFbihuMREGoU/oUvq
 BNkGUCoeE5bDu/EXshxpXH/ofR/FjbfrtTU+3XStq6SzRpDAVXuUy0e
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
index ae0bb7934e7ed203aa3b81e28767de204f0a4d60..eaf468b67f97ff153e92a73a45581228fcf75e46 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -598,13 +598,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
 	*cfg = *common_cfg;
 
-	cfg->ubwc_swizzle = 0x6;
 	cfg->highest_bank_bit = 15;
 
-	if (adreno_is_a610(gpu)) {
+	if (adreno_is_a610(gpu))
 		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x7;
-	}
 
 	if (adreno_is_a618(gpu))
 		cfg->highest_bank_bit = 14;
@@ -631,10 +628,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		cfg->highest_bank_bit = 16;
 	}
 
-	if (adreno_is_a663(gpu)) {
+	if (adreno_is_a663(gpu))
 		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x4;
-	}
 
 	if (adreno_is_7c3(gpu))
 		cfg->highest_bank_bit = 14;

-- 
2.49.0

