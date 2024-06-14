Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECF908603
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720E410EC94;
	Fri, 14 Jun 2024 08:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xNrW+pPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF4510E18A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:18:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDVrGHhG5tYLgNAdPKvr+V7+mAZPl8FzQZIKUlG36tXrycOVAOE8e6XdnKTpsvEsl37B8rozh6mNz8ssgQNQxocNmguAoLqrLqHIkpdu3tKFEroZ8gN6GtkLNpPzdjBB9vgRsxwNu9KIkYzDyEexsTph6BaNn5YyPjug9eBr6t6nQj9Hs/zQqUt27g4zPHn2HjX0IIYW6c+wJwvJqcZYilttC6F1SdDP/plF8GfcW5YSJVO9NtWXEviGZkZzn7MVm3L3MEh9xBdawJWZP471lVXNoD9l5vys0q3dWOA4ApcTbMu/TGowui+WvWZQsh+y92kK3hFdKtjDK44jbeCqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgftwvbEQfbya9lBT90EKcYbAZCHYzasg69HMAm3tAU=;
 b=gXtMZG5sdC3NAiAFbzhiXJNwO/KjKm3qRwNDOo6UzuihCDTKQLySw7r3t2foq2JoDK9WfdiaElFMMw8DaYspqe0vnj62RXeEh4LWVGI8i2yV1xbkdWfc9u42fIF6pXTuFbLpMe+XdMs6FR32OS+gHdoJs4u0JPTphPb487+HogPBi1yGI+8GExaC684gn1FEMqoVFPxTwvCDW8zhzK6qE3AFOArfivuSMCnswPokThbkjJ5gx3uSXgo4DFYsDbesZD0x+1g3wS+r2xhWDBo1WhKyY8avqg17SXnN06TvjlmzanWHQWgvu+9iZ+G0JZbXrj2nme3s7vamtZsK5Websw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgftwvbEQfbya9lBT90EKcYbAZCHYzasg69HMAm3tAU=;
 b=xNrW+pPHlhgVvm2L/5da66vSc+ZPK8Pmhcy6NgWkLg3oSmObpRrAuOnXnS4JQBtkiVyhUtUUYplJWKPqFNxplDWOWwjmd2WUD8GBiranOyesHfIKwVfPvA8w5SwhYApLN+5fYwC0yOQSSPvVknJYTtRwMQX+HJdJxnLt4fGlQgg=
Received: from PH8PR15CA0002.namprd15.prod.outlook.com (2603:10b6:510:2d2::29)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Fri, 14 Jun
 2024 08:18:12 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::6e) by PH8PR15CA0002.outlook.office365.com
 (2603:10b6:510:2d2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Fri, 14 Jun 2024 08:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 14 Jun 2024 08:18:11 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Jun
 2024 03:18:04 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 3/4] drm/sched: trace dependencies for gpu jobs
Date: Fri, 14 Jun 2024 10:16:29 +0200
Message-ID: <20240614081657.408397-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: b728312d-6a68-4087-f352-08dc8c4a8844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|82310400021|7416009|1800799019|36860700008|376009|921015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?McAIzSS1h0nYkmlPLlCJPWVu6u24g6XzJYdjeXufwVnAbPq88SuUjmOdiuNL?=
 =?us-ascii?Q?+T/iWct6qBvsg4GBzAyA5vQMoginSIBTyK7X+S+ljJm50E2SdtcSyJiwnXua?=
 =?us-ascii?Q?AXA1A+gBW5DJOjua4lSv0/dO/HkBzVrMJkxKIZ4xwCH57eKvVsH1okjI8iUL?=
 =?us-ascii?Q?0d+d4oLHq3OtF+fbN0m68VRD9um3F1mkrtbBzLBBRaSC0ind7AEh0ozn4C29?=
 =?us-ascii?Q?uRKKTxcz/A/Gz0ZwD/6ap4QWC6pSt9gakAfujcm/otzzfKLkgqK0vnXH5XwS?=
 =?us-ascii?Q?PJtvf+4DQQKGIs4TvBYVY2hOuh4gBgSyVz51VrNH398PJ5ea5U+jxhRVCZ6c?=
 =?us-ascii?Q?7HYkf9lYdxdVAuNt/ZRK7izgwSlSv6lm/8cOF0ZTSVyBCRxr6JVuLA7mZBBJ?=
 =?us-ascii?Q?CUCqi10Dmy4+XgoYjKKsoAeJdcWd4yL+8ASHqvjigemMEOy4VJdxD08z45hL?=
 =?us-ascii?Q?T+sCqjOYrVyTTvABJwn2FmLMWHN2i7Pzju1Us+Osr6Jb4M0bNdPQUlNRk22X?=
 =?us-ascii?Q?YT6mf0r2I5LqAvc2R6VixT1FskcaSzY2G6YYzfK0YQfcVN3bJAidPx7HykQ/?=
 =?us-ascii?Q?lrsAC/WMOYRqGvgM3vhHXDN/3Tr1TePC+OlBYX3MmkfRCHlRpc0tphk3mwa2?=
 =?us-ascii?Q?W73Uja6ytK2z3JbKpXqOSOJpTI2nPpCPvOpABopg5tydh26I+CiEO2ZG/cRw?=
 =?us-ascii?Q?CfySRVt2NtY/bwxOCTyq4Tpp9OTSYYq91sbWVANq8/xaTGDVZwHkBdg/0jk8?=
 =?us-ascii?Q?aRY8S9FEtpgMHH11UcKV8uCxrCrVJxReJrc6t0cE/V3/pDUf329i/IireieB?=
 =?us-ascii?Q?OnZjNpv8TmyKR2BqtyO7SfaODfI+L+kB32sKTCL4x6/xj317+XQqMGh5l5P6?=
 =?us-ascii?Q?VyK4U8ZaEjf/TVWHXUbUOx2RkISGvXG2AP2mIyCq6CVcA3xit8813Nrais0y?=
 =?us-ascii?Q?aF2N5ntUEU56WBY9taSjfcVAhenpi0wXPbXQB7HIqQdV8erh4/BKyL0IuEA4?=
 =?us-ascii?Q?2yWEgHl6CMbcogbywEFHwXqz1wU0mM0fOThKBXYFjUYIHDUWXGJ2dSwF7lCB?=
 =?us-ascii?Q?/CKB/G+JfY5O4fgBtruQje9+AuS0pQr2bzbqfdL6eIBTSmioYOdJ3dRFEM3a?=
 =?us-ascii?Q?ETVfG1vRHyIjNuElQ2VfRwd5gQ68PvLWWfcC7V5KtE/ab10yi6xY82jOyZ4o?=
 =?us-ascii?Q?y5L0PfIHnLMnrwehLevIjdIaKvzpb0dyWqx0z6LIOGKqwgHP1zNMjm3SWEbn?=
 =?us-ascii?Q?hsukShwJd2FRjsydLwdArD0Ixi3/u0T+6odxk7hoTvGNkdVZYI1jpC0MI0fF?=
 =?us-ascii?Q?mfHavJmeSj2JakTy0DJyurMYB+ykpf6LRANbRoneh8W2tyZ0uwZFTMgpKnlH?=
 =?us-ascii?Q?1IlLRK81+Z/WseAhwKn5w/cTjCOj3GcXTHtlBFk+uZ5P1FKNMiAy/+R+K+4F?=
 =?us-ascii?Q?6HXhtyv/Wlc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230035)(82310400021)(7416009)(1800799019)(36860700008)(376009)(921015);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 08:18:11.8643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b728312d-6a68-4087-f352-08dc8c4a8844
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
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
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 59 ++++++++++++++++---
 drivers/gpu/drm/scheduler/sched_entity.c      |  8 ++-
 drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
 3 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index f6da377cdb99..0abcad26839c 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -26,15 +26,41 @@
 
 #include <linux/stringify.h>
 #include <linux/types.h>
+#include <linux/trace_seq.h>
 #include <linux/tracepoint.h>
 
 #undef TRACE_SYSTEM
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
 			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
@@ -43,9 +69,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __string(dev, dev_name(sched_job->sched->dev))
 			     __field(uint64_t, fence_context)
 			     __field(uint64_t, fence_seqno)
+			     __field(int, n_deps)
+			     __dynamic_array(u64, deps, dep_count * 2)
 			     ),
 
 	    TP_fast_assign(
+			   unsigned long idx;
+			   struct dma_fence *fence;
+			   u64 *dyn_arr;
 			   __entry->id = sched_job->id;
 			   __assign_str(name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
@@ -54,22 +85,32 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __assign_str(dev);
 			   __entry->fence_context = sched_job->s_fence->finished.context;
 			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
-
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
 		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
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
 	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
 		      __get_str(dev), __entry->id,
 		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..aa33a9d29b14 100644
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
index 7e90c9f95611..0bc9b7b24b34 100644
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

