Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA89C86C4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE0C10E7D2;
	Thu, 14 Nov 2024 10:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U0UnRNlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D729410E7D2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVStTZ53nVeetGIkNyFKF25rGs35GPRchmz+Mwk28VHR3xzVeyiSJIP2xhblfHevkPaB2BZFfpFka5+9nDlPoeHIEzrnpY+sumUkoRh1t1aEe/v76DtR6kR7j1cCphQmihfSYKEctG2WrJPekOinxlJ/Po/YEQ5RwdINxP7AXQFlXMWbCS3wwrKhQuXeUF0Ip5ifPIBoc8tdJYE7kvP8blIEIg5G105DBgyQ8uNazNnTSGHqxvQyOazjXBBcwXI93IgKOSkO52XtgrrywpzVKpiSmZuwCsU/IEVWD8KdEN90BlTwFqLJCjKX5AqxSI1kZyVCvGP1N4eQEsyFNQtrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4pwm5+dqhTv59KRJipnrsHZ5l+CFQaRPZcomd9/XNA=;
 b=YSaUteKvSKEOx0Jr5nv7a5Yr+HCZIIaS2fMkPkxVtanZhm0LyriKamzcVM53Jjk/MPfakvGj2DxuYlkiV0m0ALsF+e5GM47aqoIKxGYfTsec2s0OfAxfnvyWgf1hhFbfBOYRwr+WO3DA4VwkdQujXKBuZMf+SxuOpSDqdDxpnIiiReoy7yduLTS+9594bkiG/hiiL3K8SNX8nfiNHvbc+JTh9HG8F1K+eWTQ3QIxHAWSwllSBjlXEJ42KWyUB7ftJ9hMm6tbNCgE6Z6iiyZXVDSXSeAZcSfY7c77U9qMWdkuTE1VDt3CppghXR0DfJRbnE+drz6L7SZEZdxFvrdIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4pwm5+dqhTv59KRJipnrsHZ5l+CFQaRPZcomd9/XNA=;
 b=U0UnRNlq6jEX4hp/0jtljz+1tisYL1ggymMYRYLO31p704fJ5xwXZ9cVdQAiM6SRmcNCRNqTxGRvVMrqEWM+jQxDaKhQfTgdn/gYuciaFF3p0CI2HlqKa2Th1qukCls/l+CUpPoaQkRlGvo0BCV8RPRvWSHLTkyEiwtO53j+Eic=
Received: from SN6PR05CA0013.namprd05.prod.outlook.com (2603:10b6:805:de::26)
 by PH7PR12MB9202.namprd12.prod.outlook.com (2603:10b6:510:2ef::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.31; Thu, 14 Nov
 2024 10:02:09 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::69) by SN6PR05CA0013.outlook.office365.com
 (2603:10b6:805:de::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 10:02:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 10:02:09 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 04:02:01 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>, <l.stach@pengutronix.de>, <matt.coster@imgtec.com>,
 <frank.binns@imgtec.com>, <yuq825@gmail.com>, <robdclark@gmail.com>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <mwen@igalia.com>, <mcanal@igalia.com>,
 <thomas.hellstrom@linux.intel.com>, <tvrtko.ursulin@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v6 5/7] drm/sched: trace dependencies for gpu jobs
Date: Thu, 14 Nov 2024 11:01:08 +0100
Message-ID: <20241114100113.150647-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|PH7PR12MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b9ed5c-bd01-46ab-87be-08dd0493671c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2jxZDRlqGdGJ8TxMrlLNOFeMF3n4RfPAGCd1cnbEE4mPM/vkRxCMF/riI8Zn?=
 =?us-ascii?Q?2d1YGMegiHFJQn4tLzKbr30fzIJeD1nGf3AGkCBXmytttJvXhusJgVkvRzmU?=
 =?us-ascii?Q?BEGrQ20bDy4tLdlnfe+MWPEQAnoUAznsyuh/rh2/zJUzZm+ygeS4Y+lfACTd?=
 =?us-ascii?Q?0ctkBGm4aPWe9FE5yR6NWSNa/nDvw6GAbj22naax3hk7Ajwx9d4HUtXWUEnV?=
 =?us-ascii?Q?wFKh0HQoHezy6xU0ZZblEcUShJCOn287+pq0nMLMO7ET5ahMsjIF+4Vtt37K?=
 =?us-ascii?Q?hBuWv6178N4RAKe8CvGkA7s0skVTI7ru042q5eH3DTfGNo99cpEZDGsIwfGy?=
 =?us-ascii?Q?tFOAeqGBSrT9uIj3E7g5lj7S7cScotf2PnkzJom8kliVenyUFIamaMjc8mnh?=
 =?us-ascii?Q?eMXCH8zkblQaJoIFqE0PC2FYN/GJAwJ90GUXeAG5a/6R7hcbhV0f93f1DsO/?=
 =?us-ascii?Q?LlF7IYr8qewIpl+0luMaAoSlbp6EYFi02h66mImYve1Uh6RqkM0AOI1hbsFr?=
 =?us-ascii?Q?0t333916NS1fE+tUPINmgrqKK6d7OJNq4jGlPtKLu5jb2wucMOg2f8AISX0/?=
 =?us-ascii?Q?XgNVrtzCSb/ROhv6wxucdKarjzIcQOAj7J1OlJFEVR5a6XCDbovlydyj5OFa?=
 =?us-ascii?Q?3N5Bv4FIJGqhAem95iz83wVUodqnVx6eMwTS/BPRz89k+lclM+7iVh7Usxr2?=
 =?us-ascii?Q?xTtCYjpkfpBpqCU80PyoK9Xw5EC0QPhLnCMLbcJkrRsOj9+iDSIxcU3u9RBf?=
 =?us-ascii?Q?xT1FRNnpxQ+zxwRwojRhoXXOnNis5Dr/J9shqRljOddzcGJ8o1yGPGlorV8X?=
 =?us-ascii?Q?3yMiz8ZDP0upykzfFYbTloEr4lViD/wYIQYN/MjRoYEd7X7vS8IQHuNzM8Sn?=
 =?us-ascii?Q?AXziiZy3VRLrMJJJSMZ/f62Wy4Jhv7iLTtnp12qECCGsxbwHktHXBQPMPZqG?=
 =?us-ascii?Q?q00ooo3NwUPUncB+3mI/riEfYv3+CqyVFnuPVCm6pmLHWkQNTz6blawqGWus?=
 =?us-ascii?Q?Me0u5atJ9ILB6HKP4ogTWxJOQFqdHPrBeQhWvoYQRoJQB00HaHXBXsuUKmYE?=
 =?us-ascii?Q?BIEMgBJ/EyeNq8V4UFV59SGL3yp+tUa75KBg0JuTKxSo63peWUofdn/g632I?=
 =?us-ascii?Q?HaF7cbSUB0ywIF+C7ti9l+cZpThpXzqHeRcZlm7tpLwwEAUyN0VmVfwBEywa?=
 =?us-ascii?Q?aWNyXoey7H4gRjI6uWfrqXF9WfUsa6vub1/g+K3Mm7RxVsxFXFbA+Zszyv20?=
 =?us-ascii?Q?/ErePL+wcHVBKjDar7RlJPwIGQ1UhPqr7Yta7g0SD4HMq7+1c+YFpls/himV?=
 =?us-ascii?Q?kxoefGgRLmbIBSr9GNEmvP0guHQHYwsKxT400GiaZC03NYLr822UdCG+vl1d?=
 =?us-ascii?Q?bYaxhEqijJqv6bbTcxK0H+hZkA5io+9t9WQl+WX1gEJHWSkOIWW+5rKfNHv5?=
 =?us-ascii?Q?rGFgU59aWLM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:02:09.2323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b9ed5c-bd01-46ab-87be-08dd0493671c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9202
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
index 24358c4d5bbe..67696f5e1331 100644
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
-	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
+	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d, dependencies:%s",
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
index 28ac709750e9..56fdf6879506 100644
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
2.43.0

