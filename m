Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AE0472122
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 07:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D10D10EB0B;
	Mon, 13 Dec 2021 06:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77F10E73E;
 Mon, 13 Dec 2021 06:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLL9Vt33lmUaBduJOHAXWCoel/+PubUfZz/qpPmJriNM8lf0CSWnsZYnDYAxjn7FcuO5FVz1F86lB2VBdzzuxrbj0c/N4AWX9SgRs7yPjO8mwF1zUfsfR+vCMjOlXZsssL3EdB2JWPz8tlR5wCSFiVqL5gsCnEK4y+684q6kkdUi2JKGP9C5S8yIJGJWrNB7mdzcnYVrtNeNGwLh3iKHlIN+oe/J++cFcil84VFBlTdDhnu8eyrhm9ewImVcCURRF83vUscEcxHAVU6vuKBFks6KE/k8GNFax7wWU8Fj518Osyce4EZ53vdeke7x88rY8swBka4VO/t7LykUuNY+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm/yAaZNe59INqbvgSewcslMennb8Fsl1HNjUQ1zTV8=;
 b=KalzQ1feHmykFt7z6dQ46J/ZRl8qT4OdJ49/nYt+TW9L3vXb9qekSaeUvLjV11kjgHQ/LD65hUV7FAzFf+CYx3ZaFz478D/I8CPcqOHGIJ1Z21U/sGp115jGmY3fh7I7HoNA6bPdfeEfOJtfHKCHHGMV9ob8cPPP4hVuNH+E3xPuuiJTgmUHc76MI9gCHLcTNJzEPby2KZ4uGxYStZ5+QxBbbLqC7jRDEpdvS3t/323wVY1ZnJ9E+Uo11VqQsZ/J8C8GbeCZvqM/bgnDjCUeNi9W+UMn3xZwWV3kFs22doM4u1ONYwN6aFH5CiGJqiIpkDA2gLB5KvLk9Hc85FMwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm/yAaZNe59INqbvgSewcslMennb8Fsl1HNjUQ1zTV8=;
 b=CRE++l3eLnvyPYGb3zb+pfOZk2UPSS4cjkP0vJ6T5ETmclA+OFM4OrArX1RZ26WsQJdgAbE5LW5xJoKoch7/AVrHB/4t6rq1kaTW+zGBw2pUK6jiOCcggnJQW6o/cE0Jn5eK0HGiXX/97T1Yt7aTpqyRwk8GTFv/EAZeExqGQfA=
Received: from DM5PR21CA0018.namprd21.prod.outlook.com (2603:10b6:3:ac::28) by
 SN1PR12MB2511.namprd12.prod.outlook.com (2603:10b6:802:23::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16; Mon, 13 Dec 2021 06:35:02 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::6f) by DM5PR21CA0018.outlook.office365.com
 (2603:10b6:3:ac::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.5 via Frontend
 Transport; Mon, 13 Dec 2021 06:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Mon, 13 Dec 2021 06:35:02 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 00:34:59 -0600
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>
Subject: [PATCH 2/3] drm/amdgpu: fix the fence timeline null pointer
Date: Mon, 13 Dec 2021 14:34:21 +0800
Message-ID: <20211213063422.2232155-2-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213063422.2232155-1-ray.huang@amd.com>
References: <20211213063422.2232155-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e46ac36-ac63-4b8f-0065-08d9be02b1a3
X-MS-TrafficTypeDiagnostic: SN1PR12MB2511:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2511D56587DC947EDB2146F1EC749@SN1PR12MB2511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cyOcf0uL6JO1ZfP3uuoBTLnjv6eiQ2x4JRkQeOgEXb5DjIMUZMeccGAH26BNs6IKut1aO9bsbgEJSbSviHIZ3sTrsRRij98/C8DqSCnZ+/0EEKwiazIfS8O4/kgwfCZnhwOEPGx0XR2Yzs0SkSFWqkqg1cTVo3wdsfd5xn9/LlTooPKvf3AnB52/J3QXdwghjBvkzOuKoS5i7cD+CpC5hxWRpB9hBeL/mqTMJy4SS145IOcPHy7aIsYam9E0GpYI1kkgw7kOwvx2piGBizyNWQGsOGWQHfxUU7VUJxg+hyOh3zwPYB97D5kNHC377zwEPjQp/jon/LqH5TJuzRXh9kne3uE6xXNTXywMMgjMSGpQUkwF7EH08jzWzWgPutRcRIoJcZjUihM6FzJPY1KzUvAH02nYRvPmVexZ+sqJnqKJGevATu+rZcoEoAZJbV+k+bYCvxrwyYYehPR1+ZS9gcpEgVggaaHgzmhOPDvmUF1KTeZZ0fgEB/TQUoYhpzH/zx6jSiLECbF77xQsFJmb/TiAT1spQJxKy9BvOqGt+YZNfxi8MMqWQV/mf/NNE7xadN44ReMlSMgJKwbRMNs+/2Wsrs8JKRPdVdWiAQoHhaoOtw76vL8w2Dwq6gHTszcX7ZACzKeeoywtN3esb7AWQxtqHgqqk4F5cFWf3s1CB8xL7AjLEYQUKncqP2Pi7GOb0svhjBA9xm7URJ6XJi8NyKaICbxLxCOlWb6PZnE7gZF+TbIJJjjli4vzZkTXqGAxddRzVlvrifU5yqOfRQ4FJzv7qo3Vp5i3EhkFeCmOdPA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(26005)(8936002)(16526019)(6666004)(82310400004)(356005)(4326008)(70586007)(81166007)(336012)(110136005)(8676002)(1076003)(36860700001)(83380400001)(36756003)(7696005)(47076005)(86362001)(54906003)(316002)(2906002)(508600001)(70206006)(186003)(2616005)(5660300002)(40460700001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 06:35:02.8316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e46ac36-ac63-4b8f-0065-08d9be02b1a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2511
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

Initialize the flags for embedded fence in the job at dma_fence_init().
Otherwise, we will go a wrong way in amdgpu_fence_get_timeline_name
callback and trigger a null pointer panic once we enabled the trace event
here.

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 3b7e86ea7167..e2aa71904278 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -76,7 +76,7 @@ void amdgpu_fence_slab_fini(void)
 /*
  * Cast helper
  */
-static const struct dma_fence_ops amdgpu_fence_ops;
+static struct dma_fence_ops amdgpu_fence_ops;
 static inline struct amdgpu_fence *to_amdgpu_fence(struct dma_fence *f)
 {
 	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
@@ -158,21 +158,22 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
 	}
 
 	seq = ++ring->fence_drv.sync_seq;
-	if (job != NULL && job->job_run_counter) {
+	if (job && job->job_run_counter) {
 		/* reinit seq for resubmitted jobs */
 		fence->seqno = seq;
+		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
 	} else {
+		amdgpu_fence_ops.init_flags = 0;
+		if (job)
+			set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT,
+				&amdgpu_fence_ops.init_flags);
+
 		dma_fence_init(fence, &amdgpu_fence_ops,
 				&ring->fence_drv.lock,
 				adev->fence_context + ring->idx,
 				seq);
 	}
 
-	if (job != NULL) {
-		/* mark this fence has a parent job */
-		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
-	}
-
 	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
 			       seq, flags | AMDGPU_FENCE_FLAG_INT);
 	pm_runtime_get_noresume(adev_to_drm(adev)->dev);
@@ -720,7 +721,7 @@ static void amdgpu_fence_release(struct dma_fence *f)
 	call_rcu(&f->rcu, amdgpu_fence_free);
 }
 
-static const struct dma_fence_ops amdgpu_fence_ops = {
+static struct dma_fence_ops amdgpu_fence_ops = {
 	.get_driver_name = amdgpu_fence_get_driver_name,
 	.get_timeline_name = amdgpu_fence_get_timeline_name,
 	.enable_signaling = amdgpu_fence_enable_signaling,
-- 
2.25.1

