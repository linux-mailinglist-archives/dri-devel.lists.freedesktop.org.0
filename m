Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E9FCF500B
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A207910E2D5;
	Mon,  5 Jan 2026 17:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nQVq7FeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A6D10E3DA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM3zDiLQRySIJa5RTZEMX2Pj5ELfoniav9V4GVrFqcwOPUdNL+lSwmYA9WjMmTvJE+vd/dI0x1jsGC9iWq4DLx8jZKyA+9ZShK342HDlmMOyJLB9sU87Nhai9UPocM5FUbeVmGYL4SsQerB8XJ9oYqOH+fxW88GV/oyaSoz+GrGxvwhkv76+++GDPFvJUCLBz70nsBAmI1Em4Mwivj6pGftivh5WOHmyXlYjNd9RMHMhjj2QbwnERksGgwBfOGm6ETwjKju00qQvzyDDrySvvylR/WP3haFJVCLQkhzssY8ydre5AcAZoMFpLOXg2v50aOpuNa7y77nfbvRs7EsvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq38kDVRtiUTyD2S8W1dEnqpH4ZTdLdNEhzq2sJf3wo=;
 b=LVx4lO8+D0eTCA9L92G1bk4JJ38dMUN4I9iFQ5DlK8By4ynpv4sAsmgB7DeErJZGWEaghNst6M/GkKN3x4mmT1qWAvwqAFJ3BL21DOKDp2tgFGC/UalXFS3Q+34pA2IsFpb28TZ6u5Ilj7cawj20WAst5LTji+3ExrFMizxAhZkZC1jLHizwNIE7gNESV3jOGIoR45npfhhUiGyrU41oU4meCoS1BLbEIDVR1NJGXkBF75AUHKvlHaGM/0qmm9eRtP0KlTOhiR6vXhLvjGYhCx7DY8A0RtHERk1qFHvL3tNC4pBZSvoRC/H4QASqbMKKOtrSINVPnAV35wOyaiyHbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq38kDVRtiUTyD2S8W1dEnqpH4ZTdLdNEhzq2sJf3wo=;
 b=nQVq7FeXuF+sCM92B+CVr61W/Gy++2SJTgsyWHVGgM3Ciq0i0SuTNdt50ruhqj/hCQN4pXnFWsWwYQnJPF553aaaynTq0Xea0MNPWIKURbNjG75HHAsuVVRn8VcBXDGPk5VIk/lCAe1KGJt6vPliInUHNsLmaAJBaiAviy2LPsY=
Received: from MW4PR04CA0139.namprd04.prod.outlook.com (2603:10b6:303:84::24)
 by PH7PR12MB6586.namprd12.prod.outlook.com (2603:10b6:510:212::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:30:17 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::d7) by MW4PR04CA0139.outlook.office365.com
 (2603:10b6:303:84::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 17:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Mon, 5 Jan 2026 17:30:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 11:30:08 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 5 Jan 2026 09:30:07 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <ilpo.jarvinen@linux.intel.com>,
 <hansg@kernel.org>
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, <VinitKumar.Shukla@amd.com>, "Patil
 Rajesh Reddy" <Patil.Reddy@amd.com>, Lizhi Hou <lizhi.hou@amd.com>
Subject: [PATCH V3 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Date: Mon, 5 Jan 2026 09:29:55 -0800
Message-ID: <20260105172956.3732123-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105172956.3732123-1-lizhi.hou@amd.com>
References: <20260105172956.3732123-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|PH7PR12MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8cc491-ec3b-4aa3-3c5d-08de4c8017a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oGZsl3KkLxTg/mCxYnO4V1KeZI12gypsRMHAXAjLMTTEFGyG8o+CIQ3rgBKM?=
 =?us-ascii?Q?Damr38aaeFk1yllRVDUSKUEQZq5ME/3PhMmTOLm5yRAwGjiJIN3jsq9q4uxH?=
 =?us-ascii?Q?xgJ06MZnfYPgJc9X3aUdr3GFXZmGhM8bDCBsl8yJQJJYFfWoXlZd0Kp6wzWK?=
 =?us-ascii?Q?eiZ9M1Vd7K8XQ3ZfJrEryUnCHcbX5eQov8cUAgC2Y9nRHp+01OW522LhcE3J?=
 =?us-ascii?Q?MT2ZeZDf12qVmhsvlZOAe0Hii1k56uyQVFdCbKF6SOUIPrtKP4ClrgSGy/WZ?=
 =?us-ascii?Q?NZncWEvwKYVJqvYxvGLLuNR/2Gm0Q48BaNc5itMzIeVazgCQ9vA8aYQ3emmh?=
 =?us-ascii?Q?arCwMnkcXJWAFN/WgWzRhzVyfqXjysSxwf307uc3eGaQmUuUsb5irwgnb5yK?=
 =?us-ascii?Q?oE0jOSPvY6QGAY4eV8+xL9QUQFwp+CV22JDudSMsWDX6OrCwHrrQCsO9B9dL?=
 =?us-ascii?Q?kclSCepOd+nB/wFxCFQoQGthZA1AWSlmXH27Uqi9/PrlN2yxbXqrapLF5Agn?=
 =?us-ascii?Q?akCwrwGxd6ZqASd7F7SeLLBd9v9jLnyTAVZFrkGeP4JjHXPQo0Tfr9nvHLtR?=
 =?us-ascii?Q?paJe1h7dgfiz02fN8QnFFAaIr8+K7cGl+EUECdCzKgYvdAgj5rTe+MJs0EiR?=
 =?us-ascii?Q?BlTvgHBIRFkjQF1oWEgJeZW53ij9HMWWAwRJ5dInQcqQJIRXuvutBA3Jl90k?=
 =?us-ascii?Q?jdv6eAEbwUUHwJzsNPy1otJYqQaPdcoM0p2Y8Psp5XfDcqZV7ztfpGLMvZCm?=
 =?us-ascii?Q?v2gbSjLDxDI3v6bH2vSv8acd+sd/fMuDB42MKWIi5Q7A80U/ne+DmZ6b6GNQ?=
 =?us-ascii?Q?rxh4y+z2BDZcoIYk9AesvVxPViOar+qr0GCFAt8D/T0hEPsS6+V9eozxZ4qZ?=
 =?us-ascii?Q?Km+nOrwc+kSyP9yKB9CGQV10r6WV5tr9e60pLOSosA0itZ8g7OE/ZnU5HD0z?=
 =?us-ascii?Q?QrcuFu4s1+Ec8NBTD2WJbQzqlSy2c4ENaY5K9l8yzAsAy0qweVsbzHXOGhtu?=
 =?us-ascii?Q?8qEIX8cVic45VjJapzvLIFZoOI0Qk1MRDnkNaOHk0QlY7s0egnPws9eeiZVk?=
 =?us-ascii?Q?iPn1N7Wdu5luNqKQAspCNsL54J77CsO4vVfWEpJdlzQOZ8CuHzEK1PxrxjYc?=
 =?us-ascii?Q?w5QdNcPskIzBCC12cHd+n/7sTkCjSFbVLZUNotBQnlIRv6DGCkr/FEyq6P8f?=
 =?us-ascii?Q?OZLSPPZu57K2ORh3OCSpZknejKAgHcMLZdDquyBYi3wxl8DoZRR1v17R4uMo?=
 =?us-ascii?Q?LRoxcnJpEHWI99Q8F+zc7NEhU4/eLzLzRPHFBIdTFHkgApOSlEKgJ4Jw+8uJ?=
 =?us-ascii?Q?M1G5SgObRw8WduQFiEUC3LK0PPUqYF7K95NbQ/wFiOUd2kglG/foF1ptaRaM?=
 =?us-ascii?Q?OK9zawL7UGsyPoUJqcJyQ4ikd5A54lg5yxBoRW+RObvwZmeaOMQSnujNSD5w?=
 =?us-ascii?Q?IjyiiDYxjenNFj6CsN+GULbH3fzegqSM/2qmBvo1W/pm8gDvAPjdxjp8iFiE?=
 =?us-ascii?Q?xRBRdZhz1pXmdPnCy8Hxs36+bJg3lDrcS0sry2870xjtja77PPimf6OxH2Ho?=
 =?us-ascii?Q?2BjwtoOrNQ1JqevVGUg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 17:30:16.8743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8cc491-ec3b-4aa3-3c5d-08de4c8017a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6586
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

From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
interface to make NPU metrics accessible to other drivers like AMDXDNA
driver, which can access and utilize this information as needed.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
[lizhi: save return value of is_npu_metrics_supported() and return it]
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 76 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  2 +
 include/linux/amd-pmf-io.h          | 21 ++++++++
 3 files changed, 99 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 8fc293c9c538..d180a39e03bf 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -8,12 +8,15 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
+#include <linux/string.h>
 #include <asm/amd/node.h>
 #include "pmf.h"
 
@@ -53,6 +56,8 @@ static bool force_load;
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
 
+static struct device *pmf_device;
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -314,6 +319,71 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
+{
+	switch (pdev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
+{
+	int ret, i;
+
+	guard(mutex)(&dev->metrics_mutex);
+
+	ret = is_npu_metrics_supported(dev);
+	if (ret)
+		return ret;
+
+	ret = amd_pmf_set_dram_addr(dev, true);
+	if (ret)
+		return ret;
+
+	memset(dev->buf, 0, dev->mtable_size);
+
+	/* Send SMU command to get NPU metrics */
+	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
+	if (ret) {
+		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
+		return ret;
+	}
+
+	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
+
+	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
+	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
+		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
+	data->npu_power = dev->m_table_v2.npu_power;
+	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
+	data->npu_reads = dev->m_table_v2.npu_reads;
+	data->npu_writes = dev->m_table_v2.npu_writes;
+
+	return 0;
+}
+
+int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
+{
+	struct amd_pmf_dev *pdev;
+
+	if (!info)
+		return -EINVAL;
+
+	if (!pmf_device)
+		return -ENODEV;
+
+	pdev = dev_get_drvdata(pmf_device);
+	if (!pdev)
+		return -ENODEV;
+
+	return amd_pmf_get_smu_metrics(pdev, info);
+}
+EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
+
 static int amd_pmf_suspend_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
@@ -477,6 +547,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
+	if (err)
+		return err;
+
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_dbgfs_register(dev);
@@ -485,6 +559,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
+	pmf_device = dev->dev;
+
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9144c8c3bbaf..1bf896c5b92c 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,6 +12,7 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -413,6 +414,7 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 	bool cb_flag;			     /* To handle first custom BIOS input */
+	struct mutex metrics_mutex;
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 6fa510f419c0..55198d2875cc 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -61,5 +61,26 @@ enum laptop_placement {
 	LP_UNDEFINED,
 };
 
+/**
+ * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
+ * @npuclk_freq: NPU clock frequency [MHz]
+ * @npu_busy: NPU busy % [0-100]
+ * @npu_power: NPU power [mW]
+ * @mpnpuclk_freq: MPNPU [MHz]
+ * @npu_reads: NPU read bandwidth [MB/sec]
+ * @npu_writes: NPU write bandwidth [MB/sec]
+ */
+struct amd_pmf_npu_metrics {
+	u16 npuclk_freq;
+	u16 npu_busy[8];
+	u16 npu_power;
+	u16 mpnpuclk_freq;
+	u16 npu_reads;
+	u16 npu_writes;
+};
+
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
+
+/* AMD PMF and NPU interface */
+int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
 #endif
-- 
2.34.1

