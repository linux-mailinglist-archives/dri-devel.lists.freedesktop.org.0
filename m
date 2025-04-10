Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB317A84B58
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 19:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070FD10E00D;
	Thu, 10 Apr 2025 17:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JUgaBfQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9651410E367;
 Thu, 10 Apr 2025 17:44:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EEA3E5C6295;
 Thu, 10 Apr 2025 17:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C03C4CEE9;
 Thu, 10 Apr 2025 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744307044;
 bh=byjPqvQPc42bqfKtrJH1QJSBB22ZcZ3s3vOaOeyswPI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JUgaBfQSXnVYYftWuHLKYAQf61AlfHOvDVu8abEu/KCOz3ePunM8bwvPSyg8912EE
 UAzwhsZ75YbglY6DBMBdRQZEwD/iPWS6BVkNsEnWElHsjt/rzxIzplt1dtAvhqxI4K
 ToYQq+bS5T2Hl/Bt2xIZVJm22amm3XfoGhinHLvlzS15kVIyl6HLkjaam+q2E9xssM
 78FtHBdu0N6PgcwKP6ai7eLl+h9fOh4XBUah9LdsZdAHOSXm+TbjaW5ixX/u75aaht
 JgiUVxGFKBn8Lg6ZgAbXO4zLi5eyeWjukotMGPniD3//IiyV/d+vCdTf5RLjXiwsUZ
 EPLjL3eDEEjFw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 19:43:44 +0200
Subject: [PATCH v2 1/4] soc: qcom: Expose DDR data from SMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-smem_dramc-v2-1-dead15264714@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=13057;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=lv2b+n0V6COIsWeGk95zhupmwnVxgQB6qm5r4KOC+3Y=;
 b=b0MAvJYosALuZtUU26WdzU0KAKRDJ3LL/L4DWaZJblqEQbhOju/FPTlzyaWKXpI/nylwLmJip
 828ll2cRIVMC0rIesBQY3KqAUYrs+eaVMf/zTVdcA64uhOR3rg+HWCz
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

Most modern Qualcomm platforms (>= SM8150) expose information about the
DDR memory present on the system via SMEM.

Details from this information is used in various scenarios, such as
multimedia drivers configuring the hardware based on the "Highest Bank
address Bit" (hbb), or the list of valid frequencies in validation
scenarios...

Add support for parsing v3-v5 version of the structs. Unforunately,
they are not versioned, so some elbow grease is necessary to determine
which one is present. See for reference:

v3: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/commit/1d11897d2cfcc7b85f28ff74c445018dbbecac7a
v4: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/commit/f6e9aa549260bbc0bdcb156c2b05f48dc5963203
v5: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/blob/uefi.lnx.4.0.r31-rel/QcomModulePkg/Include/Protocol/DDRDetails.h?ref_type=heads

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/Makefile     |   3 +-
 drivers/soc/qcom/smem.c       |  14 ++-
 drivers/soc/qcom/smem.h       |   9 ++
 drivers/soc/qcom/smem_dramc.c | 287 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |   4 +
 5 files changed, 315 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index acbca2ab5cc2a9ab3dce1ff38efd048ba2fab31e..7227f648893d047d7de8819dc159554af6a7b817 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -23,7 +23,8 @@ obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
 qcom_rpmh-y			+= rpmh-rsc.o
 qcom_rpmh-y			+= rpmh.o
 obj-$(CONFIG_QCOM_SMD_RPM)	+= rpm-proc.o smd-rpm.o
-obj-$(CONFIG_QCOM_SMEM) +=	smem.o
+qcom_smem-y			+= smem.o smem_dramc.o
+obj-$(CONFIG_QCOM_SMEM) +=	qcom_smem.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 CFLAGS_smp2p.o := -I$(src)
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 59281970180921b76312fd5020828edced739344..cfd6a9d531d3d2438d7577be0c594d3b960bd003 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/debugfs.h>
 #include <linux/hwspinlock.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -16,6 +17,8 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/socinfo.h>
 
+#include "smem.h"
+
 /*
  * The Qualcomm shared memory system is a allocate only heap structure that
  * consists of one of more memory areas that can be accessed by the processors
@@ -284,6 +287,8 @@ struct qcom_smem {
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
 
+	struct dentry *debugfs_dir;
+
 	unsigned num_regions;
 	struct smem_region regions[] __counted_by(num_regions);
 };
@@ -1230,17 +1235,24 @@ static int qcom_smem_probe(struct platform_device *pdev)
 
 	__smem = smem;
 
+	smem->debugfs_dir = smem_dram_parse(smem->dev);
+
 	smem->socinfo = platform_device_register_data(&pdev->dev, "qcom-socinfo",
 						      PLATFORM_DEVID_NONE, NULL,
 						      0);
-	if (IS_ERR(smem->socinfo))
+	if (IS_ERR(smem->socinfo)) {
+		debugfs_remove_recursive(smem->debugfs_dir);
+
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
+	}
 
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
+	debugfs_remove_recursive(__smem->debugfs_dir);
+
 	platform_device_unregister(__smem->socinfo);
 
 	hwspin_lock_free(__smem->hwlock);
diff --git a/drivers/soc/qcom/smem.h b/drivers/soc/qcom/smem.h
new file mode 100644
index 0000000000000000000000000000000000000000..8bf3f606e1ae80b7aa02b9567870f6a2681f8e5a
--- /dev/null
+++ b/drivers/soc/qcom/smem.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __QCOM_SMEM_INTERNAL__
+#define __QCOM_SMEM_INTERNAL__
+
+#include <linux/device.h>
+
+struct dentry *smem_dram_parse(struct device *dev);
+
+#endif
diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
new file mode 100644
index 0000000000000000000000000000000000000000..6ded45fd55c2ffa0924492f8042b753ec6c925cf
--- /dev/null
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/units.h>
+#include <linux/soc/qcom/smem.h>
+
+#include "smem.h"
+
+#define SMEM_DDR_INFO_ID		603
+
+#define MAX_DDR_FREQ_NUM_V3		13
+#define MAX_DDR_FREQ_NUM_V5		14
+
+#define MAX_DDR_REGION_NUM		6
+#define MAX_CHAN_NUM			8
+#define MAX_RANK_NUM			2
+
+static struct smem_dram *__dram;
+
+enum ddr_info_version {
+	INFO_UNKNOWN,
+	INFO_V3,
+	INFO_V3_WITH_14_FREQS,
+	INFO_V4,
+	INFO_V5,
+	INFO_V5_WITH_6_REGIONS,
+};
+
+struct smem_dram {
+	unsigned long frequencies[MAX_DDR_FREQ_NUM_V5];
+	u32 num_frequencies;
+	u8 hbb;
+};
+
+enum ddr_type {
+	DDR_TYPE_NODDR = 0,
+	DDR_TYPE_LPDDR1 = 1,
+	DDR_TYPE_LPDDR2 = 2,
+	DDR_TYPE_PCDDR2 = 3,
+	DDR_TYPE_PCDDR3 = 4,
+	DDR_TYPE_LPDDR3 = 5,
+	DDR_TYPE_LPDDR4 = 6,
+	DDR_TYPE_LPDDR4X = 7,
+	DDR_TYPE_LPDDR5 = 8,
+	DDR_TYPE_LPDDR5X = 9,
+};
+
+/* The data structures below are NOT __packed on purpose! */
+
+/* Structs used across multiple versions */
+struct ddr_part_details {
+	__le16 revision_id1;
+	__le16 revision_id2;
+	__le16 width;
+	__le16 density;
+};
+
+struct ddr_freq_table {
+	u32 freq_khz;
+	u8 enabled;
+};
+
+/* V3 */
+struct ddr_freq_plan_v3 {
+	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V3]; /* NOTE: some have 14 like v5 */
+	u8 num_ddr_freqs;
+	phys_addr_t clk_period_address;
+};
+
+struct ddr_details_v3 {
+	u8 manufacturer_id;
+	u8 device_type;
+	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
+	struct ddr_freq_plan_v3 ddr_freq_tbl;
+	u8 num_channels;
+};
+
+/* V4 */
+struct ddr_details_v4 {
+	u8 manufacturer_id;
+	u8 device_type;
+	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
+	struct ddr_freq_plan_v3 ddr_freq_tbl;
+	u8 num_channels;
+	u8 num_ranks[MAX_CHAN_NUM];
+	u8 highest_bank_addr_bit[MAX_CHAN_NUM][MAX_RANK_NUM];
+};
+
+/* V5 */
+struct ddr_freq_plan_v5 {
+	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V5];
+	u8 num_ddr_freqs;
+	phys_addr_t clk_period_address;
+	u32 max_nom_ddr_freq;
+};
+
+struct ddr_region_v5 {
+	u64 start_address;
+	u64 size;
+	u64 mem_controller_address;
+	u32 granule_size; /* MiB */
+	u8  ddr_rank;
+#define DDR_RANK_0	BIT(0)
+#define DDR_RANK_1	BIT(1)
+	u8  segments_start_index;
+	u64 segments_start_offset;
+};
+
+struct ddr_regions_v5 {
+	u32 ddr_region_num; /* We expect this to always be 4 or 6 */
+	u64 ddr_rank0_size;
+	u64 ddr_rank1_size;
+	u64 ddr_cs0_start_addr;
+	u64 ddr_cs1_start_addr;
+	u32 highest_bank_addr_bit;
+	struct ddr_region_v5 ddr_region[] __counted_by(ddr_region_num);
+};
+
+struct ddr_details_v5 {
+	u8 manufacturer_id;
+	u8 device_type;
+	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
+	struct ddr_freq_plan_v5 ddr_freq_tbl;
+	u8 num_channels;
+	struct ddr_regions_v5 ddr_regions;
+};
+
+/**
+ * qcom_smem_dram_get_hbb(): Get the Highest bank address bit
+ *
+ * Context: Check qcom_smem_is_available() before calling this function.
+ * Because __dram * is initialized by smem_dram_parse(), which is in turn
+ * called from * qcom_smem_probe(), __dram will only be NULL if the data
+ * couldn't have been found/interpreted correctly.
+ *
+ * If the function fails, the argument is left unmodified.
+ *
+ * Return: 0 on success, -ENODATA on failure.
+ */
+int qcom_smem_dram_get_hbb(void)
+{
+	return __dram ? __dram->hbb : -ENODATA;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_dram_get_hbb);
+
+static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool additional_freq_entry)
+{
+	/* This may be 13 or 14 */
+	int num_freq_entries = MAX_DDR_FREQ_NUM_V3;
+	struct ddr_details_v3 *details = data;
+
+	if (additional_freq_entry)
+		num_freq_entries++;
+
+	for (int i = 0; i < num_freq_entries; i++) {
+		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
+
+		if (freq_entry->freq_khz && freq_entry->enabled)
+			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+	}
+}
+
+static void smem_dram_parse_v4_data(struct smem_dram *dram, void *data)
+{
+	struct ddr_details_v4 *details = data;
+
+	/* Rank 0 channel 0 entry holds the correct value */
+	dram->hbb = details->highest_bank_addr_bit[0][0];
+
+	for (int i = 0; i < MAX_DDR_FREQ_NUM_V3; i++) {
+		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
+
+		if (freq_entry->freq_khz && freq_entry->enabled)
+			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+	}
+}
+
+static void smem_dram_parse_v5_data(struct smem_dram *dram, void *data)
+{
+	struct ddr_details_v5 *details = data;
+	struct ddr_regions_v5 *region = &details->ddr_regions;
+
+	dram->hbb = region[0].highest_bank_addr_bit;
+
+	for (int i = 0; i < MAX_DDR_FREQ_NUM_V5; i++) {
+		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
+
+		if (freq_entry->freq_khz && freq_entry->enabled)
+			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+	}
+}
+
+/* The structure contains no version field, so we have to perform some guesswork.. */
+static int smem_dram_infer_struct_version(size_t size)
+{
+	/* Some early versions provided less bytes of less useful data */
+	if (size < sizeof(struct ddr_details_v3))
+		return -EINVAL;
+	if (size == sizeof(struct ddr_details_v3))
+		return INFO_V3;
+	else if (size == sizeof(struct ddr_details_v3) + sizeof(struct ddr_freq_table))
+		return INFO_V3_WITH_14_FREQS;
+	else if (size == sizeof(struct ddr_details_v4))
+		return INFO_V4;
+	else if (size == sizeof(struct ddr_details_v5) + 4 * sizeof(struct ddr_region_v5))
+		return INFO_V5;
+	else if (size == sizeof(struct ddr_details_v5) + 6 * sizeof(struct ddr_region_v5))
+		return INFO_V5_WITH_6_REGIONS;
+
+	return INFO_UNKNOWN;
+}
+
+static int smem_dram_frequencies_show(struct seq_file *s, void *unused)
+{
+	struct smem_dram *dram = s->private;
+
+	for (int i = 0; i < dram->num_frequencies; i++)
+		seq_printf(s, "%lu\n", dram->frequencies[i]);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(smem_dram_frequencies);
+
+struct dentry *smem_dram_parse(struct device *dev)
+{
+	struct dentry *debugfs_dir;
+	enum ddr_info_version ver;
+	struct smem_dram *dram;
+	size_t actual_size;
+	void *data = NULL;
+
+	/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */
+	data = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_DDR_INFO_ID, &actual_size);
+	if (IS_ERR_OR_NULL(data))
+		return ERR_PTR(-ENODATA);
+
+	ver = smem_dram_infer_struct_version(actual_size);
+	if (ver < 0) {
+		/* Some SoCs don't provide data that's useful for us */
+		return ERR_PTR(-ENODATA);
+	} else if (ver == INFO_UNKNOWN) {
+		/* In other cases, we may not have added support for a newer struct revision */
+		pr_err("Found an unknown type of DRAM info struct (size = %zu)\n", actual_size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	dram = devm_kzalloc(dev, sizeof(*dram), GFP_KERNEL);
+	if (!dram)
+		return ERR_PTR(-ENOMEM);
+
+	switch (ver) {
+	case INFO_V3:
+		smem_dram_parse_v3_data(dram, data, false);
+		break;
+	case INFO_V3_WITH_14_FREQS:
+		smem_dram_parse_v3_data(dram, data, true);
+		break;
+	case INFO_V4:
+		smem_dram_parse_v4_data(dram, data);
+		break;
+	case INFO_V5:
+	case INFO_V5_WITH_6_REGIONS:
+		smem_dram_parse_v5_data(dram, data);
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* Both the entry and its parent dir will be cleaned up by debugfs_remove_recursive */
+	debugfs_dir = debugfs_create_dir("qcom_smem", NULL);
+	debugfs_create_file("dram_frequencies", 0444, debugfs_dir,
+			    dram, &smem_dram_frequencies_fops);
+
+	/* If there was no failure so far, assign the global variable */
+	__dram = dram;
+
+	return debugfs_dir;
+}
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index f946e3beca215548ac56dbf779138d05479712f5..223cd5090a2a8d0b29be768c6a9cc76c2997bbce 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -2,6 +2,8 @@
 #ifndef __QCOM_SMEM_H__
 #define __QCOM_SMEM_H__
 
+#include <linux/platform_device.h>
+
 #define QCOM_SMEM_HOST_ANY -1
 
 bool qcom_smem_is_available(void);
@@ -17,4 +19,6 @@ int qcom_smem_get_feature_code(u32 *code);
 
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
 
+int qcom_smem_dram_get_hbb(void);
+
 #endif

-- 
2.49.0

