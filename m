Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8711C39D86
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067DD10E865;
	Thu,  6 Nov 2025 09:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zNSJuCDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013042.outbound.protection.outlook.com
 [40.93.196.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435DB10E865;
 Thu,  6 Nov 2025 09:40:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8BtkGx2fwcYwUnM2aX7LR9/cEWScdmyPscDqfvn++vACdq2gCMA/7W0v5RRGPJTdi8951jbbnMCfOTGGC2iMcykpx2nDlFAV6wvY7BhQrTq5IyRGZh4Cv43lDQXvE10bNXUu+FAD+IVfgDEEzJMOcTnn8IPCIzylAIFtPHLI/6PWBfqPT3Ps6SFX60pUY0fCeqszJy0gEevoSB4D5iZEoB8hsw+6uZU/WnTlcMc2K7hTj9o3pBSVkKg0MUj+WKOafpM/o9gy6JVfCQBE+QrfsAiUEMILchZDeC5RaGrRaltThXBQJj1iLADPs1/OsOV/Yi9yn/Zyr84acptYsLFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxOIfzkP9lZBC7D7PoJ5BFX9tL6npuRdDft13wodc44=;
 b=v+kaWZPLMDWI5qX769+tyiXljr74tdlbD/ptojdJ+jZC38OAI0r88weISQdzlER1Ab51o4ChizQFSNIIZNci0yCfJhhrAL1YSNoJIey3F47scORVTlx8fyQyQGXXtTBod+79fQKVe7PXGktOy3M44JMDeV0rEoUiXPgUSZJPEgoRGohFhEbepfonZWZX8lk5wbt4Oe15CgudmfhaCGQL5IOHlZpRhOwAunOtJwicI/aLYgZaCkup8grysKijAKZw0DXL/YmTSlMZxRR8NWVMKBgJX3WoHzPlpLmdHE0qs0d50nhfEtysJ71EfY0G0cTnOldg11jaxbqQ76gm1MoiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxOIfzkP9lZBC7D7PoJ5BFX9tL6npuRdDft13wodc44=;
 b=zNSJuCDYH/fI3HVlIrUS6Jy9N8kEAlwgHy9DDXC+XRt6sbFPKe2bwNVkeM+5ndjqttq/Nep3RN54pWXpyV8R4L72ryfXidBYJfd/phK3GFuC5uZ2kk/U5lseoSg9Oo7qJYwuy5pTaWtoHc6zCq0VM2TyRALaa62KBXX0utkaN78=
Received: from BL1PR13CA0336.namprd13.prod.outlook.com (2603:10b6:208:2c6::11)
 by SA5PPFC3F406448.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 09:40:24 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::b3) by BL1PR13CA0336.outlook.office365.com
 (2603:10b6:208:2c6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
 Nov 2025 09:40:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 09:40:24 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 6 Nov 2025 01:40:17 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/4] drm/amdgpu: increment sched score on entity selection
Date: Thu, 6 Nov 2025 10:39:27 +0100
Message-ID: <20251106093933.18859-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|SA5PPFC3F406448:EE_
X-MS-Office365-Filtering-Correlation-Id: 059158d9-e593-4b68-f1d7-08de1d1882c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ueD+uFyhRqxWEKI3/TIdfT+U6fgq+AO5fg6av7YA3fbGECQjydVEP7pzam5u?=
 =?us-ascii?Q?wDved6DdXsL0x/Kj2OpP/GZA/cjBWleyY7qcUsDbVfjU131DBs+DKeOZRk30?=
 =?us-ascii?Q?RYdXHTQbrGDQDQ+x5dDmeQT7iYxTgAUnWx/cwJmS21c84PPPUuNN/9likCwc?=
 =?us-ascii?Q?7bAvrhoQE6+EO9LQ0o7tti3WbQ7n+6XxDdNlrtarpTKJTlgB3iuoQP2JZMmd?=
 =?us-ascii?Q?HUh4MFpYmI4wg35FvA9gJptm9nd6D6uYVG2CAl3c4jVzOWn4yek83jeFVZ8G?=
 =?us-ascii?Q?eurC8wi6IpGW05+uaHAhb1PX9SfBapx9e44P+vehXuLgw7GhqYLTGlz7yfEX?=
 =?us-ascii?Q?stW7V8XzMoVRh7TBF27uRSRxbM+Qa+VyaqIskjQX8+k0T3P2vvOJ0rp9mbJn?=
 =?us-ascii?Q?Gaa+1m3neLEnN28Ua06IvY/RxrjlAfKs1KbiuhuCe5q2jqk8PBGRqTGpICIp?=
 =?us-ascii?Q?f6mA5S9z7G2NZBW25bIImUEVark6Az+qYnBFR0a16Sl8YZbaBCIzmAZsnB1x?=
 =?us-ascii?Q?/gl4IjOcmYq4NR5ha629Ep8Ty4goM7kTbAee/aict1EYhSBMbEFEbFAQ4saW?=
 =?us-ascii?Q?ae7A5sxCGOPTHXbcwMNsWbPOaDUHQelItYLMblBgoTk/WSlQwrrI2W3bzSsg?=
 =?us-ascii?Q?qErszDU39YUzPPKf32GVkGKZHOz+nZhkCEIoREI89jrSfYzLtURjKzckgGrA?=
 =?us-ascii?Q?zP/hFzbBZwM/c6it2hEVrCRqgSpSjc80nTtDisMNX9sjVXvRYV+h/Md+v8+K?=
 =?us-ascii?Q?8BFIPaj7E1jsz01mbUQSSBZro1xMpi4pBifILRtK0gCsLe6f4IS302Acot+1?=
 =?us-ascii?Q?gNbnJkLiwlZE6Wz+7TJMsLyIEK1lP1Uspow3ZOKENYf0cU7qGy98RTpNpJcK?=
 =?us-ascii?Q?s7nfpYPJ2p8jVKZ8zygnbr/14LIIcITC1abOgGLcPnLmhwyOxlEM4ouo3VrS?=
 =?us-ascii?Q?MHiMO34mq4g3awX9nF7JbNupfbXhpJBv13e2Ox9/2rHQx4DntGAzUidYI7m9?=
 =?us-ascii?Q?KWieklggbXS32rxWEnVu+w+AorxUmeIQVALkZ4wx3uMOvqVDi5pdMZxPtWKt?=
 =?us-ascii?Q?5a5o7luWhijfd4XwjB3qFR1RGhpI5AjSsQWrUfp5yXnfNrPPeP0hOsTLfMJg?=
 =?us-ascii?Q?CYDTYcRTjdDwVUWoa/8dJI8WDbz0fkEMNiWFdEewG1065IQ7Opf8Wmji+eq1?=
 =?us-ascii?Q?+GAFSV/vW5IRDygX6tnR5rZPabd3BJuMCK2/JevfDQtHD0TNlvwS+PE85CjN?=
 =?us-ascii?Q?swbsAzVtWum6vubL32eb+Yu7bTJjhViEw+Xt9TGauRgVxBnXOlDsJo33avuW?=
 =?us-ascii?Q?B777XjRvgGQCRwOJgZW/SV9CqAaNRNFLOLr4FTAOu02aryzoEN4bpHNSVaQs?=
 =?us-ascii?Q?nYEYVG0qe0MOca0sKwDI1Q/fXu3E6+LHak0uDZdBbu6qRR55vkAy+nZSG+fw?=
 =?us-ascii?Q?xid5WxdD71oZpbbg+iFVDLB9STwkg0jWzpANyQnxxlmE67pCfDaj57Qjvy6E?=
 =?us-ascii?Q?Ikn21uQRv3Dyt2p99+qd9aUzvuWMtz+0RfpD+k9WR4VGIxPfAOUTEsUbrjsa?=
 =?us-ascii?Q?BrgzVPcbdIXrRzg3qJE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:40:24.2853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 059158d9-e593-4b68-f1d7-08de1d1882c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFC3F406448
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 21 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index afedea02188d..953c81c928c1 100644
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
@@ -258,6 +261,11 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 	if (cmpxchg(&ctx->entities[hw_ip][ring], NULL, entity))
 		goto cleanup_entity;
 
+	if (aring->funcs->engine_retains_context) {
+		entity->sched_score = sched->score;
+		atomic_inc(entity->sched_score);
+	}
+
 	return 0;
 
 cleanup_entity:
@@ -514,6 +522,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
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

