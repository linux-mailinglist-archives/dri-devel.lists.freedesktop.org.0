Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E76CAD9C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D246210E6FD;
	Mon, 27 Mar 2023 18:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFCD10E6C9;
 Mon, 27 Mar 2023 18:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0lyGfAHuxqhpghyM7Fi+33Fpy4AlW+bg4SWQeARqW6QlHPub2EuLfYLAVAVw5JV8bFc86NQiSGS62Xq6FJY5QwX5PxGXUWonzDrAqdHeZSPoj8fOZR7vH1qhPP1F3S8c3ZjD4/3Gw6RdgYqKGOIgAGAKBAf4msHE53EGjXwCZEr/npPGuDmY1FVK4uF53iO2ClQ/L/ifUAqEETkJ3zvQ5z2/liCM18JVzksVYNcnm07BInybKrTnBSmCymLOxOv89BQH34X/RNvavRlv3f/uGFB60gptse5yLUEMAtE0VPFHdn9OH2q3lLbIvo0mSe3pEEFetk8xj4zY2+Bi/29UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41WsZ9JPCkporYZwj1h9+xKE4WZHKjb9OPV/Car2qFs=;
 b=R3SAjCfS8paz9pH8d56g8zT/o7cVVLqAefC8s3h0cKX9wkbDxMpwuxwq+qzZj8pTKInVqJZ7B8qHmqfloITRKNEdP5N6zX919u03CwpuYOdSn5m0apBudcnFvhinQoboJBFCRWSUi9+o5VBs23Vj8rJT98IPNxnLE+y/Q63NoQX8Y3MASFpAPEBl6ej82zGC3rsOB0VsKZyNFP50PB1Jd8fRSUGVzwfcs9VJXAuTnb3cFSUbbSpNVP8t41DgRXj3aZDxRdy7/2l80acSQM4rHtLbXwt1zt5u6zryntzMmONMm1R9dErQMNowEBaCsj+KMoUfKRVtgc/h+zIuVpfP7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41WsZ9JPCkporYZwj1h9+xKE4WZHKjb9OPV/Car2qFs=;
 b=bNYazxjchYdBuSVmHFoa3dT0DP6VNRrhqaVZskbCOOEjKrAuFOds9r25Qvajjiq+5zMusg6nGJlUeCLyqOjTSPA4/cWeOynwj5RFIFrhPepGGDIwcwNEQJZxKCtnlIezda8MTlSSe9sHTxddiQrJThuTMETLc5/2yllebKuXBFs=
Received: from CY5PR18CA0008.namprd18.prod.outlook.com (2603:10b6:930:5::11)
 by SA0PR12MB4477.namprd12.prod.outlook.com (2603:10b6:806:92::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:43:55 +0000
Received: from CY4PEPF0000C97C.namprd02.prod.outlook.com
 (2603:10b6:930:5:cafe::35) by CY5PR18CA0008.outlook.office365.com
 (2603:10b6:930:5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97C.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:55 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:54 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/34] drm/amdkfd: add per process hw trap enable and disable
 functions
Date: Mon, 27 Mar 2023 14:43:21 -0400
Message-ID: <20230327184339.125016-16-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97C:EE_|SA0PR12MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: db27a612-7022-4673-707d-08db2ef3382b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YCDW98ettju6p3TPVWmGn5Ikrs0eD8EGIMXQ44ZyfA0ajmFTCFYh7gQ62KSOilOVQaPvnYKZJyKeUF4kzQCNWhIW18efZz5fTu0xqoXPIz6kLKNOtngMT2J4clQXcyvOzLtaZOW0jKCQBIT8isWdY4z/IPfi5fKqZMgh4D4IPqzQ/iUuX2rThQ1GQLxBAs6lfTbx5YU868VfOOnWD/HUhK8NW056CfiuQ62D+8CExJPcQBAC7UucWHS4P4RstPqfEwcMK89dj7j7i6sOsLfsD88GOccsZDchCAflZiReTtoXhzwy29FDOTNaWz3vaoOYrbcZqz3j9vEwJC0el/xa8QV7GYKwoOJZuNMZcafGcSfR4hyHlW44tdvRutghHpTRkaGNk1gTWdt7I7+m9luMr7X+FP8mjT1SBaZaaYKieRB4y4t87M0D4B2Q8RVesqnEIbaoGpnBMAfij2Bd2zcnlL3OfB7gkRCWDH4K5ha/5afWl4aBTDZbORFlnrgMDETriMIlpN6BfRMmKRH548KZgOq3pf0Z3SrOEfAPyYTHQC+GU0lRlamJkf1l6YWBZ0mNLHiFqDBaT8COxJSJ4sB4vURTxgROmYI8G2mm9VUPb4t7+GplgiYYRYYhw3mozZdjRmlhDJAae90agwwRqyqDL0amKPcjfYeU9djcPF+yF4rS512Dls7jBQ3S2Hepe0K7+9Fm3+5KMGSeRy5OOb50r2iwJq8D0zQPvkqtQdF5NW8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(16526019)(26005)(426003)(1076003)(40480700001)(41300700001)(186003)(6666004)(7696005)(83380400001)(336012)(2616005)(47076005)(478600001)(54906003)(110136005)(316002)(36860700001)(40460700003)(4326008)(70206006)(450100002)(44832011)(2906002)(30864003)(70586007)(8676002)(81166007)(82740400003)(356005)(36756003)(82310400005)(86362001)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:55.6265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db27a612-7022-4673-707d-08db2ef3382b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4477
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

To enable HW debug mode per process, all devices must be debug enabled
successfully.  If a failure occures, rewind the enablement of debug mode
on the enabled devices.

A power management scenario that needs to be considered is HW
debug mode setting during GFXOFF.  During GFXOFF, these registers
will be unreachable so we have to transiently disable GFXOFF when
setting.  Also, some devices don't support the RLC save restore
function for these debug registers so we have to disable GFXOFF
completely during a debug session.

Cooperative launch also has debugging restriction based on HW/FW bugs.
If such bugs exists, the debugger cannot attach to a process that uses GWS
resources nor can GWS resources be requested if a process is being
debugged.

Multi-process debug devices can only enable trap temporaries based
on certain runtime scenerios, which will be explained when the
runtime enable functions are implemented in a follow up patch.

v3: make gfx off restore unconditional on detach and get rid of unneeded
count variable for unwind.
also move gfx11 workaround to later so we're not defining unused
functions and better illustrate the use of the workaround.

v2: add gfx11 support. fix fw checks. remove asic family name comments.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 148 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  29 +++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  10 ++
 4 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 58c08d8a191f..c0c54206b1c2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1473,6 +1473,11 @@ static int kfd_ioctl_alloc_queue_gws(struct file *filep,
 		goto out_unlock;
 	}
 
+	if (!kfd_dbg_has_gws_support(dev) && p->debug_trap_enabled) {
+		retval = -EBUSY;
+		goto out_unlock;
+	}
+
 	retval = pqm_set_gws(&p->pqm, args->queue_id, args->num_gws ? dev->gws : NULL);
 	mutex_unlock(&p->mutex);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 2bf2aa21eccc..fe5b965ac8f6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -21,13 +21,78 @@
  */
 
 #include "kfd_debug.h"
+#include "kfd_device_queue_manager.h"
 #include <linux/file.h>
 
+static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
+{
+	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
+	uint32_t flags = pdd->process->dbg_flags;
+
+	if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
+		return 0;
+
+	return amdgpu_mes_set_shader_debugger(pdd->dev->adev, pdd->proc_ctx_gpu_addr, spi_dbg_cntl,
+						pdd->watch_points, flags);
+}
+
+/* kfd_dbg_trap_deactivate:
+ *	target: target process
+ *	unwind: If this is unwinding a failed kfd_dbg_trap_enable()
+ *	unwind_count:
+ *		If unwind == true, how far down the pdd list we need
+ *				to unwind
+ *		else: ignored
+ */
+static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
+{
+	int i;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		/* If this is an unwind, and we have unwound the required
+		 * enable calls on the pdd list, we need to stop now
+		 * otherwise we may mess up another debugger session.
+		 */
+		if (unwind && i == unwind_count)
+			break;
+
+		/* GFX off is already disabled by debug activate if not RLC restore supported. */
+		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
+			amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+		pdd->spi_dbg_override =
+				pdd->dev->kfd2kgd->disable_debug_trap(
+				pdd->dev->adev,
+				target->runtime_info.ttmp_setup,
+				pdd->dev->vm_info.last_vmid_kfd);
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+		if (!kfd_dbg_is_per_vmid_supported(pdd->dev) &&
+				release_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd))
+			pr_err("Failed to release debug vmid on [%i]\n", pdd->dev->id);
+
+		if (!pdd->dev->shared_resources.enable_mes)
+			debug_refresh_runlist(pdd->dev->dqm);
+		else
+			kfd_dbg_set_mes_debug_mode(pdd);
+	}
+}
+
 int kfd_dbg_trap_disable(struct kfd_process *target)
 {
 	if (!target->debug_trap_enabled)
 		return 0;
 
+	/*
+	 * Defer deactivation to runtime if runtime not enabled otherwise reset
+	 * attached running target runtime state to enable for re-attach.
+	 */
+	if (target->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED)
+		kfd_dbg_trap_deactivate(target, false, 0);
+	else if (target->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_DISABLED)
+		target->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_ENABLED;
+
 	fput(target->dbg_ev_file);
 	target->dbg_ev_file = NULL;
 
@@ -42,16 +107,89 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
 	return 0;
 }
 
+static int kfd_dbg_trap_activate(struct kfd_process *target)
+{
+	int i, r = 0;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		if (!kfd_dbg_is_per_vmid_supported(pdd->dev)) {
+			r = reserve_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd);
+
+			if (r) {
+				target->runtime_info.runtime_state = (r == -EBUSY) ?
+							DEBUG_RUNTIME_STATE_ENABLED_BUSY :
+							DEBUG_RUNTIME_STATE_ENABLED_ERROR;
+
+				goto unwind_err;
+			}
+		}
+
+		/* Disable GFX OFF to prevent garbage read/writes to debug registers.
+		 * If RLC restore of debug registers is not supported and runtime enable
+		 * hasn't done so already on ttmp setup request, restore the trap config registers.
+		 *
+		 * If RLC restore of debug registers is not supported, keep gfx off disabled for
+		 * the debug session.
+		 */
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+		if (!(kfd_dbg_is_rlc_restore_supported(pdd->dev) ||
+						target->runtime_info.ttmp_setup))
+			pdd->dev->kfd2kgd->enable_debug_trap(pdd->dev->adev, true,
+								pdd->dev->vm_info.last_vmid_kfd);
+
+		pdd->spi_dbg_override = pdd->dev->kfd2kgd->enable_debug_trap(
+					pdd->dev->adev,
+					false,
+					pdd->dev->vm_info.last_vmid_kfd);
+
+		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
+			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+		if (!pdd->dev->shared_resources.enable_mes)
+			r = debug_refresh_runlist(pdd->dev->dqm);
+		else
+			r = kfd_dbg_set_mes_debug_mode(pdd);
+
+		if (r) {
+			target->runtime_info.runtime_state =
+					DEBUG_RUNTIME_STATE_ENABLED_ERROR;
+			goto unwind_err;
+		}
+	}
+
+	return 0;
+
+unwind_err:
+	/* Enabling debug failed, we need to disable on
+	 * all GPUs so the enable is all or nothing.
+	 */
+	kfd_dbg_trap_deactivate(target, true, i);
+	return r;
+}
+
 int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 			void __user *runtime_info, uint32_t *runtime_size)
 {
 	struct file *f;
 	uint32_t copy_size;
-	int r = 0;
+	int i, r = 0;
 
 	if (target->debug_trap_enabled)
 		return -EALREADY;
 
+	/* Enable pre-checks */
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		if (!KFD_IS_SOC15(pdd->dev))
+			return -ENODEV;
+
+		if (!kfd_dbg_has_gws_support(pdd->dev) && pdd->qpd.num_gws)
+			return -EBUSY;
+	}
+
 	copy_size = min((size_t)(*runtime_size), sizeof(target->runtime_info));
 
 	f = fget(fd);
@@ -62,6 +200,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 
 	target->dbg_ev_file = f;
 
+	/* defer activation to runtime if not runtime enabled */
+	if (target->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED)
+		kfd_dbg_trap_activate(target);
+
 	/* We already hold the process reference but hold another one for the
 	 * debug session.
 	 */
@@ -71,8 +213,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 	if (target->debugger_process)
 		atomic_inc(&target->debugger_process->debugged_process_count);
 
-	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size))
+	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size)) {
+		kfd_dbg_trap_deactivate(target, false, 0);
 		r = -EFAULT;
+	}
 
 	*runtime_size = sizeof(target->runtime_info);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 20b8a3e97d8e..68a95c8105e5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -34,4 +34,33 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
 }
 
+/*
+ * If GFX off is enabled, chips that do not support RLC restore for the debug
+ * registers will disable GFX off temporarily for the entire debug session.
+ * See disable_on_trap_action_entry and enable_on_trap_action_exit for details.
+ */
+static inline bool kfd_dbg_is_rlc_restore_supported(struct kfd_dev *dev)
+{
+	return !(KFD_GC_VERSION(dev) == IP_VERSION(10, 1, 10) ||
+		 KFD_GC_VERSION(dev) == IP_VERSION(10, 1, 1));
+}
+
+static inline bool kfd_dbg_has_gws_support(struct kfd_dev *dev)
+{
+	if ((KFD_GC_VERSION(dev) == IP_VERSION(9, 0, 1)
+			&& dev->mec2_fw_version < 0x81b6) ||
+		(KFD_GC_VERSION(dev) >= IP_VERSION(9, 1, 0)
+			&& KFD_GC_VERSION(dev) <= IP_VERSION(9, 2, 2)
+			&& dev->mec2_fw_version < 0x1b6) ||
+		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0)
+			&& dev->mec2_fw_version < 0x1b6) ||
+		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 1)
+			&& dev->mec2_fw_version < 0x30) ||
+		(KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0) &&
+			KFD_GC_VERSION(dev) < IP_VERSION(12, 0, 0)))
+		return false;
+
+	/* Assume debugging and cooperative launch supported otherwise. */
+	return true;
+}
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index ac3b7c245807..51dde18c4eef 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1159,9 +1159,19 @@ static void kfd_process_free_notifier(struct mmu_notifier *mn)
 
 static void kfd_process_notifier_release_internal(struct kfd_process *p)
 {
+	int i;
+
 	cancel_delayed_work_sync(&p->eviction_work);
 	cancel_delayed_work_sync(&p->restore_work);
 
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		/* re-enable GFX OFF since runtime enable with ttmp setup disabled it. */
+		if (!kfd_dbg_is_rlc_restore_supported(pdd->dev) && p->runtime_info.ttmp_setup)
+			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+	}
+
 	/* Indicate to other users that MM is no longer valid */
 	p->mm = NULL;
 	kfd_dbg_trap_disable(p);
-- 
2.25.1

