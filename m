Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C94471123C
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B672310E6F0;
	Thu, 25 May 2023 17:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6939C10E6DF;
 Thu, 25 May 2023 17:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5/gA40fX9KyvIf+xNyCjhZELtITmfTbntqxAzDUNvwpjG9yHBO5+/busbgnoDynChc3c6JvO+NrrFDC+s9CwykqZb06B4/EGQ4hgq8lRNgP+U9JQurLNn4kdemPZJ3MlgD8r/V5oD0p6tOGJJLev59fmMkz3jLCY5zqM7ZpHvTztpOIZAOTlbo7jNVRku5DKSPFyjELasP2mALn/X9juXYzlujAVKQ13RddIGzW+Wf97NEVpWUKaybDX6RLox431nO67bxOsIh+xDVahwegyj1oBQ6jPP26TG0hTU3fhxSB4aJGU9nTu1F0SR/BEEFBiAHTUuz3pkGO+a6TgAIAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agbsDHaqnjC/x8euI/92One+39trvzfTU4SkUxqmiuQ=;
 b=oJsyhRNwOwyALmaVpV45JqJL+mdUyB+qDthQN5iRXhoOtN1lmfcSHVtTzYIu2KKjZfZtfYoiVhU4RbYtPwluzKySLkApQGBSt3NBxwfvc3F5Z3Fe8ELwMtF+qlqOZI9gsB3Ji53wR6uk3oAZzgCnuj2WjQxVg2YsmHFCGPDxsaLLljjRxLQuvdWOOSsRjAwrWxRw8XyQFXs5XY0umnBtgh8K2hjBUycZir9oDTuHHeAk8EccoRloBSI/zEGDU5KD93dlLXanspUstVYcKBjOgCos89ApxLMdMYTSxD7DE5pQa+StD1774qlFIrVKoNyFNnJbizGg8/LyjbMVUOI72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agbsDHaqnjC/x8euI/92One+39trvzfTU4SkUxqmiuQ=;
 b=X2Ekr+OEsVVmG3D/rh2csYxOlidhLimyuQMh+g8mVYJpHUMTjlduUd1i86OFfVnCqsIFXwS51nFKBLzaQ8Kah1uOewbh572D0euzoKDZ/G1NZSS3mCrhr3o5Qx8noyeaWMafBRkc6jIvszYJABYD8I+zV5BomQm6d8ErUTmN/Cs=
Received: from MW4PR03CA0139.namprd03.prod.outlook.com (2603:10b6:303:8c::24)
 by IA1PR12MB7759.namprd12.prod.outlook.com (2603:10b6:208:420::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 17:28:00 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::b3) by MW4PR03CA0139.outlook.office365.com
 (2603:10b6:303:8c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:00 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:56 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 06/33] drm/amdgpu: add gfx9 hw debug mode enable and disable
 calls
Date: Thu, 25 May 2023 13:27:18 -0400
Message-ID: <20230525172745.702700-6-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|IA1PR12MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 12762542-cdbb-4114-aa09-08db5d456353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8JoSJn5RLcxtybUEVVj8paYx1E+Zl01U+4f2fd/iUZl11alziZP75bXccIffVKI+QNG0x+t3BZHYzC3CwUFbPrzDzXFVKHyHS9eqjXroenb3/XGHidgZMhsrV4KdIlQNWIhHmKPpWG03wt14nN2L/NJH2A72OyVGvKJ49CNU9tZaLt7oEbT78YPQJFC2fQsgQ5Zqti8parZ28sIZ1wZb/kN39/R04pUEo/uHSopyh4jwWacvZbYEKhmkjDf8nmffaVEsd3HTmPWwKIG9Ta3mxyf/YdoY4BNujiTQ6xXxUnmdCfzQzpv9rFhk587GhwbERPgN9f0fSsEmOOii2LA6De/HBkb0CJQ4587EvpIqH1OxU4ifybwZ8HqmtwV6y4cB8bK4tFQehqBXpcBl81VcSf5XrdQlXayQ3R8LqkZXOGhwSv4ys5nD21XdqNIvxiOMJDPLNe9D4TNtWh8AXIODtG+6XzSlXJUYNn+hRVrE8QFGf7suNw5pylw26LJLbFrPeN4fSc4HhltpWd2Grav2vzoS4rj1Bd1Rcmp6haGXGmLsB8UrVWIDSJ2d9aG/GHS5zPYHZb7OqmJD8lvSxooBIEA53uHzu1xLxRVTDLfAohwweY6JRWvgWLd11xZPPjSGmHdQm5IA0gz3Ga822Bs0wv/n96ljXFU8s+uqKZLcc8+QBIduZrtSnlic6aBKXmfRVEaMiB9fzIGIedU4Q3U7+z+atEtTfXvR/DnjAqIDQwUix9P3SPgRSwztlffqpHsgmhWwPb8QNNENNI2BnKOsWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(36860700001)(2616005)(86362001)(47076005)(83380400001)(186003)(336012)(426003)(16526019)(81166007)(40480700001)(82740400003)(7696005)(36756003)(356005)(8936002)(5660300002)(8676002)(41300700001)(44832011)(6666004)(1076003)(26005)(450100002)(110136005)(70586007)(478600001)(6636002)(70206006)(4326008)(316002)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:00.2205 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12762542-cdbb-4114-aa09-08db5d456353
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7759
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

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 92 +++++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  9 ++
 2 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 9fa9aab22fe9..64da5995170c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -649,6 +649,96 @@ int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
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
@@ -875,6 +965,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info =
 			kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
+	.enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
+	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index a241299f4fbc..9588ff055393 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -64,3 +64,12 @@ void kgd_gfx_v9_acquire_queue(struct amdgpu_device *adev, uint32_t pipe_id,
 uint64_t kgd_gfx_v9_get_queue_mask(struct amdgpu_device *adev,
 				uint32_t pipe_id, uint32_t queue_id);
 void kgd_gfx_v9_release_queue(struct amdgpu_device *adev, uint32_t inst);
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

