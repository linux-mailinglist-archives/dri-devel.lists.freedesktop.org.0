Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D6657B1ED
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBC9113A52;
	Wed, 20 Jul 2022 07:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2084.outbound.protection.outlook.com [40.107.96.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB01E10EEFB;
 Wed, 20 Jul 2022 07:41:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip056n1/uI0orYh+Bd1F7+LpeqevK3clJOL+JmcW2EPgzvlOvMTEcbUxUWkjiPuAYn/uqRmqwtS4FMbY5KQzJ1yZNkGmg8qpHbk4+7W7ERDNASUZ+YnxrJ67l0TIEXMP5xRqoVie1aKlGWzjlNvuKwmCcftxm7JP3yYzv1f2gakLmKYF9fbkhp9n7UzKMuY/zof8Ou6wdTytObSVwIfhjVrWxQF3RJ+o6dbRf3HK1lq0gkMXx/mGGC+MIOZ+41fAtmGrdX06HE2pxye7AOrk7rLU5fCHnQ9bwFwBJJk5eIk79qTOMgy3uPF0x3S02LuLSveHOD1NCCbjdPDDn6ttQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6p46eBl4vTsyEkyIWmxjuy18oI6FGeXiFibDW+O6K8=;
 b=jCVSKq+9g1zAQsnWe4kB62Yd90KgKn9Ukll8IqTCfKoZvAIKWqgXhCkSiHbwUsfu9MHPBqhkus52nDf7pd7w81S4dOh8sU3oxQ3GhAYzvXIDrGjtsOdgbzjCxPIEE42OKN8bGn5QaXVdLaynoXpCyYMiYtp0f/IJUvJPEmxfREe4Jv7SD0ijqEXKe7/GiAVImJ9TK1p8gtBMOyAgvfDRm5hSiMRawvTCbhTq6QjioWqhRP6+6sK8COFI9VUZqwZ5BZ4/LbX86O4bP3p+LYuxYItYrHgRNSNDAhVEp+rm9zSXzOzMDdKBk/aXvPWAmFEnfCTHIbRpxmYVKrQIKKhptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6p46eBl4vTsyEkyIWmxjuy18oI6FGeXiFibDW+O6K8=;
 b=hcO2PCGpt3byBuu6odQokcgnZ5t8DuwYxZWwLAA66bchAjckil1wEELnQnE5VR0GJUAqekVQY8NfsVJW3E/ImUoOfSxOelWiMISlBeXNrW0hEpj/5yxNscCDCferzXFs3v8l3wtgstdqeU6C1XxNDqs7jw2mKOv1uvovflwiAnc=
Received: from DM6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:5:80::21) by
 BL0PR12MB4849.namprd12.prod.outlook.com (2603:10b6:208:1c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Wed, 20 Jul
 2022 07:41:06 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::1a) by DM6PR08CA0008.outlook.office365.com
 (2603:10b6:5:80::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Wed, 20 Jul 2022 07:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 07:41:05 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 02:41:02 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/ttm: Switch to using the new intersect callback
Date: Wed, 20 Jul 2022 00:36:06 -0700
Message-ID: <20220720073606.3885-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6037e17d-8639-4d87-cc8b-08da6a23342c
X-MS-TrafficTypeDiagnostic: BL0PR12MB4849:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GH+U2G21avp7CYavPC6UEt0bQnsK15h63ho3w2gB8k6csfDEVWjBiCl6gIXjeqaLhWtN0+hfnlim3g6AcFsjri59jMIvDwRYIB+4y0C/AEVMrHR2xX2VJiW8gvdAKLktqUWQjZcUVtC0n0yQ3woxd7o+TrtbrBwsc70T3VRuQOOgS+Dkd/fN1gXj+TYSxW+MzRgQgfF6tR8lLXTlZZDgxlGM6zoE9EDSkvuNgCHw8KHXw7/TC1llfSonwl2lmOt9/39ldY6HLGujntEM+yTZ9NjY9qTmIGj3U51oYF+5+22C9pXr5Na0dODid1e5R431PSlDWeC8VNioQBFT01YXSVk0im8wBCdbgs4GlNEwkkfBDv/Bc/rj0h4xApZkgnGWHcqaSDRTlIO+r1y/wmymwzb3DeTZc+pqmK9fIylkoRx1QwGw3Dm8qV/o7nWVtNppvRgIkLmaBEm6if0RT+W6g8emAev/SQa1ZHC/lHqzwrZXBWmNv2vEO1+VbNYqtJLfQNpT2/MN4/LbLqR/7ILYkIkXoQozvTE6XfmsGqcewmEaFsBGo7LvJ3PdxX2JU8ePTXgKbTp+59pCB/DUhDkKQiOpb1FYtIB9BSCuavIWFNVNYyvIcpc/7H1UuDud6f3IXhIXn6BBk4G/zN5ec4jlNZ8FwMQYZhvRh5m51WbyI1dc6Yh1EfacvcyG+s6BJlnNU4qVriXsCSEQvXO8SgcvJd96L0eiIG43XiyK5jhn/jGJ9aBvnvCkPEphtjcmSpklDjy9kpXCKDK2xNJhcLCVRnKFFALXHxQrtPqwhGbtyvXhpYWCMka18PBskBfgnJCHQhWvsFslFHwA5fDskYruPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(40470700004)(5660300002)(26005)(36860700001)(86362001)(8936002)(36756003)(1076003)(66574015)(426003)(47076005)(16526019)(336012)(356005)(2616005)(82740400003)(81166007)(186003)(83380400001)(110136005)(40460700003)(54906003)(478600001)(41300700001)(316002)(7696005)(40480700001)(8676002)(82310400005)(70586007)(70206006)(2906002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 07:41:05.6847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6037e17d-8639-4d87-cc8b-08da6a23342c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4849
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new intersect callback instead of having a generic
placement range verification.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
 drivers/gpu/drm/ttm/ttm_bo.c            |  9 +++--
 drivers/gpu/drm/ttm/ttm_resource.c      |  5 +--
 3 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 170935c294f5..7d25a10395c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1328,11 +1328,12 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
 static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
-	unsigned long num_pages = bo->resource->num_pages;
 	struct dma_resv_iter resv_cursor;
-	struct amdgpu_res_cursor cursor;
 	struct dma_fence *f;
 
+	if (!amdgpu_bo_is_amdgpu_bo(bo))
+		return ttm_bo_eviction_valuable(bo, place);
+
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -1351,40 +1352,20 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			return false;
 	}
 
-	switch (bo->resource->mem_type) {
-	case AMDGPU_PL_PREEMPT:
-		/* Preemptible BOs don't own system resources managed by the
-		 * driver (pages, VRAM, GART space). They point to resources
-		 * owned by someone else (e.g. pageable memory in user mode
-		 * or a DMABuf). They are used in a preemptible context so we
-		 * can guarantee no deadlocks and good QoS in case of MMU
-		 * notifiers or DMABuf move notifiers from the resource owner.
-		 */
+	/* Preemptible BOs don't own system resources managed by the
+	 * driver (pages, VRAM, GART space). They point to resources
+	 * owned by someone else (e.g. pageable memory in user mode
+	 * or a DMABuf). They are used in a preemptible context so we
+	 * can guarantee no deadlocks and good QoS in case of MMU
+	 * notifiers or DMABuf move notifiers from the resource owner.
+	 */
+	if (bo->resource->mem_type == AMDGPU_PL_PREEMPT)
 		return false;
-	case TTM_PL_TT:
-		if (amdgpu_bo_is_amdgpu_bo(bo) &&
-		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
-			return false;
-		return true;
 
-	case TTM_PL_VRAM:
-		/* Check each drm MM node individually */
-		amdgpu_res_first(bo->resource, 0, (u64)num_pages << PAGE_SHIFT,
-				 &cursor);
-		while (cursor.remaining) {
-			if (place->fpfn < PFN_DOWN(cursor.start + cursor.size)
-			    && !(place->lpfn &&
-				 place->lpfn <= PFN_DOWN(cursor.start)))
-				return true;
-
-			amdgpu_res_next(&cursor, cursor.size);
-		}
+	if (bo->resource->mem_type == TTM_PL_TT &&
+	    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
 		return false;
 
-	default:
-		break;
-	}
-
 	return ttm_bo_eviction_valuable(bo, place);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c1bd006a5525..03409409e43e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place)
 {
+	struct ttm_resource *res = bo->resource;
+	struct ttm_device *bdev = bo->bdev;
+
 	dma_resv_assert_held(bo->base.resv);
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	/* Don't evict this BO if it's outside of the
 	 * requested placement range
 	 */
-	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
-	    (place->lpfn && place->lpfn <= bo->resource->start))
-		return false;
-
-	return true;
+	return ttm_resource_intersect(bdev, res, place, bo->base.size);
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 84c21f92b422..ff3e9058943c 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -285,6 +285,8 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
 {
+	struct ttm_buffer_object *bo = res->bo;
+	struct ttm_device *bdev = bo->bdev;
 	unsigned i;
 
 	if (res->placement & TTM_PL_FLAG_TEMPORARY)
@@ -293,8 +295,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 	for (i = 0; i < num_placement; i++) {
 		const struct ttm_place *heap = &places[i];
 
-		if (res->start < heap->fpfn || (heap->lpfn &&
-		    (res->start + res->num_pages) > heap->lpfn))
+		if (!ttm_resource_intersect(bdev, res, heap, bo->base.size))
 			continue;
 
 		if ((res->mem_type == heap->mem_type) &&
-- 
2.25.1

