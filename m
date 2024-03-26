Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098688CFEC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 22:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C482210F34D;
	Tue, 26 Mar 2024 21:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XzRttCev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99B610F34D;
 Tue, 26 Mar 2024 21:24:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3977961422;
 Tue, 26 Mar 2024 21:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E8DC433F1;
 Tue, 26 Mar 2024 21:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711488256;
 bh=+7ou0Blb4yyxWLvmEh9Tg2cpMYZrBSmbjUxmYsUapVE=;
 h=From:To:Cc:Subject:Date:From;
 b=XzRttCevpZEKstiOQ+YK4/hwjYstMTsuRPwxTysqoRAmoq4dMwcf5Ov5iwsWX+X/O
 XqqLGzSPQMMg32OYHOmtKduB6TQsW+GZEZcjh04ucDlonial/B2V8HG7CVIM6iwFP/
 qEd19z5B9PRwBWZc6KZlt5R4jLYm5R2ARrfEtcgqRtCzVC5xlanxWtbL5IZaCFFiKb
 2ddfiDjcEbrCF8noSD5NCMZIU36EGK8Q+R/KZELFXUdlEDprDGBKtGvYL6oxLF3WfN
 668helCzuab4DYqUNqeWok1l3OcRF/GoRTxjtAwdu1nvlipBW38xBYjlhKQy5t3nS6
 MiB3Y1GEUs5OA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Connor Abbott <cwabbott0@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: fix the `CRASHDUMP_READ` target of
 `a6xx_get_shader_block()`
Date: Tue, 26 Mar 2024 22:23:24 +0100
Message-ID: <20240326212324.185832-1-ojeda@kernel.org>
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

Clang 14 in an (essentially) defconfig arm64 build for next-20240326
reports [1]:

    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
    variable 'out' set but not used [-Werror,-Wunused-but-set-variable]

The variable `out` in these functions is meant to compute the `target` of
`CRASHDUMP_READ()`, but in this case only the initial value (`dumper->iova
+ A6XX_CD_DATA_OFFSET`) was being passed.

Thus use `out` as it was intended by Connor [2].

There was an alternative patch at [3] that removed the variable
altogether, but that would only use the initial value.

Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
Closes: https://lore.kernel.org/lkml/CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com/ [1]
Link: https://lore.kernel.org/lkml/CACu1E7HhCKMJd6fixZSPiNAz6ekoZnkMTHTcLFVmbZ-9VoLxKg@mail.gmail.com/ [2]
Link: https://lore.kernel.org/lkml/20240307093727.1978126-1-colin.i.king@gmail.com/ [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 1f5245fc2cdc..a847a0f7a73c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
 			(block->type << 8) | i);
 
 		in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
-			block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
+			block->size, out);
 
 		out += block->size * sizeof(u32);
 	}

base-commit: 084c8e315db34b59d38d06e684b1a0dd07d30287
-- 
2.44.0

