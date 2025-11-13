Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D456C589A3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B609C10E88D;
	Thu, 13 Nov 2025 16:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yCHqWtRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E794E10E88D;
 Thu, 13 Nov 2025 16:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GstgmNMqLamSFbtEwBKhvshQpD5N2EnJO3WCAaWkKnC+YWxCH6QsCyMcZwdvvoGY2iTrjTg9tDlrsFDBhWcle9hjV8z3QSftMj1HifrdwWU8zTrvLLUsRdyaTsczQBBVedYT4KhQaJoa3qETBCldSSxh2OdRHuIj+NytluKat5cVSd8+eeeN/AiaYW0nfvRUGP7XRhCP6rB9CK5t0DlwUrEfnLcZ0jeaVzuNb750fodi//W77RMsebxQdd+i46FOvH2Vc080J6GyqLv4FFbJeDORxrRqxrgydCWlV/YTBV5DL+b483X6LigoY7FatM2dex9ly7vRhQEx9aI8dA72Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXKHMuwCp88CYdzP4o6Ot64+FB4KTWJROkIjnjWgsL4=;
 b=fznFXnZva1FD0c2xo8i2tOsna91bw2/FsEaeL8bxohkDm9aLOUH1dt/go/JgMZGJWsjibws1W734slWoeSqL5BIvGywvLfsbodpUYez0EeKpbjFNBZwoprFK92eERV0UtHKU8aTsbVQDTtNXFsX2Yvw5Zr9ZhzG+uGMBqfzEMPsTLJPulIQKNzEcpgaZNL52xmyeiIdlUISOhlgT4wumdi8V+BBgDX8sUNSZ3nYgSeVSf2WyfSA7I55N3fhRhP1FInNLRypiQMiL+0KKNt/4OJTzvVOdW+2chk2yXA0fYqBV7dE9KOQc6UHM2rszqIciBFVuzeWOjI2QeUSQGVWbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXKHMuwCp88CYdzP4o6Ot64+FB4KTWJROkIjnjWgsL4=;
 b=yCHqWtRIIYiIdGGyoC8v0usfmC66ZP3zr6UoNZX2CDSth3QuNpL8fjW2UIydVUoB5z88hh+EgO8JrryGH8eXfqS43wJaZ/KN5J/yIZBvNsycU6WO5xyc9Z5Sul1AmtpVoMMRATGv8z1NOc4vfA+SwsDZNT1gJVOeFa9tS2xhx0A=
Received: from BN9PR03CA0921.namprd03.prod.outlook.com (2603:10b6:408:107::26)
 by MW4PR12MB7333.namprd12.prod.outlook.com (2603:10b6:303:21b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:10:06 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:408:107:cafe::25) by BN9PR03CA0921.outlook.office365.com
 (2603:10b6:408:107::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:10:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:10:06 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:10:04 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2 10/20] drm/admgpu: handle resv dependencies in
 amdgpu_ttm_map_buffer
Date: Thu, 13 Nov 2025 17:05:51 +0100
Message-ID: <20251113160632.5889-11-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|MW4PR12MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbcde71-6c49-42b4-942e-08de22cf1c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oKzOkQQI0vPTr6t3lXpAkd6CLpBw3x7CXte5ii3KxDXCrjsCwCqtBrDp4sfi?=
 =?us-ascii?Q?VdE/x4W8e5XVSqba8OOYqX7dp9oHsJq33aejv5r2yjWpxthCY7rirczKU0nV?=
 =?us-ascii?Q?O0kyrdJIkOZuXMlZfyTcYU2Zk3BWBvgtHAd4yTP8MbVlmXZ8KI7hLy5PUBF4?=
 =?us-ascii?Q?238Jg0ITlxXczrMqI4uRGuOpglkYKB1ALOOcwazWmKJiiBBP+N2b5iYHUBbI?=
 =?us-ascii?Q?IlTvCC4UVYEAftsN7BvMGrEBiSC+36aVLHYeTWLNYMCWTVXRrtcf1YclKjm7?=
 =?us-ascii?Q?ZmTrexxvhGDwIchIGglVKBeACUDYICuswcP2fEdlSSl1jdOZNVO7ijISNHCF?=
 =?us-ascii?Q?HoDBifaQAlIIHjzPLqverXfmP/BER/4tK74leYYTdVLwCMNBAcYr6e4bDyti?=
 =?us-ascii?Q?Vxf8v4wZH/G06tXocowbkpG80aOmLS2gsnRvFskCWa7z5EVM2m1XLSp/5Wr5?=
 =?us-ascii?Q?kFx5VtlXAfsVIMD8WDmeJfKtnCHQg62GmTypJ0Cx1yfgkv9QPWt9XgDZnTsx?=
 =?us-ascii?Q?CFB8YdkiqL4J7hY6hI0omKrsGoWbzdjaC6mynRac7HVVwYInFY+6fLM+slyx?=
 =?us-ascii?Q?xhAhcPtESG34rQzlWxrPa0Ufy87jTjax8hLNPx05kjudLrSm61K62jeh9WFn?=
 =?us-ascii?Q?IqLzkGBsu/DS7ATax/FI2W2OzSsgN/ya6Q/dm3WpqrSfNk4JfhqiU15pqeKo?=
 =?us-ascii?Q?vydSCD36ceBEy/0StGBwxesiiW7vj8YIN79Y6b03Vd/T452qtJ5Ba/vY8OXZ?=
 =?us-ascii?Q?9Sq1PJ5oVyqk1kkIdgMIylRhbNp0tzZh/5pGeqWOeC4KfLH9z8TUAkWVrs7m?=
 =?us-ascii?Q?+jVhRfSnmOcUHCG4QB3ULS/i94V2LA3vUl41zf92w5gSfX6T/u13YX9vqtfa?=
 =?us-ascii?Q?eQJvcvkE4MpDKxZL0QJAW2u9Kb3UefjOnD7mDpWwmx/TwIk1Q72p5c3c608C?=
 =?us-ascii?Q?zB851nyuRrzqo/SB9BV23iuIpW+jzVdPq/EymKlYQHw2EFXyGEjZkXHK7/59?=
 =?us-ascii?Q?p2CYP/C01q1L2wBmB/souOkFtbNl8d5yxFfK8f7juTNFA/jFP04Vz3RRp9K/?=
 =?us-ascii?Q?XO2AjAh4qM9W4sjoOsUk74lEpteT0Yz9/yVGyuJR6WRDgCA35HelZjmq04+c?=
 =?us-ascii?Q?IDlbEb4tNYT4yN7NqZHy3Od+mKDrU+3sc6xcf7jX5hd4xr0Qb0iP1ilGqyYl?=
 =?us-ascii?Q?kCgCafW7QNeAZppmcqaxweteNCqSZsKg+IVUoilrGbbvqK2ZinDK2Yh+Lud+?=
 =?us-ascii?Q?qXUNrwnb9++0vIoAxgN93nFCjzItxFY6RFg11FMjVW8wbEwR6sLDbMQfoj/F?=
 =?us-ascii?Q?I7cfG1gnqyXbe0iobBMTVEz0OoRtLtK8vVi4HkRWDwidFPySBqkyH6KhTs1n?=
 =?us-ascii?Q?G/OHnkuvie8vvcsrZulIEUQXHMaICLAAcNDwDRpSxmh8uBrcySagr7QsgQ8e?=
 =?us-ascii?Q?r+8S0YWukmFwmrQkjm2bZlJIExF3BxH8IZzkKoNok8JraZ1TM3V4d9WbqgOc?=
 =?us-ascii?Q?pq+eiqFGnrjbI3+wCbAa9ZkJjg9sAuEO5rdEvZmRozn8BulP/HhXA0Y1h75z?=
 =?us-ascii?Q?bqTByj7QCEVE1MLhhsY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:10:06.0770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbcde71-6c49-42b4-942e-08de22cf1c47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7333
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

If a resv object is passed, its fences are treated as a dependency
for the amdgpu_ttm_map_buffer operation.

This will be used by amdgpu_bo_release_notify through
amdgpu_fill_buffer.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b13f0993dbf1..411997db70eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -184,7 +184,8 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window, struct amdgpu_ring *ring,
 				 bool tmz, uint64_t *size, uint64_t *addr,
-				 struct dma_fence *dep)
+				 struct dma_fence *dep,
+				 struct dma_resv *resv)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned int offset, num_pages, num_dw, num_bytes;
@@ -239,6 +240,10 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 	if (dep)
 		drm_sched_job_add_dependency(&job->base, dma_fence_get(dep));
 
+	if (resv)
+		drm_sched_job_add_resv_dependencies(&job->base, resv,
+						    DMA_RESV_USAGE_BOOKKEEP);
+
 	src_addr = num_dw * 4;
 	src_addr += job->ibs[0].gpu_addr;
 
@@ -332,14 +337,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  src->bo, src->mem, &src_mm,
 					  entity->gart_window_id0, ring, tmz, &cur_size, &from,
-					  NULL);
+					  NULL, NULL);
 		if (r)
 			goto error;
 
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  dst->bo, dst->mem, &dst_mm,
 					  entity->gart_window_id1, ring, tmz, &cur_size, &to,
-					  NULL);
+					  NULL, NULL);
 		if (r)
 			goto error;
 
@@ -2451,7 +2456,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &cursor,
 					  entity->gart_window_id1, ring, false, &size, &addr,
-					  NULL);
+					  NULL, NULL);
 		if (r)
 			goto err;
 
@@ -2506,7 +2511,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 					  &bo->tbo, bo->tbo.resource, &dst,
 					  entity->gart_window_id1, ring, false,
 					  &cur_size, &to,
-					  dependency);
+					  dependency,
+					  resv);
 		if (r)
 			goto error;
 
-- 
2.43.0

