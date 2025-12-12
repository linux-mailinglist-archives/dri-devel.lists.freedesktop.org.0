Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC34CB989E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 19:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081BA10E926;
	Fri, 12 Dec 2025 18:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KOCBX6c7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405E210E926
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 18:19:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZmwUt83ktGl8xbN6pAPBTznJLtXb4t4Mu85dUjGa4QqyTwxC1SC/Uye35ocjXXexfv15U/zk2heISb1xRNOwkfeAn1nEBkKOXpZjrgo5ojlQBlB35AqTJI25S0PNvJNv0u2gZHwU62R0jFBv+Wxaz1fezc6kFD5hZnYUTuwPUvWEyZh4W5hM5B+of10MT+AKYLHMyqG65p9nBdSJPNPRiDMQWH4Ig++FgALmBQsvuh4r1BEsPkUMECU//LPZ1dSlmTIonPUyougjVhNIBoZSpmiBEdsFYTh6qsM/bJz3FRWGJ/PFTF3lBFXY+UV7SODj6WeNk0YdUe3eCp0nuTo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM3hRlIxZB0jKtOtIWpKEqtUOd22XjRm+8Awk1QE3F0=;
 b=kGfDJMFWgXjXyA6arWr7WR89KAdq9wqRAfHZB82nWetYCp1Kx1T1RGXEM/F8c2bniCHHV8DO9fGnCbgDTeXThB3PdQH8CeZw4iphJndR/KmGc1DLuoIoRvG72zHygc7bCh6ScQR1F0/Zm0HoGzF1p0zPZWqQ+i3V93p4eRua3CgcucijyV+8aUHa7d+TPODOyVLSqEdl5SBJiIlDSH8MpGvNKjC5UYOYhMMKMtAZzNJ0VtNFV4DmAA5nXnSbJTXyjTHxWXkPc1HtPJR6vMYAIOgP2JkhE8GL1obyS08xTZHab20/iAKpcTrAq84yrWoJpUNPrDtkOoWjprzUsgzvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM3hRlIxZB0jKtOtIWpKEqtUOd22XjRm+8Awk1QE3F0=;
 b=KOCBX6c7CNgC/4C8Qls1leJrN+n78IgZluvz6qqA+FXJClANW/m8EL5Chs71hqaYGBa9pDbz16TrlpYrqJlmXYtpMpZfQcX9RROrkeg67WpJJsXdyg/uKQYn4EBwWCuMEQOvaFNjQmKKjNLVw2fpyjmIZaw2czaQS+LPKhwml2Y=
Received: from DS7PR03CA0167.namprd03.prod.outlook.com (2603:10b6:5:3b2::22)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 18:18:57 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f) by DS7PR03CA0167.outlook.office365.com
 (2603:10b6:5:3b2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Fri,
 12 Dec 2025 18:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 18:18:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 12:18:55 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 10:18:55 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <dri-devel@lists.freedesktop.org>, <platform-driver-x86@vger.kernel.org>,
 <Shyam-sundar.S-k@amd.com>, <VinitKumar.Shukla@amd.com>, Mario Limonciello
 <superm1@kernel.org>
Subject: [PATCH V2 2/2] accel/amdxdna: Add IOCTL to retrieve realtime NPU
 power estimate
Date: Fri, 12 Dec 2025 10:18:03 -0800
Message-ID: <20251212181803.1825142-3-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212181803.1825142-1-lizhi.hou@amd.com>
References: <20251212181803.1825142-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 039eda97-8177-412f-e560-08de39aaea1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JYNeU/inirDiRMB1m+oXzE3dWW7WPFo0z6qMxB+og9qJJdDQ0r9X2nW4Rh3S?=
 =?us-ascii?Q?i/DV4Q8fBTIOq8eAZnkR28DiE5jo+vbYu7ICppu1o2DlqWZdJw+j7obH2m+A?=
 =?us-ascii?Q?XX7tgWzzUJ8GG9X7rXi3Rugv12FzqgDpI1/Rn8/8MpWJxjoYvp6wCpwPhJPE?=
 =?us-ascii?Q?Uy6zuKCW5mNZsgPXoJGNsiYIgcibqEKCg1gjfcRV/HDA+u5AamZwbO7h+RYg?=
 =?us-ascii?Q?Zu94hGPZdqSvT5B06rXmItiQIr+CmAR5sVVno58L2kZwz1QevIiFqYttscz8?=
 =?us-ascii?Q?9scWeSuToTIAinMG/EJiRcjt2U1wQiIEAHoOLh+OLjh/rTnu5saGbmwms3W6?=
 =?us-ascii?Q?R4i5Yv3JlTlprLvYCrotZiIE2FwhkqEXh7L3bjtpDWb3IaImNbszxUEeIA4t?=
 =?us-ascii?Q?gVfwHFlrg4fxIiCqXKk2UTdgFgJIPK1wJWE0X0XTkZhWTG1cQSK3zGt5rtFG?=
 =?us-ascii?Q?jXcAd71H3rAobqNo7glL4sX6s4EvkikNjrU++qz1Gg5DmDjdYO9G0K7+dava?=
 =?us-ascii?Q?k+puzc7c81CWa3oMjXmut5qTWnpqr5nCm6Y1NP2u/MvGEZzYbKIpPOOLdPg3?=
 =?us-ascii?Q?ba8LK+FZsc7YKeNxlhLHn1XChU1JVYC3ORnuGbT5120eExLI/zuEdDD/lmYN?=
 =?us-ascii?Q?s47+RK/9RD+KBb2pOx1VAAkMtrrbKow76x2h8B+74dxIVLE5n9hOofXB6pBw?=
 =?us-ascii?Q?bxLv007Hi8s6uRRsf6Icrvqsx8jfuUvHbGuZKur9kobkNc8NuEPdAL2uIl7g?=
 =?us-ascii?Q?lQP8G/Kk6AE6Rlq9GiSpRerTm5gHj4eYjQJOIMCirlzwrilSsBfleou2GtNa?=
 =?us-ascii?Q?atop4pYMRhGHY8CP8pPIowW0Fy7KBC82C3FNAnA5aH14xh0pYkD8/A768qkJ?=
 =?us-ascii?Q?d4h+HkCDAD0VgUk0NNlAo2lrpxs40bSy0ye+w3ISD4vjrVY58EbQy29CJYmr?=
 =?us-ascii?Q?hyRnwe6e26LvL4BqnLtmdlF74j3xUDvZFdfr1ACxwlbgqb32OeaL8ImqI0qp?=
 =?us-ascii?Q?7b3NzEoGb1nT6NZnA1wlyl6ypgGL2IAZsz81A1paBSY3sLNs6ElwymfPwoHY?=
 =?us-ascii?Q?+V2sc5IU3prAlWSbJ+DuKps7kXhRTHb9vv/4MMaVkNkwVeo+NjkikVM6TBUo?=
 =?us-ascii?Q?1gr71Fw+ZK903UM5ZPGvnoIYx2ODDZ/onZRfffu0/h05h63b0+uyujSt3beh?=
 =?us-ascii?Q?unkhfgXa9Ab+sG/v+jvDWLL4woBpkCTnw7uX8w218ptXvS64QlZoM5K4K8z/?=
 =?us-ascii?Q?SH14oF7orwSr+Offo+dZ0KMGVbrcYVScUjuKGfLvXZJ/cFTfa8VmVTnit1Pw?=
 =?us-ascii?Q?s9oE73PMibRTnqKLLb80mpfmeq4rUQoyVG7a3Q1UYwP5qNZjxh2WcNGw8krD?=
 =?us-ascii?Q?UVaqvadLZI6IMHKfzgPLn6FRz+5lPVWYkA7JktdicV/LTMiryAcUiO1wHQX8?=
 =?us-ascii?Q?x8G9h1cpJRwsYF2qacRy/0kpRh2AvQq8MhTBcR3aLsEkW/eR9FRl/IYd/Ves?=
 =?us-ascii?Q?l7HC6rU8/HncHxeIwLE07DL81IW5r4EXeMi76rGE5NC/VFiTTNpN8izaIHa4?=
 =?us-ascii?Q?fM82t2gylGPli+ZpMEU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 18:18:56.7435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 039eda97-8177-412f-e560-08de39aaea1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130
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

The AMD PMF driver provides an interface to obtain realtime power
estimates for the NPU. Expose this information to userspace through a
new DRM_IOCTL_AMDXDNA_GET_INFO parameter, allowing applications to query
the current NPU power level.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        | 29 +++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 20 +++++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 81a8e4137bfd..55fbc8f0f455 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/cleanup.h>
 #include <linux/errno.h>
 #include <linux/firmware.h>
@@ -777,6 +778,31 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 	return ret;
 }
 
+static int aie2_get_sensors(struct amdxdna_client *client,
+			    struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_sensor sensor = {};
+	int ret;
+
+	if (args->buffer_size < sizeof(sensor))
+		return -EINVAL;
+
+	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
+	if (ret)
+		return ret;
+	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
+	sensor.unitm = -3;
+	scnprintf(sensor.label, sizeof(sensor.label), "Total Power");
+	scnprintf(sensor.units, sizeof(sensor.units), "mW");
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
+		return -EFAULT;
+
+	args->buffer_size = sizeof(sensor);
+
+	return 0;
+}
+
 static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 {
 	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
@@ -980,6 +1006,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	case DRM_AMDXDNA_QUERY_CLOCK_METADATA:
 		ret = aie2_get_clock_metadata(client, args);
 		break;
+	case DRM_AMDXDNA_QUERY_SENSORS:
+		ret = aie2_get_sensors(client, args);
+		break;
 	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
 		ret = aie2_get_hwctx_status(client, args);
 		break;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index c6b5cf4ae5c4..7f588ad99240 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -7,6 +7,7 @@
 #define _AIE2_PCI_H_
 
 #include <drm/amdxdna_accel.h>
+#include <linux/limits.h>
 #include <linux/semaphore.h>
 
 #include "amdxdna_mailbox.h"
@@ -46,6 +47,25 @@
 	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
 })
 
+#if IS_ENABLED(CONFIG_AMD_PMF)
+#define AIE2_GET_PMF_NPU_DATA(field, val)				\
+({									\
+	struct amd_pmf_npu_metrics _npu_metrics;			\
+	int _ret;							\
+									\
+	_ret = amd_pmf_get_npu_data(&_npu_metrics);			\
+	val = _ret ? U32_MAX : _npu_metrics.field;			\
+	(_ret);								\
+})
+#else
+#define SENSOR_DEFAULT_npu_power	U32_MAX
+#define AIE2_GET_PMF_NPU_DATA(field, val)				\
+({									\
+	val = SENSOR_DEFAULT_##field;					\
+	(-EOPNOTSUPP);							\
+})
+#endif
+
 enum aie2_smu_reg_idx {
 	SMU_CMD_REG = 0,
 	SMU_ARG_REG,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 1973ab67721b..643ebd387074 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -32,9 +32,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
  * 0.4: Support getting resource information
  * 0.5: Support getting telemetry data
  * 0.6: Support preemption
+ * 0.7: Support getting power data
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		6
+#define AMDXDNA_DRIVER_MINOR		7
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
-- 
2.34.1

