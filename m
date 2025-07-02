Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C80AF5E30
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E51910E75B;
	Wed,  2 Jul 2025 16:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZN3BtJ+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B0410E74A;
 Wed,  2 Jul 2025 16:13:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUblJQ8JlKHcpYLIgXBUtxTJJf7PfBDFdygw5lrSVSg7tIIHoIgzv72OVj3Y1jtsxj7e69qmivXwqlaSfJJUkGd8wwn2fhcAC+yu26M6pdawy7kucPuDEye9fhUOgfhnr3NAmfnL3pS2n2QgWtHc2pOnS9D9C0OyqxmjRxCThKbTBzHypENStBCHGCgaMIcd10VayirHYn4gWYktzQa9is1o8L+kDCJMnc+TEN6tQGSEaWhKKw34NfOHoHP6jpX6QhHID+X1Ur1OGm6fczf8yXNtPQFmGzJobgIvsix+tFhkIxRUIn02u6yYt8TnZYMv46vyURqlmepS4SaBJbxrgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuJ+Tr08weuEJgrrKgI6T2Jy2JZS3PuD7ZscwTWw2Ys=;
 b=jELla4zbf4cgVadCNI2VtaJmcCmgtd0hT6o1DjuMjvgrHEVNCKyX/5MeMlgxTu7CkNcbQhyC/XtjpFTyiy4KZmv8Lg4eJlYkcIxIhFknBir2CZ5v28QT9JiSUJPB5luGx4KkIlQHCrWE5hOr5X07IalN9JsN0eM2PB/J2m/9Rz5lvy/S3ne5oYVQOHLOtLmPpxsy5kolM1MNJ23lnFLDYezoQY3Uo0k+HobjZ6UxpiW7NXNzkmX8U0LbWxFhF31+1hIP8w0kQbeNLZm15faMjYmlPWeFHhUKoHRs21uug9mcyGbkdD7fSqzo4lhGdnOpLnSL71VK9I6pAgXuYV3A9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuJ+Tr08weuEJgrrKgI6T2Jy2JZS3PuD7ZscwTWw2Ys=;
 b=ZN3BtJ+9C7ogepgzOVg/GlWlTo5fc+jsIJRv7ffNKYuKZh7nvZp8/RYC/iNi5w3QGnNDRBT/I/RydY8ghRlMf9PQjwD/5xQlAxxyfAXZu73d7MOPG74n7l88QwloMRMJAWjm3M7lLamVTzgbom68gF4S3Nn4yNXeaeGwwRv7ka0=
Received: from MW4PR03CA0197.namprd03.prod.outlook.com (2603:10b6:303:b8::22)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 16:13:12 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com (2603:10b6:303:b8::4)
 by MW4PR03CA0197.outlook.office365.com (2603:10b6:303:b8::22) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19
 via Frontend Transport; Wed, 2 Jul 2025 16:13:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 16:13:10 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 11:13:07 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/3] drm/buddy: use DRM_BUDDY_CLEAR_ALLOCATION as a hint,
 not a hard req
Date: Wed, 2 Jul 2025 18:12:03 +0200
Message-ID: <20250702161208.25188-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702161208.25188-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250702161208.25188-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 94cf7d47-799c-4bfa-441d-08ddb983571c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CmdVIrrOAVgJULBwk620Ji6GuW/crZWFu6hmrAvoXVDrHswtVVXw1ViZ6Lq9?=
 =?us-ascii?Q?x0S34yQHkuSi5Q86N03CtAMqkpSSHSHqMa/9doOfE2RU5vpi9mLO0Mm79SW4?=
 =?us-ascii?Q?HVrnrtuhiuBvj/8W2JUl+suPjKo12ZQYx7IzjcuDpGAUEfjyxRSmfSE0bEqO?=
 =?us-ascii?Q?SjAHjcyVrYaEVpdjuWn91y9nfjG8HxnjhMDiI2PWSfFX+j66NfuhylBsS5Ud?=
 =?us-ascii?Q?aAYST9oJlx87nCJqnt0fN0tyI8EYTzDUZy/DWHCjv7qjtXyE0GGc5JGh43PV?=
 =?us-ascii?Q?m642JH1cvOzYRidDNidizOIQil4rEY/m96E2DOvKbHbgvl3dXbBWAgACmVt9?=
 =?us-ascii?Q?LD/ii6tlDazVQrJSzXMYJzLEWLUMEAOp3e4WZuAy29TkQGmdvGrd64rYO/8P?=
 =?us-ascii?Q?szyMQiMPg5DcSk926YiBJBWJScjVAem2WM0HvKHN2pKh86KCCX9nGC8vWzZD?=
 =?us-ascii?Q?t+KWjO2AfoZKVy9aLqmofyrjkBjoIP8SWgJk/t3pu6ophI/qrtp9trmi7vfk?=
 =?us-ascii?Q?X7UpqzRqUF9tXoQFlRhpKhqkhxD72nbMNumJoYhKJu9waKRVrJ9DlrF9WfQS?=
 =?us-ascii?Q?6jZXiccct6IsBNM7QGdvnVSGUFLmlWhdC84zYc4HUAn+FB80Ljexe7Fg5j4C?=
 =?us-ascii?Q?qmGSmi8c5pvPYdBox6bSrTWcgePqGX97ZvdcVjDrBsru3qiX4K38AvYCW6H3?=
 =?us-ascii?Q?kyxreyy4gtL990VlLnXWyQ8w7whH+5TcBFcFhhxZRIr9ATIM2ikJEHIDtmCn?=
 =?us-ascii?Q?C0ME3QRlOhsndL2K9lWfVDdYfwPzrEZoC9GkZZDZaHPdJ81vGx7SCaoVYrqw?=
 =?us-ascii?Q?KuIR6jatKs13Pr4zhtw/TPhzcKbz/wXeWBVM/Y7NPAElZRbGsofhknbuvtNS?=
 =?us-ascii?Q?QTJ+mdexqFsVUn8NOqtPeBwfnpxJ4rPgKFQflUTclG6zOFCFr7am+sQMvEsQ?=
 =?us-ascii?Q?mtFy/5Ki8Agfhk0OY9hGScS6N3qOrRQWsBFq5xIBCbyP4Og1kpnG78h/QrAP?=
 =?us-ascii?Q?zPSjoWFOLObYIWHOWb4OVGn9yMrxA7lI7WC+gyH1S9GRx8mm9TxEruX7iSpv?=
 =?us-ascii?Q?fX1FK5sMvGJ53Jc+T7SEpZT2GstcMSjRd811Bo9iNCJ9iYG6M8AMObF7hM75?=
 =?us-ascii?Q?Ukg65y6URQlAkmVqeurlVKVFjjjrS08xwqfi0UlFJlrRp1UsezxbL6uS1Ggx?=
 =?us-ascii?Q?q/hxR0aZvAi2XctD8uOmgwA4DW36lLUKrp/qTbKniBrXs+yz+9LFql82hI0T?=
 =?us-ascii?Q?IXoKD/Cvtx5NRWV92QJLowgCnpzM/s4U9CXq/cGhqGn0S+/x2zGuwP1l6WXn?=
 =?us-ascii?Q?JURKAPo6/d0+yp/+O+n3EH8JmaLrh/l9RdXdUnsgazRj9O4+fb6WDgydyDWJ?=
 =?us-ascii?Q?wkcHuhEFOpnmq3j9uhvtXeUN2L1OQyzguEXC2jBlZFGbkPsSsh38LURwjq8H?=
 =?us-ascii?Q?iWjlt87bdbH0pjo2A5NPF3Q6DflqAVy/h5M9GnQL2vZuGB5t/ufaQD3kYVn1?=
 =?us-ascii?Q?U8szG08fjaJHi+So8ewfVQMvyCZPaFGgsm36?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:13:10.8446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cf7d47-799c-4bfa-441d-08ddb983571c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507
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

The rationale for this change is that it's preferable to return
non-cleared memory instead of splitting up higher-order blocks as
this leads to more fragmented memory.

The driver will be able to clear the memory by itself if required
and the clear tracking will avoid the need for useless clearing jobs.

This commit renames DRM_BUDDY_CLEAR_ALLOCATION as
DRM_BUDDY_PREFER_CLEAR_ALLOCATION to make the intent clearer, and
delete the tests that expected that passing this flag would return
cleared memory.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c |  2 +-
 drivers/gpu/drm/drm_buddy.c                  | 43 ++++++-----
 drivers/gpu/drm/tests/drm_buddy_test.c       | 75 +++-----------------
 include/drm/drm_buddy.h                      |  2 +-
 4 files changed, 35 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index dbbaa15a973e..24dd094eac84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -514,7 +514,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
 
 	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
-		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
+		vres->flags |= DRM_BUDDY_PREFER_CLEAR_ALLOCATION;
 
 	if (fpfn || lpfn != mgr->mm.size)
 		/* Allocate blocks in desired range */
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 555c72abce4c..fd31322b3d41 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -473,7 +473,7 @@ EXPORT_SYMBOL(drm_buddy_free_list);
 
 static bool block_incompatible(struct drm_buddy_block *block, unsigned int flags)
 {
-	bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
+	bool needs_clear = flags & DRM_BUDDY_PREFER_CLEAR_ALLOCATION;
 
 	return needs_clear != drm_buddy_block_is_clear(block);
 }
@@ -593,21 +593,30 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 	     unsigned long flags)
 {
 	struct drm_buddy_block *max_block = NULL, *block = NULL;
+	bool wants_clear;
 	unsigned int i;
 
 	for (i = order; i <= mm->max_order; ++i) {
 		struct drm_buddy_block *tmp_block;
 
+		wants_clear = flags & DRM_BUDDY_PREFER_CLEAR_ALLOCATION;
+
+retry:
 		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
-			if (block_incompatible(tmp_block, flags))
+			if (wants_clear && !drm_buddy_block_is_clear(tmp_block))
 				continue;
 
 			block = tmp_block;
 			break;
 		}
 
-		if (!block)
+		if (!block) {
+			if (wants_clear) {
+				wants_clear = false;
+				goto retry;
+			}
 			continue;
+		}
 
 		if (!max_block) {
 			max_block = block;
@@ -630,6 +639,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 {
 	struct drm_buddy_block *block = NULL;
 	unsigned int tmp;
+	bool wants_clear;
 	int err;
 
 	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
@@ -640,9 +650,11 @@ alloc_from_freelist(struct drm_buddy *mm,
 	} else {
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
 			struct drm_buddy_block *tmp_block;
+			wants_clear = flags & DRM_BUDDY_PREFER_CLEAR_ALLOCATION;
 
+retry:
 			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
-				if (block_incompatible(tmp_block, flags))
+				if (wants_clear && !drm_buddy_block_is_clear(tmp_block))
 					continue;
 
 				block = tmp_block;
@@ -651,25 +663,20 @@ alloc_from_freelist(struct drm_buddy *mm,
 
 			if (block)
 				break;
-		}
-	}
 
-	if (!block) {
-		/* Fallback method */
-		for (tmp = order; tmp <= mm->max_order; ++tmp) {
-			if (!list_empty(&mm->free_list[tmp])) {
-				block = list_last_entry(&mm->free_list[tmp],
-							struct drm_buddy_block,
-							link);
-				if (block)
-					break;
+			if (wants_clear) {
+				/* Relax this requirement to avoid splitting up higher order
+				 * blocks.
+				 */
+				wants_clear = false;
+				goto retry;
 			}
 		}
-
-		if (!block)
-			return ERR_PTR(-ENOSPC);
 	}
 
+	if (!block)
+		return ERR_PTR(-ENOSPC);
+
 	BUG_ON(!drm_buddy_block_is_free(block));
 
 	while (tmp != order) {
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 7a0e523651f0..7ae65d93adb0 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -240,7 +240,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 	bias_end = max(bias_end, bias_start + ps);
 	bias_rem = bias_end - bias_start;
 
-	flags = DRM_BUDDY_CLEAR_ALLOCATION | DRM_BUDDY_RANGE_ALLOCATION;
+	flags = DRM_BUDDY_PREFER_CLEAR_ALLOCATION | DRM_BUDDY_RANGE_ALLOCATION;
 	size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
 
 	KUNIT_ASSERT_FALSE_MSG(test,
@@ -272,67 +272,9 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
 	LIST_HEAD(clean);
 
 	mm_size = SZ_4K << max_order;
-	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
-
-	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
-
-	/*
-	 * Idea is to allocate and free some random portion of the address space,
-	 * returning those pages as non-dirty and randomly alternate between
-	 * requesting dirty and non-dirty pages (not going over the limit
-	 * we freed as non-dirty), putting that into two separate lists.
-	 * Loop over both lists at the end checking that the dirty list
-	 * is indeed all dirty pages and vice versa. Free it all again,
-	 * keeping the dirty/clear status.
-	 */
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
-							    5 * ps, ps, &allocated,
-							    DRM_BUDDY_TOPDOWN_ALLOCATION),
-				"buddy_alloc hit an error size=%lu\n", 5 * ps);
-	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
-
-	n_pages = 10;
-	do {
-		unsigned long flags;
-		struct list_head *list;
-		int slot = i % 2;
-
-		if (slot == 0) {
-			list = &dirty;
-			flags = 0;
-		} else {
-			list = &clean;
-			flags = DRM_BUDDY_CLEAR_ALLOCATION;
-		}
-
-		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
-								    ps, ps, list,
-								    flags),
-					"buddy_alloc hit an error size=%lu\n", ps);
-	} while (++i < n_pages);
-
-	list_for_each_entry(block, &clean, link)
-		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), true);
-
-	list_for_each_entry(block, &dirty, link)
-		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
-
-	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
-
-	/*
-	 * Trying to go over the clear limit for some allocation.
-	 * The allocation should never fail with reasonable page-size.
-	 */
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
-							    10 * ps, ps, &clean,
-							    DRM_BUDDY_CLEAR_ALLOCATION),
-				"buddy_alloc hit an error size=%lu\n", 10 * ps);
-
-	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
-	drm_buddy_free_list(&mm, &dirty, 0);
-	drm_buddy_fini(&mm);
 
 	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 
 	/*
 	 * Create a new mm. Intentionally fragment the address space by creating
@@ -366,14 +308,13 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
 	do {
 		size = SZ_4K << order;
 
-		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
-								    size, size, &allocated,
-								    DRM_BUDDY_CLEAR_ALLOCATION),
-					"buddy_alloc hit an error size=%u\n", size);
+		KUNIT_ASSERT_FALSE_MSG(
+			test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+						     size, size, &allocated,
+						     DRM_BUDDY_PREFER_CLEAR_ALLOCATION),
+			"buddy_alloc hit an error size=%u\n", size);
 		total = 0;
 		list_for_each_entry(block, &allocated, link) {
-			if (size != mm_size)
-				KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
 			total += drm_buddy_block_size(&mm, block);
 		}
 		KUNIT_EXPECT_EQ(test, total, size);
@@ -399,7 +340,7 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
 	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
 							    2 * ps, ps, &allocated,
-							    DRM_BUDDY_CLEAR_ALLOCATION),
+							    DRM_BUDDY_PREFER_CLEAR_ALLOCATION),
 				"buddy_alloc hit an error size=%lu\n", 2 * ps);
 	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, SZ_4K << max_order, mm_size,
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index c338d03028c3..ed06be63a770 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -25,7 +25,7 @@
 #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
 #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
-#define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
+#define DRM_BUDDY_PREFER_CLEAR_ALLOCATION	BIT(3)
 #define DRM_BUDDY_CLEARED			BIT(4)
 #define DRM_BUDDY_TRIM_DISABLE			BIT(5)
 #define DRM_BUDDY_TRIM_IF_CLEAR			BIT(6)
-- 
2.43.0

