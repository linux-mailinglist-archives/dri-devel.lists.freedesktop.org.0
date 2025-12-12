Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6165BCB98A2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 19:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105CD10E927;
	Fri, 12 Dec 2025 18:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dE4ZOC82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012012.outbound.protection.outlook.com [52.101.53.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9E10E926
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 18:19:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+LzMINsiGFxceZgNTQIG05wQBNryQgLfndeNoe2L/XsUzMtQ5EWIUbwOMkF4KFZOyZvjbNOrDqJ0NizJHBNdeRUAT0cqK9KweKTRROc/mhOwW6XCwrPQ+hJi60uYvr0bybRWWmGufnQjRpPTo0r510fa2eMxYY+14Wmx5MOR45qugnvkXY09c9E3Ha4OULnWzo2QUp8aaheCq+Lp4Tr2OWRWTk5y9PYe2+agHTHkzN0gyYGRgaTydsptzkaz89bh/2mKg8sV2hw3kzVQ8cKcGXtXAfqFPTk/XbdTcODYddaO5QBZj4C9bEXHZiesLGmcIZ0pFawEagrDOm1ciWQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA3w352/1hZpfaTUrFo0xBplOOUVgnk5p220tX7LKFY=;
 b=aPthNQB5UEIoWrkjsBMbSS/oSjBlVJvMof0LTMQxaT33YxLt0eAD0nL9+FykzZOtzZEBfu6IeusLUxmm9CK16381brVOEgq4Fi0J1HlsSnt/Xl69O6A+oXz4uZVBEG62bxG8oYk9xiFekR97MVz/DKYqGn9YoYUniMFmYKb1dMJH4/cliz2iDmvpXa1NxwqldfuXVyKvhul2N+I8jhuShWz0JSIFKIM4hG+uTiZ2aFsSQhRb+JG+pj+DuFJg8nGa/kG/p5EzArAFyCmK84nY3663Amh2FgM2X+yaJqlFwhosevyKxVhLH84KEvnWWxio/42BSXnh7D2NlF141kc8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA3w352/1hZpfaTUrFo0xBplOOUVgnk5p220tX7LKFY=;
 b=dE4ZOC827Z10fMsyXulX+2b3po/qu4mQxNNkXeBXB01cAYlNfAosz3sOVr/h8oIkAVth+NEom76a992XS8W1RFb8j4E19FyXCwDbpFhfX+8CfYOpnSD9p7yOJd6fccewABwQP1wU2uJFGn8i83n4GJqxJZHh3OPgUTm7eY2baAE=
Received: from DS7PR03CA0151.namprd03.prod.outlook.com (2603:10b6:5:3b2::6) by
 MW4PR12MB7466.namprd12.prod.outlook.com (2603:10b6:303:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 18:18:56 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f7) by DS7PR03CA0151.outlook.office365.com
 (2603:10b6:5:3b2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Fri,
 12 Dec 2025 18:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 18:18:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 12:18:54 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 10:18:53 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <dri-devel@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <VinitKumar.Shukla@amd.com>, "Patil
 Rajesh Reddy" <Patil.Reddy@amd.com>, Lizhi Hou <lizhi.hou@amd.com>
Subject: [PATCH V2 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Date: Fri, 12 Dec 2025 10:18:02 -0800
Message-ID: <20251212181803.1825142-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212181803.1825142-1-lizhi.hou@amd.com>
References: <20251212181803.1825142-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|MW4PR12MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 504d115c-a3c5-4a46-f172-08de39aae96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YpzjCNhy+G1tPXX6Ytfgu5ejzHteMweqR5eqjX4NYG1Ml7MXqhDJcfLO7gtd?=
 =?us-ascii?Q?HEiYgby0CyBHz+2Inzi+oie48eks33cuGAQ1zO9Lo2RgaS2sBBRprM7T0o5L?=
 =?us-ascii?Q?1cyQOjsRCvhmbVB2TVh3I289kSGBE5Ko9YYFMeaaEGaiep4I+S34BXVPL7rA?=
 =?us-ascii?Q?JHV/oUtxvTl2d2ZOHSnyeAeL0RUXtX10/CU+NUIcWEucEMzqX1LbaJ7CtpYH?=
 =?us-ascii?Q?qY+ERH+r9bLa46xkXP2CzaMD7CO9oSwUX4xaftxgx9n0VjD/S05eIIZgJJnB?=
 =?us-ascii?Q?jMuJT9VMH692BnL493hngiSEA6sJCzcLVgby60YspMHk7exrgxut41xm0Wml?=
 =?us-ascii?Q?nK9isKOiiqMaS00eB6aEYLOvoDZFmKhcZJ91GlAeTSaZKbhQ9FR56k1MyL9n?=
 =?us-ascii?Q?5lJg3NdVTmFTZUKEEDceqIhHST0JOGFB8D892KPigJ8rvIKCcGMwX3KGbuWi?=
 =?us-ascii?Q?jEomTuDTnb2GoFMAuyKarIUdJx0kjU6aunIe07/Hr8nS+VVKriLfC1iyN3q7?=
 =?us-ascii?Q?Iio8iAYkSUTWD1kzabl9lArBrw07qyk/M6roHJGte+MGnXEgn8uWTMoy4bn9?=
 =?us-ascii?Q?54mauqok2cctanAoBy7h0JVpMCCrLoBV+qIUEbavoFfAJjcp5g2mKLuQokkp?=
 =?us-ascii?Q?ja+eCRFgZgb5FDlKDyg3KeHDP7+YndLGdCsnNHa8iWZved84nHHW32QVzoJ7?=
 =?us-ascii?Q?TR0NDxHcPSo4bXGsWAeHK1Mxa2tJlcaFDKbNYDAUF7cs0MVHF2kKqlZT6sBo?=
 =?us-ascii?Q?F4NIxFb+4F9R9BrpRTQgSAZnsDie2d/ZzkibhdFrBvPUsw3HVR6488BDqFZJ?=
 =?us-ascii?Q?HnE8rGwyndxVrNt6xSyFiawRlMuVulOPg+7ZUmQ5pGCHbagw8RNJ6mRf5nNS?=
 =?us-ascii?Q?ICK7T7HkWiixUliPI5i6edWPpX2tbw3QUmemIki+tsjM53OdUZ/cQraA9b//?=
 =?us-ascii?Q?Z7aBzV3UydsM0qpkram0+MJ1CR9kDn/XHt8uyQEWfL8wjT3XFrnO00VP7zP+?=
 =?us-ascii?Q?r7kp4MnxK2bEQn66hneuWI+69LpTk/DQ8tDt32Y1npGasbMgx9o2Udd1VfAk?=
 =?us-ascii?Q?tH5K3jaasYahVLTvRbDOAK3+HzAIwj2zy4RWcRyEesxdsa6UPUznacV+CXzl?=
 =?us-ascii?Q?MSuip728criSHprwrJDKsGF8xhcPspTTFfchKRdrVrG5h/oGWtA4IRc3m92q?=
 =?us-ascii?Q?vPS2ZZBiWdBEQFwJtDaCYhEbmtB4f4kgf32CgkJE8FC06MyJXzs5aNJvILCr?=
 =?us-ascii?Q?3U+K5dvI/BOjJgOiAjrsZ7U6P41nb3aL6etmOEKxp9sklIEhKaf+629wcPc7?=
 =?us-ascii?Q?9SF8otON/LBMHbCZhbZseoPJz2XpbYAyLIqZ1C8tE/jCJoNJK0MKwv7r5/lK?=
 =?us-ascii?Q?3QESi7wAA9N9/+NB2IwWAgSOnCBjYm8V9b99DkO/wcfqxTTHnSWINKuYHcXE?=
 =?us-ascii?Q?o3SbVJBmNJm1azcUFKqUSxW43ZasGKLqEb+qqwOv71xWR0+3GLwbGr97RAUY?=
 =?us-ascii?Q?mM9Pye6HnMPaetiWacNUEMwv6qzWohmwmiAr7IYe8WDRH+ZscE+Zs9sYq5rC?=
 =?us-ascii?Q?AMfKaHfVD8OtG+4ejtA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 18:18:55.5907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504d115c-a3c5-4a46-f172-08de39aae96e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7466
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
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 75 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  2 +
 include/linux/amd-pmf-io.h          | 21 ++++++++
 3 files changed, 98 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a6a5d416edf9..8e4ce91b3527 100644
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
@@ -314,6 +319,70 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
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
+	if (is_npu_metrics_supported(dev))
+		return -EOPNOTSUPP;
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
@@ -469,6 +538,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	mutex_init(&dev->update_mutex);
 	mutex_init(&dev->cb_mutex);
 
+	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
+	if (err)
+		return err;
+
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_dbgfs_register(dev);
@@ -477,6 +550,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
+	pmf_device = dev->dev;
+
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index f07e9f4c660a..0354cc5dc79e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,6 +12,7 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -412,6 +413,7 @@ struct amd_pmf_dev {
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

