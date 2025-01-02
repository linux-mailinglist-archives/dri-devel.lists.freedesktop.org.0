Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF939A00087
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 22:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A78410E11E;
	Thu,  2 Jan 2025 21:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0aDgeIqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D51410E11E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 21:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUpSndJ1b8lOYVcEZ1QCKi4gKQhqfiGAMXeIn7ovEAMylquzhUjQaSDnra8BlB9f9aCBcoWJWiXhNkAoLrh/CPBTMfEk8GUMnt6+K1cdvI2woEzQNAkhl1IlcN6rKZUgff3RugmGTnm78PWOtPNzBcPw3JjM4LGYBLOiB9BUV46vBQMQF2/8fuNhHXnaqx/uopJWccaM64+8EKH0FrmAXmqrEh2P/9E2iyI3Pw/N64/5skrNaiBZJMU7cXngwpB1ypbRNpu0VBQ/c0roLtv8WVThDUXLgubzCFWI0Tub/mBy2SDgvAU0e8AZzghDj88SHrOzKlTgkm3tjVBkx0eHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y61Q+m3dkiYoPcf+w1VOyHK4ueH7qAXIHFMVeZY/fYQ=;
 b=p79MaOsYsvj777xfVHWr5fnyncPa9dKhTvXV2uw61J3q+YkqUil9D+HrczPSbQFRCPC3ebORIljaz6RREa8GmhsfuM2rqhaQafUtc5zNLtFxg9xqcsg/b2SqEaphvySJBpcEaqmBfqhemAvVcjNR/4UNIrreNZt00hiCvmPYQD+KP9r++0JJLIk9pQlUX5m89v9putlSWkpiG2ixp9otArU/vsjUtM07ZwMjlIhHCo4Zyat7Goy74wYD79u8oNPZtYE8FIql0Xm/JWjF0z5HteKq1TtbLzVYXkiN+cHLXwnuEPVsRzqAu7yTMhaWNiWyo4mKGf/Z5tKsh8xJlGlWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y61Q+m3dkiYoPcf+w1VOyHK4ueH7qAXIHFMVeZY/fYQ=;
 b=0aDgeIqZ6NspWAUyRUNkOmDIxR2622ZWeRY3WJrbfphrgHY8xlzzd3ybx5has0XoG9AkXpqxbiHTk6ZM8GRtsHy8W/GeMpAJhSbFzNI8SEYraMy+u4G+eItlSTlhpJ08Iyn7XsLYtSIK05pMWJYzS0ESWZ2ogNUd8bEpyMjhJO4=
Received: from CH2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:610:20::26)
 by SJ2PR12MB7867.namprd12.prod.outlook.com (2603:10b6:a03:4cd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Thu, 2 Jan
 2025 21:22:50 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::a9) by CH2PR07CA0013.outlook.office365.com
 (2603:10b6:610:20::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.12 via Frontend Transport; Thu,
 2 Jan 2025 21:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 21:22:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:49 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:49 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 15:22:48 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH V1 1/7] accel/amdxdna: Declare npu device profile as static
 variables
Date: Thu, 2 Jan 2025 13:22:38 -0800
Message-ID: <20250102212244.1586340-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|SJ2PR12MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: a34203cb-c850-47fb-4f2c-08dd2b739c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?74Ab4S/RZEErz3DWYCZV8Ytky1U2t8EOLnBwjLBPiOP0t1QWTFLy6VgZ7RtI?=
 =?us-ascii?Q?KP/QGETQvBP7FS4y8o59hX/wxTQTK+PuRw013bYQAn/qCGkyOHhwI6xhXC7p?=
 =?us-ascii?Q?hefaqXJqm1vQusiwitoYHHu+4plCWX9eeSo3fNDYD1mu7RHgo3Xn1vYTM/aZ?=
 =?us-ascii?Q?7xy5rSr04j2M+W0It1Medvec/LGCulCr67r9voanhzj2EsTqwIkrkRO9hO45?=
 =?us-ascii?Q?Ej+XTDuepAdQpC8YSR1uQ+sV0l2hnTpYUCMlOfNaAkY6SG83aQ560sFZtvbH?=
 =?us-ascii?Q?yOzk4ERSAR/MYfj0jSbn5gpUXdk/XU4RYu3LOCmUqL3Gy7RKEpNboC1IGNLT?=
 =?us-ascii?Q?MBIUCVORoDAfTEWqJw9FvKk5iTVzeuR625MJdNAe0ahNElqlclKz6Z7PJYlX?=
 =?us-ascii?Q?xZ8J8LP9kAv3dwD5TKsD2DBTLW+PGryLkXTZwU4VewScfHKXykav1KNzklEd?=
 =?us-ascii?Q?NNpiYppQwNYyXelU5xazoT+WMnuNjWR5Ho6yqjFMygHWDrLG2E9iEpYy2udr?=
 =?us-ascii?Q?uIx+l6RnfJ6x0Zu6Vk2+soe/rFrS91JyBhCXzzaXctFHSCm/u7ELy9O500++?=
 =?us-ascii?Q?9R8GN9lFY3FD/z/NlOfNlnH8j/LB8PTo42uaHk1qcmqEuzZ1cGBHbMxxl8sf?=
 =?us-ascii?Q?mhJr7Tv7Oux8NZEVKDdZyWz9YbAflVCfj9PIMtrFnS37QvZzk80j1phHYgkz?=
 =?us-ascii?Q?6gIgJOp8MiTDNNENO6kCO6UNyHhEcwWEZnPhGIk2UuIrZkse2gnJ5AitGH96?=
 =?us-ascii?Q?1fC9qWUfnFF6FBmhnDLXZbqaiPrj4D1c6eCcgtXr68Kamq3DVXw7ZIw8UgAe?=
 =?us-ascii?Q?QqTYRjyTiKI2Vp61+hoozBZ6a8j/Gtk73GBaiwiOVa5apLBvTE6aS3CuKrl2?=
 =?us-ascii?Q?fr3H/REuSQwF9m0eM5pC8lwHR5Vfp4CP+zfCrdga2ltao5qe4xtJ35vvFut+?=
 =?us-ascii?Q?mMo5GDWrXyGzhRyOib8QJ2fW1MXWjrUOI230tPZ6wrAn1c4xBtcTO6cD4cL3?=
 =?us-ascii?Q?u/La7MCKV3CAM31+4uFLYGl21WPVOfslVZoe1xc18qr4HchD66rVKK88+h6E?=
 =?us-ascii?Q?PxnONKQbRTbffnsFaG7R4a3DFhCtceJEjUwkJ3p5sCZZjVTbMHmWsSdE/g/R?=
 =?us-ascii?Q?52dKCIEzFj36J5qwmpD4ajzRfosEJB5PWQDrHpE/0kQaQxkN8ZaH6ferkyGE?=
 =?us-ascii?Q?kaZgZs9CgDK49XBHlcn/HX1FBxcENUr8WWt0E2PTLIcjgvQxdBCfdmRh4Hrn?=
 =?us-ascii?Q?e7NEBy7VvdtYWEdSYRH/uDkIoIsLR9tEWRU+eccjO/r6TNXHAW4kO26SKEB3?=
 =?us-ascii?Q?xwfhNTVbSYLmtT5edp1fZS0drbhhFQouaej51/lNVkEIWX9haa/H8K6XC7gp?=
 =?us-ascii?Q?/EpDcGFJUk79iLIc3YUPPWP+0fpwVvH78S1OvSrPcQzPDtONCMpEKrZaNjra?=
 =?us-ascii?Q?RcsFDMkM8YC2ghjto7ig+h3sms6PmnEmj8te8WsYKx2nm1WTVN6pKuuyIdI+?=
 =?us-ascii?Q?Tr1emZriLga8Y+w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:22:50.3543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a34203cb-c850-47fb-4f2c-08dd2b739c91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867
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

Declare the variables as static to fix the sparse warnings:
symbol 'npu5_dev_priv' was not declared. Should it be static?
symbol 'npu1_dev_priv' was not declared. Should it be static?
symbol 'npu4_dev_priv' was not declared. Should it be static?
symbol 'npu2_dev_priv' was not declared. Should it be static?

Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412310648.dtMHgGem-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/npu1_regs.c | 2 +-
 drivers/accel/amdxdna/npu2_regs.c | 2 +-
 drivers/accel/amdxdna/npu4_regs.c | 2 +-
 drivers/accel/amdxdna/npu5_regs.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index e408af57e378..e4f6dac7d00f 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -62,7 +62,7 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
 	{ 0 }
 };
 
-const struct amdxdna_dev_priv npu1_dev_priv = {
+static const struct amdxdna_dev_priv npu1_dev_priv = {
 	.fw_path        = "amdnpu/1502_00/npu.sbin",
 	.protocol_major = 0x5,
 	.protocol_minor = 0x7,
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
index 286bd0d475e2..a081cac75ee0 100644
--- a/drivers/accel/amdxdna/npu2_regs.c
+++ b/drivers/accel/amdxdna/npu2_regs.c
@@ -61,7 +61,7 @@
 #define NPU2_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
 #define NPU2_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
 
-const struct amdxdna_dev_priv npu2_dev_priv = {
+static const struct amdxdna_dev_priv npu2_dev_priv = {
 	.fw_path        = "amdnpu/17f0_00/npu.sbin",
 	.protocol_major = 0x6,
 	.protocol_minor = 0x6,
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index 00c52833ce89..9f2e33182ec6 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -82,7 +82,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
 	{ 0 }
 };
 
-const struct amdxdna_dev_priv npu4_dev_priv = {
+static const struct amdxdna_dev_priv npu4_dev_priv = {
 	.fw_path        = "amdnpu/17f0_10/npu.sbin",
 	.protocol_major = 0x6,
 	.protocol_minor = 12,
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index 118849272f27..5f1cf83461c4 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -61,7 +61,7 @@
 #define NPU5_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
 #define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
 
-const struct amdxdna_dev_priv npu5_dev_priv = {
+static const struct amdxdna_dev_priv npu5_dev_priv = {
 	.fw_path        = "amdnpu/17f0_11/npu.sbin",
 	.protocol_major = 0x6,
 	.protocol_minor = 12,
-- 
2.34.1

