Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D799C589D6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED2410E895;
	Thu, 13 Nov 2025 16:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OutNvI0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013054.outbound.protection.outlook.com
 [40.93.196.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A70A10E89A;
 Thu, 13 Nov 2025 16:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMlT912tXMYZ/0N/StWXk0ABk0POfG/u2lZJl629FQ+4mYcxPgOSgy0U0S+l6GtBBP61LwNbY6eIHJzpPADGm5+HTKGcflWwm6lOEeTWwF6TbOZxITsH+0OTsHWCAqq23Xbd1E5IU8hZoKerabPj1AZNpYwqEudKUY8DFzHQCg0ETzYbGv9tKmO15irJ7w6VvU69WKRCUqQsPHqgDto/l7gsZP+44stApWyYdBjsxQDvHjaiX3/paRg5agCE4YhLgOTp+YxaV4QdylLZGFzuaMHKvz/Di4GEcgM0leFRIuIyEPFtsOyKU0ZY2prygEsSEjcesC9gGWxsIr811sfzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQAmRoSEjxJJbaf0qnFuA+SynIf1jE3xmSg+bMdtVf0=;
 b=tR9G/z8+lTiCRrMQWu0Nl9HUl8WwWAOmPh11oGfCHp2v7AqO4lL+mFqtR13WLqcFebpIVaVjYzpjq0fD07BD6lXcYjRtE/WvBGj+p8XylF9Z8Gx2GvqSwAFCECY4gtcD03E3IpeZymG0W6BPM/05yzUU6dzjqnDROuwVn2XPQbLIDXhwpSGkjoIbBdO6jHj/VOxNdP6xjakpw1kSPi+wG0rMEpV5opSF270dfDXgiyMqFvAoXz0rJrm63FgRKReeeyVEiiFjvsS75qXQ9/1CrYjHoYO64Gvp36MNDvPZ0nk+PKDfr8VjCYIzlRTwxr5Zb4vh0MqnCS7FM+fMyIuBvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQAmRoSEjxJJbaf0qnFuA+SynIf1jE3xmSg+bMdtVf0=;
 b=OutNvI0GrgVKpGQHyBNNmojj9htQStkHz0bbGR6VaGJwRTry8/7KQ1PGbcHnfRl7aZJjAkevefWuUhh/H/I+Ajdn8S/ofAp/edOxvzEUf7pUStLhq3g/WnPomqL94/pmtzaeOpzuYO+AwcL7xiBnrQDIbP1U38xQg/9nXUcMUNo=
Received: from BN0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:408:ea::16)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:10:49 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::d8) by BN0PR04CA0071.outlook.office365.com
 (2603:10b6:408:ea::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:10:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:10:49 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:10:47 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 13/20] drm/amdgpu: use multiple entities in amdgpu_move_blit
Date: Thu, 13 Nov 2025 17:05:54 +0100
Message-ID: <20251113160632.5889-14-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|BL3PR12MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 306dea2a-56ef-49c4-b121-08de22cf3644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?haCKpKZPAfsjsroPw5ASLkDKjtLsDAj/3TKaA6cgY4Xz3z5ZLozVpquewgRR?=
 =?us-ascii?Q?/GWJ1Ci/du8GX3JqYpsLISAQVBlL3GSRSEd/PtAH7PIJZlb6+riAwCbMCPXb?=
 =?us-ascii?Q?SqkffizPUtj1/HjGRdvsEASxSeu+WmstkE1IHC3qmwY4OJjrtqjXfKFjDGEO?=
 =?us-ascii?Q?/UZ+/VduhyyhSHjIp/QoRJ8bLq+ywoOMmvF6EVsxRPMxXBC65bCZhdYNM/PN?=
 =?us-ascii?Q?gbLUaQdQMbUHiDL1OIqNhM5xiIrmeXlFyG8+M/yponbTPHzCX2c7OgdSDLFh?=
 =?us-ascii?Q?9fnQXjyYnWqe2dIrQjiiEP8T6L21rRzGo8v7Xw/jVZ639+BkmnOx1SjVK7/h?=
 =?us-ascii?Q?/otJYjmM67DXJpzadqiGxAanBT9lbqZ2036sj0qPLQ2bcei0tCCpd38QR8jx?=
 =?us-ascii?Q?a9oy7vP0KB5eu4gojLnn7fccFdlaJpyj3zM71fFJSEXGAApRSOxghIYzHEB/?=
 =?us-ascii?Q?oEzotda1jAlH8HmKQCfslbe+HeKpoeYEcME7KXCD0m02q64KdIVcMvJD1cPn?=
 =?us-ascii?Q?H0pziM8/VvvmGn7w56yjNRV4+TyOmUGjVV8otLfmHwPs83GbfWI3gm5hadSU?=
 =?us-ascii?Q?QkszZWl0/5yrGsko/K+U8+knRbVt399ccJhaDvIKnw2kfjWRJ9QJMKwI7iNB?=
 =?us-ascii?Q?mD0IMJTGOcui1PApsspPbp++hfH28CKXMbCwhReM90cdmWTPIA09hKOQdpEE?=
 =?us-ascii?Q?4M/3dTzgU1wtATW54OvsePi/dlu00f1KvNVBeqqorZM4UeLNs2mooWYRadvh?=
 =?us-ascii?Q?XxhlLyZxiDvEle0R5yDXZs6Q1hIRmEEp/Y5zbuEZiReYoYj3qX5mhdbe6mvK?=
 =?us-ascii?Q?wqZTzbPGV4tvO0k8OaPcGdD7cZGVyh9ag6RTOy5uDLiTHUvl5abEJi8EJL9j?=
 =?us-ascii?Q?PlLHxV0RWaqstRuB//aP1yLHdwH9i+Ouya9Zp7Af7Qqqx3FTuz6z+5TdD+CD?=
 =?us-ascii?Q?k62pE6x2pPDrzGkmMETT+arho9lnCzfjuHvaIWYg4BJXvJgIKeQuXw+lAcsB?=
 =?us-ascii?Q?ZWp74/yV+ZT2Ec4s/vbLhG5RV9Tq50z8JUjqy14qSoV5j/UcnH88fN7TCF/Z?=
 =?us-ascii?Q?KRnMe9vpOeWgaDrBEWdya7DdhccxpQUooXSnBNpIqWxSQsRGGzxkr4N15FB5?=
 =?us-ascii?Q?6KgRkUm3F6B37se/TLYQldjBajsrAV795bwKh9BIcALYFbc4suCUeOCTTPUh?=
 =?us-ascii?Q?5U3m0JLQZpCRrZM7Mhbb/A4R5SP6TnGZm6I4mNV8VNz60qCf6H4n3Vy9rggS?=
 =?us-ascii?Q?sdnzMILyAuoTDxDa4plYQPojwOqu40qn0ILAlYTU4uStPQi6PE29nvjvFssw?=
 =?us-ascii?Q?OWDgXmOsp7ysPsx4teeybgZEbgASZBJ5gczQNz0XedtB5DCTkb2USAiapecJ?=
 =?us-ascii?Q?PVZSRr5ZwwCYgsd70HxdXUtH2E0yAFMS+kSGnk3Q36piaNtYPAG1TbrCiMW9?=
 =?us-ascii?Q?Sg2dCOIeryhz2m4YThvSdZiw3SymTZdwDk85HDRhQXt9YE0jPnelgr56V+lr?=
 =?us-ascii?Q?0eBPqrrtv8msyDbPNW536/YiC6s2lUSaTKB/pc+VXHOIaEPulDGsIv3Iov0/?=
 =?us-ascii?Q?xD8vZMmfHoEDotHIsOo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:10:49.6313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 306dea2a-56ef-49c4-b121-08de22cf3644
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643
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

Thanks to "drm/ttm: rework pipelined eviction fence handling", ttm
can deal correctly with moves and evictions being executed from
different contexts.

Create several entities and use them in a round-robin fashion.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 486c701d0d5b..6c333dba7a35 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -401,6 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_copy_mem src, dst;
 	struct dma_fence *fence = NULL;
 	int r;
@@ -412,8 +413,12 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	src.offset = 0;
 	dst.offset = 0;
 
+	int e = atomic_inc_return(&adev->mman.next_move_entity) %
+				  adev->mman.num_move_entities;
+	entity = &adev->mman.move_entities[e];
+
 	r = amdgpu_ttm_copy_mem_to_mem(adev,
-				       &adev->mman.move_entities[0],
+				       entity,
 				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
@@ -426,7 +431,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
+		r = amdgpu_fill_buffer(entity,
 				       abo, 0, NULL, &wipe_fence, fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
@@ -2179,7 +2184,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	uint64_t size;
 	int r, i, j;
-	u32 num_clear_entities, num_move_entities, windows, w;
+	u32 num_clear_entities, num_move_entities;
+	u32 windows, w;
 
 	num_clear_entities = adev->sdma.num_instances;
 	num_move_entities = MIN(adev->sdma.num_instances, TTM_NUM_MOVE_FENCES);
@@ -2205,6 +2211,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		}
 
 		adev->mman.num_move_entities = num_move_entities;
+		atomic_set(&adev->mman.next_move_entity, 0);
 		for (i = 0; i < num_move_entities; i++) {
 			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
 						  DRM_SCHED_PRIORITY_NORMAL, &sched,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 781b0bdca56c..4844f001f590 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -76,6 +76,7 @@ struct amdgpu_mman {
 	atomic_t next_clear_entity;
 	u32 num_clear_entities;
 	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
+	atomic_t next_move_entity;
 	u32 num_move_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
-- 
2.43.0

