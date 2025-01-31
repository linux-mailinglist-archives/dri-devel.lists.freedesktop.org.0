Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1388A23CAF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 12:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A0810EA70;
	Fri, 31 Jan 2025 11:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ezyrOhzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7889210EA70
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 11:05:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmYKj2vCOrW8ZTA82x7CGnOB4CfTkcHxjOwYWLg+DYmQhQzMblTWeUkN3BRV7pSJGNo7AI8FXneyBcs0CAg4kO6LQPDmr8TfpTWtgIy565jqYMkAsiNXzMHqQpM9IqMtHb+6YtEN06bqxyhbnamm7JVDyi38L86nmHg1GfUSZMK9ff/RxOEKr97X3o/lqkxDhKOIryVgTHzsrPxp1w6julSgKBKybZsBRN4CmUM/fEA1azxG0ZodRIy0pQ/Ecmtz3uBdJLLdgt99bHGPCy+A8zzitbuyKr++KaYIubsB8sKYDzfG+HX2rDOBjEvoUadkIwX70oHjbaJbsKyj92sRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfHTVg1Pd86qI8wpawUUc6GXEls7oEWRT6zYYqnQnm0=;
 b=HlP9vfKhReDMLV495GlhLpD4Inu5ZMelC/xeRCU8e+OkLa5/rilRvKOsBAR6pYq8FZL/gRBTM2aKGYVPU59kEMkzVg30u+xonbn38/li4dlRYHWHxs0CWoAQk4beWa+0L6z+HKLNUopy0LjsKJ2w7nWbXRLqT98oEANzRItsJM4ELx/T52poapRgpFUlbIudrh5OHlLEGxfynGWBz8ij7aY3K03wmx9Q3u7LNjO/IZdOGHGJOGCPMF06R7Rr/jtBdKYauYGofbngxB0YYPSKd/n93qIGEQzrOLWZLE8oH00Vm+gRm6fs9M6Rqxet6VXwCgbCSj8FK45VgdXwn9eZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfHTVg1Pd86qI8wpawUUc6GXEls7oEWRT6zYYqnQnm0=;
 b=ezyrOhzcR22urCzXYC42TbILZ58qN8Ogogu/OfgCe7v0yXTuogv2Hl/YrFz882njQCvt9+GSVHaORWSas/O5pI9HnI3uq8//5SKXMaXhntTHFP4K4CVJc/wxNcdZHmXne9eIs2DpCFKijXlF/4tLfuZAw3YTFg2tAPk3o74CZKk=
Received: from BYAPR21CA0011.namprd21.prod.outlook.com (2603:10b6:a03:114::21)
 by IA0PR12MB7750.namprd12.prod.outlook.com (2603:10b6:208:431::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 11:05:35 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::85) by BYAPR21CA0011.outlook.office365.com
 (2603:10b6:a03:114::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 11:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 11:05:34 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 05:05:29 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <pstanner@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v7 5/7] drm/sched: trace dependencies for gpu jobs
Date: Fri, 31 Jan 2025 12:03:03 +0100
Message-ID: <20250131110328.706695-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|IA0PR12MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: e6547815-70e3-4103-0a9b-08dd41e72f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PlmQpimWNy6wDrExd1ovpvVV2qWFAld2Jra+/lg9gK8jtTj3MLw6xna6FUB3?=
 =?us-ascii?Q?Re1j6U5JR3IlcUSB9Fl9YVySm+o82qw6Fva1sIMtewZ8NS0RhtYsnE5KQIXm?=
 =?us-ascii?Q?4qtvx5psGw9ib/tlIUy1UyRNe8IgfX4OVOKrOMoAZn9ZqNQNovwZAwQGXCgC?=
 =?us-ascii?Q?u9X3M0zKDRDJBczw4AZJcDVhrD68kF49XYxxDFS+SjFgLkzbA+vg6wPlf85U?=
 =?us-ascii?Q?Pmh6jwwRtIARSyXWZhhjqjnMV0n+LBoctcblhJEhErO2B0zFf/vSr5Dq3irV?=
 =?us-ascii?Q?XbZQR9AafgWEmHwOc6Z0wuVaQCoga1917iNQdsIzYPRE4q5+HXm5arq1q54H?=
 =?us-ascii?Q?EqN5+1lxTF4oMY3JGvsMGnq/SxD2nh1gL54i+zRGyTcppDbcuyMXFCknI+fF?=
 =?us-ascii?Q?uGLPswMRjeiRQ75u8N8rist5XOrPi+/y0xCu8VRzUvNkt7MLY4ZmdieD0Wb+?=
 =?us-ascii?Q?3ICjv7svqrb/6liDbiOu2kTiHMDJBNJsquQaqwHH49TAQpBWVRiECt0QqKly?=
 =?us-ascii?Q?4Vwtdi68T6KiYGketapKSHeDwFsRK/xW48CifsEvlxiv223Ll6nLhoCMM5wU?=
 =?us-ascii?Q?xydVh7hx8UUIAmMyFZ+VMrq6gJPS7rpw4TI0u7SKRe4tcX1xar7Pl0Neejuu?=
 =?us-ascii?Q?4dT4tknTSq3mxuHLtDQY7ogOXol4w72hf0fnN1t9q4fQ718sATWrD76I+jyR?=
 =?us-ascii?Q?diox1ZtHafQUU8q+OVo4pFT1CKAB04HVZGVnEht0CYe6dUWaB8nz88UNlwVm?=
 =?us-ascii?Q?s2kcJ+IsspRSyTdVVE2dJoAQchv+n5UOzvWOcJtjEfVT8g3O9ZJKHfcFPvF9?=
 =?us-ascii?Q?LSDILIZZf3GlDnbzr/r0glYvcKJqpFa91bP18dow1qk6RNUcs6tWxi8LEXVD?=
 =?us-ascii?Q?vxyk2CJFgzEFLK7VvjSndA/wGmeBSx/6kDin9DhIw+HCxUz8Aa48WsHMEUYA?=
 =?us-ascii?Q?n6zjnqnq4sOHqtkcDCeKJR3HvFN20UcKIaAIOZzcMxjS1pBdwDOtJGrYR+dt?=
 =?us-ascii?Q?I0HQeD74FBctPVxE+QKOnMcl1yS3EOozRMeWiNK3qZMsWEYLJjE/XLgB3yvu?=
 =?us-ascii?Q?y/uCr3xQIlH4K25yPgv7cKiYHOuaX2I5IVn4wAN6h1nAFcjWMHk6KSDkEtRl?=
 =?us-ascii?Q?mffh0+Wh7mPC9RyHqxLCcTUeaD5hzN7qvSQZ5V97xpbJzE3OGpjPJfv9+8XQ?=
 =?us-ascii?Q?7fnFqULwSw7FahU8+n7YAWBHoTHNUlttaAe5fQQdUfuJIEcv3FqaqTtxKuus?=
 =?us-ascii?Q?GUflIFc5s4/+9JWCH2dO9m7xHhxTrOoAp4JprcKn00W2QxqFzt+WISsU4llT?=
 =?us-ascii?Q?CD4dJB3lLDv1Y/pGtccjEI8/4oDVK/MJY8w7im0jfuOdlIJctiBCtiFl0Jfz?=
 =?us-ascii?Q?mo5YLkzoCR+QrzChPnID6az6F47gMj9qzy6WSnhWOsZlFLZLd5rDPeS90yq9?=
 =?us-ascii?Q?trsqGhhB5oaJYDksNo6tNIv7vsNW/jT62ikotPmJS10AT3/b3jcvwP0HNsWZ?=
 =?us-ascii?Q?F0W16AIbEzk80I10/dFbmDUjOA2qE01t1JXm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:05:34.1392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6547815-70e3-4103-0a9b-08dd41e72f4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7750
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

 ... , dependencies:{fence=606:38006}

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
index 3cdd8d8f8021..ca19cd9a146a 100644
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
+		trace_seq_printf(p, "%sfence=%llu:%llu",
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
 			     __field(uint64_t, id)
 			     __string(name, sched_job->sched->name)
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
-	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
+	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, dependencies:%s",
 		      __get_str(dev), __entry->id,
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
 
 DEFINE_EVENT(drm_sched_job, drm_run_job,
-	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
-	    TP_ARGS(sched_job, entity)
+	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
+	    	     unsigned int dep_count),
+	    TP_ARGS(sched_job, entity, 0)
 );
 
 TRACE_EVENT(drm_sched_process_job,
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 69bcf0e99d57..0ce3a82fe6fd 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -592,7 +592,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	bool first;
 	ktime_t submit_ts;
 
-	trace_drm_sched_job(sched_job, entity);
+	if (trace_drm_sched_job_enabled()) {
+		unsigned long index, n = 0;
+		void *f;
+
+		xa_for_each(&sched_job->dependencies, index, f) { n++; }
+		trace_drm_sched_job(sched_job, entity, n);
+	}
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ad306d3d7282..c645f07ebe26 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1214,7 +1214,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
-	trace_drm_run_job(sched_job, entity);
+	trace_drm_run_job(sched_job, entity, 0);
 	fence = sched->ops->run_job(sched_job);
 	complete_all(&entity->entity_idle);
 	drm_sched_fence_scheduled(s_fence, fence);
-- 
2.47.1

