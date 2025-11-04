Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B500FC2FF95
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFCB10E583;
	Tue,  4 Nov 2025 08:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2zYiWUvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010007.outbound.protection.outlook.com
 [52.101.193.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61B910E57A;
 Tue,  4 Nov 2025 08:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ8Du1b5WGWN528GvJIFTbhTp04zMNkObRB+zDuuE5m2wW3eI74dWdDiv5mgYz42Wy+x+UcRO05blAROj2KwFCUm5HC/5X4IFecORH3mRPu3uiGvSdbotXpnFY3uHrw3SNz0Q6zZdk4TpAETdDYFf8IZ4iZVbHJaaoJ0zlB7J8SL1fg1RaMAsjPvcbzAvWhWabgZmdVRac4CHkXEJFYEsTYoBaE1tXgbADJvau+0zglKkLqOzdv8lfIzfV1AjxR0g2XjNsXK8Vk2llp7sYgLmKXx+5JJpGKdxE6B6ec4kqocllTWoTNhilei6fTebjKxbbsEAHi73G0qhdi2/VerDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO9+sdDPc7LJTodoPbXYThV3dELp5AzFOElu9BD8iyA=;
 b=i1uvq2QStsEc0xz9hc9XjVbIZ4BX8dcCuNg+dbP4ECOAgX67JxU4/frmHJNY7WB0GaWog9oO8krMkbuhgbViQ+1BrGoBrcEQ97+AicIe1LxGmVcEj+gYCrR9lz7GHQXqHAjXptViN9xPP0UKb3IK+yw895eV4xepQboM/6XQjOtsQi7BkZWm4oBbk/pCXjsz7ohbcdgW0MMg7Drh5A5ZDaZIV/jxsDaPVWVXqh+EaQD6HbxKE6MZcr+KdEU6UwdL1Vdcl41H7pp1pMy6rqoPAspMXVnoocvkR/DoJXL+p98eZ1azSbybGsOeNTMUq7lbIWGkEIWZ9fLpJSsrb396gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO9+sdDPc7LJTodoPbXYThV3dELp5AzFOElu9BD8iyA=;
 b=2zYiWUvZV56GUxSgDx82+8GYBV1uDoXokgZti4YiOfY9+T5XPm3FdxnJDkga2oWVdu1xBz8hfNewFsMcVZUZaxJaphpSzdJeUvee3/3yVMtvCIJaVZgG/aLCxDH88/8VxKHQvMiJn4mWT4N8/HyTxzRwiuPjRABdBaIfZZUza9E=
Received: from SJ0PR13CA0185.namprd13.prod.outlook.com (2603:10b6:a03:2c3::10)
 by CH8PR12MB9816.namprd12.prod.outlook.com (2603:10b6:610:262::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:37:08 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::51) by SJ0PR13CA0185.outlook.office365.com
 (2603:10b6:a03:2c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 08:36:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:37:07 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:37:05 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 16/20] drm/amdgpu: give ttm entities access to all the sdma
 scheds
Date: Tue, 4 Nov 2025 09:35:31 +0100
Message-ID: <20251104083605.13677-17-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|CH8PR12MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: b255c07d-a45e-408d-1906-08de1b7d56cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xZIUcd5y+xkda9ik8k9gSj49vnYgVSWpsVLzQet2mIumPGW3XqPbJAzGVYB2?=
 =?us-ascii?Q?bsoRF6D5bFRd1bH5GAP/wabYsZxIAjmk8d/7XeVkd7aciW+lRBMOXKROLRE5?=
 =?us-ascii?Q?4cH/JBvlNmSUjsGGDhpDYr4CkBJMQfpFCqkzgmm4vyMg8x6FJKBjvWr/eKdh?=
 =?us-ascii?Q?BAeADx+8CSrp3nDQtc2mdL0dejWPbTlSewyeORB9Jb/6DRWJDFoDo+Kt8JjG?=
 =?us-ascii?Q?xllYUbecOKRCPRhMIErJ5SpCQkP/UCKfJVYu7ojzFzKoXTmwubMxqg69RcFG?=
 =?us-ascii?Q?QZ+phvSF10r2VPmr2V3c3UJW6pOMuyVelomhpQGwL0SAWib8LFwm+z2SOAzv?=
 =?us-ascii?Q?9oAXAuWGYk5wPi2aZtHVDBuC38kOnH9fcIv4UDhD6IqmGy9KLG1HEhu7Xu88?=
 =?us-ascii?Q?0zPrSJlig9yr4tn9eFvsCIsCXaNj/MbV9hTepiFnTR1igLgEbDrCaf5eUqK2?=
 =?us-ascii?Q?iPS9+CcxLyb0nchANRcR4sZhYi9wQ5bjBvC0alMv8BjO108jnHh7dROiNkwG?=
 =?us-ascii?Q?AfLWfXAvATYtrcFIu3xNvN9rNSBK9Q5hmy2XiO1LgYtypoKjOEovPM3gclwc?=
 =?us-ascii?Q?P8giUBnB9DAVSyNNTlMwvkK1ScvgGQ2MFWmVhrS4aLp2IapYylvhBiQ3qTlA?=
 =?us-ascii?Q?xKVz4BEA3YymCpgYObkEbWSK6ZvT6Zg8jrh+UdcMujirmYIVS8IwMaWPZ3GI?=
 =?us-ascii?Q?/gDqUNgMTi6YGMRYFflXecsfbAkuLfDTxuE9VCrnKQud08oZtQ6DCYLqYXRa?=
 =?us-ascii?Q?5KuyuP0TV2K2+H2mrGD0WTWk/CL3Whz559nC2AdRFzowF/BwKNeViPK6M4qr?=
 =?us-ascii?Q?LtEu3tDM/A7m34Gzo+qaHqGjyad27K+bvabKu9NbF5dRLUfxnANwiJ264G5e?=
 =?us-ascii?Q?NpgMQwSYxjYAcV3Tzzweb3Z0op0/mxGlckCvf7yEHeQ+YAI3sMRUTWzBPGqd?=
 =?us-ascii?Q?GeF7J/WMISXSu51fTwHOvMyV2tUs3oVjZozgOAa19jK+Hf95PePCUM0saPFl?=
 =?us-ascii?Q?PAwauDTAEMUEeDA26FfkbgD0ibOW6ItnccW78tyhd8/V0dWJgrO824L5k+uj?=
 =?us-ascii?Q?RVjyA6+EwFUhcuhBO6DGOGXCKQGw5IQ8T4pfCvf8RvFgxEKuqHIW81dYtS5Q?=
 =?us-ascii?Q?npP5My3YM6zhES9wneRwbV7mCg+HR3IBWHqt/c3yebUt5dsI3I4u/3MA6eZt?=
 =?us-ascii?Q?99a2mmiw661SBr5pWTBs4pAl6Cy/fwmnyImX2HWNa4yZsdFlp5NLWSoC7yVZ?=
 =?us-ascii?Q?HipeVoiSZZTNaC5WhogmVxTPDEO9xfr6iLCiFW29RxRF74rOxrSyxPJ+S8sq?=
 =?us-ascii?Q?JY5eSAn67tcMWKM/PomR7U9LSNyzHcxj5NuZs+Fc2H8TN7MZH0hhfzKA1zDb?=
 =?us-ascii?Q?mczo59tnQdF2nyMVnYcWEdCzEn0MOW4naO9mkmnq39T2VZa9yvZON414Cz5H?=
 =?us-ascii?Q?zXXW+BEeFsp7EJuvC2LJYchvHlJSIwHpH1Yp9DW4HgT3kv+yoBKrJxa9jaW2?=
 =?us-ascii?Q?OGYnOlss+oB+9IaIu/CJppNc9PUGwlO8eBEWa1o5fA00Gl7PIXZ4HNzr3xCN?=
 =?us-ascii?Q?yRc34a6+FmnIQBZo7Hg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:37:07.3130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b255c07d-a45e-408d-1906-08de1b7d56cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9816
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

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 23 ++++++++++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 47eaab9350ae..d88bdb2ac083 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2187,8 +2187,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	u32 num_clear_entities, num_move_entities;
 	u32 windows, w;
 
-	num_clear_entities = adev->sdma.num_instances;
-	num_move_entities = MIN(adev->sdma.num_instances, TTM_FENCES_MAX_SLOT_COUNT);
+	num_clear_entities = MIN(adev->mman.num_buffer_funcs_rings, TTM_FENCES_MAX_SLOT_COUNT);
+	num_move_entities = MIN(adev->mman.num_buffer_funcs_rings, TTM_FENCES_MAX_SLOT_COUNT);
 	man->pipelined_eviction.n_fences = num_move_entities;
 	windows = adev->gmc.is_app_apu ? 0 : (2 * num_move_entities + num_clear_entities);
 
@@ -2197,13 +2197,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		return windows;
 
 	if (enable) {
-		struct amdgpu_ring *ring;
-		struct drm_gpu_scheduler *sched;
-
-		ring = adev->mman.buffer_funcs_rings[0];
-		sched = &ring->sched;
 		r = drm_sched_entity_init(&adev->mman.default_entity.base,
-					  DRM_SCHED_PRIORITY_KERNEL, &sched,
+					  DRM_SCHED_PRIORITY_KERNEL, adev->mman.scheds,
 					  1, NULL);
 		if (r) {
 			dev_err(adev->dev, "Failed setting up entity (%d)\n",
@@ -2215,8 +2210,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		atomic_set(&adev->mman.next_move_entity, 0);
 		for (i = 0; i < num_move_entities; i++) {
 			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
-						  DRM_SCHED_PRIORITY_NORMAL, &sched,
-						  1, NULL);
+						  DRM_SCHED_PRIORITY_NORMAL, adev->mman.scheds,
+						  adev->mman.num_buffer_funcs_rings, NULL);
 			if (r) {
 				dev_err(adev->dev,
 					"Failed setting up TTM BO move entities (%d)\n",
@@ -2238,8 +2233,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		for (i = 0; i < num_clear_entities; i++) {
 			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
-						  DRM_SCHED_PRIORITY_NORMAL, &sched,
-						  1, NULL);
+						  DRM_SCHED_PRIORITY_NORMAL, adev->mman.scheds,
+						  adev->mman.num_buffer_funcs_rings, NULL);
 			if (r) {
 				for (j = 0; j < num_move_entities; j++)
 					drm_sched_entity_destroy(
@@ -2650,8 +2645,10 @@ void amdgpu_sdma_set_buffer_funcs_rings(struct amdgpu_device *adev)
 	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
 	int i;
 
-	for (i = 0; i < adev->sdma.num_instances; i++)
+	for (i = 0; i < adev->sdma.num_instances; i++) {
 		adev->mman.buffer_funcs_rings[i] = &adev->sdma.instance[i].ring;
+		adev->mman.scheds[i] = &adev->sdma.instance[i].ring.sched;
+	}
 
 	adev->mman.num_buffer_funcs_rings = hub->sdma_invalidation_workaround ?
 		1 : adev->sdma.num_instances;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index d7fee371b814..c059a3d52b57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -68,6 +68,7 @@ struct amdgpu_mman {
 	const struct amdgpu_buffer_funcs	*buffer_funcs;
 	struct amdgpu_ring			*buffer_funcs_rings[AMDGPU_MAX_RINGS];
 	u32					num_buffer_funcs_rings;
+	struct drm_gpu_scheduler		*scheds[AMDGPU_MAX_RINGS];
 	bool					buffer_funcs_enabled;
 
 	struct mutex				gtt_window_lock;
-- 
2.43.0

