Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FCDA84B62
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 19:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E6710E380;
	Thu, 10 Apr 2025 17:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qmRzQV63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEDD10E37C;
 Thu, 10 Apr 2025 17:44:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D00ED68449;
 Thu, 10 Apr 2025 17:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D5AC4CEDD;
 Thu, 10 Apr 2025 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744307059;
 bh=+TXOFnKqLNVBQVmqkqgvY5ByLqr5f+PoTrMrJaHt+f0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qmRzQV63x24BdHYuCbf0feqPnRhvkGp7ijara0BP5bRFYo4YOPkyAna0d/zTm62u8
 QARlOg16vIeTi0OKaw7csqVnky4zmAw49LQlhaT7QNANIV17AsxA77lS2lbrzrI75P
 mUgea4RNJcqDyJTsDvmpyY1njeUrSb9mNAgNiCd6m8Uv5jAeOd7iYYbXm/lIYFQYhD
 CIDW+qJO07KessQEbatwVKncMIRzl13EjPoOvD3mtgk4W1z4nZYIaNR1sqS+EHRYfQ
 RBnbhgK0m3swrdUkOzd7rR05XoBaIZc8yRvkWmmKWie/zdIqD25U889Q9doLy0SjaJ
 L7LI1Df7sZNdA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 19:43:47 +0200
Subject: [PATCH v2 4/4] drm/msm/mdss: Get HBB dynamically, if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-smem_dramc-v2-4-dead15264714@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=4364;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=u4DLQLo3tH5nr+Zi9TgIpdAPYpDHteGYc0a2ROXvGKs=;
 b=qS0K/ADcOWTRbVEPdzhzxqnyG+jDeryAle3FlGQNCiV5CAPeE2m8FrGGKr+AWeGLhnIyH8jGK
 5UVo9E9N7HTB9iTPKVj7QOtQbnYkwxXHHLkyAVIt5JPF+B3MWCki/YP
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
 drivers/gpu/drm/msm/msm_mdss.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f5c60ce20c0b66160bcc9bf74bf8f86ab57e9a4 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/smem.h>
 
 #include "msm_mdss.h"
 #include "msm_kms.h"
@@ -163,11 +164,11 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss, int hbb)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -178,11 +179,11 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss, int hbb)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
@@ -196,11 +197,11 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss, int hbb)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -287,7 +288,7 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret, i;
+	int hbb, ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -317,6 +318,11 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
+	/* Attempt to retrieve HBB data from SMEM, keep reasonable defaults in case of error */
+	hbb = qcom_smem_dram_get_hbb() - 13;
+	if (hbb < 0)
+		hbb = msm_mdss->mdss_data->highest_bank_bit;
+
 	/*
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
@@ -330,14 +336,14 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		/* do nothing */
 		break;
 	case UBWC_2_0:
-		msm_mdss_setup_ubwc_dec_20(msm_mdss);
+		msm_mdss_setup_ubwc_dec_20(msm_mdss, hbb);
 		break;
 	case UBWC_3_0:
-		msm_mdss_setup_ubwc_dec_30(msm_mdss);
+		msm_mdss_setup_ubwc_dec_30(msm_mdss, hbb);
 		break;
 	case UBWC_4_0:
 	case UBWC_4_3:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss);
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, hbb);
 		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
@@ -538,6 +544,10 @@ static int mdss_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB msm_mdss_enable() */
+	if (!qcom_smem_is_available())
+		return -EPROBE_DEFER;
+
 	mdss = msm_mdss_init(pdev, is_mdp5);
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);

-- 
2.49.0

