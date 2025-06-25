Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C54BAE83D6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0484210E6FA;
	Wed, 25 Jun 2025 13:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jQH+yt96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532A48825E;
 Wed, 25 Jun 2025 13:10:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B903617EE;
 Wed, 25 Jun 2025 13:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1489C4CEEE;
 Wed, 25 Jun 2025 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750857023;
 bh=U7rh4Js0zFDR1FYan5mcVUPgdUXX8fWot6B1TjZ9pkU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jQH+yt96dUidGFacro86CK4VLyD0mZIJxxC77RlR/EiNc1oHUQcFI+NxC87OiHDcy
 0tSLqERhM7w13stV2E58KjXD3T4dbQaxsK3YmVvH2EzaNha/gfDeJNy7X806psQxnD
 jJfNL8GoNxWUOicSF3YlocfmPteebdm37QFXZCqevxpGCYmoheRL3Iuu6fns4Q93jw
 t0W3Qi8m5G/Rse6TzpAzzQ7Z7J82HTGQgnvSRdtJLLXsmjW8boWcFsJdj/IHCAikgh
 ecLyliLU3SPPVmZmcoU1JIjKxQY1OjHB0gA4aKJH8xpSCbFUcOnbMUvVAjYVyjIsU7
 gDZOrKDGAZ4ew==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:09 +0200
Subject: [PATCH v5 01/14] soc: qcom: Add UBWC config provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-1-e256d18219e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=11796;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3XvaHcsWY/JLjyLUb0KCPBzQ28Hx+QQGadIBNbz9rQg=;
 b=lSldZ2FKTz0K3eUxa5wV+jFMOqTmzLVdO7NX2v2s19AQyowLf7jEbtvo7DzCcB6QXiraFxeI7
 inzNpk7C+FbDnk373Me5NIrVlT1IUNHE+b9MTZL5n+w7zoOPzUqajEK
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

Add a file that will serve as a single source of truth for UBWC
configuration data for various multimedia blocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig       |   8 ++
 drivers/soc/qcom/Makefile      |   1 +
 drivers/soc/qcom/ubwc_config.c | 247 +++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/ubwc.h  |  65 +++++++++++
 4 files changed, 321 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 58e63cf0036ba8554e4082da5184a620ca807a9e..2caadbbcf8307ff94f5afbdd1481e5e5e291749f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -296,3 +296,11 @@ config QCOM_PBS
 	  PBS trigger event to the PBS RAM.
 
 endmenu
+
+config QCOM_UBWC_CONFIG
+	tristate
+	help
+	  Most Qualcomm SoCs feature a number of Universal Bandwidth Compression
+	  (UBWC) engines across various IP blocks, which need to be initialized
+	  with coherent configuration data. This module functions as a single
+	  source of truth for that information.
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index acbca2ab5cc2a9ab3dce1ff38efd048ba2fab31e..b7f1d2a5736748b8772c090fd24462fa91f321c6 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
 qcom_ice-objs			+= ice.o
 obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
 obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
+obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
new file mode 100644
index 0000000000000000000000000000000000000000..ef2dfaa6730f7f5cb08bac3cff6486e5f3f99570
--- /dev/null
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+
+#include <linux/soc/qcom/ubwc.h>
+
+static const struct qcom_ubwc_cfg_data msm8937_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 14,
+};
+
+static const struct qcom_ubwc_cfg_data msm8998_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 15,
+};
+
+static const struct qcom_ubwc_cfg_data qcm2290_data = {
+	/* no UBWC */
+	.highest_bank_bit = 15,
+};
+
+static const struct qcom_ubwc_cfg_data sa8775p_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 4,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 13,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 13,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data sc7180_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 14,
+};
+
+static const struct qcom_ubwc_cfg_data sc7280_data = {
+	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 14,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data sc8180x_data = {
+	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data sc8280xp_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data sdm670_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 14,
+};
+
+static const struct qcom_ubwc_cfg_data sdm845_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 15,
+};
+
+static const struct qcom_ubwc_cfg_data sm6115_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 7,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 14,
+};
+
+static const struct qcom_ubwc_cfg_data sm6125_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.ubwc_swizzle = 1,
+	.highest_bank_bit = 14,
+};
+
+static const struct qcom_ubwc_cfg_data sm6150_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 14,
+};
+
+static const struct qcom_ubwc_cfg_data sm6350_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 14,
+};
+
+static const struct qcom_ubwc_cfg_data sm7150_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 14,
+};
+
+static const struct qcom_ubwc_cfg_data sm8150_data = {
+	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.highest_bank_bit = 15,
+};
+
+static const struct qcom_ubwc_cfg_data sm8250_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data sm8350_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data sm8550_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data sm8750_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
+static const struct qcom_ubwc_cfg_data x1e80100_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
+static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
+	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
+	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
+	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
+	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
+	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
+	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },
+	{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
+	{ .compatible = "qcom,sc7180", .data = &sc7180_data },
+	{ .compatible = "qcom,sc7280", .data = &sc7280_data, },
+	{ .compatible = "qcom,sc8180x", .data = &sc8180x_data, },
+	{ .compatible = "qcom,sc8280xp", .data = &sc8280xp_data, },
+	{ .compatible = "qcom,sdm630", .data = &msm8937_data },
+	{ .compatible = "qcom,sdm636", .data = &msm8937_data },
+	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
+	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
+	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
+	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
+	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },
+	{ .compatible = "qcom,sm6150", .data = &sm6150_data, },
+	{ .compatible = "qcom,sm6350", .data = &sm6350_data, },
+	{ .compatible = "qcom,sm6375", .data = &sm6350_data, },
+	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
+	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
+	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
+	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
+	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },
+	{ .compatible = "qcom,sm8450", .data = &sm8350_data, },
+	{ .compatible = "qcom,sm8550", .data = &sm8550_data, },
+	{ .compatible = "qcom,sm8650", .data = &sm8550_data, },
+	{ .compatible = "qcom,sm8750", .data = &sm8750_data, },
+	{ .compatible = "qcom,x1e80100", .data = &x1e80100_data, },
+	{ .compatible = "qcom,x1p42100", .data = &x1e80100_data, },
+	{ }
+};
+
+const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
+{
+	const struct of_device_id *match;
+	struct device_node *root;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return ERR_PTR(-ENODEV);
+
+	match = of_match_node(qcom_ubwc_configs, root);
+	of_node_put(root);
+	if (!match) {
+		pr_err("Couldn't find UBWC config data for this platform!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return match->data;
+}
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
new file mode 100644
index 0000000000000000000000000000000000000000..b92fc402638bae85e4e9da2552be56ac9ea9b448
--- /dev/null
+++ b/include/linux/soc/qcom/ubwc.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018, The Linux Foundation
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QCOM_UBWC_H__
+#define __QCOM_UBWC_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct qcom_ubwc_cfg_data {
+	u32 ubwc_enc_version;
+	/* Can be read from MDSS_BASE + 0x58 */
+	u32 ubwc_dec_version;
+
+	/**
+	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
+	 *
+	 * UBWC 1.0 always enables all three levels.
+	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+	 *
+	 * This is a bitmask where BIT(0) enables level 1, BIT(1)
+	 * controls level 2, and BIT(2) enables level 3.
+	 */
+	u32 ubwc_swizzle;
+
+	/**
+	 * @highest_bank_bit: Highest Bank Bit
+	 *
+	 * The Highest Bank Bit value represents the bit of the highest
+	 * DDR bank.  This should ideally use DRAM type detection.
+	 */
+	int highest_bank_bit;
+	bool ubwc_bank_spread;
+
+	/**
+	 * @macrotile_mode: Macrotile Mode
+	 *
+	 * Whether to use 4-channel macrotiling mode or the newer
+	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
+	 * 4-channel and 1 is 8-channel.
+	 */
+	bool macrotile_mode;
+};
+
+#define UBWC_1_0 0x10000000
+#define UBWC_2_0 0x20000000
+#define UBWC_3_0 0x30000000
+#define UBWC_4_0 0x40000000
+#define UBWC_4_3 0x40030000
+#define UBWC_5_0 0x50000000
+
+#ifdef CONFIG_QCOM_UBWC_CONFIG
+const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
+#else
+static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif
+
+#endif /* __QCOM_UBWC_H__ */

-- 
2.50.0

