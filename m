Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C546CADA9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6D710E709;
	Mon, 27 Mar 2023 18:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2078.outbound.protection.outlook.com [40.107.96.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011C410E6BD;
 Mon, 27 Mar 2023 18:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSQrizsxM/XGPiujiW5gEji9aAzCjqQM/0Oup6xrXGFuTo78qd63L5irLfByy6pMBEqXTPwDswAsAZOG6O7OSMXCxFdMdvgDIVOT0X1mwyvSVTAFvzlM7vJSMtJm5X9dMY5VqU3OQZPeXagPHpilukbhevAqEvM/2zGnadrGUuxKCwFl9wmV8lft+/RqhUUjkYi430+nnvcWgDvyuSMRYoCpdnWA5tpbhMva/zyBQWlJmlQYeJamah084FqT98e2XMfvVq7QsXpoXvkUu/xfvkrG2p9KuYq3YC4R6BacZBaHGIFii7dJS16QwEvoBR0dmc8inW7NyEpqQjL3aaUX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhBVQcbSDSmWh4jcckqn/wb5YwD6Ohob6j96WT1IXAE=;
 b=fo4OYqPBQXoIFiEdoOH2GtfHsl1ucIE/BLnvjYoBT+99OzrYEUAT5GyzLqKXN8Q176YiszMl05vV7KQtgW3RguFGWWU+Fk9GDMczXOe9GMdi3Md1N29ObAWSJ2NWUDzImSI/xYPG1vXcuUqA1HFR8wZBWumMHmIfDt6HdpZ+sJ+kcPuaaVqOrsH10PWI9K9mB3IHSofqnyJkzbz97v3umv/z8h9pp+/XTSpiGhHOMgzB1uI+wtDFA/llusptFZkJ9aGO481NsjJvLORPoBIa7kCElBRNln2gtHpd1K4zLne+W98Ha2kb900jJBFd6gvbIYtGTX/MUcvgYOMjtCG98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhBVQcbSDSmWh4jcckqn/wb5YwD6Ohob6j96WT1IXAE=;
 b=EIhbWzjkT1Zcj/Shut1mAqVXIPgEwMLZiSaRLnTaSuQfXe0piPWFNME5rx8G01KeLSUdX0JVWwGPy21QWSAVUB1qZox58Mmni2519S7fkWxg5VwqWmO2jI6mEN55yqIeyh3xvikajMjk+lLwKyVm/rGUPMT24Xga/IYtl2ll7yw=
Received: from CY5PR18CA0028.namprd18.prod.outlook.com (2603:10b6:930:5::33)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:43:54 +0000
Received: from CY4PEPF0000C97C.namprd02.prod.outlook.com
 (2603:10b6:930:5:cafe::73) by CY5PR18CA0028.outlook.office365.com
 (2603:10b6:930:5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97C.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:54 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:51 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/34] drm/amdgpu: add gfx10 hw debug mode enable and disable
 calls
Date: Mon, 27 Mar 2023 14:43:14 -0400
Message-ID: <20230327184339.125016-9-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97C:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: a33b24e9-ed8b-4784-b5f5-08db2ef3374d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0mabkWY9wmxpiPvbbZIzPC+M23Z2y3YBkRztOgq2LWsAfHywgmxnq8Noo5wO/4SJgFXIlznykpfpcs2Ql1FsGWYtUQevlTlTTVgmGem6wAaWpPGfpPHk2MieFktfZsIJBnc0zyUOiWdTit3qgBWD1s/uwENdAbcuMU9u9FRbkrb1j4EEru9rcXB2FhQAaisZVAHMeDuoT5c9tjt/aiFvKKCRX4YzKz6nHQV9SHJy+43OnW2aZ8XsPjN9vunKyhn3bKw8KzDRXkfCJLFS5+8mwR2QZCxLdgCKJ2NaCk/73aKJnaEjho4gMUP5cc9ES68EsGJ9DbJ6L4l/zbMzojWAHDS/qknkcqSrY5pBZ1HaRWiDl9KrVQRnDzf4WaPQf681VDGZli3JDvtF9aqH8PsNZBYHGh4Tptn9AvZEWxui3tRKKFlok9MPKf1G6xUIwYVsaOsnsuKLuYrA9CjgfRH+dTvUKWEKB2fVaWlSSzTH7Or+bazCmBtja1rqQCVbX0jnLZ0BDq4ooiTjMNnVEYEEjCoWjxMx9yjT+eOPXoRbyziOV+OCV8J6bm6m5Xp8qv30o0WrK2++4KuymncUxiYzNTvL0EJzZNG3KO8g1pCawz2d/6BG75M0scbx/APWxiKark44av9OuTrv6oJYiRgaEFKnOGeUmCQ8gUw+lB/nklAKnwTgbZrrryMlBPPt2Z/RGxM0PNmcnGARg8gHtKa7ak1EdawUOcYUXfX1c8+jTss=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(16526019)(26005)(426003)(1076003)(40480700001)(41300700001)(186003)(6666004)(66899021)(7696005)(83380400001)(336012)(2616005)(47076005)(478600001)(54906003)(110136005)(316002)(36860700001)(40460700003)(4326008)(70206006)(450100002)(44832011)(2906002)(30864003)(70586007)(8676002)(81166007)(82740400003)(356005)(36756003)(82310400005)(86362001)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:54.1733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a33b24e9-ed8b-4784-b5f5-08db2ef3374d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001
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

Similar to GFX9 debug devices, set the hardware debug mode by draining
the SPI appropriately prior the mode setting request.

Because GFX10 has waves allocated by the work group boundary and each
SE's SPI instances do not communicate, the SPI drain time is much longer.
This long drain time will be fixed for GFX11 onwards.

Also remove a bunch of deprecated misplaced references for GFX10.3.

v2: fix 'boundaray' typo in description and added gfx10 kgd2kfd header
to avoid kern bot missing prototype complaint.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  96 ++++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  28 ++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  | 147 +-----------------
 3 files changed, 127 insertions(+), 144 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 9378fc79e9ea..969015281510 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -21,6 +21,7 @@
  */
 #include "amdgpu.h"
 #include "amdgpu_amdkfd.h"
+#include "amdgpu_amdkfd_gfx_v10.h"
 #include "gc/gc_10_1_0_offset.h"
 #include "gc/gc_10_1_0_sh_mask.h"
 #include "athub/athub_2_0_0_offset.h"
@@ -708,6 +709,99 @@ static void set_vm_context_page_table_base(struct amdgpu_device *adev,
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
@@ -750,5 +844,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
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

