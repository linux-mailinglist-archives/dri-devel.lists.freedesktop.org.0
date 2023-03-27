Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07E6CADAA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE0310E70C;
	Mon, 27 Mar 2023 18:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0DE10E6C9;
 Mon, 27 Mar 2023 18:44:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2ZO3mvpTwTkM+F0zpplb3VHpo9eWe1oNjJiju+ODIMa0Mc95qb0UZOv/EUD8v6/rMlg581cCccB5R+7WAoCbBhSF/axvYFkgU0OGcietaga+y4rdbMAtQuOWmhCRmGNMyyouA2xlSA4j89L8O9sDeN4IKhqHlOnfFurUlanbBHTUG3zHzCCTAdyzmshOTmwIztZQ0TcXD65q+A9jl8MHrhjsOAUX9ksoUuv6hM/p4URh6JyMLXX03hkAvMLYZ/GPmnOTZEEE7DPtLFOGR+PYGwCOOpAfxaJm4gXGUodzZzR6SbE4Uo+Mi4pW9I08uu5xBP/mT4tnYVT1cB3ToHWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DLr1s5ibOLL0mw0R+P4wCZ31VS3N6D6c09W4VaBj1g=;
 b=ffNRYoveESsXok6B7Ya4peJpZ7VTVWamALkiQexOkJHYyXbgRDa9kfgByy5DiU1UG3Pb6xwCYp7Rv6Pg5wk+pPTUeNGfPFjWUd2mF8Q34e2A2gk6O4w34NkvZiYMRehkA7+j/ZiIljUYwSZkTCWol6eKjCs2xaGgyBy3teD3BsRJaO/izIlh8wxi8TLIK2ptJA7Q4EOL1M1//NfMe/tMpUXxsLW8Mj82QH80rqxCVMUoeByOWy0The0vpU1a3M3rSaEcRDVJ/OJlX1MvanVO72p34AHeHgsoVMA6uPKOVgT+ApwBRZRqEF3sAw1QalkrL2Y2g0C80WNjKxcEJXWwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DLr1s5ibOLL0mw0R+P4wCZ31VS3N6D6c09W4VaBj1g=;
 b=qzvSQJICXr0YJ7eEDNwVbRMbVEt+Q04FzyFFDe3JGaCMCLW5KDwL8y6m1jN9DEXJk8kLwzC3h9en7oWNeNs2XTtWjwk2Il4uocTADBbMlilZCohO+DYSROK45L1H8+7WZ5awSvGvLCW72G3H48/5ki+ruSGBuKe+xi9DTCcx818=
Received: from CY5PR18CA0014.namprd18.prod.outlook.com (2603:10b6:930:5::13)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:58 +0000
Received: from CY4PEPF0000C97C.namprd02.prod.outlook.com
 (2603:10b6:930:5:cafe::60) by CY5PR18CA0014.outlook.office365.com
 (2603:10b6:930:5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97C.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:58 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:57 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/34] drm/amdkfd: add debug wave launch override operation
Date: Mon, 27 Mar 2023 14:43:29 -0400
Message-ID: <20230327184339.125016-24-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97C:EE_|DS7PR12MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f68df27-b7df-479a-e5d2-08db2ef339c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLglT9om0mQIChob229cD3f2MMWxc8+KTWJrNYfgTMZaZE+yLrGpbGleFlV8lvMi7tsKXKFINLEjtcpxIEHlP48wI3/iq+28dbE6w8q842myRfnQTYQoWpf7lw5RAr0DcocK3+5gwn7cuetmyykcSp1NpEkxgIcKbcuZucwHuWaaKgjUB2FfPTu0f4Q8EFLID47N8wnJwrNE+tb3DLZeQUwrQYD8/Xw6exKhi/p6FWau3fp5uzbmgVL/Xed9ynH304hMVm4kCJdrWX3cw2N+DPYbsiSTUaQYGXACW1KOqTx/urdzmUbqcQWKGZvZ7e1eCnhqlxCIu3i0VtS0uqpJACfg6q6z2VzIINPUYVCRHxY5A9Y8tX71nVElLIdG/E9f51KnjDfzSGhO9RmVrv48kXNSNK8slmd60imZ86lxAB5iZ16PFyNY3ORMWtvu42/PxUPEj2DY+qs5uhtU7Y/vMg09SsT00H8bkv9Gc5oBTsBA6beGsb46uMCM2hTZjtDe0J/z4RJRzopkyuLKagowkhyA9siblF9AmV9JgMOwbkYDHpAQzGUaYkQuSosLLuXteCgOhUtrcMLsYWlEGGl4gPXpxlooNIl/STlbOuIQRQ45akZqYuv1uMzyiOirZog80J3wLiAEOuUwHiKNZTyCvyGbO1UEdjfPnE3L0a8wzlrMkV764oNopjpSEWpc53oXoD9s2OqSkAejuv2m9iA82mUDesOD4oIH9n7Vp08DGNE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(81166007)(8676002)(70206006)(70586007)(4326008)(41300700001)(450100002)(16526019)(186003)(2906002)(83380400001)(82310400005)(30864003)(36756003)(36860700001)(5660300002)(44832011)(47076005)(356005)(86362001)(426003)(82740400003)(2616005)(336012)(40480700001)(6666004)(478600001)(54906003)(110136005)(7696005)(8936002)(26005)(1076003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:58.3139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f68df27-b7df-479a-e5d2-08db2ef339c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
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

v5: gfx off optimization to be done later

v4: move ioctl header reference here when it's actually required

v3: v2 was reviewed but requesting re-review for GFX11 added supported.

v2: switch unsupported override mode return from EPERM to EINVAL to
support unique EPERM on PTRACE failure.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
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
index 605387e55d33..8e2468d02001 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -32,6 +32,7 @@
 #include "v10_structs.h"
 #include "nv.h"
 #include "nvd.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -802,6 +803,58 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
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
@@ -887,6 +940,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 0abc1e805180..85c929fc2926 100644
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
index c57f2a6b6e23..ae3ead207df4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -673,5 +673,8 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
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
index dd282085d6c9..839094434a25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -30,6 +30,7 @@
 #include "soc15d.h"
 #include "v11_structs.h"
 #include "soc21.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -642,6 +643,88 @@ static uint32_t kgd_gfx_v11_disable_debug_trap(struct amdgpu_device *adev,
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
@@ -659,5 +742,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info = NULL,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
 	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
-	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
+	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index f231903bfec3..16ecfa9ab49c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -38,6 +38,7 @@
 #include "soc15d.h"
 #include "gfx_v9_0.h"
 #include "amdgpu_amdkfd_gfx_v9.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -736,6 +737,58 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
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
@@ -1004,6 +1057,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index c0866497cb5c..47cff392b434 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -64,6 +64,16 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
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
index aa90e5874ad2..10ded4141f9b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2970,6 +2970,13 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 9ed364a20398..3da287af9695 100644
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
+		if (!pdd->dev->shared_resources.enable_mes)
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
index f25dcf539f7b..8b3a3d2f4e40 100644
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

