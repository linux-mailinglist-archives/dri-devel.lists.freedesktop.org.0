Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2620CCE2C1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA41B10EC43;
	Fri, 19 Dec 2025 01:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Siy19IKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792CA10EC43
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 01:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixb0Uix1tb6MFsW579F2aWoAxndaiSb8sFBT2LCaRwYSm0kdwbvgA5C+xkKQv4bJKFQIJr52Xsso6M8SntxZQY1zEJnLn+67e6Q4E2r3MjqITCVtvTEKrtaANpo1WBBfcBix7faDDfFKaicAK6ZB3FbgfqixQF2zoyDWITsNmWWL0uUpSLa5uqT4VYCW+m3SGqevQmY8nKC3bIfhE/DZNe6v+qLJSyHocL0j8OfT4b89IVwp+t/6YxJj9Jm+ttkOmR5MUcrC7gW1BnddKFyUsiNt6SMf5n779W7b8Z6yGhaSgTOBas0UHhscFbmukRpx+1ytxTQuTvBwCHYeLfXE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElDOR2gdxfG1I0LggMqPpUiTvfj9g51D/wH0t42EB9E=;
 b=K517bRgX1bpHIg/NXxeFrcGF8fsKD39rJ0wlIug5mYXPwmJt+4FKG99BzehMGAymPHYXdEDBP2IzsAfmjlykxJN36ZU5FBchi8JPH+zo7XWjWkwW2pkZTDFjArpVenGLi/VUv7fE2+Ah6rqK+ICfoiD7pUl3pzPJbPJNNchHmvJ3ittt7STlIIFj8FGUTmFEzU4OLCI16b0SHiclCAuVqT1jZuovbN4sEGNyHJVocphLky2DE2qMHpb15sIcJ04bBEQvKK9noSfoWVZ7NoEvjGzwU08CHQYevcXbWH4wv3NScniwPwmeS0hm+hNmkYIlAzLohfMZTiBgJYPkYqqcjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElDOR2gdxfG1I0LggMqPpUiTvfj9g51D/wH0t42EB9E=;
 b=Siy19IKb9vkgw2j4C3A/+p0pRrgwhU+MrS4Uz4M8rnfFvMe8Q7yLdaIorZSBkqXgvLsB3D6f/jIH/bUh+HHuX6NJz2Y+5Cb/b5s/OsawIYheYJP/mFi1WCypfYTQZFr0y1zdfb4sKrHoph8p27f5n7gzByTr39N6wXEjUrNDRtU=
Received: from BL0PR02CA0084.namprd02.prod.outlook.com (2603:10b6:208:51::25)
 by DS7PR12MB8231.namprd12.prod.outlook.com (2603:10b6:8:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 01:44:22 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::ff) by BL0PR02CA0084.outlook.office365.com
 (2603:10b6:208:51::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 01:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 01:44:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:22 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:21 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 19:44:21 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1 2/2] accel/amdxdna: Update firmware version check for
 latest firmware
Date: Thu, 18 Dec 2025 17:43:56 -0800
Message-ID: <20251219014356.2234241-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219014356.2234241-1-lizhi.hou@amd.com>
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS7PR12MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf5404b-d3bc-4134-3e65-08de3ea0224f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bUjyNPc5hvdMg+gxZ7MBPW4xAxiAWNsZgYEwrYT8zZbCe831Z7ScqfEFDXL1?=
 =?us-ascii?Q?c178+y2A3Ed6HagShYoMwNgikuvSZQKVeKWmYMk6+3771J+Q9J+pgnHZtq+x?=
 =?us-ascii?Q?CJd1p2vElR9F1nn1E+iXDyDUwq/Zeum98YrGdGfiNNYRBfzt8oCmgG/TPOHR?=
 =?us-ascii?Q?zPYVqJTE5uXqomjZDKW/Or69AY4NqG5IkM93M2xADYtym3kAH3kVRPRNbqkx?=
 =?us-ascii?Q?EXogMTSkNiNrnm+iSjBHTin523tYF8EVu1jTogKfXGRHjdLuPb2dqpp+1myn?=
 =?us-ascii?Q?uXvTlD/pGVHzgWT8ahEb0ddGmgZbBvHQSk0OAdUYRFUXEcZDiEFK/8SJ9lHE?=
 =?us-ascii?Q?YvCqmehb/SQkMvG3+ZhpspLft4YZOzpGpQtSvMv+UfNIlBfFOvxPimbm4qaM?=
 =?us-ascii?Q?k2cgmhIYUJ8A2MHroFUZDlU0MSF+wWJT33VM2e5cIeukpbX0YZl/AiekA2de?=
 =?us-ascii?Q?Ecgkv7dRuPKiLleigQhszFWBMc0DOE3l3XIb73fX2DFe7Gl2ULB3tjus0rM4?=
 =?us-ascii?Q?Ea4UWdZ+MPd7uct7LbTT+643/+0t0UNrkJOwqdDN+6MWSTR2qfYg/yfykmyP?=
 =?us-ascii?Q?GBbCuxArGQCVtBDUm7+Z8jex/JeZAvUH2BQwKhKMy7fSzC77bWPZRmet8KwX?=
 =?us-ascii?Q?VWDEIOAs7oeElH7FQKF2Y9aQM6NLux4YwpluXyOcwo4YrUjeHyc3wYHfGP70?=
 =?us-ascii?Q?uyWcdFuF4miCE4+s5B3rJMHCgLYhx7XaZ0WRY7bkmTQSjkjeiz6+MSg/h8tv?=
 =?us-ascii?Q?ePC/aO5D2UOfn7HNZUfNqEzotBbhXz1EFr3s0VP3dIeCDKf3+UkM6mRLJwaR?=
 =?us-ascii?Q?jy0N8acrwXxsU2mrU14RM1z57o/q/qo/zD8cHesmp2MVckRlZtpAMSreKYgP?=
 =?us-ascii?Q?6BMRToIPgiKx90jMoNbNPW9+G8GFMFzwNvnC23796HcT75tSUWtO75PfYPhU?=
 =?us-ascii?Q?VqiwV9BD0P4vg4hrNYzzfzzSkMAowCy8HUevRepI4yWRd5MR8ipqIe1JnLSF?=
 =?us-ascii?Q?LlRYPJhyybhmXUzc4io/AFtzlPM0XdBvC3/JVZ2Cn8FNBngz447LlFYsAptz?=
 =?us-ascii?Q?6fC0Gh7g2P1KL4Cv4EoxTNvyEY2+G1JveACM2pJSK0RexxXbrBcIhCC+GeLQ?=
 =?us-ascii?Q?ARsRKR4+akX7rEfIkUGyGx1Ox02TVFebfqrY0h7Wt8q1lawWDpGnlknOGCvs?=
 =?us-ascii?Q?TXnCXyBiBfwV+o3ASnbYqSKRTCKXV//UbJuENlqEpCUMCRmwA6FRzVQ/fmlg?=
 =?us-ascii?Q?/9gGLhv6QxZsCD6flH11QQATqq4eI7yx1zMyjQ7hNQGUc0ErzRoVVyEKfhDt?=
 =?us-ascii?Q?ZOxCjlY2k9ILAUPUO50YOswGYTH8HffxJ1lWZOekDaa66UNGPTOCMphm7wYk?=
 =?us-ascii?Q?bVuluNS0f7wfCcAeUJ9qbg/TW93Eawkxlqc345sz4IRGN2wk6USuRmBPWKRE?=
 =?us-ascii?Q?fQiV1IO25ejgp4BA1SZw2xtMfAES+JpVkJpAGQvkN6m8SE6fK68nF84A4fm3?=
 =?us-ascii?Q?AKIbrknNsD/hz6i1Ulk+mT14BNDkOi8l8ebx/qTKkiCjLdsJg6BQDkHhrTGm?=
 =?us-ascii?Q?nG73VoT2DxiVRNFIQ/Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:44:22.4057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf5404b-d3bc-4134-3e65-08de3ea0224f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8231
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

The latest firmware increases the major version number. Update
aie2_check_protocol() to accept and support the new firmware version.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c  | 36 ++++++++-----------------------
 drivers/accel/amdxdna/aie2_pci.h  |  5 ++---
 drivers/accel/amdxdna/npu1_regs.c |  6 +++---
 drivers/accel/amdxdna/npu4_regs.c | 11 +++++-----
 drivers/accel/amdxdna/npu5_regs.c |  2 --
 drivers/accel/amdxdna/npu6_regs.c |  2 --
 6 files changed, 20 insertions(+), 42 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 81a8e4137bfd..181fdbc10dae 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -56,41 +56,23 @@ struct mgmt_mbox_chann_info {
 static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 fw_major, u32 fw_minor)
 {
 	const struct aie2_fw_feature_tbl *feature;
-	struct amdxdna_dev *xdna = ndev->xdna;
-
-	/*
-	 * The driver supported mailbox behavior is defined by
-	 * ndev->priv->protocol_major and protocol_minor.
-	 *
-	 * When protocol_major and fw_major are different, it means driver
-	 * and firmware are incompatible.
-	 */
-	if (ndev->priv->protocol_major != fw_major) {
-		XDNA_ERR(xdna, "Incompatible firmware protocol major %d minor %d",
-			 fw_major, fw_minor);
-		return -EINVAL;
-	}
+	bool found = false;
 
-	/*
-	 * When protocol_minor is greater then fw_minor, that means driver
-	 * relies on operation the installed firmware does not support.
-	 */
-	if (ndev->priv->protocol_minor > fw_minor) {
-		XDNA_ERR(xdna, "Firmware minor version smaller than supported");
-		return -EINVAL;
-	}
-
-	for (feature = ndev->priv->fw_feature_tbl; feature && feature->min_minor;
-	     feature++) {
+	for (feature = ndev->priv->fw_feature_tbl; feature->major; feature++) {
+		if (feature->major != fw_major)
+			continue;
 		if (fw_minor < feature->min_minor)
 			continue;
 		if (feature->max_minor > 0 && fw_minor > feature->max_minor)
 			continue;
 
-		set_bit(feature->feature, &ndev->feature_mask);
+		ndev->feature_mask |= feature->features;
+
+		/* firmware version matches one of the driver support entry */
+		found = true;
 	}
 
-	return 0;
+	return found ? 0 : -EOPNOTSUPP;
 }
 
 static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index e1745f07b268..b20a3661078c 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -237,7 +237,8 @@ enum aie2_fw_feature {
 };
 
 struct aie2_fw_feature_tbl {
-	enum aie2_fw_feature feature;
+	u64 features;
+	u32 major;
 	u32 max_minor;
 	u32 min_minor;
 };
@@ -246,8 +247,6 @@ struct aie2_fw_feature_tbl {
 
 struct amdxdna_dev_priv {
 	const char			*fw_path;
-	u64				protocol_major;
-	u64				protocol_minor;
 	const struct rt_config		*rt_config;
 	const struct dpm_clk_freq	*dpm_clk_tbl;
 	const struct aie2_fw_feature_tbl *fw_feature_tbl;
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index ebc6e2802297..6f36a27b5a02 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -6,6 +6,7 @@
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
 #include <drm/gpu_scheduler.h>
+#include <linux/bits.h>
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
@@ -65,14 +66,13 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
 };
 
 static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
-	{ .feature = AIE2_NPU_COMMAND, .min_minor = 8 },
+	{ .major = 5, .min_minor = 7 },
+	{ .features = BIT_U64(AIE2_NPU_COMMAND), .min_minor = 8 },
 	{ 0 }
 };
 
 static const struct amdxdna_dev_priv npu1_dev_priv = {
 	.fw_path        = "amdnpu/1502_00/npu.sbin",
-	.protocol_major = 0x5,
-	.protocol_minor = 0x7,
 	.rt_config	= npu1_default_rt_cfg,
 	.dpm_clk_tbl	= npu1_dpm_clk_table,
 	.fw_feature_tbl = npu1_fw_feature_table,
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index a62234fd266d..a8d6f76dde5f 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -6,6 +6,7 @@
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
 #include <drm/gpu_scheduler.h>
+#include <linux/bits.h>
 #include <linux/sizes.h>
 
 #include "aie2_pci.h"
@@ -88,16 +89,16 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
 };
 
 const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
-	{ .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
-	{ .feature = AIE2_PREEMPT, .min_minor = 12 },
-	{ .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
+	{ .major = 6, .min_minor = 12 },
+	{ .features = BIT_U64(AIE2_NPU_COMMAND), .major = 6, .min_minor = 15 },
+	{ .features = BIT_U64(AIE2_PREEMPT), .major = 6, .min_minor = 12 },
+	{ .features = BIT_U64(AIE2_TEMPORAL_ONLY), .major = 6, .min_minor = 12 },
+	{ .features = GENMASK_ULL(AIE2_TEMPORAL_ONLY, AIE2_NPU_COMMAND), .major = 7 },
 	{ 0 }
 };
 
 static const struct amdxdna_dev_priv npu4_dev_priv = {
 	.fw_path        = "amdnpu/17f0_10/npu.sbin",
-	.protocol_major = 0x6,
-	.protocol_minor = 12,
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.fw_feature_tbl = npu4_fw_feature_table,
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index 131080652ef0..c0a35cfd886c 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -64,8 +64,6 @@
 
 static const struct amdxdna_dev_priv npu5_dev_priv = {
 	.fw_path        = "amdnpu/17f0_11/npu.sbin",
-	.protocol_major = 0x6,
-	.protocol_minor = 12,
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.fw_feature_tbl = npu4_fw_feature_table,
diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
index 1f71285655b2..1fb07df99186 100644
--- a/drivers/accel/amdxdna/npu6_regs.c
+++ b/drivers/accel/amdxdna/npu6_regs.c
@@ -64,8 +64,6 @@
 
 static const struct amdxdna_dev_priv npu6_dev_priv = {
 	.fw_path        = "amdnpu/17f0_10/npu.sbin",
-	.protocol_major = 0x6,
-	.protocol_minor = 12,
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.fw_feature_tbl = npu4_fw_feature_table,
-- 
2.34.1

