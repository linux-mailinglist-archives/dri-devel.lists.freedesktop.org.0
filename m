Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965364B9D6C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2FE10EBC0;
	Thu, 17 Feb 2022 10:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2401110E95C;
 Thu, 17 Feb 2022 10:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8Oh9LmD5uV1Ronc1EauJK13CPGOQWlE17PzVf40n5HILvLh3sFK83vEuOYy72Vbu1narbsewrG5tPge58XMkymdCJoUlR7I2Ud3rh+uXwphNQksOISHLuw+DzvBzgjI7QNJUL8YVAKfIoq6+6/WigbUAh6rF1S9mSsbvuLHYfL/WE4tZI3zTQvITDFZF6TLEko8hOxvilwHjVnW9InV85XC01qMPNNC/6JphUeQ/T/FXSqc4TiLHiILFToVBIOw9REZ3rBm9Urd0zvjDF/tPpw6/vxiBY6HwPZiCB4CardddhA4/Uwsc51yxkyocJ6tt1GT1ZqwpBllNQFeTeatpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0c51CkAFJdka9VkxLGD+QIh9TTX9Z8GTWkf08iAJ8eI=;
 b=L6wSMyK4hWS3nhLPvP332gFMxteKM3CyXHvyECu69ojrUMTJ6ocHOZZ1TPu/Doe/v0ZJ6OZoPKeJ8JFBUy7MgYVUxWuokParR6Ddy97N1A6ah8pW2fSOMfe8oj28LApQkDx+LXrCwd8IgbaxnH5Ku47SyYUeWXF25yXYk8w9IHAAMb8FHO/dlgofrdFziarGlnqaYX3CEyILcUrp3nERj11xI2BlsjprnC5iUdV28fKeQuBCLm+HXdftJYyYZMBmsk99zgiCo/8N6RY4m3VLyOsQpB/sNUNaanw6jKFd4c6s4P1+lK5vToCfcs9Gk26fdHi39ppQImAQoDQhzq6SHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0c51CkAFJdka9VkxLGD+QIh9TTX9Z8GTWkf08iAJ8eI=;
 b=DaI4S3cvAzjggpsj/UhXFIEv1xMNC7BylrJgYL/p2DSKTm40hpWrRwbjQ+JXoGuA14L0fs9PyG/kB5SPJFIMJdBuamna9jVDbS9e0dgfF5emKvCwzz+iwNiP79B5QhhQ8iB27pqeZIdHm/gYLRwSsHghB3/jfuLJ4CD8sGBYYmI=
Received: from MW2PR2101CA0017.namprd21.prod.outlook.com (2603:10b6:302:1::30)
 by BN9PR12MB5100.namprd12.prod.outlook.com (2603:10b6:408:119::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 10:44:04 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::f9) by MW2PR2101CA0017.outlook.office365.com
 (2603:10b6:302:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.10 via Frontend
 Transport; Thu, 17 Feb 2022 10:44:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Thu, 17 Feb 2022 10:44:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 04:44:00 -0600
Received: from willgu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Thu, 17 Feb 2022 04:43:58 -0600
From: Jiawei Gu <Jiawei.Gu@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <Christian.Koenig@amd.com>, <Andrey.Grodzovsky@amd.com>, <Monk.Liu@amd.com>,
 <Emily.Deng@amd.com>, <Horace.Chen@amd.com>
Subject: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Date: Thu, 17 Feb 2022 18:43:31 +0800
Message-ID: <20220217104331.6455-1-Jiawei.Gu@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15fca83-c93c-4f96-fa32-08d9f2026a07
X-MS-TrafficTypeDiagnostic: BN9PR12MB5100:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB51008E4ED6C6E8E427061806F8369@BN9PR12MB5100.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:87;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TuSg4YNSDxF6UiaxvEobGG0kxecK5++3o1QhJhfDYgq/B6j5SFZuPFpegCkRwyLGoAWr6rFc5usWGThR8NX/89DTiWKkesv1ioF4i4qQeBSMNtYM76Y7l1G469BFRNO2WpeOP0hoTXvIIUwlYONlr5P0TnL/cHSgAyw7tbBEovpncnDDVoleNCKkoveaGJskwO8gB8mQwKRUndRosg5bHdQ92HXyq0Xoa93h3+uSIQFSWO+nIJ4RqVdQ+CSQtwIfIZ12lbjEXk8JYU0lSjBG/pN1kM8zQV3okd8aIwS23AzVMMV46o+sY1K11F1QUc+ycXW5nxqeX7KoS2Z9eOfQiLGNHORS1X7DCYjME8nph3pH5m6UTmEgrtLerDFFSHSL9OaJdeSWWTWyP+lo+mZcUP418c3PkUsTmAgzKpCmBqGRVhdhKN0b+WC3+A+zXOrOZKf+LeXFRbeJ9VRZQsesrvhfyXul4XdE6gQ0UUfpyyWmIjDc1mj3aFHFPl2OHWdlGdu+11OCNPk47u3NLHyrYPixzAgGyLhaUrRlcYdFrT81h+Ys70zTjQ1Z0KVXYwXJ+sZ9yvTZ6orQ5+jZXybvNE+Nerw9e/SSzXQ9m+H1Dmksjetfyhp/gVTQsq/YZejil1DdLXUdkH+FrwNgB3OHRNVAQMkwKyzKuxjKB5nIdBu+vr3w3eaySJfNxWw+127K00P9YPG02WRzfDHKZ9VLXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(47076005)(7696005)(110136005)(8936002)(6666004)(81166007)(8676002)(36860700001)(4326008)(450100002)(70586007)(70206006)(356005)(82310400004)(86362001)(2616005)(2906002)(40460700003)(426003)(336012)(316002)(508600001)(1076003)(186003)(83380400001)(5660300002)(26005)(6636002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 10:44:03.0524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b15fca83-c93c-4f96-fa32-08d9f2026a07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5100
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

Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  2 +-
 drivers/gpu/drm/lima/lima_sched.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c    |  9 +++++----
 drivers/gpu/drm/v3d/v3d_sched.c           | 10 +++++-----
 include/drm/gpu_scheduler.h               |  3 ++-
 7 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 4787cb3acaed..98217b1487fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -508,7 +508,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 
 	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
 			   num_hw_submission, amdgpu_job_hang_limit,
-			   timeout, sched_score, ring->name);
+			   timeout, sched_score, ring->name, adev->dev);
 	if (r) {
 		DRM_ERROR("Failed to create scheduler on ring %s.\n",
 			  ring->name);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 19826e504efc..4240f2ae0ab3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -190,7 +190,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
-			     msecs_to_jiffies(500), NULL, dev_name(gpu->dev));
+			     msecs_to_jiffies(500), NULL, dev_name(gpu->dev), NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index ecf3267334ff..4b3a43a2b3e3 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -509,7 +509,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
 			      lima_job_hang_limit, msecs_to_jiffies(timeout),
-			      NULL, name);
+			      NULL, name, NULL);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 2df3e999a38d..215709d61315 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -627,7 +627,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		ret = drm_sched_init(&js->queue[j].sched,
 				     &panfrost_sched_ops,
 				     1, 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
-				     NULL, "pan_js");
+				     NULL, "pan_js", NULL);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3e0bbc797eaa..4404af323321 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -489,7 +489,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			if (r == -ENOENT)
 				drm_sched_job_done(s_job);
 			else if (r)
-				DRM_ERROR("fence add callback failed (%d)\n",
+				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 		} else
 			drm_sched_job_done(s_job);
@@ -815,7 +815,7 @@ static int drm_sched_main(void *param)
 			if (r == -ENOENT)
 				drm_sched_job_done(sched_job);
 			else if (r)
-				DRM_ERROR("fence add callback failed (%d)\n",
+				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 			dma_fence_put(fence);
 		} else {
@@ -846,7 +846,7 @@ static int drm_sched_main(void *param)
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   unsigned hw_submission, unsigned hang_limit, long timeout,
-		   atomic_t *score, const char *name)
+		   atomic_t *score, const char *name, struct device *dev)
 {
 	int i, ret;
 	sched->ops = ops;
@@ -855,6 +855,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->timeout = timeout;
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
+	sched->dev = dev;
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
@@ -872,7 +873,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (IS_ERR(sched->thread)) {
 		ret = PTR_ERR(sched->thread);
 		sched->thread = NULL;
-		DRM_ERROR("Failed to create scheduler for %s.\n", name);
+		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 8992480c88fa..6d68b155c3cc 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -403,7 +403,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     NULL, "v3d_bin");
+			     NULL, "v3d_bin", NULL);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
 		return ret;
@@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     NULL, "v3d_render");
+			     NULL, "v3d_render", NULL);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
 			ret);
@@ -425,7 +425,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     NULL, "v3d_tfu");
+			     NULL, "v3d_tfu", NULL);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
 			ret);
@@ -438,7 +438,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms),
-				     NULL, "v3d_csd");
+				     NULL, "v3d_csd", NULL);
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
 				ret);
@@ -450,7 +450,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms),
-				     NULL, "v3d_cache_clean");
+				     NULL, "v3d_cache_clean", NULL);
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
 				ret);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d18af49fd009..38a479879fdb 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -302,12 +302,13 @@ struct drm_gpu_scheduler {
 	atomic_t                        _score;
 	bool				ready;
 	bool				free_guilty;
+	struct device			*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   uint32_t hw_submission, unsigned hang_limit, long timeout,
-		   atomic_t *score, const char *name);
+		   atomic_t *score, const char *name, struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.17.1

