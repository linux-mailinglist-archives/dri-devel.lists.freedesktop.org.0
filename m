Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19355A08D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBA110F213;
	Fri, 24 Jun 2022 18:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5583610F1C3;
 Fri, 24 Jun 2022 18:10:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UztVdY/udmI1e7l8GUrm7r5lLXpm2MhHumUUjrQoWAqX8v9YPDZrNn3sNNEGWCYJQ910rumuH2tbjRH2g0m5HS/qFVAy5OgXBIT6wNlnO5O0Uw9jqTilIhs/w65Jmj4znV+PZXhwBBldeUhW/x341s4fNwdXJ3BFdKX8Qpi4SUW6ecvnjZclBjs2o4NSzW9l1Ttqaoth1RL1zXS35h6LZyve9tW63rh1ArcAMkC03hl2Wj9W4/QARxywGLcK14EQUFxt6tqTd9l6YwWJc+qCow6TwVz/sGNT7gSvj88PEOLFKi4TO6MAt4kVNSg4O4p3lxyvM4ii7TDYxS4Lx6Cx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cee1+a8SOnoQSEgNU3BZFzRDgxCmEACdaJ4BP9DgMdw=;
 b=IkDzd5SXn2OafFqiQUvhgCHxC4sTei29zYGzOhRGuSM5ovPfjYTt+o+C5HVRTH55r3n/m7/pKp9YfNLxnG6IQcvDNWc67GEPi00RHHjTFmgCoDC58qXZzteztQSeQdbL7vdJQq97eWWxE27nofR+ClFywhUzzgXcJSPJAB1otg77ln/3syGoOGGbiH0B1Uvq1HgDDslbKG2qwQZhWTpy/2tC/Vd88PJUmOt28dNXr5MPagCatKHmzDHDVWDNKSZAmoiGQZ1QufoNX7VyfZLcUiR95mV7x7Lme8WQXb0BYj+Wz4s72OktgKCBBpwgYBsY6uMKLSUXTdaCCDaXD0AYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cee1+a8SOnoQSEgNU3BZFzRDgxCmEACdaJ4BP9DgMdw=;
 b=tPTfArMVTT55g+AnvTzvuLs5YWdBCMH8Mc69qbqcH+KDjo7OBQ1tDT8uksZ3klTzrzxdzYC4eEnFxSMw+Vzuxu/1GDLqO1cZvuRykdJvvGP+jaF1usUFDAx+Owhiyv0/4ocPDhYMyEFs/yM5pJ9uKUN8jRHibrUrlBEl3CgMtK4=
Received: from MWHPR04CA0064.namprd04.prod.outlook.com (2603:10b6:300:6c::26)
 by IA1PR12MB6433.namprd12.prod.outlook.com (2603:10b6:208:3af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 24 Jun
 2022 18:10:15 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::e2) by MWHPR04CA0064.outlook.office365.com
 (2603:10b6:300:6c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 24 Jun 2022 18:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 18:10:14 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 24 Jun 2022 13:10:11 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/4] drm/amdgpu: Follow up change to previous drm scheduler
 change.
Date: Fri, 24 Jun 2022 14:09:55 -0400
Message-ID: <20220624180955.485440-5-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 659ff76b-2737-4fc3-16ee-08da560cc9ab
X-MS-TrafficTypeDiagnostic: IA1PR12MB6433:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aO9EOWFI8w/s4sK0x9Y1lIpR6S8tzjwK9fTXZRBJdbmldp97kEyGmybfEChZ9UjrfeQnI67SFAwsaaDRCOWHnS3R2aKdldLX3fUxfI770IrnzY5iXGFE//cHJcLwvvAFhG+BmmcHn7Ol+qQn9aH0prexd7luBQH3X3dP+X1gULd2Cd63TxfWNFu6uurvCBvn8amtW8KLrWkYZcaRwZz9+XMFbHzQSko8pXbGYT0zyxYHNcWuw2clZLleM9IYgpRmSKOKSojiy8QKfSi28n23cp27AQA/vIM+BMdtHEPiJNXwhgxajdUZtCDSni6K3v2dmwuVFd0X+V2UZfWa3yGJHHyWs97GL7fuQhKHrxnLuDoWvFmK97kSk4b06bYr4+DzpnJxe3FZsC59+WXxzdijHAOFKEI8rbAbhxPbHNxjAwZq9RuSd24d7+/fdp6VqyTsMA9er0RVvX8Tzpazwg/4UHS6Xjb/NEkny8rgOE55TFCDU0sRr6OTYVMpaOq6hhXs2ZIHVVqBZMBT8m2Kn4dWsoljVVB7nG52R9jzYuOhIwm2rtB+4B4HPWUIe8k4a6W4OYuxHK85aVD4/PxEDOz7ssIenRv+Y//XQrPFp68df5M0OAlllEG9ryB8fsnE6kUR9z1TNB447iOPbU33M6h7AC4fr4lWgu0Ic9GUMrSmVMQVyfQaigjy8wz9vnh8Yvio3saXOFz87U7j+dUYSvt62i73TjX7wXUq4SivIsLewbPyiiZq8h9hVlrN2kgyVcaoIG/M3FVsBIqh63A9oG3gU8wQcaWsehaYD8xBlliqGwfphJ8UTJRtA1oiu8fI1lhHSeGC0AApdlX7faEGrhgV9g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(36840700001)(40470700004)(46966006)(6666004)(356005)(86362001)(70586007)(478600001)(47076005)(336012)(316002)(82740400003)(54906003)(81166007)(36860700001)(41300700001)(2616005)(26005)(7696005)(426003)(186003)(4326008)(16526019)(450100002)(40460700003)(83380400001)(36756003)(1076003)(44832011)(8936002)(40480700001)(110136005)(2906002)(8676002)(82310400005)(5660300002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 18:10:14.6407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 659ff76b-2737-4fc3-16ee-08da560cc9ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6433
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 27 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 44da025502ac..567597469a8a 100644
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
index 03519d58e630..a2c268d48edd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5009,16 +5009,32 @@ static void amdgpu_device_recheck_guilty_jobs(
 
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
+			amdgpu_fence_driver_isr_toggle(adev, true);
+
+			/* Clear this failed job from fence array */
+			amdgpu_fence_driver_clear_job_fences(ring);
+
+			amdgpu_fence_driver_isr_toggle(adev, false);
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
@@ -5047,7 +5063,6 @@ static void amdgpu_device_recheck_guilty_jobs(
 
 		/* got the hw fence, signal finished fence */
 		atomic_dec(ring->sched.score);
-		dma_fence_put(s_job->s_fence->parent);
 		dma_fence_get(&s_job->s_fence->finished);
 		dma_fence_signal(&s_job->s_fence->finished);
 		dma_fence_put(&s_job->s_fence->finished);
@@ -5220,8 +5235,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
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
index c1d04ea3c67f..39597ab807d1 100644
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
index 10aa073600d4..df437b3a58e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -263,10 +263,6 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
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

