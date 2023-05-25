Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1919A711253
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265D910E712;
	Thu, 25 May 2023 17:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2172010E6F1;
 Thu, 25 May 2023 17:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0rmurjFxUukkP5WxhAQquuKdY/OEz9v2NeZVe89xfliFt3zRCG7cbFZxcY5WYecwgikz1+e0DYCGI+WzCGdorFCCSLeDr0GlPLfvRxRAP5pGg3GRZN+5Qpirvw2lzI3N+/6LHB8MrJ6dazDb2AHeRC8bl0+24goDys9584darOgqzDKwDSTF7QjnJP7sG+mo6uPkErQr5fFcbILTj7zKA+4y6xvF6ErIrl0cC4AAW3QxJC6AmyCAmhcXqyKNPL5Itczdh3tm5rEzoXi+lgbxjpCTeE4x+mJPZtmqNSDpktXPSdSnBlUGsddTzH2PJ0bcvRQFc36gEJz62spVOIEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=454DI+Dk+z9qEusblOZhUmbqzg9u8HHIm4TwHa9VvzY=;
 b=bnpVJrUKPOBREBKsLFwjaSON9L2yzJtpxGTkSMqjyqYdAUFbQEkjITpy4S920YL/ruDs2TP4wdowGRxF03vltJyvM15MYuLmb/Z4Wmg3tP0xMUx/DfvtEe/Tn/Dz3GiZhQ3rapwyfRLMeA2u7Q/7c0kGcPoarpkh5qrU8xUX9VIM2Q7aY16Hu/GNxeSnIQYFg68UHnkbSVjbtAMjnywGxl8CWZ+B4zIaS6XGTFhN/mFPQPtOqHOt2VAwVMLx2xb3Pvxba+p5Y7raw5/HWsAu+nmDKDVj3f3tOks9DVptsq3ckYcNbhEhy5I4wH7OJ42YkYH8GMkuX9dwTHwhilOjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=454DI+Dk+z9qEusblOZhUmbqzg9u8HHIm4TwHa9VvzY=;
 b=WgotEDDIYuMx1RQhTCIU0dlP2D+zjFGOtU/0SDDvMjcCCBg7vnSi9uQd7hLpI36NkUb4/zfMj92Ow4AYDfaLLFc+Y+sMlSGOZl359UI92LjP04MiuGukQAIgIqCAjxsWY9NUs9lTtdmt6fEVe/PJEv3Jon2J2WOmAaBIo3qyhes=
Received: from MW4PR04CA0213.namprd04.prod.outlook.com (2603:10b6:303:87::8)
 by CH2PR12MB4135.namprd12.prod.outlook.com (2603:10b6:610:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 17:28:07 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::1d) by MW4PR04CA0213.outlook.office365.com
 (2603:10b6:303:87::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:06 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:04 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 24/33] drm/amdkfd: add debug wave launch override operation
Date: Thu, 25 May 2023 13:27:36 -0400
Message-ID: <20230525172745.702700-24-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|CH2PR12MB4135:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0c6b6b-12fc-414d-ca79-08db5d456735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uO+amkLqaZUL4ua7pO9Kg8CCww0LT8gLWFS2q/r+fM8DeHuoQ1b/IVYHXZ9taAaSJTrNN805ePSyMLE7Wab5aBYqy69T2B4L2IrYOARVfkeyFMcRTCX0sGaiO2NKYwmSj8xqolFwKCQiQ0HWlnqBsXdg7I5KFxEsXFzdgxTD3bZvlGBsoZH0aetxNWAL4OV7tO6smRy7mElmaeQuDdLKY+xCF8r1CsoWF5SK3c36FebTHS8N/sQFMJq6IYT7DnmanprHTU3QhRdYtUDUkywWRWbooVSz826UTHepILYBolRBtqvMep1kjYwFdTi+7z7KVLXNHtr4Yn+7ai4wW7SmO62xIDgFsAiPn4b7FhxHvBLc0O55AHt4smxDRtfYMqQV+BtlcIxHQ9kJKLArk4H8qHDtjhjmOdnTsa6y9XPdSqi7gHfvZ2Dgi0nIGEf8wtC7oyvkP4d6pw7BJhsiYsYCsgl+BmxDf+ZwYxoFzaMLzcOsaw1AMBzkptFNKoDpdu2JJNt6PRB7N5imnMxjiSesLjIGKH9qxP9Wbp/BYCW61Nnzq01IAmt31JqNcq23q47Ril8K8IAGhJIUEDWCDhAK+taa8aWaCWQE8DeOyj4YdZUJA7u9wPHGq32T6E9pmIZ6gJk0iHhZv0jJm5oZbIPmHBMFj/vTYotMb4FtlpI3sNS3ByZ5/4vDvtjj2SwkiTiBR1ShnxDzcLOLn2iVegly23hlN5FUIt6jZ+Y34dzZuCFFVGEBkM3RMgLv9F/Z6To+dqDJJVol/nrtGvyWv2pw3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(478600001)(450100002)(82740400003)(40460700003)(356005)(81166007)(8676002)(8936002)(5660300002)(40480700001)(2616005)(26005)(1076003)(83380400001)(70206006)(70586007)(36756003)(47076005)(426003)(336012)(316002)(82310400005)(186003)(2906002)(30864003)(16526019)(86362001)(41300700001)(7696005)(6636002)(6666004)(4326008)(44832011)(110136005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:06.7356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0c6b6b-12fc-414d-ca79-08db5d456735
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4135
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

This operation allows the debugger to override the enabled HW
exceptions on the device.

On debug devices that only support the debugging of a single process,
the HW exceptions are global and set through the SPI_GDBG_TRAP_MASK
register.
Because they are global, only address watch exceptions are allowed to
be enabled.  In other words, the debugger must preserve all non-address
watch exception states in normal mode operation by barring a full
replacement override or a non-address watch override request.

For multi-process debugging, all HW exception overrides are per-VMID so
all exceptions can be overridden or fully replaced.

In order for the debugger to know what is permissible, returned the
supported override mask back to the debugger along with the previously
enable overrides.

v2: fixup with new kfd_node struct reference for mes check

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 47 ++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 55 ++++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    | 10 +++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  5 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 87 ++++++++++++++++++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 55 ++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h | 10 +++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  7 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 69 +++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  6 ++
 11 files changed, 351 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index b811a0985050..d7881bbd828d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -25,6 +25,7 @@
 #include "amdgpu_amdkfd_gfx_v9.h"
 #include "gc/gc_9_4_2_offset.h"
 #include "gc/gc_9_4_2_sh_mask.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 /*
  * Returns TRAP_EN, EXCP_EN and EXCP_REPLACE.
@@ -62,6 +63,50 @@ static uint32_t kgd_aldebaran_disable_debug_trap(struct amdgpu_device *adev,
 	return data;
 }
 
+static int kgd_aldebaran_validate_trap_override_request(struct amdgpu_device *adev,
+							uint32_t trap_override,
+							uint32_t *trap_mask_supported)
+{
+	*trap_mask_supported &= KFD_DBG_TRAP_MASK_FP_INVALID |
+				KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL |
+				KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO |
+				KFD_DBG_TRAP_MASK_FP_OVERFLOW |
+				KFD_DBG_TRAP_MASK_FP_UNDERFLOW |
+				KFD_DBG_TRAP_MASK_FP_INEXACT |
+				KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO |
+				KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH |
+				KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION;
+
+	if (trap_override != KFD_DBG_TRAP_OVERRIDE_OR &&
+			trap_override != KFD_DBG_TRAP_OVERRIDE_REPLACE)
+		return -EPERM;
+
+	return 0;
+}
+
+/* returns TRAP_EN, EXCP_EN and EXCP_RPLACE. */
+static uint32_t kgd_aldebaran_set_wave_launch_trap_override(struct amdgpu_device *adev,
+					uint32_t vmid,
+					uint32_t trap_override,
+					uint32_t trap_mask_bits,
+					uint32_t trap_mask_request,
+					uint32_t *trap_mask_prev,
+					uint32_t kfd_dbg_trap_cntl_prev)
+
+{
+	uint32_t data = 0;
+
+	*trap_mask_prev = REG_GET_FIELD(kfd_dbg_trap_cntl_prev, SPI_GDBG_PER_VMID_CNTL, EXCP_EN);
+	trap_mask_bits = (trap_mask_bits & trap_mask_request) |
+		(*trap_mask_prev & ~trap_mask_request);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, trap_mask_bits);
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, trap_override);
+
+	return data;
+}
+
 const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
@@ -82,6 +127,8 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
 	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
 	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
+	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index a62bd0068515..ec2587664001 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -410,6 +410,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 				kgd_gfx_v9_set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_arcturus_enable_debug_trap,
 	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 98006c7021dd..7ea0362dcab3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -32,6 +32,7 @@
 #include "v10_structs.h"
 #include "nv.h"
 #include "nvd.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -803,6 +804,58 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
 	return 0;
 }
 
+int kgd_gfx_v10_validate_trap_override_request(struct amdgpu_device *adev,
+					      uint32_t trap_override,
+					      uint32_t *trap_mask_supported)
+{
+	*trap_mask_supported &= KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH;
+
+	/* The SPI_GDBG_TRAP_MASK register is global and affects all
+	 * processes. Only allow OR-ing the address-watch bit, since
+	 * this only affects processes under the debugger. Other bits
+	 * should stay 0 to avoid the debugger interfering with other
+	 * processes.
+	 */
+	if (trap_override != KFD_DBG_TRAP_OVERRIDE_OR)
+		return -EINVAL;
+
+	return 0;
+}
+
+uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
+					      uint32_t vmid,
+					      uint32_t trap_override,
+					      uint32_t trap_mask_bits,
+					      uint32_t trap_mask_request,
+					      uint32_t *trap_mask_prev,
+					      uint32_t kfd_dbg_trap_cntl_prev)
+{
+	uint32_t data, wave_cntl_prev;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	wave_cntl_prev = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
+
+	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK));
+	*trap_mask_prev = REG_GET_FIELD(data, SPI_GDBG_TRAP_MASK, EXCP_EN);
+
+	trap_mask_bits = (trap_mask_bits & trap_mask_request) |
+		(*trap_mask_prev & ~trap_mask_request);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK, EXCP_EN, trap_mask_bits);
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK, REPLACE, trap_override);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
+
+	/* We need to preserve wave launch mode stall settings. */
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), wave_cntl_prev);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
 /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -889,6 +942,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 1e993a213646..57339fa12807 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
@@ -26,6 +26,16 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
 uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
 					bool keep_trap_enabled,
 					uint32_t vmid);
+int kgd_gfx_v10_validate_trap_override_request(struct amdgpu_device *adev,
+					     uint32_t trap_override,
+					     uint32_t *trap_mask_supported);
+uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
+					     uint32_t vmid,
+					     uint32_t trap_override,
+					     uint32_t trap_mask_bits,
+					     uint32_t trap_mask_request,
+					     uint32_t *trap_mask_prev,
+					     uint32_t kfd_dbg_trap_cntl_prev);
 void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
 void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
 					       uint32_t wait_times,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index 387bdf4823c9..7120927fed15 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -675,5 +675,8 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
-	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap
+	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override
+
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index cc954cf248ca..ae0c4707919f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -30,6 +30,7 @@
 #include "soc15d.h"
 #include "v11_structs.h"
 #include "soc21.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -643,6 +644,88 @@ static uint32_t kgd_gfx_v11_disable_debug_trap(struct amdgpu_device *adev,
 	return data;
 }
 
+static int kgd_gfx_v11_validate_trap_override_request(struct amdgpu_device *adev,
+							uint32_t trap_override,
+							uint32_t *trap_mask_supported)
+{
+	*trap_mask_supported &= KFD_DBG_TRAP_MASK_FP_INVALID |
+				KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL |
+				KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO |
+				KFD_DBG_TRAP_MASK_FP_OVERFLOW |
+				KFD_DBG_TRAP_MASK_FP_UNDERFLOW |
+				KFD_DBG_TRAP_MASK_FP_INEXACT |
+				KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO |
+				KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH |
+				KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION;
+
+	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 4))
+		*trap_mask_supported |= KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START |
+					KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END;
+
+	if (trap_override != KFD_DBG_TRAP_OVERRIDE_OR &&
+			trap_override != KFD_DBG_TRAP_OVERRIDE_REPLACE)
+		return -EPERM;
+
+	return 0;
+}
+
+static uint32_t trap_mask_map_sw_to_hw(uint32_t mask)
+{
+	uint32_t trap_on_start = (mask & KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START) ? 1 : 0;
+	uint32_t trap_on_end = (mask & KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END) ? 1 : 0;
+	uint32_t excp_en = mask & (KFD_DBG_TRAP_MASK_FP_INVALID |
+			KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL |
+			KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO |
+			KFD_DBG_TRAP_MASK_FP_OVERFLOW |
+			KFD_DBG_TRAP_MASK_FP_UNDERFLOW |
+			KFD_DBG_TRAP_MASK_FP_INEXACT |
+			KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO |
+			KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH |
+			KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION);
+	uint32_t ret;
+
+	ret = REG_SET_FIELD(0, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, excp_en);
+	ret = REG_SET_FIELD(ret, SPI_GDBG_PER_VMID_CNTL, TRAP_ON_START, trap_on_start);
+	ret = REG_SET_FIELD(ret, SPI_GDBG_PER_VMID_CNTL, TRAP_ON_END, trap_on_end);
+
+	return ret;
+}
+
+static uint32_t trap_mask_map_hw_to_sw(uint32_t mask)
+{
+	uint32_t ret = REG_GET_FIELD(mask, SPI_GDBG_PER_VMID_CNTL, EXCP_EN);
+
+	if (REG_GET_FIELD(mask, SPI_GDBG_PER_VMID_CNTL, TRAP_ON_START))
+		ret |= KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START;
+
+	if (REG_GET_FIELD(mask, SPI_GDBG_PER_VMID_CNTL, TRAP_ON_END))
+		ret |= KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END;
+
+	return ret;
+}
+
+/* Returns TRAP_EN, EXCP_EN and EXCP_REPLACE. */
+static uint32_t kgd_gfx_v11_set_wave_launch_trap_override(struct amdgpu_device *adev,
+					uint32_t vmid,
+					uint32_t trap_override,
+					uint32_t trap_mask_bits,
+					uint32_t trap_mask_request,
+					uint32_t *trap_mask_prev,
+					uint32_t kfd_dbg_trap_cntl_prev)
+{
+	uint32_t data = 0;
+
+	*trap_mask_prev = trap_mask_map_hw_to_sw(kfd_dbg_trap_cntl_prev);
+
+	data = (trap_mask_bits & trap_mask_request) | (*trap_mask_prev & ~trap_mask_request);
+	data = trap_mask_map_sw_to_hw(data);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, trap_override);
+
+	return data;
+}
+
 const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.program_sh_mem_settings = program_sh_mem_settings_v11,
 	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
@@ -660,5 +743,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info = NULL,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
 	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
-	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
+	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 4a155d11b8c8..705669c26a1a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -38,6 +38,7 @@
 #include "soc15d.h"
 #include "gfx_v9_0.h"
 #include "amdgpu_amdkfd_gfx_v9.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -739,6 +740,58 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
 	return 0;
 }
 
+int kgd_gfx_v9_validate_trap_override_request(struct amdgpu_device *adev,
+					uint32_t trap_override,
+					uint32_t *trap_mask_supported)
+{
+	*trap_mask_supported &= KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH;
+
+	/* The SPI_GDBG_TRAP_MASK register is global and affects all
+	 * processes. Only allow OR-ing the address-watch bit, since
+	 * this only affects processes under the debugger. Other bits
+	 * should stay 0 to avoid the debugger interfering with other
+	 * processes.
+	 */
+	if (trap_override != KFD_DBG_TRAP_OVERRIDE_OR)
+		return -EINVAL;
+
+	return 0;
+}
+
+uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
+					     uint32_t vmid,
+					     uint32_t trap_override,
+					     uint32_t trap_mask_bits,
+					     uint32_t trap_mask_request,
+					     uint32_t *trap_mask_prev,
+					     uint32_t kfd_dbg_cntl_prev)
+{
+	uint32_t data, wave_cntl_prev;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	wave_cntl_prev = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK));
+	*trap_mask_prev = REG_GET_FIELD(data, SPI_GDBG_TRAP_MASK, EXCP_EN);
+
+	trap_mask_bits = (trap_mask_bits & trap_mask_request) |
+		(*trap_mask_prev & ~trap_mask_request);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK, EXCP_EN, trap_mask_bits);
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK, REPLACE, trap_override);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
+
+	/* We need to preserve wave launch mode stall settings. */
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), wave_cntl_prev);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
 /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -1008,6 +1061,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index fed5b7f18b1a..76812ddd35b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -71,6 +71,16 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
 uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
 					bool keep_trap_enabled,
 					uint32_t vmid);
+int kgd_gfx_v9_validate_trap_override_request(struct amdgpu_device *adev,
+					     uint32_t trap_override,
+					     uint32_t *trap_mask_supported);
+uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
+					     uint32_t vmid,
+					     uint32_t trap_override,
+					     uint32_t trap_mask_bits,
+					     uint32_t trap_mask_request,
+					     uint32_t *trap_mask_prev,
+					     uint32_t kfd_dbg_trap_cntl_prev);
 void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
 void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
 					       uint32_t wait_times,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 80d354eade35..e78103097162 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2984,6 +2984,13 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				args->set_exceptions_enabled.exception_mask);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
+		r = kfd_dbg_trap_set_wave_launch_override(target,
+				args->launch_override.override_mode,
+				args->launch_override.enable_mask,
+				args->launch_override.support_request_mask,
+				&args->launch_override.enable_mask,
+				&args->launch_override.support_request_mask);
+		break;
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
 	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
 	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 48a4e3cc2234..733390fb2459 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -522,6 +522,75 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 	return r;
 }
 
+static int kfd_dbg_validate_trap_override_request(struct kfd_process *p,
+						uint32_t trap_override,
+						uint32_t trap_mask_request,
+						uint32_t *trap_mask_supported)
+{
+	int i = 0;
+
+	*trap_mask_supported = 0xffffffff;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		int err = pdd->dev->kfd2kgd->validate_trap_override_request(
+								pdd->dev->adev,
+								trap_override,
+								trap_mask_supported);
+
+		if (err)
+			return err;
+	}
+
+	if (trap_mask_request & ~*trap_mask_supported)
+		return -EACCES;
+
+	return 0;
+}
+
+int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
+					uint32_t trap_override,
+					uint32_t trap_mask_bits,
+					uint32_t trap_mask_request,
+					uint32_t *trap_mask_prev,
+					uint32_t *trap_mask_supported)
+{
+	int r = 0, i;
+
+	r = kfd_dbg_validate_trap_override_request(target,
+						trap_override,
+						trap_mask_request,
+						trap_mask_supported);
+
+	if (r)
+		return r;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+		pdd->spi_dbg_override = pdd->dev->kfd2kgd->set_wave_launch_trap_override(
+				pdd->dev->adev,
+				pdd->dev->vm_info.last_vmid_kfd,
+				trap_override,
+				trap_mask_bits,
+				trap_mask_request,
+				trap_mask_prev,
+				pdd->spi_dbg_override);
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+		if (!pdd->dev->kfd->shared_resources.enable_mes)
+			r = debug_refresh_runlist(pdd->dev->dqm);
+		else
+			r = kfd_dbg_set_mes_debug_mode(pdd);
+
+		if (r)
+			break;
+	}
+
+	return r;
+}
+
 void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 					uint64_t exception_set_mask)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 6c1054a08872..c9245221aa76 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -42,6 +42,12 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
 			uint32_t *runtime_info_size);
+int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
+					uint32_t trap_override,
+					uint32_t trap_mask_bits,
+					uint32_t trap_mask_request,
+					uint32_t *trap_mask_prev,
+					uint32_t *trap_mask_supported);
 
 int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
 					unsigned int dev_id,
-- 
2.25.1

