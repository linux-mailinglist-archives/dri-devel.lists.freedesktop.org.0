Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6EA23CA3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 12:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B9710EA6E;
	Fri, 31 Jan 2025 11:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y6YTTeQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98B110EA69;
 Fri, 31 Jan 2025 11:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrgGxVJvQG5W9+68Z9hCTduSfYuZKa1YjjcXwh0HT49wQxS7JhuKb9XejS2dVFrDV6jaUTbDE2nlnTeATtm6ZYB1FvN1AJqZDOz/MdJO7JDsscs+wjMDCJxE803T7OOeOp6yobMiMrqaLdSrhZ8tzvcBPzPDEe0REEUfUMISD4ZSOf00l2OTUjAm7QMTtiuPieFOna77jBLdNHbz96aeRPKdtgl8dEDsOYGiRjAaRicaXXCbtoyCYr+m+PuCo+k+maC4bhLDMKp3PRfydCAe/4W3OfcvuQsSHE4rks7cSVTqnuKjxY54FVkU5cj4YrBxWQYIWYbwA6g4xbbSVEZ2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH9pFxO2uE/4DZKakNyM8CwSXSsS7Nz1LNCfC2NYfAE=;
 b=TA4BRl/BeTYfeldlzAbjgBCQke6raBGaWB4lu7CYQhyxgLoVWYt/CKiYrCsBsWxOgYoyjqcwoenL6W/n2oRYQdr1IYV0idULqKvD23r8M7fE5i9hj0PkYM6pSVtAqKWfD4DVc7/C7+DTRncH32C7sTZgIkUCSTC57p0JmC28SYRObeVzqwZCos1Zbf1HaJkX6eL0DHIAWm0YNrbMlIfZXTp9HRiSf2tUNk889vE/xlTH7mNXcne0TU6facc7rrOfyIi2PtXSraWrF792u566/pMtH3hVQ4ncKbDtXSe9r2EcFHEQjzSSfUP1ecFFXgU3i5uhB8lA3FeTWgzaD8V45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH9pFxO2uE/4DZKakNyM8CwSXSsS7Nz1LNCfC2NYfAE=;
 b=Y6YTTeQbtZvKMW2l2ldfdeMo6PXWTvXmSNS641nwUSacfiq66haXwfQk78msxlRaSkCOxXQNOuu9rc/koOi9Fz9aVLTqJzK9SpT8zGi+x7dPVgqbMlJ5EpprfMAjzbCxuq3FAw5AsT4M5432nYjGkMINYJ95FI3mFHIAPe0PO0M=
Received: from MW3PR06CA0022.namprd06.prod.outlook.com (2603:10b6:303:2a::27)
 by DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 11:04:46 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::bf) by MW3PR06CA0022.outlook.office365.com
 (2603:10b6:303:2a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 11:04:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 11:04:46 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 05:04:35 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu
 <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, Luben Tuikov
 <ltuikov89@gmail.com>, "Matthew Brost" <matthew.brost@intel.com>, Philipp
 Stanner <pstanner@redhat.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <etnaviv@lists.freedesktop.org>,
 <lima@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: [PATCH v7 2/7] drm/sched: store the drm client_id in drm_sched_fence
Date: Fri, 31 Jan 2025 12:03:00 +0100
Message-ID: <20250131110328.706695-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|DS7PR12MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: 884e93c8-e419-4954-5daf-08dd41e712fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?piI/oQQqTZ0rcejbHtJAniIQcT8wXa2mpny3JgE/wJvnLQr27u+KbD6Q2gnG?=
 =?us-ascii?Q?Hip7VpP6MELASsb+QqAt7Rp/w6stzzl6ycChfBji+TFBn/rd7JZ/7UZiIWwH?=
 =?us-ascii?Q?qEcO9PCokF3q7kGHacBBIAfhAFj8iyCyVlm1BDh/nYgPAUyLDFOSsVzJllNZ?=
 =?us-ascii?Q?Fd2TqnFQyHuW7wgp4cBZrNBcOcMCgJLWnxuCGQ25J49sLHGpp9apnQX/6I4h?=
 =?us-ascii?Q?wQqmFR0iFS1J1JD142d4eWkNqzjD6pm8esFaCd8mbOBalx3otj3SlM5rulUb?=
 =?us-ascii?Q?QfoQlAJGM8TTzejvhB3HmO8jMRmb2NFojAm9Do9I5DQg2YptUOtYEOoNBsyl?=
 =?us-ascii?Q?3/s8ymqqlT+bmOEzrh7y4Qr/ui7IkGm55axiTp2mDP3pZJC4mG9mADWhS/x4?=
 =?us-ascii?Q?Pob0LKLDYdSv1QIwHLikBQxOInBJZ9GHtXt+BQHa8iTobeG0ZxFeJzaNkzPr?=
 =?us-ascii?Q?hRqOjQkIPpTAePcGIpiwNb4p0FAB2QuGSUJ1M8YkSrxWmDNvUPzWKzWG9+Bl?=
 =?us-ascii?Q?5OCf3ZiPQkKKw6wsAJ/djVfooVfHCCLLt1mBnQs6HOG151d9jSxjJ+IQsheX?=
 =?us-ascii?Q?AaK+nKBUbrd+BNxV6c/r3LaKWMaliLeNYVYWj3ubEVArqdGw0HHc8+jWCuzI?=
 =?us-ascii?Q?XpF2N/DhdLfwYc8fT5ehQUYxpmUjIzZSta6ZvPidl8bvR12g7p35LvARpn3/?=
 =?us-ascii?Q?7rNDz+Y+M/+OzmO4s0hlWo3iDxbg2+4pXhyfCXuIh7XAD0/IPV7hYTwsBAfa?=
 =?us-ascii?Q?k4mxJLTJVwqv5JKHFHnV5DtRsBT0hDNbyisVKbeN/MAPM5TtOb1OnNgTHjeH?=
 =?us-ascii?Q?QXnGICwmrTcV6uhcMbfiDrLBhnhy/lkdPmSYi/fVCWoI9Ivr7URbrsOVRs0b?=
 =?us-ascii?Q?6TKeomsfqoz4AV4w1PSY0lahwbHy+zl90n8lICh1hJ7NbHNdHHYZ2XptEoT/?=
 =?us-ascii?Q?/FXxKzmxeUjtHv2L/6obZINdkM3KePZTI78ilXHcPIFdeqhrLdb3xl/CmmwK?=
 =?us-ascii?Q?umVkm9ck0pLiqL7TAmUnqDysen3vc98E9zRv788JGAMGgMx9qIq30pnRm9ep?=
 =?us-ascii?Q?XpXHweaVZ3ABACM8C040fctUbLXLSXlpSSc6NEE6x9F7QwW3YECelEWwTLyn?=
 =?us-ascii?Q?hx9fuS75Jp7aQUF/6wa6EIOPHQWYvJ+fzInSmN/phlEc9IB8zwNNwQWOruA2?=
 =?us-ascii?Q?QWqm3wontXE+LkIjpmqCfZ0wAvDpYUVCXKiqmzvFp9aFsz2Azx2AR9zTQh4H?=
 =?us-ascii?Q?13vJ7lIIBhzZIOR3Q8I9A1xdJqnAWlGZfos777uC+q1jbjTUyESs0CDMlSw9?=
 =?us-ascii?Q?uyg+2X2aLmY0jy9PuRyGS9Qbkt3ukprLE7GtmxsCOyIZ/p+6831T5kU7KftV?=
 =?us-ascii?Q?uB/4DP/y1NyvORPkJEbeiHLcrUK2lfSrcskf3fBN8eo8+hTUYJBi7lBFBMpD?=
 =?us-ascii?Q?+LS65YDKwweqzEgwOzXPO12wrUISA46EeCFSffeZjNANXu6yJoEX+tzLiq7o?=
 =?us-ascii?Q?NWfGMtkEvPAekUR5m7FRSP2LRUb5sWslxm0M?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:04:46.6539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 884e93c8-e419-4954-5daf-08dd41e712fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527
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

This requires changing all the users of drm_sched_job_init to
add an extra parameter.

The newly added drm_client_id field in the drm_sched_fence is a bit
of a duplicate of the owner one. One suggestion I received was to
merge those 2 fields - this can't be done right now as amdgpu uses
some special values (AMDGPU_FENCE_OWNER_*) that can't really be
translated into a client id. Christian is working on getting rid of
those; when it's done we should be able to squash owner/drm_client_id
together.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c             |  3 ++-
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
 drivers/gpu/drm/panthor/panthor_drv.c        |  3 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c        |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c      |  5 +++--
 drivers/gpu/drm/panthor/panthor_sched.h      |  3 ++-
 drivers/gpu/drm/scheduler/sched_fence.c      |  4 +++-
 drivers/gpu/drm/scheduler/sched_main.c       |  6 ++++--
 drivers/gpu/drm/v3d/v3d_submit.c             |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |  3 ++-
 include/drm/gpu_scheduler.h                  | 12 ++++++++++--
 24 files changed, 61 insertions(+), 33 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 5f43db02b240..d33e62f1b127 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -819,7 +819,8 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 		goto up_sem;
 	}
 
-	ret = drm_sched_job_init(&job->base, &hwctx->priv->entity, 1, hwctx);
+	ret = drm_sched_job_init(&job->base, &hwctx->priv->entity, 1, hwctx,
+				 hwctx->client->filp->client_id);
 	if (ret) {
 		XDNA_ERR(xdna, "DRM job init failed, ret %d", ret);
 		goto free_chain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 2e5732dfd425..d480be803784 100644
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
index 5cc5f59e3018..d115fa10f8ee 100644
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
index 100f04475943..0a9a53f2e78a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -185,7 +185,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct drm_sched_entity *entity, void *owner,
-		     unsigned int num_ibs, struct amdgpu_job **job)
+		     unsigned int num_ibs, struct amdgpu_job **job,
+		     u64 drm_client_id)
 {
 	if (num_ibs == 0)
 		return -EINVAL;
@@ -203,7 +204,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (!entity)
 		return 0;
 
-	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
+	return drm_sched_job_init(&(*job)->base, entity, 1, owner,
+				  drm_client_id);
 }
 
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
@@ -213,7 +215,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 {
 	int r;
 
-	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job);
+	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index ce6b9ba967ff..5a8bc6342222 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -90,7 +90,8 @@ static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job *job)
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct drm_sched_entity *entity, void *owner,
-		     unsigned int num_ibs, struct amdgpu_job **job);
+		     unsigned int num_ibs, struct amdgpu_job **job,
+		     u64 drm_client_id);
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 			     struct drm_sched_entity *entity, void *owner,
 			     size_t size, enum amdgpu_ib_pool_type pool_type,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3c0a5c3e0e3d..76c742328edb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -534,7 +534,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 
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
index c4f08432882b..240d85e1006d 100644
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
+int pvr_queue_job_init(struct pvr_job *job, u64 drm_client_id)
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
index e06ced69302f..0cfbe1cd311e 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.h
+++ b/drivers/gpu/drm/imagination/pvr_queue.h
@@ -139,7 +139,7 @@ struct pvr_queue {
 
 bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f);
 
-int pvr_queue_job_init(struct pvr_job *job);
+int pvr_queue_job_init(struct pvr_job *job, u64 drm_client_id);
 
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
index b40c90e97d7e..ffc369dd4301 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -113,7 +113,8 @@ static inline struct lima_sched_pipe *to_lima_pipe(struct drm_gpu_scheduler *sch
 int lima_sched_task_init(struct lima_sched_task *task,
 			 struct lima_sched_context *context,
 			 struct lima_bo **bos, int num_bos,
-			 struct lima_vm *vm)
+			 struct lima_vm *vm,
+			 u64 drm_client_id)
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
index 85b23ba901d5..1a08faf8a529 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -88,7 +88,8 @@ struct lima_sched_pipe {
 int lima_sched_task_init(struct lima_sched_task *task,
 			 struct lima_sched_context *context,
 			 struct lima_bo **bos, int num_bos,
-			 struct lima_vm *vm);
+			 struct lima_vm *vm,
+			 u64 drm_client_id);
 void lima_sched_task_fini(struct lima_sched_task *task);
 
 int lima_sched_context_init(struct lima_sched_pipe *pipe,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index dee470403036..378119155673 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -30,7 +30,7 @@
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
-		uint32_t nr_cmds)
+		uint32_t nr_cmds, u64 drm_client_id)
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
@@ -693,7 +694,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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
index 0f3935556ac7..f4f20d11ecd9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -312,7 +312,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&job->base,
 				 &file_priv->sched_entity[slot],
-				 1, NULL);
+				 1, NULL, file->client_id);
 	if (ret)
 		goto out_put_job;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index d5dcd3d1b33a..bf8c92ebcc2d 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -988,7 +988,8 @@ static int panthor_ioctl_group_submit(struct drm_device *ddev, void *data,
 		const struct drm_panthor_queue_submit *qsubmit = &jobs_args[i];
 		struct drm_sched_job *job;
 
-		job = panthor_job_create(pfile, args->group_handle, qsubmit);
+		job = panthor_job_create(pfile, args->group_handle, qsubmit,
+					 file->client_id);
 		if (IS_ERR(job)) {
 			ret = PTR_ERR(job);
 			goto out_cleanup_submit_ctx;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index c39e3eb1c15d..9c49b1aef759 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2480,7 +2480,7 @@ panthor_vm_bind_job_create(struct drm_file *file,
 	kref_init(&job->refcount);
 	job->vm = panthor_vm_get(vm);
 
-	ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm);
+	ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm, file->client_id);
 	if (ret)
 		goto err_put_job;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 77b184c3fb0c..b81c428bf66c 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3672,7 +3672,8 @@ struct panthor_vm *panthor_job_vm(struct drm_sched_job *sched_job)
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
 		   u16 group_handle,
-		   const struct drm_panthor_queue_submit *qsubmit)
+		   const struct drm_panthor_queue_submit *qsubmit,
+		   u64 drm_client_id)
 {
 	struct panthor_group_pool *gpool = pfile->groups;
 	struct panthor_job *job;
@@ -3744,7 +3745,7 @@ panthor_job_create(struct panthor_file *pfile,
 
 	ret = drm_sched_job_init(&job->base,
 				 &job->group->queues[job->queue_idx]->entity,
-				 credits, job->group);
+				 credits, job->group, drm_client_id);
 	if (ret)
 		goto err_put_job;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 5ae6b4bde7c5..d80c040ebf13 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -28,7 +28,8 @@ int panthor_group_get_state(struct panthor_file *pfile,
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
 		   u16 group_handle,
-		   const struct drm_panthor_queue_submit *qsubmit);
+		   const struct drm_panthor_queue_submit *qsubmit,
+		   u64 drm_client_id);
 struct drm_sched_job *panthor_job_get(struct drm_sched_job *job);
 struct panthor_vm *panthor_job_vm(struct drm_sched_job *sched_job);
 void panthor_job_put(struct drm_sched_job *job);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 0f35f009b9d3..41c3d596603c 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -204,7 +204,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 EXPORT_SYMBOL(to_drm_sched_fence);
 
 struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
-					      void *owner)
+					      void *owner,
+					      u64 drm_client_id)
 {
 	struct drm_sched_fence *fence = NULL;
 
@@ -213,6 +214,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 		return NULL;
 
 	fence->owner = owner;
+	fence->drm_client_id = drm_client_id;
 	spin_lock_init(&fence->lock);
 
 	return fence;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 57da84908752..ad306d3d7282 100644
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
index 4ff5de46fb22..5171ffe9012d 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -169,7 +169,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->file = file_priv;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
-				 1, v3d_priv);
+				 1, v3d_priv, file_priv->client_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 1905ca590965..f4679cb9a56b 100644
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
index 95e17504e46a..7982ca8d7ca5 100644
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
+	 * The client_id of the drm_file which owns the job.
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
+		       u64 drm_client_id);
 void drm_sched_job_arm(struct drm_sched_job *job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
@@ -624,7 +632,7 @@ bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
 
 struct drm_sched_fence *drm_sched_fence_alloc(
-	struct drm_sched_entity *s_entity, void *owner);
+	struct drm_sched_entity *s_entity, void *owner, u64 drm_client_id);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity);
 void drm_sched_fence_free(struct drm_sched_fence *fence);
-- 
2.47.1

