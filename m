Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF76A711246
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A98610E708;
	Thu, 25 May 2023 17:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046DA10E6EE;
 Thu, 25 May 2023 17:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f90VLp4EUKKTJS7vID2b4h8Lualpu9xmkt5QvSS2WiJIxHqmWXhZe33CzCK98mCpz7QaFjnMWQnqsCfmJ25mTSUBX/hqmCZx4oJWEMElEFPMxD/schXuGFO7q5pOmboqK6BU6+sJ0WClOjSlBIdVWUq72Aa8CA8EU2/Q4wtKbmyzk+sSrqDYRwVRlEK7qf5T30GR4sM0RObfkYu+1r09ARUwjTIbBwlRy+Mw48lWM0WVXtCHUdaW9PsPj2DGZXYgDx+Qmo6mTNZJ/IC4//cKmYGR8mUDIyvlambXTnsTlnEqdq+eE5eQBrpSQeJlfrQuq3f/DnuHwXu/bReYPDpKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1G92f2NYMVYF+RJNQq9qBeWbIreZaooDKOUhm9q/0Q=;
 b=F8u5ez5r4O9RvoogMCc7izFVpflZkO31xmwobrNMDPXAmvSQwjcB+zPnCnq4nqSdanRw4wxwBaoGXZyTHl1F3gAeRI1xdcGpTNBmdikD/pBoTZ3C7Ay75QFGNydgQGCBG8k87mveKa0kTYwVK9yBt+PJ08/rrRLo9+DWfq5BwMXDA+Z9VFz6AnOSKvfODhwri1+XqYAGuSaxa7vovsiZ8zuGnxadS1LKXgLhmAvyglZoTc0e8gJOV8ENlAyunwb1esPF6nMwTlQVhP2vsbouxBReg7fp9fpbMj7xtEhahN5MOdxs3azLGBdU6Vp+fYu1qjHXTBWp0hzyL2/dbBaPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1G92f2NYMVYF+RJNQq9qBeWbIreZaooDKOUhm9q/0Q=;
 b=ywdpfJwH7InLWHAxwfvKD3IUHdYsE/YzUeX0y3uOQnNlK+43OB3RwG4s5kTzTHBmD1BU0tff5IFditX8SHQFXPVRYRH5btlmfo9Go640H352ZlVGuxzOEgu6oJ1095p9ksZDyC4Zd10f9hy79GNvAFkcTXAS1pcRbNLazb2DFiQ=
Received: from MW4PR03CA0147.namprd03.prod.outlook.com (2603:10b6:303:8c::32)
 by CY8PR12MB7754.namprd12.prod.outlook.com (2603:10b6:930:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 17:28:08 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::9) by MW4PR03CA0147.outlook.office365.com
 (2603:10b6:303:8c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:08 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:06 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 29/33] drm/amdkfd: add debug query event operation
Date: Thu, 25 May 2023 13:27:41 -0400
Message-ID: <20230525172745.702700-29-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|CY8PR12MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: a3b08cee-e15e-4683-9725-08db5d456807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UcSbcNEijv2ObVhHgdPJkgGfs7ddHFbboaf1jyLi26RXJHA7ZZ0J9dikaSSqhNdmikFd7zaiQbd5gihN2UKmlxjvYfNq4djMYv/kjMTdeiOUOVTVLiJCqq+MCWZ+Xp36s7rVjp6fNPfUhYS+VuuaLn7XtNklFmsgUUnXYzpdDNoShZMH4Oa4BeuJvyDaeVMpgP5uMvtr9O1n5VcZgrKyOUTQsPu3BjKB57l4WbrRlXl6mushBTZR8YlEHOwpWS7n70NpSqLQPycCqYVGysUHFdCBO+aREYL4Ga9q6Kz/RLDMEFi2ueff+F/ZZ2YTjH4XXWwYeiF/NT6Jno307txWQTFKYhBxdVLxDNPTdOr71EvKlV87lMy0kVyIHzw6OoYs8Mug73IVAtdWl0U/p4WaHKJmTR5rvEZVwcS+XJb7WPTYSIdqdkQ+mfwb6nd4BhEI4DzmIrUdj77i64a6sFaDyox2qNOmkikznDFqPCYvNWxk/e41V3YFK98lQ07LGBcKhz0MCEeG+kdgvIIPDLJOhzI3rF7bjIiLJmxNQtdduitkKlcOOQTd6n7O3tuK6WomoBzVWlwOMEzbWxFLLnVSltwmdmQFMqq02VlHTLp8WSJfPwvshBKaaTpkgbnKdL7+pR8hnxpvfvpgfz2QlzFEs98SuUlAbd7mcVzAXQ8orRjFoBGej0dGrPSiMH1zS2vwemVxjJAQOrifDiGj5VEDDnt7+tyy/NyACFdb0QHw2esu6GpDnT0WsuP/J0J+E/ZuwXjYq8tVf7sPTfq93AID+A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(36756003)(86362001)(110136005)(4326008)(6636002)(316002)(450100002)(70206006)(70586007)(478600001)(40480700001)(7696005)(6666004)(82310400005)(8676002)(8936002)(5660300002)(41300700001)(2906002)(44832011)(82740400003)(81166007)(356005)(426003)(2616005)(26005)(36860700001)(186003)(16526019)(1076003)(47076005)(83380400001)(336012)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:08.1105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b08cee-e15e-4683-9725-08db5d456807
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7754
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

Allow the debugger to query a single queue, device and process
exception.
The KFD should also return the GPU or Queue id of the exception.
The debugger also has the option of clearing exceptions after
being queried.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  6 +++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 64 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  5 ++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e5d95b144dcd..ebb2088d12fa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3038,6 +3038,12 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		r = kfd_dbg_trap_set_flags(target, &args->set_flags.flags);
 		break;
 	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
+		r = kfd_dbg_ev_query_debug_event(target,
+				&args->query_debug_event.queue_id,
+				&args->query_debug_event.gpu_id,
+				args->query_debug_event.exception_mask,
+				&args->query_debug_event.exception_mask);
+		break;
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
 	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 43c3170998d3..e9530e682e85 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -27,6 +27,70 @@
 
 #define MAX_WATCH_ADDRESSES	4
 
+int kfd_dbg_ev_query_debug_event(struct kfd_process *process,
+		      unsigned int *queue_id,
+		      unsigned int *gpu_id,
+		      uint64_t exception_clear_mask,
+		      uint64_t *event_status)
+{
+	struct process_queue_manager *pqm;
+	struct process_queue_node *pqn;
+	int i;
+
+	if (!(process && process->debug_trap_enabled))
+		return -ENODATA;
+
+	mutex_lock(&process->event_mutex);
+	*event_status = 0;
+	*queue_id = 0;
+	*gpu_id = 0;
+
+	/* find and report queue events */
+	pqm = &process->pqm;
+	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
+		uint64_t tmp = process->exception_enable_mask;
+
+		if (!pqn->q)
+			continue;
+
+		tmp &= pqn->q->properties.exception_status;
+
+		if (!tmp)
+			continue;
+
+		*event_status = pqn->q->properties.exception_status;
+		*queue_id = pqn->q->properties.queue_id;
+		*gpu_id = pqn->q->device->id;
+		pqn->q->properties.exception_status &= ~exception_clear_mask;
+		goto out;
+	}
+
+	/* find and report device events */
+	for (i = 0; i < process->n_pdds; i++) {
+		struct kfd_process_device *pdd = process->pdds[i];
+		uint64_t tmp = process->exception_enable_mask
+						& pdd->exception_status;
+
+		if (!tmp)
+			continue;
+
+		*event_status = pdd->exception_status;
+		*gpu_id = pdd->dev->id;
+		pdd->exception_status &= ~exception_clear_mask;
+		goto out;
+	}
+
+	/* report process events */
+	if (process->exception_enable_mask & process->exception_status) {
+		*event_status = process->exception_status;
+		process->exception_status &= ~exception_clear_mask;
+	}
+
+out:
+	mutex_unlock(&process->event_mutex);
+	return *event_status ? 0 : -EAGAIN;
+}
+
 void debug_event_write_work_handler(struct work_struct *work)
 {
 	struct kfd_process *process;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index ef8e9f7f1716..e78f954c0684 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -27,6 +27,11 @@
 
 void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
 int kfd_dbg_trap_activate(struct kfd_process *target);
+int kfd_dbg_ev_query_debug_event(struct kfd_process *process,
+			unsigned int *queue_id,
+			unsigned int *gpu_id,
+			uint64_t exception_clear_mask,
+			uint64_t *event_status);
 bool kfd_set_dbg_ev_from_interrupt(struct kfd_node *dev,
 				   unsigned int pasid,
 				   uint32_t doorbell_id,
-- 
2.25.1

