Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC750603171
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 19:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA12110EFAF;
	Tue, 18 Oct 2022 17:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925E110EFA3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 17:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlhRQ0NimhVcHcv+a4rxKNRpvZqR6dqd2YTMDo+a0NN3KdNjufoSifrebcykEKUD11OwJPBtW8BUgCGDZV98II5U4eS+vFoySF6RePSmaWmnN6P1RiY4MUEVJ7Wn70gZaE459vzXbx5aPKAruBzBEM77AjqRLg6jd7fzvuWpxXt2FzXKlU75V80udxex5axvUzq0iFrUw0Xy/VPJh3jr9bOoERfdcR8bLUudyavBGfQmuH03tXf5+p85PkxU8k8bM1N1+X73ms0seniX30ZAzm+vKj2JsQKd7OngrnYgSz/67b+TgDU5JjpZwdJ/Zvc5cfBfxemKNSfWsNnyF6mF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQuOej4xx8hZg2PS/umZ1UgoBkvh+3xVyLfm/jwKjbk=;
 b=oBbivN0Tvf/pd2poNjTRJ9fdBOZp9a13GSvrU4kqHBbzqklg//SVnAgsiEjgoXI0aAFb/CwmlY6RjDrAC5Lg1ObzzBZaop615cuM77pM+acUCnyeuRhwIVICbq5TgrNw8HdN7+n177gf8OdkJbFP7fZvwUjmt4iOUkUw50KKmohjpiFiPDdr5xFwljFFzHWEiaF+NQPdY97xF68WwgLK74VNzGsWUHCTX2Er923MyS+dnhIbOEJQkUDpwT2TRCI25+O5Tlz6mw2eiszrSQ8lu4akEf45BD1eBfzB9jeOTFbLSyiQKBEa/PCcTv0psLt1z3muCoHI1Fa7WUftoWXIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQuOej4xx8hZg2PS/umZ1UgoBkvh+3xVyLfm/jwKjbk=;
 b=ieTA1+eY1Mfy/CJyiHG80OII5UEdwcMnvV5CIO80QRm6t1a5vXQo827U0BEAF6CNdk7HcHHBTgySHh4etame1DnqG6/Ty5ZgzK3M0aQC/lkgkGWR4PVL8KhVxBRbXnvvGPMpUCYFTnbS0bJCMqt/ddJ589z+uxrtb7etBBS/CM0=
Received: from BN9PR03CA0103.namprd03.prod.outlook.com (2603:10b6:408:fd::18)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 17:17:29 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::7c) by BN9PR03CA0103.outlook.office365.com
 (2603:10b6:408:fd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Tue, 18 Oct 2022 17:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 18 Oct 2022 17:17:29 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 12:17:24 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <steven.price@arm.com>
Subject: [PATCH v4] drm/sched: Fix kernel NULL pointer dereference error
Date: Tue, 18 Oct 2022 22:46:52 +0530
Message-ID: <20221018171652.589004-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT008:EE_|MN2PR12MB4319:EE_
X-MS-Office365-Filtering-Correlation-Id: b8eaf065-bc8c-426b-34ce-08dab12ca2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZIcV0+6Q7Yik5gioKypPwamu29bgnpe/wL1k8b40I5VdSRDb0EmEp2Dw4hh3zhF8oYtylrVj3RUwgj4z7l3N1G0cFopdIedWpylcQ+pzkOr1wKoVovaHWWorH6FZLOOfCHCnl8El1udSucSAhJd73N9MW+xMg//FXHn9BM47oSQFizYBIC5BUGzfzm8u6vxF62tQTFqioU1lP3U2BwNV/gkZuQlFB2iks3Je1+oI0nTi7Lah2ryqAt9PdCliXl4/Ryhcm4z9ynqbrqe4GFfvZnmiJOytCZBChRrDKY/9I38F1SBdRFwWCLn0xlW1W3VdCqMkSN33gqLYdT2DxAr3MKF/M6/Pmbz+5JUE4N0LvA3Dglalqk+1GGklNXtN2Snx6gJ5vWGDSFX48oCe4ONhaIeahJJP0g1hwk6/d14SFoinxBYyBYzOPKohsc5S0oTmmhRsxpmFToGYS/0Kn6Q8YRN6Ou9vNde+cQjeRiShnG38dUJ0Y+U5Dc9BcENBy/f61rFp2J0NIm7TSVicOhPxuS2FXeaKIOCTzXfNakIkzGktkfPIYSNZUtO7T2TS86+MA51+uoSPYmZpnVZw2AHhzvCDGNlAvtX/MbLw75+35eSJGemQ4jHRb159dLdAcWQliAMgo6U3DFCmXqtXqAvVZN14dRilqWUCuYATF+UBKWCTXF5eSOaOq3lCzdwJuCPCsCi0p6SUaBbxXGoJbJpPDW7AT72x7KGMXis9ctYv0TWSkDsWUniLtUau6R51F4DaFxvGJD7e5WqGYDzY92eyTQ15C9IkEJ5qR5OPbIYaxFJI5GhF0hxYXkiw7p8GO8mY/4ZXZ3r7XUjNrgttbh8HfXYsLMqxiLKz5m7PZK+ZUk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(86362001)(82310400005)(81166007)(47076005)(36860700001)(82740400003)(336012)(186003)(426003)(83380400001)(16526019)(1076003)(8676002)(70206006)(70586007)(2616005)(26005)(7696005)(6666004)(356005)(110136005)(478600001)(316002)(921005)(40480700001)(4326008)(36756003)(2906002)(8936002)(5660300002)(40460700003)(41300700001)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 17:17:29.4698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8eaf065-bc8c-426b-34ce-08dab12ca2d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-This is purely a timing issue. Here, sometimes Job free
is happening before the job is done.
To fix this issue moving 'dma_fence_cb' callback from
job(struct drm_sched_job) to scheduler fence (struct drm_sched_fence).

-Added drm_sched_fence_set_parent() and drm_sched_fence_clear_parent()
functions to move fence handling into sched_fence.c and this just cleanup.

BUG: kernel NULL pointer dereference, address: 0000000000000088
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0
 Oops: 0000 [#1] PREEMPT SMP NOPTI
 CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.0.0-rc2-custom #1
 Hardware name: AMD Dibbler/Dibbler, BIOS RDB1107CC 09/26/2018
 RIP: 0010:drm_sched_job_done.isra.0+0x11/0x140 [gpu_sched]
 Code: 8b fe ff ff be 03 00 00 00 e8 7b da b7 e3 e9 d4 fe ff ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 <48> 8b 9f 88 00 00 00 f0 ff 8b f0 00 00 00 48 8b 83 80 01 00 00 f0
 RSP: 0018:ffffb1b1801d4d38 EFLAGS: 00010087
 RAX: ffffffffc0aa48b0 RBX: ffffb1b1801d4d70 RCX: 0000000000000018
 RDX: 000036c70afb7c1d RSI: ffff8a45ca413c60 RDI: 0000000000000000
 RBP: ffffb1b1801d4d50 R08: 00000000000000b5 R09: 0000000000000000
 R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
 R13: ffffb1b1801d4d70 R14: ffff8a45c4160000 R15: ffff8a45c416a708
 FS:  0000000000000000(0000) GS:ffff8a48a0a80000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000088 CR3: 000000014ad50000 CR4: 00000000003506e0
 Call Trace:
  <IRQ>
  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
  dma_fence_signal_timestamp_locked+0x7e/0x110
  dma_fence_signal+0x31/0x60
  amdgpu_fence_process+0xc4/0x140 [amdgpu]
  gfx_v9_0_eop_irq+0x9d/0xd0 [amdgpu]
  amdgpu_irq_dispatch+0xb7/0x210 [amdgpu]
  amdgpu_ih_process+0x86/0x100 [amdgpu]
  amdgpu_irq_handler+0x24/0x60 [amdgpu]
  __handle_irq_event_percpu+0x4b/0x190
  handle_irq_event_percpu+0x15/0x50
  handle_irq_event+0x39/0x60
  handle_edge_irq+0xaf/0x210
  __common_interrupt+0x6e/0x110
  common_interrupt+0xc1/0xe0
  </IRQ>
  <TASK>

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v2: Moving 'dma_fence_cb' callback from
job(struct drm_sched_job) to scheduler fence(struct drm_sched_fence)
instead of adding NULL check for s_fence.

Changes in v3: Added drm_sched_fence_set_parent() function(and others *_parent_cb)
in sched_fence.c. Moved parent fence intilization and callback
installation into this (this just cleanup).

Changes in v4 : Add drm_sched_fence_clear_parent() function in sched_fence.c.
and done the changes as per review comments. 
---
 drivers/gpu/drm/scheduler/sched_fence.c | 64 +++++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  | 53 ++++----------------
 include/drm/gpu_scheduler.h             | 10 +++-
 3 files changed, 81 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 7fd869520ef2..68343614f9ed 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -78,6 +78,70 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
 		kmem_cache_free(sched_fence_slab, fence);
 }
 
+/**
+ * drm_sched_fence_parent_cb - the callback for a done job
+ * @f: fence
+ * @cb: fence callbacks
+ */
+static void drm_sched_fence_parent_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+{
+	struct drm_sched_fence *s_fence = container_of(cb, struct drm_sched_fence,
+						       cb);
+	struct drm_gpu_scheduler *sched = s_fence->sched;
+
+	atomic_dec(&sched->hw_rq_count);
+	atomic_dec(sched->score);
+
+	dma_fence_get(&s_fence->finished);
+	drm_sched_fence_finished(s_fence);
+	dma_fence_put(&s_fence->finished);
+	wake_up_interruptible(&sched->wake_up_worker);
+}
+
+/**
+ * drm_sched_fence_clear_parent -  Remove callbacks from pending list
+ * @s_fence: pointer to the fence
+ *
+ * Remove callbacks from pending list and clear the parent fence.
+ */
+bool drm_sched_fence_clear_parent(struct drm_sched_fence *s_fence)
+{
+	if (s_fence->parent &&
+	    dma_fence_remove_callback(s_fence->parent, &s_fence->cb)) {
+		dma_fence_put(s_fence->parent);
+		s_fence->parent = NULL;
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * drm_sched_fence_set_parent - set the parent fence and add the callback
+ * @s_fence: pointer to the fence
+ * fence: pointer to the hw fence
+ *
+ * Set the parent fence and install the callback for a done job.
+ */
+void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
+			       struct dma_fence *fence)
+{
+	int r;
+
+	if (s_fence->parent &&
+	    dma_fence_remove_callback(s_fence->parent, &s_fence->cb))
+		dma_fence_put(s_fence->parent);
+
+	/* We keep the reference of the parent fence here. */
+	swap(s_fence->parent, fence);
+	dma_fence_put(fence);
+
+	r = dma_fence_add_callback(s_fence->parent, &s_fence->cb,
+				      drm_sched_fence_parent_cb);
+	if (r == -ENOENT)
+		drm_sched_fence_parent_cb(NULL, &s_fence->cb);
+}
+
 /**
  * drm_sched_fence_free - free up an uninitialized fence
  *
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4cc59bae38dd..30597d9a949f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -253,13 +253,12 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 
 /**
  * drm_sched_job_done - complete a job
- * @s_job: pointer to the job which is done
+ * @s_fence: pointer to the fence of a done job
  *
  * Finish the job's fence and wake up the worker thread.
  */
-static void drm_sched_job_done(struct drm_sched_job *s_job)
+static void drm_sched_job_done(struct drm_sched_fence *s_fence)
 {
-	struct drm_sched_fence *s_fence = s_job->s_fence;
 	struct drm_gpu_scheduler *sched = s_fence->sched;
 
 	atomic_dec(&sched->hw_rq_count);
@@ -273,18 +272,6 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
 	wake_up_interruptible(&sched->wake_up_worker);
 }
 
-/**
- * drm_sched_job_done_cb - the callback for a done job
- * @f: fence
- * @cb: fence callbacks
- */
-static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
-{
-	struct drm_sched_job *s_job = container_of(cb, struct drm_sched_job, cb);
-
-	drm_sched_job_done(s_job);
-}
-
 /**
  * drm_sched_dependency_optimized - test if the dependency can be optimized
  *
@@ -504,11 +491,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	 */
 	list_for_each_entry_safe_reverse(s_job, tmp, &sched->pending_list,
 					 list) {
-		if (s_job->s_fence->parent &&
-		    dma_fence_remove_callback(s_job->s_fence->parent,
-					      &s_job->cb)) {
-			dma_fence_put(s_job->s_fence->parent);
-			s_job->s_fence->parent = NULL;
+		if (drm_sched_fence_clear_parent(s_job->s_fence)) {
 			atomic_dec(&sched->hw_rq_count);
 		} else {
 			/*
@@ -560,7 +543,6 @@ EXPORT_SYMBOL(drm_sched_stop);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 {
 	struct drm_sched_job *s_job, *tmp;
-	int r;
 
 	/*
 	 * Locking the list is not required here as the sched thread is parked
@@ -575,16 +557,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 		if (!full_recovery)
 			continue;
 
-		if (fence) {
-			r = dma_fence_add_callback(fence, &s_job->cb,
-						   drm_sched_job_done_cb);
-			if (r == -ENOENT)
-				drm_sched_job_done(s_job);
-			else if (r)
-				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
-					  r);
-		} else
-			drm_sched_job_done(s_job);
+		if (fence)
+			drm_sched_fence_set_parent(s_job->s_fence, fence);
+		else
+			drm_sched_job_done(s_job->s_fence);
 	}
 
 	if (full_recovery) {
@@ -1008,7 +984,6 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
 static int drm_sched_main(void *param)
 {
 	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
-	int r;
 
 	sched_set_fifo_low(current);
 
@@ -1049,22 +1024,12 @@ static int drm_sched_main(void *param)
 		drm_sched_fence_scheduled(s_fence);
 
 		if (!IS_ERR_OR_NULL(fence)) {
-			s_fence->parent = dma_fence_get(fence);
-			/* Drop for original kref_init of the fence */
-			dma_fence_put(fence);
-
-			r = dma_fence_add_callback(fence, &sched_job->cb,
-						   drm_sched_job_done_cb);
-			if (r == -ENOENT)
-				drm_sched_job_done(sched_job);
-			else if (r)
-				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
-					  r);
+			drm_sched_fence_set_parent(s_fence, fence);
 		} else {
 			if (IS_ERR(fence))
 				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
 
-			drm_sched_job_done(sched_job);
+			drm_sched_job_done(s_fence);
 		}
 
 		wake_up(&sched->job_scheduled);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1f7d9dd1a444..5066729c15ce 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -281,6 +281,10 @@ struct drm_sched_fence {
          * @owner: job owner for debugging
          */
 	void				*owner;
+	/**
+	 * @cb: callback
+	 */
+	struct dma_fence_cb cb;
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
@@ -300,7 +304,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  *         be scheduled further.
  * @s_priority: the priority of the job.
  * @entity: the entity to which this job belongs.
- * @cb: the callback for the parent fence in s_fence.
  *
  * A job is created by the driver using drm_sched_job_init(), and
  * should call drm_sched_entity_push_job() once it wants the scheduler
@@ -325,7 +328,6 @@ struct drm_sched_job {
 	atomic_t			karma;
 	enum drm_sched_priority		s_priority;
 	struct drm_sched_entity         *entity;
-	struct dma_fence_cb		cb;
 	/**
 	 * @dependencies:
 	 *
@@ -559,6 +561,10 @@ void drm_sched_fence_free(struct drm_sched_fence *fence);
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
 void drm_sched_fence_finished(struct drm_sched_fence *fence);
 
+bool drm_sched_fence_clear_parent(struct drm_sched_fence *s_fence);
+void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
+			       struct dma_fence *fence);
+
 unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
 void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
 		                unsigned long remaining);
-- 
2.25.1

