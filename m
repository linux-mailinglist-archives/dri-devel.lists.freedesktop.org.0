Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42A28FE727
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C743D10E04D;
	Thu,  6 Jun 2024 13:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B/PQEmOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1765610E04D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:08:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3MrywoSYEtPzVLkONxo8k4y+WQNCrC6/AitTTh6NQ+NipIZ6a4f5pYw5Uk62fmj/HWDbpsdTZtH8wHG1TiKlDPTYTmpKnNT0UsRrrzgWkTRMOB5IUCZ2pR6XsvQ5DMqw4r5vrggghiibwxhxWVXtjmFtUygwd+3x85gTY0YB6pNzD2nJ3m7gUcGcAYzO2Xvu0/B+8NZXXspkFX1LqCSrQzmLQquJNoiOf0hL80jIrLQuSclJ3zdoFyWKCgPuUDbjiDy1j5QmvX/HVbDmFV9U/OQckNd35zN27YtQVjKs576sCFcZO89wBUwI4G3E03VhLq1e9mZ1/o/MdFf9TgyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeVw3heQwJbmFhudJXIL3VBl2U30QID1ZAMUAJy0AWM=;
 b=QpQFlyrABV2Ok0l3hNh3I3Av71UoFdVpcJfBlraOwCq16U14nH+bvl0bdhqNTcsX5G6LRB6OdWjFokGJSPz+POY7k6RUxfkTg6n3TxqqcJLc/uAfnc/Xk4BdynOppydAJ1fgzRl0x087OJbBexRKO8IHBPLJ1C0r7UilYZ3l0mO+Po702NgsTXhPAJLuh53yZAI2uj8O1kxLONbvAMPqtxOuAg5NW3fYV8mOVscTNu0wLKebq8EGc/xi2t+RikcCHay360Engeu1GiMkhFsUFitXdvtATW+KRifONiPf7Ix/IR24xQzLJQs3ClZxYAN/DdM6KWxvoaHm/yP2fKlfZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeVw3heQwJbmFhudJXIL3VBl2U30QID1ZAMUAJy0AWM=;
 b=B/PQEmOUJ45syoMFxPKYaAgXD/X1OpCdQBrzGxHk31njhwjfoeCQQPZPDPog2ATs6ms+hNlIG9SXfkNpBgWodz6kGTt5fUjUDtsCDMZjCKkF9I8uTW0yd/cQGw72amEQ0FvSts0lQtyuwoEyaW0FNr4Rt0zqnHj31Y2lyJk7OU8=
Received: from MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::10)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 6 Jun
 2024 13:07:55 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::73) by MW4P223CA0005.outlook.office365.com
 (2603:10b6:303:80::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Thu, 6 Jun 2024 13:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 13:07:55 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 08:07:51 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 1/4] drm/sched: store the drm_device instead of the device
Date: Thu, 6 Jun 2024 15:06:22 +0200
Message-ID: <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6bd971-ecca-4a36-77c3-08dc8629ae68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005|7416005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i87k2Jrnn59w47qHKEzfA9VfBmhC/3pBXJkJDVwVr+Um960OAc6Cky0NoHX+?=
 =?us-ascii?Q?ZKkDfnGCKPY4OKAyFN+Aa/1y4s5OEjmEv7/CF5t163nG7+1wcgZdJ57oE8mC?=
 =?us-ascii?Q?qllzuIWMedHSj2rOOK+lhmq6ndj3icFkWAqGWdcd3NS7GeDJheNHMsu6GUNA?=
 =?us-ascii?Q?IUlSgLv0TQKvZK3M+kXzXn4e4ZOlO0TaeisrlR3UmXTPm354BeGAXRyO6cvU?=
 =?us-ascii?Q?MUKR8eDOn+f1zfH6kA0H3JGiXhkYBf7yO7cq/KgM/7wcGMbbfJ9bba24Ybzf?=
 =?us-ascii?Q?Thz/QUksIHLmX1rnJcgHOFwD0KNd4cinAec5NJmV5VIKQAGP6yM5X0+/cvIG?=
 =?us-ascii?Q?XHBtXydsQnewQhDg0GvtJU0dHp5z1nTTN033kZFkrTzfEk7U3/xMfNsNOIID?=
 =?us-ascii?Q?nKBnEBrnbsZWxbvfJSTxK2MPDSBdztAIdpWcvTy4IrHpUVdIGuT/eb6ZuPxn?=
 =?us-ascii?Q?EHK5veFkRpmsDL/eBCmbSH9RhFNn9wdAI/FMsmbR1jXFsoQ6Eo6vtoW/cnXn?=
 =?us-ascii?Q?q/8BV7jz7pBxjf8v8qrQOKSw78Ae9yGkpS10AKVRRzmd0Ji4sfs62NOLKtOW?=
 =?us-ascii?Q?wh902GMarDf80wPosO4TJP3NWmUs3U0TLMbZwdw1RvGqkvq6aPEX64gAVFo1?=
 =?us-ascii?Q?A+5XwgmcfqFhKlqqLxJdub13LKMYaNDnzFfMPf3z/btI2F3NtJuqZo/ISShd?=
 =?us-ascii?Q?6kyZPber6+/rydKbg7sU6v10TFJKlactKuKDa3iAX7/tuQL2c5l0A4BePFFM?=
 =?us-ascii?Q?7P/wNJ35aXB3HrWSt2Gmwr4cuOdAz9liUyKed78ryio/hVdiQqVuegzqn+8L?=
 =?us-ascii?Q?sbK36nPaJ+fhLcyX3n53jE/oiUSi8Z/RxufG1ey6DbY2JWLQRltVX9Etg4jB?=
 =?us-ascii?Q?92qGqNqeAVGGKf5m2/vQi+q+E6Cx130faPXUAiNrnky0LW5YFYvwmPdWhlcq?=
 =?us-ascii?Q?uN7zm85SGR9IpoORV0MEyGJlF4JNSo5RC7VcLIeI2kKatO/5uXqfKfI17m5Q?=
 =?us-ascii?Q?5Om5Ts/zpjeJINguxEBmzQyKMVfc7qFo9JhINsKSOOp/zdpN6G/kRKoNdiRw?=
 =?us-ascii?Q?dIweEBxGUqwhQFF1Dl9bvJtoaOTnp4bA/RznuhVWl1vSuK4D0BatSRFDbdyr?=
 =?us-ascii?Q?yr0Aq2+cqjZUdqkmmfPfqIObWsXxOFmTEddjcuViUZ3jcfTXazdgGCj44mYi?=
 =?us-ascii?Q?dy1P3w1BsYuEkycoy249xS2PJ94qmLUBObAgUMku8B23fsEZQGTo9J/b9MY2?=
 =?us-ascii?Q?6IZlLAnvMcs1mPE9xtw2urF8Q1ncDIt1DwZ8qbgwKDw5BezH5JaWV8u74Aqh?=
 =?us-ascii?Q?rhS7WoiMcgpIwtgo+EvowXvr8kHB4FVe/jhsbeZQ/pTTTeiHTyFQavnZX0gF?=
 =?us-ascii?Q?M0PGHXF6y7oh5g0IP23L/8LmDd3f5jCEWK9Vnyya6jXwGvctL4w9nEueRYIG?=
 =?us-ascii?Q?v7oktp7eZsw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005)(7416005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 13:07:55.5287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6bd971-ecca-4a36-77c3-08dc8629ae68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369
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

When tracing is enabled, being able to identify which device is sending
events is useful; for this the next commit will extend events to include
drm_device::primary::index.

Since the device member is only used in the drm_* log macros, we can
replace it by a drm_device pointer.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
 drivers/gpu/drm/imagination/pvr_queue.c    |  2 +-
 drivers/gpu/drm/lima/lima_sched.c          |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c      |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c    |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 26 +++++++++++-----------
 drivers/gpu/drm/v3d/v3d_sched.c            | 12 +++++-----
 drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c      |  2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h      |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
 include/drm/gpu_scheduler.h                |  4 ++--
 17 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 932dc93b2e63..7f2a68ad8034 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2738,7 +2738,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
-				   adev->dev);
+				   &adev->ddev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
 				  ring->name);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index c4b04b0dee16..c4345b68a51f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -138,7 +138,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 			     DRM_SCHED_PRIORITY_COUNT,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), gpu->dev);
+			     dev_name(gpu->dev), gpu->drm);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 5ed9c98fb599..cdbb6c01e952 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1287,7 +1287,7 @@ struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
 			     pvr_dev->sched_wq, 1, 64 * 1024, 1,
 			     msecs_to_jiffies(500),
 			     pvr_dev->sched_wq, NULL, "pvr-queue",
-			     pvr_dev->base.dev);
+			     &pvr_dev->base);
 	if (err)
 		goto err_release_ufo;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index bbf3f8feab94..db6ee7650468 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -526,7 +526,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 			      1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, pipe->ldev->dev);
+			      NULL, name, pipe->ldev->ddev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 9d6655f96f0c..3a4b3816f2c9 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -101,7 +101,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			     DRM_SCHED_PRIORITY_COUNT,
 			     num_hw_submissions, 0, sched_timeout,
-			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
+			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 32fa2e273965..386839bed8a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -419,7 +419,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
 			     NOUVEAU_SCHED_PRIORITY_COUNT,
 			     credit_limit, 0, job_hang_limit,
-			     NULL, NULL, "nouveau_sched", drm->dev->dev);
+			     NULL, NULL, "nouveau_sched", drm->dev);
 	if (ret)
 		goto fail_wq;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a61ef0af9a4e..28c7680a8dbf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -875,7 +875,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
-				     NULL, "pan_js", pfdev->dev);
+				     NULL, "pan_js", pfdev->ddev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fa0a002b1016..b9c5b500b7d1 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2293,7 +2293,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 	ret = drm_sched_init(&vm->sched, &panthor_vm_bind_ops, ptdev->mmu->vm.wq,
 			     1, 1, 0,
 			     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
-			     "panthor-vm-bind", ptdev->base.dev);
+			     "panthor-vm-bind", &ptdev->base);
 	if (ret)
 		goto err_free_io_pgtable;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 79ffcbc41d78..47e52f61571b 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3043,7 +3043,7 @@ group_create_queue(struct panthor_group *group,
 			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
 			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
 			     group->ptdev->reset.wq,
-			     NULL, "panthor-queue", group->ptdev->base.dev);
+			     NULL, "panthor-queue", &group->ptdev->base);
 	if (ret)
 		goto err_free_queue;
 
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..194798b9ce09 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -92,7 +92,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		 * the lowest priority available.
 		 */
 		if (entity->priority >= sched_list[0]->num_rqs) {
-			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
+			drm_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
 						 (s32) DRM_SCHED_PRIORITY_KERNEL);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..74a2fe51e653 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -103,9 +103,9 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 {
 	u32 credits;
 
-	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
-					      atomic_read(&sched->credit_count),
-					      &credits));
+	drm_WARN_ON(sched->dev, check_sub_overflow(sched->credit_limit,
+						  atomic_read(&sched->credit_count),
+						  &credits));
 
 	return credits;
 }
@@ -130,14 +130,14 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 	if (sched->ops->update_job_credits) {
 		s_job->credits = sched->ops->update_job_credits(s_job);
 
-		drm_WARN(sched, !s_job->credits,
+		drm_WARN(sched->dev, !s_job->credits,
 			 "Jobs with zero credits bypass job-flow control.\n");
 	}
 
 	/* If a job exceeds the credit limit, truncate it to the credit limit
 	 * itself to guarantee forward progress.
 	 */
-	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
+	if (drm_WARN(sched->dev, s_job->credits > sched->credit_limit,
 		     "Jobs may not exceed the credit limit, truncate.\n"))
 		s_job->credits = sched->credit_limit;
 
@@ -701,7 +701,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			if (r == -ENOENT)
 				drm_sched_job_done(s_job, fence->error);
 			else if (r)
-				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
+				DRM_DEV_ERROR(sched->dev->dev, "fence add callback failed (%d)\n",
 					  r);
 		} else
 			drm_sched_job_done(s_job, -ECANCELED);
@@ -797,7 +797,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		 * or worse--a blank screen--leave a trail in the
 		 * logs, so this can be debugged easier.
 		 */
-		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
+		drm_err(job->sched->dev, "%s: entity has no rq!\n", __func__);
 		return -ENOENT;
 	}
 
@@ -1215,7 +1215,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		if (r == -ENOENT)
 			drm_sched_job_done(sched_job, fence->error);
 		else if (r)
-			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
+			DRM_DEV_ERROR(sched->dev->dev, "fence add callback failed (%d)\n", r);
 	} else {
 		drm_sched_job_done(sched_job, IS_ERR(fence) ?
 				   PTR_ERR(fence) : 0);
@@ -1240,7 +1240,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
- * @dev: target &struct device
+ * @dev: target &struct drm_device
  *
  * Return 0 on success, otherwise error code.
  */
@@ -1249,7 +1249,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *submit_wq,
 		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev)
+		   atomic_t *score, const char *name, struct drm_device *dev)
 {
 	int i;
 
@@ -1265,7 +1265,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
 		/* This is a gross violation--tell drivers what the  problem is.
 		 */
-		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
+		drm_err(dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
 			__func__);
 		return -EINVAL;
 	} else if (sched->sched_rq) {
@@ -1273,7 +1273,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		 * fine-tune their DRM calling order, and return all
 		 * is good.
 		 */
-		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
+		drm_warn(dev, "%s: scheduler already initialized!\n", __func__);
 		return 0;
 	}
 
@@ -1322,7 +1322,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 Out_check_own:
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
-	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
+	drm_err(dev, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_sched_init);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 7cd8c335cd9b..73383b6ef9bb 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -740,7 +740,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", v3d->drm.dev);
+			     NULL, "v3d_bin", &v3d->drm);
 	if (ret)
 		return ret;
 
@@ -749,7 +749,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_render", v3d->drm.dev);
+			     NULL, "v3d_render", &v3d->drm);
 	if (ret)
 		goto fail;
 
@@ -758,7 +758,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", v3d->drm.dev);
+			     NULL, "v3d_tfu", &v3d->drm);
 	if (ret)
 		goto fail;
 
@@ -768,7 +768,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     DRM_SCHED_PRIORITY_COUNT,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", v3d->drm.dev);
+				     NULL, "v3d_csd", &v3d->drm);
 		if (ret)
 			goto fail;
 
@@ -777,7 +777,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     DRM_SCHED_PRIORITY_COUNT,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean", v3d->drm.dev);
+				     NULL, "v3d_cache_clean", &v3d->drm);
 		if (ret)
 			goto fail;
 	}
@@ -787,7 +787,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     DRM_SCHED_PRIORITY_COUNT,
 			     1, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_cpu", v3d->drm.dev);
+			     NULL, "v3d_cpu", &v3d->drm);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index dece2785933c..dc81e9f39727 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -336,7 +336,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
 			     NULL, NULL, q->hwe->name,
-			     gt_to_xe(q->gt)->drm.dev);
+			     &gt_to_xe(q->gt)->drm);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index e4ad1d6ce1d5..66d36cac82a0 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -61,7 +61,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 		  uint32_t hw_submission, unsigned hang_limit,
 		  long timeout, struct workqueue_struct *timeout_wq,
 		  atomic_t *score, const char *name,
-		  struct device *dev)
+		  struct drm_device *dev)
 {
 	sched->ops = xe_ops;
 	INIT_LIST_HEAD(&sched->msgs);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 10c6bb9c9386..9a75457813f2 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -16,7 +16,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 		  uint32_t hw_submission, unsigned hang_limit,
 		  long timeout, struct workqueue_struct *timeout_wq,
 		  atomic_t *score, const char *name,
-		  struct device *dev);
+		  struct drm_device *dev);
 void xe_sched_fini(struct xe_gpu_scheduler *sched);
 
 void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e4e3658e6a13..b9c114f2c715 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1208,7 +1208,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 			    get_submit_wq(guc),
 			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			    q->name, gt_to_xe(q->gt)->drm.dev);
+			    q->name, &gt_to_xe(q->gt)->drm);
 	if (err)
 		goto err_free;
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..0ba8716ec069 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -539,7 +539,7 @@ struct drm_gpu_scheduler {
 	bool				free_guilty;
 	bool				pause_submit;
 	bool				own_submit_wq;
-	struct device			*dev;
+	struct drm_device		*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
@@ -547,7 +547,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *submit_wq,
 		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev);
+		   atomic_t *score, const char *name, struct drm_device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.40.1

