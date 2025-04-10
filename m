Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B943EA84B5F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 19:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2FF10E37D;
	Thu, 10 Apr 2025 17:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s7aPuTLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460AD10E37D;
 Thu, 10 Apr 2025 17:44:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 566144A457;
 Thu, 10 Apr 2025 17:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A971DC4CEEA;
 Thu, 10 Apr 2025 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744307054;
 bh=TzU0yNDNxTV7Xy8TTEpD94TaKa3KYI72neWKtr0Ki74=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=s7aPuTLktguo7zatUgpFlNaGDRjdkRhZXJUsfyYYXVaaumXDZApdXsGyeRVFy7bUK
 s26mQu0W2GflNjs9QNcLEiD34XIbYZYyK6zl0QpGIFgd95k0PEM9l9NFELpqpNBlU7
 CZgyE9py3NHHAcybiOL9ne89Myg66ugBoLm2qa+Uk5bzvMf5yUjK24r5hH3vYDlr5P
 LF9UZYUGBmcXt4Lce+MgJGQVGX5X5KuW9WR5NSwJ/3scVg/0MZKljqNy3SWazK1Oqz
 ZyXnK6KWd5A/Yimm/1ZEb8bJioI1CY0lNceI0jyuN8ecoKZcmbjXv0+RAMKkf9XxHz
 gRW4y48pLPafQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 19:43:46 +0200
Subject: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
In-Reply-To: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=2298;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=m07m8qQDOOWd2fvMDrOD8Tzt78kulsuGTKp47oc3+WQ=;
 b=mSuoD139bK0ZvIJah6ExMqatBNKiV9yZSPo2PFoW+BCtduyL7mi4+1xx9wxfMJXSCjph4mH/M
 TgUE6n9kvwIBINJ5AXx6N4iYizF/rrtPr0lVEuRbytd7Qmgr6voaezc
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

The Highest Bank address Bit value can change based on memory type used.

Attempt to retrieve it dynamically, and fall back to a reasonable
default (the one used prior to this change) on error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -13,6 +13,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
+#include <linux/soc/qcom/smem.h>
 
 #define GPU_PAS_ID 13
 
@@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
+	int hbb;
+
 	gpu->ubwc_config.rgb565_predicator = 0;
 	gpu->ubwc_config.uavflagprd_inv = 0;
 	gpu->ubwc_config.min_acc_len = 0;
@@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a690(gpu) ||
 	    adreno_is_a730(gpu) ||
 	    adreno_is_a740_family(gpu)) {
-		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 16;
 		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
@@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
 	}
+
+	/* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb < 0)
+		return;
+
+	gpu->ubwc_config.highest_bank_bit = hbb;
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
@@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	bool is_a7xx;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB in calc_ubwc_config() */
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
 	a6xx_gpu = kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
 	if (!a6xx_gpu)
 		return ERR_PTR(-ENOMEM);

-- 
2.49.0

