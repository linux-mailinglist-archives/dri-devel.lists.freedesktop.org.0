Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A165EAE3539
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 07:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CDC10E174;
	Mon, 23 Jun 2025 05:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gdb1gDPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D66810E160;
 Mon, 23 Jun 2025 05:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8QhOG7K6evqL+26VwyVKR0tVbzPUKAa3DM+nAhsbw+n5dAFHjkG+q8ggz5QRPIr47cQQq2AtDnV3k6pu0GhPW2MfT/nId9aAHEj255KQZfyV1ItdnJFooQIAEHp6NUXT8mKq2RyVy7ct7wdFQyI4IuQqtidtzFKOcSuRzGZwjHPJY9sYqev/ha07WhZWpuf4Sj8YAu2PVdSEle148R3x8WEueFwXeVhsy74ldF5+n8Boi3LEIAYcwAyPwtDR4omWRrv/OXD3WN//h0EWF+brF8XKjDNZNa0tM2xmnX3sBDikxwD1sPm0H9dSGnMGQMeEWX91hPSALZHBeHu05RzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c51GkuTuriJjXVWxsfOUTKfP6RCqNbu8UQKnDnnY2eg=;
 b=yCQEtgMHhWIe08lGUmYL/XTWxRt6kHbi4ZGSGX681Lgmznbq1AGGD+xm9Fnd5mTsapOqEicOi3uqbHFBYdzsc/9rOJtoFRCQZ+fclP3BgkffRWAJoOgKQLc+954O3g6ujXDACJO4rb+5DADbQFNwdfTL9codsqsgH8OsHBnMUMvrr6HNraIh7HiOnPNlYwLq861Fmw+UXpH0qgx+ioaNrvpvBr+W3xhSnuIUyMTSRJlcjfppVSrjan9dJ2Zjh4cMllaRUtYi2koDn39D5DYvOGnHm+wl9OfKwBsSfPFnekcZYtP/rO3bx2qEi8RjndByeSABALPffVQaV2mZmeTZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c51GkuTuriJjXVWxsfOUTKfP6RCqNbu8UQKnDnnY2eg=;
 b=gdb1gDPLqxIskCl+SVFvunOQdLXToGPyMWijzHa7vq+Y0ri0mYCidAYIOXTHvqlN4nLaeX12urHCONg9qMEy6KZIJc9MC2/qJlzJOaAD/6UPAt52+H3cNikTLksT71tc0XKUPr3MtgGfG/y9Y3xi1q1vcTC1YbX3ZxjztcPWzIM=
Received: from BN0PR08CA0007.namprd08.prod.outlook.com (2603:10b6:408:142::32)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 23 Jun
 2025 05:53:33 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::68) by BN0PR08CA0007.outlook.office365.com
 (2603:10b6:408:142::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 05:53:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 05:53:32 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Jun 2025 00:53:29 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH 1/2] drm/amdgpu: Dirty cleared blocks on free
Date: Mon, 23 Jun 2025 11:22:52 +0530
Message-ID: <20250623055253.56630-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 395db45a-0eea-49a7-bf14-08ddb21a4908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTB0NklHRHdtWnFDTHB1aDEvQ2VCU0JwUWZJU3lnaFJ2VDlNbEZtcFlteGxZ?=
 =?utf-8?B?NEV0dFB2V0RwOU9hbTlkaUMzRlhkU2VrYzV0Uitjc0tIcjdDRUMwVkEyRkIw?=
 =?utf-8?B?OTB1WWV6REQzcjJMU0RRUjRzUEUwV04yU2hhZFJ4aEdFcVBvdkd1cVZhK1p1?=
 =?utf-8?B?YUVJRUwvQldPZG5YZWlFekVBMU05Z2x6U015UktJVGZvUlpjS3Z4T3J4R0RC?=
 =?utf-8?B?RHFJMDhpdktBdnplMEJzTWk0NmVLaVFLNi9DeE9iU2kxVW5ZUk0xaWZIQzNx?=
 =?utf-8?B?MG9yNU56emQ3cFRjYWNZdndad2hvNmROeWFveTdjT3hRLzI5eVUrMFhkc3Mr?=
 =?utf-8?B?bis2LzhBM1JueWNsT1A4bGNKQVprWjNUd2NGNGpPQUpwTFF4UlArRnA0T0x5?=
 =?utf-8?B?NVZ5UHlab2MzUjRYVlhwcXdPTTVLRFNDSVRJdUJySHFCaDROZE1UbHNVUTdB?=
 =?utf-8?B?NTgvV0FNRkJPOTUrSmM5enBCOFpueDc3S3ozcm9aVFlFUDFWeWVSMW5DS1VD?=
 =?utf-8?B?d1c1cC9MY00zM0NZQ28rSjFWYkFzRGJyK1ByU0hIM1hmZ25jK1J2RDlTSDRG?=
 =?utf-8?B?SFhlUjk5UW00bzRpS0lFM1cwdkxQczE5ZExZNFRjK0VQVURXampuSURlVmxE?=
 =?utf-8?B?dFV1RW1XU3U3RkJkWFpwNW1SeUlPMGpmcnZ3cFdQdDRjTVY5cUJlWm0vMGZH?=
 =?utf-8?B?aWZ5ZDNycFBqaHg3NTc4bTFqTFEvZ2hlNTVyQWFnLzlUMGhkd29UbTU2RUdW?=
 =?utf-8?B?bUpZbHJqSEdEemhibVp2TERJK2lSTlZqK0hoZU9FUTFzd0RwNXFLSitIK3dt?=
 =?utf-8?B?c21YdVlVdmdWVWdaUWRuUmFORXJ4cnJadFV1QmhjR1Y1Z0FvMmI3NFk0a095?=
 =?utf-8?B?eFRUS0xCdXNUemMwRktEaDliTUlqVFZwa2RwWll5eUpmZEFDcEpIdWpzdy9S?=
 =?utf-8?B?L0pLWkYwSFVoZ1Q4N1NFalR0SXpKNlY4V2tvYUZENG1uaUFFanNTWFpOLzR2?=
 =?utf-8?B?ejhOaTYvUkJvQ2piR3ZsWG56YUcrUk1jbVdiZElldFpBQlFYSVJER3hFdHl2?=
 =?utf-8?B?S0lwQXB4UkNTNk9WWmFUTGFWM0lBdksreFZqVkVnN3NUNndXVWVaVFgra2xi?=
 =?utf-8?B?QlhXbGNuRTdoNUZKamRUbFIvSEtUaDBEanFQL2ZoeDdiSlVScFhhY1c4cHM2?=
 =?utf-8?B?SG1xckZPSlVTc3lpdmlWSklha0c2a3BRMmVwc3hJTXF2cFRNREU5WWpVRWxv?=
 =?utf-8?B?V0pDKzlTZGFBL28ydGxJM1U5eExieFFvSUZXQ2RmalVNM1c2UC9FckdGSFpz?=
 =?utf-8?B?a1dGUkxyMzlpZGlvUis0SEpjcE9CdEN5WWJTdGNYUXZvZ1BlWkVGdzllR1VF?=
 =?utf-8?B?WkFlVEpOWTBlQ05YT2k5Q3puQUVZUmp5QlZ1RXFpaVh1K0h5TTI4SlhDZFI5?=
 =?utf-8?B?YkhxV2tyOWF2ZHR3aU1ORCsyTVJqbUZwc0FobEU4eFdnWFNoblpVaTl1WjNT?=
 =?utf-8?B?dFBidlU3amRRQmVpSDc4NEE0OTFPdy9pLzlyUldEZ0pSM3FaUjNZMUVpWFBn?=
 =?utf-8?B?cGRVd0xnOHdFSFJLeFdKZmsySitKRXl5Nk45b3kyV0hQMzJ0SDhYUC9hUVVN?=
 =?utf-8?B?eWdUd1pWNnZqN0pLd1IzeDh4NHgyblNsWTYvRHRGN3pxTDdhL1F3UVhiTStx?=
 =?utf-8?B?SGN6eUtCYXJlZ2FoL1R2MGluZVAxdXI5NzZ6aGY1KzRQM2F5YUd6YnBsTUtG?=
 =?utf-8?B?R2tRLzBxdDRVY3QrM3RJTGpKdzdPZ2Qva0NJMUZxL2EreFFFQzRjTE9JQmRt?=
 =?utf-8?B?OVFaQWwzcE1uMVNhTzhRUG1sbmppUitKd3ZXdXpLbkUwY3MyalBxWTF0ZTRJ?=
 =?utf-8?B?NmtmRkVRM2hTdFpEbHJmOVArOXdoZGpFYTJ6Q3hMNDZpSDhzNFIydWFYS2tK?=
 =?utf-8?B?d0lCalVKRkZRV29BNmxkandWd3lOdUM2UWRqbHZDVG5jWVlVR2R5OERyTTd1?=
 =?utf-8?B?RWdEaER0UVFaM0llS3lYUWRjb0lRaFM0OEc5VlVYUHg1c1AramJyOG1RUEtG?=
 =?utf-8?Q?RvNcsA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 05:53:32.0257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 395db45a-0eea-49a7-bf14-08ddb21a4908
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141
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

Set the dirty bit when the memory resource is not cleared
during BO release.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   | 26 ++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h |  7 ++++--
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 73403744331a..ea6ce53c3a44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1302,28 +1302,40 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	 * So when this locking here fails something is wrong with the reference
 	 * counting.
 	 */
-	if (WARN_ON_ONCE(!dma_resv_trylock(&bo->base._resv)))
+	if (WARN_ON_ONCE(!dma_resv_trylock(&bo->base._resv))) {
+		if (bo->resource && bo->resource->mem_type == TTM_PL_VRAM)
+			amdgpu_vram_mgr_set_clear_state(bo->resource, false);
+
 		return;
+	}
 
 	amdgpu_amdkfd_remove_all_eviction_fences(abo);
 
-	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
-	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
-	    adev->in_suspend || drm_dev_is_unplugged(adev_to_drm(adev)))
+	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM)
 		goto out;
 
+	if (!(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
+	    adev->in_suspend || drm_dev_is_unplugged(adev_to_drm(adev)))
+		goto out_clear_err;
+
 	r = dma_resv_reserve_fences(&bo->base._resv, 1);
 	if (r)
-		goto out;
+		goto out_clear_err;
 
 	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
 	if (WARN_ON(r))
-		goto out;
+		goto out_clear_err;
 
-	amdgpu_vram_mgr_set_cleared(bo->resource);
+	amdgpu_vram_mgr_set_clear_state(bo->resource, true);
 	dma_resv_add_fence(&bo->base._resv, fence, DMA_RESV_USAGE_KERNEL);
 	dma_fence_put(fence);
 
+	dma_resv_unlock(&bo->base._resv);
+
+	return;
+
+out_clear_err:
+	amdgpu_vram_mgr_set_clear_state(bo->resource, false);
 out:
 	dma_resv_unlock(&bo->base._resv);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9c5df35f05b7..9ec14ab900f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -407,9 +407,10 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
 				       false);
 		if (r) {
+			amdgpu_vram_mgr_set_clear_state(bo->resource, false);
 			goto error;
 		} else if (wipe_fence) {
-			amdgpu_vram_mgr_set_cleared(bo->resource);
+			amdgpu_vram_mgr_set_clear_state(bo->resource, true);
 			dma_fence_put(fence);
 			fence = wipe_fence;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index b256cbc2bc27..1019c5806ec7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -64,9 +64,12 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
 	return container_of(res, struct amdgpu_vram_mgr_resource, base);
 }
 
-static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
+static inline void amdgpu_vram_mgr_set_clear_state(struct ttm_resource *res, bool is_clear)
 {
-	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
+	if (is_clear)
+		to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
+	else
+		to_amdgpu_vram_mgr_resource(res)->flags &= ~DRM_BUDDY_CLEARED;
 }
 
 #endif
-- 
2.43.0

