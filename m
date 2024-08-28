Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6A962B2D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E060F10E56A;
	Wed, 28 Aug 2024 15:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VZlzjUOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C8710E567;
 Wed, 28 Aug 2024 15:07:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 135E7CE1340;
 Wed, 28 Aug 2024 15:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E44C4CEC4;
 Wed, 28 Aug 2024 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724857634;
 bh=AY5kElfZ7HDWUh1XY4xXIxxSiqg9NsEMxp3JQGCRdGY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VZlzjUOddAds8Qe1QwxMyIyY69mce4Lz/KiJfHT8JVgpF/eI5uLMbZ3UMKTbYooMA
 f9QyD5pGqcmm9YPj9wkblFpUAM+mnQu9QEeC921EZ2tff5z482qsriFrl0wHX3KR+S
 Qll2lF+Qmjq3HnYO6GCGzj3UJNy9EZkWH0buOLryTVTyWBYEVPccsm1fW3FB6qVNYy
 fOZ0Sak14LSAvRhcwtc7WJn4fugeoAm9SiMfMClFD9OGZRNwIo4+XexQPwW7dsKDim
 dyDVPZEpodLLQnXTuYHc57sbq5pxv0g1biABIYUDULvOrgRLwTT83tMy1CbWErQzgX
 xq8HHibnaMLjg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:54 +0200
Subject: [PATCH v2 1/6] drm/msm/a6xx: Evaluate adreno_is_a650_family in
 pdc_in_aop check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-1-1882c6b57432@kernel.org>
References: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
In-Reply-To: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=964;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=LKnGEsq0uRQq3Nql0V5gTQSfevwlmeAxbznSDZQfJTg=;
 b=bNh/7s8qgiCnyg6E10kgxQ9KLEeVVmDUBmE8UE2Fot1oMxwKO1gTcydvsOJdIY8i3R2Bo44Si
 tcoxfvANwSyDt0ZmFmseeY6RH1MK9mAgH8xlZOA9SYHf7hZ/D7NM36R
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
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

From: Konrad Dybcio <konrad.dybcio@linaro.org>

A650 family includes A660 family (they've got a big family), A650
itself, and some more A6XX_GEN3 SKUs, all of which should fall into
the same branch of the if-condition. Simplify that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index cb538a262d1c..6f168f1f32d8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -525,8 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	if (IS_ERR(pdcptr))
 		goto err;
 
-	if (adreno_is_a650(adreno_gpu) ||
-	    adreno_is_a660_family(adreno_gpu) ||
+	if (adreno_is_a650_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu))
 		pdc_in_aop = true;
 	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))

-- 
2.46.0

