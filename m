Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BCE67BB5F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCCC10E834;
	Wed, 25 Jan 2023 19:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318EC10E81D;
 Wed, 25 Jan 2023 19:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAs7cqT1k2q/oWZau2rP26kF4v0bTn1JKsiF0vt7nTnuNS+W9RriJKF3R3JH4h7ikKiboN0gM3TsB6+kIUUDd7XCC060jOdimvcds5gZwNXmRSZ64LLhpCQVRohcJrc3xvI7/2jgB6OhRrmHJRmoI6qs7Bq29prd4skF74JFpaxRVoG5aGKgnwcVRU0JKmHdmbJCfqwOsfY2rlziChCEjae03GqQoxUXxN1muDDw8dwViYE8v58lCweeZcA250yitXnrBJdzfo9dfW27FU+UvDRLaR5HTjuvVLXKxLuxpOZ9Ztw4lH0ha324rbXRJevxY2+DFqGtWHTNO9SOXwvKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tJ8lzR70m1z92n9QlIoFpdWRvanq9TA56GbuG5f6D8=;
 b=DeQ3n97/0bf77CMUbYIJSLEdysAr7qWi3VzizE8SlBj5C3lOhcCPRcsaNkpoBLSHKas+wDA7TvEoB+YE2RQHJe56nGNTaLN8ZA9hK0s0nGMgpTvfI41ucVi2uSvSPCgld+h70xwmT84HNnJKENlggc3qZGjFwaa5XODJuWiSFmyaE+zMm+C8z8ixNxCtMMXvyZnFNdbhaBQkdA7lXgKjHRBn9+LrJT50FqmdiFdy9RRv6xNo6BeXcOE0q3L2LK22zcojOP/J96/KruxOBhMwFT6nKIn0XWwCU5l4Nto+S+wODGBHojJWJm6YaP/5J2jlKgr/mL7tbad/ftlVPzUSoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tJ8lzR70m1z92n9QlIoFpdWRvanq9TA56GbuG5f6D8=;
 b=jG8I3MI3jitxUQn6eEBafu0FZCjKjU8XHlM+uLi+L8MJUyiRoiI1//QjomYD2xes7ZraDdPeyLN73pPvv8rqyWjACWJC5YL4Yj+LlII99Ai9S+L1MY0grKnqjs1sZsli7o2fk9x6nsmR2AiJAmYjVlDxaIVyVFUyPIs/qlck1Z4=
Received: from BN9PR03CA0696.namprd03.prod.outlook.com (2603:10b6:408:ef::11)
 by DS0PR12MB7851.namprd12.prod.outlook.com (2603:10b6:8:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:26 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::7) by BN9PR03CA0696.outlook.office365.com
 (2603:10b6:408:ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:26 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:25 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/32] drm/amdkfd: add debug set flags operation
Date: Wed, 25 Jan 2023 14:53:56 -0500
Message-ID: <20230125195401.4183544-28-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|DS0PR12MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: d349f107-6d43-4904-6ff5-08daff0df679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++wr450Z1ETcq3U5Y326wUzj56j5iFXibvKkD6WtmyRQhwoYJpvfGsioVc/umEU8Sq/ym4Ux56PpgG7ptpYKO4IWulhHovVDbWqqIqqj8gPNdk1NPPkg2wN8OuHNElbO7elKWjfoFDFT8aihOPQkAXx+iSmardo/Ke7ktPy/H6MCkZNEM8l2/c1xQGQsSFz0n3RZHWW7QI2MXrAc7qz/CguC/ps80YJsttwHEssFSlSKeZpKXMnCFUkTQKSsBZPDbcTlhfXBV8igKE5bmlqPxSZpyqGJ1lmKdVABeSuLLYtGo0ooBp05JEnIghehWLOxONLsUX9f93A5ABW/qgEfLYnUmzGvqHBkHsgP633vi84YzB/0PXWU3gNEmcXKrM5FBVChf6x+bPu6cCuFN0xqVpQKi6ygZBjEUzbqpXwsjsI3aPPVmlkyEugSyfODRC9Pgan+8Xbq89yHO4XveWPPa85msdg0YFAGnv5fAHUpeaXCAUcAV4XVmua6aLOt8nIIwKlxo0SeAdY+eP6jS2F5sOJMGtR4HkV110k5rWHYH7wY45NCbCPzofGWNI0Wtox1uFNMl0Jrf8UX6Smmjo+Jh1HYi+NyZWDT+G4ppVZ7aM4zYcpdl2mCeJ0cF4aLjW6ftJ6t4dk9rTo7ryeSRBsjnM9Up75Y3eDZ5OyEGex9ZhdFt5E/NHrhPC04yL1TC5u0KeA5FP5Mav+SBGGk0Z/YEAGPjTLsm+8lemQXkfMtl/U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(86362001)(36860700001)(83380400001)(5660300002)(186003)(336012)(47076005)(6666004)(110136005)(316002)(8676002)(478600001)(426003)(16526019)(26005)(70206006)(70586007)(2616005)(36756003)(7696005)(54906003)(450100002)(82740400003)(356005)(2906002)(40480700001)(41300700001)(40460700003)(82310400005)(1076003)(4326008)(81166007)(44832011)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:26.0689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d349f107-6d43-4904-6ff5-08daff0df679
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7851
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

v3: make precise mem op the only available flag for now.

v2: add gfx11 support.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 38 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  1 +
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 8f2ede781863..c34caa14b84e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2947,6 +2947,8 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				args->clear_node_address_watch.id);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_FLAGS:
+		r = kfd_dbg_trap_set_flags(target, &args->set_flags.flags);
+		break;
 	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
 	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 8d2e1adb442d..77ba7da2bb9d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -23,6 +23,7 @@
 #include "kfd_debug.h"
 #include "kfd_device_queue_manager.h"
 #include <linux/file.h>
+#include <uapi/linux/kfd_ioctl.h>
 
 #define MAX_WATCH_ADDRESSES	4
 
@@ -425,6 +426,40 @@ static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
 			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
 }
 
+int kfd_dbg_trap_set_flags(struct kfd_process *target, uint32_t *flags)
+{
+	uint32_t prev_flags = target->dbg_flags;
+	int i, r = 0;
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
+		if (!pdd->dev->shared_resources.enable_mes)
+			r = debug_refresh_runlist(pdd->dev->dqm);
+		else
+			r = kfd_dbg_set_mes_debug_mode(pdd);
+
+		if (r) {
+			target->dbg_flags = prev_flags;
+			break;
+		}
+	}
+
+	return r;
+}
 
 /* kfd_dbg_trap_deactivate:
  *	target: target process
@@ -439,9 +474,12 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 	int i, count = 0;
 
 	if (!unwind) {
+		uint32_t flags = 0;
 		cancel_work_sync(&target->debug_event_workarea);
 		kfd_dbg_clear_process_address_watch(target);
 		kfd_dbg_trap_set_wave_launch_mode(target, 0);
+
+		kfd_dbg_trap_set_flags(target, &flags);
 	}
 
 	for (i = 0; i < target->n_pdds; i++) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 63c716ce5ab9..782362d82890 100644
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

