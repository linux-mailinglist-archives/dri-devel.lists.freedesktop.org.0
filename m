Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D5A8288B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2800B10E930;
	Wed,  9 Apr 2025 14:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NIBMslPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F19810E925;
 Wed,  9 Apr 2025 14:48:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23DD561569;
 Wed,  9 Apr 2025 14:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8594FC4CEEC;
 Wed,  9 Apr 2025 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744210082;
 bh=DA0MsBAv7mSBKJfJZoGs6FR9UBhabwdVtyUhzknmeLQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NIBMslPg5t+nzDSNBdQt0IvPeAs0rJiY2u61m4prx6ZmA8wEYAU9TYXWhjJr2iyvD
 MfM5gNaiHl0O4Yjk5UcBDB7ncfTlYC5UGHKeFIxsug0O4C2uZNQslz7sPI/dx/noXi
 Zn0uBkkmWfnRmrhrEhyPDlqDH/7l2tCg7tZgGMKEupHMzjAJiWsTTWPLaot/gEdFky
 WvvfQwFYTxU9rvg89pCvrUY7Zl14FItOlwprTBgC8+Og0mI93G785V/CFkPiTCM20A
 F4wyOmY3d11WtTTDjzyo+urwIPpSO9cgY66xQjaJXLsMLz2Ah97+ldpqYp08C8riGF
 0Vchk7fAZhIag==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 09 Apr 2025 16:47:31 +0200
Subject: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
In-Reply-To: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744210063; l=2386;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=OYohf13YmiKhzjC5R6w/3DMzEahK0lGhnx+WyDhcm6w=;
 b=fNEsSSQ6jli6oC71liry1Endi/Jxui35CzCj32bAjUMJOBu1cSMwi/etDA3bbnM/J9Pe5s27u
 8HYTGcOuc99AfzlrXTJlbqdx59TCcInKGKt09TRED9IfQszMgv2wjIf
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d0265ad9223e8b55c7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -13,6 +13,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
+#include <linux/soc/qcom/smem.h>
 
 #define GPU_PAS_ID 13
 
@@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u32 hbb = qcom_smem_dram_get_hbb();
+	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
+	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
+	u32 hbb_hi, hbb_lo;
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
 	 * as hbb_lo and the one above it as hbb_hi to the hardware.
 	 */
-	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
-	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
-	u32 hbb_hi = hbb >> 2;
-	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
-	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
+	if (hbb < 0)
+		hbb = adreno_gpu->ubwc_config.highest_bank_bit;
+	hbb -= 13;
+	BUG_ON(hbb < 0);
+	hbb_hi = hbb >> 2;
+	hbb_lo = hbb & 3;
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
@@ -2467,6 +2473,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	bool is_a7xx;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB in set_ubwc_config() */
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
 	a6xx_gpu = kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
 	if (!a6xx_gpu)
 		return ERR_PTR(-ENOMEM);

-- 
2.49.0

