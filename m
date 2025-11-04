Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F26AC2FF76
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A4B10E57D;
	Tue,  4 Nov 2025 08:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rhb5q2yB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010041.outbound.protection.outlook.com
 [40.93.198.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A321B10E57C;
 Tue,  4 Nov 2025 08:37:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDvMEoTumw3KJLjyWbCwYi4HSARJOTuf66/P3aewmm01CIbZweWkgPT0dVEjHa5TUB9HO7kfWnptQd46SXRxUVCCgNYVr7Z0t9ZNQAJSfAflWsey4ybc18bdiCnpeENo/O4TMCCOxmycUI0YQa/wos9Lsb7eofUpwxfow8rAJyQWOgbwve74eNpzqK5xxaZ1Q81TxdEjLlMKFyqPxfxNN4xhR1vHUHNITAmjKqSH0j/v6lRa0M5bJO5dRQ3+m9KxPvmc47L0QmJSUCT0Qh6xRwLzsfn0OdLN79mpV/wLZEWpQ07hNDgaFn7jcArBFKHgvO8oOjA7WgJ9Ho7wOkY8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNCfJvw87+eSCYbboZr3Q5V7c21k4Xs3e+e3szPkKBg=;
 b=IHWoIhJRDNXEbtmQUGYbKUTf5qN9HdwNVm0A96q6sNQE85Fd+0IvEshi7K+7iQqkZnAhk4AB5NrF3KFoAd/olMnAwsZaT+gDW79LBm3Js54kBu9IQL0GEuBGFU3Eg/aR2OBIEHgGj0gVWE9CFdvdUFqeLLdFmqBJU00As7WpDelhip4SELFXFm16w6cZy7R3MNxmKPq1baHdCQaM1DaDLPhaLovJuvBzxPJ+uysP/eO7gDYyZObLD9EZK3roRIuIcKO3BVeKjYM3zC2JUJI4z5ePXXnQTorePmYwzVn3fEHoFABNMHOTftpVOBR9BQFF8KoQVK9gJG8AH/itLDB89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNCfJvw87+eSCYbboZr3Q5V7c21k4Xs3e+e3szPkKBg=;
 b=rhb5q2yB3ohkOdZp5aGiqM6/VWZvAfKI6p6a+67BSoO2iAXESjDPwPflDGzX/eehqvZEJIGoDbrZ3YLOFv04/9XhjPKaMCnvGU2f6tTuhWFIa/OFnoGYTEHfjAwc23CImPx6A8rS8M15L4PKD3UoSmpCHxE3YukR4VoPhKt/PI4=
Received: from SJ0PR03CA0080.namprd03.prod.outlook.com (2603:10b6:a03:331::25)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:36:57 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::d8) by SJ0PR03CA0080.outlook.office365.com
 (2603:10b6:a03:331::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:56 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:54 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 12/20] drm/amdgpu: use TTM_FENCES_MAX_SLOT_COUNT
Date: Tue, 4 Nov 2025 09:35:27 +0100
Message-ID: <20251104083605.13677-13-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c8da55-8dca-4f66-f149-08de1b7d506e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?apypBVZNFU3eiEBJwJqWAl9ouc69IkZX7boJcvdBuhIft5nAD3sTi00H8/dN?=
 =?us-ascii?Q?5B+pu7JfnqtS4wyOSTPwFJ6bXnYrRvtWOSv/OjiO9L1WazdjMrYKfvlWQFMv?=
 =?us-ascii?Q?XlCITZ02ckPCTiHOSMNxfqOsVxgZLjBQR0yPiic09/7YLm9m36yjMEN4ksRx?=
 =?us-ascii?Q?b/dLc2f9fuDOH8Q+gsbAE3R9UdkI6emBoGyKffEYV3kzsAROl7bhcOCXBISW?=
 =?us-ascii?Q?wFXl20K9WpS3bl5UW+kf3Z9as7XNdtHJMCdovXUeHgML3t4K+UIK2YbAmxvA?=
 =?us-ascii?Q?gHuURrocrkegG0GUGBqFYCPWe/vEJs8DxJLxPie3qt+HEyCXn4LYEy2YgB1x?=
 =?us-ascii?Q?HPoC8hZ8ohGMxw01423pZno/ttukHkKHf//5H/OJSgDdkb6xDEDmaJiMaypp?=
 =?us-ascii?Q?Y1T4w2pRUZjCkseBVWZ6IDIUvTgVNO93pMDnHIJDN32X63fSfXjfs6bxAlAH?=
 =?us-ascii?Q?QnadL6F2cI3r5CF4tOVn2ShxFgzYhIuNSphkmG0aeWbLNaJZtx0ZISoLwAyu?=
 =?us-ascii?Q?b4Zj2Do3e2nuOHoTxGgZLbgwwLRG8ltjdYXuPFtd4NUL6dYaMBXMPpJHK6Wy?=
 =?us-ascii?Q?pIhkDpkhM2Pv8ctVHBdnbXNuPyBrcDZkYC10zqAZDOgqpRN3CyDxdVb9M0VX?=
 =?us-ascii?Q?hvRGKGebAsEppJk/UfpUQpPLiLgKoqtZnWJKEhRs29/zlipF8p5fYJOtAQU5?=
 =?us-ascii?Q?9S1hoqGFR6lteQYpSdl4l9v4h0H1pz6fX+Xzvz9p1u+md6pT5QsNu9pRbls2?=
 =?us-ascii?Q?XVdB0dcgIEo9jTuZEhSnYlQXUw9fJIDEgYQZHXwUqxgOLdwuHMTL4ZYKL8QW?=
 =?us-ascii?Q?AQS5B1z91R+vUhSrO5AiSSzjXAs+RrrFEJtW4YuzSNjVkU1kuA+qPQNJGGbf?=
 =?us-ascii?Q?daH6cVBLdRr8ZsoaEuItLcuCTiWeiO6icR0ExloNymZ3AXsd2y55lhoexUEq?=
 =?us-ascii?Q?YTIcSnnr1VIhJAaE7hpAE+USr29PJTuSFSWIvM0RVbFQVM6Box7Y8MYRLlwz?=
 =?us-ascii?Q?HnEuBsexvPolfzIgI7I6yJbGFLk2Z9D6tLWgZhkkTpWqD5OJBR8Ot4DMhsVS?=
 =?us-ascii?Q?X5R6lG2mxKvK4zE9zCgBXZ7kFsF5gdx42PdEAyDYMX6qalcouzC5+BlTPG6p?=
 =?us-ascii?Q?/goh284/eXZrBCAqe4lXIAs5YK0jJ+1/VdcDRsCwnCjB7mgFXJqOeJIXhsBE?=
 =?us-ascii?Q?Yfm8icQFR+hCUva7Wss2ayM9KjVa9GGvsMTCOmSr+4AdT1lHwOegoWB7PMrc?=
 =?us-ascii?Q?6JpcSg5QBH9l8SE66E8clLRH6gf3Dcd/AeDLvO7QwWLUc/HSIKflFj8iyHZZ?=
 =?us-ascii?Q?CKPIfUaXtm+vtI24wVK1VH2yzdB2PCogz5CxhXhhF1DKy2it+369n8w3a7/0?=
 =?us-ascii?Q?ESpFBt2aRbrQnmnOk8xMgMeoJIhZlNwfayO+70akVBh3f1tHUj+K9jd+8t8a?=
 =?us-ascii?Q?HrENaOksMtvkRIm/6AIUesupenBDXJ40a1KS0oB9PE5/gYAuQ/lzSJ7HekU7?=
 =?us-ascii?Q?pfBu66jAHqHiyqnTeRKKE5OdriGYYnpR23mJb/qJK0VWxK5uFRSe95v7x++u?=
 =?us-ascii?Q?ssRjlvpdvfbbjoC8Gzs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:56.6162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c8da55-8dca-4f66-f149-08de1b7d506e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780
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

Use TTM_FENCES_MAX_SLOT_COUNT as an upperbound of how many fences
ttm might need to deal with moves/evictions.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c                  | 5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                 | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                  | 3 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ecdfe6cb36cc..b232ed28872b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -916,9 +916,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			goto out_free_user_pages;
 
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			/* One fence for TTM and one for each CS job */
 			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
-						 1 + p->gang_size);
+						 TTM_FENCES_MAX_SLOT_COUNT + p->gang_size);
 			drm_exec_retry_on_contention(&p->exec);
 			if (unlikely(r))
 				goto out_free_user_pages;
@@ -928,7 +927,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 		if (p->uf_bo) {
 			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
-						 1 + p->gang_size);
+						 TTM_FENCES_MAX_SLOT_COUNT + p->gang_size);
 			drm_exec_retry_on_contention(&p->exec);
 			if (unlikely(r))
 				goto out_free_user_pages;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index ce073e894584..f773b06dd135 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -353,7 +353,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 
 	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
-		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
+		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, TTM_FENCES_MAX_SLOT_COUNT);
 		drm_exec_retry_on_contention(&exec);
 		if (unlikely(r))
 			goto out_unlock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 79bad9cbe2ab..d9bb16186e1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -326,7 +326,7 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_FENCES_MAX_SLOT_COUNT);
 	if (r) {
 		dev_err(adev->dev, "allocating fence slot failed (%d)\n", r);
 		goto error_unlock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 2f8e83f840a8..bc11e212f08c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2630,7 +2630,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	}
 
 	amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
-	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(root_bo->tbo.base.resv,
+				    TTM_FENCES_MAX_SLOT_COUNT);
 	if (r)
 		goto error_free_root;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ffb7b36e577c..ea8dd17e2852 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -627,7 +627,7 @@ svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
 		}
 	}
 
-	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(bo->tbo.base.resv, TTM_FENCES_MAX_SLOT_COUNT);
 	if (r) {
 		pr_debug("failed %d to reserve bo\n", r);
 		amdgpu_bo_unreserve(bo);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 56cb866ac6f8..1f2a5dcfa3e5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -952,7 +952,7 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_FENCES_MAX_SLOT_COUNT);
 	if (r) {
 		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
 		goto error_unlock;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc87..60b57d213bdd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -106,7 +106,7 @@ static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_FENCES_MAX_SLOT_COUNT);
 	if (r) {
 		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
 		goto error_unlock;
-- 
2.43.0

