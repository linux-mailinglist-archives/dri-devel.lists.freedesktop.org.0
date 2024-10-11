Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CD999C8B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2546E10EA3C;
	Fri, 11 Oct 2024 06:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qCCcAYVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F273910EA3C;
 Fri, 11 Oct 2024 06:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phGjLyZ993ygMwIisoyj2KLixj9tDbrPQBVMUwHQkPKwh6Ipu+aS9V9tVPfY3P4/dmWEKnUTuGuoRUtNG+L0Kj+T2HfOsuPduNKQXsOeYUMt0XxqsD/ZMUSycksAKfBPdfvZBXyY5xw5+zLdPAF6NCbyoLq86QJMAGNXjMlWxLoQ/4lr0FyTZUpa3RxBmlK0GWgvm9VSgzqHwAMfgWz0cu+lHraRBpHPBUlRkeS5fnkixKd5Osi+oQa77nvvnSBjPt3RyvT32rl1iPuT4ezxZve+dXUGxcXmPp38xY3obWLNC1WzgCpBeMVxAO1dPCYNCTIc1aVhHt/5hZseJ4dvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwpw6Cu9eMG/YWYTshInBVNudSFdR0v8l6nnw+cjh+0=;
 b=MIw78bNKuNRCWj5+0+U4Sp1uv+gCARmzboVA5YeJ+04L/poJs2yfz5LgKioDh/hpE39LOU4447AgzNtqFV01IEbmI2iezM3lC9k4dPGQgAsb+AObXu6YP7b+l0IB0opiL2NeFORAPvRoeh46plRQGTAETirs6bey+oeZrP0LlXjnsFfzlzBEPxM4hIKLALpPgRk2xET04vcTiMdzm94RFJKVKSZ3oGCEz5TveL5WZBh8HnYysuXysjAr8WW2fXgVhr8ufvi+z6WDWusRWITa7E2/kXjp1hlf+F+5wqs3nOXgSdAIAAosGswnz1nzncTFIhEJ97TG3Hmklh3bwNlfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwpw6Cu9eMG/YWYTshInBVNudSFdR0v8l6nnw+cjh+0=;
 b=qCCcAYVKaCGRZ7fcm1YpH9Kq/ctvpHEBQbaN6xuJCudbXdo17D7fLJB93c1W91aAt1H5TJse6P1ONxe6Ptc3v8zRe33l062j5WT6XiHrWh410ECREkTGKF+7yGdIeM6IEQx8ExVinuaY6FGBc/Y7QdA5qs0LVD5aK0zQn3G+h44=
Received: from BN9PR03CA0787.namprd03.prod.outlook.com (2603:10b6:408:13f::12)
 by SJ0PR12MB7065.namprd12.prod.outlook.com (2603:10b6:a03:4ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19; Fri, 11 Oct
 2024 06:21:45 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:13f:cafe::ef) by BN9PR03CA0787.outlook.office365.com
 (2603:10b6:408:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 06:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 06:21:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 01:21:44 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 11 Oct 2024 01:21:37 -0500
From: <jesse.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH 1/2] drm/sched: adding a new scheduling policy
Date: Fri, 11 Oct 2024 14:21:35 +0800
Message-ID: <20241011062136.1019695-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|SJ0PR12MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f10d2f-f835-442e-5002-08dce9bcfb01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZRYLHlHmz6V18vW62O7i9p3ds58Ld1ZnZX2q3Jm38Jb118SvOAdacpEm0Biy?=
 =?us-ascii?Q?MjHmLcfLF4itSmGOw/ZAI/EtYnOOMopjuaFnKc/5N0LTFJ7ty4v9MiEmhDeD?=
 =?us-ascii?Q?M186skxPV5TLFdTkoGBEt36rwY9tgUf3Shzxp3wwA2KTzE+Gck5zzWvIkwql?=
 =?us-ascii?Q?9ZOpMeThR6k/pQXVaacqItzVmp4sRhrEsHlpB2L6PYIuJTc6HqshQqU/uOSP?=
 =?us-ascii?Q?p/Jn7aEaRR78NTkC+N6PkR1mcFQ/lyV26v94oDMTO2z9qAo9BAX+17+HbTKp?=
 =?us-ascii?Q?wB0CvbJH0C3L+MKc9kEqEGN8bcm5uLhusp+e7M7FY5JthUA4aNpWpz+AlAw6?=
 =?us-ascii?Q?Y21Ul9Kuj7D+IdQbc9sMyikbZCrElXaj4Fb0GCH6xj8QpFvcjJB2SrtTxKcR?=
 =?us-ascii?Q?9TIkXDBCSwzYeoWF2xuazsHt9tSssT00milvGUFWTQkPgA0Y3mXFWOzl9SLl?=
 =?us-ascii?Q?kUZzm47JhN36i9xqxvcQG6vCwM6QhaGhEgAW8XHgYGXtNSl4rSATLGKMqXW/?=
 =?us-ascii?Q?zlJiEKOP2sLTshu6j4neR4ug4y9cep7vLqsf94M81RLo2HfHDs7WnQhJ4w24?=
 =?us-ascii?Q?zZdlZpnNRRGIjsvNT8EE/gCq8ouzM0aPh7zD5ErNb/iVsBt+JM40ZpJVNdUj?=
 =?us-ascii?Q?0LTZreOYdRveYDgMeUo8EgNw06VsSKocyj1KeoyB6F7xBFT8bDFd1EKg/UXY?=
 =?us-ascii?Q?AUzjO29sup7d6H5gzPKbO87zikYuGI30YnbE8KGop5+SpgOYMk97xHeAcioy?=
 =?us-ascii?Q?YrTDUZLNgqc1jDiKFU9RyHEscdS384ozEAPWiM555ncwPubGLHNFKXMWBt8p?=
 =?us-ascii?Q?y6g2IhXVZiWVUN0PFlRwuvtZm9ZWudCcKj/aeLkT7b6+MD4YdPWl9S4UpK4N?=
 =?us-ascii?Q?vVRV0xrDxT5BZBfV6VSHq5/JQistAUJmvncmMPaLw5VO++YkZanHp8iPx+NI?=
 =?us-ascii?Q?4irPjSF/A89tmGoBNZ7hpHrRfCGt7w2845Sb66LW2VsJtrmnQTl/LGeIaLAe?=
 =?us-ascii?Q?BGB+cQ+0xyAzE/0MV1ie5+gOSC4y/G4VpIuPOflJIj74IOOrr1/LhNDlc6do?=
 =?us-ascii?Q?V4cd28IwsJUvdBEWuTEQjy0BcUHzBHFYLlxIDS2bg02ymdHbJ7WHnebZbPR5?=
 =?us-ascii?Q?WUgurnjMWBkzx6d8p6DA31Ohk2pHJBWqTMKT9b45Hw7Q3RHt05BdrpDJyt/k?=
 =?us-ascii?Q?FQ/Np+WepQYr5+xh0sNxPXid4EZ4PZSp2RISurGHf5itPCtO+BZCIp8zuAiE?=
 =?us-ascii?Q?RU30qo3gXrOaU0/Wn9gc+ithLfE1U9Y2cjLFUlBP8eZRJj3Z35H/tJ6qFA6Z?=
 =?us-ascii?Q?fueU+m59KsNZ8s6adPCpPGdFBwpKCapSDDL7RUo0nIqEuDpTf6jyAUmTuLpg?=
 =?us-ascii?Q?C+CVkD9/U1oqQzme+NTDpMskoKQA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 06:21:45.3277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f10d2f-f835-442e-5002-08dce9bcfb01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7065
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

From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>

Added ring ID scheduling.
In some cases, userspace needs to run a job on a specific ring.
Instead of selecting the best ring to run based on the ring score.
For example, The user want to run a bad job on a specific ring to check
whether the ring can recover from a queue reset.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +-
 drivers/gpu/drm/imagination/pvr_queue.c  |  2 +-
 drivers/gpu/drm/lima/lima_sched.c        |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c  |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
 drivers/gpu/drm/scheduler/sched_main.c   |  4 ++--
 drivers/gpu/drm/v3d/v3d_submit.c         |  2 +-
 include/drm/gpu_scheduler.h              |  4 ++--
 12 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d891ab779ca7..18887128a973 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1286,7 +1286,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	int r;
 
 	for (i = 0; i < p->gang_size; ++i)
-		drm_sched_job_arm(&p->jobs[i]->base);
+		drm_sched_job_arm(&p->jobs[i]->base, -1);
 
 	for (i = 0; i < p->gang_size; ++i) {
 		struct dma_fence *fence;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 717adcedf096..8d75ffa9a097 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -320,7 +320,7 @@ struct dma_fence *amdgpu_job_submit(struct amdgpu_job *job)
 {
 	struct dma_fence *f;
 
-	drm_sched_job_arm(&job->base);
+	drm_sched_job_arm(&job->base, -1);
 	f = dma_fence_get(&job->base.s_fence->finished);
 	amdgpu_job_free_resources(job);
 	drm_sched_entity_push_job(&job->base);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 62dcfdc7894d..98d003757af1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -107,7 +107,7 @@ int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
 	 */
 	mutex_lock(&gpu->sched_lock);
 
-	drm_sched_job_arm(&submit->sched_job);
+	drm_sched_job_arm(&submit->sched_job, -1);
 
 	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
 	ret = xa_alloc_cyclic(&gpu->user_fences, &submit->out_fence_id,
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 5ed9c98fb599..ed7398a0ff21 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1115,7 +1115,7 @@ int pvr_queue_job_init(struct pvr_job *job)
  */
 struct dma_fence *pvr_queue_job_arm(struct pvr_job *job)
 {
-	drm_sched_job_arm(&job->base);
+	drm_sched_job_arm(&job->base, -1);
 
 	return &job->base.s_fence->finished;
 }
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index bbf3f8feab94..cc83b2aab9ce 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -130,7 +130,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
 		return err;
 	}
 
-	drm_sched_job_arm(&task->base);
+	drm_sched_job_arm(&task->base, -1);
 
 	task->num_bos = num_bos;
 	task->vm = lima_vm_get(vm);
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fba78193127d..74c4e1b4df78 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -831,7 +831,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out;
 	}
 
-	drm_sched_job_arm(&submit->base);
+	drm_sched_job_arm(&submit->base, -1);
 
 	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 32fa2e273965..3ff8142b5370 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -309,7 +309,7 @@ nouveau_job_submit(struct nouveau_job *job)
 	list_add(&job->entry, &sched->job.list.head);
 	spin_unlock(&sched->job.list.lock);
 
-	drm_sched_job_arm(&job->base);
+	drm_sched_job_arm(&job->base, -1);
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
 	if (job->sync)
 		done_fence = dma_fence_get(job->done_fence);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a61ef0af9a4e..cc937420cd35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -301,7 +301,7 @@ int panfrost_job_push(struct panfrost_job *job)
 		return ret;
 
 	mutex_lock(&pfdev->sched_lock);
-	drm_sched_job_arm(&job->base);
+	drm_sched_job_arm(&job->base, -1);
 
 	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
 
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..f4669422b3f9 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -525,7 +525,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	return sched_job;
 }
 
-void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
+void drm_sched_entity_select_rq(struct drm_sched_entity *entity, int ring)
 {
 	struct dma_fence *fence;
 	struct drm_gpu_scheduler *sched;
@@ -554,7 +554,14 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 		return;
 
 	spin_lock(&entity->rq_lock);
-	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
+	if(ring >= 0) {
+		if(entity->sched_list[ring] && entity->sched_list[ring]->ready)
+			sched = entity->sched_list[ring];
+		else
+			sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
+	}
+	else
+		sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
 	rq = sched ? sched->sched_rq[entity->priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..356adf510670 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -833,13 +833,13 @@ EXPORT_SYMBOL(drm_sched_job_init);
  *
  * This can only be called if drm_sched_job_init() succeeded.
  */
-void drm_sched_job_arm(struct drm_sched_job *job)
+void drm_sched_job_arm(struct drm_sched_job *job, int ring)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_entity *entity = job->entity;
 
 	BUG_ON(!entity);
-	drm_sched_entity_select_rq(entity);
+	drm_sched_entity_select_rq(entity, ring);
 	sched = entity->rq->sched;
 
 	job->sched = sched;
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 88f63d526b22..d33749017f93 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -211,7 +211,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 static void
 v3d_push_job(struct v3d_job *job)
 {
-	drm_sched_job_arm(&job->base);
+	drm_sched_job_arm(&job->base, -1);
 
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..0eab405a2683 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -553,7 +553,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       u32 credits, void *owner);
-void drm_sched_job_arm(struct drm_sched_job *job);
+void drm_sched_job_arm(struct drm_sched_job *job, int ring);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
@@ -603,7 +603,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
-void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
+void drm_sched_entity_select_rq(struct drm_sched_entity *entity, int ring);
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
-- 
2.25.1

