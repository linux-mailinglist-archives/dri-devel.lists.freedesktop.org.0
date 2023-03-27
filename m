Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E286CAD86
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B19710E6E4;
	Mon, 27 Mar 2023 18:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D30110E6C4;
 Mon, 27 Mar 2023 18:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPYA3guEXAPLCiTZf8fA300Q5adMNRQzQ3MZF0CfSYqXXa2fvCoq4u76g4pewgLuzAXQJhgij59Pl4PKtRU7rg05U6dmONqZspTRlJnsqTPu41XtfvukXjkyj/kmL5FEDaYM6imW6t6iSqEAga/oIUnW7B2LRBrx9U4yvlTxDyawYuTnUSgQDp0yolWH03U2GoMz+2laaA+Btb8n4Adgs2u2FZ8zrExIW253GYMXJiHMzBtMpFFKPOyCLz1MdBhgIAtXjTKZYgzJqo/WAAs4MFxfYApDW/UXFwRCA8tFs+qMkckBNQs2sNTDloC3uJayCrAOCmsgGyUkoKceo7AG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMy1NnqGbaiJ4GMr3+Y+sxjCEY42rbG40gLuk25+/1o=;
 b=BjCNgK17moRldn6ytY2dJCUAT+65epPqrhfQvJlv9alwrKtUWDN+zGwYXJKHU5O8Lbq8IXGzk7EHT90tEmtoXPJt+1at7rFNBD6J+O6R/z7JdWRmVw2e5NjOyNtOprr4ABi/ms5PpcjTCHFxyGayJNIKrJgqVOQ0Inqfgl0GNe+XWXaPTWDhFPio/3nVp6/EnuUk643brV2qV2CbYBvMWmcQOTKAlQsY0juEBhXgtQCTplaidd7koqpZKasGZxySIBDM7r6gm7U8UwK8iiFtQKBba8UBvT54pTSV+9/y9u4niPoMuDrBgXVdy3OsbB5RUnhYZAHVDrHY84hMwYQTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMy1NnqGbaiJ4GMr3+Y+sxjCEY42rbG40gLuk25+/1o=;
 b=beSjTx1gUC3lBRhDQFk+6KS4bkm4uzL32kRaMIvxbV2yLpf8hcSXPyxZtcaeq7T19upLBg/NMnOvBI6CdiAzYWK8gFm4zw4AZ4jXLbtTx71Yxe8nEo+m9ojs3hQvGq25s1Tq7R71GsA+U4j1YW5bgyrobBS425a1qayuzrN0Zhw=
Received: from CY8PR02CA0020.namprd02.prod.outlook.com (2603:10b6:930:4d::23)
 by CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:43:55 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::4c) by CY8PR02CA0020.outlook.office365.com
 (2603:10b6:930:4d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:55 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:53 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/34] drm/amdgpu: expose debug api for mes
Date: Mon, 27 Mar 2023 14:43:20 -0400
Message-ID: <20230327184339.125016-15-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|CH0PR12MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ee3ed9-d6e7-4619-62cf-08db2ef3381d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hSUbSqvLv5ZdZUJvXmWgkrkq+csE6cs5lelykFqUz6rpUE5sSWRlur3IPbNaZp668NHQpCweWQZk1equ0pd1T1mYSl4lyvJUsMYaZFrkEDYq9SaG2O6uS5+v/exfo2D+9RX5Mjs/ziAmGtLdD13Ka0h1ZrKtYUHOJDNMahpRRT4yVfq3Vg8IOG9uiZp54AdzCEpXFeMsqwEMOCHyKvLhkQH02URLWh+WnFFyQEMmZdF4iV0e2eliyJ48gLW3ij0jxLmHzU+CEaq/K2j64VKJAC18QOE9g/PmrhwCxAXLXaiyyQihjQr6R4igEPVeZHxfFrKqZcDKBe0aF3BHQ58Iz21E09wgoDNdQroKjuGTW/VpGHsv2rcqN9YoSotrzRasedfvLEfMX5mQXe0/2MLbS1rBIGKzclCOCy2lApqufiUO5/akiJngvTc0FIqG6quZOBg7vYo9Wg8bKuz+TV/hSwqcigV4dYHTZBNoCFoJVMaixHydYOH27zRVNutQzo6A0AR1tENJR9wPdqPkKseALOWUtALdq17JI54IDO4dwcWWEDnGP38DTqVrJS9ZXR6MTZsS6YYnTsITA+B1ogbo3F8/lDy7PtrWo1ChqtMgBj82lXqda+n53tMvHqRhP0N+O4Sa8ww2mBaWG2SyrimM4HaJ3hkudIH/li2OXLp6p7I+xRv7C9aZIWCZndJMu5tok/Le/tERvXCA44EdAXVTpZE1aS5jl9J4Va5hhIipND8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(36840700001)(40470700004)(46966006)(36756003)(82310400005)(426003)(336012)(86362001)(81166007)(26005)(1076003)(186003)(2616005)(83380400001)(44832011)(16526019)(356005)(8936002)(82740400003)(5660300002)(6666004)(41300700001)(36860700001)(450100002)(40480700001)(70586007)(7696005)(4326008)(54906003)(110136005)(2906002)(47076005)(70206006)(316002)(8676002)(40460700003)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:55.5343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ee3ed9-d6e7-4619-62cf-08db2ef3381d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5284
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to the F32 HWS, the RS64 HWS for GFX11 now supports a multi-process
debug API.

The skip_process_ctx_clear ADD_QUEUE requirement is to prevent the MES
from clearing the process context when the first queue is added to the
scheduler in order to maintain debug mode settings during queue preemption
and restore.  The MES clears the process context in this case due to an
unresolved FW caching bug during normal mode operations.
During debug mode, the KFD will hold a reference to the target process
so the process context should never go stale and MES can afford to skip
this requirement.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       | 32 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       | 20 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        | 12 +++++++
 drivers/gpu/drm/amd/include/mes_v11_api_def.h | 21 +++++++++++-
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 0e55823ef6ca..505f453038dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -924,6 +924,38 @@ int amdgpu_mes_reg_wait(struct amdgpu_device *adev, uint32_t reg,
 	return r;
 }
 
+int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
+				uint64_t process_context_addr,
+				uint32_t spi_gdbg_per_vmid_cntl,
+				const uint32_t *tcp_watch_cntl,
+				uint32_t flags)
+{
+	struct mes_misc_op_input op_input = {0};
+	int r;
+
+	if (!adev->mes.funcs->misc_op) {
+		DRM_ERROR("mes set shader debugger is not supported!\n");
+		return -EINVAL;
+	}
+
+	op_input.op = MES_MISC_OP_SET_SHADER_DEBUGGER;
+	op_input.set_shader_debugger.process_context_addr = process_context_addr;
+	op_input.set_shader_debugger.flags.u32all = flags;
+	op_input.set_shader_debugger.spi_gdbg_per_vmid_cntl = spi_gdbg_per_vmid_cntl;
+	memcpy(op_input.set_shader_debugger.tcp_watch_cntl, tcp_watch_cntl,
+			sizeof(op_input.set_shader_debugger.tcp_watch_cntl));
+
+	amdgpu_mes_lock(&adev->mes);
+
+	r = adev->mes.funcs->misc_op(&adev->mes, &op_input);
+	if (r)
+		DRM_ERROR("failed to set_shader_debugger\n");
+
+	amdgpu_mes_unlock(&adev->mes);
+
+	return r;
+}
+
 static void
 amdgpu_mes_ring_to_queue_props(struct amdgpu_device *adev,
 			       struct amdgpu_ring *ring,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
index 547ec35691fa..d20df0cf0d88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
@@ -256,6 +256,7 @@ enum mes_misc_opcode {
 	MES_MISC_OP_READ_REG,
 	MES_MISC_OP_WRM_REG_WAIT,
 	MES_MISC_OP_WRM_REG_WR_WAIT,
+	MES_MISC_OP_SET_SHADER_DEBUGGER,
 };
 
 struct mes_misc_op_input {
@@ -278,6 +279,20 @@ struct mes_misc_op_input {
 			uint32_t                   reg0;
 			uint32_t                   reg1;
 		} wrm_reg;
+
+		struct {
+			uint64_t process_context_addr;
+			union {
+				struct {
+					uint64_t single_memop : 1;
+					uint64_t single_alu_op : 1;
+					uint64_t reserved: 30;
+				};
+				uint32_t u32all;
+			} flags;
+			uint32_t spi_gdbg_per_vmid_cntl;
+			uint32_t tcp_watch_cntl[4];
+		} set_shader_debugger;
 	};
 };
 
@@ -340,6 +355,11 @@ int amdgpu_mes_reg_wait(struct amdgpu_device *adev, uint32_t reg,
 int amdgpu_mes_reg_write_reg_wait(struct amdgpu_device *adev,
 				  uint32_t reg0, uint32_t reg1,
 				  uint32_t ref, uint32_t mask);
+int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
+				uint64_t process_context_addr,
+				uint32_t spi_gdbg_per_vmid_cntl,
+				const uint32_t *tcp_watch_cntl,
+				uint32_t flags);
 
 int amdgpu_mes_add_ring(struct amdgpu_device *adev, int gang_id,
 			int queue_type, int idx,
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 5826eac270d7..08793dac618c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -334,6 +334,18 @@ static int mes_v11_0_misc_op(struct amdgpu_mes *mes,
 		misc_pkt.wait_reg_mem.reg_offset1 = input->wrm_reg.reg0;
 		misc_pkt.wait_reg_mem.reg_offset2 = input->wrm_reg.reg1;
 		break;
+	case MES_MISC_OP_SET_SHADER_DEBUGGER:
+		misc_pkt.opcode = MESAPI_MISC__SET_SHADER_DEBUGGER;
+		misc_pkt.set_shader_debugger.process_context_addr =
+				input->set_shader_debugger.process_context_addr;
+		misc_pkt.set_shader_debugger.flags.u32all =
+				input->set_shader_debugger.flags.u32all;
+		misc_pkt.set_shader_debugger.spi_gdbg_per_vmid_cntl =
+				input->set_shader_debugger.spi_gdbg_per_vmid_cntl;
+		memcpy(misc_pkt.set_shader_debugger.tcp_watch_cntl,
+				input->set_shader_debugger.tcp_watch_cntl,
+				sizeof(misc_pkt.set_shader_debugger.tcp_watch_cntl));
+		break;
 	default:
 		DRM_ERROR("unsupported misc op (%d) \n", input->op);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/amd/include/mes_v11_api_def.h b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
index dc694cb246d9..f3c15f18ddb5 100644
--- a/drivers/gpu/drm/amd/include/mes_v11_api_def.h
+++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
@@ -274,7 +274,8 @@ union MESAPI__ADD_QUEUE {
 			uint32_t is_kfd_process		: 1;
 			uint32_t trap_en		: 1;
 			uint32_t is_aql_queue		: 1;
-			uint32_t reserved		: 20;
+			uint32_t skip_process_ctx_clear : 1;
+			uint32_t reserved		: 19;
 		};
 		struct MES_API_STATUS		api_status;
 		uint64_t                        tma_addr;
@@ -523,6 +524,7 @@ enum MESAPI_MISC_OPCODE {
 	MESAPI_MISC__QUERY_STATUS,
 	MESAPI_MISC__READ_REG,
 	MESAPI_MISC__WAIT_REG_MEM,
+	MESAPI_MISC__SET_SHADER_DEBUGGER,
 	MESAPI_MISC__MAX,
 };
 
@@ -561,6 +563,20 @@ struct QUERY_STATUS {
 	uint32_t context_id;
 };
 
+struct SET_SHADER_DEBUGGER {
+	uint64_t process_context_addr;
+	union {
+		struct {
+			uint32_t single_memop : 1;  /* SQ_DEBUG.single_memop */
+			uint32_t single_alu_op : 1; /* SQ_DEBUG.single_alu_op */
+			uint32_t reserved : 30;
+		};
+		uint32_t u32all;
+	} flags;
+	uint32_t spi_gdbg_per_vmid_cntl;
+	uint32_t tcp_watch_cntl[4]; /* TCP_WATCHx_CNTL */
+};
+
 union MESAPI__MISC {
 	struct {
 		union MES_API_HEADER	header;
@@ -573,6 +589,9 @@ union MESAPI__MISC {
 			struct		QUERY_STATUS query_status;
 			struct		READ_REG read_reg;
 			struct          WAIT_REG_MEM wait_reg_mem;
+			struct		SET_SHADER_DEBUGGER set_shader_debugger;
+			enum MES_AMD_PRIORITY_LEVEL queue_sch_level;
+
 			uint32_t	data[MISC_DATA_MAX_SIZE_IN_DWORDS];
 		};
 	};
-- 
2.25.1

