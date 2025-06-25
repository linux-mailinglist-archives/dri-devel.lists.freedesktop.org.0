Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75447AE83DE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC4410E713;
	Wed, 25 Jun 2025 13:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pUV8YFKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3210C88735;
 Wed, 25 Jun 2025 13:10:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 675F6A52568;
 Wed, 25 Jun 2025 13:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BE1C4CEEE;
 Wed, 25 Jun 2025 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750857037;
 bh=Cg+8DupBWLyeRJpjZIdQOmGK3HcqSLv3ER/VUAwzlDQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pUV8YFKqtb6nFtbvpGyPm1OY9FOhOFsCtbNwOm6qEXjR3nc5+4PSGQn9h+GcP8FKk
 9c7MHMDrByJ53Vk1yokb4VcORLW+g3S4rw9Ta/EVHWSRG+NkNOBegAeB+MbafZKbOs
 USTLI+n6l+dhJfX/DCCG2PMEXEvsO69WNRz+g1jnYPqz7Pm6qsFjfvxdj/X1cZ5c3F
 W75m7lOCD1Tq3Syo3RzdI/4U4anOo7Pm8/FsfhqnMl6EvsGw+vxDLlfGey5XbX3y4W
 UbzSmh2+q3TmL8lByEQ3Mv8k1rCijZfxQPoLfjTp7f9wxeXVDPaxBSENN1oWH3oCCH
 M342FIcjXgSMQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:12 +0200
Subject: [PATCH v5 04/14] drm/msm/a6xx: Get a handle to the common UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-4-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=2724;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3iWBKvs5q5N+qB3FfdC53TcHieKOPEBmf5TENWZJ3pY=;
 b=aEhYqGuJzlkspWzkso0gsKCoGxzrFGbO+4ef+yrDEDxpDFqgd+n4fZ9xk3ejSEn1GXJyDBser
 LV5PU8PGCVaDh0s13kMjZgdnMcIJGb4O47rjcpmpYlFKqvkDov6/iI7
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

Start the great despaghettification by getting a pointer to the common
UBWC configuration, which houses e.g. UBWC versions that we need to
make decisions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 491fde0083a202bec7c6b3bca88d0e5a717a6560..6588a47ea0f0635aaf3944215fa31befb63f4f57 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -603,8 +603,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
 }
 
-static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
+static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
+	/* Inherit the common config and make some necessary fixups */
+	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(gpu->common_ubwc_cfg))
+		return PTR_ERR(gpu->common_ubwc_cfg);
+
 	gpu->ubwc_config.rgb565_predicator = 0;
 	gpu->ubwc_config.uavflagprd_inv = 0;
 	gpu->ubwc_config.min_acc_len = 0;
@@ -681,6 +686,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
 	}
+
+	return 0;
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
@@ -2564,7 +2571,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
 
-	a6xx_calc_ubwc_config(adreno_gpu);
+	ret = a6xx_calc_ubwc_config(adreno_gpu);
+	if (ret) {
+		a6xx_destroy(&(a6xx_gpu->base.base));
+		return ERR_PTR(ret);
+	}
+
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a6xx_preempt_init(gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index bc063594a359ee6b796381c5fd2c30e2aa12a26d..a2a211cac147cb5bc5befdcab07559b778adc2bb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -12,6 +12,8 @@
 #include <linux/firmware.h>
 #include <linux/iopoll.h>
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "msm_gpu.h"
 
 #include "adreno_common.xml.h"
@@ -243,6 +245,7 @@ struct adreno_gpu {
 		 */
 		u32 macrotile_mode;
 	} ubwc_config;
+	const struct qcom_ubwc_cfg_data *common_ubwc_cfg;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.50.0

