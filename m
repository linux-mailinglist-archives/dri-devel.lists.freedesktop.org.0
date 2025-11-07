Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B180CC3F120
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 10:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A7010E1C4;
	Fri,  7 Nov 2025 09:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gnzrd2qJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFDC10E1C4;
 Fri,  7 Nov 2025 09:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bj5LDK4BwYQViX8A15N42k+Xj69O/Lw3WSEEFs7sDYtXncCMVSZzblCgDZF5STu4/HwpyzM0/XnQtZYQU3KuD/4QdeZdgsgZJnfIN4RPXmVKukoyWuoOn12JB8vIviDIzKh/zahEtv64hUcpmBs9idNMzqRnIi5quMdGGuFmO4dqCSL9F6AJQirhZHm0s1/h0kiSHVlQMfXd7K6/ASCQQRT13nkDqJDH0VVZgeIGXKz2Up+zubSSyWIyg4wf6vXBsdJa0ZpvMmKRoMNR7QpPMZgJdN0NEyjbT8bP7JKyRqnIgAGrE3c+mWYw/0CiTNy5P+AJ7JScUAO0aJ6IbuKZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOhxRjP2cYCxdCvCjRi4TFLdoVofcw4EZQiZNXXHj0o=;
 b=E3Yer65YyYSXBLSz1lJBwE4PwCOVBfrGUoXOuvkS9P9F1Gxr0UK5sCca5AYYj/A0yP+TxXiaXUoMyk3bO9XfCkigvrJlb8uS7J+AVHL9+NnUh6iWWstQoYqVXSf7DuM6I6b0r4XSCbXSFCRVhYcbJm9HTkbc0dl0TjiiFNAdgZF1c+6QPEt4fXuHvPiJ5dGITS/vpedgd1NmvG0/IUc8tfLMLb2fNMuT1Nl9877n5YlzlJ0aOd6TnB1z6U+kZHah8odb/S7bTMMkDam3bClRnyTUDJ9rFFyMcYDJzoGMQciYGRS7m8NBP4SsfRI20UWcZkf+n+oGL6q9HrcEdZvmIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOhxRjP2cYCxdCvCjRi4TFLdoVofcw4EZQiZNXXHj0o=;
 b=Gnzrd2qJDG1JfaCviObVuHiwja3UZ+Ln+LmncpHAkwyuGEXC+7uNZI4MLLcNDnyNqzOX5XqgQOtqaL+8t4mGDl8G1m9P+2s6zeaOt0dwD7rBsvr5mwfsWqX3YtSFbg+POT3R4ainjBua6+QnyryLjlh9WRQqIg1b4+EZoOwBAVU=
Received: from BN0PR04CA0037.namprd04.prod.outlook.com (2603:10b6:408:e8::12)
 by CY1PR12MB9674.namprd12.prod.outlook.com (2603:10b6:930:106::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 09:04:48 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::5a) by BN0PR04CA0037.outlook.office365.com
 (2603:10b6:408:e8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 09:04:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 09:04:48 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 7 Nov 2025 01:04:45 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/3] drm/amdgpu: increment sched score on entity selection
Date: Fri, 7 Nov 2025 10:04:20 +0100
Message-ID: <20251107090425.23199-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|CY1PR12MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c9c232-326f-4512-df7e-08de1ddcb432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7zttMdGsCGY2HtzNARHYAk+kNBfJwrA3labjUjk3mPhnYhMUMTzjQV2hsDgc?=
 =?us-ascii?Q?dVvhU+FD8CueQ4TQP067Pzy3Dc55Ces84oqIkDQuvsWYqX1DYAbVOLHrhLx8?=
 =?us-ascii?Q?izTwAHZg/UaB0RjgitjdcbEa1P9+ktUSstLx6GdvN6qXbLlVdMU8CsE8hXMu?=
 =?us-ascii?Q?W6HaRuo9BFO7KLOmGno6ParyL9VColAtu0qfXvtduttwegI2ZBuX9fDQplt0?=
 =?us-ascii?Q?K5QshmHrIbm/GuHwGTQKEUSqPuPMUJwwxwKKN27vhAV2NEnPJ4TRj6b3VNea?=
 =?us-ascii?Q?iTaaHdAKEVaOSzoc8YT/fLy1e9TqVlWMHAT7/NLbfw+aXk49YWtZtn0E0LHa?=
 =?us-ascii?Q?bQ0XCKSm8nrhSwnrRqc6RYyFxu2e9rAwnZYeIqB7L9qWsVh7/O70/0oOkC4J?=
 =?us-ascii?Q?kUgiJN6b5fvgpA0TI+o+auLFDfqbiVHorzY1F4IgZJFGxijcmcZhesSrLzQn?=
 =?us-ascii?Q?W+DkZ833/Snnh1Q5/qttSCkNjniKGQ9ITjMXO/fLqTO4llZcJTZFunxlhXXj?=
 =?us-ascii?Q?ceIgrka+Lc4T2UpFtKEIKNSfcG3ihhmxnG/xx+C4Ui8wKGfJj2fPKUMXHs8P?=
 =?us-ascii?Q?ygM6MocK2yaNJpqhg4tu7+8EaXdZjlpx8LzNkpiZPRawHWkH6/wVV/ufBw1G?=
 =?us-ascii?Q?Vnjd8G26uwcV5ag5OrSsKagzPcITfKwyzVEiyxm5xy3kEvKNgmYR8y9XtQcg?=
 =?us-ascii?Q?NevEBpqmfqXnsq7xf1G8pwA6UP033gzYuZ9ah3uM7fN6D441u7aPf4EeSozY?=
 =?us-ascii?Q?gZA3Py8blN0ilf2flvcV3mcdlGFCckgypbd1mNe1XGp2fBxjpwDBZQf3lRwn?=
 =?us-ascii?Q?BIEYSISJuFW4wSmOi+c6G9geCR/hSFoQnFVfbNQw+XgxOMf1Z22pIOHRE47s?=
 =?us-ascii?Q?Im18JVbAhylPsXpWaPfg2mfJuMO9u//8jzaGdPYKfbQ0LBQmerNX+Lqdtryn?=
 =?us-ascii?Q?IXF5tg/8c++pfI7Vvqjlhu1SyaFld+aLM/P2WDvPTSiiKw6aKMfMobOKSqxi?=
 =?us-ascii?Q?eJzguPpLm9RrvvuWZR2nd2ZQ+6IH4QvmOLRtjlyzbZ4hEecI4wXZ8zearrV1?=
 =?us-ascii?Q?DK1EQcLsGonnMV/sbVbgwuuLaZuU9o5PhrXHWeD6M6w+UkC4vRrdk0vsMs/D?=
 =?us-ascii?Q?0R6/owuWMMSRI6wDS08GhS/BYu/9cNgUEeOx5Yd1mK1pqFIvy1Njyxoqt8C7?=
 =?us-ascii?Q?bTjQskzbbOZh6MfeptKWss8IrRkmNfABemKXj+u/9bLX3TxaeYgPJdKt0Dvh?=
 =?us-ascii?Q?0QYo/hyShMOmV01gjS2tj39nGfp3tH3jCiS5IPmxA6jmy5P3n3Ii51syNYvG?=
 =?us-ascii?Q?55IgUwsw2keysQE99nvx+3QAzQ/M9hmXWJ3C5CqXBa8YDFKN1UcMEk4sjsYb?=
 =?us-ascii?Q?wGu4g7aDaERzVfNAuTcOrnbVBHLnlzq6IGEYo1GZEWbBnm1iPKAgY5YmyVOQ?=
 =?us-ascii?Q?BvkkboPU/OWwBKNbm3oCWsvxr75Nkq/yHsIvInW3tbO5uweUCRs+Uk11VK3D?=
 =?us-ascii?Q?MsqXf/Hqsnh6LyZZzRSm0tGCSCvj3E/4wBKDb76GPdaoTyJZ4G7m2c/+Ydun?=
 =?us-ascii?Q?U+chbDS+QphP8w2gyRc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 09:04:48.6007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c9c232-326f-4512-df7e-08de1ddcb432
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9674
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
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 22 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index afedea02188d..4d91cbcbcf25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -209,6 +209,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 	struct amdgpu_ctx_entity *entity;
 	enum drm_sched_priority drm_prio;
 	unsigned int hw_prio, num_scheds;
+	struct amdgpu_ring *aring;
 	int32_t ctx_prio;
 	int r;
 
@@ -239,11 +240,13 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 			goto error_free_entity;
 	}
 
-	/* disable load balance if the hw engine retains context among dependent jobs */
-	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
-	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
-	    hw_ip == AMDGPU_HW_IP_UVD_ENC ||
-	    hw_ip == AMDGPU_HW_IP_UVD) {
+	sched = scheds[0];
+	aring = container_of(sched, struct amdgpu_ring, sched);
+
+	if (aring->funcs->engine_retains_context) {
+		/* Disable load balancing between multiple schedulers if the hw
+		 * engine retains context among dependent jobs.
+		 */
 		sched = drm_sched_pick_best(scheds, num_scheds);
 		scheds = &sched;
 		num_scheds = 1;
@@ -258,6 +261,12 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 	if (cmpxchg(&ctx->entities[hw_ip][ring], NULL, entity))
 		goto cleanup_entity;
 
+	if (aring->funcs->engine_retains_context) {
+		aring = container_of(sched, struct amdgpu_ring, sched);
+		entity->sched_score = aring->sched_score;
+		atomic_inc(entity->sched_score);
+	}
+
 	return 0;
 
 cleanup_entity:
@@ -514,6 +523,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
 			if (!ctx->entities[i][j])
 				continue;
 
+			if (ctx->entities[i][j]->sched_score)
+				atomic_dec(ctx->entities[i][j]->sched_score);
+
 			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
 		}
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 090dfe86f75b..f7b44f96f374 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
 	uint32_t		hw_ip;
 	uint64_t		sequence;
 	struct drm_sched_entity	entity;
+	atomic_t		*sched_score;
 	struct dma_fence	*fences[];
 };
 
-- 
2.43.0

