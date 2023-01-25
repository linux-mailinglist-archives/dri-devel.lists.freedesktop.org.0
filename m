Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01967BB58
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D4810E835;
	Wed, 25 Jan 2023 19:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4745E10E819;
 Wed, 25 Jan 2023 19:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrqqC3JXNxUk6fUEzwu2Kf+wz1ihKCevQeGc5joRFJy+R7+yJ5aG10djQCkPf72vyfQsb+AkUjFPB5cWSfL9wF6j6fogb9TdGbnkqZZeE0TAhMkbcnp5p9xo+AKh3pWt/uxiTobJgPU8MJICNOtQchPGOFeAue04FCFTPDg32xlxjrElxPXEOFeV6Bsj/Ec9mRp8aRxn/HOeee3VCiQiuEYJgeYfCuaQRUZiifla6K+Z71r54EuBGhZIe4sqNNgr28PbW5a+gFXAIZaEWnPKzPlj1xGB+tMDl9ookjs7b38Exe8CRCFOa22eaDgrJTArmrjga7gq4jo2QfFybyWAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EMQv7oGrAtXf1y/lSFych5fmu42NlClzDfubdVidXk=;
 b=RKnxR2UAXs+BvbBv3uhNmAHmmD4g8aWjU/JnSlcxeVE5LMuT9S5De2vSYqLsFVCOB0FjtbW98457DC0YPEUsboHfwaUxldAUPnn9I06mqCsFllN7zScBHY2uw8v07dN5MiU/A9vbfx9qpQSazyd4Swrv7WzqkdmF8pOEYbwzyVqIEqX7LG7JEQfgLYsj3ZX/73X9kX3ighUWr7sV/lsr7m2GH5kJJg4GJP+ak1cshMR8e6hy75JE1YPMypiNofk6tmRqioeAwdIJzG9maK4g5kWSflgyKkKsu8/i3MsiaMGFkUKB5BJTEEeypKuFAAgT2gsvIvET3GUlmV06QwGARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EMQv7oGrAtXf1y/lSFych5fmu42NlClzDfubdVidXk=;
 b=M7vC7tEY1TgT7BaDR9ce5OpYjwLu3bXp3rPxwNxvUUxd9HpE2MilZe+mBodtV8jhJBPqIE6R2OSgRtKQ9TNcX08IOs6t2o14tsGKZsbtXEv4R2Df8ErAT5nPGPhjQxmdTu1JnYwvmkVlseYjrW5R+tqyJM+zYWsMXp2YRfaWs28=
Received: from BN9PR03CA0704.namprd03.prod.outlook.com (2603:10b6:408:ef::19)
 by DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:23 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::ee) by BN9PR03CA0704.outlook.office365.com
 (2603:10b6:408:ef::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:23 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:20 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/32] drm/amdkfd: add per process hw trap enable and disable
 functions
Date: Wed, 25 Jan 2023 14:53:45 -0500
Message-ID: <20230125195401.4183544-17-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e962e9-5da8-472e-7657-08daff0df4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 06vhoBIsJIzOPFwi5cVXuOi1ZwCZc3ZIzk1+dddJrL7N0Z1XoV23eTloFhQhr6cD6ykAhhSQl+5WzQmL9Bf0uk55K1heQZUJuERqybm2n9pFeYUurft40/FHPhi+wYJx/qDu87NrYZt8AQnN1X8kdt1U+n7Wq3PCFIHtPyGRSa+a5ZRXep54kq6omyAAm8/dXYqCGGAYZYHCTEYU0PT+iuL40/GCWoffamex/+7o/12IlywMlmnvmHSx2mXbSHVS3Hi/WzLCViaQrQx7GLKqQGcXnXvkEX5uhMVsBuRT9WuuihbgSVJoaUS4vWbiy6KIHsUPlYJNALn2kdkbSYjJ6qDpx2mZuzSoFehsOVMjPoVo1LYtNNwvZSbbhb0u94SFyisgspYiUXrTx0FcVy9yptxojLguWka0K9JBw12FubnjMl5MnjpB/BhwmQzOH5aA2mlEvYTPve574REadPDwpv9p/ZnDv1Fpx6jvfemhvfHUG95ABG8mqY6u0T9YsmweODX2S3v8LJEspCj5WUasQZL048ePq9KLMTl8kaWWK7tBKTXiQvbB6wlau4kjYEuZDFrzpnGGhA8vCIggRqcWY2+TZy1Tdy/6jsD1hE64MULEOw5pTzynqugN4i9EZ1dlscSZFcyQM9yd6oB9BXsh6MgtiOnSusJ+M6GYeSLtFjRzh++HbdB1j5ARnFkizx3Pbw9PHuKSAfsduVffysl857tCSUrMtYSpvLgFmSsBUX4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(4326008)(316002)(86362001)(70206006)(16526019)(36860700001)(36756003)(44832011)(5660300002)(30864003)(426003)(82740400003)(82310400005)(2906002)(2616005)(41300700001)(40460700003)(47076005)(8936002)(6666004)(186003)(26005)(8676002)(40480700001)(1076003)(450100002)(70586007)(54906003)(478600001)(336012)(110136005)(7696005)(83380400001)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:23.5066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e962e9-5da8-472e-7657-08daff0df4f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573
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

v2: add gfx11 support. fix fw checks. remove asic family name comments.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 148 +++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  29 ++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   9 ++
 5 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index f5f639de28f0..628178126d3b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1453,6 +1453,11 @@ static int kfd_ioctl_alloc_queue_gws(struct file *filep,
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
index 6e99a0160275..659dfc7411fe 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -21,6 +21,7 @@
  */
 
 #include "kfd_debug.h"
+#include "kfd_device_queue_manager.h"
 #include <linux/file.h>
 
 void debug_event_write_work_handler(struct work_struct *work)
@@ -101,11 +102,68 @@ static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
 						pdd->watch_points, flags);
 }
 
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
+	int i, count = 0;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		/* If this is an unwind, and we have unwound the required
+		 * enable calls on the pdd list, we need to stop now
+		 * otherwise we may mess up another debugger session.
+		 */
+		if (unwind && count == unwind_count)
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
+		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
+			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+		if (!kfd_dbg_is_per_vmid_supported(pdd->dev) &&
+				release_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd))
+			pr_err("Failed to release debug vmid on [%i]\n", pdd->dev->id);
+
+		if (!pdd->dev->shared_resources.enable_mes)
+			debug_refresh_runlist(pdd->dev->dqm);
+		else
+			kfd_dbg_set_mes_debug_mode(pdd);
+
+		count++;
+	}
+
+	kfd_dbg_set_workaround(target, false);
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
 
@@ -120,16 +178,96 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
 	return 0;
 }
 
+static int kfd_dbg_trap_activate(struct kfd_process *target)
+{
+	int i, r = 0, unwind_count = 0;
+
+	r = kfd_dbg_set_workaround(target, true);
+	if (r)
+		return r;
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
+
+		/* Increment unwind_count as the last step */
+		unwind_count++;
+	}
+
+	return 0;
+
+unwind_err:
+	/* Enabling debug failed, we need to disable on
+	 * all GPUs so the enable is all or nothing.
+	 */
+	kfd_dbg_trap_deactivate(target, true, unwind_count);
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
@@ -140,6 +278,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 
 	target->dbg_ev_file = f;
 
+	/* defer activation to runtime if not runtime enabled */
+	if (target->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED)
+		kfd_dbg_trap_activate(target);
+
 	/* We already hold the process reference but hold another one for the
 	 * debug session.
 	 */
@@ -149,8 +291,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
 	if (target->debugger_process)
 		atomic_inc(&target->debugger_process->debugged_process_count);
 
-	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size))
+	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size)) {
+		kfd_dbg_trap_deactivate(target, false, 0);
 		r = -EFAULT;
+	}
 
 	*runtime_size = sizeof(target->runtime_info);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 0c09f1729325..f199698d8d60 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -41,4 +41,33 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
 
 void debug_event_write_work_handler(struct work_struct *work);
 
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
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index be1985b87ea7..3b747e51684e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -36,6 +36,7 @@
 #include "kfd_kernel_queue.h"
 #include "amdgpu_amdkfd.h"
 #include "mes_api_def.h"
+#include "kfd_debug.h"
 
 /* Size of the per-pipe EOP queue */
 #define CIK_HPD_EOP_BYTES_LOG2 11
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 94c6545a58b4..0ef2d00af8b1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1181,6 +1181,7 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 					struct mm_struct *mm)
 {
 	struct kfd_process *p;
+	int i;
 
 	/*
 	 * The kfd_process structure can not be free because the
@@ -1198,6 +1199,14 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
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
 
-- 
2.25.1

