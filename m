Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894B71125F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB3710E722;
	Thu, 25 May 2023 17:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9682410E6FB;
 Thu, 25 May 2023 17:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA21/rpRht3AX5meTdJJLwxIUfLc5WPKxhR9fplg1Hi/bprDyfAacDS0EdYIhzG20c6IUCXtu54AJD/jthj8UrFQIQLzfkWg2KOEZysWq3rKIYR3lYTcIZWql6DZ35w2uL7LDlQGUdOA98VcmpkA/3uhD34Tud0sgueLs79p/avaaIJ18qonAfk1ckAfqA2y57Kk0kbmktTvOjiQYsVP0C9zNckMIZ6D2Qqj5cc5RCqxybopbfjeV/4fMOjKVuJSCI9a+CvZk053+equgVrLoPpazDj3E+Xlr8ttUiSayW7Y69ZSpBE/tcSOBqHMYxvU6hPDNLN3FUajWeOq0qmnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDdZAo+cQd8vbICg6ucKuG1tmkBO5w1p9gMuGI60q/Y=;
 b=Tzwr3ARRy5WNVU5bf4npiwkspf0YA39j/WNeGFeB+fDzg+B/wTTpmsy/T32wPp+l9zoXoi5j+NtaPWbV0BonIKJBDnx6lFaC61Zz8E/9bOieQcI8qMJUwjVIgETPMVQVT9tap4JV2Mu2ZzyG4SY5x4Z83BBU7YU0NXsechqI9DFynaKCad0qMitKyY+KxmVgyFlTEA/xnZZYfqAu6KJFoRqV4o+Z0A9ZJexpsKmH8blR19u67u8Bv4SgwjMeSIIcQNCGw6gSCk3an69V//tbdACwNp6tJXAILiQTlDFcept6/XSyZ+MOE+utGsDGw4InPJu+v+FwrC8GEWFUQoE0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDdZAo+cQd8vbICg6ucKuG1tmkBO5w1p9gMuGI60q/Y=;
 b=JawLFXV4eAPhH7Wvov5oKswtI+0wMWbNf0EXcBp+5++3l5Eanlm9raNT/HZ9O80bnFR6IUFbacPKUKx3GhmBKjwqQCQ5XaNF2k0lJRhpp6r0tQ18y5qzaTHdgYJR/3ysyOOi+SkY2R0u25LerDITko6KDrCE0bsiCHqmR5B9AVg=
Received: from MW4PR04CA0232.namprd04.prod.outlook.com (2603:10b6:303:87::27)
 by MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 17:28:08 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::e2) by MW4PR04CA0232.outlook.office365.com
 (2603:10b6:303:87::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:07 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:06 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 28/33] drm/amdkfd: add debug set flags operation
Date: Thu, 25 May 2023 13:27:40 -0400
Message-ID: <20230525172745.702700-28-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: c69132cb-2378-4d88-852b-08db5d4567d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EE9yJkmY2dUDGNQF1XKidMEVMJXuPNBYerKpxcBCzEnSZfJ4c36rd0XzK46B6i75iJ2+iacHx4mWiVbRXlqBQCB1eXWvHsYWJ65QjbL7VIEuFhr7Qmm9mGuSmms+SvBO1VfABObBCI8GweOsNXWgGaVyBWCFC/ad9b+dCjJeNTNkkVzovr3Q1nfo7bxeJSF+/L3p85Fih46av4UHjRvbd2u0o8sCvcyEqoTIBtuXgA2ypgaGxDMZ1dDbPj5jk3u2Cqc2qCOQ/ioPcspNds4qhJyWDCz+WU6hPLfAQScB5Z9hU8kfdl0ZEFQBElTu6Mh/nV+KepRYYW5YUHKRUwJahMAFAeJjMnrMUU9rldMXPKlLuVKbhp8rrosv1Cn9Bg3AHyQwEx2X+sv4g4toGpOYvJSTW/wmXbJfuO4WiTxB/FsKJxpu89r68dY/SOoXsBzswkrscArZyFwnOQXTlPbcHQ3zmfC2o4xOD2yyagN8NmcIQo7T7PxFCPTTLGLT1u2ojGQyfcVUcfYe/qARSxrJo+SR+oz5nw2EMISoFtbk25uk8Ro7XGu+qjZKnjSLG1WOvAFSXW8U3Rz+0IAHD1Er+AjBpcWeDwAZgymmQLvIv4f/PE5vA9uljOyJkMXRG+aT3hzohFVlCNUAUP/s8a2HumKl57gQYYtEXsisZ/0dfpkVSi/OhlkiN5/19cF/4nt5L7KEOk2HOB3ayomGNEowRLrkwzAqp+Ao3HJw4yyowlqINHYes0d7O9G/f98tValeVUekvtMT6nEgdQNO0ZW8Jg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(336012)(82310400005)(110136005)(4326008)(6636002)(70206006)(478600001)(86362001)(70586007)(6666004)(41300700001)(316002)(7696005)(450100002)(5660300002)(8936002)(8676002)(44832011)(40460700003)(26005)(1076003)(81166007)(356005)(82740400003)(40480700001)(186003)(16526019)(2906002)(36756003)(83380400001)(36860700001)(426003)(2616005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:07.7824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c69132cb-2378-4d88-852b-08db5d4567d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318
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

Allow the debugger to set single memory and single ALU operations.

Some exceptions are imprecise (memory violations, address watch) in the
sense that a trap occurs only when the exception interrupt occurs and
not at the non-halting faulty instruction.  Trap temporaries 0 & 1 save
the program counter address, which means that these values will not point
to the faulty instruction address but to whenever the interrupt was
raised.

Setting the Single Memory Operations flag will inject an automatic wait
on every memory operation instruction forcing imprecise memory exceptions
to become precise at the cost of performance.  This setting is not
permitted on debug devices that support only a global setting of this
option.

Return the previous set flags to the debugger as well.

v2: fixup with new kfd_node struct reference mes checks

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 58 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  1 +
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e88be582d44d..e5d95b144dcd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3035,6 +3035,8 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				args->clear_node_address_watch.id);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_FLAGS:
+		r = kfd_dbg_trap_set_flags(target, &args->set_flags.flags);
+		break;
 	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 4b36cc8b5fb7..43c3170998d3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -23,6 +23,7 @@
 #include "kfd_debug.h"
 #include "kfd_device_queue_manager.h"
 #include <linux/file.h>
+#include <uapi/linux/kfd_ioctl.h>
 
 #define MAX_WATCH_ADDRESSES	4
 
@@ -423,6 +424,59 @@ static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
 			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
 }
 
+int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags)
+{
+	uint32_t prev_flags = target->dbg_flags;
+	int i, r = 0, rewind_count = 0;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		if (!kfd_dbg_is_per_vmid_supported(target->pdds[i]->dev) &&
+			(*flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP)) {
+			*flags = prev_flags;
+			return -EACCES;
+		}
+	}
+
+	target->dbg_flags = *flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP;
+	*flags = prev_flags;
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
+			continue;
+
+		if (!pdd->dev->kfd->shared_resources.enable_mes)
+			r = debug_refresh_runlist(pdd->dev->dqm);
+		else
+			r = kfd_dbg_set_mes_debug_mode(pdd);
+
+		if (r) {
+			target->dbg_flags = prev_flags;
+			break;
+		}
+
+		rewind_count++;
+	}
+
+	/* Rewind flags */
+	if (r) {
+		target->dbg_flags = prev_flags;
+
+		for (i = 0; i < rewind_count; i++) {
+			struct kfd_process_device *pdd = target->pdds[i];
+
+			if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
+				continue;
+
+			if (!pdd->dev->kfd->shared_resources.enable_mes)
+				debug_refresh_runlist(pdd->dev->dqm);
+			else
+				kfd_dbg_set_mes_debug_mode(pdd);
+		}
+	}
+
+	return r;
+}
 
 /* kfd_dbg_trap_deactivate:
  *	target: target process
@@ -437,9 +491,13 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 	int i;
 
 	if (!unwind) {
+		uint32_t flags = 0;
+
 		cancel_work_sync(&target->debug_event_workarea);
 		kfd_dbg_clear_process_address_watch(target);
 		kfd_dbg_trap_set_wave_launch_mode(target, 0);
+
+		kfd_dbg_trap_set_flags(target, &flags);
 	}
 
 	for (i = 0; i < target->n_pdds; i++) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 7f0757c2af2c..ef8e9f7f1716 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -57,6 +57,7 @@ int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
 					uint32_t watch_address_mask,
 					uint32_t *watch_id,
 					uint32_t watch_mode);
+int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags);
 int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
 					unsigned int dev_id,
 					unsigned int queue_id,
-- 
2.25.1

