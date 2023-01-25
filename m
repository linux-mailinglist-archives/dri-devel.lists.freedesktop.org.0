Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD367BB55
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610CD10E82E;
	Wed, 25 Jan 2023 19:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82710E393;
 Wed, 25 Jan 2023 19:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWe0Nd8DMSNhmQRNPcTCv7XFl3dKCuCbFzTx4QiQkEKLNwSNnISsNQWJTDaqBk2cf4F+EsbriHJZYa4LFH3Pl/I4ObSUOSS+uejHXaIYgqW6Sl00Kg4TAc4f90oLAHMsKhqSkpRVrtywqlUd+vWLVANgyXAG458RRAP9yyVg8YH0GFF/H0rPJu/6en3S6y9mlP1jauLbDBtu/neUxEvjOYHp++GiSivt2Rav451+pAxC6W2lkaIxOINJ9w9S+anqakRtCfBNBnOCiGXQN8sDA8FZtVUoxOslSnkFrdpXjpAYfP+UexbZWXyYMtVcli+Yn14wAPD9iKDeb0HambrC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzGOPLlTpbLXT6DQQDAE1dvk63zHfA+IDV5fQGbaSUE=;
 b=MMoQZYs+3RUcHVeI/kOkb+bwxl0VqcyF7Ls5sSBND1eqdN5C/UPN9tFvjnUY1mE8Xbt/AVcDBuUMAaNO/pSKlTd0hftPkJ8OsLJAeS+Ix79+udqDEkTB9nRVa+sBgY8jS4iCUXleS5WgTLvb0tNgw21RAy8+ajElQ08ETxr90ucIPqmjD8NW5wf++EY2G2G8YS/wQgZSMczpsz4nl36c1q1sNCLnX0OmA8EKAJNny3asyi3PqlsZAaR1RroadfTe7XzsXjqqevZ3t7ixcUDIge1KtLP0jzpg1Gg8Ik7RRwcg/RD00qifCYfKaU1Wb6TrxVwIVFibGp5jzKpl5+7BTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzGOPLlTpbLXT6DQQDAE1dvk63zHfA+IDV5fQGbaSUE=;
 b=bhxIl8MZ2FqtDN9nBQl7zpwfyxd5RWopgfN/OnfcnhAqBMygl38Ui/GxhAKgzc3fTEorCFJLg9NVNhmZ6UxuXd9qKsJyXYbKl/I0oYgKbcpFwnlww0MGEqbRP7LMkn8W8SCiKXdri1cBF+KIMccns12HBW1p2DUq/SY541iB34w=
Received: from BN9PR03CA0788.namprd03.prod.outlook.com (2603:10b6:408:13f::13)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Wed, 25 Jan
 2023 19:54:19 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::1a) by BN9PR03CA0788.outlook.office365.com
 (2603:10b6:408:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:19 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:16 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/32] drm/amdgpu: add gfx10 hw debug mode enable and disable
 calls
Date: Wed, 25 Jan 2023 14:53:37 -0500
Message-ID: <20230125195401.4183544-9-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1cac53-35e1-4228-5898-08daff0df26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f+Rln2c+/MQ+0Dwv0NhKqsssn/Fm0V5cbF2Zeu5QUM2IHtDyVUthqvt4WpdI8K0YTplJLQkX7W+48MbzJjTTGZGr8FR+gJaR3LwbKtJvetqee3QYQdRWocowxRAHN9Lcw7BHrIpEIN7Ggtig31/PKXkEFDHsqvv+upjxmILq2cFvdqOIj+Z9swvaUBlca7mkzi6Sn8KdbVKHEAF40eCVwArgAS9/JYu1X6p3TBcyq3cDMe3bGr7MJC893DloOtHK+f8x5ltQqmXp9BleKvWR/Vt4lPABHsDhojxNBTKrGxN0A4yRcjzP0Omx7uAyhxB+iilMtjS3kikkrjcl/G8vnhCeSV/wDMu1sNlxXFgvlrAPt5c9xXIcjuwFzQ1W+dIfxRs+1aRCBkMQS8dKZ43XctbqNGHGRXzvOXiySzLo+/jG1r8IMtPJwD7CcgW5YAbBXr/q/Ozf5OHYKAlZ2yN7Wue28MspKzuUc7ZqzEKR23F80/0ko6LFECAzKNbjEx4WzZREVSvURPHZl7GaNa5J2KqNYCzwrQON6PsweC4+4AFaAYtJRObSbaY2vIIqqlYo68iZRO1mET4X8Z67pnl6sD2GH3mS/n+fPFMf9D1zGFUyte5pGr73a6PUi5vVU79JeeqDXR8Gw3cAEgJVzpCR7+Lvohsqph4Jel/gvtBQ2VotpldPfbboL9PMmYj/Fg6NTUU8v0ybkfJA/hkJ4+WVjcMlFX4C/FcKd0tTmiYLiVg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(46966006)(40470700004)(36840700001)(5660300002)(8936002)(478600001)(2906002)(70206006)(4326008)(70586007)(450100002)(8676002)(66899018)(41300700001)(1076003)(6666004)(7696005)(186003)(16526019)(26005)(2616005)(336012)(426003)(83380400001)(82310400005)(47076005)(82740400003)(316002)(54906003)(44832011)(110136005)(30864003)(81166007)(356005)(36756003)(86362001)(40460700003)(40480700001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:19.3009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1cac53-35e1-4228-5898-08daff0df26e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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

Similar to GFX9 debug devices, set the hardware debug mode by draining
the SPI appropriately prior the mode setting request.

Because GFX10 has waves allocated by the work group boundaray and each
SE's SPI instances do not communicate, the SPI drain time is much longer.
This long drain time will be fixed for GFX11 onwards.

Also remove a bunch of deprecated misplaced references for GFX10.3.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  95 +++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  28 ++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  | 147 +-----------------
 3 files changed, 126 insertions(+), 144 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 9378fc79e9ea..c09b45de02d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -708,6 +708,99 @@ static void set_vm_context_page_table_base(struct amdgpu_device *adev,
 	adev->gfxhub.funcs->setup_vm_pt_regs(adev, vmid, page_table_base);
 }
 
+/*
+ * GFX10 helper for wave launch stall requirements on debug trap setting.
+ *
+ * vmid:
+ *   Target VMID to stall/unstall.
+ *
+ * stall:
+ *   0-unstall wave launch (enable), 1-stall wave launch (disable).
+ *   After wavefront launch has been stalled, allocated waves must drain from
+ *   SPI in order for debug trap settings to take effect on those waves.
+ *   This is roughly a ~3500 clock cycle wait on SPI where a read on
+ *   SPI_GDBG_WAVE_CNTL translates to ~32 clock cycles.
+ *   KGD_GFX_V10_WAVE_LAUNCH_SPI_DRAIN_LATENCY indicates the number of reads required.
+ *
+ *   NOTE: We can afford to clear the entire STALL_VMID field on unstall
+ *   because current GFX10 chips cannot support multi-process debugging due to
+ *   trap configuration and masking being limited to global scope.  Always
+ *   assume single process conditions.
+ *
+ */
+
+#define KGD_GFX_V10_WAVE_LAUNCH_SPI_DRAIN_LATENCY	110
+static void kgd_gfx_v10_set_wave_launch_stall(struct amdgpu_device *adev, uint32_t vmid, bool stall)
+{
+	uint32_t data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+	int i;
+
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_VMID,
+							stall ? 1 << vmid : 0);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
+
+	if (!stall)
+		return;
+
+	for (i = 0; i < KGD_GFX_V10_WAVE_LAUNCH_SPI_DRAIN_LATENCY; i++)
+		RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+}
+
+uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
+				bool restore_dbg_registers,
+				uint32_t vmid)
+{
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
+
+	/* assume gfx off is disabled for the debug session if rlc restore not supported. */
+	if (restore_dbg_registers) {
+		uint32_t data = 0;
+
+		data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
+				VMID_SEL, 1 << vmid);
+		data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
+				TRAP_EN, 1);
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
+
+		kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
+
+		mutex_unlock(&adev->grbm_idx_mutex);
+
+		return 0;
+	}
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
+					bool keep_trap_enabled,
+					uint32_t vmid)
+{
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
 static void program_trap_handler_settings(struct amdgpu_device *adev,
 		uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
 {
@@ -750,5 +843,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info =
 			get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
+	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
+	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.program_trap_handler_settings = program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
new file mode 100644
index 000000000000..370d6c312981
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
+				      bool restore_dbg_registers,
+				      uint32_t vmid);
+uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
+					bool keep_trap_enabled,
+					uint32_t vmid);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index ba21ec6b35e0..73e3b9ae1fb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -22,6 +22,7 @@
 #include <linux/mmu_context.h>
 #include "amdgpu.h"
 #include "amdgpu_amdkfd.h"
+#include "amdgpu_amdkfd_gfx_v10.h"
 #include "gc/gc_10_3_0_offset.h"
 #include "gc/gc_10_3_0_sh_mask.h"
 #include "oss/osssys_5_0_0_offset.h"
@@ -652,142 +653,6 @@ static void program_trap_handler_settings_v10_3(struct amdgpu_device *adev,
 	unlock_srbm(adev);
 }
 
-#if 0
-uint32_t enable_debug_trap_v10_3(struct amdgpu_device *adev,
-				uint32_t trap_debug_wave_launch_mode,
-				uint32_t vmid)
-{
-	uint32_t data = 0;
-	uint32_t orig_wave_cntl_value;
-	uint32_t orig_stall_vmid;
-
-	mutex_lock(&adev->grbm_idx_mutex);
-
-	orig_wave_cntl_value = RREG32(SOC15_REG_OFFSET(GC,
-				0,
-				mmSPI_GDBG_WAVE_CNTL));
-	orig_stall_vmid = REG_GET_FIELD(orig_wave_cntl_value,
-			SPI_GDBG_WAVE_CNTL,
-			STALL_VMID);
-
-	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 1);
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
-
-	data = 0;
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
-
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), orig_stall_vmid);
-
-	mutex_unlock(&adev->grbm_idx_mutex);
-
-	return 0;
-}
-
-uint32_t disable_debug_trap_v10_3(struct amdgpu_device *adev)
-{
-	mutex_lock(&adev->grbm_idx_mutex);
-
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
-
-	mutex_unlock(&adev->grbm_idx_mutex);
-
-	return 0;
-}
-
-uint32_t set_wave_launch_trap_override_v10_3(struct amdgpu_device *adev,
-						uint32_t trap_override,
-						uint32_t trap_mask)
-{
-	uint32_t data = 0;
-
-	mutex_lock(&adev->grbm_idx_mutex);
-
-	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
-	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 1);
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
-
-	data = 0;
-	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK,
-			EXCP_EN, trap_mask);
-	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK,
-			REPLACE, trap_override);
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
-
-	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
-	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 0);
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
-
-	mutex_unlock(&adev->grbm_idx_mutex);
-
-	return 0;
-}
-
-uint32_t set_wave_launch_mode_v10_3(struct amdgpu_device *adev,
-					uint8_t wave_launch_mode,
-					uint32_t vmid)
-{
-	uint32_t data = 0;
-	bool is_stall_mode;
-	bool is_mode_set;
-
-	is_stall_mode = (wave_launch_mode == 4);
-	is_mode_set = (wave_launch_mode != 0 && wave_launch_mode != 4);
-
-	mutex_lock(&adev->grbm_idx_mutex);
-
-	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
-			VMID_MASK, is_mode_set ? 1 << vmid : 0);
-	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
-			MODE, is_mode_set ? wave_launch_mode : 0);
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
-
-	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
-	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL,
-			STALL_VMID, is_stall_mode ? 1 << vmid : 0);
-	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL,
-			STALL_RA, is_stall_mode ? 1 : 0);
-	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
-
-	mutex_unlock(&adev->grbm_idx_mutex);
-
-	return 0;
-}
-
-/* kgd_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
- * The values read are:
- *	ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
- *	atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics Offloads.
- *	wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
- *	gws_wait_time            -- Wait Count for Global Wave Syncs.
- *	que_sleep_wait_time      -- Wait Count for Dequeue Retry.
- *	sch_wave_wait_time       -- Wait Count for Scheduling Wave Message.
- *	sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
- *	deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
- */
-void get_iq_wait_times_v10_3(struct amdgpu_device *adev,
-					uint32_t *wait_times)
-
-{
-	*wait_times = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2));
-}
-
-void build_grace_period_packet_info_v10_3(struct amdgpu_device *adev,
-						uint32_t wait_times,
-						uint32_t grace_period,
-						uint32_t *reg_offset,
-						uint32_t *reg_data)
-{
-	*reg_data = wait_times;
-
-	*reg_data = REG_SET_FIELD(*reg_data,
-			CP_IQ_WAIT_TIME2,
-			SCH_WAVE,
-			grace_period);
-
-	*reg_offset = mmCP_IQ_WAIT_TIME2;
-}
-#endif
-
 const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.program_sh_mem_settings = program_sh_mem_settings_v10_3,
 	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v10_3,
@@ -805,12 +670,6 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info = get_atc_vmid_pasid_mapping_info_v10_3,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v10_3,
 	.program_trap_handler_settings = program_trap_handler_settings_v10_3,
-#if 0
-	.enable_debug_trap = enable_debug_trap_v10_3,
-	.disable_debug_trap = disable_debug_trap_v10_3,
-	.set_wave_launch_trap_override = set_wave_launch_trap_override_v10_3,
-	.set_wave_launch_mode = set_wave_launch_mode_v10_3,
-	.get_iq_wait_times = get_iq_wait_times_v10_3,
-	.build_grace_period_packet_info = build_grace_period_packet_info_v10_3,
-#endif
+	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
+	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap
 };
-- 
2.25.1

