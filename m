Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12EF71123E
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7171210E6FC;
	Thu, 25 May 2023 17:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D99C10E6E1;
 Thu, 25 May 2023 17:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFD+7DVxaIqLj8Abhno2Tj1RKMX5/IoeY5QDz5YSW/gblk1aZCJupx0ajdVdQ2hiBHZZXZF8Y+6X9hdqSDRHdce88whbSZ0kl2lutxXF7jTQ8LW73F650iyE2pkv8SQtQf34ifBdEiurpXYPB3u6GVHuXyK7Rpj21mV5z7Zcz0VSJsVzkV5QkzbaUXWMvODdff3Isk8EN62sJ7w/60y0TabMrrk+w3ZY+fbIKQ9DY+dqFXLhd+1UbS+XDLIF2T+Nvko6i7b5h/sHAq9bvv8n0aGLyO76ea/vBxXSogizFEiIQm8F8/aLHynvPeuak0vDEAYasmUjxuBdTdfGIWAmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chK1RwxhkvRtPCbh19d/6mgsmd8yUJyq5Rc51fXjzCQ=;
 b=ibimNiExIqHt5JR/gjhaAwfKZ9Aq+ZK5qFF6FRx4XAcR1rvoSVAb5T/RPYzb+ccba/MBo1ByJJNpqlu7URtIOpGAzzUOrVQcXmnka2vI1bt16ZqmX2shVKOKLweFGXrdrWpItyph/6PpfqTQBZUYUOeAv3Bm8QpjOYit8A1ObrwvpFIS0wWF7xTCipHSHd3Zwx7JJLmJU54uv/mocptWXjtNg9gr5dvD2nv7/lye90hvl41IFa6A+sp+NJmdXhANMsM5YMK1j6zW+8byOZP0CwCtmkeSKYcPKIAGnfBJP1eeapmiDPAlrDWaonsje/hj0UmCL+AM5+I03wZnUE1iAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chK1RwxhkvRtPCbh19d/6mgsmd8yUJyq5Rc51fXjzCQ=;
 b=1WzRtIBVp5BiRQC3WRtOH+y8/tXkPY5E/BRgCGOYlpX167m2aGpw8hGeL705tQcVORf6IvzQXHMLoL3a8pVNCt4e+UceDb1cyxDXAsfwM+gfmFr3T8bOgeo/AJcFvE95UjsodaZGvf3tzgnr3iCmqn5o5pCosqsMOF8awK9f2PU=
Received: from MW4PR04CA0213.namprd04.prod.outlook.com (2603:10b6:303:87::8)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 17:28:04 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::1d) by MW4PR04CA0213.outlook.office365.com
 (2603:10b6:303:87::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:03 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:00 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 15/33] drm/amdgpu: expose debug api for mes
Date: Thu, 25 May 2023 13:27:27 -0400
Message-ID: <20230525172745.702700-15-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a6d911-26d9-4a05-0d11-08db5d45658b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hVdQalzIEiBOATmF8ZFmJqqXOyR87qNniTVTp+GkBSnIiEmhkEi4ivlOQxQz7UgjUpwouG3IyrH1AUPGM+G6LnDjI8ZUhujAJwXS0B2q0d2s/OaGbID7DxXimdE6+cAljzPaCE2373VPvYA/QuNSF5XOZ33b6WeQbTUNjnDS/3FByGiHAJ6kAfI+E2plaReyZiJfeW5uoqA2Q6r4JQ70OrjDgX/FXUdu3/t/y3bGbNJEwYS8LNEnP0R4ImTdbX99DFHJh74J5nw8WkdOv5uvlSAKuwdRFiOPW7Eo9FRD0tm8C6VWQC2NdTd08YrF0xVqOU2vVy12Lyw1Ql2012VH4XOzUgH+gT3aF8pOF0JUfe0hYgmcKy4jK3nJFRF3eCUwytRzf09rMgxdrhQ9ARKWEo9If8KA8oc0i9pQ8erYJO77QG3S5BAU1hfO5cV+buwI+0r47wtQzjVOIbLBYqPAevq1QU3MkMhbSAHKyHZ9Xzpig4kuZkuW6rRgQ5wY51avyShMYIXNyA0VzWC4KjNOU5l5r1voFDE7ZBLFJRoSKaM7XLrhW6iPtdKuZnP2c09GZjmtDe4z1tzXM65qnJcbEnFZKrzxjqUFz8R6nhRNdB+5lANqpdcpXWTZcd+9SY2cJ+OR84vHiUZSWoEI6iqCAEsXNDTcAmUbeJK53mTdAeQFHELp7nd95MN31dbZscQobub9HADMJO86K1Gxl7wqtN1dNPdSjKq0Kr3l+0i6jnWvFBvFQIwDuSPnrWIOzsTcjDHC7u4sydWOhzzPF9HhUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(336012)(2616005)(40460700003)(426003)(47076005)(83380400001)(2906002)(186003)(16526019)(36756003)(82310400005)(86362001)(356005)(81166007)(82740400003)(36860700001)(40480700001)(41300700001)(8936002)(8676002)(110136005)(5660300002)(450100002)(6636002)(4326008)(70586007)(70206006)(7696005)(478600001)(6666004)(316002)(1076003)(26005)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:03.9389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a6d911-26d9-4a05-0d11-08db5d45658b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
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
Cc: Jinhuieric.Huang@amd.com
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
index 49bb6c03d606..20cc3fffe921 100644
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
index 90b4a74ccf01..861910a6662d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -339,6 +339,18 @@ static int mes_v11_0_misc_op(struct amdgpu_mes *mes,
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

