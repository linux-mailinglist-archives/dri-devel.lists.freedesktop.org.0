Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D2633AAAE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 06:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66A089B5F;
	Mon, 15 Mar 2021 05:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E02E89B51;
 Mon, 15 Mar 2021 05:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCV1lmVwuP4V4VgeLu3ZbFlFf1qbvhlP7FpMYm7SsNxGd7IflHW1Pggimm0AOFra0CkEx8FjSoVlwhZV5uCKfIgKnj/XUfLoysuPyUDVl2tXlNJIYJE+njirkw+taBmq5a6TYRoTblf1XftL38LxnZMo1P0a+tMCNkKZb5eicdjHgAkSjDPje9YnnQ3vlvsOlS0l0asxoELac8J1swKJsHBjCk0Gvr3v0ttr9fD6y7R35Uc3ZJ5gTfs814zU0oqo+Pmzn1atBDZNEy+xafabQYWXP4ifc8HMQySibdeNCzOHYli4DWCe9wfRZw4Ef1U4Z4SFGWsnHuYs4pAL3pu+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHZ/oVLzoNdb1Zlq3PwTBiabE424RTmxWUgqRkGCLDw=;
 b=efsayZzk5qfI4yewOwejm6+szK4V8F3QghY54JIpziGQT/SNP+Y2Qg9PCQkFqm+5EsWGiteWEatuUe90GB1BNMJCfH9xQf+kdZSOsEV4A69U0J5sQGGD8tVr2HNhEOJPKK7tno0UQ2ZFp+Gl4kZGnVkgkUDUdHMsZ/jv9EjMmy3gAmWhGPR5r5+FKEtZpsHhd5SQ8NS8O3R2qCwXwrerJYFhxIlOhXlVG3c0HYQyKUt7OUUYS4mfYphb2WuA91GvWW32Pt3+nm0McZfYV4gdD30xUdRw2Gd3wigSCYtUvVfLws9eF6jSjjp0wwekTtbFmYW1oiEOklBZQPtP+pU7tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHZ/oVLzoNdb1Zlq3PwTBiabE424RTmxWUgqRkGCLDw=;
 b=J4WuZezaNqNBMLaiS/CfXo83LKc1lXyygLPWo0m820FUwK1pIe4gvTHWblVoni1s9hL920ncw/2gqTinkq3M0hJ/n8p4AtYj3zcwnYLwDGvTN/m0Dtgr/C64lROvvdymi3cr78P9C4hsJBgqpAM6tKgzOI2qSwgnOyfSqudA+ZY=
Received: from DS7PR05CA0001.namprd05.prod.outlook.com (2603:10b6:5:3b9::6) by
 BN6PR1201MB0258.namprd12.prod.outlook.com (2603:10b6:405:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 05:20:42 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::8) by DS7PR05CA0001.outlook.office365.com
 (2603:10b6:5:3b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend
 Transport; Mon, 15 Mar 2021 05:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB01.amd.com;
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 05:20:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 00:20:41 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 00:20:41 -0500
Received: from ubuntuBBNew.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Mon, 15 Mar 2021 00:20:39 -0500
From: Jack Zhang <Jack.Zhang1@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <Christian.Koenig@amd.com>, <Andrey.Grodzovsky@amd.com>, <Monk.Liu@amd.com>,
 <Emily.Deng@amd.com>
Subject: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Date: Mon, 15 Mar 2021 13:20:36 +0800
Message-ID: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 192b3e19-4859-473c-fbcb-08d8e7721423
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0258:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB02589DAA933C7F6330145DBCBB6C9@BN6PR1201MB0258.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fe7iHStaH5GETSRvEBQUjK3ecLxlfRbixDNCCpGpXydwIsiBVa5h3luZB7onUI496b5bkthfwpT9mF6pmBx6jeCI+IVdnoOGTvSfzFzGO8KdwZ+FW3w7u1KdC60qASLrhCvKqn0B4WInB5VqeVOkwrGmSY4M4YVfu9PWnCHxPoTx1PHVYC0wd9RdAgdSbOK3CadPdqVUd5r9N18ldGUrbF/Tdkd6rvvzhwJ9Q127uLNfZH39prznwXvMGW8Pcv1TPQpVNrK7q4tPwzAzSFMzhkODCAWqXCN06gv5tnNLSS7exJLwIEximNz4Lbh3VDYRy/9Gq9gXyLUHSlqXoLyQXiD5fP59FRQsD6eGaGtGQMA+dlHORQsF1TCO3CpPN6PRU1P4jZPPhKDMK0ICnxVeDjX1BDa4IXkTvhBAke9iBS5PMtZUhbVCyGzGetElhegaQOPzFUFM9R5ZF4O6wyoEnq0CdIEay0a/9gg6rQLJ4Dyos4m0Yl4cVtJLmvg9hMyHsw7azSc/aWrS4O+x9tLhGuVFBlApLWQDboII3zzl109PzTi6fCe1NGED2Qg8i0bnWvF9fJS8gKYjge+akESJq2yzXixYMOxnY3D6AkjEJeOWT1eef4UpurGlgJTdbinE9UuD9bCM+zpHwgzDW2NXXHtXMkhMv+fQzaAky1yI0H4pOXC3fVUj3ICtltC+Zblm
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(36840700001)(46966006)(356005)(82310400003)(82740400003)(47076005)(83380400001)(186003)(36756003)(6636002)(1076003)(86362001)(70586007)(6666004)(36860700001)(70206006)(81166007)(110136005)(26005)(478600001)(2616005)(316002)(450100002)(336012)(426003)(5660300002)(4326008)(8676002)(7696005)(8936002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 05:20:42.2056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 192b3e19-4859-473c-fbcb-08d8e7721423
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0258
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

re-insert Bailing jobs to avoid memory leak.

V2: move re-insert step to drm/scheduler logic
V3: add panfrost's return value for bailing jobs
in case it hits the memleak issue.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c    | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
 include/drm/gpu_scheduler.h                | 1 +
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 79b9cc73763f..86463b0f936e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 					job ? job->base.id : -1);
 
 		/* even we skipped this reset, still need to set the job to guilty */
-		if (job)
+		if (job) {
 			drm_sched_increase_karma(&job->base);
+			r = DRM_GPU_SCHED_STAT_BAILING;
+		}
 		goto skip_recovery;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 759b34799221..41390bdacd9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct amdgpu_task_info ti;
 	struct amdgpu_device *adev = ring->adev;
+	int ret;
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
@@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
-		amdgpu_device_gpu_recover(ring->adev, job);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		ret = amdgpu_device_gpu_recover(ring->adev, job);
+		if (ret == DRM_GPU_SCHED_STAT_BAILING)
+			return DRM_GPU_SCHED_STAT_BAILING;
+		else
+			return DRM_GPU_SCHED_STAT_NOMINAL;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1322..e2cb4f32dae1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -444,7 +444,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	 * spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(job->done_fence))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
 		js,
@@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 
 	/* Scheduler is already stopped, nothing to do. */
 	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	/* Schedule a reset if there's no reset in progress. */
 	if (!atomic_xchg(&pfdev->reset.pending, 1))
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 92d8de24d0a1..a44f621fb5c4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	int ret;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
@@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
-		job->sched->ops->timedout_job(job);
+		ret = job->sched->ops->timedout_job(job);
 
+		if (ret == DRM_GPU_SCHED_STAT_BAILING) {
+			spin_lock(&sched->job_list_lock);
+			list_add(&job->node, &sched->ring_mirror_list);
+			spin_unlock(&sched->job_list_lock);
+		}
 		/*
 		 * Guilty job did complete and hence needs to be manually removed
 		 * See drm_sched_stop doc.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 4ea8606d91fe..8093ac2427ef 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
 	DRM_GPU_SCHED_STAT_NOMINAL,
 	DRM_GPU_SCHED_STAT_ENODEV,
+	DRM_GPU_SCHED_STAT_BAILING,
 };
 
 /**
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
