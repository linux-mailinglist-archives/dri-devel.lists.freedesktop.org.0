Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C6A0008D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 22:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E064310E7BB;
	Thu,  2 Jan 2025 21:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DCP7Bfyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C0E10E7B9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 21:23:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQdAbd03PjITLRhgYrFF0nM/Sju+qcn604dmqGSyZ5F2RQct8BmNXuD4to1QAN/KkxEE+CT4SDPdH9FcsnqTfYOeFwKfpygEaLrmA4xGlZfJ7nB2g4agPHLh4jw/4KOQiZB/QNVS/njWYzFPKje+N1KbS8LAJzMZGHdkdWiszbHQqQ3qXH9fXmV80TygIdTpV2yv6lGhfYlbQb8BjN4p8Ce5AVYkZ8LVbdLFCX7u7ZsOmXKpcWhI/G+Ek2F8satAp+ZevCd/D8worMOkQ8XyKkm+0VSaV6HDQqNc1PMFXpBYafdYUzNIvhqlXtUXAX7v/Tg07GWm0s9MvBkaMErxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQ7KFCwr61/HuiVwLq3AjULOM4jTzNo9F0kUTtMsoGE=;
 b=xZIfg7lJcOW08scn6Q7hsxsd/p0WKNbso7DYHiw2wBvOpOZtrwsit8kn0BkLZqHEWblBqC/b5iaEWTcMdmXlo8H6JC17bHxLUbRAzFhFgDMTI4NjdKHG+HDt1EVD+epEjz/zx9hPGLCE1053HASkN0NeRUWB4qdxQ0z1cFH99bp97hqs6HLCGlHkhH8/8/CxZd37OGsMoxVOK3fm/vUqAmeg/26O0JfZDK0WzwYo1UJi7RcMpZP7XpBth1LFa1gEsUPmc0OFEHdT/MRphIBjr4B7xoVXZnMyPVRD6TdEJgzNERwkWZ6vVs1LSisVVpVpivsr7kcQUbOx3rsplDeyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ7KFCwr61/HuiVwLq3AjULOM4jTzNo9F0kUTtMsoGE=;
 b=DCP7BfyfrM7rTC6RmfQDcFLv7jOFDabr1YGtdJp9G3px6E2IWu4H4e2/I/geANMVI1uzDvFonP9BiQVk/N9/wwR1yY5qcxa2Jx+jwZ7BJVR+dg2kie9y8WcPllv4y6Yql+9oNtYoTH8M2UCG9ZvC1H1w4qHkT01TZimzDlTHGtw=
Received: from CH5PR05CA0004.namprd05.prod.outlook.com (2603:10b6:610:1f0::9)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Thu, 2 Jan
 2025 21:22:56 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::62) by CH5PR05CA0004.outlook.office365.com
 (2603:10b6:610:1f0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.5 via Frontend Transport; Thu, 2
 Jan 2025 21:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 21:22:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:55 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:55 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 15:22:54 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH V1 7/7] accel/amdxdna: Declare npu6_dev_priv as static
Date: Thu, 2 Jan 2025 13:22:44 -0800
Message-ID: <20250102212244.1586340-7-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102212244.1586340-1-lizhi.hou@amd.com>
References: <20250102212244.1586340-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 0026a753-f32e-4db5-a6d3-08dd2b73a000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z+nq0ogj/g2rhzptzE61O/FHQc7ZmO5gAotb776Nc/wSQN2QQg7XojB1DAal?=
 =?us-ascii?Q?+U4mEb9YS/iJ9yxFNZ8KGUs+IqaM82238UeVJ6KPHUZQekGkGLBqeG5czvjX?=
 =?us-ascii?Q?9Y1nNBI8l63XZhJUBJPJcYgM75fc2z3svQu67e92IDbEkDyOvSsV5/J+PJji?=
 =?us-ascii?Q?BBY1VNaRFVHbCLmOk4rLRnoDzg+9yJYXsI0ZBpYPZEsKujAbmHRBrK9WhEoC?=
 =?us-ascii?Q?eVCbz7j20hLXTBjRuwmQFjs0B2ag6dwAcFlnOfpO8nWtT1qruhVC6rME0JDR?=
 =?us-ascii?Q?dNxZFy+EYmIrGPUPpWlftBDB86RcJy1SfI6R7sfyOlX+UhHHkEu01yO8QnF7?=
 =?us-ascii?Q?o4U0wVWmhZWGrQ5X8YEon6fGLz6PKpZ6Yjd7QTW7AU8uzQoITlR+1J5SSGGR?=
 =?us-ascii?Q?Xx6bd4X9Gy84NTXhQoYTDgHwJLx4vKIFRnkADD7hnnoxK4tXhQtUVYoKi+Mh?=
 =?us-ascii?Q?N9+vx//sefWJfoSFIzO+IsDRYhcqkr3uz0ThzrAq9Or4uHYGSG/W8qCAipP0?=
 =?us-ascii?Q?VqhXNKL6S3ST8ScOH1enUaBYLXffWW5JV+SGXEdHxz+1i4857XtmokB9D1Ef?=
 =?us-ascii?Q?Gof/PwpafbtR4dvP8eXjJ7NLLhQT0oj6Bc701jvSSyn/YW3pf6LRo/0/OIoO?=
 =?us-ascii?Q?A6Jg7Y4lk4hGZcvyO1EfFiJy3Zbz0RjBBjnqhgCNqNimW+kwd6Lwxh4hK4V1?=
 =?us-ascii?Q?a8YCjGEphPQMASb89TTgRdSIt5W46g6dtT46S4Cci6pMpf/hPgCN9RGtSiDc?=
 =?us-ascii?Q?/UM3lSOBbR8TqmIFrTPYffnJsdRmlk+NtBBFKHqfeQ2Yx0HCJhcjd9XME9Mt?=
 =?us-ascii?Q?U3eUFCfx5M5/0JmdHhp67H/qBnbwMPw2PLO+dGJ1MkyGoWM9F73Z5HhAr/4V?=
 =?us-ascii?Q?mxL/hasKLK6oEbyWNjnk1+kW9sHb4HXdq2WBRc+G1mAd7LXojzY6x+fXPCDb?=
 =?us-ascii?Q?z2HksDu4uyM5eHW6G2IFhPpN2mAv6dVbSzcNBcR+NuUn4FXL2k67EmCCX6Qu?=
 =?us-ascii?Q?WeA7xlsKDaZTIICDLcDBf1yOB2fJBOuyh8wreX6oxqEDkSDc+PLhJBLpq0IW?=
 =?us-ascii?Q?WQbms6v4yiYOAfItnmkMHtXiiSmfq/4wJEhqsmBNbbkl6x62Tsu2w+DAgOQx?=
 =?us-ascii?Q?URfRso/hAsdTOZwk3tDNlRk5MwsaQmVKAWPdNKHdEYYUxlT7VJCMHFNMbaX9?=
 =?us-ascii?Q?iJ4/6EQlm5vrEFCq/WHK/HEWvvYmt9BkyacJwNFVw3drGXIJbrW8ysOFFv/T?=
 =?us-ascii?Q?fkfXiGBmIEWOXWOETSePsIWn9wfHL6TcMzZsL9dWCqZmwYTYR5DZ1LY0vfzH?=
 =?us-ascii?Q?at9/JmF98BIfl0xg2n9tfyKdq0hSMvXuJHpdOkKo4u5UIHlY4T/8+k48cbJY?=
 =?us-ascii?Q?m/z5y6jMs7nUrbicMK4YaXGS8sPlcTLRtWjLC3ygc7HjEWaZ7fnLHw2Df9QV?=
 =?us-ascii?Q?jQK7HV23uxu97l8jG3w0jzpY453KU0rhjtoMisvVylal/Xx5EPj2AiwbEvgu?=
 =?us-ascii?Q?+3gVbubCx6Ka6JY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:22:56.1327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0026a753-f32e-4db5-a6d3-08dd2b73a000
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
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

Fix sparse warning:
  symbol 'npu6_dev_priv' was not declared. Should it be static?

Fixes: 273b5176ac17 ("accel/amdxdna: Add RyzenAI-npu6 support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412311819.9mz11Uak-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/npu6_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
index f46c760cefc7..94a7005685a7 100644
--- a/drivers/accel/amdxdna/npu6_regs.c
+++ b/drivers/accel/amdxdna/npu6_regs.c
@@ -61,7 +61,7 @@
 #define NPU6_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
 #define NPU6_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
 
-const struct amdxdna_dev_priv npu6_dev_priv = {
+static const struct amdxdna_dev_priv npu6_dev_priv = {
 	.fw_path        = "amdnpu/17f0_10/npu.sbin",
 	.protocol_major = 0x6,
 	.protocol_minor = 12,
-- 
2.34.1

