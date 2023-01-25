Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D567BB53
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5191E10E82C;
	Wed, 25 Jan 2023 19:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6442C10E81F;
 Wed, 25 Jan 2023 19:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkaSZIBiX+pb55z6uwWopDaQ2x5PusHf+AyNy3HFeoiWTUdu9+EIiThhOKJLOXTbzvEiXCgnsIIbjVH4pg9kEgR4RgHQ2xgmW3kCpUrUqwnbpyo+pHQ3Dfe4HpOPOQf7FQTKumI+Kj50LTiXXt51dhgXWAVOhZfLhPhSfBs0faMwxEwjEB1+uNjx0T5ySiytMlF/u2VR+cDXeHyV0U+Oslg5zWIT0Rh6/6l8IbtS/9QAX78Wf1VdfaJ76odbQdl4qT/QChn4ICCoi0NMz7D/eHePKRDdpjbyS1tGR+gDM2UyquA5FNoFd3QvXK0MMDAGFAKOg9IW2q/fhldqAyf6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MyJVKmQgiWQ6lK2WmG9X0cY31njYutdzuKcvg4gZgY=;
 b=f4qQCVSm4X0YPjoBJNo1REDR3RQ2S9vXf5CebRaXRgLHDmDPPqDWSVmqlHrcDIdw/3C26c7R6xTB6NifK/HgYOGk9JdZETcghbLi0sBra41txMw0dlsWx7+95NcWS7lMJnYlPrYMW0NZvd9rhSHxFen+CQW4UFCPxtXGfUzzc1i/HF0R3BgZoIHGy3uK0qCrLuWHRxLhuqg95F6FeqMBXncaM7m8FzlpjbU53Q8Egg2JskVmgm3ZDblZ8C7n5sCg/CajR/wBfAv9wqyKW2eOAGx7oFhirLWMypbwYIfdZCGcRaHTyABFljcrl9tHHYNdQ05MjiOn+15zbyoJ9525Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MyJVKmQgiWQ6lK2WmG9X0cY31njYutdzuKcvg4gZgY=;
 b=NPS04qVdU8L/b8pK0p/U3DIBbWTWbfN9SNnvq1CX6U3Z7siPQ0o11sL/agfL73+2Lmr0UkZpzSKWxJ7T2gnJ0KAiGg1xWFJRYGAZ/zHiXR3nNImrp2xY/fb6Z4K6WW9ww3qI/5WwIvfIs3QON7Bwz7A/bAU3nkMkYJFhWs8TGeI=
Received: from BN8PR15CA0031.namprd15.prod.outlook.com (2603:10b6:408:c0::44)
 by CY8PR12MB7492.namprd12.prod.outlook.com (2603:10b6:930:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:24 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::bd) by BN8PR15CA0031.outlook.office365.com
 (2603:10b6:408:c0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:24 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:21 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/32] drm/amdkfd: add runtime enable operation
Date: Wed, 25 Jan 2023 14:53:48 -0500
Message-ID: <20230125195401.4183544-20-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|CY8PR12MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ec75be-f5f1-454c-aedf-08daff0df540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/4ZDLC/m2ux/S7YXSI/oIraNqqLyYN5FHXuR6dYz94Nh06hsDVkO8SZs/v56NvF+eS8myR/vDWqxDHxGKl7HWqhq4wNIvJn2w5iq8I3pZX4j6cbRcPz8dXgqsZErx+sfkG9ZYVaCBzrRNZWy3aJalTUm2nDyMORDl/wtPeW2BqwrMcWtIUbyps9JB2eauB4Qp/MKriaNPDh2i4zIa0/v+fhEMRv0BRsvrHVFxmAu78Snz0rGqtrYFXoVDxdThwt/6xt/rnmKpll7QOb7V8+9hnl/0yp590ELRGn1n9AyS8wGMe22kYcJZIzPdmEozxFHkbdx/tAmdIqDSTZ3P/Vb1AXgRueFQh8CdHRoXwdYPkYDhgIrEOQyhlViMlyxk68YD2rN1lB4S357xJC0qkBx7HcmPc9xr7Xnh+GDwi3dSBibizykcrxYnfmgY19fsa6owY55CrK8rTWSM5IEiitbxBVGp8gAUOl/E5DRQW7WYJCLRMVwRNerxhvucN6Sea4EL/jq1Ny0OLQLHD+t2QahC896CAk8YUbcit8poWXG0jciQ+WyyKMUrgMy6QW0jtuoEVWryg8VsxEf/zGvZm+haPn+lglK5yUVylPES2ghuN6ivt9tXO/zatqvYyeoEs+fXRWBgZ3a0aJIVwm+g2wTJtx/oyI+BEQcuOfbgyyF4J7GRn4sDZazQHfLxoHkmbbDTIQ/Xwl0XWEmfo2oXLrwq/Xkfi9loY2getXTmbznLA/bcaerzztVKWiFfg34L7ENewwA7x23mpMEv3eG4LVdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199018)(36840700001)(46966006)(40470700004)(40460700003)(4326008)(82310400005)(36756003)(2906002)(47076005)(86362001)(8676002)(44832011)(36860700001)(40480700001)(478600001)(70206006)(450100002)(356005)(82740400003)(81166007)(41300700001)(110136005)(83380400001)(6666004)(70586007)(54906003)(426003)(336012)(7696005)(5660300002)(2616005)(26005)(316002)(30864003)(8936002)(1076003)(16526019)(186003)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:24.0192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ec75be-f5f1-454c-aedf-08daff0df540
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7492
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

v2: fix up hierarchy of semantics in description.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 150 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   1 +
 4 files changed, 157 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 09fe8576dc8c..46f9d453dc5e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2654,11 +2654,147 @@ static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
 	return ret;
 }
 
-static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, void *data)
+static int runtime_enable(struct kfd_process *p, uint64_t r_debug,
+			bool enable_ttmp_setup)
 {
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
+			}
+
+			if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {
+				pdd->spi_dbg_override = pdd->dev->kfd2kgd->enable_debug_trap(
+						pdd->dev->adev,
+						false,
+						pdd->dev->vm_info.last_vmid_kfd);
+
+				if (!pdd->dev->shared_resources.enable_mes)
+					debug_refresh_runlist(pdd->dev->dqm);
+				else
+					kfd_dbg_set_mes_debug_mode(pdd);
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
+{
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
+	/* disable DISPATCH_PTR save */
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
+			if (!pdd->dev->shared_resources.enable_mes)
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
@@ -2720,6 +2856,18 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 4174b479ea6f..47f8425a0db3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -220,7 +220,7 @@ static int kfd_dbg_set_workaround(struct kfd_process *target, bool enable)
 	return r;
 }
 
-static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
+int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
 {
 	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
 	uint32_t flags = pdd->process->dbg_flags;
@@ -240,7 +240,7 @@ static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
  *				to unwind
  *		else: ignored
  */
-static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
+void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
 {
 	int i, count = 0;
 
@@ -311,7 +311,7 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
 	return 0;
 }
 
-static int kfd_dbg_trap_activate(struct kfd_process *target)
+int kfd_dbg_trap_activate(struct kfd_process *target)
 {
 	int i, r = 0, unwind_count = 0;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index fefb9dc5cf69..22707f7a2368 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -28,6 +28,8 @@
 void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
 					uint32_t vmid,
 					bool stall);
+void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
+int kfd_dbg_trap_activate(struct kfd_process *target);
 bool kfd_dbg_ev_raise(uint64_t event_mask,
 			struct kfd_process *process, struct kfd_dev *dev,
 			unsigned int source_id, bool use_worker,
@@ -80,4 +82,6 @@ static inline bool kfd_dbg_has_gws_support(struct kfd_dev *dev)
 	/* Assume debugging and cooperative launch supported otherwise. */
 	return true;
 }
+
+int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd);
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 4cb433a21e3d..63c59ad2a4ca 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -946,6 +946,7 @@ struct kfd_process {
 
 	/* Tracks runtime enable status */
 	struct semaphore runtime_enable_sema;
+	bool is_runtime_retry;
 	struct kfd_runtime_info runtime_info;
 
 };
-- 
2.25.1

