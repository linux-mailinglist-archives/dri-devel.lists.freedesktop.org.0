Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CBCB6D51
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CDE10E855;
	Thu, 11 Dec 2025 17:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5insI7BS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010052.outbound.protection.outlook.com
 [52.101.193.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEC010E86E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 17:58:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5nb0ydHBLPqqpUCs1sQLiXXVi9SyBiOpF9lZzA3KQ9Z4RE9Mghe5JRAm8yPuK2Poyp3ZBBxCKt/YFuFPdJPPGjFGfI1MheHew3OVDjy9S6qbRkNnZiATzsGWDsTJkR7pNBBb0hSVoGW7enDJ1PeIPBa8zErjdE293LJ2+NwSxOjvcM0RfSWQ8sJ1kTNZDohwOVS+zZlAPup+61c7XMCPgMlGB9m7WOfvNNFuVEEhIdU5JzoeBBmU8YFqKzST75bVsZEiXX1Rrjm6yHCvw6sMOtiFIQEbpUi6bQXukvGr4mff5dDHVwEnTh6q+o3qsYDTT5CKAJZRqXlkFOReO+EDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA3w352/1hZpfaTUrFo0xBplOOUVgnk5p220tX7LKFY=;
 b=oR75Nn3hkCLQrkvnFd0HUQhZZyFNElhE7wcR/3/oaEWIWiOEjL/K88Dc8ttaNquVaBwJkOowriNaEoB3ahzU1EJyVWZRXiICyIni67u7HdjcHeUGlIc70R3n9rou14Nh27yUcTp3RZvINiOHQeNGouvuWgXn/y8W/O3c3INjm2a3ek31nArkKLoMZWg4Cy9HfXcvYIIRlTLcu+HE1UsPzzZs5BFaTfbOlA0me2RTnlHUZq3Gm5N2iYtCZB+9/kk/UeVV2sCEe41seQMJrmnp6k9DQdUYGBPh0MfLbMJB3YihMQxLruqpcj1QFQq65BRjalYxMZiNBIU8IOWl7NH8Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA3w352/1hZpfaTUrFo0xBplOOUVgnk5p220tX7LKFY=;
 b=5insI7BSTyX/0bOL7LBBNb3qzmkLr2Qsco+7Xu7UCUZxzX1INS642y7YhbDH4uAwodcOwVd07t54nRLDj1grWyUymH2EtfQoCApwwCrnAabnUQwqOA3YuxfsmKP0Nz7bHhcI/b7xQ2dDFgCNGtCpABAS460XCgTI1uv5v9tbifI=
Received: from BLAPR03CA0136.namprd03.prod.outlook.com (2603:10b6:208:32e::21)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 17:58:36 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::46) by BLAPR03CA0136.outlook.office365.com
 (2603:10b6:208:32e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Thu,
 11 Dec 2025 17:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 17:58:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 11:58:36 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 11:58:35 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 09:58:34 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <VinitKumar.Shukla@amd.com>, "Patil Rajesh
 Reddy" <Patil.Reddy@amd.com>, Lizhi Hou <lizhi.hou@amd.com>
Subject: [PATCH V1 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Date: Thu, 11 Dec 2025 09:58:01 -0800
Message-ID: <20251211175802.1760860-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211175802.1760860-1-lizhi.hou@amd.com>
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: fccabc33-2d97-4f89-4c2c-08de38dee86e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?35YBiYKLaSYXAMpk5CV2z6UTbbUKmbOEobguaLnpxr9t9k2TNhJAsWBbwsg+?=
 =?us-ascii?Q?RqPjAkKzEwcTmrjZTb3N3sVG5sCzyw9UaGbpgLTAPv8HpUKW4ArA3TvyhL7h?=
 =?us-ascii?Q?GPjDxd57abGkHfwRjdxnMMSgJ9l8QSQ8pJoYU2c/zo+PvDcbc5u6X+x93V2p?=
 =?us-ascii?Q?7Xu6+d6ND1sSH5JMoLEsDq5qqCjQjitbH5c49srDZcytpU9KKlX1DP5Vy8wX?=
 =?us-ascii?Q?sICLQPtWGYWKQ9Bq7Dc4E4wlXeHsWBKuAIPtck8fgKaZFzeJnEES8MIQzzag?=
 =?us-ascii?Q?sdDqyOQp3K/66+ybp4C1Ys40EYbM5HFg3HRqLOUDG6u7ekgTCWXum8v7r8mA?=
 =?us-ascii?Q?JBGhc4plIpY4duqet4TcP9UTCzzYJM8By6TtkRWBNtDOgn8PkgQ8KsMEYWpL?=
 =?us-ascii?Q?wbLu4MYOs99vfhrDKm6PTEICNDQ5IjkbuQOADxbKAHXNuBGHCU/4Lcmv6F2e?=
 =?us-ascii?Q?UiDBWWtxl4uFwb+q6PHQvmQfPYslagDuYol/3oY5WsTCCYmDPOh7JRY7IKL/?=
 =?us-ascii?Q?+gUcm0ohPeymD0dCgR+W4viXRJixzGqOGwKlrlgCSxRhxqGJIeGTks2pcKHn?=
 =?us-ascii?Q?8cq8/qosC11hbYwjOMMwRdWeVtAeKhlUSctvOXO54h4kz5hFuN2/HGX7VOJ4?=
 =?us-ascii?Q?IU0x20CitqUxM/z5LIAAGydClXb0ikwYPN9S16e97RLc97Kp9+a4eWkna3rF?=
 =?us-ascii?Q?wSrcjRupNaXkZR6w5ocDAvMP4gtmHGya2fbMdRnUZNDjznpVy805bA7J1G+Q?=
 =?us-ascii?Q?dFpyKW6XhyxIYt0skQgsOPotMF3orsTLEAT+nIpSnYeA6Rk4SeAnbd4REQLx?=
 =?us-ascii?Q?6K7IWx7zaU/G8A1pVFglTH8NGAWrNuY3CtLcp4I6/Qo7iNRAb45JBd7Fyq1O?=
 =?us-ascii?Q?OkY4xslJGMq7vB6IZSWJrVN5xuGXwZvQ2U/iS8ktQZ+Z6IepJJkqao/FpBKS?=
 =?us-ascii?Q?s9FmLRLYXEtR3mkM29lCpn2vOspbS2jagqhsTUXLPjCHZSVbZTF0C7UI8zfY?=
 =?us-ascii?Q?IjT4nZ/LkIxEALG3irtU63Sna/D4aDxwpbRO8W8/KLYjCTEmUrMaquTziiiS?=
 =?us-ascii?Q?gUdTMwzPEIo+5oNuOLFZ7YlT9qE1idxc5nM6iW4dMFTOAa9E15pDuoXJ9L+c?=
 =?us-ascii?Q?2Bduvc4Jvc0EMHj/H8NiYEYIDCcLDtaHAhVTznIm2i3anz4DDZkRgLazmRxu?=
 =?us-ascii?Q?mIFdEwZaq74nJLZQwpjaSP8luuLF4l13zW2U/TBHek2I+cYGZXZ1VqVA6Aar?=
 =?us-ascii?Q?Ry7il2rSl02jZd3R1MxUfPmXyWXukc2nW3v92Dgkz1bBzhS3H5+7XFaGPZzG?=
 =?us-ascii?Q?nKEmRzgvgJMSxbG7ELAgJMZKT31iqct9PY4Pr6olQxmtYiumQmukhxByye8q?=
 =?us-ascii?Q?cL4H8q/M46tcguPSE9U7uJ9pYBOb0wv7aLyCBXiClxLWPF1Rtb1GF2OmUrk4?=
 =?us-ascii?Q?5NigBCgRkgVvPMw4b/i9PmDEDgz44fx8uU/EKI1y91U16tnX2PWhPANcXyIk?=
 =?us-ascii?Q?Yy6Stt3s9WviSMaGPRXDoOmulytU00aqfQElVbwJBsA07DMOhSLTa7FaxNIN?=
 =?us-ascii?Q?mW88+Y869Yy8uHLsdeo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 17:58:36.6189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fccabc33-2d97-4f89-4c2c-08de38dee86e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223
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

