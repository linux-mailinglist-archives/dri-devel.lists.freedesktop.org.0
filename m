Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A83BC589F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0D210E8A8;
	Thu, 13 Nov 2025 16:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GiA+PTHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0EA10E8A8;
 Thu, 13 Nov 2025 16:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSkZ94v1pbcHwO1tq+HT+LUUEFj80yGXmjxdN0HDx7u8+5CmxAKHKECi/feXCCzrqHluZ5XGZCbfdOafqbUNP32lC1c+7Mjc5RAHWWaguO7aJ2PlaQMnFqhp1hMFyQpc7C8QHJzaGUz/SlQ/4NWXe22QxidDbXwmH8K0TGH6R4Oqq1i7MRCkxnpDGWfT7De2WdV0oz+AlwglATEL7NP3AMHGmR8zaTEmTqR6O0xXmFxOkZQsZKdGt8L1ZsJ4Lb+s7epXHm66F2PJ/Q4+rEnLkIM6o7MudR04wvk1xOXDXTKOMIzIn94wmfMhdYya4LSAbIKtBjG2NrfnUKKKyI28aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi6kzTohJDqzQIqJAizejnb6nifXlBVSgsaBxsI/cts=;
 b=ZRsXN4JXQVHAlJrzt3/kfeHrqBK9lrut/tACQnfsflX6lBwKz4IZxn7Iiz5p9C4TKQwID7dEIpgjHyQim/tdqXyoYR3kHyq1wMxdg3DlGMhD05jaSNav6Ghn8jkIJVdJIoL6a1CCuKMewSYdpC41yOfFj6EHY91krLbKtiIwVZiwj3zsG91ut3X+yJgGkTqF5193QG+RngLq4zISEl1R/Nqh66j60eP+DQIqKZED3D6sw1vdEd5NSYzdR2ZKAwdit+9KBXIJ9eJonC3RPi0kNCR1W3W+4dttOjeXN+xoN79/Ay+1eqS8T+odRwtJpr48OXXOcmlmqsgYswRwYpAQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vi6kzTohJDqzQIqJAizejnb6nifXlBVSgsaBxsI/cts=;
 b=GiA+PTHtH/cEOXeGoTuAdRd2AmjpaLA/GRmX1AVBfKbcCqdPqEpOyQZVTFr+YVqowVeDgahl1Yx0mjTC8lBYl1NGPTpnak4ImYd1VjpNKmiYVgPVvsue4F6W83DGYX9iwUkFL6mggBczO29RmA3PgoeG6IiyDOKj651R4DTRM7A=
Received: from MN2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:208:1a0::19)
 by CY5PR12MB6084.namprd12.prod.outlook.com (2603:10b6:930:28::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:12:08 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::6c) by MN2PR07CA0009.outlook.office365.com
 (2603:10b6:208:1a0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:12:08 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:12:04 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 16/20] drm/amdgpu: give ttm entities access to all the sdma
 scheds
Date: Thu, 13 Nov 2025 17:05:57 +0100
Message-ID: <20251113160632.5889-17-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|CY5PR12MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ced9930-9144-4538-60f7-08de22cf64fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E93NRp790q2+yIrdZ4EO4zmMX72k5RrpcoLRQvY7jbcTWhcqtvJcX7e5WeN4?=
 =?us-ascii?Q?6Xqb+ilbHm8MRcxS2j5u1+zEf4aRQD5IeWxbmDM/sUjFtydCnCee2jt2yXgx?=
 =?us-ascii?Q?sQPaLs97enniUjUjFqUj/IWcmwurpTZiPZaq1UM9Q+/jwkjt1qieCl6cYnxw?=
 =?us-ascii?Q?BtgciKmpebTZFV4V9/ZvvPuk7n4ldunBgw3oI8tPYPk0GeArqAyQ0UA6ge+j?=
 =?us-ascii?Q?T/nPq4GfohXgr2M0wIkwbollDNr0IY3309NB9p43hvfAxVPvigO2EvCzG7Yf?=
 =?us-ascii?Q?DuIYXq1TGnsNZcYhtuRjW3VAxQeg2OMWLdo0BZuk9lZ6sSkqzatQApyPQoj9?=
 =?us-ascii?Q?Jh2Mvumm9SvBU2qir85tA+vpMZFBrGltelbNkdeSSP9kLGzFeZJWG49fOX0d?=
 =?us-ascii?Q?MmV6FQYk5ak4s7a4HW2CYAT0HTU3Gvppy/YiiDS56YYJ30Jt0CRVGunQJF6L?=
 =?us-ascii?Q?oovbgHcstngWGdcp/mFZ+3vLKoS+34oBxxgHSMhl/VN7XgOm4ydn3qkARrl4?=
 =?us-ascii?Q?tfAIIR51tYWMrXplGIiMbLP0pZieXave5wcWKfTcmwWPCs8rHy2RUXOVbJFX?=
 =?us-ascii?Q?HJrxzaDx8PcGtK8KWWmcRmS0y/CUwp84k77R3xnCKZqqW0LjPNTmlhriU7nn?=
 =?us-ascii?Q?iJnb4u53KK2cVawD67Wb2MqqzdOuTDaCo6k7GQ532SnfJPE26GPDlGL5rP24?=
 =?us-ascii?Q?KCqikLEnzhwj+ULZ9tBfZphzSv46mX/GQ6+B2DMELBx2Z0FJAdR4s10/U0Tn?=
 =?us-ascii?Q?ws7UPtgg9836blj3S/Jstyb+q62pIw3w6VkrgUfLtYnnwSeW/LKsXv4a4hi/?=
 =?us-ascii?Q?HpDT885oBp8sb1KKLHT9hQ/iEPtI2SR/waVS+YZ6cvq6Cx0+e+Xt6tgLHMQj?=
 =?us-ascii?Q?CSm1cbE0Ry/KMhTcp/xXfCT+mHpE2BN+pO+GOOalhi2XcZxp7I+ubQp88Woa?=
 =?us-ascii?Q?JJpCp4q8mQs+mte/wLAvwUcq5WVPZSOFPjT0IQk21GlK86b5WewPDJcrCF0W?=
 =?us-ascii?Q?s0UqaMUhJSEwctzeM6tg31fmmSyNN2NEmXXBPTzybuKfZF3KjwMdS3WtDh4T?=
 =?us-ascii?Q?iQtPH9Sx7G5ySk2WGbVN/gFnTi+QCA5PJzJB2WS15ChQH9hLqd0C76H0Z+Av?=
 =?us-ascii?Q?2mJPQePD4Bh5LcDNKdKS2bRRSKfkXj+YbySAngJoS9MavTvzM3n6dHdTxZmQ?=
 =?us-ascii?Q?UuinNONNSX8f6EfJxW0iBV8o8VfGlxS1aX9NtlW25exjFawoDT4ZXSUTpvzo?=
 =?us-ascii?Q?VdXpGGBffzNQ8UMSKiS9OlFwnB++acWLkLdC7NN1vLalDBZTaIHjQYTh7Y1q?=
 =?us-ascii?Q?EJSJNgfi8lyD+tAPJ9AP9KoxVARpRyENRe9eVbuk+6IZRPTLymyym2dg9luL?=
 =?us-ascii?Q?h8yfWaX9ku3PVtbwwpo1Kp5s4ENCELNcHZNthzLGwNbNJK43LsKLcvyv7ykU?=
 =?us-ascii?Q?CnmrDuYlmIKNHD5dY0IpHqxvSB1RWmsk7hgGWSbL0K/YuwpYYxsfANVPST/T?=
 =?us-ascii?Q?Xq+boXIJxM6tTSRXcRPb8UcNbGwW06IF5RbYKxGb4LVNsZPoL5bcFJlNxrzz?=
 =?us-ascii?Q?d92BvjfkLpiXXez1BUY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:12:08.0451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ced9930-9144-4538-60f7-08de22cf64fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6084
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 11fec0fa4c11..94d0ff34593f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2191,8 +2191,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	u32 num_clear_entities, num_move_entities;
 	u32 windows, w;
 
-	num_clear_entities = adev->sdma.num_instances;
-	num_move_entities = MIN(adev->sdma.num_instances, TTM_NUM_MOVE_FENCES);
+	num_clear_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
+	num_move_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
 	windows = adev->gmc.is_app_apu ? 0 : (2 * num_move_entities + num_clear_entities);
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
@@ -2200,11 +2200,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		return windows;
 
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
@@ -2216,8 +2213,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
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
@@ -2239,8 +2237,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
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

