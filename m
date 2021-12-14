Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096AD474149
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 12:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AA510E432;
	Tue, 14 Dec 2021 11:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BC210E424;
 Tue, 14 Dec 2021 11:16:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn9BbaEIQpS3oB9DAnxBu/w9tktIrgH3zYe12KlQ+hpNAjc0yM63WpV5z8fJa2c96Cd+CPG4A+SF2nO2W+HWbM6v2aQcT6hNjegpEmiHcQtIo1mw4hy36/9IzOAac8SAcjOrdiPN+r05tvslZEFDHyQQKQichMqod6gsLOf1noOFBayH8CUTyCgvCGlt2JyDFGOf2V2ImDfk9v79LkVH3soMSKt05GwFyxlxGgEEISYBX7NzFIdI3SBqjcVCjLOKWShUZmNy1YHWK0O7sbC3qKkhFXZTilLUkpmJGhAIm7mjJDxJDIePKfeq6eVq4eWXeBqZCjiSgcDUcsAILyHYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+8zOgWmMcEXlpbqWL4l9NeYgXdH9veqjLXgMjNVmIE=;
 b=MXAbuaeUsuayPbPu6686o1GGaio1a1e3Bf9FhYawxxH0B9r8f8g9njmB19oNN6HWBlxGG0NmU8MPMtyIjsU5LFHqvpE4KDu24oeFv/LaJ/CLlM80T+7nvmEjxvj38Hrq/FltlWNq4tFWpTbIbiWlvJ+U/ofX7Aj8qRm459s6aHNlj8rQDnfzMfrWRFTsvkASe9UuDI+LBmpu0q82OBBkMixsekkY8vsLOHC4uBAu0ZFLrxhkVjQC8RgUGXtoRfy/WT59Auh200UiwPi0hrOdGKiF/wJntgXovwsyNwlPQei9NzLDUeUpFxhgBaBpqdQtXWM0SHXamVv8psAsqH1YdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+8zOgWmMcEXlpbqWL4l9NeYgXdH9veqjLXgMjNVmIE=;
 b=OJ7xiB09hL9QUJOx9TPI87P1naqBiNJRIo0LvdmaCgeXFqcjH8redxAsKLLD/FEwR79JC4yh7VuvH6yXXWGveGK3okdJWhJ3wa+e1zZPAvhC8kFTXlgz3EVzG7MGLSNoBoy2KYZOuJYYN+G+c9YB+U65kYtxZPx+OVxcqpW0L9E=
Received: from DM6PR11CA0055.namprd11.prod.outlook.com (2603:10b6:5:14c::32)
 by BL1PR12MB5077.namprd12.prod.outlook.com (2603:10b6:208:310::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Tue, 14 Dec
 2021 11:16:19 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::4a) by DM6PR11CA0055.outlook.office365.com
 (2603:10b6:5:14c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Tue, 14 Dec 2021 11:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Tue, 14 Dec 2021 11:16:18 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 05:16:15 -0600
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>
Subject: [PATCH v2] drm/amdgpu: introduce new amdgpu_fence object to indicate
 the job embedded fence
Date: Tue, 14 Dec 2021 19:15:54 +0800
Message-ID: <20211214111554.2672812-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccd80ad5-0e02-4c81-a23a-08d9bef326f6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5077:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5077EAD2D8BFC478CA7C5AD0EC759@BL1PR12MB5077.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9HmvcL1QNSxz3ZXNF9Ev3fGw7Dc1CG8XY2qxJ1BEJ98vnOM0Elfba0VJYgpyaV6zGJrG9+rNW2i5Yc4q9nKbk251Fn5A8QxBJvKc0fJfz0I1XtiGTYYITiT0iD9AB7Niwr6wtqPdSN/UQJeYBxI8+Ww3u0/FVJNpl13NqzdwuVjiWoLAnAwq+EkJkoDoCcFs/mBIdWOiPxy4tTNRjofaXvhSgr0Ut+nlHC5TQtVmbcjEVOKZOmrqIICtoWM85J9arRkKAKKpdyMKZReA6BY9KyT0k4bfMQUjfQLHPL6WkoWRD2nEZZkPhrJjqJZyMgjrgIv73TaaK2ym9UE4RGPt20WXQjcVwA6Kc+fXPgxPaNpONnD2nnecEh77uGhTt7UmYCEwPHJKH65/vz51hnh6lUsNgc8LZvh/9d0e5dpnXD4mIbVwptyL8rfRH59l0VdbvvtbL7qpipSj7tfrYNrxZdkjLOvxdlg2BMt7wrJSQD0fusOdnq0QpegdPNz1zbMAvrmo1e76V+8BIDkEoYOg4xBUc2nykEHrB9IArg0gvThAkR2k9Sjh7IfEjOl7SjpyHxK2sUoDJKBDBHSn0bSyQg3a0lCWvj8hVOzIfXLvTxltsf/0QAK81AHgO/J/oKZUMO6HHx5ypb7aWP1tdA+Hb88c11rzsjbAgHtNU/ELhDAv4QEJt48X2pg6kQVQfJGKHzD+cJHTKJXKxqQj0tsX3McJN+DfQdamX3L8AJLlBag6imbxI1lih4e75Kds/kZlWZHiDpaj3wEbwxMcM1B4EbPOH3zturAQqxIG7oU4qMk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(82310400004)(70206006)(86362001)(4326008)(508600001)(54906003)(36860700001)(40460700001)(2906002)(70586007)(426003)(47076005)(316002)(6666004)(8936002)(356005)(8676002)(26005)(83380400001)(336012)(186003)(7696005)(1076003)(5660300002)(36756003)(110136005)(2616005)(81166007)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:16:18.8882 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd80ad5-0e02-4c81-a23a-08d9bef326f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5077
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The job embedded fence donesn't initialize the flags at
dma_fence_init(). Then we will go a wrong way in
amdgpu_fence_get_timeline_name callback and trigger a null pointer panic
once we enabled the trace event here. So introduce new amdgpu_fence
object to indicate the job embedded fence.

[  156.131790] BUG: kernel NULL pointer dereference, address: 00000000000002a0
[  156.131804] #PF: supervisor read access in kernel mode
[  156.131811] #PF: error_code(0x0000) - not-present page
[  156.131817] PGD 0 P4D 0
[  156.131824] Oops: 0000 [#1] PREEMPT SMP PTI
[  156.131832] CPU: 6 PID: 1404 Comm: sdma0 Tainted: G           OE     5.16.0-rc1-custom #1
[  156.131842] Hardware name: Gigabyte Technology Co., Ltd. Z170XP-SLI/Z170XP-SLI-CF, BIOS F20 11/04/2016
[  156.131848] RIP: 0010:strlen+0x0/0x20
[  156.131859] Code: 89 c0 c3 0f 1f 80 00 00 00 00 48 01 fe eb 0f 0f b6 07 38 d0 74 10 48 83 c7 01 84 c0 74 05 48 39 f7 75 ec 31 c0 c3 48 89 f8 c3 <80> 3f 00 74 10 48 89 f8 48 83 c0 01 80 38 00 75 f7 48 29 f8 c3 31
[  156.131872] RSP: 0018:ffff9bd0018dbcf8 EFLAGS: 00010206
[  156.131880] RAX: 00000000000002a0 RBX: ffff8d0305ef01b0 RCX: 000000000000000b
[  156.131888] RDX: ffff8d03772ab924 RSI: ffff8d0305ef01b0 RDI: 00000000000002a0
[  156.131895] RBP: ffff9bd0018dbd60 R08: ffff8d03002094d0 R09: 0000000000000000
[  156.131901] R10: 000000000000005e R11: 0000000000000065 R12: ffff8d03002094d0
[  156.131907] R13: 000000000000001f R14: 0000000000070018 R15: 0000000000000007
[  156.131914] FS:  0000000000000000(0000) GS:ffff8d062ed80000(0000) knlGS:0000000000000000
[  156.131923] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  156.131929] CR2: 00000000000002a0 CR3: 000000001120a005 CR4: 00000000003706e0
[  156.131937] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  156.131942] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  156.131949] Call Trace:
[  156.131953]  <TASK>
[  156.131957]  ? trace_event_raw_event_dma_fence+0xcc/0x200
[  156.131973]  ? ring_buffer_unlock_commit+0x23/0x130
[  156.131982]  dma_fence_init+0x92/0xb0
[  156.131993]  amdgpu_fence_emit+0x10d/0x2b0 [amdgpu]
[  156.132302]  amdgpu_ib_schedule+0x2f9/0x580 [amdgpu]
[  156.132586]  amdgpu_job_run+0xed/0x220 [amdgpu]

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 117 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 -
 4 files changed, 80 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9f017663ac50..fcaf6e9703f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -444,6 +444,7 @@ struct amdgpu_sa_bo {
 
 int amdgpu_fence_slab_init(void);
 void amdgpu_fence_slab_fini(void);
+bool is_job_embedded_fence(struct dma_fence *f);
 
 /*
  * IRQS.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5625f7736e37..444a19eb2248 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4483,9 +4483,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 
 			ptr = &ring->fence_drv.fences[j];
 			old = rcu_dereference_protected(*ptr, 1);
-			if (old && test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &old->flags)) {
+			if (old && is_job_embedded_fence(old))
 				RCU_INIT_POINTER(*ptr, NULL);
-			}
 		}
 		/* after all hw jobs are reset, hw fence is meaningless, so force_completion */
 		amdgpu_fence_driver_force_completion(ring);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 3b7e86ea7167..3a81249b5660 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -77,16 +77,28 @@ void amdgpu_fence_slab_fini(void)
  * Cast helper
  */
 static const struct dma_fence_ops amdgpu_fence_ops;
+static const struct dma_fence_ops amdgpu_job_fence_ops;
 static inline struct amdgpu_fence *to_amdgpu_fence(struct dma_fence *f)
 {
 	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
 
-	if (__f->base.ops == &amdgpu_fence_ops)
+	if (__f->base.ops == &amdgpu_fence_ops ||
+	    __f->base.ops == &amdgpu_job_fence_ops)
 		return __f;
 
 	return NULL;
 }
 
+bool is_job_embedded_fence(struct dma_fence *f)
+{
+	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
+
+	if (__f->base.ops == &amdgpu_job_fence_ops)
+		return true;
+
+	return false;
+}
+
 /**
  * amdgpu_fence_write - write a fence value
  *
@@ -158,19 +170,18 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
 	}
 
 	seq = ++ring->fence_drv.sync_seq;
-	if (job != NULL && job->job_run_counter) {
+	if (job && job->job_run_counter) {
 		/* reinit seq for resubmitted jobs */
 		fence->seqno = seq;
 	} else {
-		dma_fence_init(fence, &amdgpu_fence_ops,
-				&ring->fence_drv.lock,
-				adev->fence_context + ring->idx,
-				seq);
-	}
-
-	if (job != NULL) {
-		/* mark this fence has a parent job */
-		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
+		if (job)
+			dma_fence_init(fence, &amdgpu_job_fence_ops,
+				       &ring->fence_drv.lock,
+				       adev->fence_context + ring->idx, seq);
+		else
+			dma_fence_init(fence, &amdgpu_fence_ops,
+				       &ring->fence_drv.lock,
+				       adev->fence_context + ring->idx, seq);
 	}
 
 	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
@@ -643,16 +654,14 @@ static const char *amdgpu_fence_get_driver_name(struct dma_fence *fence)
 
 static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
 {
-	struct amdgpu_ring *ring;
+	return (const char *)to_amdgpu_fence(f)->ring->name;
+}
 
-	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
-		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
+static const char *amdgpu_job_fence_get_timeline_name(struct dma_fence *f)
+{
+	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
 
-		ring = to_amdgpu_ring(job->base.sched);
-	} else {
-		ring = to_amdgpu_fence(f)->ring;
-	}
-	return (const char *)ring->name;
+	return (const char *)to_amdgpu_ring(job->base.sched)->name;
 }
 
 /**
@@ -665,18 +674,25 @@ static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
  */
 static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
 {
-	struct amdgpu_ring *ring;
+	if (!timer_pending(&to_amdgpu_fence(f)->ring->fence_drv.fallback_timer))
+		amdgpu_fence_schedule_fallback(to_amdgpu_fence(f)->ring);
 
-	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
-		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
+	return true;
+}
 
-		ring = to_amdgpu_ring(job->base.sched);
-	} else {
-		ring = to_amdgpu_fence(f)->ring;
-	}
+/**
+ * amdgpu_job_fence_enable_signaling - enable signalling on job fence
+ * @f: fence
+ *
+ * This is the simliar function with amdgpu_fence_enable_signaling above, it
+ * only handles the job embedded fence.
+ */
+static bool amdgpu_job_fence_enable_signaling(struct dma_fence *f)
+{
+	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
 
-	if (!timer_pending(&ring->fence_drv.fallback_timer))
-		amdgpu_fence_schedule_fallback(ring);
+	if (!timer_pending(&to_amdgpu_ring(job->base.sched)->fence_drv.fallback_timer))
+		amdgpu_fence_schedule_fallback(to_amdgpu_ring(job->base.sched));
 
 	return true;
 }
@@ -692,19 +708,23 @@ static void amdgpu_fence_free(struct rcu_head *rcu)
 {
 	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
 
-	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
-	/* free job if fence has a parent job */
-		struct amdgpu_job *job;
-
-		job = container_of(f, struct amdgpu_job, hw_fence);
-		kfree(job);
-	} else {
 	/* free fence_slab if it's separated fence*/
-		struct amdgpu_fence *fence;
+	kmem_cache_free(amdgpu_fence_slab, to_amdgpu_fence(f));
+}
 
-		fence = to_amdgpu_fence(f);
-		kmem_cache_free(amdgpu_fence_slab, fence);
-	}
+/**
+ * amdgpu_job_fence_free - free up the job with embedded fence
+ *
+ * @rcu: RCU callback head
+ *
+ * Free up the job with embedded fence after the RCU grace period.
+ */
+static void amdgpu_job_fence_free(struct rcu_head *rcu)
+{
+	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
+
+	/* free job if fence has a parent job */
+	kfree(container_of(f, struct amdgpu_job, hw_fence));
 }
 
 /**
@@ -720,6 +740,19 @@ static void amdgpu_fence_release(struct dma_fence *f)
 	call_rcu(&f->rcu, amdgpu_fence_free);
 }
 
+/**
+ * amdgpu_job_fence_release - callback that job embedded fence can be freed
+ *
+ * @f: fence
+ *
+ * This is the simliar function with amdgpu_fence_release above, it
+ * only handles the job embedded fence.
+ */
+static void amdgpu_job_fence_release(struct dma_fence *f)
+{
+	call_rcu(&f->rcu, amdgpu_job_fence_free);
+}
+
 static const struct dma_fence_ops amdgpu_fence_ops = {
 	.get_driver_name = amdgpu_fence_get_driver_name,
 	.get_timeline_name = amdgpu_fence_get_timeline_name,
@@ -727,6 +760,12 @@ static const struct dma_fence_ops amdgpu_fence_ops = {
 	.release = amdgpu_fence_release,
 };
 
+static const struct dma_fence_ops amdgpu_job_fence_ops = {
+	.get_driver_name = amdgpu_fence_get_driver_name,
+	.get_timeline_name = amdgpu_job_fence_get_timeline_name,
+	.enable_signaling = amdgpu_job_fence_enable_signaling,
+	.release = amdgpu_job_fence_release,
+};
 
 /*
  * Fence debugfs
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 4d380e79752c..c29554cf6e63 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -53,9 +53,6 @@ enum amdgpu_ring_priority_level {
 #define AMDGPU_FENCE_FLAG_INT           (1 << 1)
 #define AMDGPU_FENCE_FLAG_TC_WB_ONLY    (1 << 2)
 
-/* fence flag bit to indicate the face is embedded in job*/
-#define AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT		(DMA_FENCE_FLAG_USER_BITS + 1)
-
 #define to_amdgpu_ring(s) container_of((s), struct amdgpu_ring, sched)
 
 #define AMDGPU_IB_POOL_SIZE	(1024 * 1024)
-- 
2.25.1

