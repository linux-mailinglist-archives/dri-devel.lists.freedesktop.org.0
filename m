Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78262C3784
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 04:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6584A6E81A;
	Wed, 25 Nov 2020 03:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6567A6E7EC;
 Wed, 25 Nov 2020 03:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs5x11SJBUKQwJu2kc9/QRqYrnB8F2YTGZ3fPLRZqgbrrXd1r016SjBV6i4jAUjZuoUnKcxLv6rjWH0LhNYzzSh32nd5vz2Qbk8x4QZLi3dOvNT5TgrWS9OP6JpANyXcQREfWDcaGbtGx1/1Y4jQTtDw/6ECtNX8mOGFmoeTRyFAR726yU4dCOo5cUOxe1eWPN6crf5fwGntmubTyRFROCJdRDpOrOD4Va1zhyhY0xl7ZRCPDQixyQzmVMQqdWTNBsbIijeQKWpVSEX1/GRQvZBY0Qw7aR0bToWcz4AklXxgt87un0xFytWVHumButd612o+sxVk8kuGsdwG4X/C/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAVgGrfQPitmpq1mXMjQQshOAt8uvvM/13xR2RCLf9U=;
 b=Lyv0fxKItLNyzh5Lz4Eg0PDIDkJHxsoeZNqgsAVtgWcYEo6+2/KrwMujrRz6tH/LwIy+6NA6wHmHjiISjiIAYZAupwu+brJ+QlWmeX7hVHDlUYBcCJIRZEFZQzFq7+3tqRaO4sgMitaJaNeyIalGMZZBoVoVYOHKJiLXX5wk7+y3wa8ktKmP/0Lh4qyrQZ2yhQUoUJesvMmdfupZSF/H0W2GJqbTTd4rIoOaM+IzNZKHAAOi2Ekq7OzIf+EpKyMQZvxy9xqGCHntOk4vAnq2fpEFXzXbWLh2rkoi5wtqFOdkSxM029dLbu3CUT7EQF2/L4agWqc3Tybmc68pEmriyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAVgGrfQPitmpq1mXMjQQshOAt8uvvM/13xR2RCLf9U=;
 b=Z4VOgHsy7CudkLRn+N0V/iQcocAPAenOaSQOdOGRgiYVYPfPap4+6pC9jhz6DFeStPCENWkORWRZOrBSLybNMXpk1uOdzoYr8RHyOa0HVU2YHqc8BBdCV41rURcJJ4jz2wVBK0sp+yrQOh55LQFZfWzsonGH8xQw1kfSGDcMpw4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2507.namprd12.prod.outlook.com (2603:10b6:3:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Wed, 25 Nov
 2020 03:17:23 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3589.031; Wed, 25 Nov 2020
 03:17:23 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH 2/6] gpu/drm: ring_mirror_list --> pending_list
Date: Tue, 24 Nov 2020 22:17:04 -0500
Message-Id: <20201125031708.6433-3-luben.tuikov@amd.com>
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
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 03:17:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 693d69d2-8e6d-47b8-895f-08d890f0a06b
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2507CE5E44465C30EC5CBD3A99FA0@DM5PR1201MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eH8+tXDa3Z6sHdCe5lwFRdzCAJP13vwI96mqU2rnC5Frgzi/4ox36I84fCnz3UHMU7CWAwvFcVnbd2lk2rHpGoNQ1NjfMhef1+Q0NibBm7UCgbg2iToOZWUZgQOX3MCbZ+VBzuZ2QH3rGzOAS7AsNvezaU0/nyGTcjIUFqI8fvmtB1DTlxByCmgxuaxWPZKjPYE5Tiq+gocHN9fAeeEBUO2Jbs9FmGfcNyO2rX/rnvfHSbmrLuXL4QGVj+sH+E8vpmiSLtu9AOHZmOTxq83O/amTqabKx7+hJV+3XumeJkt0l3OSjYoGUzGbAMdYIuc+QLwyVuRy8XO/H8zA3mbB3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(7696005)(6486002)(54906003)(478600001)(26005)(52116002)(8936002)(30864003)(83380400001)(8676002)(86362001)(2616005)(6636002)(5660300002)(956004)(1076003)(4326008)(2906002)(44832011)(186003)(66946007)(110136005)(316002)(36756003)(66476007)(16526019)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OSprCyztnDKZGQEvgteGHD+1ZuO9GwH1a6gqbrCusdq2HNTBFsn0XwuzswmRh1DxLvys8w6mYMD0FI96anGtuAoyHiMS4gkMGWZyA/fkXyZ+zrTeGyFEETpwomWa0j3LnjVLZwZ1PZH+Q0xPvRMrDhsYXW5Ju4tETYZUtQbD7KH1oIoshv/06/AS90ataoM10JuouDbSTVArOVVBRLRaz33r5/rCCYyWher91bBXQlNL5jR/5uUe2yoDfggGHC5udXa207L4HTuDp9EKH9GFeVYrVbvUw0wj23n3zTEE1Bb5mJsuOj6ppVztp6UlRBnvdB2oqOl9Qg2SHoc+SDXIPf3s1q6xC9g6Og76hRGGBz2b8IWBpXU0IGkxzKHseLeyZJDOqoV9tzDWDH1Tt3s4Gri9lUxZVzwDHQD49SB8CW2pNSZYRSZ7I+5N41vQiuySA4i8UolE4icRdmw80GYUg7bo09DOBucXed1YZ4SrBqvCV0HfK1iNsXBlVjmOanmEtEUmjqfjJlEAR2FqwHHFBsagCkTwhIU+in2JUK3yRz+vSQsM+cBYPSAlxEOWexY+gwMIhB1mt/1EmW2W3oOL/Z0nJxovezNW/KzwdZM35YxlC2b7dNwlrC7O9EKjnzIjBFxLKbsS/9uumEkqkxL2GFKEUA/1K0BEZacCdEkxSYrGGAu0rjBfiMysdYIRuRyWnUG9XomrSp+RdeY08eSVPdd7yyzrHoprB0VjLFnJLl1NkLY86F+7w6QYBcal1jlGs1NjdCh6JhZoTgxdMfhSsSgFpu3AAvlVh1G9CF49RSQvltAb5AZmaStZ/muRXT13yxygfr4d61fvZ2hmSkbw79Sc0TsAj6gNFHeBFSrqp0iFTyGO9BPFiKYVqacDCh1Lz/C0nyTbq2Xq9i6j04f6tA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693d69d2-8e6d-47b8-895f-08d890f0a06b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 03:17:23.3766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVSsIVT662O+bkGFyQR/oWHtMNAWCaCMfRwADb/8j9ztw4diXOi/g9YSzJh/2Mm5
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

Rename "ring_mirror_list" to "pending_list",
to describe what something is, not what it does,
how it's used, or how the hardware implements it.

This also abstracts the actual hardware
implementation, i.e. how the low-level driver
communicates with the device it drives, ring, CAM,
etc., shouldn't be exposed to DRM.

The pending_list keeps jobs submitted, which are
out of our control. Usually this means they are
pending execution status in hardware, but the
latter definition is a more general (inclusive)
definition.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c      | 34 ++++++++++-----------
 include/drm/gpu_scheduler.h                 | 10 +++---
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 8358cae0b5a4..db77a5bdfa45 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1427,7 +1427,7 @@ static void amdgpu_ib_preempt_job_recovery(struct drm_gpu_scheduler *sched)
 	struct dma_fence *fence;
 
 	spin_lock(&sched->job_list_lock);
-	list_for_each_entry(s_job, &sched->ring_mirror_list, list) {
+	list_for_each_entry(s_job, &sched->pending_list, list) {
 		fence = sched->ops->run_job(s_job);
 		dma_fence_put(fence);
 	}
@@ -1459,7 +1459,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
 
 no_preempt:
 	spin_lock(&sched->job_list_lock);
-	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, list) {
+	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
 			/* remove job from ring_mirror_list */
 			list_del_init(&s_job->list);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4df6de81cd41..fbae600aa5f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4127,8 +4127,8 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 			continue;
 
 		spin_lock(&ring->sched.job_list_lock);
-		job = list_first_entry_or_null(&ring->sched.ring_mirror_list,
-				struct drm_sched_job, list);
+		job = list_first_entry_or_null(&ring->sched.pending_list,
+					       struct drm_sched_job, list);
 		spin_unlock(&ring->sched.job_list_lock);
 		if (job)
 			return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index aca52a46b93d..ff48101bab55 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -271,7 +271,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	}
 
 	/* Signal all jobs already scheduled to HW */
-	list_for_each_entry(s_job, &sched->ring_mirror_list, list) {
+	list_for_each_entry(s_job, &sched->pending_list, list) {
 		struct drm_sched_fence *s_fence = s_job->s_fence;
 
 		dma_fence_set_error(&s_fence->finished, -EHWPOISON);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c52eba407ebd..b694df12aaba 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -198,7 +198,7 @@ EXPORT_SYMBOL(drm_sched_dependency_optimized);
 static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 {
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
-	    !list_empty(&sched->ring_mirror_list))
+	    !list_empty(&sched->pending_list))
 		schedule_delayed_work(&sched->work_tdr, sched->timeout);
 }
 
@@ -258,7 +258,7 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
 {
 	spin_lock(&sched->job_list_lock);
 
-	if (list_empty(&sched->ring_mirror_list))
+	if (list_empty(&sched->pending_list))
 		cancel_delayed_work(&sched->work_tdr);
 	else
 		mod_delayed_work(system_wq, &sched->work_tdr, remaining);
@@ -272,7 +272,7 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 	struct drm_gpu_scheduler *sched = s_job->sched;
 
 	spin_lock(&sched->job_list_lock);
-	list_add_tail(&s_job->list, &sched->ring_mirror_list);
+	list_add_tail(&s_job->list, &sched->pending_list);
 	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
@@ -286,7 +286,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 
 	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
 	spin_lock(&sched->job_list_lock);
-	job = list_first_entry_or_null(&sched->ring_mirror_list,
+	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
 	if (job) {
@@ -371,7 +371,7 @@ EXPORT_SYMBOL(drm_sched_increase_karma);
  * Stop the scheduler and also removes and frees all completed jobs.
  * Note: bad job will not be freed as it might be used later and so it's
  * callers responsibility to release it manually if it's not part of the
- * mirror list any more.
+ * pending list any more.
  *
  */
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
@@ -392,15 +392,15 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 		 * Add at the head of the queue to reflect it was the earliest
 		 * job extracted.
 		 */
-		list_add(&bad->list, &sched->ring_mirror_list);
+		list_add(&bad->list, &sched->pending_list);
 
 	/*
 	 * Iterate the job list from later to  earlier one and either deactive
-	 * their HW callbacks or remove them from mirror list if they already
+	 * their HW callbacks or remove them from pending list if they already
 	 * signaled.
 	 * This iteration is thread safe as sched thread is stopped.
 	 */
-	list_for_each_entry_safe_reverse(s_job, tmp, &sched->ring_mirror_list,
+	list_for_each_entry_safe_reverse(s_job, tmp, &sched->pending_list,
 					 list) {
 		if (s_job->s_fence->parent &&
 		    dma_fence_remove_callback(s_job->s_fence->parent,
@@ -408,7 +408,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 			atomic_dec(&sched->hw_rq_count);
 		} else {
 			/*
-			 * remove job from ring_mirror_list.
+			 * remove job from pending_list.
 			 * Locking here is for concurrent resume timeout
 			 */
 			spin_lock(&sched->job_list_lock);
@@ -463,7 +463,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 	 * so no new jobs are being inserted or removed. Also concurrent
 	 * GPU recovers can't run in parallel.
 	 */
-	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, list) {
+	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		struct dma_fence *fence = s_job->s_fence->parent;
 
 		atomic_inc(&sched->hw_rq_count);
@@ -494,7 +494,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 EXPORT_SYMBOL(drm_sched_start);
 
 /**
- * drm_sched_resubmit_jobs - helper to relunch job from mirror ring list
+ * drm_sched_resubmit_jobs - helper to relunch job from pending ring list
  *
  * @sched: scheduler instance
  *
@@ -506,7 +506,7 @@ void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
 	bool found_guilty = false;
 	struct dma_fence *fence;
 
-	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, list) {
+	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		struct drm_sched_fence *s_fence = s_job->s_fence;
 
 		if (!found_guilty && atomic_read(&s_job->karma) > sched->hang_limit) {
@@ -665,7 +665,7 @@ static void drm_sched_process_job(struct dma_fence *f, struct dma_fence_cb *cb)
  *
  * @sched: scheduler instance
  *
- * Returns the next finished job from the mirror list (if there is one)
+ * Returns the next finished job from the pending list (if there is one)
  * ready for it to be destroyed.
  */
 static struct drm_sched_job *
@@ -675,7 +675,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 	/*
 	 * Don't destroy jobs while the timeout worker is running  OR thread
-	 * is being parked and hence assumed to not touch ring_mirror_list
+	 * is being parked and hence assumed to not touch pending_list
 	 */
 	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !cancel_delayed_work(&sched->work_tdr)) ||
@@ -684,11 +684,11 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 	spin_lock(&sched->job_list_lock);
 
-	job = list_first_entry_or_null(&sched->ring_mirror_list,
+	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
 	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
-		/* remove job from ring_mirror_list */
+		/* remove job from pending_list */
 		list_del_init(&job->list);
 	} else {
 		job = NULL;
@@ -858,7 +858,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
 	init_waitqueue_head(&sched->wake_up_worker);
 	init_waitqueue_head(&sched->job_scheduled);
-	INIT_LIST_HEAD(&sched->ring_mirror_list);
+	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3add0072bd37..2e0c368e19f6 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -174,7 +174,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @sched: the scheduler instance on which this job is scheduled.
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
- * @node: used to append this struct to the @drm_gpu_scheduler.ring_mirror_list.
+ * @node: used to append this struct to the @drm_gpu_scheduler.pending_list.
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
  *         limit of the scheduler then the job is marked guilty and will not
@@ -203,7 +203,7 @@ struct drm_sched_job {
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
 					    int threshold)
 {
-	return (s_job && atomic_inc_return(&s_job->karma) > threshold);
+	return s_job && atomic_inc_return(&s_job->karma) > threshold;
 }
 
 /**
@@ -260,8 +260,8 @@ struct drm_sched_backend_ops {
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @thread: the kthread on which the scheduler which run.
- * @ring_mirror_list: the list of jobs which are currently in the job queue.
- * @job_list_lock: lock to protect the ring_mirror_list.
+ * @pending_list: the list of jobs which are currently in the job queue.
+ * @job_list_lock: lock to protect the pending_list.
  * @hang_limit: once the hangs by a job crosses this limit then it is marked
  *              guilty and it will be considered for scheduling further.
  * @score: score to help loadbalancer pick a idle sched
@@ -282,7 +282,7 @@ struct drm_gpu_scheduler {
 	atomic64_t			job_id_count;
 	struct delayed_work		work_tdr;
 	struct task_struct		*thread;
-	struct list_head		ring_mirror_list;
+	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
 	atomic_t                        score;
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
