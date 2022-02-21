Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831BB4BD8C5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F91D112CFE;
	Mon, 21 Feb 2022 09:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E17E112D02;
 Mon, 21 Feb 2022 09:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1PQIxMjyz7sPw15XTOxvlsXRUjlk0+ZLSlQf7CZv5hbwrsbCUp1FbSzyGJX8TggC8acpOv2BKZf+AW5YnXgEIaMzwcy41q7uBvFxz3BAfMTDGigZIEkDwE/1/QrofCA0JMTXZMRnzgvOSJINLjM7WxBBeePGu0zIg7NBEbc/Q53SFC/1VXu6312QlXqMPS9oaiojcJABW4qDzcGJZOSa/q+FmhKVa02NFqbxGW7hb6RAR/mIQ853fKukFDQ8CCAade6K6P4m2gbZRHZ+pU1l5uhj6l6AzAy3nJ3Y+7bLVpk/mbgJ717QGNvbrEoSV787XwxWz6zUAzd54lsE294UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/p5qopzJKGqdSxZUBqkvybCCIDInKSZiw8Hij+4vuI=;
 b=ABvCXrnB3JqsjLknAh897HdfKlf5ZyD0Gwebj29jBtYOG9apnxENI5sPIKlC1/vVen7GuQn1Kyc4dVJHEYYyj1wBGV8ykYTGs7mYiuBs9Td50i8P77rnmPji0qu9gfcjHsVyT32P1+JSCOn9QlahA8ClwNBGHJj7UWxDopIwNWVDWP3pmsJdVMxwfNcONMN3uhZBADAYXrlfu3mVywAflcH09xUQDVzcuKEWPDqu+5Ze8dXQIxzrbRB6Dho0VogZzF+5jTHnjjlyHF3qS2zRSM6uJEeDuUShhpcHSyrXYQoWmEta9ZM0YblUOo+K/lbqZAmnBERnu21RlDo0V6WUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/p5qopzJKGqdSxZUBqkvybCCIDInKSZiw8Hij+4vuI=;
 b=SkWI5COnxWKmnvy+c04Pt3Cb2/tu5u1UuVzALXB3hMNvbW1q9BZeQswKY8qVzE0q8sVdJ18dQ8ypXyBpWya2f7qQ9hazSJ5lW0m/4BhUjCY3ne4H8/4OYXoNRLz/nOmdhFzpTTtCttwoxLAeDXiMeBkRhTUVQrJam357wb05u4o=
Received: from MWHPR12CA0025.namprd12.prod.outlook.com (2603:10b6:301:2::11)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 09:57:52 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::4c) by MWHPR12CA0025.outlook.office365.com
 (2603:10b6:301:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Mon, 21 Feb 2022 09:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Mon, 21 Feb 2022 09:57:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 03:57:50 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 01:57:50 -0800
Received: from willgu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Mon, 21 Feb 2022 03:57:48 -0600
From: Jiawei Gu <Jiawei.Gu@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <Christian.Koenig@amd.com>, <Andrey.Grodzovsky@amd.com>, <Monk.Liu@amd.com>,
 <Emily.Deng@amd.com>, <Horace.Chen@amd.com>
Subject: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Date: Mon, 21 Feb 2022 17:57:05 +0800
Message-ID: <20220221095705.5290-1-Jiawei.Gu@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44921480-4ef7-4e82-1cc6-08d9f5209ff8
X-MS-TrafficTypeDiagnostic: MW5PR12MB5652:EE_
X-Microsoft-Antispam-PRVS: <MW5PR12MB56528C1B0D2817D58F5BC8B0F83A9@MW5PR12MB5652.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SDCvNaLw/fUY+V9wg6wa0vF8Y6Ay1JbHrsOuvRKLfwNmAkdIqA5VYxFZ2UmFwOWESW/AyZIw4KKQh+lIpTmLqvcRwAUfglZFmkr5rvrk1HaKSDEolRWdY1EURlQ2nHtA+RTxbAlXK1Q+cqB1Qq5IujfKFM7gqJvtbbwp6pqjT482sp2U/qa9C0U2gh+rHpFwmv9FpTgC1VBU48fbyhYeec+6yfJHUCOo1jL8LnabxS4Cm6zXO/8or+g74auyrYX7wOCLUqjwolyy14NeAGaW+xqc5NeeCaKZTE0qJftzKESWxO/Buv+Qr+MwhRapuNUJIfkpF6QCuuiOPQF4egGy01yPcz094M4f6hjNqAnp2Qe9icjwydXiyqe7GmA2wlSEf9y3mOe37O57LLSbbGs+tWd768d0nyUMjLfIfIR/jLZcZOuIf7/NhS3naGGygD11tLyB6zNvHVESKq63oVHLLZgxc1dJV0ccdaMLXOcf559oaLij3qoq+B9PdI2GQM1rVfZMarpWKofcD6jwY0Gx/S8kr9B+jWiyAt1j5dJF6cDWxHYCpvg+t9Cfv/kNUPVZNPZVxvaEEZgq73Rj9mz+dAKtmdute+J6k6K1Q9CGqENSsYN/vXXH6H/y8KlyGrkhx3R9JlMRZHjP5h/Em6iT5qcsBkvT29fVXUXRzKEXtFmpQxFbPRxJ90RjEg/EHt0aUOxB/HCb2S4h/c+J4v8vA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(83380400001)(110136005)(2906002)(6636002)(47076005)(426003)(36756003)(316002)(7696005)(186003)(508600001)(336012)(40460700003)(6666004)(8936002)(450100002)(26005)(8676002)(4326008)(1076003)(70586007)(70206006)(356005)(82310400004)(86362001)(81166007)(5660300002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 09:57:51.9357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44921480-4ef7-4e82-1cc6-08d9f5209ff8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652
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
 drivers/gpu/drm/panfrost/panfrost_job.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c    |  9 +++++----
 drivers/gpu/drm/v3d/v3d_sched.c           | 10 +++++-----
 include/drm/gpu_scheduler.h               |  3 ++-
 7 files changed, 16 insertions(+), 14 deletions(-)

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
index e0cb7d0697a7..080710fd8eb7 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -391,7 +391,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin");
+			     NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
 		return ret;
@@ -401,7 +401,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_render");
+			     NULL, "v3d_render", &(v3d_to_pdev(v3d)->dev));
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
 			ret);
@@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu");
+			     NULL, "v3d_tfu", &(v3d_to_pdev(v3d)->dev));
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
 			ret);
@@ -426,7 +426,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd");
+				     NULL, "v3d_csd", &(v3d_to_pdev(v3d)->dev));
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
 				ret);
@@ -438,7 +438,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean");
+				     NULL, "v3d_cache_clean", &(v3d_to_pdev(v3d)->dev));
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

