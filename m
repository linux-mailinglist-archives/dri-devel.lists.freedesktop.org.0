Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D92C786E1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6747010E12C;
	Fri, 21 Nov 2025 10:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HI9I01zg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010060.outbound.protection.outlook.com
 [52.101.193.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7039D10E12C;
 Fri, 21 Nov 2025 10:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=My0lQBFxRraqcx/vuTT9p5pZrRnr6eyFOcDZl+Jrr/0BuaCbKf2s2dNWhj4EsqioIYApD28uV7+E/7hCfVwlu5l0j8jlBe6oFh9aFuBwlzCm3NuANRyE19MRZAm8ab5m5mbKpATAAbvjxIlQjbeCINmEa/3XXnTnUmoLorOVst7SpJ4XVz/8YPxXkZQ2CffEzqEE1KBJ7StK7QCFPPxdt8ywt2jEZMAbblxOuIdIBQAi3E5iq7BH5K0psQwViHERxw9hK1ZYldQX5oyLWRme+0J4MyxGdZBxrZur8zZe3eZmaN9jhJj+xsAHfSgZMwizNpITPibste2rzg7EtmsMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8uH5QaALDR3FDVXNDCc5qoQD7sILPoAZkZVSGRPiRo=;
 b=UJNTwOMc+1dTHaFt+lmBwKa3rxRIP6O3KDMLUhcM2zZZbhxk2/fLBVtTau4mmyqUPcPiVpIC+LixUE1NY0B4ZW/cNf5+WptRutaAgmIYbbDXRTjKLijsjSBWc14/SEhLs7ojF6TPDzZ1hvo5EOZ2Ys+CZhimufOkaRDS1pTsCcvukSKMb+cbgeMf2bGflyMQZhsN2DjjlkhASs/6biwunLhfGYlWjvZRu4Rdy25c62ihYK3DFGxm6b1UWwdn6ddrK7On3LIQKUjMsg9ddpbZMZLv5qhFZMMacIJ/Y7P819Q3z0jkbQ8NGjttaqkxjUF2w3Xbqj0iPXLcb3fLvGjfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8uH5QaALDR3FDVXNDCc5qoQD7sILPoAZkZVSGRPiRo=;
 b=HI9I01zg0b7CAlAdWDLbl5dFf7k0ykP7BjW0mRk45CbdblfUi8ytsufwqxzmHf7aXsENKJMHymxV60sVzxTEGokR4YXdaOe+XRres8lbAQc1ajHtxYfpHj6GDNUOAVEkqe+/478KkyCNmYjg6L4HFCcS5i4Px33OEdqn3HVo89g=
Received: from BN0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:408:e8::24)
 by CH1PR12MB9647.namprd12.prod.outlook.com (2603:10b6:610:2b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:16:45 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::2d) by BN0PR04CA0049.outlook.office365.com
 (2603:10b6:408:e8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:16:45 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:16:43 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 13/28] drm/amdgpu: add missing lock when using ttm entities
Date: Fri, 21 Nov 2025 11:12:23 +0100
Message-ID: <20251121101315.3585-14-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|CH1PR12MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: aa03336d-edac-4b14-e772-08de28e71325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UZGNwJfqDCTAwqdGEp0gkCn9YhYxFN/GniP2SlyzFWb1xWzpoYAFlWSMIZOT?=
 =?us-ascii?Q?mf9OqOfBaIKGAs1STYeHnlBgKdbgnxTQRR27Ig+gTYGZWqYuEvU+F2qmnO+B?=
 =?us-ascii?Q?cfUAv4Cd5MArm8gqRdxUoEcwYI7PYx4HDXD47gfCzXP9EHVuqyr9+TSxx3bO?=
 =?us-ascii?Q?sQbGzLZenj9Ukh0XKmLboWstqjsDOyj6oUR3hmuAHdHpo02ICKY3tiMno17d?=
 =?us-ascii?Q?zigK6nB/PSCSi3MSBO3LgITTxPSGl7bDyAF6uZBUIoKCsWmjH3+TT75WLmZM?=
 =?us-ascii?Q?Wf9dqcovWXLY/ATqd9x140TUZGycykAn/Ma+ESRJQ/ovy9VOBPzJuc0AJi0w?=
 =?us-ascii?Q?EsQoB4w6hihJ6bHX9ysl2tPbEN3hYOncmHWfo6xjYZcz8Td45cqadmeDu/if?=
 =?us-ascii?Q?GB4SS/1PfiIfLMTRtTd3tRiI/R6u3Ue4vHOHcUe1bJbHxVaTVuUjYMnQ/52Z?=
 =?us-ascii?Q?Y/UIB6xculbfS+W+CVvDD8Vb2RyjsXHYUqIk4P16TntxzU1ll6LD9tuCgHjE?=
 =?us-ascii?Q?WbitZYvUETl5AlaP1yhx8r1qn2GeXhu3pQxqBBFvyVLIC+bB3bLKX8yiZWvE?=
 =?us-ascii?Q?OYc8r42Zw7bcYT5V9kyXLSf6tc0Ce9r0woidUf1CwnyqCs4tQZ7fyELOJoc7?=
 =?us-ascii?Q?Qr08vJ10ES3eHkn9PH4vTjQ+PxEXPGBtBs/RcdstA4LRFzfuYOUj0AVzrNXr?=
 =?us-ascii?Q?mEfxwsEAPwhSH10HXTWLd51dM0Mmjaamnkp5yAZCpYhhjtWsR9s/9JpHBrWE?=
 =?us-ascii?Q?O3rCXg6gdWceBIygczJekRCm+bJ6Y2w+H+s82BUBT+VtrvHjbUpxDtlU7Fbk?=
 =?us-ascii?Q?aBQ8I0XJcslGSGhasSYJJ+YMvXFEd/eaVld5vKq9xRnhOwvLYXHemtnZWP6U?=
 =?us-ascii?Q?b7ZrwwOA/ORTqNZOyEpp0RIYbvkYc3FH7kXyVWUAl4+MoT/K+Y7WnA97BAeg?=
 =?us-ascii?Q?m4mMTEBDCr5MKjAt6ARQ7WGVuPfzyfoDMSYk4N4ProdMvHjgLJwF3goMvqFl?=
 =?us-ascii?Q?2zgOALR2mXoOZLBVXT3KP97E5Gp3fxJN//ziyFBGjkjpt+QQ3k9YHEh7wqUr?=
 =?us-ascii?Q?iBMdD7m1/MpsDhoblxJ6EpbMYUfOHhIRtxwUrJ1DEQIa/yllcvTSRJ0/2O63?=
 =?us-ascii?Q?Sf+yXHNgKHh1lmKD8VHEQ3n8ZniUiRz3bc3LPjmp03jUEnNwOQEAvrwp4O0/?=
 =?us-ascii?Q?1vYA1zCa1jHYUWlxpYIONpusuM1HuPlO0/rHpYZeyGrTmytK4jd8/Rcaw7bL?=
 =?us-ascii?Q?CoPHZM0qqEcU98nUdZ/QG733ufd0766MA3NuxlcCUem1X+WrmcAc6AU6QJwy?=
 =?us-ascii?Q?NEsUb4+q/btFQPTJnyQlnG70jRFCPUKypvixiQ8U0DuYO5fvTUCz2BwRyEBj?=
 =?us-ascii?Q?Ph7tqxltSlQG0XdKFD+2Q5zMz7fsfFva7+80eoA1UnyCC8QlkHo/IHkD3P2g?=
 =?us-ascii?Q?ihPGPXI5OOTeS6raA/0JDp1lwzP52wVaYWdQxrhiciSjmRkrO4cPj03RAKar?=
 =?us-ascii?Q?Y0D2zMltAPYjpsdqC1zIA+qbB4XPpH5LCtbT6wYKQ6RaTGggohSO6dY0lGEL?=
 =?us-ascii?Q?7oSzT4LkYY+xS5E2dro=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:16:45.6478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa03336d-edac-4b14-e772-08de28e71325
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9647
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

Taking the entity lock is required to guarantee the ordering of
execution. The next commit will add a check that the lock is
held.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index a050167e76a4..832d9ae101f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -35,6 +35,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 	struct dma_fence *fence;
 	int i, r;
 
+	mutex_lock(&adev->mman.default_entity.lock);
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
 		r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
@@ -47,6 +48,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 		if (r)
 			goto exit_do_move;
 	}
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 exit_do_move:
 	etime = ktime_get();
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3a0511d1739f..a803af015d05 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1501,6 +1501,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	if (r)
 		goto out;
 
+	mutex_lock(&adev->mman.default_entity.lock);
 	amdgpu_res_first(abo->tbo.resource, offset, len, &src_mm);
 	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) +
 		src_mm.start;
@@ -1512,6 +1513,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 				PAGE_SIZE, 0);
 
 	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
 		r = -ETIMEDOUT;
-- 
2.43.0

