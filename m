Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FCDB36F4D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 18:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C0B10E108;
	Tue, 26 Aug 2025 16:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x5mCD9Ol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47CC10E108
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrcPeuCkzTwL25XDiI5SFWIanHgd4xYkbwb8FKdBIkB3dt1XcA52Ro9zipQqEBnos3PVcUizVLz77LkuSdC689TxF+2uiyZTQyzQDam1S5AsZymPhlqxJhAa5zP6ZjvwycmuQqexXOvq+UVSmVshQlmKnecHoEOARhLlNEy+c7lV5jGMcrGpFL0CAEpRIloTXkQi22NoRpYt8bCgf0j0kZ9Bx7y3F9fEqyECDkY1XSS2iQXxamMCkaLRQMCBvHvXq68TA4Jg9WR8OKweg0tPDNDU9tsvMr0LYHLjhtarHfFGHP5TCfbwRKdTQOVbFujtDx4miJApog5TWTpuHvKhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+emYlXKq5gATdlOGChsxoRNdWCXUJ4kyR/RlMAyXxLE=;
 b=vyaP/nNAQUJ4N9WO6JDyewF9rBtxBSYK8ZQPn8FJrEdF/vxxyApcxZZRgNOACNNcazF3n8BDMcDs77Q+JmswVDI3I8LLAFIiK6QHthOAVGpVR60pF4bIgbl/tXItmjmxhH78zHiU5WOTN54O/bkgkyB86ln2XUKA2Mfb1gJWs7R6RVNQgP51JZzqkUU9uV3HlM93GpYnDrHf+ESOipAwcwf08lDAMoMQUdS/V5RqEvnoeZHqyDXfepcItxrdPk6sO2MmNuGN8YnWJR6mpQsu9XOmux0URBryjiKpx6GzfkJqHMLxFy3IgHgnZDtGNMBar1sNbaHstNMea2qPO3CguQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+emYlXKq5gATdlOGChsxoRNdWCXUJ4kyR/RlMAyXxLE=;
 b=x5mCD9OlCpiQCDdM4SLxoe40fhmc8ArvC/bHa3rkQp9vHlwyprUDsqtuejGtCxN5gXcWngD3Mc1J0nSvhlhzFztL8CTBS6kOPe/dX0L+SOJEQtW63pvm8E/K9NxKMdzuz/hqdrRJ6qpDlruBhjkcbtyDQPv7bqU0NVmr+OeBcxw=
Received: from BLAPR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:36e::6)
 by SN7PR12MB7107.namprd12.prod.outlook.com (2603:10b6:806:2a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Tue, 26 Aug
 2025 16:03:24 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::7b) by BLAPR05CA0001.outlook.office365.com
 (2603:10b6:208:36e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.14 via Frontend Transport; Tue,
 26 Aug 2025 16:03:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 16:03:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 11:03:24 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 11:03:23 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] accel/amdxdna: Fix incorrect type used for a local variable
Date: Tue, 26 Aug 2025 09:03:21 -0700
Message-ID: <20250826160321.795866-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SN7PR12MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: e5390010-d8b2-4c34-86a6-08dde4ba163c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M1J78MB1FHbMii+KdtVc3o+z8U+y6PtzrqQycKR18Z62z9Uzsb5y1KY1uzr4?=
 =?us-ascii?Q?qJkzgt7a9282CYL4JUHHEYLSh1Ptx0htCbCYJZcyK6NzNm/fj1TtYnEDBSjp?=
 =?us-ascii?Q?d3n1CUa2u/gQJNldV9jYggyulTiscZHtZH0NVvuwLRrYx52gTazThE+5Vylu?=
 =?us-ascii?Q?LIbAQj+Vtkp27gEYp+07AcTOx1wJC26uRyAR4bFw7rIV9L7xoQi9aFSr7dEK?=
 =?us-ascii?Q?oit0wz7XqZh+skbylvQDVBOxR+4JFc6NrrA2BLcyC0GIK8mABeWJtLd6/NCh?=
 =?us-ascii?Q?UW5kgm7/ymtfDR7JXjClHnX4y1R7LOCJvH8EoP/jb/6IaWEnz3fg//3cawBJ?=
 =?us-ascii?Q?TqGhW26dbwEs6CteZ6NfX6UqOoTrj13Jhlnwrvdb2ZQO6wbBkSOxtNP6mUZ5?=
 =?us-ascii?Q?uV7OErfml8q4jr2M6kBSyImzRfqZGd2az6/rsDX5NdoHiApM5NrkX7VRzP/G?=
 =?us-ascii?Q?jvnJiNTv5xfgxSDXGh+jbYbZtAMyql6fuqpv24T1fNZhRE5mJ2KZtl2fjTlr?=
 =?us-ascii?Q?NLFnjDD816ThDVNNe4KGYbLe3noXKgtYtBGFWkS2H73ZWvyMF9Fa6XjRepby?=
 =?us-ascii?Q?C1+rvHoH/iO6msurZQB32UkXugMM3wNGPapvY7/Hpqc25Kztnk/DwaX/5iID?=
 =?us-ascii?Q?KmfrwICTRXr57z47qZ2QA3QTJLVzlENxoEMiEUU8RokMy85dvIPZwonyAltC?=
 =?us-ascii?Q?QOgIxNNoE72+pN2bv7+hFoCDbA7WDGFo+ntfAC9sRKIj9JOMhy2XijXPQPAT?=
 =?us-ascii?Q?FGOalHz2cuHtmVRd4rBgWNpzb5qxZx8SfG8Gl+HXRCuzceCwr9rh3c5jK0/7?=
 =?us-ascii?Q?kt4qmoCMCRZEn36BppJ5QLhZJG3zckTYD+qVuKgsMrst22OMVWXBVn/FnfFS?=
 =?us-ascii?Q?BVEEB5dGotz47UXlVMR2utkB5x0lmC053+XuADN3A4Alj5jnjSEJ77Emq014?=
 =?us-ascii?Q?Dz5EOg63/AeceCKLkFGXKadmWWqrz0IcyGobsLVGtuSSWfevyFScdOMnbCQu?=
 =?us-ascii?Q?GYOEXOKQg/0a8jLMkHXyaO3j/dy/gyTnJSyoWrK7XrzLp2QJ9cZGwxeA76Vj?=
 =?us-ascii?Q?vvhaxWCPuZdHpfvkzfj97kER3qeMwY7cOVtAM1X+3BMeaPBUzBr1P9BHt6z0?=
 =?us-ascii?Q?TDWTEOIsw6wjQ6Ocb4O6ISUFcPhhul0yfRx0gn2rWc+2/+HqAvDpiY3IbSW4?=
 =?us-ascii?Q?bWjFCkQVBoUxBE1AOgiZ4LXC0BDOopU1/07YtTR0HQSsJqhWr8iakgOHAr3F?=
 =?us-ascii?Q?VDLjQya58AwAnLOOzedBrWiOI0ehQEKxmLYmWwf7Ok8Ii37t1dAr0ECTqlVI?=
 =?us-ascii?Q?/Gk/ZReh9Bnr/i/b0wgtflft9BiEEIvPFyaN9C02LNwtJX+GIrmYT1v9CV5V?=
 =?us-ascii?Q?QdjorIBrJnjzXT1RR8dBqAglB1cYxJwbmnL+R/MHfoEf7EAI+rZePgmSKY3E?=
 =?us-ascii?Q?/1jbuxWi5bPuIFut8x+yjWm39LbyvjmQZHaZY2ntZUaRMbWHpZjNUbL1TfaU?=
 =?us-ascii?Q?b+gQOISDSTNnq6UIydCZAGo5QZUVyDJfnL7g?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:03:24.4111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5390010-d8b2-4c34-86a6-08dde4ba163c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7107
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

drivers/accel/amdxdna/aie2_pci.c:794:13: sparse: sparse: incorrect type in assignment (different address spaces)

Fixes: c8cea4371e5e ("accel/amdxdna: Add a function to walk hardware contexts")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508230855.0b9efFl6-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 16ac0cab4f44..2885a3c17e89 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -785,7 +785,7 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 
 static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 {
-	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
+	struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL, __user *buf;
 	struct amdxdna_drm_get_info *get_info_args = arg;
 
 	if (get_info_args->buffer_size < sizeof(*tmp))
-- 
2.34.1

