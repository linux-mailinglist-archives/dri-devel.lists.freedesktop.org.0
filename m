Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E5FC32B5A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826710E2B9;
	Tue,  4 Nov 2025 18:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i6q+GrWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013023.outbound.protection.outlook.com
 [40.93.196.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC2710E2B9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:53:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqCcw8dfx7A5544gyd6ibfmpkGtjb0ede/HsOR2J5vsoDqnuMaAg8imxrohTS5WMG/R25hxfRZqViFHTewUp5WBeHuRe7wGenNckQKD1Nm41hNQlwsiNe2j1EOE3sjg+bfuLm32db6VJPskOk+T+v04qZL/mdm3gWncJBsAfyICm+RcJYFefNBENJpt+1ou1pTU6ohK+TkhK2vZW6NkERZL0yv4dNGCHhLQdRsLwDEve89SevgKq4TWPHbsJS9fYkZ7u/aDj3TWQ7UGaNuRPxn3MJn+XzVwzzK6h7uCuPnHul107E3hDAO6FkM+6rBw7rSUzqhz6wcJhBwvqXA6yFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrMonR81310bs8I5nr0M9LNSJYiRiVj6XHPr/IjQgPA=;
 b=SX14pKrsi4ANF8zrxbAAPfyOlSKdZbp0All9SRMj3+ObAZtQrccRZOjUDDu3pXUgVlHKE8+wND4/LsLu/cg/0N+ScGZ22ILG6H/Wsf4pXNWxL450edSWXN44TJNjGSNCIil4oXaB6JZpHH3AFO8mQJtGbOio354/bFquF1DSzyMFdvwQ/Vqxj2beOtbSsdpPjb93Aay3XHOWL8va3b06ZSW8CyG+uDReUlc/tCcAjcoa/uOvZK8nJLjt9hZRx91OxkV4vO4fmWxN8lxq2gQlYqUp7opHT3n68xCeF9ObCzwxPcVb8lMi/ushUb/6fdHZiiHudv6GcFBt7XrNXtB7Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrMonR81310bs8I5nr0M9LNSJYiRiVj6XHPr/IjQgPA=;
 b=i6q+GrWy5Ilb3FLlmgKyWf0SSOHOk63JT4T3NFadrZOzxdYd/38Lx4Ra4laSfqheJ1TwtguN605dN4piRrBIEP0HTYTc77sADwB1YJSg0IwM0LTuCUjPJUM24ex9HF24mQY1rijqyW4wcfMXP8In+fcT8Ardxy3tsanjHDAo+C4=
Received: from BLAPR03CA0041.namprd03.prod.outlook.com (2603:10b6:208:32d::16)
 by DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 18:53:43 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::42) by BLAPR03CA0041.outlook.office365.com
 (2603:10b6:208:32d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 18:53:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 18:53:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 4 Nov
 2025 10:53:42 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Nov
 2025 12:53:42 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 4 Nov 2025 10:53:41 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Support preemption requests
Date: Tue, 4 Nov 2025 10:53:39 -0800
Message-ID: <20251104185340.897560-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|DS7PR12MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: 3827bb3b-ae55-4a31-8a7b-08de1bd37a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E6cWp4Q7P3B9IJoxjASRzzhk6WKcBJSxFzlCswUhDDlQ0Tl+r0hgNzQxsxIt?=
 =?us-ascii?Q?xYojviNz3eaI7y3gyOQcaFEfiSXRz1n4p6LlZKTa+u2gTqI2CrVJaaja+HYw?=
 =?us-ascii?Q?DPKdAVEjNq9K5BpHwKk2jnpRLMakkjURV6hqG9UXTSvITVIcCDHXpQg6FcFx?=
 =?us-ascii?Q?WFGQArWg1XjAwDhb58dKGWCOLtjun3QOOnT7gXio80KPiXclg3wMTdxQr24p?=
 =?us-ascii?Q?SMZbR3xzGpQVJ+cO1aJSUbiF9WiEs150GnFGnFzvSduNgy9Ve/srz8GXulhg?=
 =?us-ascii?Q?ZjIlr56kRPSr8F46+GXgePjCr85dtoLDj0oxokFHAUFXYSI+pos20Tb17MBv?=
 =?us-ascii?Q?96XMJo6vUGMqETxSuRkfGKq/HQnVRPmU1+7+ZjO0Q7DFLXYbfcXgy04jSLhZ?=
 =?us-ascii?Q?7dE+Gzdk8IlUAWc10w29argeh6xOApLrjQvF8jqA2QPAo52iFtIOBb80zeMZ?=
 =?us-ascii?Q?xjfXZW7y9vbt4y7viED5RPjza/1qskErGSKtnP1fxgLd3ShOzu5H1H2o8xU2?=
 =?us-ascii?Q?km2fm0ntzON+9DwrcrZ9xrdz62Z62h0tLoKRiYCd8O6ywyZcOA+VSbSJontN?=
 =?us-ascii?Q?UzZWZls4JM7lM8QDC9IYWKsUplcmf1nV2MYQT0V5+Fpm/dHSBe2hyWgi1Z86?=
 =?us-ascii?Q?W3q443niRqTdkhaNWMfPIPpR0dvTqtRPLSd/+YySWAq7gsAqPA8PYvlnEhui?=
 =?us-ascii?Q?jznOXa1m96iebYJIXkCfh0S3zUCoZkxMk4QsInjHVNP+EH8TbHvp10n/5OKq?=
 =?us-ascii?Q?qG4Zsquewnd9/oDpL2URQMpvLbQHXx1aGGq7rBN2+69MCzZFEmNtdJTIFpyB?=
 =?us-ascii?Q?sKXrbZCB/Nq0qWVXkC2BrfW/poGfKvnQS4upck9m0aPpkvi9A8PHGCGhPKtG?=
 =?us-ascii?Q?ojJlcy9TYlMs+4fViuceW2EvfV2wpHPd2f21WuV51HO4ZmEyjIjhWB6xSeGX?=
 =?us-ascii?Q?xsanfb8N4vrpZ7uLzKJdsGSvQ0HtxTlfzlC1zE5KlMwBTRsheiR8GYEgnSzG?=
 =?us-ascii?Q?AcS2V3lvepUysw7VfaTlMBolXXQ9kHh9bpQsNpu/gFr3ov5oaVJieE8TnpCt?=
 =?us-ascii?Q?uagdEx7krzegrU59y75nHUfJevxP4Xcge8aQjoZTP6E1r89ikvrj+3Ho0xzh?=
 =?us-ascii?Q?cKyGZuz1N+FUaM01w8NGnYOBSxqM04thxfQN9SbcaxwF6w7JTXRK175a8Dsp?=
 =?us-ascii?Q?GDCLNgSlQupLW5wCio8pUdrvv9XChr1a/4e4v3RlsuTbwNLJTaxc5z0v1WG0?=
 =?us-ascii?Q?OO6+bZsWbZnkGWogCQIKFxTvOUH8z8ZZ4C5Zo1HNrDxCPY205BtsYZPnBS18?=
 =?us-ascii?Q?ax/CrdLxDd8u+yxCa4v5pvTqnRB438HJmZBoTLuhdwLgg0nJ5VxsNVewoWIL?=
 =?us-ascii?Q?nNqf06gfp4FvypTkXtrUJWquNTO7lNQpb5J0P1AUHgqezANhBT/G7u4EGYdL?=
 =?us-ascii?Q?j8x/CXSpj3JGneyL+fr25GVIkIYzsHIt69zbySbvZx+Izlbg5WcG8EveO001?=
 =?us-ascii?Q?61ksB+PCXWKuvIZ9CgYn1x2dU2ltPb4Z4JVse0YiBCd/3t50hjPiVN62QDDw?=
 =?us-ascii?Q?h3bLlUpQSVTMZ1wGEeQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 18:53:43.3152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3827bb3b-ae55-4a31-8a7b-08de1bd37a17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9475
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

The driver checks the firmware version during initialization.If preemption
is supported, the driver configures preemption accordingly and handles
userspace preemption requests. Otherwise, the driver returns an error for
userspace preemption requests.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c    | 95 +++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h   |  3 +
 drivers/accel/amdxdna/aie2_pci.c        | 63 ++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        |  8 +++
 drivers/accel/amdxdna/amdxdna_ctx.h     | 17 +++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
 drivers/accel/amdxdna/npu4_regs.c       |  4 ++
 include/uapi/drm/amdxdna_accel.h        | 16 ++++-
 8 files changed, 207 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 69cdce9ff208..d493bb1c3360 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -210,6 +210,14 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 	hwctx->fw_ctx_id = resp.context_id;
 	WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
 
+	if (ndev->force_preempt_enabled) {
+		ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, &hwctx->fw_ctx_id);
+		if (ret) {
+			XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
+			return ret;
+		}
+	}
+
 	cq_pair = &resp.cq_pair[0];
 	x2i.mb_head_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair->x2i_q.head_addr);
 	x2i.mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair->x2i_q.tail_addr);
@@ -601,6 +609,11 @@ aie2_cmdlist_fill_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
 	return 0;
 }
 
+static int aie2_cmdlist_unsupp(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
+{
+	return -EOPNOTSUPP;
+}
+
 static u32 aie2_get_chain_msg_op(u32 cmd_op)
 {
 	switch (cmd_op) {
@@ -621,6 +634,8 @@ static struct aie2_exec_msg_ops legacy_exec_message_ops = {
 	.init_chain_req = aie2_init_exec_chain_req,
 	.fill_cf_slot = aie2_cmdlist_fill_cf,
 	.fill_dpu_slot = aie2_cmdlist_fill_dpu,
+	.fill_preempt_slot = aie2_cmdlist_unsupp,
+	.fill_elf_slot = aie2_cmdlist_unsupp,
 	.get_chain_msg_op = aie2_get_chain_msg_op,
 };
 
@@ -680,6 +695,74 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
 	return 0;
 }
 
+static int
+aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
+{
+	struct cmd_chain_slot_npu *npu_slot = slot;
+	struct amdxdna_cmd_preempt_data *pd;
+	u32 cmd_len;
+	u32 arg_sz;
+
+	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
+	arg_sz = cmd_len - sizeof(*pd);
+	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
+		return -EINVAL;
+
+	if (*size < sizeof(*npu_slot) + arg_sz)
+		return -EINVAL;
+
+	npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
+	if (npu_slot->cu_idx == INVALID_CU_IDX)
+		return -EINVAL;
+
+	memset(npu_slot, 0, sizeof(*npu_slot));
+	npu_slot->type = EXEC_NPU_TYPE_PREEMPT;
+	npu_slot->inst_buf_addr = pd->inst_buf;
+	npu_slot->save_buf_addr = pd->save_buf;
+	npu_slot->restore_buf_addr = pd->restore_buf;
+	npu_slot->inst_size = pd->inst_size;
+	npu_slot->save_size = pd->save_size;
+	npu_slot->restore_size = pd->restore_size;
+	npu_slot->inst_prop_cnt = pd->inst_prop_cnt;
+	npu_slot->arg_cnt = arg_sz / sizeof(u32);
+	memcpy(npu_slot->args, pd->prop_args, arg_sz);
+
+	*size = sizeof(*npu_slot) + arg_sz;
+	return 0;
+}
+
+static int
+aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
+{
+	struct cmd_chain_slot_npu *npu_slot = slot;
+	struct amdxdna_cmd_preempt_data *pd;
+	u32 cmd_len;
+	u32 arg_sz;
+
+	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
+	arg_sz = cmd_len - sizeof(*pd);
+	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
+		return -EINVAL;
+
+	if (*size < sizeof(*npu_slot) + arg_sz)
+		return -EINVAL;
+
+	memset(npu_slot, 0, sizeof(*npu_slot));
+	npu_slot->type = EXEC_NPU_TYPE_ELF;
+	npu_slot->inst_buf_addr = pd->inst_buf;
+	npu_slot->save_buf_addr = pd->save_buf;
+	npu_slot->restore_buf_addr = pd->restore_buf;
+	npu_slot->inst_size = pd->inst_size;
+	npu_slot->save_size = pd->save_size;
+	npu_slot->restore_size = pd->restore_size;
+	npu_slot->inst_prop_cnt = pd->inst_prop_cnt;
+	npu_slot->arg_cnt = 1;
+	npu_slot->args[0] = AIE2_EXEC_BUFFER_KERNEL_OP_TXN;
+
+	*size = struct_size(npu_slot, args, npu_slot->arg_cnt);
+	return 0;
+}
+
 static u32 aie2_get_npu_chain_msg_op(u32 cmd_op)
 {
 	return MSG_OP_CHAIN_EXEC_NPU;
@@ -691,6 +774,8 @@ static struct aie2_exec_msg_ops npu_exec_message_ops = {
 	.init_chain_req = aie2_init_npu_chain_req,
 	.fill_cf_slot = aie2_cmdlist_fill_npu_cf,
 	.fill_dpu_slot = aie2_cmdlist_fill_npu_dpu,
+	.fill_preempt_slot = aie2_cmdlist_fill_npu_preempt,
+	.fill_elf_slot = aie2_cmdlist_fill_npu_elf,
 	.get_chain_msg_op = aie2_get_npu_chain_msg_op,
 };
 
@@ -749,6 +834,16 @@ aie2_cmdlist_fill_slot(void *slot, struct amdxdna_gem_obj *cmd_abo,
 	case ERT_START_NPU:
 		ret = EXEC_MSG_OPS(xdna)->fill_dpu_slot(cmd_abo, slot, size);
 		break;
+	case ERT_START_NPU_PREEMPT:
+		if (!AIE2_FEATURE_ON(xdna->dev_handle, AIE2_PREEMPT))
+			return -EOPNOTSUPP;
+		ret = EXEC_MSG_OPS(xdna)->fill_preempt_slot(cmd_abo, slot, size);
+		break;
+	case ERT_START_NPU_PREEMPT_ELF:
+		if (!AIE2_FEATURE_ON(xdna->dev_handle, AIE2_PREEMPT))
+			return -EOPNOTSUPP;
+		ret = EXEC_MSG_OPS(xdna)->fill_elf_slot(cmd_abo, slot, size);
+		break;
 	default:
 		XDNA_INFO(xdna, "Unsupported op %d", op);
 		ret = -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
index 947daa63f064..1c957a6298d3 100644
--- a/drivers/accel/amdxdna/aie2_msg_priv.h
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -176,6 +176,8 @@ struct exec_dpu_req {
 enum exec_npu_type {
 	EXEC_NPU_TYPE_NON_ELF		= 0x1,
 	EXEC_NPU_TYPE_PARTIAL_ELF	= 0x2,
+	EXEC_NPU_TYPE_PREEMPT		= 0x3,
+	EXEC_NPU_TYPE_ELF		= 0x4,
 };
 
 union exec_req {
@@ -372,6 +374,7 @@ struct cmd_chain_slot_dpu {
 };
 
 #define MAX_NPU_ARGS_SIZE (26 * sizeof(__u32))
+#define AIE2_EXEC_BUFFER_KERNEL_OP_TXN	3
 struct cmd_chain_slot_npu {
 	enum exec_npu_type type;
 	u64 inst_buf_addr;
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index d7ccbdaf47f5..ceef1c502e9e 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -183,6 +183,10 @@ int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev,
 		if (cfg->category != category)
 			continue;
 
+		if (cfg->feature_mask &&
+		    bitmap_subset(&cfg->feature_mask, &ndev->feature_mask, AIE2_FEATURE_MAX))
+			continue;
+
 		value = val ? *val : cfg->value;
 		ret = aie2_set_runtime_cfg(ndev, cfg->type, value);
 		if (ret) {
@@ -932,6 +936,25 @@ static int aie2_get_telemetry(struct amdxdna_client *client,
 	return 0;
 }
 
+static int aie2_get_preempt_state(struct amdxdna_client *client,
+				  struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_attribute_state state = {};
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_dev_hdl *ndev;
+
+	ndev = xdna->dev_handle;
+	if (args->param == DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE)
+		state.state = ndev->force_preempt_enabled;
+	else if (args->param == DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE)
+		state.state = ndev->frame_boundary_preempt;
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), &state, sizeof(state)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
 {
 	struct amdxdna_dev *xdna = client->xdna;
@@ -972,6 +995,10 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
 		ret = aie2_query_resource_info(client, args);
 		break;
+	case DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE:
+	case DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE:
+		ret = aie2_get_preempt_state(client, args);
+		break;
 	default:
 		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
 		ret = -EOPNOTSUPP;
@@ -1078,6 +1105,38 @@ static int aie2_set_power_mode(struct amdxdna_client *client,
 	return aie2_pm_set_mode(xdna->dev_handle, power_mode);
 }
 
+static int aie2_set_preempt_state(struct amdxdna_client *client,
+				  struct amdxdna_drm_set_state *args)
+{
+	struct amdxdna_dev_hdl *ndev = client->xdna->dev_handle;
+	struct amdxdna_drm_attribute_state state;
+	u32 val;
+	int ret;
+
+	if (copy_from_user(&state, u64_to_user_ptr(args->buffer), sizeof(state)))
+		return -EFAULT;
+
+	if (state.state > 1)
+		return -EINVAL;
+
+	if (XDNA_MBZ_DBG(client->xdna, state.pad, sizeof(state.pad)))
+		return -EINVAL;
+
+	if (args->param == DRM_AMDXDNA_SET_FORCE_PREEMPT) {
+		ndev->force_preempt_enabled = state.state;
+	} else if (args->param == DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT) {
+		val = state.state;
+		ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT,
+				       &val);
+		if (ret)
+			return ret;
+
+		ndev->frame_boundary_preempt = state.state;
+	}
+
+	return 0;
+}
+
 static int aie2_set_state(struct amdxdna_client *client,
 			  struct amdxdna_drm_set_state *args)
 {
@@ -1095,6 +1154,10 @@ static int aie2_set_state(struct amdxdna_client *client,
 	case DRM_AMDXDNA_SET_POWER_MODE:
 		ret = aie2_set_power_mode(client, args);
 		break;
+	case DRM_AMDXDNA_SET_FORCE_PREEMPT:
+	case DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT:
+		ret = aie2_set_preempt_state(client, args);
+		break;
 	default:
 		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
 		ret = -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 9793cd1e0c55..a5f9c42155d1 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -110,12 +110,15 @@ struct aie_metadata {
 enum rt_config_category {
 	AIE2_RT_CFG_INIT,
 	AIE2_RT_CFG_CLK_GATING,
+	AIE2_RT_CFG_FORCE_PREEMPT,
+	AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT,
 };
 
 struct rt_config {
 	u32	type;
 	u32	value;
 	u32	category;
+	unsigned long feature_mask;
 };
 
 struct dpm_clk_freq {
@@ -164,6 +167,8 @@ struct aie2_exec_msg_ops {
 	void (*init_chain_req)(void *req, u64 slot_addr, size_t size, u32 cmd_cnt);
 	int (*fill_cf_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size);
 	int (*fill_dpu_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size);
+	int (*fill_preempt_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size);
+	int (*fill_elf_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size);
 	u32 (*get_chain_msg_op)(u32 cmd_op);
 };
 
@@ -197,6 +202,8 @@ struct amdxdna_dev_hdl {
 	u32				hclk_freq;
 	u32				max_tops;
 	u32				curr_tops;
+	u32				force_preempt_enabled;
+	u32				frame_boundary_preempt;
 
 	/* Mailbox and the management channel */
 	struct mailbox			*mbox;
@@ -223,6 +230,7 @@ struct aie2_hw_ops {
 
 enum aie2_fw_feature {
 	AIE2_NPU_COMMAND,
+	AIE2_PREEMPT,
 	AIE2_FEATURE_MAX
 };
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index d02fb32499fa..b6151244d64f 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -16,6 +16,8 @@ enum ert_cmd_opcode {
 	ERT_START_CU = 0,
 	ERT_CMD_CHAIN = 19,
 	ERT_START_NPU = 20,
+	ERT_START_NPU_PREEMPT = 21,
+	ERT_START_NPU_PREEMPT_ELF = 22,
 	ERT_INVALID_CMD	= ~0U,
 };
 
@@ -55,6 +57,21 @@ struct amdxdna_cmd_chain {
 	u64 data[] __counted_by(command_count);
 };
 
+/*
+ * Interpretation of the beginning of data payload for ERT_START_NPU_PREEMPT in
+ * amdxdna_cmd. The rest of the payload in amdxdna_cmd is regular kernel args.
+ */
+struct amdxdna_cmd_preempt_data {
+	u64 inst_buf;	    /* instruction buffer address */
+	u64 save_buf;	    /* save buffer address */
+	u64 restore_buf;    /* restore buffer address */
+	u32 inst_size;	    /* size of instruction buffer in bytes */
+	u32 save_size;	    /* size of save buffer in bytes */
+	u32 restore_size;   /* size of restore buffer in bytes */
+	u32 inst_prop_cnt;  /* properties count */
+	u32 prop_args[];    /* properties and regular kernel arguments */
+};
+
 /* Exec buffer command header format */
 #define AMDXDNA_CMD_STATE		GENMASK(3, 0)
 #define AMDXDNA_CMD_EXTRA_CU_MASK	GENMASK(11, 10)
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 7590265d4485..1973ab67721b 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -31,9 +31,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
  * 0.3: Support firmware debug buffer
  * 0.4: Support getting resource information
  * 0.5: Support getting telemetry data
+ * 0.6: Support preemption
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		5
+#define AMDXDNA_DRIVER_MINOR		6
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index d90777275a9f..986a5f28ba24 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -64,10 +64,13 @@
 const struct rt_config npu4_default_rt_cfg[] = {
 	{ 5, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
 	{ 10, 1, AIE2_RT_CFG_INIT }, /* DEBUG BUF */
+	{ 14, 0, AIE2_RT_CFG_INIT, BIT_U64(AIE2_PREEMPT) }, /* Frame boundary preemption */
 	{ 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
 	{ 2, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
 	{ 3, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
 	{ 4, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
+	{ 13, 0, AIE2_RT_CFG_FORCE_PREEMPT },
+	{ 14, 0, AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT },
 	{ 0 },
 };
 
@@ -85,6 +88,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
 
 const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
 	{ .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
+	{ .feature = AIE2_PREEMPT, .min_minor = 12 },
 	{ 0 }
 };
 
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 8ad254bc35a5..62c917fd4f7b 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -443,7 +443,9 @@ enum amdxdna_drm_get_param {
 	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
 	DRM_AMDXDNA_GET_POWER_MODE,
 	DRM_AMDXDNA_QUERY_TELEMETRY,
-	DRM_AMDXDNA_QUERY_RESOURCE_INFO = 12,
+	DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE,
+	DRM_AMDXDNA_QUERY_RESOURCE_INFO,
+	DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE,
 };
 
 /**
@@ -462,6 +464,16 @@ struct amdxdna_drm_get_resource_info {
 	__u64 npu_task_curr;
 };
 
+/**
+ * struct amdxdna_drm_attribute_state - State of an attribute
+ */
+struct amdxdna_drm_attribute_state {
+	/** @state: enabled or disabled */
+	__u8 state;
+	/** @pad: MBZ */
+	__u8 pad[7];
+};
+
 /**
  * struct amdxdna_drm_query_telemetry_header - Telemetry data header
  */
@@ -613,6 +625,8 @@ enum amdxdna_drm_set_param {
 	DRM_AMDXDNA_SET_POWER_MODE,
 	DRM_AMDXDNA_WRITE_AIE_MEM,
 	DRM_AMDXDNA_WRITE_AIE_REG,
+	DRM_AMDXDNA_SET_FORCE_PREEMPT,
+	DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT,
 };
 
 /**
-- 
2.34.1

