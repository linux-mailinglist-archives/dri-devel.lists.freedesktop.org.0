Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F138FE72A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890A110E947;
	Thu,  6 Jun 2024 13:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AZOR3pLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B469210E947
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCzrgfF1DgFvwJwJS/82zSwxtJIf06Flon117GwhNn5POFh+gaGO34DbxnwPtekbTpwx/J1PhZW3TmDQHbdOIfZpqjmwDm7gjjNoUzh6mGmCFr1J2QoHMtOKN/HSJ8jvJ8xMzD96vFK+8FjcqhwPWMDPpHFZl8e/KXqCDgUjJj35IBolo3UinxI3RDQ5Sam9olgCG3nd7izSsb1a/aEgtnCUeOJKurPFTw/BZId7uhP7VXZhZldNyzQxJfk/GqH4U6H5pLZzKzLUi+/Zp5SVbQ7bEsF4sjweZetUVPtlzp1SkWOO2A5GwiYTg8wBEhTVEjE9mrWlEr3mXQSf1WALaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIQKmQtQR53NBfqt/4xELQNRXqEZckHTu3tHFvKbGmI=;
 b=CEIJX9jWJ5uv2FTxpDdzfzb2lgljrPPSZGeFbxSHxo7o37buppdEwGZ1xyF7du3YWitspu02B/+MQI3upBfR/bykd+UB8wzHIaXnMbvGP5JjwK1Y7TIVjFkkmZtY3/NBpDFVLLKCBMl6TUNMvTxLVGjFkvZmcNXw4IQgDC8N6uXKSXl9KOgmAL/zyFNmG6b14OuvIBLrI6M5zNP0DkfGTawrdegepFwlUTCRiPAB9t7ugpqGNoBulf3XL/EIsCAFGj0U0Njz9Ux0pvimIDrHaFP6DQW0nM2sMIPGLtBJ6fToapIybjnSk+KhpqxAWdORtesqF2PUfrtczLDRH8EK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIQKmQtQR53NBfqt/4xELQNRXqEZckHTu3tHFvKbGmI=;
 b=AZOR3pLln6BhdqaTEU26nNQvXx7tassA7avFbcQ18pIyyEimTqzD42YnteHyh8RdvRcLrMjtOJZA+TYrxf4Eyf4vZiYTexucang4Z3R8SLgHIIAvufGItZzVbFPv1OSFemyZ9sj4ljRq4/G7yv6eu2AU279nMunj4S6G29PJx1U=
Received: from SJ0PR03CA0197.namprd03.prod.outlook.com (2603:10b6:a03:2ef::22)
 by SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 6 Jun
 2024 13:08:10 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::bc) by SJ0PR03CA0197.outlook.office365.com
 (2603:10b6:a03:2ef::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Thu, 6 Jun 2024 13:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 13:08:09 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 08:08:01 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 4/4] drm/sched: trace dependencies for gpu jobs
Date: Thu, 6 Jun 2024 15:06:25 +0200
Message-ID: <20240606130629.214827-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SJ0PR12MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ec1457-f44d-449a-96ba-08dc8629b6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|1800799015|7416005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hn9s8M6nKf/CAnPhV3ezaTrYFw0W965SES24smIb2P+6KwqGGowTH4H1ERvq?=
 =?us-ascii?Q?fU2c6a0EvyMy03UTvmvb1jmvtOhA9+TkPnQIzk9OswyInhD/Uj84vqV2s2Fj?=
 =?us-ascii?Q?kAhl0WcXpRw+8RICMoPWxpLJ8zF9t3Isblo4kmj3UWDLdoEz0z4FDd2jo55f?=
 =?us-ascii?Q?bFSlKOKNtd72DHSA2ToEAHyvVB6hCBhFPwCXL/VsGJyD0hKeTg0TfDB45I5g?=
 =?us-ascii?Q?Vy5t4CPpYWQbJMRyK7vjlyEyYUdjSgINs5QV7TljnC3Cri2eQP2Eol5LLq6U?=
 =?us-ascii?Q?nubqe6+B6ACLdu1iDmrjzmvTgF65fQQTBWVb6q0Swn9q6eBECfMtbbe/fgts?=
 =?us-ascii?Q?HWsp/LNyevb2qPRGRyd6Roqdm8RkScchB+z7XZy86WGv6geTD3+ZrZnEzRqH?=
 =?us-ascii?Q?grs87DEF9npYDNYu0IQvVJqpBKu+8thmxMflReDMmWgZSI60Y6cKr16Srk5Y?=
 =?us-ascii?Q?uirzgnDjhXuk2a5z3vmoEzWUuf6CYok3XPbXLuFmAKtqqkP9KQCruV6jWXgF?=
 =?us-ascii?Q?dqGuoUrXEcwbzJPl7bKQFeyiheAxH6quLOBd3bTjNd8UyxuS48CrtzJqpZI9?=
 =?us-ascii?Q?mNLdQHSdppth354WkFZx34STp1jOZHFG99u+fu+JO3tAe4/mHWcU6TrtHUhJ?=
 =?us-ascii?Q?RKcZQN2iGKvBJhx5gfvkOh1V1Py5jA0wEqm98vNh+h0ExsJZ+pTaNQfkG7E3?=
 =?us-ascii?Q?ddqgC7E32Ed7u10BLkco4+3qZEeV4nRBXCEu43L6InSrPvKkITohVu/3fsuQ?=
 =?us-ascii?Q?88OfItsXfFBeQqSPtSUIlT/Y+Nt6A/hn3dPgj8bqxRYYoR6r6EWnGR0phs6r?=
 =?us-ascii?Q?F3vSU2k419ij5zTw9woTCZMwn+w0a5eUaJjGZgsG069XG1u9DzUVmgSxNQK+?=
 =?us-ascii?Q?Fyhd8YVh3Ym5L6Vvw7C2RgVIuCmRIoGwxozHrWA1dEUg9xvb9So3yeLs4tCJ?=
 =?us-ascii?Q?eCKhwD8BBCgkCC43yUeEnX1OLvEQ1cZwkFgE7fbL6Jw3UwKhKO82P+FU/jQe?=
 =?us-ascii?Q?OVcwuody/PegcmcRtHToFk8FppmKbc6UgcdB0Jq1CEdlDuYm45NMmu84DeKH?=
 =?us-ascii?Q?uRmaXVfWV75Ic+ulQ5N0VKOpda4jHv4afLsbWbkeOy9whHqJv8cZzB0iNwHn?=
 =?us-ascii?Q?Uq/McU/lHYtUf8uwMPQBUir/3unC417NgjprGJdHtUcbnuSF+bXVeZTUvm4P?=
 =?us-ascii?Q?ktbjFEE38LkkBlsSS9d41UN71FlJuP2HiexppsvIfVFEcrhAeaiuOxh3D04S?=
 =?us-ascii?Q?M3nqydoLNSsWDWcw4/mqIy6ioJ1RTb5rQz9c8F72eOSccii30h4vmhQsPl0T?=
 =?us-ascii?Q?Zr61G5ev6XiooD8Y97a/SEXkQYV3EZHFOOG8SzEkU6UHQtbWxVRs9NnJzVkD?=
 =?us-ascii?Q?ZrF263+1BScasuCnKJwd2/mpNkqyhvQLFOhYh5CFOiebInazfClK/ZrM6gzA?=
 =?us-ascii?Q?k1PQ5UXlqgQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015)(7416005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 13:08:09.5355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ec1457-f44d-449a-96ba-08dc8629b6ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5676
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

Trace the fence dependencies similarly to how we print fences:

 ... , dependencies:{(context:606, seqno:38006)}

This allows tools to analyze the dependencies between the jobs (previously
it was only possible for fences traced by drm_sched_job_wait_dep).

Since drm_sched_job and drm_run_job use the same base event class,
the caller of trace_drm_run_job have to pass a dep_count of 0 (which
is ignored because dependencies are only considered at submit time).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 58 ++++++++++++++++---
 drivers/gpu/drm/scheduler/sched_entity.c      |  8 ++-
 drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
 3 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 2d7f2252eb5d..9d90237793a1 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -26,6 +26,7 @@
 
 #include <linux/stringify.h>
 #include <linux/types.h>
+#include <linux/trace_seq.h>
 #include <linux/tracepoint.h>
 
 #include "drm/drm_device.h"
@@ -35,9 +36,34 @@
 #define TRACE_SYSTEM gpu_scheduler
 #define TRACE_INCLUDE_FILE gpu_scheduler_trace
 
+#ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
+#define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
+/* Similar to trace_print_array_seq but for fences. */
+static inline const char *__print_dma_fence_array(struct trace_seq *p, const void *buf, int count)
+{
+	const char *ret = trace_seq_buffer_ptr(p);
+	u64 *fences = (u64 *) buf;
+	const char *prefix = "";
+
+	trace_seq_putc(p, '{');
+	for (int i = 0; i < count; i++) {
+		u64 context = fences[2 * i], seqno = fences[2 * i + 1];
+
+		trace_seq_printf(p, "%s(context:%llu, seqno:%lld)",
+				 prefix, context, seqno);
+		prefix = ",";
+	}
+	trace_seq_putc(p, '}');
+	trace_seq_putc(p, 0);
+
+	return ret;
+}
+#endif
+
 DECLARE_EVENT_CLASS(drm_sched_job,
-	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
-	    TP_ARGS(sched_job, entity),
+	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
+		     unsigned int dep_count),
+	    TP_ARGS(sched_job, entity, dep_count),
 	    TP_STRUCT__entry(
 			     __field(struct drm_sched_entity *, entity)
 			     __field(struct dma_fence *, fence)
@@ -46,9 +72,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
 			     __field(int, dev_index)
+			     __field(int, n_deps)
+			     __dynamic_array(u64, deps, dep_count * 2)
 			     ),
 
 	    TP_fast_assign(
+			   unsigned long idx;
+			   struct dma_fence *fence;
+			   u64 *dyn_arr;
 			   __entry->entity = entity;
 			   __entry->id = sched_job->id;
 			   __entry->fence = &sched_job->s_fence->finished;
@@ -57,21 +88,32 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->credit_count);
 			   __entry->dev_index = sched_job->sched->dev->primary->index;
+			   __entry->n_deps = dep_count;
+			   if (dep_count) {
+				dyn_arr = __get_dynamic_array(deps);
+				xa_for_each(&sched_job->dependencies, idx, fence) {
+					dyn_arr[2 * idx] = fence->context;
+					dyn_arr[2 * idx + 1] = fence->seqno;
+				}
+			   }
 			   ),
-	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
+	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d, dependencies:%s",
 		      __entry->id,
 		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
-		      __entry->job_count, __entry->hw_job_count)
+		      __entry->job_count, __entry->hw_job_count,
+		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n_deps))
 );
 
 DEFINE_EVENT(drm_sched_job, drm_sched_job,
-	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
-	    TP_ARGS(sched_job, entity)
+	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
+		     unsigned int dep_count),
+	    TP_ARGS(sched_job, entity, dep_count)
 );
 
 DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
-	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
-	    TP_ARGS(sched_job, entity),
+	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
+		     unsigned int dep_count),
+	    TP_ARGS(sched_job, entity, 0),
 	    TP_printk("dev_index=%d id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
 		      __entry->dev_index, __entry->id,
 		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 194798b9ce09..d252f3aeed47 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -583,7 +583,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	bool first;
 	ktime_t submit_ts;
 
-	trace_drm_sched_job(sched_job, entity);
+	if (trace_drm_sched_job_enabled()) {
+		unsigned long index;
+		void *f;
+
+		xa_for_each(&sched_job->dependencies, index, f) { }
+		trace_drm_sched_job(sched_job, entity, index);
+	}
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 74a2fe51e653..b3b89ea0d96d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1201,7 +1201,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
-	trace_drm_run_job(sched_job, entity);
+	trace_drm_run_job(sched_job, entity, 0);
 	fence = sched->ops->run_job(sched_job);
 	complete_all(&entity->entity_idle);
 	drm_sched_fence_scheduled(s_fence, fence);
-- 
2.40.1

