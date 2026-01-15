Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFBD2680F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 18:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A226910E14A;
	Thu, 15 Jan 2026 17:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2sQ4eCUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012067.outbound.protection.outlook.com
 [40.107.200.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2AB10E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 17:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFcdXKILN6qDklxhollm/rI2oR3upYcIRGEeLUehKm93nlk8b9PO7snq31WzBAVJ971qPkI9qN4EBdn1pOVv8EszziNuCqn2D76JrCRi296SrpHPmlloG6clgQFSBx9XmuPgN3Kn1ikaScj0WVhS5UYLFdFZD639+FX9Fm5/Ekq9+oUuYDH0gkxVSFN7TVhaQ7GdApZ/vgTWd1lch4pMOmw9/Q9UaDvU+Nu3GCLJVL5ZcnH95HRWYbXquxg8s9ZoYCRpaNzuqdMqOjmqZCb3r6i5q0u0hkJ9uFoeu10UEcy0azvKrEgjWdKKLoTXeYFBY1DLQOMXTS2iVUTcfK22hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp2DSDLXRvdZ5c+DzdfsRntKBqyBaf8l8Rg2zY9hDNw=;
 b=bi+cX0UsMavfo/vun0iNUPDbDk5lMgnWLwvv1//HRRRcpqREFGxxNhkHR2OVc0bJtQCTVQ0btjDxU/ArZ/QPDS0yoBzo0k6bCMs8cMAI0l25aUysh9qaA2/h7hlDaDf7wPJ7DG/Stlyu29/iyjWfYqyP9mxfW/cipznERHJFi+f28BwyMO+mw6FprfD5WuDNllt824LCwHeEaMDTEm01r1VautCErbPwnh/b8orPO7Z6tgKtxrB2gMcRkls0bZ/jOFHg+//5CrCDnPfVJJ8EYrCJknTmUpeRcy4fi4GzlB6d/dqc3a1jNkSbhH41hJyKcbKYaexpMcEsZjGXesqKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp2DSDLXRvdZ5c+DzdfsRntKBqyBaf8l8Rg2zY9hDNw=;
 b=2sQ4eCUo65iKcUGEMMBvjSR6igNvAc5tmAqd3YSXg1CCYn1HpeS2D5cPixDe8I0cl76i+hMSyhkItU2tzqOmQEiqzklmNXweI+u5/Fol1NjkrlwHMU9whqLeWgCSgcgQ5aGr+qG9KWdO8KshAdQ/7o1/Gu0ryeNXc8oN8RiUewk=
Received: from CH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::16)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 17:34:53 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::49) by CH5P220CA0004.outlook.office365.com
 (2603:10b6:610:1ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Thu,
 15 Jan 2026 17:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 17:34:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 15 Jan
 2026 11:34:52 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Jan
 2026 11:34:52 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 09:34:51 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <ilpo.jarvinen@linux.intel.com>,
 <hansg@kernel.org>
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, <VinitKumar.Shukla@amd.com>, "Patil
 Rajesh Reddy" <Patil.Reddy@amd.com>, Lizhi Hou <lizhi.hou@amd.com>
Subject: [PATCH V4] platform/x86/amd/pmf: Introduce new interface to export
 NPU metrics
Date: Thu, 15 Jan 2026 09:34:48 -0800
Message-ID: <20260115173448.403826-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 582dafc4-aad8-449f-b02e-08de545c6440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KkVpxgIV+CnxBxhk6X7qzYtzx+ZXgXsyIpQ8nCSb+1Nhy4DhKL8zJVzEpJNc?=
 =?us-ascii?Q?+zFyyGMwW86A0LzE0GhojJnmedpNvOJXAwjsVrUTKZXZo7A98vyAqSs+fSvP?=
 =?us-ascii?Q?fzYWT+GLwrx1AXNJmQ3RuSMkr4PIZr54wYenqKHOPKfsdiL0M3ilbxHxu3wD?=
 =?us-ascii?Q?r6L+MJMoVyWLb3sW3HTMa6qpinO8a1j/T1zzQqRWxWqzwiJvq+LPFb7SEOX9?=
 =?us-ascii?Q?5Idazn5DHRjcKXpd1IoVZWD6T6S3a/TaNDxpNgIHHzd2QeYyOgjHrpSQzxqE?=
 =?us-ascii?Q?c5o4M+NEcKL/MNHUkCRJWuVdJXk7PimcBckoFlSnODO5d+Rd2RWyjb0OxAQk?=
 =?us-ascii?Q?QW3IXtGXuKd8cZfq5CflyoRjhsPTEcc449rSO3tSInoUCcHoHJNOg9Ngh5LW?=
 =?us-ascii?Q?ZjPNlHu7r0NDdMowfxpvj1NkOoGpSc5Il07lTU5KR65T7pJDBx4LqnUziUvh?=
 =?us-ascii?Q?YFBuUa+JEpI6zSz33Gm9uRzlag/WMIsHm7xTrMZ43B/6UAnUu8dy2C7/jNs/?=
 =?us-ascii?Q?HuONNRCNn3HCGdnSVx3dDS7b/2MCMu2XAnEdq6+sz0mcTll0dkDP1czFBGdo?=
 =?us-ascii?Q?Ne+5W2j+486qW0213/EieyZkkYk7lLm4AWLTNBQm/7Io3nfJJlE0t847ip6E?=
 =?us-ascii?Q?1oxMXP2EU4OGRkDvdyygmwlFlniNexMKs5qh+j03sbZDFme+GFlVYocDSAWx?=
 =?us-ascii?Q?tB/jQbjWhMkghKyJWR+jv1XPI7Lu3AQ13EN5EKylT1WM5Bg9sXOf2qrkK9Hz?=
 =?us-ascii?Q?Ai91Yueqzvaf86GCJovClkz6z8nsg0isLy8Q5IA0m8jc8unwi1FeEAHDbjh7?=
 =?us-ascii?Q?N9QfJjhaA3WClqJ79WmOVWf6+uwR9jJvWJaJqX30zdD3A80/WnbLePKuLVgT?=
 =?us-ascii?Q?XTUItidpbna3vhcq+Ao7Vh395oan43lTNhc2EIAclKHIjbYOSFsda8hlgM7s?=
 =?us-ascii?Q?UTjuVT07MLZyy9PHbXj9GQ44PTtXksqEFc5EOPrzQTJLLT/iFqsKekmAlvA7?=
 =?us-ascii?Q?bEc2IXoChphXqTCeqf6QLEpmefIvjGTWqCdwnTt5mZlLnwLq/FmzlYkEkz6W?=
 =?us-ascii?Q?nBjcTnKUO5bkAWg3k80rdj9PynfbU/YHQscoG2rHNQ5xKC9LDXa9iXO7l1u7?=
 =?us-ascii?Q?e0gCkdcUtjWU+BNdQusza6L2oQJ4/k+vofo9djVv2RxD0hwwjSuUp0M/2iuK?=
 =?us-ascii?Q?RM+dPBNlbYYlBx1aQu/E1gIvlp39lTSmoz0DlO0HYE3la1ILcAgP/g47Xq+Q?=
 =?us-ascii?Q?JUPds2JmdoTTKAoJA3TcfrgQI57YS23BGwBZFbJwigDdV2L+gLYECs5xDNet?=
 =?us-ascii?Q?fJQgdN/xE1p3jSI/SZT0YolgoskcRsj0GMEmhkGo6OjMHJNJtraSQZVUuiHV?=
 =?us-ascii?Q?TXyLOdMJ9JAfgnLvk/FqrNU/1tBKjKV0pymiZbdE0SWGmpjj7apThz2hkTie?=
 =?us-ascii?Q?URc9G9Lsjy6sB1142JvJC+iOoONNrFvcqR7KRFevKCwbah1d0t18zQoEpwid?=
 =?us-ascii?Q?5jSEWPGABny+HptGJgEMejEKSNg1vGQEAfRt42B4Hep54q+YLuFRsIpOvpUF?=
 =?us-ascii?Q?GJhObM2kEDy1V7wJ3PB3zWh8U8gSb9VcBY9t46m8XIWTRuIliWQiD2ZSeJn0?=
 =?us-ascii?Q?Bj3YELNwnMjsyIoyedEGHHMlrZlDVu414xIVM0VxX1WOFDr7/nKub84I1fVw?=
 =?us-ascii?Q?xC9mag=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 17:34:52.8346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 582dafc4-aad8-449f-b02e-08de545c6440
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240
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
index 9f4a1f79459a..b53be1d9cb45 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -8,6 +8,8 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -15,6 +17,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
+#include <linux/string.h>
 #include <asm/amd/node.h>
 #include "pmf.h"
 
@@ -54,6 +57,8 @@ static bool force_load;
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
 
+static struct device *pmf_device;
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -315,6 +320,71 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
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
+EXPORT_SYMBOL_NS_GPL(amd_pmf_get_npu_data, "AMD_PMF");
+
 static int amd_pmf_suspend_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
@@ -482,6 +552,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
+	if (err)
+		return err;
+
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_dbgfs_register(dev);
@@ -490,6 +564,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
+	pmf_device = dev->dev;
+
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index e65a7eca0508..d76894c9c822 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,6 +12,7 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/circ_buf.h>
 #include <linux/input.h>
 #include <linux/mutex_types.h>
@@ -434,6 +435,7 @@ struct amd_pmf_dev {
 	bool cb_flag;			     /* To handle first custom BIOS input */
 	struct pmf_cbi_ring_buffer cbi_buf;
 	struct mutex cbi_mutex;		     /* Protects ring buffer access */
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

