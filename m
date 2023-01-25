Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DA67BB4F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCFD10E826;
	Wed, 25 Jan 2023 19:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4268D10E819;
 Wed, 25 Jan 2023 19:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZVKFCtqJTBR0FHqA4j++FPQCgCzjdoQCsCLHao7i6PfdoGTplHcqPzoyJccPIHADZPpMc6xG5yQ+K9vuZZLdQwPLYjYANkrymeCyzy1WtkooHeZ7rzXcXzSUV3fgWf9iamj/VBzuhxiUHa1iWL/9x7nvU9R3RBalpvGTeUWTHv6ERvLTK0kjy2wd9k7qPR6IVAz46jXbW158Yd1y8vhQxb9NpDPiXnIfOV0fpxZWg+qnfQs4L18QDeWkN82dNJuE+FtSIfjlof2bAK8WE+JyY0KBF0SM3nNFLtvSeSlRKFSZbnmRwCaIZ8ZW+tt+IMGExOYBdWsYHu/+tDG1aCoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epMlUsPcGq8W1yB1DCAWkvYP1V3aFWXEIsmHliB67h8=;
 b=nEw03NzqJ0VYLfwO9df2N/UlQKXgAwHkLfOlc/sUiUY7zvV1gA6mn66Jogsctv3ZTFTCVPdNguaNfzXB4snrm/hpHK6k21BrTIwacYfx/NZRQwt9Iq3zBFoTQ3gZbNzKTZ1Y2Lh+UpmI0v2cVDonAoYQ1W752mvTW2VT+bnKOx3yOQ0Ee8OaOmVLEZOrgo3ousVQTkA5d6SvLdCuhc6CHW40RwsithN7ZOjchqcX06qGcEmWw2rtT01VrBUQDvrK0wl1XQ/tjr5yQSeCh/kxyGJwZKKd6rX5fC5PpR/PnpbekYdtyPuYVQYB5We3rCCtR5vzfCWOobwxnsyrh92RnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epMlUsPcGq8W1yB1DCAWkvYP1V3aFWXEIsmHliB67h8=;
 b=LGO7wHEL6rlVGwbHWkzUPaCQ1UDDwx25WNucsFr5TXngX7BvSAQohivl09phFtglnsgulf9JpYX02hmc/KJsSqmMfc2e/Ge3F4uGYh3SshY5ixYX0XXhGHY9vahsQQJmCsuRUAJOJ66Af8K7G6ORWFBncyUsv9IdSNCmSUe95wo=
Received: from BN9PR03CA0702.namprd03.prod.outlook.com (2603:10b6:408:ef::17)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:23 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::88) by BN9PR03CA0702.outlook.office365.com
 (2603:10b6:408:ef::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:22 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:19 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/32] drm/amdgpu: expose debug api for mes
Date: Wed, 25 Jan 2023 14:53:43 -0500
Message-ID: <20230125195401.4183544-15-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d3849a-cba2-4fec-6817-08daff0df4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: noeHaxceikWe8xCjMHypHOIUhtptH7UvrgKwbnLktJOyyfndGvB6ijtf5sNqrobEX+7q6pNEi+SoKbONNC+P30fZcqC2T6xYAtco741RnFsVjgrnlHjQKLQCEjOxfHffYQLYCubuKYfK67hk2UcQqiftRDn4oKdoO9R/uRzRfySewgrB/y5tbcRzAzepBfjiYmQpBy8VmnbJESLIUQl64d9FhxMsFoiNpeIYrT+iXR8oSfqhCNxhtxxpHg69reRWtSntoTeiAhGka7Q9/LbILtwoeSrGcceYItwLSi8PT9uPeXJs7NUUPID6NecifzPJFV+Ws6K+l32RHTe/X9vn9qYdbYmWYPBfPdamBs2Bi4CFidmXm5W6eICJdyyhwRXFhilkY8BO34ah9YO+SCg0G2KaCKJiUhV4/pdGDbpkwAi0PVIfUDr76YFmKDQ4wDJ7q9zNF2OEUYCWVhlvcQJm74CBGZYTMgNdlDNOTRJWKIgv1Vq1x62wdOn8r7pwaRMTZPnErX8Xpgq7atEz/eaWWfW21OlFhrSNhbNjLVxJWRGmtKLsdzDPrDgN0H9YKEA6rPEL+yXOOubagb+jS4JTDFMLFovcNSIe2LvAg0CjVH4bfrf8O+fOjknnOp+8c3AdRrW/L2RVmBf0fTAikVPn8+lgVRf7sixh+RUv0t5GSYd8O6CVdOmTz2RRFvwZEeGjgGakSHm2PWO3Yk6plJQkPYLwJadG7WuCRZ5wmO25NGs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199018)(36840700001)(40470700004)(46966006)(47076005)(82310400005)(86362001)(40460700003)(40480700001)(36756003)(81166007)(356005)(36860700001)(54906003)(82740400003)(110136005)(44832011)(2906002)(41300700001)(450100002)(4326008)(70586007)(8936002)(70206006)(8676002)(5660300002)(16526019)(186003)(26005)(1076003)(2616005)(316002)(7696005)(426003)(83380400001)(6666004)(478600001)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:22.9754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d3849a-cba2-4fec-6817-08daff0df4a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       | 32 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       | 20 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        | 12 +++++++
 drivers/gpu/drm/amd/include/mes_v11_api_def.h | 21 +++++++++++-
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 82e27bd4f038..4916e0b0156f 100644
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
index 62cdd2113135..fbacdc42efac 100644
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

