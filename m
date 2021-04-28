Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92B36DB04
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8038F6EB81;
	Wed, 28 Apr 2021 15:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B45D6EB6A;
 Wed, 28 Apr 2021 15:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5Z0uMQbTRtePddYkO6WMB86uVFbgOhBP2FDITkxdufktCnHeFwfZAXqfrinV1aay99SRvQY9jZJkSzLCUtQaUo1CiwgNzpZWZ5HPSMEtQulrIBcyOi1vY2+UjXaphR8RNIAEd7RtOd2WHjTroh4Harml0UQqNZY7fhyX3Ii2MOFci2Iao3qBcADJzZng+z65c6BNMTU1/o94KVy89SHTBi8yPV/ydYwWm+e4pP+XvF99IuG0v7UeQmm2tiSJbbVY//HHfg/I/zeWMus9EDymfAAOi9qGV1FIqmjirpBMVjqaDRgNxy6zu3kjqrJxGJ39Ggtifz5VdOsWKAeQvG+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn3AGqPGds9oe9uOfZ6FOO+wQivsFIH6NDom/ibc5IE=;
 b=mWsfPxoQoWr8qdmmVWk3/Gfhev0WLhMbPT5ITNKylRJPOsAgrWaxspTA7PDJyg6YmzyOp7/Y4Z5jDzdC0beXKtx/d0G+6lZRKUBZ9mZaMUpxFOeEFeLI0WUb90rDI9Aeg0IMYA7gAaRvA5Ayx+g77C/mSVH5Oxl2JtUJy/nl4YH0i2+Eeeeey42RIkOdTO2JXVDKEZFBOeL/HcmuIxBGyhxDZnPCvsGGm1vs00X/XQ8jpZqfztN4InTKT3BaDswf/o0N0FNs1L7mXcyaqZN7XiLDQ2epiAPchBpF1Wc6IFAt6Y2Ym095fk9clowor0nD5fNnZN/K9gZ7hCDM/0PKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn3AGqPGds9oe9uOfZ6FOO+wQivsFIH6NDom/ibc5IE=;
 b=0dAgA8TGJuDmsmq6kyA7hcrDzjM0aCAJufcQn0PXhBryu3WaPefFLy93bK4TKsywD30wA/h5nYFAjsnxlRu51beXoHq+WQc3R8xv2n4Dg9Bxpse2fQBSVkCW5+5iQmRLv8YxHHyXcJpWY9+M9TGE4YBtp/80pYn/GevGySF1cLA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:03 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:03 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 17/27] drm/amdgpu: Add rw_sem to pushing job into sched
 queue
Date: Wed, 28 Apr 2021 11:11:57 -0400
Message-Id: <20210428151207.1212258-18-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a63f8626-3a48-4742-3ec6-08d90a581e3f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2749374677E7A06FD938B588EA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7l5YAYjm5kmhrtW+IVtyoaOR4risks/vJtYoGpjqMh6Zlow0VSg/+PgdTUbBKR29kJowSIkOkEMct7QOLzlPhs1oZK7WllU/FPTYcDshRPZA/n+wLPybyBeowtJmKIcY8pIb+ilW6F35B71w4f9UiQSHBFzAaCOCEmdcFMRrrZnKMrA9oMuUnUZmU7sUAF5EMWTAIpQpFlFuxOFfe6QsDZ2FjReO2IddoEayCtv5kpXPLPeYxtSIRHbyF3zjx+F5pf5Ed3/wtdrsES9jd04SnkVbXOyZr525pTSuHGoVObVmuvvpKTe3szzrjvrPw3SgMguNj1OdQlNl6HWQD2c8gxN1Mky931Gbyj1UeLY7r17j7IiWdt7zq/DvxOHHIRsVSOrdwNvaYR9oS3mH8jCAT9R1+Hro2n0ZqCUvG2Bidjhc57vw1F8Fk9QyOIDic78gal1xuWvQH7QI172Ge6eufBfrtVit+LC+zRwx9HjZV1fc0hWKtjrbOxqjvWHwno6DJklKqNpFB4vHNuV+3glmKDXZCcGORL+RR9dXEkpDFFAph/grshtrwqRx1gT6cpmCcc46PHgxv4UTjLUlgfJj7MzF7adttTye+VDRLfaFsuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8CYk9gjDU+kSOAaaQFY8AZVzbe+YXuysFSO9khckNLe6Q9qBQvn97qt7Dgb7?=
 =?us-ascii?Q?3WRocjccZu59KWIhq82cbRHlMntJQ4xtTMhmqI7+qs9JNRUJhhA6K8Yp7K1U?=
 =?us-ascii?Q?YODUFayWoVw6Z24uqc4x7GQBgHFuue1r3vxq46V4GTiahRU/zUtmVKxX0ecR?=
 =?us-ascii?Q?18rPCiwRtPejbyIRtJ7AMdCoLROSGh+SoHMZ1a0DS/IFlwlNDqQa4RYRaUzU?=
 =?us-ascii?Q?KfXs65suy8KkhsQBUoWONMZM5IFBjCtEkdQ2IpiENolzH2z54RkjjB5YFt53?=
 =?us-ascii?Q?9Y3FMTbFQUA7RpQLTj43l1kHgNsAomtQnDTjq/HAj08SKGPRmi2CA9TLF28C?=
 =?us-ascii?Q?B3KKPGeoOuFDwhma/8H6AsNBnX418Mq2NYER0zY937Y4pMec68GGYpcJGOji?=
 =?us-ascii?Q?/Pz/HjEhJTUeT4gosSfUnsdQ9i2iY49uKUr84XS4xjT2uiK/UFLVgRx/ASuw?=
 =?us-ascii?Q?XmKTY6UHj6LNDAVtlZe55cJRmr8qxxSTygdcCmmv5vbE8X/StEE1p3wbX0GL?=
 =?us-ascii?Q?gVQ2MGtX2rvXGQz/e76R041IzAt2LJIiyCZhTJ2xZyzqEEMNy3iSvuonYrB0?=
 =?us-ascii?Q?cqfAhWEU6CoxtG/8uGG6fSGiFxUBCF4Jm5SC9ota9qvKrzuqdXOuUbUQyOQy?=
 =?us-ascii?Q?UUbI4TxoAGzEbHftPtoEqOftRuXUePMieh22etRNL1GYNKXjuawCNNK+w46X?=
 =?us-ascii?Q?Ocy8E+eJqIoQ4CplB3b+GkIilye4kmhjo09GNEk28rC43qJZ6oupcq/s8ElI?=
 =?us-ascii?Q?mTh8JeahD6MkmaVKXOPt92PNxfPaazi7e6ac6DF05enUCbWzlXGueyuzqE79?=
 =?us-ascii?Q?jtflZUSN1cVApO/r94BMA70LO2qWyq9rZRXLt88KvyCYrBSGAZIfY4QnMmP+?=
 =?us-ascii?Q?lIXV9iyXKSmIWUL+GZwfHtEjAzg6sdszQB1S90qevgERXfeBgjCRi5i2cq1S?=
 =?us-ascii?Q?uMPGcRBKGcavOVY5/Xd02ss451mQp0Byt0aQszlL0xd+vMzP/LuRfjbEroEs?=
 =?us-ascii?Q?Ie/8NDaFhl/XrhVf1EQuZB/KHJq1mtnYlHULffpR72LEGp446qctBJSWMKTG?=
 =?us-ascii?Q?g70z/cWkwq0ZAnsrKhV8OenMNGRElFn832sPCBsewA+yiHwF+zDvrKdu32V7?=
 =?us-ascii?Q?qcuGfL4+kaLc69Ong/3rXU441HMqlk7FG86Twkl0vnWTR0RKppIINeEpybbj?=
 =?us-ascii?Q?0vKdKHQ/gYNNByGiOgNbrkKoZ52UpV+UZH31qYEVrVQQERmbaxO2W+rQ0rs1?=
 =?us-ascii?Q?aeCHnxJ4V6QRDQxE4SQUvQPhwsgBKMZ7mrZgbNPVlpmSvPcmoDZgf9KwS+nk?=
 =?us-ascii?Q?gWT4TIPSGMQa34M7tquuV7fKCukJCFkqj9U0HpS2QEKBzPb/ZCev9obl+liq?=
 =?us-ascii?Q?yfieytqjK3F2pJfUWzjcjskyca+f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63f8626-3a48-4742-3ec6-08d90a581e3f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:03.1496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKKA31mltqhi5ipxv2/6dFBy9acbHfbaBH3v6ck2xqxsoVJvwctthCey66N/Ec63GXkUIrXnS7vQk54TbXW2Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Will be later used block further submissions once device is
removed. Also complete schedule fence if scheduling failed
due to submission blocking.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 13 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 14 +++++++++++++-
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 3e4755fc10c8..0db0ba4fba89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1057,6 +1057,9 @@ struct amdgpu_device {
 
 	struct list_head                device_bo_list;
 
+	bool				stop_job_submissions;
+	struct rw_semaphore		sched_fence_completion_sem;
+
 	/* List of all MMIO BOs */
 	struct list_head                mmio_list;
 	struct mutex                    mmio_list_lock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 3e240b952e79..ac092a5eb4e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1256,7 +1256,18 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	trace_amdgpu_cs_ioctl(job);
 	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
-	drm_sched_entity_push_job(&job->base, entity);
+
+	down_read(&p->adev->sched_fence_completion_sem);
+	if (!p->adev->stop_job_submissions) {
+		drm_sched_entity_push_job(&job->base, entity);
+	} else {
+		dma_fence_set_error(&job->base.s_fence->scheduled, -ENODEV);
+		dma_fence_set_error(&job->base.s_fence->finished, -ENODEV);
+		dma_fence_signal(&job->base.s_fence->scheduled);
+		dma_fence_signal(&job->base.s_fence->finished);
+	}
+
+	up_read(&p->adev->sched_fence_completion_sem);
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3ddad6cba62d..33e8e9e1d1fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3302,6 +3302,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	init_rwsem(&adev->reset_sem);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
+	init_rwsem(&adev->sched_fence_completion_sem);
 
 	r = amdgpu_device_check_arguments(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index d33e6d97cc89..26d8b79ea165 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -162,6 +162,7 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 		      void *owner, struct dma_fence **f)
 {
 	int r;
+	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
 
 	if (!f)
 		return -EINVAL;
@@ -172,7 +173,18 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 
 	*f = dma_fence_get(&job->base.s_fence->finished);
 	amdgpu_job_free_resources(job);
-	drm_sched_entity_push_job(&job->base, entity);
+
+	down_read(&ring->adev->sched_fence_completion_sem);
+	if (!ring->adev->stop_job_submissions) {
+		drm_sched_entity_push_job(&job->base, entity);
+	} else {
+		dma_fence_set_error(&job->base.s_fence->scheduled, -ENODEV);
+		dma_fence_set_error(&job->base.s_fence->finished, -ENODEV);
+		dma_fence_signal(&job->base.s_fence->scheduled);
+		dma_fence_signal(&job->base.s_fence->finished);
+
+	}
+	up_read(&ring->adev->sched_fence_completion_sem);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
