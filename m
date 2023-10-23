Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6D77D2900
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 05:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E857210E042;
	Mon, 23 Oct 2023 03:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FD110E02D;
 Mon, 23 Oct 2023 03:23:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6G5l+2Oz3lasPvRdFP44K3bKB3AAuYfq/bixCOHUi3PaWhc6An+Z8FXWvWEfEg3Ea3JZOHfXqKvaO8AQadhXxAHxy6Z/7+PlnQRTp/zh5gFSIyiLGyC7b5d/SOMJskKGHXu4Xw3jEOaoy0UIWkf1gi1XDLVh0CcSBBCZQCvOOIs1EFFQ/NJEQcFcB5xtYq05hX7MyopoE5rRxWF+5O6Yo5HbdIUNPDnx0stCUIoADhO3I1o59uWq7nyKaAdowlfZZ/Uk6kDSw5co+Te9iNsctY5PnTyxBK0RyZxnLTdAYer1bYkShtzibNUaekDGHBt8qFJO4QuJewZaThJO/VboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLpxwUH+hMUgwS93uXl2iTMJN8isGtun6LgDhx/ifEc=;
 b=kpVMlcBGxh9AYcMv+vO7FQ9IR25RcVE885LiwiedtWUJL7ZFfdCfAKa8ysTy/cWOdg+2E3iv6uEgOnfvSEBzu1HG5uyfZXhDLBlsDsuTbDDcbMwQBwoeFDndDkZK+hz3uGkrqRYeA/3bdwNoEvuINyUePp8Gnj4MLv8+rr3cj7bU1yVnQedenlJMmbpMooMlhPgj51GGKtSDOMMcRymFJDTPQOI0hI2DgGsQQ/NKm27pywszS87157Xn9Aq0lvqO94phOj3KAY/bUOoNdMVDG8QlL0qtHITuRfV92u231e7Sos8PvyNIrP+qvpXZ8hhnHi13AqrlEip7GkzLboxrzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLpxwUH+hMUgwS93uXl2iTMJN8isGtun6LgDhx/ifEc=;
 b=h02L7tytccy3FB8LcTMY8GOnWivMjrO34UXRiYZUL79YMtlPA+jxH5N3kJi39AVSyur8uARLJv2PjAlpaZvh6a6LK0EwfmXJJU4zoX/WStHiusCxt2Xzk/8wBFvjBGoAom884i526z1jxSRnGo3jkcB1+VB6tSOLKl63xdWKna8=
Received: from BL0PR01CA0012.prod.exchangelabs.com (2603:10b6:208:71::25) by
 PH8PR12MB7253.namprd12.prod.outlook.com (2603:10b6:510:226::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 03:23:07 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:71:cafe::c2) by BL0PR01CA0012.outlook.office365.com
 (2603:10b6:208:71::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Mon, 23 Oct 2023 03:23:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 23 Oct 2023 03:23:06 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 22 Oct
 2023 22:23:02 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/sched: Convert the GPU scheduler to variable number of
 run-queues
Date: Sun, 22 Oct 2023 23:22:51 -0400
Message-ID: <20231023032251.164775-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|PH8PR12MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fa06f4-d03d-434d-002d-08dbd3776008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vrd+3GzdKKe0rtrYFuOqoycFUlhVAt6DG9p0dZo1ZZIOyZ5ft/aXxpUfw3NiQGdYR1YqnJ0RZJ538e+I4TNH2WHWyRZDVXApi7vc9q1DTKDvoMt97EEv6I8QiPcVPUrmcToJglvUHMPZPVgAI7ulY31xXwZMfsGSF0XsY7OgXn3EPjd9fKzReoo9nWmBhElS/kZF6FiT4LipEF1o9+b735bOADYp/HFWMpRovcmoPVTH+lYB2f189RZ3L3mQpslCsrrVEgwNpBjyLnLjfxhD9bFT0VzdTZmw2cKQvtkFnAHRpBlduSafBmREVkmtLLn8F1wHTCOZPjqimwfSuqUo8rr+XZj38TR86RbqwkpXFIO4PcUZVq4o5gd/I6lH26ZOGMunhlhbssWcZMyy62wXlbLwj7ZOzv8C5m803K/ctYNLkBpbK2kXoax65eO81wMXWip9FEGRbhTjFGbxGB+BSGMdeWz7XTuFGgZStmfKZAtULSJ7L5OiNqPQNXbpeWKRMGVfqzpO28Fo3YXI4fErNRNZYdAN7iEQUi8EgL+zZDHfJYaCQ4mJmuoV8DAUyLbGO9WtcsE9+ocfRwcJWRqSDZzSZJV279TR0M+kDf962Hiqw1tSzevrsKBQOeArAPWdk23WHzlQr/VJT9FR31bVs7mxw0/2l8s8IBLQt599JiZAP2917Y1iGrRn1H8G6Ecpdh8Kfxak4u31Sw839trg28GwE5p255Q4QwbN9cVTAK/N+okgp017NcU22TcRvsHLekRGURYa6B/wBckzl0Pkcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(426003)(40480700001)(36756003)(40460700003)(6916009)(316002)(70206006)(54906003)(70586007)(86362001)(2616005)(82740400003)(81166007)(356005)(83380400001)(26005)(66574015)(1076003)(336012)(16526019)(36860700001)(6666004)(8936002)(30864003)(2906002)(478600001)(41300700001)(7416002)(47076005)(8676002)(44832011)(5660300002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 03:23:06.8294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fa06f4-d03d-434d-002d-08dbd3776008
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7253
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
Cc: Matthew Brost <matthew.brost@intel.com>, lima@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, nouveau@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, etnaviv@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU scheduler has now a variable number of run-queues, which are set up at
drm_sched_init() time. This way, each driver announces how many run-queues it
requires (supports) per each GPU scheduler it creates. Note, that run-queues
correspond to scheduler "priorities", thus if the number of run-queues is set
to 1 at drm_sched_init(), then that scheduler supports a single run-queue,
i.e. single "priority". If a driver further sets a single entity per
run-queue, then this creates a 1-to-1 correspondence between a scheduler and
a scheduled entity.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  1 +
 drivers/gpu/drm/lima/lima_sched.c          |  4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    |  1 +
 drivers/gpu/drm/scheduler/sched_entity.c   | 18 +++++-
 drivers/gpu/drm/scheduler/sched_main.c     | 74 ++++++++++++++++++----
 drivers/gpu/drm/v3d/v3d_sched.c            |  5 ++
 include/drm/gpu_scheduler.h                |  9 ++-
 11 files changed, 98 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2b8356699f235d..251995a90bbe69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 		}
 
 		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
+				   DRM_SCHED_PRIORITY_COUNT,
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 78476bc75b4e1d..1f357198533f3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,8 +325,8 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
 			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 345fec6cb1a4c1..9b79f218e21afc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -135,6 +135,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	int ret;
 
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
 			     dev_name(gpu->dev), gpu->dev);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index ffd91a5ee29901..295f0353a02e58 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -488,7 +488,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
+	return drm_sched_init(&pipe->base, &lima_sched_ops,
+			      DRM_SCHED_PRIORITY_COUNT,
+			      1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
 			      NULL, name, pipe->ldev->dev);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 40c0bc35a44cee..95257ab0185dc4 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -95,8 +95,9 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
-			num_hw_submissions, 0, sched_timeout,
-			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
+			     DRM_SCHED_PRIORITY_COUNT,
+			     num_hw_submissions, 0, sched_timeout,
+			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 3b7ea522122605..7c376c4ccdcf9b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -436,6 +436,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 		return -ENOMEM;
 
 	return drm_sched_init(sched, &nouveau_sched_ops,
+			      DRM_SCHED_PRIORITY_COUNT,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
 			      NULL, NULL, "nouveau_sched", drm->dev->dev);
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a8b4827dc42586..95510d481fab3a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -832,6 +832,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 
 		ret = drm_sched_init(&js->queue[j].sched,
 				     &panfrost_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT,
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index a42763e1429dc1..409e4256f6e7d6 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -75,8 +75,20 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
-		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+	if (!sched_list[0]->sched_rq) {
+		/* Warn drivers not to do this and to fix their DRM
+		 * calling order.
+		 */
+		pr_warn("%s: called with uninitialized scheduler\n", __func__);
+	} else if (num_sched_list) {
+		/* The "priority" of an entity cannot exceed the number
+		 * of run-queues of a scheduler.
+		 */
+		if (entity->priority >= sched_list[0]->num_rqs)
+			entity->priority = max_t(u32, sched_list[0]->num_rqs,
+						 DRM_SCHED_PRIORITY_MIN);
+		entity->rq = sched_list[0]->sched_rq[entity->priority];
+	}
 
 	init_completion(&entity->entity_idle);
 
@@ -533,7 +545,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->rq_lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? &sched->sched_rq[entity->priority] : NULL;
+	rq = sched ? sched->sched_rq[entity->priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 5a3a622fc672f3..99797a8c836ac7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -632,8 +632,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	if (!entity->rq)
+	if (!entity->rq) {
+		/* This will most likely be followed by missing frames
+		 * or worse--a blank screen--leave a trail in the
+		 * logs, so this can be debugged easier.
+		 */
+		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
 		return -ENOENT;
+	}
 
 	job->entity = entity;
 	job->s_fence = drm_sched_fence_alloc(entity, owner);
@@ -671,7 +677,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 	sched = entity->rq->sched;
 
 	job->sched = sched;
-	job->s_priority = entity->rq - sched->sched_rq;
+	job->s_priority = entity->priority;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
@@ -888,10 +894,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 		return NULL;
 
 	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
+			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
+			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
@@ -1071,6 +1077,7 @@ static int drm_sched_main(void *param)
  *
  * @sched: scheduler instance
  * @ops: backend operations for this scheduler
+ * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1084,11 +1091,12 @@ static int drm_sched_main(void *param)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   unsigned hw_submission, unsigned hang_limit,
+		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
 	int i, ret;
+
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
@@ -1097,8 +1105,36 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
-		drm_sched_rq_init(sched, &sched->sched_rq[i]);
+
+	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
+		/* This is a gross violation--tell drivers what the  problem is.
+		 */
+		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
+			__func__);
+		return -EINVAL;
+	} else if (sched->sched_rq) {
+		/* Not an error, but warn anyway so drivers can
+		 * fine-tune their DRM calling order, and return all
+		 * is good.
+		 */
+		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
+		return 0;
+	}
+
+	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
+					GFP_KERNEL | __GFP_ZERO);
+	if (!sched->sched_rq) {
+		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);
+		return -ENOMEM;
+	}
+	sched->num_rqs = num_rqs;
+	ret = -ENOMEM;
+	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
+		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
+		if (!sched->sched_rq[i])
+			goto Out_unroll;
+		drm_sched_rq_init(sched, sched->sched_rq[i]);
+	}
 
 	init_waitqueue_head(&sched->wake_up_worker);
 	init_waitqueue_head(&sched->job_scheduled);
@@ -1115,11 +1151,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		ret = PTR_ERR(sched->thread);
 		sched->thread = NULL;
 		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
-		return ret;
+		goto Out_unroll;
 	}
 
 	sched->ready = true;
 	return 0;
+Out_unroll:
+	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
+		kfree(sched->sched_rq[i]);
+	kfree(sched->sched_rq);
+	sched->sched_rq = NULL;
+	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
+	return ret;
 }
 EXPORT_SYMBOL(drm_sched_init);
 
@@ -1138,8 +1181,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->thread)
 		kthread_stop(sched->thread);
 
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list)
@@ -1150,7 +1193,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 */
 			s_entity->stopped = true;
 		spin_unlock(&rq->lock);
-
+		kfree(sched->sched_rq[i]);
 	}
 
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
@@ -1160,6 +1203,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	cancel_delayed_work_sync(&sched->work_tdr);
 
 	sched->ready = false;
+	kfree(sched->sched_rq);
+	sched->sched_rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1186,9 +1231,10 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
+		for (i = DRM_SCHED_PRIORITY_MIN;
+		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
 		     i++) {
-			struct drm_sched_rq *rq = &sched->sched_rq[i];
+			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
 			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 06238e6d7f5cda..038e1ae589c718 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -389,6 +389,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
 			     &v3d_bin_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_bin", v3d->drm.dev);
@@ -397,6 +398,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
 			     &v3d_render_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_render", v3d->drm.dev);
@@ -405,6 +407,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
 			     &v3d_tfu_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_tfu", v3d->drm.dev);
@@ -414,6 +417,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
 				     &v3d_csd_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_csd", v3d->drm.dev);
@@ -422,6 +426,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
 				     &v3d_cache_clean_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_cache_clean", v3d->drm.dev);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ac65f0626cfc91..d2fb81e34174dc 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -471,7 +471,9 @@ struct drm_sched_backend_ops {
  * @hw_submission_limit: the max size of the hardware queue.
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
- * @sched_rq: priority wise array of run queues.
+ * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
+ *           as there's usually one run-queue per priority, but could be less.
+ * @sched_rq: An allocated array of run-queues of size @num_rqs;
  * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
  *                  is ready to be scheduled.
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
@@ -500,7 +502,8 @@ struct drm_gpu_scheduler {
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
-	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
+	u32                             num_rqs;
+	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		wake_up_worker;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
@@ -520,7 +523,7 @@ struct drm_gpu_scheduler {
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   uint32_t hw_submission, unsigned hang_limit,
+		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
 

base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
-- 
2.42.0

