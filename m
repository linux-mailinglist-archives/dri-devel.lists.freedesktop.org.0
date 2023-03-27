Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD8C6CAD9E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BCE10E701;
	Mon, 27 Mar 2023 18:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F3410E6C6;
 Mon, 27 Mar 2023 18:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwcvSvq5Y9D9wr0VhMae5aPJjZGDFROysU++h49g2+5r3eC6eVkDaLBRozeDWNMZpedO2EL2QJNblxcv660iOH/RN0embeRidXpw4nW8nF4yCNmDK8swdnO6QpR37i3N4l+/oQNXmfmXL546Kiqp3uYSOZfFCm4TthF8AV2VVIYRjKK8Fd30GeLnyl5m2xw/+Oc76DpmC6mPiVtTsiXEnMdA8hKoubWpHgjSHy7EI51lsipajU2/hUu1NKiPVJHFkBYHSYLdbFlL3cpmeoH1n+msSIxaOiZMIqpN+sPoA8m+KTi0Jb1/o7wzStqVz1mkEftdlkmURP+Yx1jqMklopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfC1VaX4cQdtYs9YRieZUdyv5W+wzaTRmlWC10i9j0E=;
 b=Aom12XhLKMNe261WOPYWrs0kQMBF3LZUn7kPGJjFZr3f+L+8qOgGe7FAnS2BHOFQXKq4G+dwdpRn7pC0azQxHbumV/LrF1IOPL6Mh45ePk+F8AdrzD2PgvVIMg1CFHN13PgVWvKFON6jW4oRpFbXCUOlrmsO6oHg7Qt0dE7yK3Yw777f0sm22kF1AqHreOOQPDBwZZXuifqoPwJrf7FI2wqtvpba/DyIXoV7Zz0tr86hOoDR1dLtAr9jG3RQAPLEJ5aj9LkZOyY6TWxSUt14ZecewmKxrnSWnNf0JkhwO4T/zc0BN6IYRcIscjBUAuYLLSRteZMr6MdktggvaF59wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfC1VaX4cQdtYs9YRieZUdyv5W+wzaTRmlWC10i9j0E=;
 b=aBs9RrTmmIU1CLd746GaAl1IOmJPvPqpdXvcWZ1Yzy42IadbZ/3lb/Co0SdzIg6GSsag185CcPZu5T9KAvT9JJZ99UIse1QQ0YmuG/t5Oksng0aiIsEIjsgmnVxXgLKcGvvRD38NVHAc80iR6xHBlOOXEyV83ChAeWQTazt2EZk=
Received: from CY5PR18CA0025.namprd18.prod.outlook.com (2603:10b6:930:5::22)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:57 +0000
Received: from CY4PEPF0000C97C.namprd02.prod.outlook.com
 (2603:10b6:930:5:cafe::71) by CY5PR18CA0025.outlook.office365.com
 (2603:10b6:930:5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97C.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:56 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:55 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/34] drm/amdkfd: add runtime enable operation
Date: Mon, 27 Mar 2023 14:43:25 -0400
Message-ID: <20230327184339.125016-20-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97C:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cd60e7-b59f-4383-409d-08db2ef338de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +w7T9bZZz0WWrwsb9IuHnGiGy6egdiRtfpvOQqlQoGolTLdOiEU8RK4FyeX+7tNUdbdrGhl+6TIbNI35MR741DkBdARV3jqjFlk05wVSjUxywsw4BW50XJ+AaXZ+2xJj3GVHzR6cnF5nbvYIA5UCDka62mj11B/xqDBdJG2XrTUM/b2hpiaVixigjDIKlE8oagjd6SqW/B+RY2sDjJ13+ogkDdevb0/A9tEXqqQZS7hyWT0fD7/itb5GfnAVidP+yetkpZO8SzYOl5hgPtKmdLWGpzVc7D97hk0p4So6R/loura2zNvSdEk9Vd1qwKp2mmYj8mIGp0hNahibyg3QSedqMlLP2Vw1VBPuT0UBh1XBCuOHpHN2S7eFhLYsPpXIxjdhvaS5jlCqiPPdeWA4XMQ5w9Pd8bWHoic6ZcOH7sJt8r3JdcFo8qiM0uFkb3TbSAU+xJaGmxJtP51EYcNSwXswvEHN71gHCeMClKxbUIm7ryaJp4wwRtAA6gdBk0eFcr4G0GYbeI7QH42vQZCwxaVJxEtr4ORzObEskCwsbayvG3UYmhDiQCYszL6wBJGXXwBC2XGPeyGNUZ40JWh3e3hw60flxK0q42/EehzQn9hCIfAZ+joohncbksF+wK5StMEG9Tc1sKFAJHralBtmO3q4PLxyU/DK7ZnH9ysi35c25FQQcEqgHvFqkA8L8LOwUkC6SyjauyT42W0BJ+Y8is+9kxD+q8lFIkdUz5wqNPu8dqFus0eSPkKxsAZjYgqc0ST4bqvc4EJA9auMfV7U6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(26005)(40460700003)(8676002)(4326008)(110136005)(316002)(70586007)(70206006)(36860700001)(5660300002)(41300700001)(450100002)(8936002)(54906003)(186003)(16526019)(81166007)(30864003)(82740400003)(47076005)(7696005)(2616005)(426003)(1076003)(336012)(83380400001)(6666004)(478600001)(40480700001)(44832011)(86362001)(356005)(2906002)(82310400005)(36756003)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:56.7983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cd60e7-b59f-4383-409d-08db2ef338de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
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

v3: fix and cleanup ttmp_setup for runtime_enable.

v2: fix up hierarchy of semantics in description.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 143 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   1 +
 4 files changed, 150 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index c48d4598583a..2a8d30dbb3f6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2724,11 +2724,140 @@ static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
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
@@ -2801,6 +2930,18 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index b3bd101b3b34..f498987dc21d 100644
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
index adde17c45b4f..5b46b9d4420d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -25,6 +25,8 @@
 
 #include "kfd_priv.h"
 
+void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
+int kfd_dbg_trap_activate(struct kfd_process *target);
 bool kfd_dbg_ev_raise(uint64_t event_mask,
 			struct kfd_process *process, struct kfd_dev *dev,
 			unsigned int source_id, bool use_worker,
@@ -77,4 +79,6 @@ static inline bool kfd_dbg_has_gws_support(struct kfd_dev *dev)
 	/* Assume debugging and cooperative launch supported otherwise. */
 	return true;
 }
+
+int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd);
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index ee579b27586a..d092c81c9dc2 100644
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

