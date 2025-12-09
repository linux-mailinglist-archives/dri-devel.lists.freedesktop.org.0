Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD15CB123B
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 22:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C209F10E02C;
	Tue,  9 Dec 2025 21:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eXzKtEvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6EB10E02C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 21:16:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwWl7h8IdSNyaPjEom9GibRwAilYqYQkGMYlkBEpieFRodxUh6HHDtYJnDLdAy37dq3ExqJW4/lzjpo2xd4RVPsIgst2t5KKTm2nAM4MukG7L+4T5HDPZZxmR2+ilJqc4MAxXOf6fQFzvIbDIpqJ+TRAviosx9rbjCRCBx+Z3/9uSq2YuhNYnX/+WoPAQqqpPaTveA8dp7QrHlipgPZwdcQuP3Ip6vxBwCtI5uo5OCUvI73hGypTbl9sz6zdlQjzaOBoZGkhnXtZKfpJbqspy7GULy6OQcR1Qpd2uAuvjiYzoHTFLEdeL729ajeXYa1YbxK4oF12pVpZ3mtYesNL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OdnlT39lJejJbUfqHxqaHPVNKlGQeRchXvw06AeLBs=;
 b=cTuHFlLZlHejmAvUlXpOeEk/ebv6pEvdllXHvkxsLeDmOHIKoLhmcapKds7Qdm7UMALCkQ9bTFgAGcaQUdpWPIGkIm7IfZq/Q5OaYHvmn3Nd1gH2sPy3nfuiMcSYXuGg0UTVh+lZKjq3D26ZXd5KjjISw0XElgPl8UbkQF0z3NFmGwBYGtLVORM2+tEnWNjo1bceTqb4kHjS4XjcyYRqqNH9ljEa6skG7dqvM0XQ6zI8a2kW/B5pFQRMq7HGpe8uXjomDMM1OUel5e4ZWzPbaaLOEIAvLWyvJB3AzHcnOpud/UtDEvQR/+Do9BrhaqwROyS44r2kYD4reNpYD5yXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OdnlT39lJejJbUfqHxqaHPVNKlGQeRchXvw06AeLBs=;
 b=eXzKtEvcSjnHvwn5zEZghoLWYZCFoI0cn0hj5Dj70qYJPfhybKdkDbwSXdwGITbU4+0UnN8AIQkiRKK88Qa+js5L36kVW08adzp+rEUQLa0PhZ8eBVYQ3REVn5Uw40RH2Ni6KnmaZc2X2KIfqfBWS8VgRhM+27LX3msjpG8pUYc=
Received: from SA0PR11CA0026.namprd11.prod.outlook.com (2603:10b6:806:d3::31)
 by CH2PR12MB9543.namprd12.prod.outlook.com (2603:10b6:610:27f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 21:16:44 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::ed) by SA0PR11CA0026.outlook.office365.com
 (2603:10b6:806:d3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 21:16:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 21:16:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 15:16:42 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 15:16:42 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 13:16:41 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix cu_idx being cleared by memset() during
 command setup
Date: Tue, 9 Dec 2025 13:16:39 -0800
Message-ID: <20251209211639.1636888-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|CH2PR12MB9543:EE_
X-MS-Office365-Filtering-Correlation-Id: f7556258-018c-48c2-2da6-08de3768410e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GA9ySG71WPK1ewHd0eqFfwCPJL5/XsfD61W7TP/x4cZMRetgX9Hk00w3E/C8?=
 =?us-ascii?Q?G2kglMTm3XsOR+fJNIfGvJhEj/IpaUjl/0PwaD0ck7Q3kzdU+JYMAX4ZeF8E?=
 =?us-ascii?Q?b4QUZAmPoxpOuzOn38eXO4aN4QwLQ+kbQQsFqaUl90lcccLTxzGTrUAN5Gaa?=
 =?us-ascii?Q?f0/EYhwU8KeOY4qYRL3dsDrmj/T27NWZniIkZhE974d9cEBHCRYrlz536ka0?=
 =?us-ascii?Q?ifYxLpOQ+fDC3EwjSv2CihL5tVepvrVNFN1Ky6A4+37zZ5SiQFpYFfZ9pnSY?=
 =?us-ascii?Q?KfMqVyevPAC2hRsahUaQBmrz4FGUK53dXpDJ/mA6msBcmWbeyBgNnhdFU9hu?=
 =?us-ascii?Q?3qf4Clabv4hijfj6b2a9k3uZyzMntenuRBNHC1bxLzAnmFVeiPHlj6PLCxFr?=
 =?us-ascii?Q?FzjV85XVfg41DLf1Q5c9YzLQjDouaw6gGpiNnePnpGwANlzMmlTyXnxNJRho?=
 =?us-ascii?Q?rP3ebZ32PCOipex5lMzo08VKCvkpebWdzAyhlbVkDrs1fgNt1Iv7ErDhc2n+?=
 =?us-ascii?Q?5f8rXoXtIn5zPUkmlJi/ci3JtOqmtxNNpq5k79P7Bfb7vEZs96GCEoEqEmAr?=
 =?us-ascii?Q?5PRUV8NXN0/q3WshHQuVuJQFUao5GojrD4oEcgDTst4VwUS08cRysLwO5GZQ?=
 =?us-ascii?Q?fZzjRKgCfBeF/otyMjuXFUp1Z2GlqmvEj7V5R4UuWP4JgX0DH7gPEhjnjfRj?=
 =?us-ascii?Q?blmyyi302nP+kmmRZjLHNHhJ7fJUkuG5x4u5W18Ok/szmU6ErIjHPtysVxuz?=
 =?us-ascii?Q?ESGaWSC+eBZv+oFROewBKxOsYqPBBM19SrN6nGResIdYHMgGik4okjEUQrjV?=
 =?us-ascii?Q?9TaLIp9BHks58Cy3rJvTxTbZdycBZC53t4vx99XrKBnhbp41B1bG2hbcDbdm?=
 =?us-ascii?Q?p4sTNCwrAfExAxKdVCLWEUGdoYRTL48oEdYqfKzmcPC4zPbV2Zrj3Bnj26o5?=
 =?us-ascii?Q?O17cc3mtVg2G9ZBuKjqNHq6HdCx/tf5jru5pZu4BAhZ9+fKq0dimBDnYsqox?=
 =?us-ascii?Q?c8S+nHhx//A7jC29FarVJelL0X35BcrrTvVxpRBiqUn3w9Dx9XvOFj7zL9dn?=
 =?us-ascii?Q?4Ms44gyH4R4HU5whACbILXfxmknCl5LeUkll3p57S0rkIjcjXwzHTJdUYTTz?=
 =?us-ascii?Q?raNK96Oupu8vEAvc9kgM/2a43AnRtVfXwCNogCCt+AVsfdy2O72TsWL4duVc?=
 =?us-ascii?Q?acmbnkH3zojej2CfELkCcUKLwMh4L9ohpf0K6O+PsZUsGRNCSUNpACJjXNwx?=
 =?us-ascii?Q?7UzloeiFP2aMnuYnHrz8uewwYZAIvXljpIN7qDsKZol4UKNLXnyQhIJsGnM0?=
 =?us-ascii?Q?FgIN4AGoQlN5We+xXh0V0Lq56MJwkToubVBh58xZbsH4+w+x5vILzc5lJtbh?=
 =?us-ascii?Q?ev27TlFH/QAykAqJXUXzpXCDPIas8tpSGWg5WYZle3PNV/2l8yhEGX81YCEH?=
 =?us-ascii?Q?BhvYgwGV+yfMJQsbVqsjcsYMfsjlIwW4ghwwmfJskcby3HatXjP461znDePJ?=
 =?us-ascii?Q?QEBaxBnkp0b+mbCQLGPijKBl1c7d7s71IyMu2MleFGlEXoq2RDVd5/97n9q5?=
 =?us-ascii?Q?vJsQZ6PF7a6DmZMSEYI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:16:44.0162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7556258-018c-48c2-2da6-08de3768410e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9543
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

For one command type, cu_idx is assigned before calling memset() on the
command structure. This results in cu_idx being overwritten, causing the
firmware to receive an incomplete or invalid command and leading to
unexpected command failures.

Fix this by moving the memset() call before initializing cu_idx so that
all fields are populated in the correct order.

Fixes: 71829d7f2f70 ("accel/amdxdna: Use MSG_OP_CHAIN_EXEC_NPU when supported")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index a75156800467..03b75757a6e6 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -652,6 +652,7 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *siz
 	u32 cmd_len;
 	void *cmd;
 
+	memset(npu_slot, 0, sizeof(*npu_slot));
 	cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
 	if (*size < sizeof(*npu_slot) + cmd_len)
 		return -EINVAL;
@@ -660,7 +661,6 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *siz
 	if (npu_slot->cu_idx == INVALID_CU_IDX)
 		return -EINVAL;
 
-	memset(npu_slot, 0, sizeof(*npu_slot));
 	npu_slot->type = EXEC_NPU_TYPE_NON_ELF;
 	npu_slot->arg_cnt = cmd_len / sizeof(u32);
 	memcpy(npu_slot->args, cmd, cmd_len);
@@ -677,6 +677,7 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	u32 cmd_len;
 	u32 arg_sz;
 
+	memset(npu_slot, 0, sizeof(*npu_slot));
 	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
 	arg_sz = cmd_len - sizeof(*sn);
 	if (cmd_len < sizeof(*sn) || arg_sz > MAX_NPU_ARGS_SIZE)
@@ -689,7 +690,6 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	if (npu_slot->cu_idx == INVALID_CU_IDX)
 		return -EINVAL;
 
-	memset(npu_slot, 0, sizeof(*npu_slot));
 	npu_slot->type = EXEC_NPU_TYPE_PARTIAL_ELF;
 	npu_slot->inst_buf_addr = sn->buffer;
 	npu_slot->inst_size = sn->buffer_size;
@@ -709,6 +709,7 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
 	u32 cmd_len;
 	u32 arg_sz;
 
+	memset(npu_slot, 0, sizeof(*npu_slot));
 	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
 	arg_sz = cmd_len - sizeof(*pd);
 	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
@@ -721,7 +722,6 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
 	if (npu_slot->cu_idx == INVALID_CU_IDX)
 		return -EINVAL;
 
-	memset(npu_slot, 0, sizeof(*npu_slot));
 	npu_slot->type = EXEC_NPU_TYPE_PREEMPT;
 	npu_slot->inst_buf_addr = pd->inst_buf;
 	npu_slot->save_buf_addr = pd->save_buf;
@@ -745,6 +745,7 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	u32 cmd_len;
 	u32 arg_sz;
 
+	memset(npu_slot, 0, sizeof(*npu_slot));
 	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
 	arg_sz = cmd_len - sizeof(*pd);
 	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
@@ -753,7 +754,6 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	if (*size < sizeof(*npu_slot) + arg_sz)
 		return -EINVAL;
 
-	memset(npu_slot, 0, sizeof(*npu_slot));
 	npu_slot->type = EXEC_NPU_TYPE_ELF;
 	npu_slot->inst_buf_addr = pd->inst_buf;
 	npu_slot->save_buf_addr = pd->save_buf;
-- 
2.34.1

