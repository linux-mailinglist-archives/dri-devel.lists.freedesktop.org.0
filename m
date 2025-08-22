Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933B3B31A00
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 15:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E5810EB17;
	Fri, 22 Aug 2025 13:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FgcMbqBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F83B10EB11;
 Fri, 22 Aug 2025 13:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPlDr0AilzODyFTqj8TLEuwf4TGRwnDIWucF3K5h3E6AfLlhzh00nSMz4WZJvSKfanWVwOQR/I0xy4lG/lbtt8+qrXklkKycyu0JuyjcAVxx7k/TpL4JE1gcSEi2lrDYeoULpqXRuddpxCbrG8KSBPVTtWqV24L6NEsdjxQMFLGQ87f4XTQEySe/bC8V5KMJzhTUGYelgSmnHM3EYEkFo8Ou2Kd5r3GnGkpIEtqnukCkzTFelkEGywXcvY1B/v3sbudEMXtPnjt1hI0pVjPSRWo++RZ2HxgxQwMfFaAAPuqXIb/7xmXC6h1WvG77RIL6LnmQwMkbvssGxM7OjfcFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zNYugPL38DwaQDKqT/RhhvT0QYBLYYQ44izal/sWgk=;
 b=D/c+jHZ9y6LrveLcOuz4Wx+CCShn+ifRL2JlWigmpISPq2PA3aqpMaVI70XSRai+qVo2e1fUJ+xtwN+/wggisixtJEzNFkITHwLPVKrukwTLZfQVRfoHLK3TU0wRN7Je5/gMoN4e3TxUOJqxhyPoKWPLSj38Iy0QAmzcbDLcpPAFvfBmbwQgyaQpwq5BtQTq3BQBscW0n/z1fY+Y+fcgMyZtWxnILb87AhTgDFHb70BNuQo5EFVWS8jXq1iy9wv25dgR9dWWHAlTw9HB292vRkcGg57KRK8LbsDEoocDO5Mq1KE1BMMg7FMWMsDkPPOxlIqhhmnmlzVCSQ+zmfdq7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zNYugPL38DwaQDKqT/RhhvT0QYBLYYQ44izal/sWgk=;
 b=FgcMbqBphBVCkYfW+qcgy4vPd1fkC15VjpWfGdLt3kFCZ3Aca0pvz348HGlrqOr5O07AtYi215z/+TdmUvMg/sdQxT+jxbcM+sbqBSG/aV3+b6uEcMlnDK3mvo11omJYDpgyjnyHlCZPECqeFTi4kKTgGF1+g/+z3cSiwmdMgtc=
Received: from MW4PR04CA0035.namprd04.prod.outlook.com (2603:10b6:303:6a::10)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 22 Aug
 2025 13:44:27 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::f0) by MW4PR04CA0035.outlook.office365.com
 (2603:10b6:303:6a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.18 via Frontend Transport; Fri,
 22 Aug 2025 13:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 13:44:27 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 08:44:25 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] drm/amdgpu: increment share sched score on entity
 selection
Date: Fri, 22 Aug 2025 15:43:46 +0200
Message-ID: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 4937dd11-5596-4bad-0b60-08dde1820353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qo4qMZnsLZCgMZo1b0w1HSOrD8ToH2E5kuw+3PpAeueA5FHpG+EViTLgjNq8?=
 =?us-ascii?Q?wfKrXQODKNGrnDPGEqnC5weA/Jj9FOZksCtT/j4vMshuECc25DqT7pN2aE5b?=
 =?us-ascii?Q?0oJL7baNZVuWFSTPShfG8vcdLEoLj26hbT5Y6y6DeyC/Xrbl3T8ouQqz2d7Y?=
 =?us-ascii?Q?3YS3TFRt37TCQSf+ye4DKRZre92Em7lYuj4c9TCvouCPZ6eaHKFOGAnnoF+m?=
 =?us-ascii?Q?xrQeNO39pPBtHrPRdg6s3Bo2Jh4b+N0mXonTKDKzyTW1ctsOu9QZbZxnUnID?=
 =?us-ascii?Q?OrNZR6LGWjvbGaiHpHUAPk2avZOhprgEGvY6mdAV8Vyid4jqcF0iKE0XSQhA?=
 =?us-ascii?Q?UEI7MmEGA3KEuvQ/nSs0rx1tdroyCfqrLk/kEp1tTDSJb+Kx5pW/cxOAgQH0?=
 =?us-ascii?Q?C8r4BNVhlLqE4AyqSgkAOROpuiIza8EW/5kLWBxFD+ymVDnIzbmW0r9eAHg+?=
 =?us-ascii?Q?AxIeN7F7vozCXCFXTsgSm+21BN+5uk4UjuDhmGdIb4Lsr0NWhBUa+R85tfXX?=
 =?us-ascii?Q?W29tJpUOP+grGj5EItxmmwGTv9DbN2bzPKGwPZiuf4FijwVdLJnnfdeNWprn?=
 =?us-ascii?Q?5JQWDDp5j7QipA4Od9OM1qWMzZTxZmPqdZBlG4F2MYdybKKKSaNPz399o9c1?=
 =?us-ascii?Q?is7K2sLfmdl6qFMpbDnRt8K8zIvpG9anhapARlw56enqJZ/hR0lkqC8cTmLz?=
 =?us-ascii?Q?aF1n8ZCe1y05oliPQVeSiHZHqlwKGDpc5T0ZD0/bYGoiBzBmFjF6eRjb/klY?=
 =?us-ascii?Q?iEeycvZuWDEc0gg1XTS1+FHdriWKpjgO+bLegtCW919HVqHJjQqWd6gsHgPK?=
 =?us-ascii?Q?atMROXF/ulVLACI6ivP8l3OwdoqhjOkYMuvQDSDuaYqRnHnBt2hBU0CmXLF7?=
 =?us-ascii?Q?S1mOH3o6OzPXm2/buVGdKiUDfJusVgWIYiVdlEPR9No1rPEoe1oTux+8KpoW?=
 =?us-ascii?Q?28tHN+FoD8S7KYPtyQNMFNGAwWQuq0Jl69qQtcSgoFeN3jogcC4YU6R2y1k4?=
 =?us-ascii?Q?jiVkdOOFE3nCS6zGbuVQUrQsw2iqDI0jwtu/GVHSpFfoQZ5fNtyqmys5lPNV?=
 =?us-ascii?Q?OlaNKQG65jS1jkZHq75hVTM3H2E25RY2XSMLWjhNNep067YBsytuwDfLr3aa?=
 =?us-ascii?Q?8piWpUvXf5dopZv6KXOhsIVigYwanhGylvlxNvuMDSQcrOHBXct1eyQ0+cfw?=
 =?us-ascii?Q?LVpqjyZ2TAAXSDufVInTwdtAYGaj4oEx+vTIyTf5bzgQbCKcw0S16FjXuE8b?=
 =?us-ascii?Q?KnQaDKeK7M6XvJiWX1Z3EDapv+XIqZHGUT3bcVGiD3Gsv9259wF9yk3g1XH2?=
 =?us-ascii?Q?zjNwuGPlQnPhqs7Zf4tcpaoFGhdYVhDaCDUhoAiH46jX9px+omFBigjLtpTW?=
 =?us-ascii?Q?ldrtyp4QIwJMwlv49+ql8g4ZtwO4iffvVw/Jh/5eK7d/Q3TgNoPEGrOdnqem?=
 =?us-ascii?Q?O2OLHimnmjuHgNPq2Zxf7NjBiI5/Bt7EoYPPeh1F0IpY7N6v8lRRPW+ksxNH?=
 =?us-ascii?Q?y6WsTTgoAbSGzkKC4rJnTfucxZniLKNPmyWn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 13:44:27.2903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4937dd11-5596-4bad-0b60-08dde1820353
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
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

For hw engines that can't load balance jobs, entities are
"statically" load balanced: on their first submit, they select
the best scheduler based on its score.
The score is made up of 2 parts:
* the job queue depth (how much jobs are executing/waiting)
* the number of entities assigned

The second part is only relevant for the static load balance:
it's a way to consider how many entities are attached to this
scheduler, knowing that if they ever submit jobs they will go
to this one.

For rings that can load balance jobs freely, idle entities
aren't a concern and shouldn't impact the scheduler's decisions.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 23 ++++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index f5d5c45ddc0d..4a078d2d98c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -206,9 +206,11 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 {
 	struct drm_gpu_scheduler **scheds = NULL, *sched = NULL;
 	struct amdgpu_device *adev = ctx->mgr->adev;
+	bool static_load_balancing = false;
 	struct amdgpu_ctx_entity *entity;
 	enum drm_sched_priority drm_prio;
 	unsigned int hw_prio, num_scheds;
+	struct amdgpu_ring *aring;
 	int32_t ctx_prio;
 	int r;
 
@@ -236,17 +238,22 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 		r = amdgpu_xcp_select_scheds(adev, hw_ip, hw_prio, fpriv,
 						&num_scheds, &scheds);
 		if (r)
-			goto cleanup_entity;
+			goto error_free_entity;
 	}
 
 	/* disable load balance if the hw engine retains context among dependent jobs */
-	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
-	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
-	    hw_ip == AMDGPU_HW_IP_UVD_ENC ||
-	    hw_ip == AMDGPU_HW_IP_UVD) {
+	static_load_balancing = hw_ip == AMDGPU_HW_IP_VCN_ENC ||
+				hw_ip == AMDGPU_HW_IP_VCN_DEC ||
+				hw_ip == AMDGPU_HW_IP_UVD_ENC ||
+				hw_ip == AMDGPU_HW_IP_UVD;
+
+	if (static_load_balancing) {
 		sched = drm_sched_pick_best(scheds, num_scheds);
 		scheds = &sched;
 		num_scheds = 1;
+		aring = container_of(sched, struct amdgpu_ring, sched);
+		entity->sched_ring_score = aring->sched_score;
+		atomic_inc(entity->sched_ring_score);
 	}
 
 	r = drm_sched_entity_init(&entity->entity, drm_prio, scheds, num_scheds,
@@ -264,6 +271,9 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 	drm_sched_entity_fini(&entity->entity);
 
 error_free_entity:
+	if (static_load_balancing)
+		atomic_dec(entity->sched_ring_score);
+
 	kfree(entity);
 
 	return r;
@@ -514,6 +524,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
 			if (!ctx->entities[i][j])
 				continue;
 
+			if (ctx->entities[i][j]->sched_ring_score)
+				atomic_dec(ctx->entities[i][j]->sched_ring_score);
+
 			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
 		}
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 090dfe86f75b..076a0e165ce0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
 	uint32_t		hw_ip;
 	uint64_t		sequence;
 	struct drm_sched_entity	entity;
+	atomic_t		*sched_ring_score;
 	struct dma_fence	*fences[];
 };
 
-- 
2.43.0

