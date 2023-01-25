Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0367BB7A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB4810E85F;
	Wed, 25 Jan 2023 19:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642E910E81E;
 Wed, 25 Jan 2023 19:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/9rarcBTcfAS0L9n7yyYOmDYptr8i8kIWioi8+Qez3PS3ljvK1eMjCo1FlODAVStrFLTzc6qWmh45RHcspVg7rJDG7j/rrZhpvgpkYtno0QoS1mlzAAkbikcLsmKr+zLrg270qvrt83LlsKzW4UzzZR5lfEgtcccyDKH+/2bCPO5C7OfPbXt8Mk8uLoHFyBWHfc09BTTynkI61c9F0I6yt+CapLInBiW+PDo8VSodZkrXexWL2hv/hXtmBggzB9A3VSoUX7cEsKCbjmOL5jmgeCOWfHvSday7znketxPAJDbvmJPNhM+WR6X61gEaN8EJr2RQi5chkscK8Ctb2sIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ud+iSXY1BK7kidRam8mu3vamZZLoBZn1XbAZryBRVk=;
 b=VFsFNvz8Lzx5v1X3hn2x5wntVQvWgYFSaqV5bmTGy01xvojai5h3L/SfjVjCXdAF774MxJhNVA7cKo212CGl7ZEYx3n97ba54KK+LIO66JufJVlXKM8BXda+RkS7gFlxWW16mm6XsIhu0h9fQSZs8LWZnZEMfIOryMlHjEUYxMaiTAqDoQ+urn+iRveQpjYnGj+4A539cStTvPlGr2SiDi26IUgMgmJDUu7rknnBuEf2Yg3woqRGCACCMwHvzoHJB1uh/uTzApyezKzhbEg16PcBncbds+hlhu9WC1OoSS9eRNZxC++lVNpcLfqQ+uX3zpZEutY/69fAXtxnq4P5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ud+iSXY1BK7kidRam8mu3vamZZLoBZn1XbAZryBRVk=;
 b=4kmgmHFS/dgenDJ2f8I9aTQpgUWG967n2KvCKlp/EFvG7OTHZrBJLHI30Zyii4t3gp9b/pW4RyOjevBjFtWiwX3HM0i0FT4ZvHNJhqtkwPaRFBg6DTBPnM+N9Ou03o0zYjXUVzyupn9O010BkUjHGWe+l6an8UWX3zJIyBm36w8=
Received: from BN8PR15CA0001.namprd15.prod.outlook.com (2603:10b6:408:c0::14)
 by DM4PR12MB6422.namprd12.prod.outlook.com (2603:10b6:8:b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:25 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::c1) by BN8PR15CA0001.outlook.office365.com
 (2603:10b6:408:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:24 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:23 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 23/32] drm/amdkfd: add debug wave launch override operation
Date: Wed, 25 Jan 2023 14:53:52 -0500
Message-ID: <20230125195401.4183544-24-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|DM4PR12MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ea8ab0-e519-489f-5609-08daff0df5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQZ+wQQd3lfYfNuI60u1zb6p98pG+cF5Y/VivtAjFNp4Xz6svoF77GF2/ucTcYm7Kehn7TRd1Ug4FJDQJi+IcvR2H27J4dO//QnPShrYeuxI2Yy2hiHZIUfDsHP3h0c1JR9DH2N+RjLgmmrecprLHQMNc7cWWl6YHSoLBvjYOjrywZn56MVMdR9r0cfM1KEMyd0hmjoUyCk0BKfyfbk/flWEE6m1/LUFP6kGRDF01aSXn12aC3ASm/igNZci1OpqZondTLqEAgDGyzK7CND04ZBkz66IHHDYKX9SAAe/F2DaIAyAwFSDGTxw/0f1S2kXbRvBR51vZjOpNd5Hj+XxD4/IKZawI6MzJKofoklTcbyENe5RNuKwPpsmOio7iiNYMQMfeWi5+G2OdNpP7t22pap+knwx6nvLGhdp3fNAZxKEaTkhiqo8ZWwPO0GhH9/TgjDmmI05I8GBx03+Bcfk8P5kNME+2XQn5AKfduSooTfNUKm6sLuDvVRzO4hbxyS3YN99mc4vma2sGPLK/TfIRZVNuT0ktRA9KxDwzo2361H2sfjatH6hEkx2Jx48kVpk4auOAubq+/raoCJNoR74XSHPGYy/5jFGq1i1YosA5fdL4k4+vQCJfE0eKUinbfUE3l3yC7FwbLSELg107QwbOiJ3NMfF0ETwSobpWiVb3vj1ylKSHDCJyljtZ0zFlGG2ObMI6OoxGWquZyLY1FdG8ASEC+Fk8Wnm5YsiICuB7Uo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199018)(40470700004)(36840700001)(46966006)(478600001)(6666004)(47076005)(8936002)(426003)(41300700001)(81166007)(356005)(336012)(36756003)(44832011)(83380400001)(5660300002)(30864003)(2906002)(7696005)(82310400005)(186003)(26005)(54906003)(40460700003)(110136005)(16526019)(82740400003)(86362001)(1076003)(8676002)(70586007)(70206006)(4326008)(450100002)(2616005)(316002)(36860700001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:24.9410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ea8ab0-e519-489f-5609-08daff0df5cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6422
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

v3: v2 was reviewed but requesting re-review for GFX11 added supported.

v2: switch unsupported override mode return from EPERM to EINVAL to
support unique EPERM on PTRACE failure.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 47 ++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 55 ++++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    | 10 +++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  5 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 86 ++++++++++++++++++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 55 ++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h | 10 +++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  7 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 69 +++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  6 ++
 11 files changed, 350 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index a64a53f9efe6..84a9d9391ea4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -25,6 +25,7 @@
 #include "amdgpu_amdkfd_gfx_v9.h"
 #include "gc/gc_9_4_2_offset.h"
 #include "gc/gc_9_4_2_sh_mask.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 /**
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
@@ -81,6 +126,8 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
 	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
+	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index ef8befc31fc6..0405725e95e3 100644
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
index 2491402afd58..32a6e5fbeacd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -31,6 +31,7 @@
 #include "v10_structs.h"
 #include "nv.h"
 #include "nvd.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -801,6 +802,58 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
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
@@ -886,6 +939,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
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
index 34aeff692eba..3fb81e6e9422 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -643,6 +643,88 @@ static uint32_t kgd_gfx_v11_disable_debug_trap(struct amdgpu_device *adev,
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
@@ -660,5 +742,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info = NULL,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
 	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
-	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
+	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
+	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
+	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 4a8bd266d3f6..81643385512a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -38,6 +38,7 @@
 #include "soc15d.h"
 #include "gfx_v9_0.h"
 #include "amdgpu_amdkfd_gfx_v9.h"
+#include <uapi/linux/kfd_ioctl.h>
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -737,6 +738,58 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
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
@@ -1005,6 +1058,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
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
index 9b87ba351eff..28b9db5806f4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2896,6 +2896,13 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 3ea53aaa776b..a9b52f114ac6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -530,6 +530,75 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
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
index 81557579ab04..864eb01f8973 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -45,6 +45,12 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
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

