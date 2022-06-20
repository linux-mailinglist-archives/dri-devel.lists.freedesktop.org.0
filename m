Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E615526D3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADEB10F742;
	Mon, 20 Jun 2022 22:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AF210F726;
 Mon, 20 Jun 2022 22:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEwIzRcj02Yu/piScyk71hp/DLOBTQJhj4YE8HMpVSMXo5ZLxNYvsag7OQAQS9zHwA8EIEHjdZGzt528sdBvFZUVQFFvEtwOP98pX8noMNPNbiAn4dCmMV3mzqiYpv5D174yZ9dyg9mXBKAGHHiwgvSopVN3Hbufs4ayFKeMktmKGHfga7DItR7215iRJCCrJ+hrrYc5TUPBhkKi/YGHaJe1/N+zkSpjO1wQqDtb5iONUN5YywYRGdNrr60JBQQexZ5ik764PGZAcEAflYve2yfO1W6OkVTJfa4HmSboSOFzBvd8cgbptiTRfrv1xmEEuzgeuPhz8oN5n7hDHyscQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzdt4BEPk+gnsSjeFHPzJP6h+2XTibMnN3lym82vie8=;
 b=gNdqJ7ofqTwrXwLQdK4IBvbUwwwOxnfyWuAsAklCQiRLKyhh3NzgV46698tnAIpsmjpONm2p3Whz9qH2KFzDBlxzZ1O5qX9lyw23XBtgcgbflQNfVZqtKB8cHPCQKyuFuw9bDlu8Nttv1t5Ap52LndyyXzB9csThlGbI0jXlZp3hu/d25ycTQsX9uOKsU4tkMCy9SOh1pP37BK+HcuElew3L3I4pAlrBqLzduEhwFhQPcl85wYR0jWLoKwzamjIZcaICLT3pEUPG6s6TXDZUfHS6a9d0uID7PngJiwcdtQJvtRRW4Ft283CVjLAZF2xsrNePUwYtjkf+LpKh9tk0Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzdt4BEPk+gnsSjeFHPzJP6h+2XTibMnN3lym82vie8=;
 b=PFOnFfQgABE60jtZ+Y7K95+4f3OXSIDJztzQo9unMBANZf9GqN2O21QDKmI5TdulsRJ962Snm/ho7pNR+qtaHcHsYbSzKG/ncfWw7XkZ9gtacue7/oI39e0aZasFbxKoGKsRdct0ceEiBBhIyvwvxuxSczh0+bzaQTrzKTX+16o=
Received: from MWH0EPF00056D12.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:15) by CH2PR12MB3991.namprd12.prod.outlook.com
 (2603:10b6:610:2f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Mon, 20 Jun
 2022 22:03:43 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::206) by MWH0EPF00056D12.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.3 via Frontend
 Transport; Mon, 20 Jun 2022 22:03:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 22:03:42 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 20 Jun 2022 17:03:41 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/amdgpu: Follow up change to previous drm scheduler
 change.
Date: Mon, 20 Jun 2022 18:03:02 -0400
Message-ID: <20220620220302.86389-6-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07d3f879-6229-46ad-c612-08da5308bd72
X-MS-TrafficTypeDiagnostic: CH2PR12MB3991:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB39915E0A89831A946C0E9275EAB09@CH2PR12MB3991.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFeF6tnmgRZAb8GIjUnMfdkUZykC2/m9evN5zG3SNjVj0zComcz8wth/4PXGdP+1doCv778vzWZtsqNA7b23jiBk676ojFxX7YsiE/nMZ2ZpKNPQVlRKxEuYmHVZDbvsrDe8wtq8F/y35TldzuohtYvrq+G2ZKS383kEzMkPUPyRVCMjyWajNfLpIiUNGKDU0Pq9AS9aHD2AqG53xdmbNkwE9L5mnfuHt7aF6T3mQKtvnv2kC7WzAdAfsvI0WBo4YXMfQbRC9oKui5QvgcoxdKduHVOH/MFJ4grH3v/EgUhMyoNENox1KX9CMo1Gndhn+pf4+QgInZ1xeYrje2UYXZHlJWpdyxgUMzJ7NoWP0+7ImnSZtTL+39Mh2jWsouR9flVtm834b8s2kflM5m2xODhHwAwN8idVQ0IKzBY6k5RNYVwSQZBgwyhLCXvhLbJXu3yDsvS6oFbgMF1UpBoIeq+1eVOK3DSvnqOV82lNPcsY6FZZGYNZqF8iNNcwxkaFyXvAfeQe3OT13uEOBHS5vYyDWw5vO2mILudGSMkEh37zfDYlTH7icB4kCfQkK2uz9bQxsLTuk3WU1ZX3tks+f/JWBsO6UBDVTbC7gzdu2f9emCEgAhzhScp/KyZFkE+2SaULBhPQkmPiBYchQtuAAsmgED+MuI3yegmZN0SJqbl2blmaxdDkqF8fg/G7JbR5WIvWCjgJhI7LbGBRvjnVdzpcWmQRN3nVBCfQRTagOeobP/Ie8TYJVhshPSH5HfTm
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(40470700004)(46966006)(36840700001)(450100002)(7696005)(8676002)(44832011)(4326008)(54906003)(86362001)(110136005)(82740400003)(70586007)(426003)(356005)(70206006)(2906002)(26005)(47076005)(8936002)(5660300002)(186003)(316002)(81166007)(478600001)(6666004)(36860700001)(16526019)(83380400001)(336012)(41300700001)(2616005)(1076003)(36756003)(40460700003)(40480700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 22:03:42.7731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d3f879-6229-46ad-c612-08da5308bd72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3991
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
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Align refcount behaviour for amdgpu_job embedded HW fence with
classic pointer style HW fences by increasing refcount each
time emit is called so amdgpu code doesn't need to make workarounds
using amdgpu_job.job_run_counter to keep the HW fence refcount balanced.

Also since in the previous patch we resumed setting s_fence->parent to NULL
in drm_sched_stop switch to directly checking if job->hw_fence is
signaled to short circuit reset if already signed.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Yiqing Yao <yiqing.yao@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 ++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 513c57f839d8..447bd92c4856 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -684,6 +684,8 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device *adev,
 		goto err_ib_sched;
 	}
 
+	/* Drop the initial kref_init count (see drm_sched_main as example) */
+	dma_fence_put(f);
 	ret = dma_fence_wait(f, false);
 
 err_ib_sched:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c99541685804..f9718119834f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5009,16 +5009,28 @@ static void amdgpu_device_recheck_guilty_jobs(
 
 		/* clear job's guilty and depend the folowing step to decide the real one */
 		drm_sched_reset_karma(s_job);
-		/* for the real bad job, it will be resubmitted twice, adding a dma_fence_get
-		 * to make sure fence is balanced */
-		dma_fence_get(s_job->s_fence->parent);
 		drm_sched_resubmit_jobs_ext(&ring->sched, 1);
 
+		if (!s_job->s_fence->parent) {
+			DRM_WARN("Failed to get a HW fence for job!");
+			continue;
+		}
+
 		ret = dma_fence_wait_timeout(s_job->s_fence->parent, false, ring->sched.timeout);
 		if (ret == 0) { /* timeout */
 			DRM_ERROR("Found the real bad job! ring:%s, job_id:%llx\n",
 						ring->sched.name, s_job->id);
 
+
+			/* Clear this failed job from fence array */
+			amdgpu_fence_driver_clear_job_fences(ring);
+
+			/* Since the job won't signal and we go for
+			 * another resubmit drop this parent pointer
+			 */
+			dma_fence_put(s_job->s_fence->parent);
+			s_job->s_fence->parent = NULL;
+
 			/* set guilty */
 			drm_sched_increase_karma(s_job);
 retry:
@@ -5047,7 +5059,6 @@ static void amdgpu_device_recheck_guilty_jobs(
 
 		/* got the hw fence, signal finished fence */
 		atomic_dec(ring->sched.score);
-		dma_fence_put(s_job->s_fence->parent);
 		dma_fence_get(&s_job->s_fence->finished);
 		dma_fence_signal(&s_job->s_fence->finished);
 		dma_fence_put(&s_job->s_fence->finished);
@@ -5220,8 +5231,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 *
 	 * job->base holds a reference to parent fence
 	 */
-	if (job && job->base.s_fence->parent &&
-	    dma_fence_is_signaled(job->base.s_fence->parent)) {
+	if (job && (job->hw_fence.ops != NULL) &&
+	    dma_fence_is_signaled(&job->hw_fence)) {
 		job_signaled = true;
 		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset");
 		goto skip_hw_reset;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index d6d54ba4c185..9bd4e18212fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -164,11 +164,16 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
 	if (job && job->job_run_counter) {
 		/* reinit seq for resubmitted jobs */
 		fence->seqno = seq;
+		/* TO be inline with external fence creation and other drivers */
+		dma_fence_get(fence);
 	} else {
-		if (job)
+		if (job) {
 			dma_fence_init(fence, &amdgpu_job_fence_ops,
 				       &ring->fence_drv.lock,
 				       adev->fence_context + ring->idx, seq);
+			/* Against remove in amdgpu_job_{free, free_cb} */
+			dma_fence_get(fence);
+		}
 		else
 			dma_fence_init(fence, &amdgpu_fence_ops,
 				       &ring->fence_drv.lock,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 58568fdde2d0..638e1d600258 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -267,10 +267,6 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 			DRM_ERROR("Error scheduling IBs (%d)\n", r);
 	}
 
-	if (!job->job_run_counter)
-		dma_fence_get(fence);
-	else if (finished->error < 0)
-		dma_fence_put(&job->hw_fence);
 	job->job_run_counter++;
 	amdgpu_job_free_resources(job);
 
-- 
2.25.1

