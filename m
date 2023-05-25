Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA5711260
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CCC10E723;
	Thu, 25 May 2023 17:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF39F10E6E5;
 Thu, 25 May 2023 17:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHRIjUVkt4gPTCuL/3EAy4AuX2zwnMHAhlKynvJp6SdcYzj2upKMJ9jihLgQhCG+IkRDJ9RH7wePbLvUSVq24dt9xuWJxTPZdt44RpmkvVf7RnCVyiLce90jajYEb7EqQdncPMIDJQPQXtBsXcEvIdSe/9bBXXm1OQLxzAOYOzRo0ssYIC8+Npov8Q8V5jrrx3hAXmW4wOwU+tMhOH/0V/1aLXZZ2X7PlQ7E86dzmWEnrInIfOVHCkDdCQoP9IIy9mdyrcnhvy8OMHzFQog0+XYuh5ib55w3T0DP6MzdGZ/7loPyXC4xpAaSDBwVylsFlyqxg0CQvPXOKroYPGu2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs7IH9fhlr1ziaVcaNzRZg8WiHNWf+UFzzRzb/iZNIE=;
 b=gMm1ve3PTtPVSVCr4Poc6tArLUzUy000+gIAf3ls2HxOqmex8tyQfw1QqvL7LbJop2z37uXUPaF1DpeeAMcQTefdHVHp0NIKV8Ppr+H1ZfZzVLsNvWUHvFbEzqsC6xJ4++gb6mMhGzaKUc9Iy562AhYkPqOOLXFsI13lQT+cnbPUedKWmb30FmNVyHsRP4aVo1DfX0ZxPa+qtYZbgZn4pzL4u+Ue/4IEXDhTFctqTph2+ZGFlIp2TQH6DDjgDbxKHzgpNiFSqAsJLehCCoNItIlJmYdoTawsQym1P7sGuevwPKc58moxT7fWJtvELQLhwUZWwTZa1vuXCo1eZZyyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs7IH9fhlr1ziaVcaNzRZg8WiHNWf+UFzzRzb/iZNIE=;
 b=DqTYhCgOWy2ek8un7NZJhcsCoHxJk6pLE3InHa+zlQA16zZ9wEmY+A4Cha1P11h8etYaflWpeAzXAqyPM75ymsb90n8c6KL/Jvu0Bt6DWdLAkzfbeAC8Q0cUcNSmcLKNnNVvDBmLJkjFjWz8dao1rcJ2OJkLTRbxaU2NB5T1KpU=
Received: from MW4PR04CA0219.namprd04.prod.outlook.com (2603:10b6:303:87::14)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Thu, 25 May 2023 17:28:05 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::60) by MW4PR04CA0219.outlook.office365.com
 (2603:10b6:303:87::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:05 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:02 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 20/33] drm/amdkfd: add runtime enable operation
Date: Thu, 25 May 2023 13:27:32 -0400
Message-ID: <20230525172745.702700-20-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0eda79-8f96-4278-4b1a-08db5d456691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aenaZmRfT1vifr+RnPwAHWMsUT5Vlb0mABItBBRmfk/6AXOCdDyINmr2yD7AaSY013So01wxUZecjP8k3k1YTY35+/7NNUuQFzmoYsLknoH9OlRi5UmkdmjTv82K2709ODX93onDKlWIyqEZeprmwGQzJGOjBm9L37k78wzppcT9jBOeu5MUXD9nFBExOLq0KB4rAAhVsnFTirgAcOSERQAF7wJIo4IJBZbG1F2yE+/GNTgNtl9Z+uxCnHzMcHoZYUI40ubKrxZNxY7WH7GePjSzENW4P6y/RBfs8qM3v/yGeyoj0Eoi9VO9DoEm8ZP7hIhHF3NYVBOtWPDmnNZkCuoFB4RP6/BJRTg29btNsslZBGQxNjupr7a8zGvSHwQLf6NzY9P/aRjv58Og+2OkyFrKSdbPjQVk5shUtDk9rhEu1SOFxBdo8wqPlxukEly1G57wTVfyXiwI+BMGsAHQ+Ql0bFkAkjr9fPUpebvQdZwyPuPBjPn68bxaitUXZGQJSp2ts4+Iqi/53t/k0tTScy7UjkAhekCQbHoRDhzmUOdIEKsNVhmQnHb//riK6hJYFVvGuTKNkqI8xO3CHipZu4ji7V7SuopwneRmhAibXbuzbAh4ry794q/rh5Gu9XTDH5cF6frPShCspywX3t48iH9dLsuYpAFAyr3H47qHv1qXJo2MkiwhQ3dHt+Nu1q26F/TYG76+zM8AdG/nYcR02uTc2y7oOUchOMrPBric3iSbeBYxnOo7DgJxtucrGp68sWejOIkDYAWYOwMMbD1feFD7IeGgLs69jwBXt+31GB0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(81166007)(86362001)(356005)(82310400005)(40480700001)(36756003)(40460700003)(26005)(1076003)(16526019)(44832011)(5660300002)(336012)(83380400001)(426003)(47076005)(30864003)(2906002)(2616005)(478600001)(70586007)(450100002)(70206006)(110136005)(7696005)(8936002)(8676002)(6636002)(4326008)(41300700001)(316002)(82740400003)(186003)(36860700001)(6666004)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:05.6575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0eda79-8f96-4278-4b1a-08db5d456691
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293
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

The debugger can attach to a process prior to HSA enablement (i.e.
inferior is spawned by the debugger and attached to immediately before
target process has been enabled for HSA dispatches) or it
can attach to a running target that is already HSA enabled.  Either
way, the debugger needs to know the enablement status to know when
it can inspect queues.

For the scenario where the debugger spawns the target process,
it will have to wait for ROCr's runtime enable request from the target.
The runtime enable request will be able to see that its process has been
debug attached.  ROCr raises an EC_PROCESS_RUNTIME signal to the
debugger then blocks the target process while waiting the debugger's
response. Once the debugger has received the runtime signal, it will
unblock the target process.

For the scenario where the debugger attaches to a running target
process, ROCr will set the target process' runtime status as enabled so
that on an attach request, the debugger will be able to see this
status and will continue with debug enablement as normal.

A secondary requirement is to conditionally enable the trap tempories only
if the user requests it (env var HSA_ENABLE_DEBUG=1) or if the debugger
attaches with HSA runtime enabled.  This is because setting up the trap
temporaries incurs a performance overhead that is unacceptable for
microbench performance in normal mode for certain customers.

In the scenario where the debugger spawns the target process, when ROCr
detects that the debugger has attached during the runtime enable
request, it will enable the trap temporaries before it blocks the target
process while waiting for the debugger to respond.

In the scenario where the debugger attaches to a running target process,
it will enable to trap temporaries itself.

Finally, there is an additional restriction that is required to be
enforced with runtime enable and HW debug mode setting. The debugger must
first ensure that HW debug mode has been enabled before permitting HW debug
mode operations.

With single process debug devices, allowing the debugger to set debug
HW modes prior to trap activation means that debug HW mode setting can
occur before the KFD has reserved the debug VMID (0xf) from the hardware
scheduler's VMID allocation resource pool.  This can result in the
hardware scheduler assigning VMID 0xf to a non-debugged process and
having that process inherit debug HW mode settings intended for the
debugged target process instead, which is both incorrect and potentially
fatal for normal mode operation.

With multi process debug devices, allowing the debugger to set debug
HW modes prior to trap activation means that non-debugged processes
migrating to a new VMID could inherit unintended debug settings.

All debug operations that touch HW settings must require trap activation
where trap activation is triggered by both debug attach and runtime
enablement (target has KFD opened and is ready to dispatch work).

v2: fixup with new kfd_node struct reference

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 143 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   1 +
 4 files changed, 150 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index ec5a85454192..73cb5abce431 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2738,11 +2738,140 @@ static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
 	return ret;
 }
 
-static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
+static int runtime_enable(struct kfd_process *p, uint64_t r_debug,
+			bool enable_ttmp_setup)
+{
+	int i = 0, ret = 0;
+
+	if (p->is_runtime_retry)
+		goto retry;
+
+	if (p->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_DISABLED)
+		return -EBUSY;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		if (pdd->qpd.queue_count)
+			return -EEXIST;
+	}
+
+	p->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_ENABLED;
+	p->runtime_info.r_debug = r_debug;
+	p->runtime_info.ttmp_setup = enable_ttmp_setup;
+
+	if (p->runtime_info.ttmp_setup) {
+		for (i = 0; i < p->n_pdds; i++) {
+			struct kfd_process_device *pdd = p->pdds[i];
+
+			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev)) {
+				amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+				pdd->dev->kfd2kgd->enable_debug_trap(
+						pdd->dev->adev,
+						true,
+						pdd->dev->vm_info.last_vmid_kfd);
+			} else if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {
+				pdd->spi_dbg_override = pdd->dev->kfd2kgd->enable_debug_trap(
+						pdd->dev->adev,
+						false,
+						0);
+			}
+		}
+	}
+
+retry:
+	if (p->debug_trap_enabled) {
+		if (!p->is_runtime_retry) {
+			kfd_dbg_trap_activate(p);
+			kfd_dbg_ev_raise(KFD_EC_MASK(EC_PROCESS_RUNTIME),
+					p, NULL, 0, false, NULL, 0);
+		}
+
+		mutex_unlock(&p->mutex);
+		ret = down_interruptible(&p->runtime_enable_sema);
+		mutex_lock(&p->mutex);
+
+		p->is_runtime_retry = !!ret;
+	}
+
+	return ret;
+}
+
+static int runtime_disable(struct kfd_process *p)
 {
+	int i = 0, ret;
+	bool was_enabled = p->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED;
+
+	p->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_DISABLED;
+	p->runtime_info.r_debug = 0;
+
+	if (p->debug_trap_enabled) {
+		if (was_enabled)
+			kfd_dbg_trap_deactivate(p, false, 0);
+
+		if (!p->is_runtime_retry)
+			kfd_dbg_ev_raise(KFD_EC_MASK(EC_PROCESS_RUNTIME),
+					p, NULL, 0, false, NULL, 0);
+
+		mutex_unlock(&p->mutex);
+		ret = down_interruptible(&p->runtime_enable_sema);
+		mutex_lock(&p->mutex);
+
+		p->is_runtime_retry = !!ret;
+		if (ret)
+			return ret;
+	}
+
+	if (was_enabled && p->runtime_info.ttmp_setup) {
+		for (i = 0; i < p->n_pdds; i++) {
+			struct kfd_process_device *pdd = p->pdds[i];
+
+			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev))
+				amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+		}
+	}
+
+	p->runtime_info.ttmp_setup = false;
+
+	/* disable ttmp setup */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {
+			pdd->spi_dbg_override =
+					pdd->dev->kfd2kgd->disable_debug_trap(
+					pdd->dev->adev,
+					false,
+					pdd->dev->vm_info.last_vmid_kfd);
+
+			if (!pdd->dev->kfd->shared_resources.enable_mes)
+				debug_refresh_runlist(pdd->dev->dqm);
+			else
+				kfd_dbg_set_mes_debug_mode(pdd);
+		}
+	}
+
 	return 0;
 }
 
+static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_runtime_enable_args *args = data;
+	int r;
+
+	mutex_lock(&p->mutex);
+
+	if (args->mode_mask & KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK)
+		r = runtime_enable(p, args->r_debug,
+				!!(args->mode_mask & KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK));
+	else
+		r = runtime_disable(p);
+
+	mutex_unlock(&p->mutex);
+
+	return r;
+}
+
 static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_dbg_trap_args *args = data;
@@ -2815,6 +2944,18 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		goto unlock_out;
 	}
 
+	if (target->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_ENABLED &&
+			(args->op == KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE ||
+			 args->op == KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE ||
+			 args->op == KFD_IOC_DBG_TRAP_SUSPEND_QUEUES ||
+			 args->op == KFD_IOC_DBG_TRAP_RESUME_QUEUES ||
+			 args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ||
+			 args->op == KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH ||
+			 args->op == KFD_IOC_DBG_TRAP_SET_FLAGS)) {
+		r = -EPERM;
+		goto unlock_out;
+	}
+
 	switch (args->op) {
 	case KFD_IOC_DBG_TRAP_ENABLE:
 		if (target != p)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 61098975bb0e..a19c21d04438 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -219,7 +219,7 @@ static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
 	return r;
 }
 
-static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
+int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
 {
 	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
 	uint32_t flags = pdd->process->dbg_flags;
@@ -239,7 +239,7 @@ static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
  *				to unwind
  *		else: ignored
  */
-static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
+void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
 {
 	int i;
 
@@ -307,7 +307,7 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
 	return 0;
 }
 
-static int kfd_dbg_trap_activate(struct kfd_process *target)
+int kfd_dbg_trap_activate(struct kfd_process *target)
 {
 	int i, r = 0;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 2c6866bb8850..fca928564948 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -25,6 +25,8 @@
 
 #include "kfd_priv.h"
 
+void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
+int kfd_dbg_trap_activate(struct kfd_process *target);
 bool kfd_dbg_ev_raise(uint64_t event_mask,
 			struct kfd_process *process, struct kfd_node *dev,
 			unsigned int source_id, bool use_worker,
@@ -77,4 +79,6 @@ static inline bool kfd_dbg_has_gws_support(struct kfd_node *dev)
 	/* Assume debugging and cooperative launch supported otherwise. */
 	return true;
 }
+
+int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd);
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 58b82fa59584..4b80f74b9de0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -980,6 +980,7 @@ struct kfd_process {
 
 	/* Tracks runtime enable status */
 	struct semaphore runtime_enable_sema;
+	bool is_runtime_retry;
 	struct kfd_runtime_info runtime_info;
 
 };
-- 
2.25.1

