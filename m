Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397192BBD38
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E74A6E97D;
	Sat, 21 Nov 2020 05:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C016E971;
 Sat, 21 Nov 2020 05:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfGHmguGzJcPHrWqXe2LM7qU11+B1Gn0l82GUrEvLJjeFieq1tt9EkZFGKL7J8/D5Z14Ot7i1hwTZ8+aa2c2obbmTq+H8KSB3hgnDmZp48hUHh/slpDyx8ntx6Rde1QZGOJDCYdVSAJbJN0qsDWsWwlzwqbXlvGcUM9SrxfKj0Q6mHR3q47WxO4PXjjtkjE3ZeO01n3e4Kt0q4WADsR7ddwpgMlgzPQl8EflwRdgdAYpCOEyPdQemSk2DXxiu7nwTdKkmeZtM37MSEmjm2qNuTB46zERezXnYIi3+6vOilumFBokXjOeUejC40XDuJoz0wFnb25McI7dXNaMc70Ltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HtQgivQv3sdKp3khI2iAdsl9Bv7A9yFoV5IOj4Sjeo=;
 b=dAbJBC2u1LtrN55vjuzoZ+hDUInx2lW7eCNOhrUvhqyLo91HDYYb6+qf5MV7Jq1h3cCnCn91/EaZk7YZW/cWBlW9c4rco5Uj/KbAJklLGDpGclr2k/krutqySlM/eRcWYErBbflEvnkWRoQoezuuM4k8BmlRjkwaHlKf/BQMYXqDvq08FH/VbSbmVMimmvSA3GsiiHz54PFiR6UbgxFYKPi0dg/b9DxIgQ2bxsA9Uisr7JOjBzBsvcIdGEk4ErCcP6HbD4jHvXDJa9AOqg6I647+m4B3rGT3Rq3stHUOEe7IMaHZGcwKrbFvpeyC4OZcSXG9AEt5FI/7mqzs9eFWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HtQgivQv3sdKp3khI2iAdsl9Bv7A9yFoV5IOj4Sjeo=;
 b=TgT7i/L4EfQKe3Kl07YJHRlCAZZVWYHbnxEVWgsHgJCVVg09vqH2mGysJ7OmWd/2Yd3pZq+b63XWebviAIjTbssuipIWZy5p0LIuE3LcM7vyMZnTbKrKdbkaW30yv8mp+hSJuBCcVEzPOQ1a1rkyGODUVAhLORcpJu1foJYL6EI=
Received: from DM5PR08CA0031.namprd08.prod.outlook.com (2603:10b6:4:60::20) by
 BY5PR12MB3969.namprd12.prod.outlook.com (2603:10b6:a03:195::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Sat, 21 Nov
 2020 05:21:41 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::79) by DM5PR08CA0031.outlook.office365.com
 (2603:10b6:4:60::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:39 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:39 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:38 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 07/12] drm/sched: Prevent any job recoveries after device
 is unplugged.
Date: Sat, 21 Nov 2020 00:21:17 -0500
Message-ID: <1605936082-3099-8-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acc0439d-da50-4849-4d8a-08d88ddd5370
X-MS-TrafficTypeDiagnostic: BY5PR12MB3969:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3969B1C6DDA7F87AF7235FCCEAFE0@BY5PR12MB3969.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hgRiH3TX1e4h4DS/W9NX6vMXLxP/KFi8ByblzsqzUHq6GzwhhF9N4cFRadsyjN4jmbsVtfWOEOOyQqdRaEZ8hmQ7H8LLNuDFXV2kwXz5UzQC7GQ5FQMCfBZvQWT7w+eq26+aVvQ76jzaS5G2Oo4MO57Y0yqq2NlDKYaPMxYiMkSbyY4OeL60JuY62ReBtd5iqNgpb/ARz7pVYVRp09suD11poVqCuA1PjWC0ig2OiQOEP6eIYtBxCC6zKHUtMyAIR4MGretgawoJnHqP7KGenbdlUJoAyAiHJCyeXMW4lIE06fViyjJJxe8vZfrqyVStjAdgvIsOX9tIbt81LSgi2AmdZPnrlznlVdirjTXWy+gbd1Yod5K+N947BRbll6MY0iYRtlmzODgfAPt62/gM/Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(356005)(2906002)(8936002)(47076004)(82310400003)(81166007)(86362001)(7696005)(4326008)(8676002)(82740400003)(83380400001)(5660300002)(478600001)(36756003)(2616005)(44832011)(186003)(26005)(110136005)(54906003)(426003)(70586007)(70206006)(336012)(316002)(6666004)(7416002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:39.9133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acc0439d-da50-4849-4d8a-08d88ddd5370
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3969
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No point to try recovery if device is gone, it's meaningless.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  3 ++-
 drivers/gpu/drm/lima/lima_sched.c         |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_job.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c    | 15 ++++++++++++++-
 drivers/gpu/drm/v3d/v3d_sched.c           | 15 ++++++++++-----
 include/drm/gpu_scheduler.h               |  6 +++++-
 7 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index d56f402..d0b0021 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -487,7 +487,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 
 		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
 				   num_hw_submission, amdgpu_job_hang_limit,
-				   timeout, ring->name);
+				   timeout, ring->name, &adev->ddev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
 				  ring->name);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index cd46c88..7678287 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -185,7 +185,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
-			     msecs_to_jiffies(500), dev_name(gpu->dev));
+			     msecs_to_jiffies(500), dev_name(gpu->dev),
+			     gpu->drm);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index dc6df9e..8a7e5d7ca 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -505,7 +505,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
 			      lima_job_hang_limit, msecs_to_jiffies(timeout),
-			      name);
+			      name,
+			      pipe->ldev->ddev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 30e7b71..37b03b01 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -520,7 +520,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		ret = drm_sched_init(&js->queue[j].sched,
 				     &panfrost_sched_ops,
 				     1, 0, msecs_to_jiffies(500),
-				     "pan_js");
+				     "pan_js", pfdev->ddev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c3f0bd0..95db8c6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -53,6 +53,7 @@
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/spsc_queue.h>
+#include <drm/drm_drv.h>
 
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
@@ -283,8 +284,16 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
 
+	int idx;
+
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
+	if (!drm_dev_enter(sched->ddev, &idx)) {
+		DRM_INFO("%s - device unplugged skipping recovery on scheduler:%s",
+			 __func__, sched->name);
+		return;
+	}
+
 	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->ring_mirror_list,
@@ -316,6 +325,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	spin_lock(&sched->job_list_lock);
 	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
+
+	drm_dev_exit(idx);
 }
 
  /**
@@ -845,7 +856,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   unsigned hw_submission,
 		   unsigned hang_limit,
 		   long timeout,
-		   const char *name)
+		   const char *name,
+		   struct drm_device *ddev)
 {
 	int i, ret;
 	sched->ops = ops;
@@ -853,6 +865,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->name = name;
 	sched->timeout = timeout;
 	sched->hang_limit = hang_limit;
+	sched->ddev = ddev;
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 0747614..f5076e5 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -401,7 +401,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     "v3d_bin");
+			     "v3d_bin",
+			     &v3d->drm);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
 		return ret;
@@ -411,7 +412,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     "v3d_render");
+			     "v3d_render",
+			     &v3d->drm);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
 			ret);
@@ -423,7 +425,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     "v3d_tfu");
+			     "v3d_tfu",
+			     &v3d->drm);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
 			ret);
@@ -436,7 +439,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms),
-				     "v3d_csd");
+				     "v3d_csd",
+				     &v3d->drm);
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
 				ret);
@@ -448,7 +452,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms),
-				     "v3d_cache_clean");
+				     "v3d_cache_clean",
+				     &v3d->drm);
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
 				ret);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9243655..a980709 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -32,6 +32,7 @@
 
 struct drm_gpu_scheduler;
 struct drm_sched_rq;
+struct drm_device;
 
 /* These are often used as an (initial) index
  * to an array, and as such should start at 0.
@@ -267,6 +268,7 @@ struct drm_sched_backend_ops {
  * @score: score to help loadbalancer pick a idle sched
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
+ * @ddev: Pointer to drm device of this scheduler.
  *
  * One scheduler is implemented for each hardware ring.
  */
@@ -288,12 +290,14 @@ struct drm_gpu_scheduler {
 	atomic_t                        score;
 	bool				ready;
 	bool				free_guilty;
+	struct drm_device		*ddev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   uint32_t hw_submission, unsigned hang_limit, long timeout,
-		   const char *name);
+		   const char *name,
+		   struct drm_device *ddev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
