Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0D245068
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 04:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A916EC5D;
	Sat, 15 Aug 2020 02:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7A6EC5B;
 Sat, 15 Aug 2020 02:49:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZLYxpZ5Kw7pw/jCYW44IbMJk4QbX4IlztXbRF/UIj4QMv9Dz0yOvaECvspRjOXAxcEl/Y+FBDX37xPYA+W9YymKBYTL8KIx6zcjUHstUJxka6YLCg/PdLSpzg5Kkt63/wQORlb1as8kb9LXvpLf1CozRYqH+iuMCH+4pPhFAMED+ApkxCNxSPu02TjwIHDSHB4pnsX7XyHHBGtFFazag1KmriA0BPzVE8NjwUvJxBxp7/lDIE68hWHnk8T9QCpfCYB/tLbQYlBQv9UC4lUzmZG1txSPtnY9TqyLqUUko+xCceYiwdqnhGfnA7/9gNL88m3NSMxT3zrUAAdcAkb2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W8Ct9GXt14bPuZu2sfYQl7GDxDSoGI6qecuTzwk5NE=;
 b=I0KL5hhS/odGzYXfx6EnCGfJk73h94KJkq6NmP/3yLXtuP1MbeElASTGs2pxG/rYPEkXYsjl+2mI/RzzQMJuTz7ehcNLJIyDyP4gISj6j0mK5cQtYyKuwxnwaFbgSGpj9mr2CJPjgLrd1jlOteyn7WC40jCWCVhTZct0egoDEclcNISAkNlIHKi4YM6gzO4PCs5LltuQE8FFb5A9FiJE1mmodQLut4tqJFNgzk+xi5NKCRUNllaZysicyLxwzw2xSKWBbhSpi1sWlsKmZGgyI+9FjBdpZ4OIMWcsMjvIMa+INlP/gZgTjxIos3kBHmx1WA/i2gxjfX5ciBqyCGDMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W8Ct9GXt14bPuZu2sfYQl7GDxDSoGI6qecuTzwk5NE=;
 b=tDaqqzIk9jmZG9MJ09906Eyb/2WKz1StgSnt3H5XzaHIGiDyHnJvYJ+MmYriNBxjP/ZblUpqBiBovABTxkDa0EUoxnhvYtgxcNYkZiBnrrmtUKSnZC5LaFdRdgpYDm7TiFJVGJovFI4jHpWDlEz3V/VaZkblYNKkMaTR8SmOMAo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2620.namprd12.prod.outlook.com (2603:10b6:5:42::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Sat, 15 Aug
 2020 02:49:10 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3283.015; Sat, 15 Aug 2020
 02:49:10 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/scheduler: Scheduler priority fixes (v2)
Date: Fri, 14 Aug 2020 22:48:51 -0400
Message-Id: <20200815024852.4355-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.215.g878e727637
In-Reply-To: <20200815024852.4355-1-luben.tuikov@amd.com>
References: <20200815024852.4355-1-luben.tuikov@amd.com>
X-ClientProxiedBy: YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::49) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Sat, 15 Aug 2020 02:49:09 +0000
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69e3759f-f447-498d-48d0-08d840c5c8d6
X-MS-TrafficTypeDiagnostic: DM6PR12MB2620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2620907D5136626DB0C9C86D99410@DM6PR12MB2620.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQxhd2EJfCAQkHVP74xhqPPQNpL4LkUOebadKoUVD5KR/ddpsRh5JykmfeEX42AYxdLDmM/AEYBsUQ4vGKgG2fE0mpQMqVNzqLVjpH64QGKtqJM6tM/iMe/mhyJtWWsu/+Qbf5PN5xGm1ItxeXI402tLkMRbzZB58w4lobHCb+4DBpImoP/i43l9qotGhcl1UoMRdqDaGe94wLQDtDcQKeTZQvyhx5JbA1L4kxSJv3r274/r5e3rBV8KkmCffLMVvAiEyQ3Tq+Kq4WddwPEkeTv9E6lILM6DzwSDhuOBsaT16PWYxbjmXgb+g961zHr62NpmxICaHD61S0phj2v3vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(8676002)(2906002)(7696005)(52116002)(66476007)(26005)(8936002)(6486002)(66556008)(66946007)(6666004)(2616005)(83380400001)(54906003)(16526019)(44832011)(5660300002)(4326008)(36756003)(316002)(956004)(86362001)(1076003)(450100002)(186003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: suNgOPIYuRHiuHrhOIKmCBSTu2n7ez6IwmCOD8RnjtHiVDkSNriSkQN3eD3GAsEcerrT9bAnnLm18FLwuYqpDTWNG+ipQXdeYexy3gE1tEhWjXTERC2t8jlsYVX0G2DSd/TWRr1m6joxNqO0A2/WkAZDwgg6dCBsuF/QWpnk4TNtaexHrXohnSvxAn/NrK0ohBf6Aaa3BuWPSEoVFBu+qknnohmG+wQoKxaNVnIDY7xrBPIi1lCGwU2jVxyPqviB81r5ge3w3PrZmla8MuJ3nO/AjvutUy8zoKYmEyYKiHF3P4C5q4ZnD2ir+PdvhdyHfeMLTgnFxxhFqXlfF0e+c9xtlx/Q8laxF1N2RVPhVeUQ5AijTBiB9blAKau9s3G2dIrDVNFMDOfB4CDbMDNPwHGo7gbmJUlZ/3Pvs6tnEQOIGTltz7UQut4JuZcAz1JqXLz4rKHIvD/0q8CMig8hkCakQPYkBDXrX4kvjCbWRkpFxh+BLFgAUk6WKAINewFLDo7iMofyvWXl/Ib3IGMSrqokR0h6gOh1r4EiA45fzobV0bCG5W6/5rJHhRqwpwD2j6eTywYfBKwNLhBpBQPuUJQq5p4E0RK7dqYh76btEzCVuGkUYb7KMmsfThcFaaJlC5S+M1HcyzrXx5fp3UC41Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e3759f-f447-498d-48d0-08d840c5c8d6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2020 02:49:10.1333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVnOASw4D74BIKWkx+Pru2EQepIcQWWCSFA92TUHjZYxgcFPIYBrIlyWeIeJgrus
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2620
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove DRM_SCHED_PRIORITY_LOW, as it was used
in only one place.

Rename and separate by a line
DRM_SCHED_PRIORITY_MAX to DRM_SCHED_PRIORITY_COUNT
as it represents a (total) count of said
priorities and it is used as such in loops
throughout the code. (0-based indexing is the
the count number.)

Remove redundant word HIGH in priority names,
and rename *KERNEL* to *HIGH*, as it really
means that, high.

v2: Add back KERNEL and remove SW and HW,
    in lieu of a single HIGH between NORMAL and KERNEL.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c    |  4 ++--
 include/drm/gpu_scheduler.h               | 12 +++++++-----
 8 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index d85d13f7a043..68eaa4f687a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -46,7 +46,7 @@ const unsigned int amdgpu_ctx_num_entities[AMDGPU_HW_IP_NUM] = {
 static int amdgpu_ctx_priority_permit(struct drm_file *filp,
 				      enum drm_sched_priority priority)
 {
-	if (priority < 0 || priority >= DRM_SCHED_PRIORITY_MAX)
+	if (priority < 0 || priority >= DRM_SCHED_PRIORITY_COUNT)
 		return -EINVAL;
 
 	/* NORMAL and below are accessible by everyone */
@@ -65,7 +65,7 @@ static int amdgpu_ctx_priority_permit(struct drm_file *filp,
 static enum gfx_pipe_priority amdgpu_ctx_sched_prio_to_compute_prio(enum drm_sched_priority prio)
 {
 	switch (prio) {
-	case DRM_SCHED_PRIORITY_HIGH_HW:
+	case DRM_SCHED_PRIORITY_HIGH:
 	case DRM_SCHED_PRIORITY_KERNEL:
 		return AMDGPU_GFX_PIPE_PRIO_HIGH;
 	default:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 75d37dfb51aa..bb9e5481ff3c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -251,7 +251,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = DRM_SCHED_PRIORITY_MAX - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
 
 		if (!rq)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 13ea8ebc421c..6d4fc79bf84a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -267,7 +267,7 @@ int amdgpu_ring_init(struct amdgpu_device *adev, struct amdgpu_ring *ring,
 			&ring->sched;
 	}
 
-	for (i = 0; i < DRM_SCHED_PRIORITY_MAX; ++i)
+	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; ++i)
 		atomic_set(&ring->num_jobs[i], 0);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index da871d84b742..7112137689db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -243,7 +243,7 @@ struct amdgpu_ring {
 	bool			has_compute_vm_bug;
 	bool			no_scheduler;
 
-	atomic_t		num_jobs[DRM_SCHED_PRIORITY_MAX];
+	atomic_t		num_jobs[DRM_SCHED_PRIORITY_COUNT];
 	struct mutex		priority_mutex;
 	/* protected by priority_mutex */
 	int			priority;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
index c799691dfa84..17661ede9488 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
@@ -36,14 +36,14 @@ enum drm_sched_priority amdgpu_to_sched_priority(int amdgpu_priority)
 {
 	switch (amdgpu_priority) {
 	case AMDGPU_CTX_PRIORITY_VERY_HIGH:
-		return DRM_SCHED_PRIORITY_HIGH_HW;
+		return DRM_SCHED_PRIORITY_HIGH;
 	case AMDGPU_CTX_PRIORITY_HIGH:
-		return DRM_SCHED_PRIORITY_HIGH_SW;
+		return DRM_SCHED_PRIORITY_HIGH;
 	case AMDGPU_CTX_PRIORITY_NORMAL:
 		return DRM_SCHED_PRIORITY_NORMAL;
 	case AMDGPU_CTX_PRIORITY_LOW:
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
-		return DRM_SCHED_PRIORITY_LOW;
+		return DRM_SCHED_PRIORITY_MIN;
 	case AMDGPU_CTX_PRIORITY_UNSET:
 		return DRM_SCHED_PRIORITY_UNSET;
 	default:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 20fa0497aaa4..60e2d3267ae5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2114,7 +2114,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
 		r = drm_sched_entity_init(&adev->mman.entity,
-				          DRM_SCHED_PRIORITY_KERNEL, &sched,
+					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
 		if (r) {
 			DRM_ERROR("Failed setting up TTM BO move entity (%d)\n",
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2f319102ae9f..19f381e5e661 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -623,7 +623,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 		return NULL;
 
 	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = DRM_SCHED_PRIORITY_MAX - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
 		if (entity)
 			break;
@@ -851,7 +851,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->name = name;
 	sched->timeout = timeout;
 	sched->hang_limit = hang_limit;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_MAX; i++)
+	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
 	init_waitqueue_head(&sched->wake_up_worker);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 26b04ff62676..ed998464ded4 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -33,14 +33,16 @@
 struct drm_gpu_scheduler;
 struct drm_sched_rq;
 
+/* These are often used as an (initial) index
+ * to an array, and as such should start at 0.
+ */
 enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_MIN,
-	DRM_SCHED_PRIORITY_LOW = DRM_SCHED_PRIORITY_MIN,
 	DRM_SCHED_PRIORITY_NORMAL,
-	DRM_SCHED_PRIORITY_HIGH_SW,
-	DRM_SCHED_PRIORITY_HIGH_HW,
+	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
-	DRM_SCHED_PRIORITY_MAX,
+
+	DRM_SCHED_PRIORITY_COUNT,
 	DRM_SCHED_PRIORITY_INVALID = -1,
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
@@ -273,7 +275,7 @@ struct drm_gpu_scheduler {
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
-	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_MAX];
+	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
 	wait_queue_head_t		wake_up_worker;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
-- 
2.28.0.215.g878e727637

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
