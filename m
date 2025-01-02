Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66034A000CF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 22:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A5510E338;
	Thu,  2 Jan 2025 21:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c3XYyiQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A2D10E338
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 21:38:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MH9rdpUQuTWvUH54MjQoIpcJQXpg8Obxhyc0bflwSbtYkeQ751SJ9Hpj71Q26ER8l5obslLwO7BWc7cvPpEo9BJxf07oehEhZDtrpHB1WCZVh8KD39L5bLVCoO+aQEoio4lVgSEGXccSbUjGGAyHID9AvhJq9Uak+TQ6ADO1MakRspgHfiTpUaAHMRKZtoC1zTegfUWPA5vlEPkG5xLFXt1NW465mFprWTqj/ztRH7wofR9it/UpK0rIFcX30Bj0NmmnoHp7LgLgtHTgeg1GxMug/LvOHsQd1b2S7vAjAIjbrmFmTBZe4vG/Jw0/91MX3PRrT0DoKsg7HFWBb34nwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVwSra8Folg7K8c3ULXt/OUwtXeNqEW8FEHXTLjUSus=;
 b=UAqJzVjxdWy0LXV0sOYhmdoVSvGgCEs/kC2PO3wafVQccZacREZf+o+rOh3C3ZRMF4EkMPZbJjKVFN8Z5K4r2O5WgnvQRkBRT6udgp7AFpXPAyaYF2GeyoOEsFq/9PQOVzV64XwUzAL4HQCkzrSMHta/sT9wkL8gYrF9fpnZPeUgJtCOnsVKFSDUfhIyLMnhs5RlUjWUxv4J+ojUunp4/c+IIJBUwb7RYIfWNljWLnNvXX1YOnOimiu8htU1gSmwBI7cAWhE2qzQglVYrmIjNmadNwchNn3/XM7sXz6ZxhmDLGSpIunxjcRlHpvu+MR3bWQ4NJKD91WktkABeDilCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVwSra8Folg7K8c3ULXt/OUwtXeNqEW8FEHXTLjUSus=;
 b=c3XYyiQXnv5VrNoags+oG4HhDiJkIIHR9uFEzR7hk0PvrUbCYIA+Ciio8uRYnacV431cHRmh7dVm4klBay+n0K/9m2EJ0XHNBXcl2yysrw1RC2jS5y00ulm/39Du8eGg/nFyehJfhFRyVvLNk8UIbTDNAP1XMa6Fj0TJ8nIi6wk=
Received: from SJ0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:a03:3a1::7)
 by SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 21:22:55 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::31) by SJ0PR03CA0362.outlook.office365.com
 (2603:10b6:a03:3a1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.12 via Frontend Transport; Thu,
 2 Jan 2025 21:22:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 21:22:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:54 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 15:22:53 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH V1 6/7] accel/amdxdna: Add __user to second parameter of
 aie2_query_status
Date: Thu, 2 Jan 2025 13:22:43 -0800
Message-ID: <20250102212244.1586340-6-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102212244.1586340-1-lizhi.hou@amd.com>
References: <20250102212244.1586340-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 201ff421-4f4a-4b7a-6a7d-08dd2b739fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?51Z69HkQByUByHV6YbQqfULCzdE5LLwdqQqTSu3qdF6TlOvCJlsVnqiB/5yr?=
 =?us-ascii?Q?bucpyrfKQBQeWlwVw5d9qkX/8Qv5hOP4OJHZVOooflerXpzllVbGnXUbIBOL?=
 =?us-ascii?Q?IvwX4F2ablPWkVQW1sC2K+HRegUVO7YdFMVCz0T4nOCekc1cdg+XgKMvFs//?=
 =?us-ascii?Q?wy1tcA9CSI4hpR2qGwDMNCpxWH192D/ukNZqWIsuEgm22nWPrQP+Rs628scm?=
 =?us-ascii?Q?oGc72tqnly9Ue7vsnYvvvZjXrQROa7j25SIKEOxIVhcZelke/t7z8Yl7fIwh?=
 =?us-ascii?Q?E14jPIUb1UwlPnCO1mBlTRWCuCa79RzgkTdzOavwz4h7peg37aA248ima2I4?=
 =?us-ascii?Q?SQ/bRx8fMNecZDi/XB2K8MQVdqW7zqckvRkS+mKfz7AiRSytbabifAMuHY6D?=
 =?us-ascii?Q?cDzMwV0etj9tqfrWaVbMx4Qd5H2tZtr8hB2an+U+P4iVwZbiMNCJoKfzxKBt?=
 =?us-ascii?Q?LpcVwvO9mrQtdnJJgu8YUxD5O+ZjAobHNLclGngjAcgBRPyYyKr1q1eyM7V9?=
 =?us-ascii?Q?JxFCq61TqNH8/DYYIsGS4Le1ZQRdc4yuiexOuzPw0VJ1WnCZ2TdU5ngV0/6D?=
 =?us-ascii?Q?iw0/Wi2QIX70M73UcVGzqutaet7AHxnFtqUqvK1Ril2R9YEVaDyjHEiYdTlP?=
 =?us-ascii?Q?MDGcMxJMu/118ShyGDm5D622fDXqhIjQzUHEwd9KV5m2XekwT1JXdv15VlIy?=
 =?us-ascii?Q?ebcgDWra6ckxENVe0k7Jm8yGw5EeHpyx7kLoFKJtDlKL+bvULCzyFALR8DRm?=
 =?us-ascii?Q?jT9wvg69JK+v2PTZJgp+f1aRQS2XVKPBYr687XUzNPe53lHLIwR8v3WzEf8H?=
 =?us-ascii?Q?ol1aDwMnOnzpCYjHGT4wBjeDMD+3jmuwdnkrgcTv1jW8Y1qajaUDYoesfF8E?=
 =?us-ascii?Q?YisQX7/Y6cNQnm/FtwlTuSrdYlWGkV4M52mT9cKMjp5Wte5FkTo1rthCl+wY?=
 =?us-ascii?Q?fO7Imq9KHzz0ETfcjM2A/zJP58tLQCSP/KNXlrq5Z7SNcRePNjpZ3pEMmbFJ?=
 =?us-ascii?Q?9wSOTEnsci9BGVqhf6BTcQrnsM97jQA4FVcg7wEVuoYCW2LALHCo767DVreX?=
 =?us-ascii?Q?aQrX2OaJfGOXMm3fYC4bU0nkx4tc21CnnDSX/FPsvKfMqrVEpaK/6hpUHots?=
 =?us-ascii?Q?i0y/JStMVYZNjOJIUI6MHQijhAjmH6yZL8cs4d/f++fvgVURwh/rEImsWBeZ?=
 =?us-ascii?Q?X5n6djOVIeL1OxYqct0OpGal+3xF+YiR6g4ikOJLzYSN/WbV9m8UKuds/a1G?=
 =?us-ascii?Q?lOv91Rfxt4F9w4rxmqn2vkrJd4ydrOw5c/JM20fOSbV7hlNAPh9r7bsj1Q4n?=
 =?us-ascii?Q?AMsfUwuRHE1TKMVay1gSnF7+ssAr/MJSBdmrtAjXbBDZEF0rgWY8twlfKdt8?=
 =?us-ascii?Q?XYig5n8lyL92PpksjScyeK/syHhxvz1ftPRIfcY/P3XEjVxnSuwUisTchBe2?=
 =?us-ascii?Q?KBpsBf63uplTvvaxYoPCm8JsgXvG99eYhjGGXwoHvPHcJ/4R2+5rJ1EA+Fpu?=
 =?us-ascii?Q?2/3YJ3iZWk/toUs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:22:55.4804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 201ff421-4f4a-4b7a-6a7d-08dd2b739fab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787
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

The second parameter of aie2_query_status() is a userspace pointer.
Declaring it as 'char __user *' to fix sparse warning.

Fixes: 850d71f6bf4c ("accel/amdxdna: Add query functions")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412311655.YBvq2wJb-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index cc159cadff9f..f2d95531ddc2 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -269,7 +269,7 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
 int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
 int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
-int aie2_query_status(struct amdxdna_dev_hdl *ndev, char *buf, u32 size, u32 *cols_filled);
+int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf, u32 size, u32 *cols_filled);
 int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
 				 void *handle, int (*cb)(void*, const u32 *, size_t));
 int aie2_config_cu(struct amdxdna_hwctx *hwctx);
-- 
2.34.1

