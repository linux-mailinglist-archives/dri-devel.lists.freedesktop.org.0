Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C26CADAD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1D110E70D;
	Mon, 27 Mar 2023 18:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D8A10E6C0;
 Mon, 27 Mar 2023 18:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEZyLRXvv96TTX7uG7UlnhugaffK0/Kjj/MljjKukzC9BEml3vijMg6amUzyFQ2XkZ4Gpni0K86JFUfpk0I9yzrnxMur3bWVl2wWDcn0yg+z6UUOetWnmRtH85i/f0h71HaKJaufFuz7jDHdKQUM95xne+1bI1s20+Nt+xtT8uW4dNmR3hFMlhKUWPUcqpEsYx6FM5C+JJNjt4d7cjESbrin2FTiv+zBBAruaj/bZcT4ZYpTl5i6wQY3epZ7ABisS2Vr4DbsM0RareyEvEMOveXnslDo2STilVkuipSf0vJlWq7iionVaEgcMOTo52PLke91L5708aB9FGQVXTdyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/Fp9LeFqle12MyKu8J/0ctVy5xyn7woiBsSn2G2V8A=;
 b=G87nGsO3bj7jWcf5acj+DhwU31KfDbJ3phLqt52iTK2FN3wknThmt6SrSjPEAd97PZdPmJodTKHfR0yBJQevNehuti7JKHPjaYeWZ83JgMqMuYQp25xhduvuisU2mXzUwOri3nA3rsCa9zezbwqlZP62t0brTpOxhhXC2FMutMTxqg4ZchbGKhT5b0c3MoiVi8ijVbaIIqStInTG4Xx6r7e74BQEGc51j3QCSSGCaRQRr8dRO3xuRIbohQh99HicYmjxuMKVCFjY6c4x3Iszxz2zN4d6VCFhdrGSAIHl4d/nPRVys3uDcX836grZHI8rRmcCLxA5ymhZjiS/IoyrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/Fp9LeFqle12MyKu8J/0ctVy5xyn7woiBsSn2G2V8A=;
 b=ANwmueOcduP8xoh0L4esL/KEfm5teRxynxVpeOR08iFZ6xtNXJxFBWjWhofV7kEW6wE03l5mXeTWF1xYJ4K8Rp+SEse/l6okSgpYljFbjFocc4sgN1Ryn054qLggOwMTnqIBc0xC2S2IGmfX5yG2ddzg/Uydy/VXG/jgNA9GCuo=
Received: from CY8PR02CA0002.namprd02.prod.outlook.com (2603:10b6:930:4d::16)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:52 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::d6) by CY8PR02CA0002.outlook.office365.com
 (2603:10b6:930:4d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:52 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:50 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/34] drm/amdgpu: add gfx9 hw debug mode enable and disable
 calls
Date: Mon, 27 Mar 2023 14:43:11 -0400
Message-ID: <20230327184339.125016-6-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f47e8c8-b1d0-4506-f04b-08db2ef33623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 995kIFCpNbizU90gSX6hKpfbBqkXeUmaiAnGurYLQuaNzwimLt7SVwjy6MjKttTaQJNNLlm2qWe06SkYmNpmomhDvqpzl3eDBx7TQzGf/8VKs4QwRlFJsrd0z7HvwKaqX2wPTlUDPzbnSSdu/BryONVJX6287S/OpOYLMSbnuXmF0rc+TpziX8Wo62eDknJ8Yb0AcJJu0B26m8WEpPeTngdnEfanS9IZqxrimzp1gGslcVAgvWqHQdIaIlUmJbEUjHNsa6vSgRX2GuamQjNYw+yQiVWcTLF3DhpRC9ZbeV2wDgmyQvYeOd7et8ZA/BpspsDfcfwJ9+ngROENb9XHDE+js3TD2Gf9O98vNFlMcsETYq70HphCK7MObeF6kbcjt6jnIJh5qv+nh3q+MPicHTnXfpj7/Yp3pVlNNJmGwBZLZkkM7rHQtQKgJMW2n1dzjtH1Nug7O/Sv5RjqCs0li1DRWmdCl6P1pdCadcIjEqhMRd+lGVwF2tul47xkrZqyH54jp+F9zWUI8srmSNQ1j1CiDvVavxU7y7o+33XYMEV803AIR9+Kkmy4YAV5zxbhQSGAng6WUklTAqQszsniqN7tp2oFUgb+Hhn6c5yJjY6A9OjwHpmpWn1I92Ni6PWvWDOcDQQC7v6WEnQukudipc/UkkIki5ZvS0cjY2YK0R52b1tjKxVg4Kws7gN99Ld6Kd84O0Yd2U365KxW74IC9NghgPW7Zbf9WhlBZjE6IYw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(2906002)(426003)(86362001)(83380400001)(47076005)(2616005)(336012)(4326008)(356005)(16526019)(40460700003)(70586007)(40480700001)(186003)(82740400003)(81166007)(8676002)(26005)(36860700001)(5660300002)(41300700001)(36756003)(70206006)(8936002)(1076003)(44832011)(316002)(6666004)(450100002)(110136005)(7696005)(54906003)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:52.2219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f47e8c8-b1d0-4506-f04b-08db2ef33623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
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

v3: fixup typo and comment format complaints from kern bot.
Also remove unrequired gfx9 wave_launch_stall from kfd_debug.h

v2: remove unnecessary static srbm lock renaming.
add comments to explain ignored arguments for debug trap enable and
disable.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 92 +++++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  9 ++
 2 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index e92b93557c13..e0bd61e16847 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -646,6 +646,96 @@ int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
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
+/*
+ * restore_dbg_registers is ignored here but is a general interface requirement
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
+/*
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
@@ -871,6 +961,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
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
-- 
2.25.1

