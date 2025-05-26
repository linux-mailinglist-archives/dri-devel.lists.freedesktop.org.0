Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC7AC3FD0
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4830B10E357;
	Mon, 26 May 2025 12:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tIzkMcT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA69210E369
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 12:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koFmDx7MHHwGQy6Zg/KU45MslPfzuQV9qEn5CS7maKDRbigcJ9iRfZC6b5JV9Znk9sX6EcWXp3BTrklhIz3Cicrxl+HZHhmB/WIBHwMNmLHnRZft3tZsXZpGFaq8u+aVEBK2tmpUOkZKhkmU/mdA6nB6r2Sb1ba/L1Jzm6xcl/dJXxA8rndsTlaS8AJh91iOqyGWw/2aRHc0yRcO732IuSRCEsddegpo/JRMrqTeJ44cjUlX7cWWtczwuBsAFxIWdwqnxdGL0FktQpmFEhAA9ClBbKXw6C0m1ivEi+u/KTU7D4NBeWh3+TLR0mBCxzx3nShfrcCLLPrey4M6AfLtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMD0bI0xdrGrvW7XnH89D6p4EE2EPeZChFkD28qnu4M=;
 b=GlMsgy8y85crbOExqd4iArN+dPQxaKiDHAYAOn2z9i1y6TVFy7gaPPapS6+ZiLAaCikRPZwKhEKwdI6GM2XboXSGMipBNKZ2U2cmztbDMmb9BCMURCVqUX31BAExouO/VU/GqOnLVmv9OYkCZ7ZPOjP8Qm5oHQluO6UdCcPE7WbCZkZMCuD3z2JvzfbeGoV81PpmDsV+iXeuD6YRfedYL7gycJ1FVxkuVG6I8YqsJhdZqFcfIQvmJ9Li41h0vQESF2+9W67mg5hC/tWQ5ovcXSViQzKy8Jk/HZ/cN9hJqocJgY3yvtJ91OI4aIcrb0Yk4X9+yTNZyu80oWkIXSi+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMD0bI0xdrGrvW7XnH89D6p4EE2EPeZChFkD28qnu4M=;
 b=tIzkMcT6yrMI0BdtPRB0cF76E/dhhpNijN2uGGX19yjODlS+IzrYZxmeKfXNoci9glz11L0Nu9NdaemRqGhhZ/ZnVziWr/AuWY548gGEEEG8wAnl0eTzo6q0F7DQfZD+GJKriI+/4bQyJbysluHps4J77RXt5XefG5OuAI8z0kA=
Received: from BYAPR11CA0096.namprd11.prod.outlook.com (2603:10b6:a03:f4::37)
 by DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.21; Mon, 26 May 2025 12:56:10 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::fb) by BYAPR11CA0096.outlook.office365.com
 (2603:10b6:a03:f4::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 26 May 2025 12:56:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:56:10 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:56:07 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 07/10] drm/sched: Cleanup event names
Date: Mon, 26 May 2025 14:54:49 +0200
Message-ID: <20250526125505.2360-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: a1067589-e7b7-45e9-228a-08dd9c54b069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZhocWBTCn5uzxug0Fn7kcrrQuflwSSFFTsSH9/HBU/dtEhCssonjktTQZQlH?=
 =?us-ascii?Q?ns+oSZNUaN23yS0Ev+PqfgjUH3trBkjBm0QCjTp66VCYmZqsBVoBnUcFGnpi?=
 =?us-ascii?Q?zTjg/21unNWcucvRv1y5mV4l4KrYOy/vdlCERChHmFOlLYsHZbVNx6/Wd8Df?=
 =?us-ascii?Q?V0xTgTfSSrIVtZ7dE+tcLI2VvkPXFS/oQQt0gSEOMbqYruKxtqpDWT9bsCWQ?=
 =?us-ascii?Q?7reF/8M2qcy6jN6Mmwq8U4szn37Nrvy9ty4V03ZxwrDCStTkLPU3U3oGR9Rl?=
 =?us-ascii?Q?6YsNq5MgI0R5+vFTRAN0Jq8D5uAxt/Ovs4T7U++Sf080dpUslu9+rJhWHP8v?=
 =?us-ascii?Q?vvm1fkpsKaQXt2hOqifzKEae4t2wBr570Bx/wVJj1gmAuPK8+rtavdO/p92z?=
 =?us-ascii?Q?r33u9QVRDtYWyvnB0CfXjHXUc+A9k0CgzZ/0ntURRXacoFn4lT2G9Cx6fREz?=
 =?us-ascii?Q?D3FAmadwtYSv5gvwZ2SpZgawVrNa7h4J5+KHEOyUd8yu3WSFndTtrwJFSJSv?=
 =?us-ascii?Q?sejl7kZhgphhAKLqIjPqNYVzSlyWdgcinq7+wuDy9ml2Rnj2fI7ahS4nM5oy?=
 =?us-ascii?Q?A1+gq4GcSnFmx/PwU0M6V81xhEOkvTIAAnzpfptYWoxQk36gbcN58FoJLR8q?=
 =?us-ascii?Q?bxUKC4e8zDTwChO1KTxQeo195D8ohzJdsrkZ95wxJLGHHgpSu2PcZBi4HyPy?=
 =?us-ascii?Q?642T0gZKnIgx+b9XY9JCXjz+q9SwViOfrs+n62K9WI2QaE4van6IdaXWG2Y6?=
 =?us-ascii?Q?MADTWr1L1VHYbdn3E6bVRaIFXsRa/0f3DzsJ+25jsJPpBC3VxRu30tRP9DxG?=
 =?us-ascii?Q?IRjqPQhBUh4JzlPgiO+KrwJwYWZFvwyjX2vRVqUrPIjePeZdesZht7SAB2w8?=
 =?us-ascii?Q?KthNn950Zzqddz4VUDFBuIldibNUm+Sfs4nYOo6re5lopjUIRABK+7HPWKY3?=
 =?us-ascii?Q?9U5mAAdLUR8rtQ60d5QM2JtlCXjaFTQkN2+yZOf4a97krEE4nFh3wFv7U8/D?=
 =?us-ascii?Q?HQSTm/4uJET4yNXqG7Bc/3HOOrWUGGWjkUkP27/iwidoNCl3l1L/S6eA6PCa?=
 =?us-ascii?Q?QarlOsx/XKNZbzwySFjF6lmxB2/QhQX3ToM0DrjdzUnvEV8AuLU8GmtDYaP6?=
 =?us-ascii?Q?blt4nC9+/A8B2k7j1E7gY7VHmK7RWzXSPd4764m1a2RvOOtYZqFTsLlsGBoV?=
 =?us-ascii?Q?v9d26vmVxJjtbKl4RfdyNwTLk7AAXUDzLzMSEWABOxq06hTnMRxVKVV+znEa?=
 =?us-ascii?Q?8eAk4TJaJHpk2BO1b+MnBpn55a9Yxjpc+iKsao5L0We/RAe8ujA265KCAsI9?=
 =?us-ascii?Q?xTwGOAZ3vOGESfGGk4NZ07YZMEtpxrlX6bkeTYg6lHLxYweFXlrca2x8EmMp?=
 =?us-ascii?Q?gEZ/SVQWEc+rUjRKh82N+RyjFqlzU0rPZ+bk9iMi782u46ltckBkwdXt8gqw?=
 =?us-ascii?Q?5cqIz7Le1UVN/w8h90xd43SxgKOjN4IGj/cTxas623fCPtftUBP54/o5eII5?=
 =?us-ascii?Q?E6itP2lMdW5xkZwkCfjCzExWKLhHFuBLbMqC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:56:10.6087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1067589-e7b7-45e9-228a-08dd9c54b069
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938
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

All events now start with the same prefix (drm_sched_job_).

drm_sched_job_wait_dep was misleading because it wasn't waiting
at all. It's now replaced by trace_drm_sched_job_unschedulable,
which is only traced if the job cannot be scheduled.
For moot dependencies, nothing is traced.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 8 ++++----
 drivers/gpu/drm/scheduler/sched_entity.c        | 8 ++++----
 drivers/gpu/drm/scheduler/sched_main.c          | 4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 38cdd659a286..4ce53e493fef 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -63,17 +63,17 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 		      __entry->job_count, __entry->hw_job_count, __entry->client_id)
 );
 
-DEFINE_EVENT(drm_sched_job, drm_sched_job,
+DEFINE_EVENT(drm_sched_job, drm_sched_job_queue,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity)
 );
 
-DEFINE_EVENT(drm_sched_job, drm_run_job,
+DEFINE_EVENT(drm_sched_job, drm_sched_job_run,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity)
 );
 
-TRACE_EVENT(drm_sched_process_job,
+TRACE_EVENT(drm_sched_job_done,
 	    TP_PROTO(struct drm_sched_fence *fence),
 	    TP_ARGS(fence),
 	    TP_STRUCT__entry(
@@ -112,7 +112,7 @@ TRACE_EVENT(drm_sched_job_add_dep,
 		  __entry->ctx, __entry->seqno)
 );
 
-TRACE_EVENT(drm_sched_job_wait_dep,
+TRACE_EVENT(drm_sched_job_unschedulable,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 8c1589f476ae..0b42e1aa7039 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -476,10 +476,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 	while ((entity->dependency =
 			drm_sched_job_dependency(sched_job, entity))) {
-		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
-
-		if (drm_sched_entity_add_dependency_cb(entity))
+		if (drm_sched_entity_add_dependency_cb(entity)) {
+			trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
 			return NULL;
+		}
 	}
 
 	/* skip jobs from entity that marked guilty */
@@ -585,7 +585,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	bool first;
 	ktime_t submit_ts;
 
-	trace_drm_sched_job(sched_job, entity);
+	trace_drm_sched_job_queue(sched_job, entity);
 
 	if (trace_drm_sched_job_add_dep_enabled()) {
 		struct dma_fence *entry;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 34252bac83b9..e3679f26f724 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -401,7 +401,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	atomic_sub(s_job->credits, &sched->credit_count);
 	atomic_dec(sched->score);
 
-	trace_drm_sched_process_job(s_fence);
+	trace_drm_sched_job_done(s_fence);
 
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
@@ -1234,7 +1234,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
-	trace_drm_run_job(sched_job, entity);
+	trace_drm_sched_job_run(sched_job, entity);
 	/*
 	 * The run_job() callback must by definition return a fence whose
 	 * refcount has been incremented for the scheduler already.
-- 
2.43.0

