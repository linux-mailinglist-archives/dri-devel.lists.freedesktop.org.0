Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BABF711240
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A94A10E6F1;
	Thu, 25 May 2023 17:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7F010E6EA;
 Thu, 25 May 2023 17:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyOTtQNIwnUUaC699JDGzNqj+V4vouUWPYKObvQ9wb1xkeKNa8KJs08EP7oGJwfa7dV/iTkbSX82m5F01htf0y+MuNle2oiJpA72qQ8C2xGAgWtTWv5r1rKfwglBvGGm6X/4Nygw0DJpbAi+YTxZfpjtIWYAapmZqibaDk7jctPWKE4CuR6/U+mIVeDVVy8yYOkQRS/uIoHPWktsZFdWx+7N1x/OZ9i5zMFE4T8KKRDLvATIYxozB5BJjGuJ/GU8+alzGNk8pTKlla84rUVgtk7zSaNGB2iZgEoXCjK8Vsit/tAq91QwQ6atlnTqXTbG41xOYR5K8o1VzJeXnxyUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jje/BjeXEfiEPtTT18zCFhZebyvWMycD5HigJJORm1M=;
 b=TUr+D+ria5hwmgPWZ/Apn71fhXEbSS4B1Zaeyw/UfOYx6XgFlX5NjeMtf2/3KUjO/t8C6XXeC5ZFe/dZqjzzf/lGDj+IgZxNPmBvu/ld/9qqM/SuUqnbtuiFEd+YQZcyjpIDObaEz1QJF8khfSrA5+3nOQ6UI5/4aM5RABV2l1PHft2wOVJaMCJZPx/7q3sUpIwLoMusp56xm8f6UZ9frnjY2L25sp8ghBzfTh8twpR6BYWw2TdkyNIQS2HhY+dRtLYe9x3+sE0JsXxvvNEvKjp+KsbI26C67JKtwVXc8YLe9WSaH+U9gZkuecrryR2oy0JcPFpktptX7KR5C7TNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jje/BjeXEfiEPtTT18zCFhZebyvWMycD5HigJJORm1M=;
 b=nh2HNHN8kD4qgTReobzHh33dtYKK1OVRe+Zt+6FDi6Pgs0PZQ5/X1OEXmErX+H7LyXMDzHEhqiv2k7OBy4Y6rSDMR055eIKPwxQvtC1cUWu8qNnQUt1EKW+FfrvRiLz8M6wiSUyryEHfi7nWfxXw5RRQ6n3kfMRufodQnZbXHDc=
Received: from MW4PR04CA0228.namprd04.prod.outlook.com (2603:10b6:303:87::23)
 by SA1PR12MB7294.namprd12.prod.outlook.com (2603:10b6:806:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 17:28:01 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::6a) by MW4PR04CA0228.outlook.office365.com
 (2603:10b6:303:87::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:01 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:56 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 07/33] drm/amdgpu: add gfx9.4.1 hw debug mode enable and
 disable calls
Date: Thu, 25 May 2023 13:27:19 -0400
Message-ID: <20230525172745.702700-7-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|SA1PR12MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f80003e-c6a0-4d30-8b09-08db5d4563db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ESZiYPRHezYX0kajDByLhQ8b/1qS3QnZqIVnr17b1Lq/JSk0VMe/8RABeC7ITEVYwdeMxhQH9xC6GNlE8Ry2XPUG4c6Q85QxXlIf4GUHZ81qY1R03llxhbbvfy6vohll1KJ8RyD2mixOKBYM5wJS7rzAqpyLr5bn6Q5H9XvaJPZmDvFUK6ntb8eACg604dU6sypOzElnKfFFZfpLi3EifpEdfU8ofJjsga/sVNgqepfCh5ZLLgZtpd5/EFpg/0sp7YGNr2G/oA882BVGkIcNQ30h+/nsmmOCXMbWUuvujfT79uGYA1nqgPr5jFCpK6RtkIlTY6tOnQYBYuH9HAIjvu4/2QdBBQ3/2eSRJcq/nL5pKIQId94rAWwoX9+xv8exVpn/yuyOWHBdGQkoFx/8+7fiAI8V1oXh4NRNJVnqCC5xH0GM7UQ2uHB2HJ9eGINfUuXoZZgwoesa+WrfbqiXkW0gLYndfRLIgTt7DjznArZwSnuVMgSpV4WyZDL5kpnz2bBxth1xcY1wgWXFC5EGAmiOS/Skl3K9EhzNT1WwmRgU5aI0hknxHCdHoTkMyNhusT/8+SEg++64iR4pPw0h1mZQI205GjXUYQE6gmxBYORUZ9BU/uVAuNFBydK0/jwTq3uGmsK/W4giw3ODAAxRshBQlZ1h2LXCMoFNjhlWmnGX0X3lQymoIeRm2s5np2gzOOisHO4KQWT88RjBauZjuuqXQ4tooZajSJ7VC88CFPnVRVFC+381ekvi/ZE4lA1kJmTt31ajtN8BWkgcS5gUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(8676002)(40480700001)(8936002)(40460700003)(26005)(186003)(44832011)(41300700001)(16526019)(5660300002)(83380400001)(82740400003)(82310400005)(110136005)(478600001)(356005)(86362001)(70206006)(70586007)(36860700001)(81166007)(4326008)(316002)(1076003)(6636002)(2616005)(7696005)(6666004)(36756003)(47076005)(2906002)(426003)(336012)(450100002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:01.1109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f80003e-c6a0-4d30-8b09-08db5d4563db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7294
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

On GFX9.4.1, the implicit wait count instruction on s_barrier is
disabled by default in the driver during normal operation for
performance requirements.

There is a hardware bug in GFX9.4.1 where if the implicit wait count
instruction after an s_barrier instruction is disabled, any wave that
hits an exception may step over the s_barrier when returning from the
trap handler with the barrier logic having no ability to be
aware of this, thereby causing other waves to wait at the barrier
indefinitely resulting in a shader hang.  This bug has been corrected
for GFX9.4.2 and onward.

Since the debugger subscribes to hardware exceptions, in order to avoid
this bug, the debugger must enable implicit wait count on s_barrier
for a debug session and disable it on detach.

In order to change this setting in the in the device global SQ_CONFIG
register, the GFX pipeline must be idle.  GFX9.4.1 as a compute device
will either dispatch work through the compute ring buffers used for
image post processing or through the hardware scheduler by the KFD.

Have the KGD suspend and drain the compute ring buffer, then suspend the
hardware scheduler and block any future KFD process job requests before
changing the implicit wait count setting.  Once set, resume all work.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   | 116 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |   4 +-
 3 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 5af954abd5ba..7c49cdc37d95 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1065,6 +1065,9 @@ struct amdgpu_device {
 	struct pci_saved_state          *pci_state;
 	pci_channel_state_t		pci_channel_state;
 
+	/* Track auto wait count on s_barrier settings */
+	bool				barrier_has_auto_waitcnt;
+
 	struct amdgpu_reset_control     *reset_cntl;
 	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 4191af5a3f13..d2918e5c0dea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -26,6 +26,7 @@
 #include "amdgpu.h"
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_amdkfd_arcturus.h"
+#include "amdgpu_reset.h"
 #include "sdma0/sdma0_4_2_2_offset.h"
 #include "sdma0/sdma0_4_2_2_sh_mask.h"
 #include "sdma1/sdma1_4_2_2_offset.h"
@@ -48,6 +49,8 @@
 #include "amdgpu_amdkfd_gfx_v9.h"
 #include "gfxhub_v1_0.h"
 #include "mmhub_v9_4.h"
+#include "gc/gc_9_0_offset.h"
+#include "gc/gc_9_0_sh_mask.h"
 
 #define HQD_N_REGS 56
 #define DUMP_REG(addr) do {				\
@@ -276,6 +279,117 @@ int kgd_arcturus_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
+/*
+ * Helper used to suspend/resume gfx pipe for image post process work to set
+ * barrier behaviour.
+ */
+static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool suspend)
+{
+	int i, r = 0;
+
+	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
+		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
+
+		if (!(ring && ring->sched.thread))
+			continue;
+
+		/* stop secheduler and drain ring. */
+		if (suspend) {
+			drm_sched_stop(&ring->sched, NULL);
+			r = amdgpu_fence_wait_empty(ring);
+			if (r)
+				goto out;
+		} else {
+			drm_sched_start(&ring->sched, false);
+		}
+	}
+
+out:
+	/* return on resume or failure to drain rings. */
+	if (!suspend || r)
+		return r;
+
+	return amdgpu_device_ip_wait_for_idle(adev, GC_HWIP);
+}
+
+static void set_barrier_auto_waitcnt(struct amdgpu_device *adev, bool enable_waitcnt)
+{
+	uint32_t data;
+
+	WRITE_ONCE(adev->barrier_has_auto_waitcnt, enable_waitcnt);
+
+	if (!down_read_trylock(&adev->reset_domain->sem))
+		return;
+
+	amdgpu_amdkfd_suspend(adev, false);
+
+	if (suspend_resume_compute_scheduler(adev, true))
+		goto out;
+
+	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CONFIG));
+	data = REG_SET_FIELD(data, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
+						!enable_waitcnt);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CONFIG), data);
+
+out:
+	suspend_resume_compute_scheduler(adev, false);
+
+	amdgpu_amdkfd_resume(adev, false);
+
+	up_read(&adev->reset_domain->sem);
+}
+
+/*
+ * restore_dbg_registers is ignored here but is a general interface requirement
+ * for devices that support GFXOFF and where the RLC save/restore list
+ * does not support hw registers for debugging i.e. the driver has to manually
+ * initialize the debug mode registers after it has disabled GFX off during the
+ * debug session.
+ */
+static uint32_t kgd_arcturus_enable_debug_trap(struct amdgpu_device *adev,
+				bool restore_dbg_registers,
+				uint32_t vmid)
+{
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	set_barrier_auto_waitcnt(adev, true);
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
+static uint32_t kgd_arcturus_disable_debug_trap(struct amdgpu_device *adev,
+					bool keep_trap_enabled,
+					uint32_t vmid)
+{
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	set_barrier_auto_waitcnt(adev, false);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
 const struct kfd2kgd_calls arcturus_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
@@ -294,6 +408,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 				kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base =
 				kgd_gfx_v9_set_vm_context_page_table_base,
+	.enable_debug_trap = kgd_arcturus_enable_debug_trap,
+	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 7f17e0061027..f092a1dbdb56 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2390,8 +2390,8 @@ static void gfx_v9_0_init_sq_config(struct amdgpu_device *adev)
 	switch (adev->ip_versions[GC_HWIP][0]) {
 	case IP_VERSION(9, 4, 1):
 		tmp = RREG32_SOC15(GC, 0, mmSQ_CONFIG);
-		tmp = REG_SET_FIELD(tmp, SQ_CONFIG,
-					DISABLE_BARRIER_WAITCNT, 1);
+		tmp = REG_SET_FIELD(tmp, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
+				!READ_ONCE(adev->barrier_has_auto_waitcnt));
 		WREG32_SOC15(GC, 0, mmSQ_CONFIG, tmp);
 		break;
 	default:
-- 
2.25.1

