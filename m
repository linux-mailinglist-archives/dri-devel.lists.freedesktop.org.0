Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340467BB4A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8CA10E819;
	Wed, 25 Jan 2023 19:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B9B10E38F;
 Wed, 25 Jan 2023 19:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6MnZE5SURtWb5AbdpVQK6/rUfTdT542I0Ana76kTGcN6HfStPCxR4t4RMnmSCNd3oqhnnWHTmwmjVliPP+P9tQgBluSy6fcALOTK0rcTSW4KAIphX3Q3cWsOrU7lVuo0C2k4N+0J1aTdoGm6JYJOb02if+1E5uEpJ6/dqtdbpvzuUCaD5fMB67UcO30WNaCoybALmk030gweXhJqUY2zxWAeOioCnUiGbk6ciIRChz5tcbfERdIsEvnQKyW/n/SbMwz7ne70xbCAfmM90fss4hX48NZ0ekjyVMvD5+KPLQpBpPZbx15u+b8B0fe7wuTvuNQFi90sMbCTbnhYznqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPIR7+TbqmPOPmUr3M27oaRGULNTxT6O/yzejZrLvFQ=;
 b=KtnfgfbSL3FZdB9hb4qKEoW+gUU4CHicIlceVVuTk+N8r//BHJxhBx85Od4btFJ3nYBNw/TNgrTPMxcbbY6QqIHbW2UkSGrpAFfn6tok6coeW+Dl2Pv/Gf8rcnjq/73HiUptJ9jUl9TjmzVstnDFQ9LsuvN5RCMhA+1DTbkUGwc3tD/KyslPH2UWlHDrvLomiURJHNkhayzcyJxo9YotHRsZ1cnX7q4Rna6/EMWNoQ9MInJVGWjlUk070zl132P8oXmRdEYG+LVI0lQctvw1EUzQ/dN79rr5zuSmR2TZj03f8kvT1NZCpb/Q1vYCxAF1iU/kxaRPooo1Jggm2AoAmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPIR7+TbqmPOPmUr3M27oaRGULNTxT6O/yzejZrLvFQ=;
 b=mzFVWNN68Vjvb9hget1bLXDG7IiWhzShSH+AvVyTd62D1aA0ZxsNzwNy6k6ntqNLAglm/Weo5aXqHoK2G0qRjl27avs7FNWf7m7Q/H5mrVB2zWC0UpDq3SyKoRpLlwlvPeOEW0N6y4flND8ytEKG84PouZC1B5wy7cBCJuzBxLc=
Received: from BN9PR03CA0789.namprd03.prod.outlook.com (2603:10b6:408:13f::14)
 by DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:18 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::23) by BN9PR03CA0789.outlook.office365.com
 (2603:10b6:408:13f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:18 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:15 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/32] drm/amdgpu: add gfx9 hw debug mode enable and disable
 calls
Date: Wed, 25 Jan 2023 14:53:35 -0500
Message-ID: <20230125195401.4183544-7-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|DM6PR12MB4252:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dec65ca-b162-46d6-4f25-08daff0df1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2CbQFkTArJQOCRvLPlh6Zu/xl84QhjTAgnhM9K8IhKuLQbmeI6jxbi89DVyg8neDrFmNWNdTqd2hsBhszRYOVo9q3GkfvCimJFDdy0pNe14lE45MFiKFDnYQ0c6UbpoTgfX2b/0qFAdYQfojFZkX578hTkXQHsy5GniVjLgmvH+x7QDlOHLy/GrBVIhMCN2taTRAd2QMsPDrhYOX35mzyVNcNpDQQY8886BUzIjOddH4dQ5U45AEOU7A442u+mR1YWdQ/dvVD/QlqHKzQzMmmAzd++YhGUt7wEyHyOWaUSabpc0AeQKDv3Zo1PpfQpoobOdU0h3e+r1unZQ3e6ToR04emJzDxch8EGf8LlFiHP+O9ViSzslGgORMwCW7V9RdyDqSR329D8yMJzWOGti18i5z38D/ROawzTYcCvtrtKCU2jwVGRv7SheiIShlqXeUDL/jI1q9/beEXGuB2oKHfKcfBNxMJCUMnhHXsXy2UJZbFTRSoYGpd6vDPEuJmBWmR058eEugOHbyZotFH3kxVmMZ6jI58EY73qD08C6WrVYM3d2ni68Oen/d8MUWAOc47sYjdYJ4QZomLgXaeAh3tmRnGjMgxeGh9hnAVhfolyQdRPBRSLfg+Xc2XFbHLOgPNKl8zYX2nKtN++V9Yx2CqD6zds9zmZoD4jgLuMdnW0fLB4jfJOmpksH1SqRuarhYDDuljcVZBpbwzadg/JTqC0JdZ8xY2uprc+cXIfh+j4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199018)(40470700004)(46966006)(36840700001)(2616005)(186003)(6666004)(81166007)(86362001)(26005)(110136005)(8936002)(8676002)(70586007)(450100002)(44832011)(4326008)(478600001)(16526019)(7696005)(1076003)(70206006)(41300700001)(316002)(5660300002)(2906002)(54906003)(82740400003)(83380400001)(36860700001)(426003)(82310400005)(356005)(40480700001)(36756003)(47076005)(336012)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:18.3479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dec65ca-b162-46d6-4f25-08daff0df1df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
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

Implement the per-device calls to enable or disable HW debug mode for
GFX9 prior to GFX9.4.1.

GFX9.4.1 and onward will require their own enable/disable sequence as
follow on patches.

When hardware debug mode setting is requested, waves will inherit
these settings in the Shader Processor Input's (SPI) Sequencer Global
Block (SQG). This means that the KGD must drain all waves from the SPI
into SQG (approximately 96 SPI clock cycles) prior to debug mode setting
to ensure that the order of operations that the debugger expects with
regards to debug mode setting transaction requests and wave inheritence
of that mode is upheld.

Also ensure that exception overrides are reset to their original state
prior to debug enable or disable.

v2: remove unnecessary static srbm lock renaming.
add comments to explain ignored arguments for debug trap enable and
disable.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 93 +++++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  9 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  3 +
 3 files changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index e92b93557c13..94a9fd9bd984 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -646,6 +646,97 @@ int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
 	return 0;
 }
 
+/*
+ * GFX9 helper for wave launch stall requirements on debug trap setting.
+ *
+ * vmid:
+ *   Target VMID to stall/unstall.
+ *
+ * stall:
+ *   0-unstall wave launch (enable), 1-stall wave launch (disable).
+ *   After wavefront launch has been stalled, allocated waves must drain from
+ *   SPI in order for debug trap settings to take effect on those waves.
+ *   This is roughly a ~96 clock cycle wait on SPI where a read on
+ *   SPI_GDBG_WAVE_CNTL translates to ~32 clock cycles.
+ *   KGD_GFX_V9_WAVE_LAUNCH_SPI_DRAIN_LATENCY indicates the number of reads required.
+ *
+ *   NOTE: We can afford to clear the entire STALL_VMID field on unstall
+ *   because GFX9.4.1 cannot support multi-process debugging due to trap
+ *   configuration and masking being limited to global scope.  Always assume
+ *   single process conditions.
+
+ */
+#define KGD_GFX_V9_WAVE_LAUNCH_SPI_DRAIN_LATENCY	3
+void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
+					uint32_t vmid,
+					bool stall)
+{
+	int i;
+	uint32_t data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1))
+		data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_VMID,
+							stall ? 1 << vmid : 0);
+	else
+		data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA,
+							stall ? 1 : 0);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
+
+	if (!stall)
+		return;
+
+	for (i = 0; i < KGD_GFX_V9_WAVE_LAUNCH_SPI_DRAIN_LATENCY; i++)
+		RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+}
+
+/**
+ * restore_dbg_reisters is ignored here but is a general interface requirement
+ * for devices that support GFXOFF and where the RLC save/restore list
+ * does not support hw registers for debugging i.e. the driver has to manually
+ * initialize the debug mode registers after it has disabled GFX off during the
+ * debug session.
+ */
+uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
+				bool restore_dbg_registers,
+				uint32_t vmid)
+{
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+/**
+ * keep_trap_enabled is ignored here but is a general interface requirement
+ * for devices that support multi-process debugging where the performance
+ * overhead from trap temporary setup needs to be bypassed when the debug
+ * session has ended.
+ */
+uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
+					bool keep_trap_enabled,
+					uint32_t vmid)
+{
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
 void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t page_table_base)
 {
@@ -871,6 +962,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info =
 			kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
+	.enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
+	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index c7ed3bc9053c..d39256162616 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -58,3 +58,12 @@ void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid,
 		int *pasid_wave_cnt, int *max_waves_per_cu);
 void kgd_gfx_v9_program_trap_handler_settings(struct amdgpu_device *adev,
 		uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr);
+void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
+					uint32_t vmid,
+					bool stall);
+uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
+				      bool restore_dbg_registers,
+				      uint32_t vmid);
+uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
+					bool keep_trap_enabled,
+					uint32_t vmid);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index b2217eb1399c..8aa7a3ad4e97 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -25,6 +25,9 @@
 
 #include "kfd_priv.h"
 
+void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
+					uint32_t vmid,
+					bool stall);
 int kfd_dbg_trap_disable(struct kfd_process *target);
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info,
-- 
2.25.1

