Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2ED4BF5D2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 11:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C3710E5E1;
	Tue, 22 Feb 2022 10:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC5A10E5E1;
 Tue, 22 Feb 2022 10:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTyN36214qKTtHPGOlXn3NX6geNk8bUIzIW/nhu9rZOcv6+UlFWwT11/mc5oZpPww9YPV3UWx/DP6ZHwt+Y+LFjXe/0hFDHPXLXs9EOV0WsReDYeWGbFEJC9D+G5S6uBpbqCqNogCb7byK0QydhnZ0H2M4+019EDWQ4QB23WEG4CFjbJyZeuNbsmjUTtsInLtmUCWExAGlZuCncSbWc0gDChL9vdu1tHGMnqz/Io1cjqqTp9iAbsVy879NNemhVuucVpji2TWXHLMIYHHIE+K2zcLXHG5yw4TjLaGj7t/lQJUE2KkUpvFpF21+OEOylSlIpLUmuxrAW1eXHAmkqV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=089rgDUCTiovU58VcoAxKw+5HSfXVY7rBo0RQmXAVEg=;
 b=ddA88hGnA8UP3c6jXRWfswKITnhmLOtwcHEaPsou8DuS5toPrIe2CbquSn6WgrdzPnAZ+9KX92RxGQRs5eK9M97MS5raWES0XPjHd63s7V1iH2k5GMTG0aE+drRkcoZwqiz6JPTcD7pVTa2i/TNBjeNN9ePJvoW3NrFNFTdFXMo7pvBKsEg+Dc6MVAeWM9LO3H77RZ6s0b876zgDKbT2lNUVkRuR99lJ+kpVKi5PuylB4AwVvy0N5vou9Huu4JG5wO1e4CUPr8N32lV++XMABXuvEbd9nNOQUe7o4Bg0F6PgRMClIfXfuutCItg7D3kBE9+RrhZQtHw+XhMdWUwdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=089rgDUCTiovU58VcoAxKw+5HSfXVY7rBo0RQmXAVEg=;
 b=tuY8Pn//aucBe1bpeQzOxTBMsq9JyL01Y80i4atauYlxOHGJNG8tey1xnG++MNMuU2hPe2BKjgInU/Rzjy+I9QNEqi9lwM9COcS/pt6+4ZnOLTzeFEuTnsu8SL2wQNrcCya79YuiFOhR+BASbHt5UMDD/Zyme0sOKDmjMpeGPg8=
Received: from BN8PR07CA0013.namprd07.prod.outlook.com (2603:10b6:408:ac::26)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Tue, 22 Feb
 2022 10:29:53 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::9c) by BN8PR07CA0013.outlook.office365.com
 (2603:10b6:408:ac::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Tue, 22 Feb 2022 10:29:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 10:29:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 04:29:52 -0600
Received: from willgu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 22 Feb 2022 04:29:50 -0600
From: Jiawei Gu <Jiawei.Gu@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <Christian.Koenig@amd.com>, <Andrey.Grodzovsky@amd.com>, <Monk.Liu@amd.com>,
 <Emily.Deng@amd.com>, <Horace.Chen@amd.com>
Subject: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Date: Tue, 22 Feb 2022 18:29:34 +0800
Message-ID: <20220222102934.24086-1-Jiawei.Gu@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 953f6147-d515-47f0-2e35-08d9f5ee435c
X-MS-TrafficTypeDiagnostic: DM4PR12MB5722:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5722DEE238BB5FAFAB0F157AF83B9@DM4PR12MB5722.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SdakhEgOoE1alie1400V73dODuW/dEF2DCnU6wqoH6ZPg8rDpd7Bs2MDq4ZCsFrICq5/RbbLwN1cyD1jxMBYj50PsFsMqtef+mshGQlz7kbDGhZsYo4i03j5h09pLbnFtE75n2PxXIgwaDCOSV0ptlDGP4AwCH9Al+i0YptsEDYPEDGetnumNNzbrU4LWXjjIqKGVW9sO6p6L325VxEZeR/KWchCOw9SDbTZTvzGGun0WgGZS3TumQRMjOa05bwBmKBmD06WlLUtENNAw1P6LQbUosgheq1Eb3/j3TqhH0npKnW49CTca0t1pRB+Y953ONfjXas9eME8jd6qpLDeRXjW8zLlaWPqZOzdJT8Ky1rMoY64ls1DUeEF3/SNr3ticjc7+BbvX5tXMLnLh/RQ3913F7xBHNEbC5+4Ac6l6mj6D3Q9FIhq194o8usnvCj/1H2U9yVRq10vygE/PwpmQXieDMwN1aPrIDXBjORPAXCN8S364CWLtiYznSN0o/gSRe7NV6EnDBtcJsIp2zw36C3rYOW43DsE8suL+5JGx8uuG8aeNkcsQZUgjhRCXif3fNfOSBANjEfeJoco5v1hGm51V28y3MM27IBJVja9t+Gz3cFcYLZkIvHxfDOgQ7hlySfMY+uLls5HF8oYbKMMQ4TJfIQVHHymuzREdVWZ0h+7OYgQNO/DyFY2agbOWuUqf89XOgpIw38B33z78bWcGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(7696005)(47076005)(1076003)(426003)(186003)(2616005)(336012)(26005)(83380400001)(2906002)(5660300002)(8936002)(82310400004)(6666004)(8676002)(508600001)(70206006)(70586007)(450100002)(6636002)(110136005)(4326008)(316002)(86362001)(81166007)(356005)(40460700003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 10:29:53.0147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953f6147-d515-47f0-2e35-08d9f5ee435c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device pointer so scheduler's printing can use
DRM_DEV_ERROR() instead, which makes life easier under multiple GPU
scenario.

v2: amend all calls of drm_sched_init()
v3: fill dev pointer for all drm_sched_init() calls

Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  2 +-
 drivers/gpu/drm/lima/lima_sched.c         |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c    |  9 +++++----
 drivers/gpu/drm/v3d/v3d_sched.c           | 10 +++++-----
 include/drm/gpu_scheduler.h               |  3 ++-
 8 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 45977a72b5dd..cd2d594d4ffc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -502,7 +502,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 
 	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
 			   num_hw_submission, amdgpu_job_hang_limit,
-			   timeout, NULL, sched_score, ring->name);
+			   timeout, NULL, sched_score, ring->name, adev->dev);
 	if (r) {
 		DRM_ERROR("Failed to create scheduler on ring %s.\n",
 			  ring->name);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 58f593b278c1..35e5ef7dbdcc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -195,7 +195,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev));
+			     dev_name(gpu->dev), gpu->dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 5612d73f238f..8d517c8880e3 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -490,7 +490,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name);
+			      NULL, name, pipe->ldev->dev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 3bbf574c3bdc..367a6aaa3a20 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -89,7 +89,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
 			num_hw_submissions, 0, sched_timeout,
-			NULL, NULL, to_msm_bo(ring->bo)->name);
+			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 908d79520853..a6925dbb6224 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -812,7 +812,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
-				     NULL, "pan_js");
+				     NULL, "pan_js", pfdev->dev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f91fb31ab7a7..b81fceb0b8a2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -491,7 +491,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			if (r == -ENOENT)
 				drm_sched_job_done(s_job);
 			else if (r)
-				DRM_ERROR("fence add callback failed (%d)\n",
+				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 		} else
 			drm_sched_job_done(s_job);
@@ -957,7 +957,7 @@ static int drm_sched_main(void *param)
 			if (r == -ENOENT)
 				drm_sched_job_done(sched_job);
 			else if (r)
-				DRM_ERROR("fence add callback failed (%d)\n",
+				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 			dma_fence_put(fence);
 		} else {
@@ -991,7 +991,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name)
+		   atomic_t *score, const char *name, struct device *dev)
 {
 	int i, ret;
 	sched->ops = ops;
@@ -1001,6 +1001,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->timeout_wq = timeout_wq ? : system_wq;
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
+	sched->dev = dev;
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
@@ -1018,7 +1019,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (IS_ERR(sched->thread)) {
 		ret = PTR_ERR(sched->thread);
 		sched->thread = NULL;
-		DRM_ERROR("Failed to create scheduler for %s.\n", name);
+		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index e0cb7d0697a7..39459ae96f30 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -391,7 +391,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin");
+			     NULL, "v3d_bin", v3d->drm.dev);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
 		return ret;
@@ -401,7 +401,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_render");
+			     NULL, "v3d_render", v3d->drm.dev);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
 			ret);
@@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu");
+			     NULL, "v3d_tfu", v3d->drm.dev);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
 			ret);
@@ -426,7 +426,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd");
+				     NULL, "v3d_csd", v3d->drm.dev);
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
 				ret);
@@ -438,7 +438,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean");
+				     NULL, "v3d_cache_clean", v3d->drm.dev);
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
 				ret);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index bbc22fad8d80..944f83ef9f2e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -457,13 +457,14 @@ struct drm_gpu_scheduler {
 	atomic_t                        _score;
 	bool				ready;
 	bool				free_guilty;
+	struct device			*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name);
+		   atomic_t *score, const char *name, struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.17.1

