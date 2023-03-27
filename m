Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6606CAD9A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33110E6F7;
	Mon, 27 Mar 2023 18:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3303810E6BE;
 Mon, 27 Mar 2023 18:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4kjmRREgaBsfLcq09um/7PmfR2abfAdGlOmajSvaAKjd67Hg+MuptfmqYbWdYuzOcegrxKE3yDPk5dquru2M0GHo4otz4b7uMxU8UUMs7VCydUARq3f1Z+AYatIEUIdnzw7Xu3UM1C9dZK7TUS+0qwebMs5q5m6KBzWuJKriD1mFMLsiI7+v6gGAkjPHGSmws60TsOjO2YFEM6YkedhSigTpGtVzMjVwb2mm/L8rfXUasUNwlgASWhlvOL5G31U694phovMvA/ithmZnrzZvNsuedsYfm6qRlKc2mM7wM1Oze8+sEGn0CZGeAQeU4pOkhCN5oqwqX+8iRHVKGuUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcGjIDVlq2ZEXZk46LMWYPA8uFq1/zSjjan4yPRXpTQ=;
 b=QfzU3P0LHeEd+voIx4bEr/w8wqldP903NAhjloE3nL+rx+UREcn1aBSL1Wy6QvWxcvSo4dikgQXHAqZLcIa+Ow72+Y+K+8SvgZu3Ft0ySAjGBXRCyg3fAQ58g+1WTpNgl2/omNyekv72/G4XjGrydR1+SOLYBkbZcST5QKkjipUF+R0CE6+peO3mIMNqHgbSHxjyzA5QEFqHcEMoBQ9waQpIbECy+XRpFkG5XidlCtkz7ho0N+LX+Iv/tLXjuOQWOWPd0vKS9TVtwdfv8kdvlDbhy7KduY/rKhnpdFPpblF9ubUobt+/CI6Q/F3qNI3dQalywOONazmPPdCExYPr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcGjIDVlq2ZEXZk46LMWYPA8uFq1/zSjjan4yPRXpTQ=;
 b=tDkdZwi3JCiCXJSOGyoaYIRupJCujfBAPJWhIEmjJeIh/Oj5KeyPuay9ESDub7UnqbSnmftZnj4oi0RcszycUnQLoWcnSZCAXpFU+aJto7tsaiMp6/3szGO4lCpq5Wa9mSZUKMFstDYd4g5i+wX7sLv4KEL1sYucVXsvNAH5nU0=
Received: from CY8PR02CA0005.namprd02.prod.outlook.com (2603:10b6:930:4d::9)
 by DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 18:43:53 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::e6) by CY8PR02CA0005.outlook.office365.com
 (2603:10b6:930:4d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:53 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:50 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/34] drm/amdgpu: add gfx9.4.1 hw debug mode enable and
 disable calls
Date: Mon, 27 Mar 2023 14:43:12 -0400
Message-ID: <20230327184339.125016-7-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ebf729-098e-431d-88f1-08db2ef3369d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f6Tw7q4yOwWJS/Elpt9fiQiDd5rWIy5j1lz5u+S5wDbIsozt4recCZk8L0CwRqLwGnzgbFjNDo9TNjvpGhRb5uX/x4c/s1AriuJ7Jsl5/R8dp/1nN6cJ8cExXa4AkIeLkJeQeqHVw6RYmjCdRJ8YhRpSg/0ighFTw0zg7eNTCySp4UCyxE0CssYEJnB0hu53Fs/N53wWTohFIHnzcPR+hVcUyOYZmwKlaw3XfzgS+Af4LYEuO5jxxWoUqNe54+2EZg804qn8XnqECv1KS9gDbsQptLvy/pzK0urU/GmhhWpsjH0cL4A5j8LFb2KS64qUH+kYpQqUsqYPWILwt7Dt2ZVq8ESelElI+ikeGRK4PhImvNvyofsZnRWoZHRoCpjUbYRXlDZ+DqzCAMCkyt4QPRngzbfWS9QhZcz16ZM0VIgCygwcPQDYusRWsrmdoa4oaFmPRT0gNBlU1tAP1JvGSPwdkvaPzzTeYvEPx65HYQ6YymbXvZZV6CJsjQprvLHyBUu6vURJ+iZ46DmliXLm3yHj0rkQZBar30PEUqa8B+dzxErcU3IWJvjT+DTb8vypobZJk524g2Jy8WzuGAI88BZ061/QPLW+Nht5aRY0yTirh8Tq6bFsLTFDoLZswmA1yUJqFWRMv7bUEyC8+XV7Cd5MHFeKqnjiBy2EqqCGFTCZuFxOWwQk26O8dNpK7LUJ6ZI6q7i9WiW3td+bosRehlMwvY6MJWcS6UrfvmZk2OE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(47076005)(83380400001)(450100002)(336012)(426003)(41300700001)(44832011)(36860700001)(36756003)(86362001)(5660300002)(356005)(8936002)(81166007)(82740400003)(40460700003)(54906003)(7696005)(478600001)(70586007)(8676002)(4326008)(70206006)(2906002)(40480700001)(82310400005)(6666004)(16526019)(1076003)(316002)(186003)(26005)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:53.0188 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ebf729-098e-431d-88f1-08db2ef3369d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589
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

v3: simplfy boolean checks and fix comment format kern bot complaints

v2: remove flush on kfd suspend as that will be a general fix required
outside of this patch series.
comment on trap enable/disable ignored variables.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   | 116 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |   4 +-
 3 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index bbac4239ceb3..7dbc9b0d4b9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1040,6 +1040,9 @@ struct amdgpu_device {
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
index d3ad9e9d4133..6a2f51a989ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2376,8 +2376,8 @@ static void gfx_v9_0_init_sq_config(struct amdgpu_device *adev)
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

