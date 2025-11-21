Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD493C78745
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E8C10E83E;
	Fri, 21 Nov 2025 10:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xaB3L4/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C2A10E83F;
 Fri, 21 Nov 2025 10:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsxpBGFZE9gSFNyf62cDxE2Yv6TWjUSDL+VIX2TbtaWfxOM3+bbN8VRIb4TSnhNWpg9WQUDQ98SS7jqBG0VcSEIRarleow1FX+r9AXyjmbYykkGx77UbM11ZFWWFTcvBk+kigNwVijejVOn1kyVnuh5oQ6jAApZoquiedlJiedaVRaIhJ6opftl949ixg8IG4clERa0SMfN+Z6kVq9uAA034qxn66Rcj6+CMaZ4z/pN9t7F0CJVFuXA0qej2LkSmksmBOCdqhYRhxIBFW3mvHL3OzSJOv9dLrTd6EBJsezJVhYBl9PmXOcvLcIYP3ktlTQ6Scxh8O05+Ke+FMsXjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ/0dHQA9mG/7SlP5qvAlX485DSgQzYviTpaSRJPj3I=;
 b=ibpO7FAOW1h366HTEpGclrYH059t1gzMtmbCh8+SI+lEyYEzr1S3GMXxHaORI8+wDUSVeknsdWdgNqTmZM7MHGJb7WnsCtKM98XswWReVW0+i/i9roVJazccLEccFJxwRbmSowzKUgvTPEVUfP56aYhpK5q21a0cozLcBGWVb1iM/3Q3WMr/z6jvWqgsckSnsta9LMCzEtHC96RSicVNf0gGbIm81kAI74oYeis1T7LVid7HpOWuffOhEnWc6WLdNOClO3JtwqWz9vIUiS00jpRtieBx/th47XOzv5IeL3LFdcf1XX+KZzk6rfRrgIybeKFEYGeAUAvyKhof4WiO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ/0dHQA9mG/7SlP5qvAlX485DSgQzYviTpaSRJPj3I=;
 b=xaB3L4/QfJ0uZJtKl3REKa6lF2fITe+GAdKBfYMYMwhG/teB1l3VXJWFC/5O9DSD7pYFOfW1LUt5Po1RgxztYJKls1Um0lZJ4p76Lh3e+Rm0qtm7eBxZunM0GhFEd0Ttkj7/sWzjSW4Xb9H2hZyDqQ/gZuhatWs2x4cJUqa9Z4M=
Received: from BN0PR04CA0105.namprd04.prod.outlook.com (2603:10b6:408:ec::20)
 by PH0PR12MB7011.namprd12.prod.outlook.com (2603:10b6:510:21c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:18:32 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:ec:cafe::18) by BN0PR04CA0105.outlook.office365.com
 (2603:10b6:408:ec::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:18:32 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:18:27 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 23/28] drm/amdgpu: use TTM_NUM_MOVE_FENCES when reserving
 fences
Date: Fri, 21 Nov 2025 11:12:33 +0100
Message-ID: <20251121101315.3585-24-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|PH0PR12MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b4122a-3313-4222-b75e-08de28e752a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTdhNFd4cGM2a1lGOVRFTXJtSGY2c0FPM2VOTHdQZG5Hc3Nwa2xwL0ZoZWZL?=
 =?utf-8?B?S01GV2ZCcGc0eDBmSTBPTTJsNkp1N3g5REFhTURoRU5xRy94Z2NEQzZwNUp4?=
 =?utf-8?B?NUk0RFJ4WklyYlRQb0pNS2swdEtQbmNhZ0ZET1ZHOWFQSlllTTUwa25PUEFE?=
 =?utf-8?B?c09BcUhOYllFSnEzTFNoclRJakwrdjU3WGxCV05iZ3VOZ3FuYW1rZXhBL3pM?=
 =?utf-8?B?cGNFWkRReVNta1V0eEU1MFQzNnh5TU5KdGM4UjJpd0xsd0YwdkxqdEdsTnJC?=
 =?utf-8?B?L0R1TDdaWGp6bFlBSXBBSFV5Z2k0MXlNREZ1Mm1zUkJvTXJDUW1nMnA4M0Ri?=
 =?utf-8?B?ZFduWGY3VnZhR2tmZ3MvL0Z2dHZOY1JqUWRwbWRzbTgyNUpleXNkakkzSEhx?=
 =?utf-8?B?b25DQVVCbDZHc29Cb2pza3ZXelVVanlZc3hMaXZORy9qSHc2VlNWemVJTXVh?=
 =?utf-8?B?UmlUVXZJOVJGemhwNmQ4UkR3S3FlRW1mMUJ5c092R3pPMldhQjhCb3ZTemVU?=
 =?utf-8?B?cjNhOG41eFcyM29mTHBUcGxaM0pkTEl2WVFsbHl6cnhLMkNPbVZpMGhMaWJQ?=
 =?utf-8?B?ZW9WN2xCNllyS2hGL1gyVXA1cnBMeERiY0tsOEVDQSthZ1VTdVA1WnMrU2Ri?=
 =?utf-8?B?SXJYbk9DUEM1UTljcGJuMkNsWWUvK1pyMHpKMnlObnVDN2s3d0JyZ2h3NVlp?=
 =?utf-8?B?WFZkajZQd1kyTVQ2WEh1UWd1SStvVFFYLzREV2RLalF0U3AwY1RwOGM0S2dD?=
 =?utf-8?B?STlHaTNtRHQ4SVZkKzhSUUc2Z3hTYmlXbHVRQm03aWh0T1pidm11bGNDVkI4?=
 =?utf-8?B?YnUzZVpKOCtSYjJSYWM5WE0wTzVJMVR1Q21LTy9ibS94TDh1OG9FT3R0UjZQ?=
 =?utf-8?B?OTJsNFIydkp0QTY4ZjRLUU1VVEE3UUdicmdqOGFlY3I2L2NQL05DYjd0QUhG?=
 =?utf-8?B?U1QzWm95cjlZbnhoNkhMSFZYWWN6UFEvY1lCNDNuVmtGdWZhaHZhZ3ppZXZX?=
 =?utf-8?B?OEhFcktZK2UvaXdDNnAzSzFpalVTUHVLK09qcmoxZzF0N0JWMjh6YTR0LzBX?=
 =?utf-8?B?MG5raWpycGowbmN3aWhZWWk3VlQwVGgzSEt0a1B4NUJhSXBudk5Fcy83S3dV?=
 =?utf-8?B?VkVNWnFMeE5YZDVRR01sOWxVa3R5UjVGdzd5L01RV2FlVEJVQis0QjFYdEZy?=
 =?utf-8?B?R2FsbHdDaDJ3LzlyeTRhZ2tQTHhhWS9uVDI0ZEJnaDdCVkxQYzlXTFlic3hH?=
 =?utf-8?B?YWp3dFZiMTdiZ05hU3NtaVRYVW94QXd3ZklJL2VFRGdndEJsUHhKd3RLb3hj?=
 =?utf-8?B?RGo0bHdrQ3JvZlVGN3BxZXAwM041WVNsWXVKcmZFVm1rUk5xcXBGZ091Nk5h?=
 =?utf-8?B?WTF2WlJNSElOZmMwaXJvMENuY0I5OE1Bd0tpSHp3dHA2N1MwdWk5UnlxWE1Y?=
 =?utf-8?B?dWprblBta0lmNW5uZkN0OUo0amxWWm03QWcvSy9KRDIvMjRZT1NzbzhrZ3k2?=
 =?utf-8?B?N3FtTEYzdUhYMjcrWWkvekVxalQveGIxb2Rwdy85R2NUNmZ4eDUwY2hjTzgz?=
 =?utf-8?B?R2tsTkZOZGlBTFp3VlhVODRWZ1Q1SFBqaUowTWV1dDJ2K0w3dndmYTYzZm00?=
 =?utf-8?B?TWYvMkpkZlB0cW1OZ01YRWc0bi80TVB4aUZjM0V5dk1BcmJLYlpvcHdsR0Nr?=
 =?utf-8?B?Wm5PYmNVVUY0MFYyVEFUeHhJWFZaUDRQbjhMejc2NThtSngrV1BiUVZ2cTJX?=
 =?utf-8?B?NHFxcUlmaW5Sa1hFT3JsMzNnRkc4Y29Sem4xWkZiT3gvNi8xVHQyTUdtUW1U?=
 =?utf-8?B?TDVRVk5JZllLcURTMzdtSzl0ZU9zQ2k2WnpIVmVrdEI5dGc1Z081ZTROcXcy?=
 =?utf-8?B?V0Q2V1dNcWZac2dXYWdjVnpJWUlaclI0OGJXcURINkt1SDRrblFEdXIvRk9z?=
 =?utf-8?B?bzN1b1VNb1lCNDhFMmR3T0p4Y2NCU0tRakxtRmhPbVpkUGFONUxneEVkOFF0?=
 =?utf-8?B?enR4ZnlSazdXVE16R3o2M1RrQ3kwSHBONlRNblZxL1o2YnVSS1VoMlFqR0N1?=
 =?utf-8?B?VXg5WjY3eFVJejFnOGZ4aG0wZDRrcGNRdnlhNlVSWlM4eERIMHIvWlR2N2o0?=
 =?utf-8?Q?h9RM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:18:32.1974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b4122a-3313-4222-b75e-08de28e752a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7011
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

Use TTM_NUM_MOVE_FENCES as an upperbound of how many fences
ttm might need to deal with moves/evictions.

---
v2: removed drm_err calls
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c                  | 5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                 | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                | 6 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                  | 3 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    | 3 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 6 ++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 6 ++----
 7 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d591dce0f3b3..5215238f8fc9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -916,9 +916,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			goto out_free_user_pages;
 
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			/* One fence for TTM and one for each CS job */
 			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
-						 1 + p->gang_size);
+						 TTM_NUM_MOVE_FENCES + p->gang_size);
 			drm_exec_retry_on_contention(&p->exec);
 			if (unlikely(r))
 				goto out_free_user_pages;
@@ -928,7 +927,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 		if (p->uf_bo) {
 			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
-						 1 + p->gang_size);
+						 TTM_NUM_MOVE_FENCES + p->gang_size);
 			drm_exec_retry_on_contention(&p->exec);
 			if (unlikely(r))
 				goto out_free_user_pages;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index f2505ae5fd65..41fd84a19d66 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -354,7 +354,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 
 	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
-		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
+		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, TTM_NUM_MOVE_FENCES);
 		drm_exec_retry_on_contention(&exec);
 		if (unlikely(r))
 			goto out_unlock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 79bad9cbe2ab..b92561eea3da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -326,11 +326,9 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		dev_err(adev->dev, "allocating fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		domain = amdgpu_display_supported_domains(adev, rbo->flags);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 5061d5b0f875..62f37a9ca966 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2656,7 +2656,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	}
 
 	amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
-	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(root_bo->tbo.base.resv,
+				    TTM_NUM_MOVE_FENCES);
 	if (r)
 		goto error_free_root;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 97c2270f278f..0f8d85ee97fc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -627,9 +627,8 @@ svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
 		}
 	}
 
-	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(bo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
 	if (r) {
-		pr_debug("failed %d to reserve bo\n", r);
 		amdgpu_bo_unreserve(bo);
 		goto reserve_bo_failed;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 56cb866ac6f8..ceb55dd183ed 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -952,11 +952,9 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		domain = amdgpu_display_supported_domains(adev, rbo->flags);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc87..110f0173eee6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -106,11 +106,9 @@ static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	domain = amdgpu_display_supported_domains(adev, rbo->flags);
 
-- 
2.43.0

