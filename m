Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BBAA91B4
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 13:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C19910E3C0;
	Mon,  5 May 2025 11:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qh8+eQ5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8279E10E0DF;
 Mon,  5 May 2025 11:13:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7ABB65C57D9;
 Mon,  5 May 2025 11:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E03C4CEE4;
 Mon,  5 May 2025 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746443629;
 bh=AaQcMocTswbAmkTdEzSSbOG0pVTDoi2WqaauvfNtRiU=;
 h=From:Date:Subject:To:Cc:From;
 b=qh8+eQ5Zxs+DL7I2lSTEzr2M/Xp4Va8NGNtmsExxRy7iE4WqEPapJqKxeeanwLZ4s
 1hBtDtGJHqm0dvBQavNFlw+SDzQwPQ4qakIP/eIP4FvVgcvOk8Zm1U6Xx+VWX4WWIe
 tk4tAirNRczoolrc7igqmS+UEBLH5dH4thg9J3y/WoPQFmxrUCBrS/I7xU/KQAj6qh
 mk4PowqIEVN5uRQpnIA1YXolMFLeNy1VeYRJMglWOEPn+684r4txKfAAMOguRogLEU
 13LE/lYCSNQNORShB373VmDatEnoG02Wmqcseo/j72mD7DVkCUJYTScmZtFnAIC0XD
 LFVlHWKY8EOAA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 05 May 2025 13:13:40 +0200
Subject: [PATCH] drm/msm/a6xx: Disable rgb565_predicator on Adreno 7c3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-topic-7c3_rgb565pred_fix-v1-1-b1aebe890b8e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGOdGGgC/x2MUQ5AMBBEryL7rQnaVVxFRLQW+4O0IhLp3W1kv
 t68zLwQKTBF6LIXAt0c+dgFyjwDv037SopnYaiKCguJuo6TvbJej2F1WOMZaB4XfhRa5xrbmtK
 gBpmLkPq/7oeUPqxtkKJqAAAA
X-Change-ID: 20250505-topic-7c3_rgb565pred_fix-57bb87941453
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746443624; l=1310;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IN73Hc5vtHqaf2jmhJG3ZQUQts07NjQLJ9UAoPOD0S4=;
 b=2LUrEXE0O4fL2lEjHVHF7eqGJ6PVnu0BiFuXGzRVCgA2pvD1Oqj1yL+IW9HG5u8eklH2L+MhC
 zrv36HIF3tQCsEwij3GbN2WGISEPUbSEFwoszZExE8mQJa/HHKGReB6
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

This feature is supposed to be enabled with UBWC v4 or later.
Implementations of this SKU feature an effective UBWC version of 3, so
disable it, in line with the BSP kernel.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Fixes: 192f4ee3e408 ("drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2289fecbbbf14f7ec02227972049d62408c11dc1..bf3758f010f4079aa86f9c658b52a70acf10b488 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -655,7 +655,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_7c3(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.amsbc = 1;
-		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}

---
base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
change-id: 20250505-topic-7c3_rgb565pred_fix-57bb87941453

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

