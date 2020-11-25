Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313452C3780
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 04:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857546E7FE;
	Wed, 25 Nov 2020 03:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4A86E7F5;
 Wed, 25 Nov 2020 03:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EM4QqtQG1tyKJCZi4qTDrTLHPp0bLNlBZldUcviurIjmPxR/uF//6bo4Z5fF+q3/Pc+pm7IV9iWgEnk/LsBVuJOHwc2t7y9JPtGW3LycXw4uIYYzvbuZaC1hUtT7Kv5PQYKi4AFdJPzuIz99Q3q9EdpQhVKPmBBUaQa6+/C/C7CypA9xAmb3PqWSeM9Hhw0PgdDgxscPcsDOQsGm6VqhcHKDWh2Bn0kIoaq/TXT+0OApTWBNvLYCmzdekwFrO+Bi6rKulqAD7hUSJ+gDeQYl2Y06TTiLHdtsK8+wnCbpeP36SDHGQUykLR9YhPa+9H3igalc8SICRdSwHtuiLbHIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMoIIn28HpYcPNzWwPg6G7QuqY4i0mfIVLLXEgtrijI=;
 b=lelFQXUo6XISl6/rXau9bNT+HYGV6z4wM8NROnf2ruiFIlMvWXkg3YDFqHg8YyaP04TFG58zfFcDQyDUu1BcEgr7Uw8Z033gUT9h8L8R61qvYpWcfqUhiDQesVm/zkTRUx+4osP5Nnt3xVtYnwUPYactRyZS5czUk8uOeNWIaanUNfQ32eCHxRmiljH+9bpqa3LO3si870wYIQd6IQAfwD4EzWU7qaODB2zBiHb2+PZwvPTn9Wuk3W0WDejfbhr1wJ9ziprKPqR26WQbR3EV9PeL9Yc2TCBIrtulcNk51ruAStfRmOvk7ztMaODwkayPq0ezIixReI17MiA7Ptn+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMoIIn28HpYcPNzWwPg6G7QuqY4i0mfIVLLXEgtrijI=;
 b=EMiCQjmSkiiu5/lMeG79gX1LSIeZNdLPDSiVB5fxyEkNlj27UaOHfGa7G18DXY7gCvfWcbyTsV6+QqaFKEzwJNOG+2WlwjLK2i1FHtSt8xoEVQ2cKpRP5J1SLza/Wf5bIjCRE1uPFj2lxacoedSblDLiN4i6JpUSum6Mf8wOdTg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2507.namprd12.prod.outlook.com (2603:10b6:3:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Wed, 25 Nov
 2020 03:17:22 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3589.031; Wed, 25 Nov 2020
 03:17:22 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH 1/6] drm/scheduler: "node" --> "list"
Date: Tue, 24 Nov 2020 22:17:03 -0500
Message-Id: <20201125031708.6433-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.154.g7f7ebe054a
In-Reply-To: <20201125031708.6433-1-luben.tuikov@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: CH2PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:610:59::36) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 CH2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:59::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 03:17:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd69c73b-0d9f-4a59-09ce-08d890f09fd3
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2507112EDA0AC442C38D6FF699FA0@DM5PR1201MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hVQZXiSkL5v4UnhBZDyFEUGI7yNU+q82m5UkO8Y4gdVmcX7XaH20veVbrz/UxIEUsRjocZaxuLbY/WjsZxgzoHEhkayqWhWg9d57YsiyCTlKsEXYoyNBGLuyshvOd116utmtMkJzWNQ1Kr1pxINoNFZfFnVVLtDsrKrHHEv6k3eGxbVij/iurlA1jmJ6pHDofO42dUeao51+Jrz0efanxNnlwRg9TB2OS8r4vKHV/paXIjVuHPd6UiH2asK366x1HeYUZ0TjhP+S4X7dPuRn7ZFRg3Bo3zhCeGiNypPI0ZXM7erd1Na+fQthXAiI+Hz7o2a3pJZw5Kydv9LIX3eR5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(7696005)(6486002)(54906003)(478600001)(26005)(52116002)(8936002)(83380400001)(8676002)(86362001)(2616005)(6636002)(5660300002)(956004)(1076003)(4326008)(2906002)(44832011)(186003)(66946007)(110136005)(316002)(36756003)(66476007)(16526019)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: uZe3PIVhBcXI2n9ezWcLxLbFxtB+Ty38+SunLgdbmrQNovXNag8d8D3C/XVbjtoe59AdIvG4YRJjffddyuZxk7OjHtKupUzo20chc/LIVAwStVKCmdXsH5ElNTERSN6JGusAxDBl0xbQEIC5nsXZj95aKA+M8dJvouzz5sqFVlamjsmX9k06lYW5p7ZV+7vGn1c3K1+FLkgcELQ4+mWzxy2sacjiJUi0sGfcDCb1WC85EJqldgxshR1W8BjBV7y64lkiEJ9jo4T2RIErOCVeZVKt1KRNJIO7YY4NRjFFbRu0eQIORQxYksdH0EOjyIJE2zF2MtfL5LeWSiAIx3U33eulkXoFdgD/fnTq5oTsoHUEPksYTi6gOYDrJKewWiHYhHmOh5jBLGKrwZeVn5TflNi9TFXGKU8kuOSjzmAXQ9Tc2KMIR+C6bcZVxc1smd2Dxk9Ko1nM00OoE7wXxHeQsbLl0iFprtOn4xNjTO8D5kSQvg6C9jY0lWQqHi8jmK+lQyZATdXMt5V/gav969aUsy6C1f0fBA7QD4INkOnVwyrLAqoumbT4d17eRIrkHHDTd85ntwFuOe4ZLSuMS8UY6bze+GndzcklSEpf5kLQgX6dn/vP6Mpty4t7kQBI3Pusgzt2DCgbm+/u7D6wM+jr+huXB/Y0GLMHeaCyw6nOYa07aD8npkSLVM8gR5yYLUhb+miCUeHgtwtQqdF+qkCKzPWTQ1CQuSo2ls90bpmYdCnoshMIKn2P5FiKJznc6rmfIVaskn54nhckQPmqFzCgJGCoMRAcpHGi55gb5DU8OWd5vt2bL8rJJEZKOS1FBaNq7BBaJRPEwvdwG1P+kow38SqKJqqkP0bafjaH6wH02KwSCwtCTrjsi19gsjltmTTsDTDenApfy/Y9jfyE0uiBHw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd69c73b-0d9f-4a59-09ce-08d890f09fd3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 03:17:22.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0S08ijiWFYAexTxkEs2A0PHVA1lRlZGKoDJekuqnkzxbeBurpj8kNd4OWA2Zzajt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2507
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
Cc: Emily Deng <Emily.Deng@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename "node" to "list" in struct drm_sched_job,
in order to make it consistent with what we see
being used throughout gpu_scheduler.h, for
instance in struct drm_sched_entity, as well as
the rest of DRM and the kernel.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c      | 23 +++++++++++----------
 include/drm/gpu_scheduler.h                 |  4 ++--
 5 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 5c1f3725c741..8358cae0b5a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1427,7 +1427,7 @@ static void amdgpu_ib_preempt_job_recovery(struct drm_gpu_scheduler *sched)
 	struct dma_fence *fence;
 
 	spin_lock(&sched->job_list_lock);
-	list_for_each_entry(s_job, &sched->ring_mirror_list, node) {
+	list_for_each_entry(s_job, &sched->ring_mirror_list, list) {
 		fence = sched->ops->run_job(s_job);
 		dma_fence_put(fence);
 	}
@@ -1459,10 +1459,10 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
 
 no_preempt:
 	spin_lock(&sched->job_list_lock);
-	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, node) {
+	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, list) {
 		if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
 			/* remove job from ring_mirror_list */
-			list_del_init(&s_job->node);
+			list_del_init(&s_job->list);
 			sched->ops->free_job(s_job);
 			continue;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7560b05e4ac1..4df6de81cd41 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4128,7 +4128,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 
 		spin_lock(&ring->sched.job_list_lock);
 		job = list_first_entry_or_null(&ring->sched.ring_mirror_list,
-				struct drm_sched_job, node);
+				struct drm_sched_job, list);
 		spin_unlock(&ring->sched.job_list_lock);
 		if (job)
 			return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index dcfe8a3b03ff..aca52a46b93d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -271,7 +271,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	}
 
 	/* Signal all jobs already scheduled to HW */
-	list_for_each_entry(s_job, &sched->ring_mirror_list, node) {
+	list_for_each_entry(s_job, &sched->ring_mirror_list, list) {
 		struct drm_sched_fence *s_fence = s_job->s_fence;
 
 		dma_fence_set_error(&s_fence->finished, -EHWPOISON);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c6332d75025e..c52eba407ebd 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -272,7 +272,7 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 	struct drm_gpu_scheduler *sched = s_job->sched;
 
 	spin_lock(&sched->job_list_lock);
-	list_add_tail(&s_job->node, &sched->ring_mirror_list);
+	list_add_tail(&s_job->list, &sched->ring_mirror_list);
 	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
@@ -287,7 +287,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->ring_mirror_list,
-				       struct drm_sched_job, node);
+				       struct drm_sched_job, list);
 
 	if (job) {
 		/*
@@ -295,7 +295,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
 		 * is parked at which point it's safe.
 		 */
-		list_del_init(&job->node);
+		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
 		job->sched->ops->timedout_job(job);
@@ -392,7 +392,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 		 * Add at the head of the queue to reflect it was the earliest
 		 * job extracted.
 		 */
-		list_add(&bad->node, &sched->ring_mirror_list);
+		list_add(&bad->list, &sched->ring_mirror_list);
 
 	/*
 	 * Iterate the job list from later to  earlier one and either deactive
@@ -400,7 +400,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	 * signaled.
 	 * This iteration is thread safe as sched thread is stopped.
 	 */
-	list_for_each_entry_safe_reverse(s_job, tmp, &sched->ring_mirror_list, node) {
+	list_for_each_entry_safe_reverse(s_job, tmp, &sched->ring_mirror_list,
+					 list) {
 		if (s_job->s_fence->parent &&
 		    dma_fence_remove_callback(s_job->s_fence->parent,
 					      &s_job->cb)) {
@@ -411,7 +412,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 			 * Locking here is for concurrent resume timeout
 			 */
 			spin_lock(&sched->job_list_lock);
-			list_del_init(&s_job->node);
+			list_del_init(&s_job->list);
 			spin_unlock(&sched->job_list_lock);
 
 			/*
@@ -462,7 +463,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 	 * so no new jobs are being inserted or removed. Also concurrent
 	 * GPU recovers can't run in parallel.
 	 */
-	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, node) {
+	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, list) {
 		struct dma_fence *fence = s_job->s_fence->parent;
 
 		atomic_inc(&sched->hw_rq_count);
@@ -505,7 +506,7 @@ void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
 	bool found_guilty = false;
 	struct dma_fence *fence;
 
-	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, node) {
+	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, list) {
 		struct drm_sched_fence *s_fence = s_job->s_fence;
 
 		if (!found_guilty && atomic_read(&s_job->karma) > sched->hang_limit) {
@@ -565,7 +566,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		return -ENOMEM;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
-	INIT_LIST_HEAD(&job->node);
+	INIT_LIST_HEAD(&job->list);
 
 	return 0;
 }
@@ -684,11 +685,11 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	spin_lock(&sched->job_list_lock);
 
 	job = list_first_entry_or_null(&sched->ring_mirror_list,
-				       struct drm_sched_job, node);
+				       struct drm_sched_job, list);
 
 	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
 		/* remove job from ring_mirror_list */
-		list_del_init(&job->node);
+		list_del_init(&job->list);
 	} else {
 		job = NULL;
 		/* queue timeout for next job */
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 92436553fd6a..3add0072bd37 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -189,14 +189,14 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  */
 struct drm_sched_job {
 	struct spsc_node		queue_node;
+	struct list_head		list;
 	struct drm_gpu_scheduler	*sched;
 	struct drm_sched_fence		*s_fence;
 	struct dma_fence_cb		finish_cb;
-	struct list_head		node;
 	uint64_t			id;
 	atomic_t			karma;
 	enum drm_sched_priority		s_priority;
-	struct drm_sched_entity  *entity;
+	struct drm_sched_entity         *entity;
 	struct dma_fence_cb		cb;
 };
 
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
