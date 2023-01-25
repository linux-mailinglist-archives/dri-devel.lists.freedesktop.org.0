Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0367BB4B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41CB10E820;
	Wed, 25 Jan 2023 19:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DE910E390;
 Wed, 25 Jan 2023 19:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kevznax1RDBjvVzpPwlkU/f/kMmoT+1YQBQhrj1JcWpgE+FDGz5dNegzCWhlZAf7PrCkluP9xQwKdRSzrNFdGigXYYiizSqJkoowZDaUs04Sj9h+F5JyDvxuX9G24wL6cIUBSQuj/XWLLZIsLRi0IPX01yDSgTkFUgev3l1+frMdtEHJ343Nd1GjGbNtX2eber5vIJJrUwt1OSmdUMAc4JwBSBZ1VTAx+AbCj/RLHzDCVpm7QSOr4ZFq2MulATvtOQ0T3afVsgDfoiouEgi0r4+ZzTRLXTFQGlbWikCuBQMKJbgygJVph1XEdVj+7psr+gyF/IJdkvjcQ42cKQrMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06IJX9nKBe8dOm79SBrksmaWoQ17XkfMnifqmO2SknU=;
 b=BRlAEGbVdFMjHlcNWhaX9xUFA8Ge86FayUzAlJpAfD1c/I9HQ3FKLAQIFrqsEsgtI2SfQCt+1Bz34h3taA+ptyML++15H1PwVNmNZdWzY3Kgbka21+UVznKzWixeJ9CYkTK0Uzy2RqKp+d4AfI6fV7E8Gy++UK1XmhJR+9JRnnmgwJEkNwddGfVwBsFbsSgxB7MQMBeAauGfGXdCco9asfV3vSZgiEUGPcsG/BfrdP1G17epWpwTYKddrxrFAqawhrpQU4u1NJwSdcgPTRdRHOG83N0PVoLTCaiAB/0LCRX8O9856KaiaX1OnKv+bUCdoVDskkJhYIBJVo4XdWBBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06IJX9nKBe8dOm79SBrksmaWoQ17XkfMnifqmO2SknU=;
 b=wfvM9B2WizOgQlK5sI/QIqYAM74+Peg4eFcU4NWZ92HgLn6iRK7K054O4Qv2AKcLJVidYbvnXq9VfrxbnCelA107Edec8Onu+Dikwku67Oo94RuJXPpOPB0oYmMp5NDAG1bSFfSNmjpKsFrxiun7xC3KyvBJwXK1bXmm4z5MWiU=
Received: from BN9PR03CA0783.namprd03.prod.outlook.com (2603:10b6:408:13f::8)
 by SN7PR12MB7022.namprd12.prod.outlook.com (2603:10b6:806:261::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:19 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::db) by BN9PR03CA0783.outlook.office365.com
 (2603:10b6:408:13f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
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
 2023 13:54:16 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/32] drm/amdgpu: add gfx9.4.1 hw debug mode enable and
 disable calls
Date: Wed, 25 Jan 2023 14:53:36 -0500
Message-ID: <20230125195401.4183544-8-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|SN7PR12MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 9331347f-de6c-46a5-0f9a-08daff0df222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 66eYj0So0AigzzFOC7CtWV8v8D4wAytoAPu9552EJv5MYbNPUyHCnDzfTlkDwe7q44a2WILHAgjWpP2w1nRyLC1581PB9hrn/tpziJxhtHv6jChvHm/8qJjuE5UdrrnwzhOPuqzUgm4NTzGAzFaUSe2tV8FnAaxbJjsgn1i/Sk/xi0qSpEiFY5GTuVnqeZiIjScK010JMEEFd95qa6aDcVDeCBk2NZxK2/qDY3iz4evkUL5Lsb4VygRvroe2UOcgOj4rgzKEx8Od4Xh/C8vbncl6vNeH8CEvhctqGuInNFQbgbMWhhLDCTIP8er2UiwbbNunlX4xxpYcMVSEvYDgwyRA8ocaPn/NpMvsGjHR4a4urr7MzR23H5TE/J80wEAU40tbIZYAbQYEVICXk099tQC3UnP5YXcdHH8sTLDs2mh8ISzug+w3bCs89AnTVyA0XkPc2of04GegFuk+xpv1ymE/KEfREfp7hQthgcTifqg/dzYb2NlZsnbtNB33Ju6ynx9QbuSd0cOQa48wdECIOR/C6PxgsKJz4QoizBkeIAwvHQFfjvF/Tysy5MfZBs0moCN2fUPHPv/+4+492y2wz1THZNrEFxSin5odkpjhXVFwRF/OOsVxS1sQ6VQVDnWFfLFJZMzbFanei5lrXj6pjK+wQXgk0dbYcXMM1UNoI4aaV/YHXnZ2TZob3Vm0yqbufsv1zS8QIbqzAZfW11mKyakFBZR/B1jIvWUA/UTBy88=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199018)(46966006)(36840700001)(40470700004)(82740400003)(4326008)(81166007)(86362001)(2906002)(36756003)(82310400005)(8676002)(40460700003)(70586007)(186003)(450100002)(110136005)(26005)(47076005)(16526019)(8936002)(40480700001)(336012)(54906003)(426003)(6666004)(1076003)(83380400001)(44832011)(41300700001)(2616005)(36860700001)(5660300002)(356005)(7696005)(70206006)(478600001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:18.7385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9331347f-de6c-46a5-0f9a-08daff0df222
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
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

v2: remove flush on kfd suspend as that will be a general fix required
outside of this patch series.
comment on trap enable/disable ignored variables.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   | 118 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |   4 +-
 3 files changed, 122 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 872450a3a164..3c03e34c194c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1041,6 +1041,9 @@ struct amdgpu_device {
 	struct pci_saved_state          *pci_state;
 	pci_channel_state_t		pci_channel_state;
 
+	/* Track auto wait count on s_barrier settings */
+	bool				barrier_has_auto_waitcnt;
+
 	struct amdgpu_reset_control     *reset_cntl;
 	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 4191af5a3f13..d5bb86ccd617 100644
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
+						enable_waitcnt ? 0 : 1);
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
+/**
+ * restore_dbg_reisters is ignored here but is a general interface requirement
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
+/**
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
-	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings
+	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 222fe87161b7..56d25a6f1da9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2376,8 +2376,8 @@ static void gfx_v9_0_init_sq_config(struct amdgpu_device *adev)
 	switch (adev->ip_versions[GC_HWIP][0]) {
 	case IP_VERSION(9, 4, 1):
 		tmp = RREG32_SOC15(GC, 0, mmSQ_CONFIG);
-		tmp = REG_SET_FIELD(tmp, SQ_CONFIG,
-					DISABLE_BARRIER_WAITCNT, 1);
+		tmp = REG_SET_FIELD(tmp, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
+				READ_ONCE(adev->barrier_has_auto_waitcnt) ? 0 : 1);
 		WREG32_SOC15(GC, 0, mmSQ_CONFIG, tmp);
 		break;
 	default:
-- 
2.25.1

