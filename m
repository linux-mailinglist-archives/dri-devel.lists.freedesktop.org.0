Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9529B0BF1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA5810EB5D;
	Fri, 25 Oct 2024 17:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WayHzUTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7625110EB5A;
 Fri, 25 Oct 2024 17:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4gqpTZxd6avzlp++ZvE6tLdhNRMAgCcYmb+xsskvFkE39PQxP3rThVGEqwbVVhvcFufmZCCTutbCYnDytw17diqKOJ8beQVYYw1/L7OXcynVlV1rW7nST1DpTsXIxLEZNEWClfSbK49ZwnGpfwCap3B96bv9wVJRn/UgAonSnFjGhTd+e0gBvY3DmG5pyCJ9QoJWIslXqjTZK1c56z24VYzgmdM1dzQ1brBt8WBstRvD/BS7KEoYy3yNg9rmGO0BhSMfZwqZQQggAUsN5s48ErmFMAoPzMP9KsOLbPgdQIrkYu66YtlX+UepkgA1CoL6gCGzJsrL0tEDoxjnPQm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgm7SYWvSne0CYCzpWhnAq8+2UVMQSeTOmWLgZO5dbI=;
 b=WTqJldJMKyfSzDjQd01R8qPWyyqBQGAiKWFV6lFR1ExjrBF0Zk9ncyjEnWZjHL73RaaEZytahXjxmMquw22Isi3uG8MLS15kXlP8CKJvDGIS/yjOIbNn3Cl/aUYkBqvAzkY6nRg6k7h89fzib0wYOQRCfOMk3VgWJGl2iNpF/QeGTuwKnszy+k1InXb3rmz9/RXyGl187+cFQrNAgcIYL7hLmGyKpueLNoqNopZjtXlZQElStUzxUk1BNLF9WyWInre40Tyu+M8rCKkyXrpUrGvLBmzJg0bBKU261PCld85w781Fd0cB6c3iJEwZjG+vis38bRN6WqOh+98VJ3XsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgm7SYWvSne0CYCzpWhnAq8+2UVMQSeTOmWLgZO5dbI=;
 b=WayHzUTria175065zk8fVaqV0CQGeZcbu4LNpKDyqY0ptZNAk8JcjBLm/nIdM5d1XzHfC/JmWY182chzJXhEMeByPNU+nXQA5ymuOJb+S42vzCb4FtYntsI2Uu2zPLAqdcWRjb9gcggu0fUeZfLuBVENW0Es2r5OqsLGM3E3s60=
Received: from SA9PR13CA0070.namprd13.prod.outlook.com (2603:10b6:806:23::15)
 by SJ0PR12MB6782.namprd12.prod.outlook.com (2603:10b6:a03:44d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 17:41:45 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::a0) by SA9PR13CA0070.outlook.office365.com
 (2603:10b6:806:23::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.8 via Frontend
 Transport; Fri, 25 Oct 2024 17:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 17:41:45 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 12:41:43 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v6 1/5] drm/amdgpu: remove unused function parameter
Date: Fri, 25 Oct 2024 13:41:09 -0400
Message-ID: <20241025174113.554-2-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025174113.554-1-Yunxiang.Li@amd.com>
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|SJ0PR12MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc00c76-2123-46c3-bf5c-08dcf51c4b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG5TYWpobFEzR0JRdDF4Rnd0M1IzbXlPVTFPNDhGZ0xXNGlsUWRER3ZRQUpm?=
 =?utf-8?B?T3dib3Via0pjQVBBN1I0eDk1ZzhpYWZjMVNxTU9ndXZHQldYQUp1UVRoR3FN?=
 =?utf-8?B?YlZpQWE0R3JzaStCZE4rU2krWFM1WkZQbzQrTTdaRHZLejlSNGNVcEk3VUlF?=
 =?utf-8?B?WG1hM3FPRTU1SEl5L0MzTXVQR3NBQ1MxOVVsdmFIMnpmNmhKc0ZjU0F1ZkJS?=
 =?utf-8?B?VEZLdTFVMmU5di9vN2RBekhwRC9XL0hxS0dJNEQySEJXQklMNUg2SVZhRFly?=
 =?utf-8?B?REUrNlFJd1YyRGdwSWdFUSt1R2J1WjJHUDJKZnQwZTlDZWhsMk9PZ3djUW1N?=
 =?utf-8?B?cVNKS29DTmJTKzVjNk9PSVRRWG05a2QrSEpnUzBNbWtoZWMrZy9RdzJkQk0y?=
 =?utf-8?B?YjJyc3pwRVJUVU95bElTdjRRTHA3ZWhmSytmRWM1TmtOWi9NUHVQRWRwQ0tJ?=
 =?utf-8?B?eWZhSEx0RGxPRmgyM01DMFNGYUtHcGw0STQ4OEhJZHlPVmp3MkR2V2NIaWVt?=
 =?utf-8?B?TGZ0QUJ0OG5Yc1krR0FxbTc1VWkycTYrL084T1UrbFFmSTJjcWVIbjRCS01a?=
 =?utf-8?B?c0Vac3lIMUxDKzZRSzBxdytvM3I4cUJtRWZmQzF0SS9BL0FWcWd4N28rbWhZ?=
 =?utf-8?B?S0g4U0oxQlBLbUFkT21OOWY2WkJaWFRjVHg5b1JwdVBWKzBPTWZhQkNMeXJ6?=
 =?utf-8?B?ZXpLbmNGWVFiSEZkcnVEWWtDZjlVRVlORXl0czdWaEhsL0pKZFZRL2tMRGZO?=
 =?utf-8?B?QUxqODFNclBaRkUxcGFVakpXcGo5aUpYaTRGS2RCUjV6aklnTC9jdm8xeFJn?=
 =?utf-8?B?UWllWFllZC9RMjRMWE5jTkIzdkpQVnZhRkFrbHZCV21NVzNFOWNYRithQ0M5?=
 =?utf-8?B?Nk5HdHU3UTFOeUxNeGRzSjZRSVBnR29YeTNzS0VBdnVXZDRMUEhQMDdBN3FT?=
 =?utf-8?B?Q012eWtIYmhxc204VG1rQlFSeG9zOWRDVWFyTlpCTk84bWFxRG1nSFJUclRW?=
 =?utf-8?B?WHJDbXMxeUlrWkxZdGs0RERYdFl0cXFaV2RTT3JyY2NKQldlSE4rUUM2azJI?=
 =?utf-8?B?RWxaYkN6eUs4YTVSVHhyMW43T0hTdnMxbERhRERQK0lnQ0paQXowKzIwTHVG?=
 =?utf-8?B?YmR6YStlMWs4UlJoMHNQenQwaXdRQytneVh3ckxiU1FlL09LbXNibE1tSytE?=
 =?utf-8?B?MzBDRDZGL0xvYXhPUFFDY0NJKzYyK2N1aG9md3B5UVNVRHFRUUxSZjNVZDBl?=
 =?utf-8?B?MWM3emdKNzE5WHExbjFBbE4yTFRrZTJXMytmZWxDcnEwVE1NRW12MWp0N0dr?=
 =?utf-8?B?MzRPV2doVHFSVFYrYjdmTGE1OWMrTXk0RjlCeTV2Zkdkd0N2YTdsWG9QU2xU?=
 =?utf-8?B?cmVlMVV3eUhPQ1hpMXBDWjg5bzdqU1IwaVdjNkV5cGhabFBiVWQ3WTc4Wk1J?=
 =?utf-8?B?U1lnK2MzOFFpaUhhenVLRUNTZWZDbzdVeXBYMFgzcXJuQVVYZ0JHSGs2Ty9Y?=
 =?utf-8?B?dDgrR2ttSXZkN0JjMU1obnJSSnozbERCQ2JhVlo2UXZCZzZxL0luMlcyZHY4?=
 =?utf-8?B?WFpPVnNseFlRN0wzMHpGSnkzSGhkcGlMckxhWjlNTk1BanNaSVZJL24vSmVF?=
 =?utf-8?B?YkZ4QmVyVWZrb0xxenhLZmNkQVljMCt6VFY1S09ONlBhUjVEOGc1ZUNKdnh2?=
 =?utf-8?B?eWpJSElCOWVrSW5DTTF5Q1d5WDNWOWhxR200YWt1eFRiY2xQQmtRNllRMnl4?=
 =?utf-8?B?Mks2RXZabGZIRUR2Z0FWOVUveWh3UWdHYm1pNHppSXk5bFVlb29ZM205MVpx?=
 =?utf-8?B?WEtXcFlJeWRqYktzNWdxb3FwV1dvZ3hiZWlicUZUQU4zR1JhUHRpOFdMWnF0?=
 =?utf-8?B?K0IyTWNDOUsvSGQrS21Wa1BZYUZuQ0lrUWVKdTRlTG41NEE9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 17:41:45.3146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc00c76-2123-46c3-bf5c-08dcf51c4b79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6782
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

amdgpu_vm_bo_invalidate doesn't use the adev parameter and not all
callers have a reference to adev handy, so remove it for cleanliness.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      | 3 +--
 6 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d891ab779ca7f..471f3dc81e8db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1105,7 +1105,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	 * We can't use gang submit on with reserved VMIDs when the VM changes
 	 * can't be invalidated by more than one engine at the same time.
 	 */
-	if (p->gang_size > 1 && !p->adev->vm_manager.concurrent_flush) {
+	if (p->gang_size > 1 && !adev->vm_manager.concurrent_flush) {
 		for (i = 0; i < p->gang_size; ++i) {
 			struct drm_sched_entity *entity = p->entities[i];
 			struct drm_gpu_scheduler *sched = entity->rq->sched;
@@ -1189,7 +1189,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			if (!bo)
 				continue;
 
-			amdgpu_vm_bo_invalidate(adev, bo, false);
+			amdgpu_vm_bo_invalidate(bo, false);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 8e81a83d37d84..b144404902255 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -345,7 +345,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	/* FIXME: This should be after the "if", but needs a fix to make sure
 	 * DMABuf imports are initialized in the right VM list.
 	 */
-	amdgpu_vm_bo_invalidate(adev, bo, false);
+	amdgpu_vm_bo_invalidate(bo, false);
 	if (!bo->tbo.resource || bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
 		return;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 1a5df8b946616..bc1ad6cdf0364 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -839,7 +839,6 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *filp)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_amdgpu_gem_op *args = data;
 	struct drm_gem_object *gobj;
 	struct amdgpu_vm_bo_base *base;
@@ -899,7 +898,7 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 			robj->allowed_domains |= AMDGPU_GEM_DOMAIN_GTT;
 
 		if (robj->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
-			amdgpu_vm_bo_invalidate(adev, robj, true);
+			amdgpu_vm_bo_invalidate(robj, true);
 
 		amdgpu_bo_unreserve(robj);
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 1e6a044e3143b..045222b6bd049 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1148,7 +1148,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 			   bool evict,
 			   struct ttm_resource *new_mem)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_resource *old_mem = bo->resource;
 	struct amdgpu_bo *abo;
 
@@ -1156,7 +1155,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 		return;
 
 	abo = ttm_to_amdgpu_bo(bo);
-	amdgpu_vm_bo_invalidate(adev, abo, evict);
+	amdgpu_vm_bo_invalidate(abo, evict);
 
 	amdgpu_bo_kunmap(abo);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9d6ffe38b48ad..9fab64edd0530 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2139,14 +2139,12 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
 /**
  * amdgpu_vm_bo_invalidate - mark the bo as invalid
  *
- * @adev: amdgpu_device pointer
  * @bo: amdgpu buffer object
  * @evicted: is the BO evicted
  *
  * Mark @bo as invalid.
  */
-void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
-			     struct amdgpu_bo *bo, bool evicted)
+void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted)
 {
 	struct amdgpu_vm_bo_base *bo_base;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index c5b41e3ed14f2..428f7379bd759 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -515,8 +515,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,
 			struct amdgpu_bo_va *bo_va,
 			bool clear);
 bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
-void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
-			     struct amdgpu_bo *bo, bool evicted);
+void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted);
 uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr);
 struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
 				       struct amdgpu_bo *bo);
-- 
2.34.1

