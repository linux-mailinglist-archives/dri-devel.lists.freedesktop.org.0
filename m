Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA716CB9898
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 19:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3355810E924;
	Fri, 12 Dec 2025 18:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u2D9KClp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010071.outbound.protection.outlook.com
 [40.93.198.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F4010E924
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 18:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OV2mlTv91vBy4XcOXooSyemmRn37Jn2cM5wYNnl5Ogl/5NqEmuC0efMfv4liC8awOdfrKIcFc42YrG7dt3sryLndmD0jGrXsddeyQxQ9p3jXOYowFKnQhnnyEIXsXmdMz9/ztvMfBGy/4XVyxTaq7U8NbSwJFvVy9mQ4Oyq5iuYIARQOS77Pkr49rs7xxG2eGTUXduzAhL/KGuV3mA8huQLhWU6R8xJNDR/1rCUp0cvL4Tk6XeaGQUS3v/zUeB4e8CnF1BxEMmUWot+E51b9hKs3IjDnzgHcSdpV63IyRdWuwFHPjza5m2fMQ2LnCZlKROreWpdz3M33ELQniTSRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j00sdrh4sE5HHfvjFj5+TH3bUIOBiCiInhEIZZqt1vQ=;
 b=vNs4nE4ocLkv7ByivGRycRRlQBCJvUogRSMtc8msihtC1/CpCvCn20bfkiL4KtFcAxUV+Pc1KNN4MVOCj/9qgcl47VT3K7aAcW2vwMvV3LnrXrRNZfWnK6ZQk122ABcpSaZZCQD0khdDgLYpn4CRoJIvNA+CYYr7kgrp3QQNG9s4YlEP1IIKhdofPaaYJDkBgrNnlXBFqeY0GDwVZDPBaZ0y/k9Zx9lrwlr2SJG2KCr5z1RyVLLfijO1gmlmhICBo7Aznx3dRG7tXMWpAxJnI9UGukGM8ngidOeQ1xCoJ0nHS5kNnlXtEj5cekmZDm2SGRPBH+CfufCRFDXnoKjhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j00sdrh4sE5HHfvjFj5+TH3bUIOBiCiInhEIZZqt1vQ=;
 b=u2D9KClpB3LsqGazkx5iNUdUezkF3AQM6ODxxuswDr4yxisMD/O/jPLXAygsr/oCRpbxDH2nMV5shtRRjNZdSCfS6k9sBku4e9c3YkyBjcde9z0+VInPzoBwxJ9BdQaSbskEjW7MqSV7JEJwpdbFWW3ukUgTrPKdQyfHyfMejrU=
Received: from SN7P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::16)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 18:18:55 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:123:cafe::a8) by SN7P220CA0011.outlook.office365.com
 (2603:10b6:806:123::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 18:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 18:18:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 12:18:53 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 10:18:52 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <dri-devel@lists.freedesktop.org>, <platform-driver-x86@vger.kernel.org>,
 <Shyam-sundar.S-k@amd.com>, <VinitKumar.Shukla@amd.com>
Subject: [PATCH V2 0/2] Get real time power input via AMD PMF
Date: Fri, 12 Dec 2025 10:18:01 -0800
Message-ID: <20251212181803.1825142-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|DM6PR12MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: a25fc289-415c-4010-60c5-08de39aae894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xUMryNPOkkvDpG/I8TtKcVNqCOkA92LZHI9pwp7z1iRKVRNnTB0YsOdB5Jj9?=
 =?us-ascii?Q?8kAd7VOh9M/O32upuj0sMyKajJBFSbAjoY0aqlKWtxM9DvtcXcEwypHejfau?=
 =?us-ascii?Q?zvmwPRWof0fDiPKsLE6u2MMp9M6MrEIoYZcTyfusMbAjQo1g5gmTS2SMk3Sb?=
 =?us-ascii?Q?MOrjHOQ5M8NThmR4VoecPgHd0IeBvfVukuU7AEirDxUkRjr7qGaxACnJ0AHG?=
 =?us-ascii?Q?YTNRy8zuzCEyva3r2dWGE2zrLp/sy67b3d/BLSTZGUzMu2rsU9Wm1HyhNmT8?=
 =?us-ascii?Q?kBThYM07d+j1+1go+TSUmh2I/C7mqCkTnv4a3Y/EzuQFfz0SKsTlCW7tj7n5?=
 =?us-ascii?Q?u9JILstUUq9ej/8xg51gpP+MtWDGl5o1nbYmF9GeLRw9fLXI5LqsN56dPy+R?=
 =?us-ascii?Q?cYepeXv3DyTdmtY8BXnMPRCqSq1LR2f9hw+/KeRJ2SRi4n+7FefAFkH0RjZ4?=
 =?us-ascii?Q?ZhIklvuA4Wqa8wYe71fou9YHIp8WPsmsCk0Hui+Zkv+Vh1BngL1tJjpUdn1L?=
 =?us-ascii?Q?U4eDUeiTHZFcR8rBpym/ZBdmQoFDIp3S3UNsjdjeniUV3hpE7U76yHq4v7qG?=
 =?us-ascii?Q?aMlh0I37ev30P/qiPCXo4Bz4tsZ6WDIqvFPnxNL1CqLJPvtRqb1SDJwMQkTd?=
 =?us-ascii?Q?UV+CBXiVxb0RsUr1GE2XqFsqluz+6R8udihLw3A9jJaPraCZ/cLvkj4ywJ64?=
 =?us-ascii?Q?WyCv+Qjk9u7EkF7NeDQTURAwBH66HudVpFPDsIds97R+9Im+ur9ha+NeqVKx?=
 =?us-ascii?Q?79m6P4uRU7suhoBxdixKyGFly8CIBva31d+0vqWGJUaZ+NDuc27WOsTceYk2?=
 =?us-ascii?Q?nkAzrYsMZXEkn8czBBI8jRAvlix+bkivCxOxGz/twC6j/797ecmLxNRrt3sz?=
 =?us-ascii?Q?NCbPOicXj87fdMuyxmTgpcB/3bMA4wZ1cpxOw7q//hRUFXSqwlgNX4Ho4STI?=
 =?us-ascii?Q?qJtUb0ubejuygGYr53L8+eZoa2066NBEJGo6ZV22Xk+/7E1B2fcsVTS2Anbs?=
 =?us-ascii?Q?dw7cyhFeXvjvBnR29qQlObMVkZsb7OkHwBAU5EiR6JO50SKJptpCgSrZj66S?=
 =?us-ascii?Q?O8pD5BMchptmCXSzTJxRw4X5ChJVQijqZtj+L6VKhP94YRiLSHJzB5HB4llc?=
 =?us-ascii?Q?qm2Mr++rv0MH+Eh9cXFS5zoeaKqPRbbzhIWFRsO4u8oFvU0Z+oKwYa46CGm7?=
 =?us-ascii?Q?tlLAFbx9QUqv7sweEr0XJGMFBNSfuxWBwoYk6/GkzqeVmX/qHZsWuB3UZhSg?=
 =?us-ascii?Q?CI11B34vXNveDkv09id17FaHHP2gKOeEW5xoJ3e3UPbt/dtHMSoDOFsK4oJ/?=
 =?us-ascii?Q?KJcOJ5JHNjtWRo/TjghCeXyRD5KaOVGy2+CiQsLxRh+mKp+ipRZdsLfhGDmG?=
 =?us-ascii?Q?evu6Zw/7ah772l3GeSSTECPa1rnYr/gEjvpsGhHhEqYo0abJTD0xmdhg066P?=
 =?us-ascii?Q?W6P+KgfjnUElodnLzzMtGmD96wZCr1eT9Yw3SxC16t8FPkXyKP8kS/IgPpHk?=
 =?us-ascii?Q?Pvw7kAY79ju3BfiV62YNH6oA11fteggGV0CVwAJSXPnmWXyLul64cVv9rVc4?=
 =?us-ascii?Q?SGbZdAJvuxPE6GafFfprIZCwSWGCsR4Gcbi3JQOa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 18:18:54.1724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a25fc289-415c-4010-60c5-08de39aae894
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
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

Adding new NPU metrics API to AMD PMF driver is pending because of
lacking real case.
  https://lore.kernel.org/all/d344b850-f68d-f9a5-f0dc-55af4b48b714@linux.intel.com/

Create xdna driver patch to fetch real time power input via PMF API.
Here is an example output with xrt-smi(1) tool.

# xrt-smi examine -r all | grep Power
  Power Mode             : Default
Estimated Power          : 0.563 Watts

V2:
    Including header file for struct mutex will be added by
        https://patchwork.kernel.org/project/platform-driver-x86/patch/20251202042219.245173-1-Shyam-sundar.S-k@amd.com/
    Add include for U32_MAX
    Replace snprintf by scnprintf
    Fix coding style

Lizhi Hou (1):
  accel/amdxdna: Add IOCTL to retrieve realtime NPU power estimate

Shyam Sundar S K (1):
  platform/x86/amd/pmf: Introduce new interface to export NPU metrics

 drivers/accel/amdxdna/aie2_pci.c        | 29 ++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 20 +++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
 drivers/platform/x86/amd/pmf/core.c     | 75 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h      |  2 +
 include/linux/amd-pmf-io.h              | 21 +++++++
 6 files changed, 149 insertions(+), 1 deletion(-)

-- 
2.34.1

