Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A7E9C86BD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF18510E7CE;
	Thu, 14 Nov 2024 10:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mb9OhTsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9DC10E7CD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSc1n5j8IgHtTrLG+TvlHyACU7UYy4p/KY3cu6+O3yi/urhy3BMvn+iy3BRLPA+qTuCDO8IH+dZquAL5oTZ90Ow6adCeI6fx/XXMCPxrn8I22QcLqTrdy1Wz6v4e9pi6hWWGSv7zByUxseZ4b5GgPG9JD7HQxfGeCs/fwWNsdFHyODJ8pxfGJAIEJls3x4SINhJL7mBlYJGrBT7SyHwKX2d+NWiY/MH9W8nv39LNWqTOQyKCThL5ReGTqYCjx0BlQmM706kSXMjmLsG7rfS3IDuNAr6CTHd4CnVj6vCM8CcYuYzzn9rkKgDfEBmASJ+20CcDCELNZpXOybL+RqJfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8637LFeQCzjYVLwj0HcFc5vxwI3DRZpMj3Y4cKiDAq4=;
 b=xrS97C25esuBVoeI6scQqEdBZQTmmT6nZk5HHtSidOjU8kcAkoGcBpP6kRAQqbdKEGnZm91JT7GRENFaLSW8HVW51m3jHF0YxBx0ZCNQcL6zEoZm7YrgzrQ4qNOMo9yu1e9y8XF0g36tKACVnR/VZNeUbx0BLimtxPHdvupm05EKqvlR+okErjc17PiHvBU+AWRD5WwnU+w8GkuibISEURgItSCSQdC5Id+ahO5LZ9BV2m6e6YFFtQSjdOVaLtNuOq7YGoI0hvkCmwcCdGsRxbrU1kMvXHRJSYdkOIZJfT6XwENsI9RwylEbKbPM4pS4yL2RtRbifWRG6kbszenhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8637LFeQCzjYVLwj0HcFc5vxwI3DRZpMj3Y4cKiDAq4=;
 b=Mb9OhTsz11TUj3kJLoQeFwYmiBZ041oCSjrTvJwNbyM57irOZZulK4TPpeoqEz0iTPV85ZHGWRfIyWtDwq34aiS6+JbZSH4hRFJe88KRg+0qG4hhSmo+LfuR7Kz1LqfsWE9B4FjSkqBJt3YP8SCt0Is4N5XVQ5XKkDr77VV8vvA=
Received: from SN6PR05CA0021.namprd05.prod.outlook.com (2603:10b6:805:de::34)
 by PH8PR12MB7133.namprd12.prod.outlook.com (2603:10b6:510:22e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Thu, 14 Nov
 2024 10:01:50 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::f4) by SN6PR05CA0021.outlook.office365.com
 (2603:10b6:805:de::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Thu, 14 Nov 2024 10:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 10:01:50 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 04:01:44 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>, <l.stach@pengutronix.de>, <matt.coster@imgtec.com>,
 <frank.binns@imgtec.com>, <yuq825@gmail.com>, <robdclark@gmail.com>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <mwen@igalia.com>, <mcanal@igalia.com>,
 <thomas.hellstrom@linux.intel.com>, <tvrtko.ursulin@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v6 2/7] drm/sched: store the drm client_id in drm_sched_fence
Date: Thu, 14 Nov 2024 11:01:05 +0100
Message-ID: <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|PH8PR12MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: c8daace3-9aaf-48dc-662f-08dd04935c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ueg1Jh/ginqy8C92K505dQklYq+CpyF8QRRc+zco/srpcb6NbGxOOuebBHyw?=
 =?us-ascii?Q?GoVxWTn5KOlApaBTvCY3ZG0Jlfv6Xfa8VpqPU9LaHahjpU8x5UNNuoJNDPUt?=
 =?us-ascii?Q?g6QeCgOrjbtAWW882pbH3jygficzW4fANp+FzeyXhGgX5O4cop+lxQOPV2pr?=
 =?us-ascii?Q?wg752/WIW5P5gr1PShPv5UTQK+ekElEjHfgopyji/wvWopk4gk8vbdisvgkT?=
 =?us-ascii?Q?kylQ44j0unVra+xnuhTecLpeGXi0t8ocQ4HyKqaq2QwuWloGe8mmidtTEzFm?=
 =?us-ascii?Q?RjNsNJx/lFsczYlhyKp7eqydo2K7UYlG8GtfY37kVE9vU/2L9udX3KmWjaxn?=
 =?us-ascii?Q?44M5AuOMdebJWBOQHVHDc3/hGQ/+KXRi++PNomv6QOJXucPOeI7nRLj3kB5s?=
 =?us-ascii?Q?d1hkMaadoLNyryG2oe+E1CtMQ8ocLS7acVy37eD43N6Qxylo6I9cmBE482Au?=
 =?us-ascii?Q?HNMFQzL47u0Zac6RK/FSsP7KFrpuUFMGIFo9YyHBg6QcklITGmes5j8bJRMG?=
 =?us-ascii?Q?d+/wpnUULNE3AAl3pXCWJOLTAs4S2MDfuldiKjCU4VeIQ+stxXg3SFMz7rgU?=
 =?us-ascii?Q?pNy4r1/cl2Ty/39c5Zut31ab3F9n0U3JfD1UxIsGHsODV+EbVh4GbXvEF1jv?=
 =?us-ascii?Q?unv87Z2d8KLrRP+bwp64Or7d0MfnmlTKfEYXdVbMAjHTYn938zPuoRHOJPNS?=
 =?us-ascii?Q?DtUIPVVwdHhWYjQhCwwMEMzgkNnXoiMBo5z5UwcYZg3ICQwtEQSQwILCBhZW?=
 =?us-ascii?Q?3JDHxm5zl5XLvWYTdQ50Dv7OMHKEUdnw8p4XzXQpBtL6AapcPUZYbF8fYDR4?=
 =?us-ascii?Q?YJmuZcPNbUm6HXF/rGoQEdPykiCMUh3oGT8ChZJKV0jnpprJoUYeYHbf5CgD?=
 =?us-ascii?Q?/XBQjZWEfwMRDlgq6XU3D4X14utO4Kn7S/9hw48Rsep/RbX4Zri9GeUca5wS?=
 =?us-ascii?Q?ix93Yzb1oQzbvzRZRy6RKK65dUcGo1xTJt4CtmFzYBCD8bFME7x1dazrvMKz?=
 =?us-ascii?Q?qWM+T4AFE9pwE+zKhijjoxtlpgsCtIyHkBnhTKMNCf627TWq1uUVEV3ESgvl?=
 =?us-ascii?Q?QkPnE00ZFtO2Gfi81l8fVMBlo96by8sRfzifF5F45Y5EEHVYdV1BexXvMyNK?=
 =?us-ascii?Q?Gd36iASjttWJ3rrDzpjnNxHhAJcxjJeHaDvZoyZjk4ml5XuZ0nyKBapu3xvS?=
 =?us-ascii?Q?42bYJEmzzQEtWNf84/c3aCHjy4IolXjMVqF8d0a0ogXaI3bzkaPBkmXBM6pU?=
 =?us-ascii?Q?Khe6j5DYZ2l4LzzXBu+t697SUJtrs/joJJXSXN5wHIFd/g9mgqGLDuwOeH1W?=
 =?us-ascii?Q?z29RphjPdSiSteWAcFSWMZY49UU+6dHkKQX2Z7rNQ6qDc6Y/sxp7icHZj0cE?=
 =?us-ascii?Q?PeUy5/1YonfL7D6gUolDliW7NNv6+kZZ4YwY3OTEPLKDt8UKwYVyVXvGCiAP?=
 =?us-ascii?Q?V+IsVnOWsM8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:01:50.7634 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8daace3-9aaf-48dc-662f-08dd04935c1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7133
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

This will be used in a later commit to trace the drm client_id in
some of the gpu_scheduler trace events.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |  8 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h      |  3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  2 +-
 drivers/gpu/drm/imagination/pvr_job.c        |  2 +-
 drivers/gpu/drm/imagination/pvr_queue.c      |  5 +++--
 drivers/gpu/drm/imagination/pvr_queue.h      |  2 +-
 drivers/gpu/drm/lima/lima_gem.c              |  2 +-
 drivers/gpu/drm/lima/lima_sched.c            |  6 ++++--
 drivers/gpu/drm/lima/lima_sched.h            |  3 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c         |  8 +++++---
 drivers/gpu/drm/nouveau/nouveau_sched.c      |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_drv.c      |  2 +-
 drivers/gpu/drm/scheduler/sched_fence.c      |  4 +++-
 drivers/gpu/drm/scheduler/sched_main.c       |  6 ++++--
 drivers/gpu/drm/v3d/v3d_submit.c             |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |  3 ++-
 include/drm/gpu_scheduler.h                  | 12 ++++++++++--
 19 files changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index b545940e512b..eede43701d51 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -681,7 +681,7 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device *adev,
 		goto err;
 	}
 
-	ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job);
+	ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job, 0);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 98aa4beee36a..a0a129405323 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -293,7 +293,8 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 
 	for (i = 0; i < p->gang_size; ++i) {
 		ret = amdgpu_job_alloc(p->adev, vm, p->entities[i], vm,
-				       num_ibs[i], &p->jobs[i]);
+				       num_ibs[i], &p->jobs[i],
+				       p->filp->client_id);
 		if (ret)
 			goto free_all_kdata;
 		p->jobs[i]->enforce_isolation = p->adev->enforce_isolation[fpriv->xcp_id];
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c774cd019a10..1dd8e940d1e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -186,7 +186,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct drm_sched_entity *entity, void *owner,
-		     unsigned int num_ibs, struct amdgpu_job **job)
+		     unsigned int num_ibs, struct amdgpu_job **job,
+		     uint64_t drm_client_id)
 {
 	if (num_ibs == 0)
 		return -EINVAL;
@@ -209,7 +210,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (!entity)
 		return 0;
 
-	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
+	return drm_sched_job_init(&(*job)->base, entity, 1, owner,
+				  drm_client_id);
 }
 
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
@@ -219,7 +221,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 {
 	int r;
 
-	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job);
+	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index ce6b9ba967ff..41a03477ba5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -90,7 +90,8 @@ static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job *job)
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct drm_sched_entity *entity, void *owner,
-		     unsigned int num_ibs, struct amdgpu_job **job);
+		     unsigned int num_ibs, struct amdgpu_job **job,
+		     uint64_t drm_client_id);
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 			     struct drm_sched_entity *entity, void *owner,
 			     size_t size, enum amdgpu_ib_pool_type pool_type,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3d0f8d182506..70294ca6202f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -535,7 +535,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&submit->sched_job,
 				 &ctx->sched_entity[args->pipe],
-				 1, submit->ctx);
+				 1, submit->ctx, file->client_id);
 	if (ret)
 		goto err_submit_put;
 
diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
index 618503a212a7..64152b57e8b1 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -446,7 +446,7 @@ create_job(struct pvr_device *pvr_dev,
 	if (err)
 		goto err_put_job;
 
-	err = pvr_queue_job_init(job);
+	err = pvr_queue_job_init(job, pvr_file->file->client_id);
 	if (err)
 		goto err_put_job;
 
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index c4f08432882b..598180fca141 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1059,6 +1059,7 @@ static int pvr_queue_cleanup_fw_context(struct pvr_queue *queue)
 /**
  * pvr_queue_job_init() - Initialize queue related fields in a pvr_job object.
  * @job: The job to initialize.
+ * @drm_client_id: drm_file.client_id submitting the job
  *
  * Bind the job to a queue and allocate memory to guarantee pvr_queue_job_arm()
  * and pvr_queue_job_push() can't fail. We also make sure the context type is
@@ -1068,7 +1069,7 @@ static int pvr_queue_cleanup_fw_context(struct pvr_queue *queue)
  *  * 0 on success, or
  *  * An error code if something failed.
  */
-int pvr_queue_job_init(struct pvr_job *job)
+int pvr_queue_job_init(struct pvr_job *job, uint64_t drm_client_id)
 {
 	/* Fragment jobs need at least one native fence wait on the geometry job fence. */
 	u32 min_native_dep_count = job->type == DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
@@ -1085,7 +1086,7 @@ int pvr_queue_job_init(struct pvr_job *job)
 	if (!pvr_cccb_cmdseq_can_fit(&queue->cccb, job_cmds_size(job, min_native_dep_count)))
 		return -E2BIG;
 
-	err = drm_sched_job_init(&job->base, &queue->entity, 1, THIS_MODULE);
+	err = drm_sched_job_init(&job->base, &queue->entity, 1, THIS_MODULE, drm_client_id);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/imagination/pvr_queue.h b/drivers/gpu/drm/imagination/pvr_queue.h
index e06ced69302f..bc556169b2cf 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.h
+++ b/drivers/gpu/drm/imagination/pvr_queue.h
@@ -139,7 +139,7 @@ struct pvr_queue {
 
 bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f);
 
-int pvr_queue_job_init(struct pvr_job *job);
+int pvr_queue_job_init(struct pvr_job *job, uint64_t drm_client_id);
 
 void pvr_queue_job_cleanup(struct pvr_job *job);
 
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 9bb997dbb4b9..f46f961afc56 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -341,7 +341,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 
 	err = lima_sched_task_init(
 		submit->task, submit->ctx->context + submit->pipe,
-		bos, submit->nr_bos, vm);
+		bos, submit->nr_bos, vm, file->client_id);
 	if (err)
 		goto err_out1;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index b40c90e97d7e..84599549661a 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -113,7 +113,8 @@ static inline struct lima_sched_pipe *to_lima_pipe(struct drm_gpu_scheduler *sch
 int lima_sched_task_init(struct lima_sched_task *task,
 			 struct lima_sched_context *context,
 			 struct lima_bo **bos, int num_bos,
-			 struct lima_vm *vm)
+			 struct lima_vm *vm,
+			 uint64_t drm_client_id)
 {
 	int err, i;
 
@@ -124,7 +125,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
 	for (i = 0; i < num_bos; i++)
 		drm_gem_object_get(&bos[i]->base.base);
 
-	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
+	err = drm_sched_job_init(&task->base, &context->base, 1, vm,
+				 drm_client_id);
 	if (err) {
 		kfree(task->bos);
 		return err;
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 85b23ba901d5..4041468586bd 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -88,7 +88,8 @@ struct lima_sched_pipe {
 int lima_sched_task_init(struct lima_sched_task *task,
 			 struct lima_sched_context *context,
 			 struct lima_bo **bos, int num_bos,
-			 struct lima_vm *vm);
+			 struct lima_vm *vm,
+			 uint64_t drm_client_id);
 void lima_sched_task_fini(struct lima_sched_task *task);
 
 int lima_sched_context_init(struct lima_sched_pipe *pipe,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fba78193127d..ceeedd4186ef 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -30,7 +30,7 @@
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
-		uint32_t nr_cmds)
+		uint32_t nr_cmds, uint64_t drm_client_id)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_gem_submit *submit;
@@ -54,7 +54,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
+	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue,
+				 drm_client_id);
 	if (ret) {
 		kfree(submit->hw_fence);
 		kfree(submit);
@@ -702,7 +703,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds);
+	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds,
+			       file->client_id);
 	if (IS_ERR(submit)) {
 		ret = PTR_ERR(submit);
 		goto out_post_unlock;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 4412f2711fb5..ebc31adea39a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -87,7 +87,8 @@ nouveau_job_init(struct nouveau_job *job,
 	}
 
 	ret = drm_sched_job_init(&job->base, &sched->entity,
-				 args->credits, NULL);
+				 args->credits, NULL,
+				 job->file_priv->client_id);
 	if (ret)
 		goto err_free_chains;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 04d615df5259..a8135bd75cae 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -312,7 +312,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&job->base,
 				 &file_priv->sched_entity[slot],
-				 1, NULL);
+				 1, NULL, file->client_id);
 	if (ret)
 		goto out_put_job;
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 0f35f009b9d3..909b886cd379 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -204,7 +204,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 EXPORT_SYMBOL(to_drm_sched_fence);
 
 struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
-					      void *owner)
+					      void *owner,
+					      uint64_t drm_client_id)
 {
 	struct drm_sched_fence *fence = NULL;
 
@@ -213,6 +214,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 		return NULL;
 
 	fence->owner = owner;
+	fence->drm_client_id = drm_client_id;
 	spin_lock_init(&fence->lock);
 
 	return fence;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7ce25281c74c..28ac709750e9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -776,6 +776,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * @credits: the number of credits this job contributes to the schedulers
  * credit limit
  * @owner: job owner for debugging
+ * @drm_client_id: drm_file.client_id of the owner
  *
  * Refer to drm_sched_entity_push_job() documentation
  * for locking considerations.
@@ -796,7 +797,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  */
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       u32 credits, void *owner)
+		       u32 credits, void *owner,
+		       uint64_t drm_client_id)
 {
 	if (!entity->rq) {
 		/* This will most likely be followed by missing frames
@@ -822,7 +824,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	job->entity = entity;
 	job->credits = credits;
-	job->s_fence = drm_sched_fence_alloc(entity, owner);
+	job->s_fence = drm_sched_fence_alloc(entity, owner, drm_client_id);
 	if (!job->s_fence)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index d607aa9c4ec2..a086da31f441 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -168,7 +168,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->file = file_priv;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
-				 1, v3d_priv);
+				 1, v3d_priv, file_priv->client_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index eeccc1c318ae..6617555e7a51 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -113,7 +113,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	kref_init(&job->refcount);
 	xe_exec_queue_get(job->q);
 
-	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
+	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
+				 q->xef->drm->client_id);
 	if (err)
 		goto err_free;
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 95e17504e46a..42c381449443 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -311,6 +311,13 @@ struct drm_sched_fence {
          * @owner: job owner for debugging
          */
 	void				*owner;
+
+	/**
+	 * @drm_client_id:
+	 *
+	 * The client_id of the drm_file who owned the job.
+	 */
+	uint64_t			drm_client_id;
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
@@ -563,7 +570,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       u32 credits, void *owner);
+		       u32 credits, void *owner,
+		       uint64_t drm_client_id);
 void drm_sched_job_arm(struct drm_sched_job *job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
@@ -624,7 +632,7 @@ bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
 
 struct drm_sched_fence *drm_sched_fence_alloc(
-	struct drm_sched_entity *s_entity, void *owner);
+	struct drm_sched_entity *s_entity, void *owner, uint64_t drm_client_id);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity);
 void drm_sched_fence_free(struct drm_sched_fence *fence);
-- 
2.43.0

