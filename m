Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DAC89A200
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581D010EB5F;
	Fri,  5 Apr 2024 15:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y3ZMNBmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17A210EB5F;
 Fri,  5 Apr 2024 15:59:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CDB00610AB;
 Fri,  5 Apr 2024 15:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22394C433C7;
 Fri,  5 Apr 2024 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712332741;
 bh=WPpqs+ByS572N6lsI54xqQu7Rf2BIKVicZBECmGPvak=;
 h=From:To:Cc:Subject:Date:From;
 b=Y3ZMNBmzeHVJJHI1+iwK2hE3R3lpt4x5GaXibepBvNo39F/hFCewUbtyRAsJC71IH
 JQFwfVmCI2egKtMeAQ48cdb+BxPVhjsvj8LBmuqUZF2QaXHio4LAYybXDgREOglifj
 8IZQHcmSdxogkivig662xG9IHSxZaX/NbrP+44qGbvP3gp2B9PdkE1Xs75LR5lQDEc
 +ob229m0F4mH8hC4hOhdDWWUQzm71ri3ZywuO2THfMXXDwI5sOPdTxQBGmYkOYoRhV
 D0xsEJLnk8h1i1ea29a2zt7g/1bK/J+jKZjR7MmxY0F8bAAX9E/80KBuiqzBYb+cgj
 qdpMvl7sK2YuQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: remove an unused-but-set variable
Date: Fri,  5 Apr 2024 17:58:42 +0200
Message-Id: <20240405155855.3672853-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

The modification to a6xx_get_shader_block() had no effect other
than causing a warning:

drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable 'out' set but not used [-Werror,-Wunused-but-set-variable]
        u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;

Revert this part of the previous patch.

Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 1f5245fc2cdc..d4e1ebfcb021 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -840,7 +840,6 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
 		struct a6xx_crashdumper *dumper)
 {
 	u64 *in = dumper->ptr;
-	u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
 	size_t datasize = block->size * A6XX_NUM_SHADER_BANKS * sizeof(u32);
 	int i;
 
@@ -853,8 +852,6 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
 
 		in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
 			block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
-
-		out += block->size * sizeof(u32);
 	}
 
 	CRASHDUMP_FINI(in);
-- 
2.39.2

