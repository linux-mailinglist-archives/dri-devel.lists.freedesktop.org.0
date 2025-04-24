Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE8A9A67C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30B310E77E;
	Thu, 24 Apr 2025 08:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FSF72qkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9384410E77F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbTdQAsJ8z4n8tWeIJsWHfwLXDk8Hz3R+2h2dm1EQGsleQQ2i6LrTdRvjmCx326I8qpQQBIeKW2QSfYzjwH8Gt/MshsJvadxw+oHsOQ0zJbJsWqWDSxmQ2KLnjh/PazEIjVXnIiutdSgjhfrxvhBPr4vT0WSknwzpYQWNfrgYU63pqPOzoaV1mRFIxg6tWm7lwsHyXUSuiC2g8ys80tsRmxUBgOdWq6XcxwahYKt9JPNb/1mMARIas7iq4ejm0I7bb4D8CjMrrqwfx0QdMC+mAqbZCsM7i2YgDVGYPEe4JFT7TWckzJcvlXV3IlwqiDrX85ia7QdTNxSd3A9mDJDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DpzI+rKIujCvPd/8Cwc5h8MlhSHU0IqflbK0nUvRc0=;
 b=h+5DXO6+uF7A175GsyBDaL7nQTOIP4jKTBO2PDrhLFEEI4sNCCY0EzFqUavv6XmpAeyoxwqyrdAT3XUi8AMsQ9D6VCHRgYsE6h3Qd/Z5QJ5bKHfvVhWbpazx4lz04pusU5/9YA1UgYhoZOPQisoekKFEhVfn62gn8TcRgjvm4ptkLHkFDP2VqLeYASm/Ni4jEsIpQ+fVMPQ9G3mgHrdmbk0F95ypjL8tQlVohCR/Ovzz5QmYw/JOX9blS16laFmXIxjVMhdExaqEluLtOF6JKWo7nJXn6L6/6Tq6YYStijTod79j1sEr8IUFsBwLE6bJLWTdmyuLYeabcPDOHeLXDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DpzI+rKIujCvPd/8Cwc5h8MlhSHU0IqflbK0nUvRc0=;
 b=FSF72qkPc4Pto8AGysCVvHfIRqRYrhaYafSgRDzhyMT9YF5aLqS9eKVCbtDEvanXGXGeSYCW8FcvPThj1AIAyA2wPLisPz6gEcP8E2PYfHFfhTEz9TrTvdLROryKsu776Tocgm6tInk7OS4c4TubSrMOEJpJiZju1XmG5jfnXy8=
Received: from BN8PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:d4::37)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 08:42:10 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:d4:cafe::9f) by BN8PR04CA0063.outlook.office365.com
 (2603:10b6:408:d4::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Thu,
 24 Apr 2025 08:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:42:09 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:42:04 -0500
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
Subject: [PATCH v9 07/10] drm/sched: cleanup event names
Date: Thu, 24 Apr 2025 10:38:19 +0200
Message-ID: <20250424083834.15518-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: cde1fbd7-b961-4e73-069a-08dd830be68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hFIbwcZs6QJ6Bkr3L8tslpCs/lWwkhzmJeb5gyopvfjq9bleTXaTL6fJkigg?=
 =?us-ascii?Q?G5wVXy7Mpsft8iFlzaloq2s/vV++eyawBukrzYbpMSW3i0jtJbC3WnMjy2Rq?=
 =?us-ascii?Q?PojM6yMoBpA7RtKi+uinBewO48X1Kx304sM6BBRLYL3XrfIu5GRs60Y3wKQ1?=
 =?us-ascii?Q?2JcX6ccb/BQh/7+S8chKBvJxag8r88MSo7lMRxUYzCQexlSvpT1FpbVXqS1r?=
 =?us-ascii?Q?FG6GX26jbc67+wQViQurCF4gjDZ+IPi512ySJ76cQbw7+fKjI9mzraOJdueh?=
 =?us-ascii?Q?ovEarlz2nHhlEN9S1b+2r33iqBrN4iHUb2b9czdhDkO8kYLt+iEgS4SPFuNM?=
 =?us-ascii?Q?/tgHhNAt0sAJCBbnkttMqgXpazlhJWvMzK78YVQqD9BMOeaK5ThbMhVxGyMV?=
 =?us-ascii?Q?6acmcrp5AIVyYBuRHnxtDtMaKd7BZl9qIuzJlaCa/U9RkbctQCKyLLSaaI/9?=
 =?us-ascii?Q?F+UwJNb8JqqrzX+qwpMugIfFHKdl06P0g6sMwnMwKMkxi3X1YTBVQKOfwE3z?=
 =?us-ascii?Q?GjqkoZjjISQM6qTGP83ilPag3q9/+KpyRCXgKsM9wMVsiD9nFzlsGNQfFhlc?=
 =?us-ascii?Q?Vjymk8y+yiXCxR4dhxiEsTeodkoEQrHYV8kSqPQ58v0LEY2nOxw92cKOOD/s?=
 =?us-ascii?Q?FblVI7HnhV1ZQ2CqaG8Ly5G80RDbdXmsAJtrWeWaCJ7tU00sOF8UZ4554emB?=
 =?us-ascii?Q?KeXyZWR+PW37TN7a4hx1OIf081pG7byYpYKs7asEfFEDX6lAqVDNGI0lHXtq?=
 =?us-ascii?Q?N6xVVAdACtSpx5HqpTT0npGFNYYaJbADnod6EW31w0v/k9zzWwerZSjA48IE?=
 =?us-ascii?Q?oxf9Vc1hKJLNwwia/I5bHgWKWSzevDhxpwUI5v3DZLQAJLEv1gXzcUQ9mSTl?=
 =?us-ascii?Q?cbVgsJMgUJgLhkqQZ3FhjoRT7nSmBAcsVjd7KoI5TFwBtPwIOx+gN7tj4Tuu?=
 =?us-ascii?Q?72fFbnFfJ59IjKiBa5VOzEUPlLaYCJrUNlYD8UWzOknw0no45G4SPf9nX+UU?=
 =?us-ascii?Q?P8aI1arB+nC6aJ8vm24lfVHY9DJeTAf87MukRb9/rtudfXKrfoUa0nz8T+9N?=
 =?us-ascii?Q?i8DZBPOUX4E/kMVA0ihPvGArSQOUPPl2W1FyM5cCf04KlL7D2EctvBwPwO+8?=
 =?us-ascii?Q?nDF/Eon16MejOShJkWelsyI1pPjxR67XZxnYacdl96IR9CnYFny8s56QxQvv?=
 =?us-ascii?Q?bMvWu0b6GKs0ot+M9K75huvLLdYs/OJiuavPPg4dzqjc7H6BdsVzN/WaxpvA?=
 =?us-ascii?Q?3WzgQ0BDkg7UTsFvL13JDeKdR1vQDfSMaBgPF3pnuvxIzRn+6TN8CmNQy7IC?=
 =?us-ascii?Q?nSZNalrCjXzPkJnEm5NRLeYcljj3T6R9joE22O9hK7MXvGrcgSY16SmDlMZj?=
 =?us-ascii?Q?SxURdo9JSBinfWNOGHOmiCeLVfpYQolGHiC0dDuPGeqIWsCSjd3Pus3VXecv?=
 =?us-ascii?Q?OdAD95cwNW+wLj24scVSB8WGYxRYYqiMrlT0NJrFHagxiPPqruY3k5gFipe5?=
 =?us-ascii?Q?ZeUk0YtbBj8OVWSoyKpazMeZ8iwbfoUTrVmm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:42:09.1677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde1fbd7-b961-4e73-069a-08dd830be68a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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
index be579e132711..59162cb81c4e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -477,10 +477,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
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
@@ -586,7 +586,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	bool first;
 	ktime_t submit_ts;
 
-	trace_drm_sched_job(sched_job, entity);
+	trace_drm_sched_job_queue(sched_job, entity);
 
 	if (trace_drm_sched_job_add_dep_enabled()) {
 		struct dma_fence *entry;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 60611618f3ab..195b5f891068 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -401,7 +401,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	atomic_sub(s_job->credits, &sched->credit_count);
 	atomic_dec(sched->score);
 
-	trace_drm_sched_process_job(s_fence);
+	trace_drm_sched_job_done(s_fence);
 
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
@@ -1231,7 +1231,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
-	trace_drm_run_job(sched_job, entity);
+	trace_drm_sched_job_run(sched_job, entity);
 	/*
 	 * The run_job() callback must by definition return a fence whose
 	 * refcount has been incremented for the scheduler already.
-- 
2.43.0

