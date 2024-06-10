Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB739022AE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 15:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C8710E332;
	Mon, 10 Jun 2024 13:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UESAx6Rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7002410E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 13:28:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjA/HZ5rHGubXyFut1TnBbAOph3Q93xSV9ZV+bZfqE8OZS40vHp9t4zaM6HHwGNi1DXUVDPQDYwQULyevOex/Um4+Hecqu7D7voWcm4pW2c9h6i1gRWTw0f5OqxMaWFzQL4UyqjJhiJqqA1Ceo7LcNrh11Zl0xjjrXhicdXhvcoIpolY/itAKoM/xPrreHZK0HQGFfVl11fH2gM2Jse+Jrg0g7iMQlKBbigJao86hPMGJHoQjFHpH8nGsJ3MjU4jgo55dBx/L5qHRJuTREkRRqAReN0/PCoibxLdF3wHeqTY7nZM/i+o3YLPnT7zwnVhr/u9umpmxGqiS69u44fZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvTSu8RJBhs6pCAo6yTFfWZ13k133C0bbgH5VQkANek=;
 b=Q/WwBf77ggQ6Yr6nNfPNUbhWEqb9net4kNWNWhxP38mys79jfv7JC58rbwfmvF/ikgWrFaur2bcAHNBoDOnD8B3/etqIXzXeMdrDO9In7VNgYVykomOsYUYMgE3teKa4x79nH+UrWKHtYpS6s+qSFW/YxLWm7p9kiIDY02Ys5hIaoE9DFU7zFCkQYdfp8XZwcykdIvEmY4l38YMl0UWqr9NiR3GzP2fSXnpbVFAE4V9Brpl7gXxb6ep/N6pOTD6wLp2MVUedzZqSZ+iSFQFS223yk22byNqfoEGRH4poKwd2JRWPPBrNpXigRKuVMz+s7BTk/IG/KDnGHuGgFWMDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvTSu8RJBhs6pCAo6yTFfWZ13k133C0bbgH5VQkANek=;
 b=UESAx6RxtCiltb7TY+iAVZ2OlWq0momGYXUx4tT9D5mmhQOWvGo5CPmb5JEJIQprfqyqEIJ5UBI9SCosx85Z4Z32VLAr5HISYcgsIIUs7vzrGqSYeFc91hgTRfuFxvIufWehc0IAtBoiCCozYOQFM675C68Ah1tOkQx8UhzcWz8=
Received: from BN9PR03CA0148.namprd03.prod.outlook.com (2603:10b6:408:fe::33)
 by MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 13:28:13 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:fe:cafe::55) by BN9PR03CA0148.outlook.office365.com
 (2603:10b6:408:fe::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.24 via Frontend
 Transport; Mon, 10 Jun 2024 13:28:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 13:28:13 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Jun
 2024 08:28:09 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 3/3] drm/sched: trace dependencies for gpu jobs
Date: Mon, 10 Jun 2024 15:26:56 +0200
Message-ID: <20240610132707.61404-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: c07c61db-cdfe-4445-4b45-08dc89512dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|376005|36860700004|1800799015|82310400017|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tPo2uSphyJoQqiLhx/j+Opx52MVLXeHi/nRQsZf+8zgBuYj5z3OvFyK5UBwi?=
 =?us-ascii?Q?WkVd5oiPGfpJpTT2N313wLvx7a42dYggmk8LsF2CYmKKC38+uUhvhLgfjdPT?=
 =?us-ascii?Q?mhUS4Gne36DtMwJvl6QvUF68v2GNPHFbPfkyCJXQ6/dVsWYj29NPKWxSN4AI?=
 =?us-ascii?Q?4maOYGTJFvuxy9SO2qKUep3iInqIabpktP88JZyctgcpAhQcoX7rT28o79Nk?=
 =?us-ascii?Q?oiWO1vMBmFW8vKRJgqdGWni0wgAZRnXQUmKwZhrDwP35ETHdHQO1TgiE8nv2?=
 =?us-ascii?Q?sZTilYBia1dbjHfPbZPwZiGLey6NiUdVNUuUkh9oGbkLTvcD12uLF9ZLkPrO?=
 =?us-ascii?Q?FnVcCTVNDWWd/wJrsp5EdkE7ufqRNcnGlHFiuEWHfc6/qgZZwOosaWF15FIA?=
 =?us-ascii?Q?bLRKhcxOj7AhilrlMyaxRFFmstJIRyZOGAwhO8do72+xfh/tzxblzxZAQcP8?=
 =?us-ascii?Q?2SkuyY5ATrtK060xeHkevL1C+KcpFdtyXhE3aM7VDphvERbOmdXEvvce8DAK?=
 =?us-ascii?Q?IlRQeb8LHw5OkpXOsBGQjjdwsJfHCz2kcD4g08qsilLKPD/3Zi9FEb+1eBFG?=
 =?us-ascii?Q?YVY8yFhFypXAHaAuTryZugw0W+0cIjLaCbvzYxDsYXMa3IzNFF3T51csVVBB?=
 =?us-ascii?Q?DzXwa0NPe9IJ601GroUhhgkdFWI1MgyiG1If4AT1Z8p8xDSwxr+2aeJn3Hpg?=
 =?us-ascii?Q?4MkLX/vCjZ9c0m7fZMXnoJLoRD7ZGFdMb8jzK6mADidA5blRZXd9ek1WYBjd?=
 =?us-ascii?Q?lvR+i1TL3XYvWe6pfrzUlKI7cBNS9oRP/6HmreR+5s5QR4f/yBm9KpWiKRAP?=
 =?us-ascii?Q?sElncGzLSwLH8SNsaiV3MGxETAAZKr951nBpVuxA2GYnkcL0KPR6J4cB3Kc+?=
 =?us-ascii?Q?y3hOVmm0Z3yRitqQ/nNZ3RJowtuUSTPkFo73foPgkvZk+CNrPDDlOdJfK8nV?=
 =?us-ascii?Q?rdHDDcrPtChC3LQiQGQu3ApA0UvZ12I46F14BDjGQ082xc2F9dOnegTauafO?=
 =?us-ascii?Q?pvPNPUwB90JmVJteAw8M54FKnl9tN5V7eHSeZyuD6SMKxq+83/4cpJ7SLoaj?=
 =?us-ascii?Q?m4Woi93RTT8yh9uX+DgtXgpyMXs0472hwnMsFbxaQkT9Ti2WzbhE6hAtgXrj?=
 =?us-ascii?Q?l9xwVYf3eCKT+LeU009vyltxfFs3uKc9CvrherFewN8FyPWA4QVu83I22M0v?=
 =?us-ascii?Q?VAUr0C+F1oCKns8pyJ/d7PrCD78nAfH8e6ShYMKqkTSOQr3bMSO8XObvA1fG?=
 =?us-ascii?Q?Ktn97ALrmrJbIHd8cjIi2O3Y50hEE32l/kEhNkB5gKm6P0c/SpGCg+7GVx7M?=
 =?us-ascii?Q?vLUNWc9t+f64Ad302PHDPragALiKHZzHL/KWFxrp2br8dg7Kw/DcAiCaKSdI?=
 =?us-ascii?Q?xDGRkMk+AG/Zo4H2EgeOJWp/P2B+hEX8h+theU9fZ+ALvAFX+J36ZhB0kczW?=
 =?us-ascii?Q?E6ZVd6LlOOQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(36860700004)(1800799015)(82310400017)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 13:28:13.2010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c07c61db-cdfe-4445-4b45-08dc89512dbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272
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
index 6541e161962f..702d1f709bcf 100644
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
 			     __field(struct drm_sched_entity *, entity)
 			     __string(name, sched_job->sched->name)
@@ -44,9 +70,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
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
 			   __entry->entity = entity;
 			   __entry->id = sched_job->id;
 			   __assign_str(name);
@@ -56,22 +87,32 @@ DECLARE_EVENT_CLASS(drm_sched_job,
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

