Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F428FE728
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A58410E942;
	Thu,  6 Jun 2024 13:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gkw8jhgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0610E942
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNS+iE+yFcpRPBc1hwhY5LNsAKhh9mo+yXtZMfChp7xzPU79rkzVhMP+W+FTLMvHnDGSbJzlCiD2ssGxYiFNrSYOMAbcxNeDc6ekkLpsX83AX6LKnIZ84nKGNfaIk6haAsSADjkFfUpmIbKYvJGA++awb+JsFjKwWRgsFETu2JPxjJAP49MbnGNQBP4t+v6d1g4Mv6J4+dQ9BH9AjGYubgwTHlGCtnudnE33csRR5Z84GLhIyuipB/QoYDct9T0cuCRkXAvzAoP2Q20yPxREMByW7kM/SCpGkML5mrTnc2d+NvuCiXDEghFCmdaCaawyNDBJQZ7nz+xOWJevDn6hyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSETJAHvqBwWDm5S1kh8Fkq6AAVWjWbCPKfjkAalKU8=;
 b=laBRQhDt4ryyGuMpmc8n8KydSWbMWA7MH6k9bV5r/swTaw4ImHZ1KOsVS8Jd2aIfXVc2eeLfrsOD0+gTwfycReo8+6qOndwY4s0HEiLmiAiiPvbgkJ5pBWI7TlXszXv6qQIphdzBzmGo8lDskvfS33ZkCIjQFPaltaEEk/+tMEZwdtJgjrOyFWbutiRXSyuykoKE8X8PXc13RtswqIw0XW941/BZYDe+VoIKfSwyW0zTDGZIWBF6VfWrL3Ng4t6XPoZX58qfyr/Ucao4rv2c2HwVVi/Xu2FsL/ep6jrzSr1kny/HWrBTIJShSFOaOQFVWk2M1ziyuPYErZrIxOLMBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSETJAHvqBwWDm5S1kh8Fkq6AAVWjWbCPKfjkAalKU8=;
 b=Gkw8jhgZ/9TAoNiDQ5bjfzVi5TU4Hls0nDWcApuHU1gCtVjXzZLF/aMvCjyKr4VbU6ywfrCNhP4CXEklGVhQodq7+JXAKY43XQIIB2Yjaaj/1JFznUUA8sVJAt3H7YGohPjQMWCtDHrjBcGT1tfSFUUKKfPbValk7KOMfraNTDo=
Received: from MW4P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::17)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 13:08:00 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::50) by MW4P223CA0012.outlook.office365.com
 (2603:10b6:303:80::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Thu, 6 Jun 2024 13:08:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 13:08:00 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 08:07:54 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 2/4] drm/sched: add dev_index=xx to the
 drm_sched_process_job event
Date: Thu, 6 Jun 2024 15:06:23 +0200
Message-ID: <20240606130629.214827-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|MN2PR12MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 0026fd3f-ac53-4fc1-5aad-08dc8629b131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|376005|7416005|82310400017|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4WYYnyWbRLf1f4EHxY9OiweAtr2eyg2vvLl9ezEBHm0gTnwhNBKjpaM3BFVR?=
 =?us-ascii?Q?uz9guQhKA2V8x9BcDuQ5u5jZnFytU42ZhzkpTRJwux7TlhpvqoKivyuzbFjV?=
 =?us-ascii?Q?LYQ/ozHLd+miabieXq/jfRVxUQ34RRbCrfRzwAOPNUkW2MQAjW4yJBxcOKgB?=
 =?us-ascii?Q?ZpPz+SU8scDKojmLFHG6BNEiqg6oFZAYSbyHR8kvSygn7W55yBDt61PS/3o8?=
 =?us-ascii?Q?awfVY9ifwcxPm656tdtZzBdOaW3O7rqkULIU4sP6KS9z4oC4QhdP7IAML5i5?=
 =?us-ascii?Q?EC+wWXOUCZbzgJyDBQM0/BUfOPwrza4okdjl3x1wG8PDJvD0ILMYpGu4BbTT?=
 =?us-ascii?Q?l42ejYkL6IeDWbODioYviibXF6vIWC9EHGA9L/L+9F4Bnftowk4LbaPFrkAl?=
 =?us-ascii?Q?f7Oc4QD52/tZMk2rL4BioOhycqc0hflLNZmyR0reInSFT4JYjDH6+kqbQjtN?=
 =?us-ascii?Q?znIVdZV6ttHBOcwCEVKlXbDrdO0ZFgmARJ9tBeOYKst7Yjotz2PX0apRAEPq?=
 =?us-ascii?Q?NPri+T5wV7fRIsHCvG5MrcjwBmXjqPpPskjGHLrXRNXsnJNVeM8wYKfjy7t9?=
 =?us-ascii?Q?67RQvarT+sxIohCSIdXA6aBKJbtMZJTaEU9FSqahnGPqWgIdpq4MxZpiXyh/?=
 =?us-ascii?Q?DUB1lf48gWi55uSNMbPkJyTgiPgWdok3Ake1eoz/gb9+shiSL7gwHMmOIJgF?=
 =?us-ascii?Q?mwrhXVZDhgC33vnVRvV2wlTpfKcAxxpuZq8YujrORRzC9qjKwUEpEewD7nbU?=
 =?us-ascii?Q?kbiNG2qaTTBtZfwWz0wb5kMxzceXBRWXfaT5KO5uB1k48vXFV6ULeao8pJdn?=
 =?us-ascii?Q?Atik2JMNJmlNH9x/t+gUXS7TOhnumrb1qNV159lBnUko9fVg10oDRWlkcCxT?=
 =?us-ascii?Q?m49a2kP8TBZKp0S5jCzz3+cyOHCF/YEdprzxBjpunHd8SOunNIJidi4Hf686?=
 =?us-ascii?Q?W0q6SIRkhL4Vc8jDbGX4ynYUpFMctp77+hUqbMyQQYrzcVf8zup+/1KUaan/?=
 =?us-ascii?Q?SBUkeBIdxmCAXw9YUFbRkwghX3/CqYVy/304N0clKCE+IQb+XHa4dj0tJhC9?=
 =?us-ascii?Q?y2AvYFByIswvBlqJU3LisvQp/oWb2rwcbXbyXyKbhOjXr/b66hplGjI+w9bQ?=
 =?us-ascii?Q?U9z+r58N5nt+fWIx2+c9gpXYMfwcI9wHQQHiATFrwQqc24Ge40OazauvNP2a?=
 =?us-ascii?Q?W340swT4rQeIUjssoTyVpY+digA/5z2TCVcWwb8gASS59WsujOLBSPDsJEsV?=
 =?us-ascii?Q?3X6EPvyoDIB0kRXPmh5KAQHjCl46JRKanmnMzzKD3GQ9ZE7r0z0b+YXy7iSg?=
 =?us-ascii?Q?h3Urd8uIpcn8xcaUDZ1xgDbtxZk0Sfyx4csFw6nYf62q0nIrRTTd/56ow+n+?=
 =?us-ascii?Q?hKDEMdau37vdSonFgheHEeye2Cwi7fS7expF8oyD0LJhwjID9faO92YrTHed?=
 =?us-ascii?Q?giE3D08jQKw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(7416005)(82310400017)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 13:08:00.0444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0026fd3f-ac53-4fc1-5aad-08dc8629b131
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until the switch from kthread to workqueue, a userspace application could
determine the device index from the pid of the thread sending this event.

With workqueues this is not possible anymore, so the event needs to contain
this information (the ring name alone is not enough, because they're not
unique).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c75302ca3427..0a19c121bda5 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -28,6 +28,9 @@
 #include <linux/types.h>
 #include <linux/tracepoint.h>
 
+#include "drm/drm_device.h"
+#include "drm/drm_file.h"
+
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM gpu_scheduler
 #define TRACE_INCLUDE_FILE gpu_scheduler_trace
@@ -42,6 +45,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
+			     __field(int, dev_index)
 			     ),
 
 	    TP_fast_assign(
@@ -52,6 +56,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->credit_count);
+			   __entry->dev_index = sched_job->sched->dev->primary->index;
 			   ),
 	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
 		      __entry->entity, __entry->id,
@@ -64,9 +69,13 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
 	    TP_ARGS(sched_job, entity)
 );
 
-DEFINE_EVENT(drm_sched_job, drm_run_job,
+DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
-	    TP_ARGS(sched_job, entity)
+	    TP_ARGS(sched_job, entity),
+	    TP_printk("dev_index=%d entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
+		      __entry->dev_index, __entry->entity, __entry->id,
+		      __entry->fence, __get_str(name),
+		      __entry->job_count, __entry->hw_job_count)
 );
 
 TRACE_EVENT(drm_sched_process_job,
-- 
2.40.1

