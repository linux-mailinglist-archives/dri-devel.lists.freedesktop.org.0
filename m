Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80828C78765
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7DF10E845;
	Fri, 21 Nov 2025 10:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AxzgVZsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012031.outbound.protection.outlook.com
 [40.107.200.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C9B10E846;
 Fri, 21 Nov 2025 10:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b61++pFQNKIFMiVamgugrCMUZc6FpjpSsvvDv956gGkWtdeXOlhNj48OFJg+sIiwiZ+GmJ/E3m5jBQLzbiO1rI+tJl92F+tOkO4M6hLEjY+0TSpxT7JQxfDu1985KB4Ad9Vc9JV/RcKxpOUnWl56AOZwWohF30vG1OjXckZfsQqqDvOl2r4EgkdcUA+Yo2GQSNe3uAf1EkilYHnb3FHiGx2yv+vuU7xNempk7WJeVon1aSqfMkBOY6W/pmwnCUR1qnKUiZ2xPW62jChNPoYgpL0SM60yVvZDxSUg9hC+vQ3d9FLkE0ZVX1sSPI/WKNU1xYidvRSmLykQ2crK569wyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9jibiMk9waky77mXH5lROZR36hIxdaLGm0b7oVWQTw=;
 b=lKJtSDiRVLEwoLLw3Ze20Sa7Oz/m+YhuIMyE84exeCFriLnEEve8fVeGZsWKC70Scoy9TiuvoHgcGRz0Rp6U1xA018tgB9/P1gz7Y19T6tUcp6gx7PZM0JMsjS8auXXY2nFYmFJcX0IEFOVhlH0HfHl3Uv5TY/7YlXmoaSbHXmp948FMkYDTXe/rkFVCRdgvKaC1dVL8A/X0NF/fJbeA+Mr5lrlC9WZcUCPYHemKLf+XTRmfIzu2PnxH4jJCDLHcSpBvLO5oy+ckAJBNjsZB/D0A5ypETljS5AVnAgecEEg8GspW8+B4CfLvZNoxgv57AUa2xsa2ZNCzpkxH6xMhgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9jibiMk9waky77mXH5lROZR36hIxdaLGm0b7oVWQTw=;
 b=AxzgVZsAgPCBosnYrxOiS9bGw3Ed4kSY3xgzGrmGou/VDZhA6O13FDQbZNUUdBzWiBCMhlJIzkOwR++VO10/gNKojvfLcimV6pd1Zjh2Gz0wZTaW1ns5PHeYfn+6lLdRwb5ZXBuCKX12zRHjlkDNJrE3O+X19Pdo4DNQ0qnATCo=
Received: from BLAPR03CA0149.namprd03.prod.outlook.com (2603:10b6:208:32e::34)
 by DS2PR12MB9639.namprd12.prod.outlook.com (2603:10b6:8:27a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:19:14 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::5a) by BLAPR03CA0149.outlook.office365.com
 (2603:10b6:208:32e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:19:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:19:14 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:19:12 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 26/28] drm/amdgpu: give ttm entities access to all the sdma
 scheds
Date: Fri, 21 Nov 2025 11:12:36 +0100
Message-ID: <20251121101315.3585-27-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DS2PR12MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 92dc8e3b-345c-403a-0203-08de28e76bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWhIbVQ2dEdOOGI1Q0wzOHNzR1QxN2ZMaGVreWlDeDZ0VVdpZGdwcEtoVUV6?=
 =?utf-8?B?VDRxRmtDWTZWcDBTMGNCc1RsdlBmbk9ybmpZbFhtRTZBRlJEZ2RpNHg2QnZw?=
 =?utf-8?B?cTMxVHlWK2R2Wk55SEdVcVViTHdKSWp5QWFGeDF3TzJyREIrUFFiSHFZU2Z5?=
 =?utf-8?B?WDZOQ2lVMlNXTkZaTk83S3dEUCs1UFNDdWd4ZkROWlF4Znc4R1pRKzRGM3FT?=
 =?utf-8?B?eHllcWNlcDNXTVoxVzhVdEJvb3ZkM2lzaWtER01CRnQyZWJTendaMDNDczR4?=
 =?utf-8?B?OFR1VTNtVUVXMVRwcER5M1ZEL3ZyZGIwdklHcitPaDU0cGdnOGl0SFZ3Q0tD?=
 =?utf-8?B?ME8rVDNlc29LZDdzR3F4ejlaQXJ5cGlsVkovcnh2Rkk0YjhHUzZRQzd3RCsx?=
 =?utf-8?B?RlQ1bjV6SzgyclVRNmJBQysvU0hPaElEME9ydWF4ZVVBZnRycWFLdjdSenla?=
 =?utf-8?B?WElGdVZUTUlsWEx2RUZEZzRqTGY3Nm94UzlzUjNma2JUUE1NS0Jjd2Nuajd6?=
 =?utf-8?B?M1I0cGRjMm9wRDlLeVB3a0VlVkxOS0dXeVZrUUhYalJQeU9TQUJGT3NBWDMy?=
 =?utf-8?B?ZXp4Wk9ZUGc5WmpLdGdLc3lETCtyOGp2WnpjWDV6ejB1SEMxaTdZRnNuU3FE?=
 =?utf-8?B?dURiblpERUcwc2hHNFZJYTdjV1NjblZCaTl4SUhyOVdoVGdXUUVsZElrY3FT?=
 =?utf-8?B?YXRUdkhHb200cDlVeTFIN2g5ejNHOVRINWJpRUxRcVkwSGRQalJYeWQvQlBt?=
 =?utf-8?B?WUh4ZThpTEN0UWtpZG9JeGRSOE5pS29ZdzNiZVlsc2JHZ1BacVRkVHRCRFlE?=
 =?utf-8?B?dFhpVi8vY0Y1dlZMMm44K0hPdVZoRWxsVytwMjhUZjk0V3E1M0s2TzhVVHQv?=
 =?utf-8?B?MjdRWCtnM1k1UVFGUkV0amtvdlpoUllHVmY5azA4VTUrbGpoZGJPMU9iNVVz?=
 =?utf-8?B?Tjg1ZTFqMkZTeW1HcFVHaXBtYzZNVTZXNXF5ZVFqV3BwWXNhNmJVRzh2alhC?=
 =?utf-8?B?MmlLTkR1eW16NmdtemFxU0laKytnazgxV3ZicEwwWDYveEZjdUJtelc5MVl0?=
 =?utf-8?B?c1lxS255dnZqdjcrelludW9sYkNPb29SSVpRbnUxemhFNTJzVXlxOThpYUI5?=
 =?utf-8?B?cHkyZFRaM0tpSVVvLzBmeE9IMHRQbDFUSXFjUWNldzE4U0ZsZll3UkkvOXcv?=
 =?utf-8?B?QjFrVWpvK1dtSUIyNDc3OTdmTFo1R1U2OGxuYjhyRTZwTUlWNkdieUxsK3dB?=
 =?utf-8?B?SEZ6VWtReDBjbGpJNE1kQlNtNTdwaGduZlZvemhCZXEybG1MSkdNcDF4Uktr?=
 =?utf-8?B?S3lQb1lMMlhtV2hlVk1nS2ZJREt4K1M3U2F6ZXk2K3l2UWdFNmZ5VmlFWEVJ?=
 =?utf-8?B?YTlwU3ovVkVLNDJpWVhPWGhjcHloRTZsMjNFeW1Ha0FNNmt5VlFQdkd0U2lr?=
 =?utf-8?B?bTg4MVJTR0VodEtjOUtBVzQ4ODlxMVNrYnJWQ3NQMThEMnFmSU1XQmJMUHVH?=
 =?utf-8?B?SWpBMWtMSC9ZQkhxa0o4NEVFeVpuNjhCV0dZdGhhVG9UMXF4UXZUUm1jaC9R?=
 =?utf-8?B?ZVA5UFRncEFYTTJpY0R5MEpNTkdxNTRYM05adEF3UUlZRWFKSkg1V2NBZzhU?=
 =?utf-8?B?SHdCTkcvNmtza1lZa1oraHk5MG9EbmhBb2xsV1NkTWFhNFVIOHdOZmtmQ0NZ?=
 =?utf-8?B?anovelZVUVE0SWZvVDM1Z0N6YWhpbDFON012MGtkRDNZb01CbDJ0ZER1QklH?=
 =?utf-8?B?eXVpMTRtVXFhdjJJNDFVejA5di9yQ2xRTWVvMVJaUG05NEMrYmM2REdGN011?=
 =?utf-8?B?REVZZkdDTC9XSSt1TElPMWdrcEVGcWZMdm9XM21keVlmQ1lYWjBZKytyNXll?=
 =?utf-8?B?NDhJYnZkdE11a0tSYmR4VFJUZVRLUGhaMk5MNmt6SEk4NGVEOEZoL1NuK3dM?=
 =?utf-8?B?Z0pNck1aa2FCcWgxSit0Nm1XbS9hRnZwZVlpSFdZbEVuMjl6MXU0aHlQN3Fu?=
 =?utf-8?B?VlVpVitnQ3p4dUdnUmpQQVZuWGdJSTZ4amk0Tld4Wi9WOXF4MUFqVjhaeXVM?=
 =?utf-8?B?WkNaTW9UN3AyUWhneUdJQlNpK3lhNkc4YjRxWTdSS2x4ZDJtYnNxQVc1ZTdG?=
 =?utf-8?Q?HxBc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:19:14.1679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dc8e3b-345c-403a-0203-08de28e76bab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9639
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

With this change we now have as many clear and move entities as we
have sdma engines (limited to TTM_NUM_MOVE_FENCES).

To enable load-balancing this patch gives access to all sdma
schedulers to all entities.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index eec0cab8060c..39cfe2dbdf03 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2233,8 +2233,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	uint64_t size;
 	int r, i, j;
 
-	num_clear_entities = adev->sdma.num_instances;
-	num_move_entities = MIN(adev->sdma.num_instances, TTM_NUM_MOVE_FENCES);
+	num_clear_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
+	num_move_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
 	reserved_windows = 2 * num_move_entities + num_clear_entities;
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
@@ -2248,11 +2248,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	}
 
 	if (enable) {
-		struct drm_gpu_scheduler *sched;
-
-		sched = adev->mman.buffer_funcs_scheds[0];
 		r = drm_sched_entity_init(&adev->mman.default_entity.base,
-					  DRM_SCHED_PRIORITY_KERNEL, &sched,
+					  DRM_SCHED_PRIORITY_KERNEL, adev->mman.buffer_funcs_scheds,
 					  1, NULL);
 		if (r) {
 			dev_err(adev->dev, "Failed setting up entity (%d)\n",
@@ -2264,8 +2261,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		atomic_set(&adev->mman.next_move_entity, 0);
 		for (i = 0; i < num_move_entities; i++) {
 			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
-						  DRM_SCHED_PRIORITY_NORMAL, &sched,
-						  1, NULL);
+						  DRM_SCHED_PRIORITY_NORMAL,
+						  adev->mman.buffer_funcs_scheds,
+						  adev->mman.num_buffer_funcs_scheds, NULL);
 			if (r) {
 				dev_err(adev->dev,
 					"Failed setting up TTM BO move entities (%d)\n",
@@ -2287,8 +2285,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		for (i = 0; i < num_clear_entities; i++) {
 			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
-						  DRM_SCHED_PRIORITY_NORMAL, &sched,
-						  1, NULL);
+						  DRM_SCHED_PRIORITY_NORMAL,
+						  adev->mman.buffer_funcs_scheds,
+						  adev->mman.num_buffer_funcs_scheds, NULL);
 			if (r) {
 				for (j = 0; j < num_move_entities; j++)
 					drm_sched_entity_destroy(
-- 
2.43.0

