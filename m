Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2D55A089
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFAC10F1CA;
	Fri, 24 Jun 2022 18:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A32610F1C5;
 Fri, 24 Jun 2022 18:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LurBboEQqHGVBNsBj1zp4vxOdVmZVESr7VEM2vag171woMVR2QWEHItpQ4wStin8Drlzj0jORRDuK3kgKW/uy7jykoCU42N3c5mP4KryuFTQYH5R9tFiUbFY/OOKi8m+Ev6xCqAfOC5iCrRDrSJjksmKpJQvm6keafTc03kKQI4ASPRPQsozHWF5BObu3J/NipjrK3R+zdlnn6WyQdxqVQoBexNN/ofRjqEoheDbPFE3FJFIcdVny2tI+n3SeSpowGxu8FUJv7sOrpxCH4blqLV7ufXLVqyvVOqgoTJPfSQeliZzPESEvY2CfwTbbssYhlnYmshnGppkF3ZVZW1uzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys8WptTgTLEzcQMQDDGD7nbKgC1bBH7DDMXSFt8eWUc=;
 b=CjfjtvS6DCerYxQivg5LXJVcOaMzZYqeRKnI94NSOsV3wSuzJ3exkafJds4yo8lhNUdAICDXso/bu8KdA9E3LkdrOWxfE/XBxo65udChInQVquat/xxy4v3+34l73sSY0QYRMzw0oYqyff97Monzs15YFMGQoDR2hIpqWvx+bLpE98i6oD+HkDPye5yq+Hx8c42bLbdRF19V73gyaeHJZa2ReVunllqc++MWkQKKSD+/dhWN6R8FXjnw4Aa5moRcQqmFPPgh22Inqvh1Rd9iIEapV5b25CfPzfzgaiWoUzZceoYdyeVU30hNLhFdBEi9GHug0mDyCZvsBpYcOdNctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys8WptTgTLEzcQMQDDGD7nbKgC1bBH7DDMXSFt8eWUc=;
 b=qmVGTQIj72aJXWdncwUCjZj0exSr5BBJG9PfPKCvy34oa1JDZWd6hV34svbIYF3BmfqdW55XH8hmopJEjuElynVTXdQBcV02HLC34bG0x/2++TrO0R7NDx5Hce6AIRUyzGJkfiex99csdkqnFZdmGUxzpOG5XSL1ypL6smCiiMs=
Received: from MWHPR04CA0052.namprd04.prod.outlook.com (2603:10b6:300:6c::14)
 by CH2PR12MB4890.namprd12.prod.outlook.com (2603:10b6:610:63::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 18:10:13 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::f5) by MWHPR04CA0052.outlook.office365.com
 (2603:10b6:300:6c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 18:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 18:10:12 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 24 Jun 2022 13:10:10 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/sched: Partial revert of 'drm/sched: Keep
 s_fence->parent pointer'
Date: Fri, 24 Jun 2022 14:09:54 -0400
Message-ID: <20220624180955.485440-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624180955.485440-1-andrey.grodzovsky@amd.com>
References: <20220624180955.485440-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7598136-4b7c-46a2-b26d-08da560cc89d
X-MS-TrafficTypeDiagnostic: CH2PR12MB4890:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wgnMWp55vdpQ7XbVvyu4Lxi881EGxGh2n52mtxU04xTsXE0IOVScdoFoZ+vHdm0MNWD9DssGrH2c37Sb1jA3FtmkI0LOgkKOCgCU5vJL+aCI+uE+Jm93OJQyazliA/jVOX8tsT8/PNAQX1J0ouRjnuZKehOlW7JAGE6GcNaMb+7WPwA2rtpc6mvw5tuOZ/HkYEBOaT6ou44W04XNgScl/x0Z9ugJV5452QbO5IrGqtuavB6+VHxCUvznyHtUiSZtdgx5tNNK82f9r8XJ0amzBTjxDu2cNkVyFE0rfJba4kr2DkcRZQ/1avuxtAeJ0mit3RKPyHvR5yOOkiNDx5QG+FLO40sU5brhA1lUJBb7guwE6t1TT8rcTnUSbf0YYHMhIshh8f+7RL+pg3Qlf38cLoj08Wcm7ASUqVOW+3Pp52pJQBPUXT+t1HJYXEfejxu5ME4G4JMwMKMkZ4P8LcGxOPQQsugn9Ko2xq7mrsi7t1WhbfDM8GHjWBvVOhSSPA+/1DX87xKL8CfaqkdfmyHcpzchVeOY455pJtspmcXHmGxiZ+y59RH9nM0HQvSannGzlL0+0uTSIQZ4D6MZ+Bm3FyBGpp9yALKGIbV5B9DYDki7pJP0nyR+9YE/J8JgDDqdooqMlg2tvLdFxKjnJuuuWLurrWnSqZ8csXcd2UepNPpf6LBVsLcMTBkjtVqMjWzZpMWnSe+s52AR9VETzlefLTSrpgKPVmFXiwLbelr92yhOi0TaL/W1tTqMIJgFe8m2Qm3AvrGCNmz5C1NxtVu5cY3LjafsoCZ7vXc/DykNUwrDxlm5yFdyZrY8Fntnwh0/D8FmqnRh80S2624JIA/Yoao21KF2TetGfQBtmfUWk8M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(26005)(6666004)(40460700003)(1076003)(186003)(7696005)(81166007)(16526019)(36756003)(40480700001)(8936002)(2906002)(44832011)(54906003)(966005)(82740400003)(86362001)(70586007)(478600001)(5660300002)(356005)(82310400005)(83380400001)(70206006)(450100002)(336012)(426003)(110136005)(41300700001)(47076005)(4326008)(2616005)(36860700001)(8676002)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 18:10:12.8752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7598136-4b7c-46a2-b26d-08da560cc89d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4890
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 Yiqing Yao <yiqing.yao@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem:
This patch caused negative refcount as described in [1] because
for that case parent fence did not signal by the time of drm_sched_stop and hence
kept in pending list the assumption was they will not signal and
so fence was put to account for the s_fence->parent refcount but for
amdgpu which has embedded HW fence (always same parent fence)
drm_sched_fence_release_scheduled was always called and would
still drop the count for parent fence once more. For jobs that
never signaled this imbalance was masked by refcount bug in
amdgpu_fence_driver_clear_job_fences that would not drop
refcount on the fences that were removed from fence drive
fences array (against prevois insertion into the array in
get in amdgpu_fence_emit).

Fix:
Revert this patch and by setting s_job->s_fence->parent to NULL
as before prevent the extra refcount drop in amdgpu when
drm_sched_fence_release_scheduled is called on job release.

Also - align behaviour in drm_sched_resubmit_jobs_ext with that of
drm_sched_main when submitting jobs - take a refcount for the
new parent fence pointer and drop refcount for original kref_init
for new HW fence creation (or fake new HW fence in amdgpu - see next patch).

[1] - https://lore.kernel.org/all/731b7ff1-3cc9-e314-df2a-7c51b76d4db0@amd.com/t/#r00c728fcc069b1276642c325bfa9d82bf8fa21a3

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Yiqing Yao <yiqing.yao@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b81fceb0b8a2..c5437ee03e3f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -419,6 +419,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 		if (s_job->s_fence->parent &&
 		    dma_fence_remove_callback(s_job->s_fence->parent,
 					      &s_job->cb)) {
+			dma_fence_put(s_job->s_fence->parent);
+			s_job->s_fence->parent = NULL;
 			atomic_dec(&sched->hw_rq_count);
 		} else {
 			/*
@@ -548,7 +550,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
 		if (found_guilty && s_job->s_fence->scheduled.context == guilty_context)
 			dma_fence_set_error(&s_fence->finished, -ECANCELED);
 
-		dma_fence_put(s_job->s_fence->parent);
 		fence = sched->ops->run_job(s_job);
 		i++;
 
@@ -558,7 +559,11 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
 
 			s_job->s_fence->parent = NULL;
 		} else {
-			s_job->s_fence->parent = fence;
+
+			s_job->s_fence->parent = dma_fence_get(fence);
+
+			/* Drop for orignal kref_init */
+			dma_fence_put(fence);
 		}
 	}
 }
@@ -952,6 +957,9 @@ static int drm_sched_main(void *param)
 
 		if (!IS_ERR_OR_NULL(fence)) {
 			s_fence->parent = dma_fence_get(fence);
+			/* Drop for original kref_init of the fence */
+			dma_fence_put(fence);
+
 			r = dma_fence_add_callback(fence, &sched_job->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
@@ -959,7 +967,6 @@ static int drm_sched_main(void *param)
 			else if (r)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
-			dma_fence_put(fence);
 		} else {
 			if (IS_ERR(fence))
 				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
-- 
2.25.1

