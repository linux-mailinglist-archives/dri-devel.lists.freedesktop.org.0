Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4582C3788
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 04:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314C06E81B;
	Wed, 25 Nov 2020 03:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41D16E7EC;
 Wed, 25 Nov 2020 03:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkAPHxmXI/MgSMCShRBptL8y7dofJ3VT0WYTzGNdrfr/wrMTAggwg71xnCSOWuvyG10k7W7msTxyd4rcpL1/8o7EKAORYh4Egiq0BhWk9Rda6b/DQq1Pl0hPR7RF7hVBSIDiCGedtIDndeB7i5jbIFNQa1VDIqi3QMFfWTkcsj+QgjRrbjonqiMY7CubVKVX/1w0HkFUQJAJBR4gn8bMRKU3sq0VDexu70Cz2mvRwSI0bkKrYzhrIxqTbSs++6pE75/c3WXbp/1qheEuNS5PkRcaM9Q1CjQ67QrIqWZQZE+1VZEoHXWMYpJ8Yv6ddH1mo/IAVMaHx8jLj6N/0V0VTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK9B1RgW0c3dITZaNhimDGn7iGj1C9W7UwE96V4f4Po=;
 b=mSEJ/mC07RU7VVcShE/kkny1kuH58dUIiSg5X2+uEHnhZu+WMg3gFLGzOMai4cXZZ48oCvcFeZgd02j+OxWSrGMcehv8e49YROeFApShWNRC44g/4vQaGUjRZClwRuD9aiCF788KEw86pzCCay2ysegdcbTiXCkdnibgpxZo8hhCGoogLhMkNgRfB+9PTUwruoEPOu+G1WVLa8Rdn8fGTl47cKkJzkwSFzqQJH+gQGPqEU6T18e9eBMceSg2EtWFXu1iPZXkphFFf5Mm1n0mg2/b07MqNtjTj0XMXR/s8xYLsrKvX2PHm79yDKbmXRcuC538Cn36pkP+xOOHhC92Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK9B1RgW0c3dITZaNhimDGn7iGj1C9W7UwE96V4f4Po=;
 b=kgmn+y8ehUctPR4f5dd1iEHobhD/STStZF03EY4eO/LDhUnOWo6GesBkO9vsZXINP4X9oyIVDON5xeldxXtltVIdQImj9KM+z8QVjC9zyyEzA+t9nMWZ+g4qgcNEfhlSBj3FFEQfbuWJozUKKI/XNIG0L4EEKuWqitHVnOdSUyo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2507.namprd12.prod.outlook.com (2603:10b6:3:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Wed, 25 Nov
 2020 03:17:24 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3589.031; Wed, 25 Nov 2020
 03:17:24 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH 4/6] drm/scheduler: Essentialize the job done callback
Date: Tue, 24 Nov 2020 22:17:06 -0500
Message-Id: <20201125031708.6433-5-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.154.g7f7ebe054a
In-Reply-To: <20201125031708.6433-1-luben.tuikov@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: CH2PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:610:59::36) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 CH2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:59::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 03:17:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe9b4bd3-04b1-4de6-ea0a-08d890f0a145
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2507E219A5D7FC066097765599FA0@DM5PR1201MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kE/EoMTFwUXcaBdOboeJ/KSj1xXjKGCz/rJe0mynVT//WeUi17Od4wJGX1kGDNRiTHUpDsZJ0e3JdbptlpK3pOzBY6/sGOqHFqE1skfE9soCSdkEqBOZykaIOcnbdvZLjUmekzT6UI8xA191P1k9/ekhFgaYAxHHkfic4BBax8WiJ6UMmD7XVP6FcsopiC9LhIIRmKFiatqSQRxOchyhZ6UhiTO139/E/1X7W6IlvIUtIQhLPW+N6ldVXXpboEuRWIcodkq/nR31PQLikgZ2spMfYtsiyuLshQ/7qWRYcEqHUEGVbPHfvusMVG4NGDF3BIk57Og5PDJANXBQhD2GZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(7696005)(6486002)(54906003)(478600001)(26005)(52116002)(8936002)(83380400001)(8676002)(86362001)(2616005)(6636002)(5660300002)(956004)(1076003)(4326008)(2906002)(44832011)(186003)(66946007)(110136005)(316002)(36756003)(66476007)(16526019)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: bTbhno35keX06D46MF1G5qZcBxXi+V7I/9B/06VGYdNAJfRx3may4tCm/VWCAZ0ZjHfOMz6OIXjIk/JFUd1SRgIFinqdB4S0mVH4oy5tw1sPnVSjVEY5ICg311/R4Dl5zrxunEWLIOF5RkNh/zi7udoHUibLi8p48+sl5q56MF1nSqFmuM6ctm1xvlcPpOcRIhcE0T/GlbLD0ZDwW7wjeUMcSsacPc+3B8On6mgD6L7s7V1xNHfF3BaPiQ2GYWR9LPb2YXoGAsHuh1Agg0Cv+evY4KPEHpH9SjGO5qNQRdX1eZqUQ9C2vS9vBHoZYGU0AAVpfI/FtaA3N7QQxQsJizDKIoSYs97sAmV22ThE8nZ9oNUnFg4VnC2EyBcgt7Wa24rMMGrdrHh+/AJkWUfcOq7TYIxrI97jQmW2N5vJLk2+ObP/ErqX78Dx4OGfkb2aWU3QAOM+MRUhoPMGPmv9euZ1ZwL95z5UGKoeEkgC3S+ddzAyRo4KzIuJ1cd7OJZ4Y7ZtOYkMulAf8mdB/UgBKKbGe4lzrIE8RgZl3ldKk/TaFY9xW6P1UD3Dh799w73lFhI6tyXvBoDCHWkXWtJ2CdscaEY1AJKwdqYeyzr43ZLnTgj8py2xabydirmziVxnj2np57K3uZuvqTEH6nxuWY84d9irGxzDdNqKAxlQRfDDS8cnQO+L0IZM00vHWjAMUxitI4z7VxR/j0AUS0lJ8VF/6D24NSsXV4jWrZE6kXy8BH5Gwgf2Q0iYIZLXX8Op0bTqcjtYMZ1ektZpeH//67U+YlL2LMfxty3QPjVstHAfax5JqZx9cO1OKs92PPsgLsfj5D+KcZqi85nNuRit/GapenCVlsjxGqxkQclaeQH5WV+jTUP6JxB7k1qpPLh0kx5SVZxMEa7pTVvTlMcIrw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9b4bd3-04b1-4de6-ea0a-08d890f0a145
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 03:17:24.6738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCrxRhoIQNAlpjMlgqDIsDvxzQEk4ZoRJue4n2ESjj/0O4yaA0h1KGAXDHoPx3PS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2507
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
Cc: Emily Deng <Emily.Deng@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The job done callback is called from various
places, in two ways: in job done role, and
as a fence callback role.

Essentialize the callback to an atom
function to just complete the job,
and into a second function as a prototype
of fence callback which calls to complete
the job.

This is used in latter patches by the completion
code.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 73 ++++++++++++++------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b694df12aaba..3eb7618a627d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -60,8 +60,6 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-static void drm_sched_process_job(struct dma_fence *f, struct dma_fence_cb *cb);
-
 /**
  * drm_sched_rq_init - initialize a given run queue struct
  *
@@ -162,6 +160,40 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
 	return NULL;
 }
 
+/**
+ * drm_sched_job_done - complete a job
+ * @s_job: pointer to the job which is done
+ *
+ * Finish the job's fence and wake up the worker thread.
+ */
+static void drm_sched_job_done(struct drm_sched_job *s_job)
+{
+	struct drm_sched_fence *s_fence = s_job->s_fence;
+	struct drm_gpu_scheduler *sched = s_fence->sched;
+
+	atomic_dec(&sched->hw_rq_count);
+	atomic_dec(&sched->score);
+
+	trace_drm_sched_process_job(s_fence);
+
+	dma_fence_get(&s_fence->finished);
+	drm_sched_fence_finished(s_fence);
+	dma_fence_put(&s_fence->finished);
+	wake_up_interruptible(&sched->wake_up_worker);
+}
+
+/**
+ * drm_sched_job_done_cb - the callback for a done job
+ * @f: fence
+ * @cb: fence callbacks
+ */
+static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+{
+	struct drm_sched_job *s_job = container_of(cb, struct drm_sched_job, cb);
+
+	drm_sched_job_done(s_job);
+}
+
 /**
  * drm_sched_dependency_optimized
  *
@@ -473,14 +505,14 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 
 		if (fence) {
 			r = dma_fence_add_callback(fence, &s_job->cb,
-						   drm_sched_process_job);
+						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
-				drm_sched_process_job(fence, &s_job->cb);
+				drm_sched_job_done(s_job);
 			else if (r)
 				DRM_ERROR("fence add callback failed (%d)\n",
 					  r);
 		} else
-			drm_sched_process_job(NULL, &s_job->cb);
+			drm_sched_job_done(s_job);
 	}
 
 	if (full_recovery) {
@@ -635,31 +667,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	return entity;
 }
 
-/**
- * drm_sched_process_job - process a job
- *
- * @f: fence
- * @cb: fence callbacks
- *
- * Called after job has finished execution.
- */
-static void drm_sched_process_job(struct dma_fence *f, struct dma_fence_cb *cb)
-{
-	struct drm_sched_job *s_job = container_of(cb, struct drm_sched_job, cb);
-	struct drm_sched_fence *s_fence = s_job->s_fence;
-	struct drm_gpu_scheduler *sched = s_fence->sched;
-
-	atomic_dec(&sched->hw_rq_count);
-	atomic_dec(&sched->score);
-
-	trace_drm_sched_process_job(s_fence);
-
-	dma_fence_get(&s_fence->finished);
-	drm_sched_fence_finished(s_fence);
-	dma_fence_put(&s_fence->finished);
-	wake_up_interruptible(&sched->wake_up_worker);
-}
-
 /**
  * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
  *
@@ -809,9 +816,9 @@ static int drm_sched_main(void *param)
 		if (!IS_ERR_OR_NULL(fence)) {
 			s_fence->parent = dma_fence_get(fence);
 			r = dma_fence_add_callback(fence, &sched_job->cb,
-						   drm_sched_process_job);
+						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
-				drm_sched_process_job(fence, &sched_job->cb);
+				drm_sched_job_done(sched_job);
 			else if (r)
 				DRM_ERROR("fence add callback failed (%d)\n",
 					  r);
@@ -820,7 +827,7 @@ static int drm_sched_main(void *param)
 			if (IS_ERR(fence))
 				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
 
-			drm_sched_process_job(NULL, &sched_job->cb);
+			drm_sched_job_done(sched_job);
 		}
 
 		wake_up(&sched->job_scheduled);
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
