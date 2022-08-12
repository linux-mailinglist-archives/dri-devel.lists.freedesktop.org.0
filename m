Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C221591189
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2FCB3732;
	Fri, 12 Aug 2022 13:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44178AD4F;
 Fri, 12 Aug 2022 13:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BReGln4lKP31JmqGtE4crx0GPrFVf2XTXvCPGVr3vUt38ETJWFR5gFKaCc9orfVVvecRBuxwocHN33Gcr6jhzl7v7o6r5iKTsgsZYvCKPuhqRJsRhlCPOjxUJYsXlBgc5/1e6dyFIJNU8k/PmogZG0Q8AtjR/Aoxt2IfoemLfLt/uf9Xv9RRp11DoPjHpXeb1wj8JipgDLp/bMQd0Wft5RK2uIpny7fvYLJ9ea515p8Zwc/knlhk4XvVQ9UESrPxTP6LJaIBBLgPFW8rSm4L/NmDJC8v9zO3vNzOjgenbRjYL5Wohp0aNTc7uDsX/EaNdqe8D67kTniSZYbUV4zJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0tVgp4dPwe9uRCX/ByYqj+VrP4Jt5kCW6M1133Uu70=;
 b=kFg3Wv3yuYb0irRscPtNHLU78ZnRpS1NW+PvgSy3lMNLPY9WVKt1fhXhMqdYMICHlxMOd9ADTNuMnJqeOt5FYPEdSM2jFGy/PxyV8R2yt3FppuZ6OtrYF/ilSfaBk6jWS+lOk2HSiW4AU3Oc9+7OQzrdCZt1kznQR/plVj4un2QOiyu7g4/Qn5xSKpDxmGI0K8Vec7zQ1IPv4awFJdPTb2kom8Sf0jmSuqCbimlrUZmdckkDOsAXFwy+rQlAbFLqz8DzOHRhk+NhtMBuP6JntVfCpHEiMJnYjmiKLAO76r9rO92w/ug59ZT1dwiUBz1bGOx4nFDs656wLq8xE+ZW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0tVgp4dPwe9uRCX/ByYqj+VrP4Jt5kCW6M1133Uu70=;
 b=sOmYQ2cDAphTWmrdIHYT4VFN/kNdjc+7NdD8o60CBAz2orrSlKoLw3BQ5XM9y3rg1g3QisZ0yTGM42VMvjW6mk0U+D2MQI1Uy4eDAwpRumBc6R5V+YgwQR3gUxFp7ZQaCjmQZvf57sr0SxOuA007yKqYxSiZJkrT/uvutAOkNQE=
Received: from DS7PR05CA0078.namprd05.prod.outlook.com (2603:10b6:8:57::24) by
 MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 13:32:25 +0000
Received: from DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::ce) by DS7PR05CA0078.outlook.office365.com
 (2603:10b6:8:57::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.6 via Frontend
 Transport; Fri, 12 Aug 2022 13:32:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT069.mail.protection.outlook.com (10.13.173.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 12 Aug 2022 13:32:25 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 08:31:54 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 6/6] drm/ttm: Switch to using the new res callback
Date: Fri, 12 Aug 2022 06:30:48 -0700
Message-ID: <20220812133048.2814-6-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 690bd319-e58e-45b0-3df3-08da7c67184d
X-MS-TrafficTypeDiagnostic: MN0PR12MB6319:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rtk/ntwbHdVyVRcqFG0A9vOqSK/DuUQfxLKD5FVcskt43s3UE0JBmzNVBu0A471f93puHcB7g1F8PLBk1wm+SN7RVxusAntLxaOrByIr8+5oFUoQexG7ZW2EDNtyMwOGA0Ca4CiBgWnbKX/OPMHZo93udEHR0qAEpToO/6ZppF9UNClPVJWzScmnI9xeH5XvG1lNmLDtEWwiK0piFAWcFlvLdX9xGwdrcOVNohJD4xsQYxDZ8b5f3Lg2duYvOk4eS5IFd7xKi8uOeN5IfW4PqfviAIJbdfAyeHpM2aW0FhqjF7ChqclMaIqa5MWX5t1aBZixgYuh2j9K22teBfdtuhLIXJgIR/Ff1UX6yyeHa/+gJYi2i0rXpErfjeus1tKWsdcRkTr2AbehP4rS5uJRd28PJ5HAydcRZYh7MsT55hjSg7XlWWCYOrbdTRLAvWv8w1Vf569qpfDbo6+QP6vyu8reJkpToHnC/3t37pndblFluJt9C9fPkJsUL32gnRI7A+OukMeSCvRZgYHKVvOZA+5nM4BvtNYoSIkA6HbV3JnH3x/exrI5LqRhGFSJdKYxy0lka569VA13VTsQnAR6UeNvm5uoWYR4BVIUa5oV0QTB6v1xzU4KmXJVzKlI+HTFHmX0ZodWVKn3pw4rF3sfYnf7VlwJ9Yn5CXs4GyuEfQDs1exE0wGmFI/Tt6+hpSdjsbiXGyUgkcOJVESIcQTth9Cvhl5IZ/e7m+PPli0Uh4XWffBBaYTQrlfe7g4obFtRWiSdqKH0j36s1SEF1lQShEO8dsVk30gM1YOd8G8qmncLjDcBYAIN83saG5EgjG0pp8MH984gd0sPa90KtNz3Fg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(36840700001)(40470700004)(46966006)(186003)(41300700001)(26005)(47076005)(16526019)(1076003)(426003)(336012)(36860700001)(86362001)(40460700003)(6666004)(7696005)(36756003)(82310400005)(110136005)(40480700001)(83380400001)(54906003)(316002)(4326008)(2616005)(70586007)(2906002)(70206006)(5660300002)(82740400003)(8936002)(81166007)(8676002)(356005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:32:25.6443 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 690bd319-e58e-45b0-3df3-08da7c67184d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319
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
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apply new intersect and compatible callback instead
of having a generic placement range verfications.

v2: Added a separate callback for compatiblilty
    checks (Christian)
v3: Cleanups and removal of workarounds

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
 drivers/gpu/drm/ttm/ttm_resource.c      | 17 ++--------
 2 files changed, 15 insertions(+), 47 deletions(-)

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
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 0d1f862a582b..a729c32a1e48 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -276,17 +276,9 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 	if (!res)
 		return false;
 
-	if (!place)
-		return true;
-
 	man = ttm_manager_type(bdev, res->mem_type);
-	if (!man->func->intersects) {
-		if (place->fpfn >= (res->start + res->num_pages) ||
-		    (place->lpfn && place->lpfn <= res->start))
-			return false;
-
+	if (!place || !man->func->intersects)
 		return true;
-	}
 
 	return man->func->intersects(man, res, place, size);
 }
@@ -314,13 +306,8 @@ bool ttm_resource_compatible(struct ttm_device *bdev,
 		return false;
 
 	man = ttm_manager_type(bdev, res->mem_type);
-	if (!man->func->compatible) {
-		if (res->start < place->fpfn ||
-		    (place->lpfn && (res->start + res->num_pages) > place->lpfn))
-			return false;
-
+	if (!man->func->compatible)
 		return true;
-	}
 
 	return man->func->compatible(man, res, place, size);
 }
-- 
2.25.1

