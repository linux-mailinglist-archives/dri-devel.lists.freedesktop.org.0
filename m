Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC2FAB0236
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36B010E945;
	Thu,  8 May 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CTwETgFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7108310E942;
 Thu,  8 May 2025 18:13:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 94AA444F18;
 Thu,  8 May 2025 18:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D96C4CEE7;
 Thu,  8 May 2025 18:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746728011;
 bh=bDHdn95VekxzDJanXgTA48lEwL5W43wixFKSpHwJLcs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CTwETgFnrOB7vyySHhuj/pCsic+K+giVtdx1wxWum9fnvATvxMuKJpZc/PoIWsv+c
 n0lp0gQPMj11qz9ZY2jXaZ0PhhKPcxw9CTuUYA2sBudl15DaF/IYNchH+3Rphw3XiK
 1VHylEBvUjwUmhbJTDvEab6lTd8g8JaU2KiUfrd7VGRHuKjdFie2rTgxjivfYpXNVo
 8m9ovfyusoz80w6WaAwfxUNXb4b2eJjXMVD/TBf6wWlWcCxaMin2rBpW8OQ/H2IpIU
 uxQkLuMINgT1rCeL0ElAXAfyhAeneDO5/UGMTzLrA+qzrqfUrp4lJCRVE2lv2S2Xtz
 xgyXoLeU3gcVg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:33 +0200
Subject: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=10882;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=V9ixTYvvS78w1Iy5uh3EIkmQbXcpwcNzwrwRRDc3Tlk=;
 b=6BK4dBDtEYF8kw7dI4WaRvmGXiZkIibrZ5kUJoR19VgvDF/MaXXGMoiyrsscA35k9xY/rhWSf
 zrECU9TqgBTAQXNhvnvJzPBjNChbDHeEdn2bJV5RH6mawri6JM5STrl
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig       |   8 ++
 drivers/soc/qcom/Makefile      |   1 +
 drivers/soc/qcom/ubwc_config.c | 255 +++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/ubwc.h  |  31 +++++
 4 files changed, 295 insertions(+)

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
index 0000000000000000000000000000000000000000..3f81fb2aab284dc9a5bcf53e5d638aaba44b6f2d
--- /dev/null
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -0,0 +1,255 @@
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
+	.highest_bank_bit = 1,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data msm8998_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 2,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data qcm2290_data = {
+	/* no UBWC */
+	.highest_bank_bit = 2,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sa8775p_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 4,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 0,
+	.macrotile_mode = true,
+	.mdss_reg_bus_bw = 74000,
+};
+
+static const struct qcom_ubwc_cfg_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 0,
+	.macrotile_mode = true,
+	.mdss_reg_bus_bw = 74000,
+};
+
+static const struct qcom_ubwc_cfg_data sc7180_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 1,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sc7280_data = {
+	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 1,
+	.macrotile_mode = true,
+	.mdss_reg_bus_bw = 74000,
+};
+
+static const struct qcom_ubwc_cfg_data sc8180x_data = {
+	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sc8280xp_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sdm670_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sdm845_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 2,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sm6115_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 7,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 1,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sm6125_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.ubwc_swizzle = 1,
+	.highest_bank_bit = 1,
+};
+
+static const struct qcom_ubwc_cfg_data sm6150_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sm6350_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 1,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sm7150_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sm8150_data = {
+	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.highest_bank_bit = 2,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sm8250_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.mdss_reg_bus_bw = 76800,
+};
+
+static const struct qcom_ubwc_cfg_data sm8350_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.mdss_reg_bus_bw = 74000,
+};
+
+static const struct qcom_ubwc_cfg_data sm8550_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.mdss_reg_bus_bw = 57000,
+};
+
+static const struct qcom_ubwc_cfg_data x1e80100_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	/* TODO: Add mdss_reg_bus_bw with real value */
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
index 0000000000000000000000000000000000000000..450106e6aea06f9f752bb7312ec3074e375eee4d
--- /dev/null
+++ b/include/linux/soc/qcom/ubwc.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018, The Linux Foundation
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QCOM_UBWC_H__
+#define __QCOM_UBWC_H__
+
+#include <linux/types.h>
+
+struct qcom_ubwc_cfg_data {
+	u32 ubwc_enc_version;
+	/* Can be read from MDSS_BASE + 0x58 */
+	u32 ubwc_dec_version;
+	u32 ubwc_swizzle;
+	int highest_bank_bit;
+	bool ubwc_bank_spread;
+	bool macrotile_mode;
+	u32 mdss_reg_bus_bw;
+};
+
+#define UBWC_1_0 0x10000000
+#define UBWC_2_0 0x20000000
+#define UBWC_3_0 0x30000000
+#define UBWC_4_0 0x40000000
+#define UBWC_4_3 0x40030000
+
+const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
+
+#endif /* __QCOM_UBWC_H__ */

-- 
2.49.0

