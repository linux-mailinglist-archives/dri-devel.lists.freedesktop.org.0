Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4119F3137
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37B310E669;
	Mon, 16 Dec 2024 13:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TAgnL/Vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCCC10E60A;
 Mon, 16 Dec 2024 13:07:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3FUdzPw0gjsId9tBsERVDKjx7nPwlfutZw/b9PDoe4QzVMyOrCwhSPa1IkdzjOmxjju7DWpnJD9THBJcvizgU1UngJwX7a9hBTtRAFY7YgKBfJ/nYGMiOGzfSGzrv58zZGsUkB8ZObCkh2eTadyoS7WfeIlC+95107CV8+iGo6mYS+dijMKC15LT+SOOvSSvcxApQDG0Qrwg80iKW/vMHRpqIhuuyAkBR8CNOVzPxSy2U5288CxQm2DEmPO8bvj81olkOmpanuToKqRlwoS6F0vTwTKXRIqX/SVh7jB1wRF91CcZBajlF+NypgIRpFvsSWcTjL4EHm4Y9NOOJV0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRqaJkdrv+Hw6epPdb2GqiKhQTOH3ELRp3bVoSrJXBc=;
 b=asQLeZPyciXUczLqEmlj1LCcvXLMCoj6/5k27mJsAp3edhCLFrrA+chaaOHLopE4Q8Dr/iQjaMlLDjk/MVnnx804leE9heItxWi1/n9SNYht/tVJCoJEf1+AYc6oDgAJs8kcR8rrHo59MK514pfDnJ7+9WYAs7ZqxcdRfxNGKboANrOXoKYnR7Bm0VJ6AySD3HNb9FAYXr7TDiDFvqKovIIy6704fR/WIRlx0ANVkooIpQBn7pCMoaLzPdUvjnPb2wXIvqT8/75C8gdf7ja3ELfnN8HrX9WroVfQWewwYx+UMtEz73R/XZX/ACMqdFNvsaz0CEjAz1LZ6B1MpYjw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRqaJkdrv+Hw6epPdb2GqiKhQTOH3ELRp3bVoSrJXBc=;
 b=TAgnL/Vlk5c4jp1gU8UmSlT31MpOwg6kVGw/n9Y6dEPUZGCaWGyXbS7W+KzMVMNbqgrb9jLKhDNGt++LV/qBNU3AG5eBh9hHZjJfplvk92dXISVSUQjSCxTbs7ujRLXbomLRAEDm+iKBaSf/CqNU/k0M9YwyCsKHnudcgUy8O20=
Received: from BYAPR05CA0088.namprd05.prod.outlook.com (2603:10b6:a03:e0::29)
 by SA1PR12MB8096.namprd12.prod.outlook.com (2603:10b6:806:326::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 13:07:54 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::b3) by BYAPR05CA0088.outlook.office365.com
 (2603:10b6:a03:e0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend Transport; Mon,
 16 Dec 2024 13:07:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 13:07:54 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Dec 2024 07:07:51 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>, "Arunpravin
 Paneer Selvam" <Arunpravin.PaneerSelvam@amd.com>, "Lin . Cao"
 <lincao12@amd.com>
Subject: [PATCH 2/2] drm/buddy: Add a testcase to verify the multiroot fini
Date: Mon, 16 Dec 2024 18:37:35 +0530
Message-ID: <20241216130735.314298-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241216130735.314298-1-Arunpravin.PaneerSelvam@amd.com>
References: <20241216130735.314298-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SA1PR12MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdac878-393c-424c-d5e5-08dd1dd2a74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M5N+IhKq+OZIe+Zp4GvQckfoVs5VPqd4Ah/GGeO9eJSG9mo3t7EJovAm0d+p?=
 =?us-ascii?Q?FY4XaP2svtawJg70c0b6jUKfflVYNuwWg7rr7pG24QCIgNUKGEA7Sn2vABg6?=
 =?us-ascii?Q?VQ8VMyr3OUHbugTPWXqBnrcq5Uwvn1Puf/fp2wy1oaLJrdIs4/vUXfiKvqGJ?=
 =?us-ascii?Q?ys0v/yJWQC36LhwqHfz8IN7HFQaSQoQdVo5tEv+eqbnOoUnLABLatZZO2yDA?=
 =?us-ascii?Q?XSM9BJ0B1Qtlp49S5D/HSouVKblY47tv2oTWalK14xTiEyfCRO6Y/fpVRDKu?=
 =?us-ascii?Q?BtQ2XEhRMhpDDjSNrqr24KBrj/jqejVFHiZSrZlGbbE2sJA1hSLsoKNU++F7?=
 =?us-ascii?Q?7NUoBHa7XW6/fNADosjv0phN6e7uncRg8zXljytW5VhLpfXx0zS89355Tc+k?=
 =?us-ascii?Q?cqnc4NH0sw8KwailB8SFlydDZ9b5+lNsu1p7VwjK5YPTVr25RCDBuHLB68Ea?=
 =?us-ascii?Q?X9HP9LdOn70zqGSX3AFCMqmTzBeUs046VCsHvKDFU4hO6b80W7yHWyGQOeJ0?=
 =?us-ascii?Q?3gH/pKkAL/m8rsNzFVyyuLOIFkdVxK8oQQYP+89RQNxAKOuWF+vIH8iA7Y0Q?=
 =?us-ascii?Q?8RyP1iuLt5rSqhdXjTsydJ1CzRBlBNnr9q4EsIWMsCjQQfhxlh4/bnC7XRp7?=
 =?us-ascii?Q?rB9ROMdS0HscNEpPoRDKZxmZgVNs/UYHe93J9At/3vqC2LwIDmktA5lQx5qb?=
 =?us-ascii?Q?gAkq4s+oWRuRmohXkoJ88zRFGRJdQe9lU+Rk8XYKCMXV5ks8CBs2ineq7Rl9?=
 =?us-ascii?Q?dDBuhnhIzwSqRH3Cg3Yuy3T6dcqb4my2N75ErpQmRH0IEpajCOCPVBTfOVHr?=
 =?us-ascii?Q?mzvKDMzn8m8iehFSCs4VTLawXZqmECH7RaJhbxvxktIGNANJ9MCUoE+kVs+2?=
 =?us-ascii?Q?Bwxms9fa5BkgHEWJSKawSJ+TkBZPjrCCWGEMThnhx/Z3bd+XV54riGykNv+l?=
 =?us-ascii?Q?70hrrNQN/qgDdCCaV4cVrgJe7i0GuxGto2bH0QO01vCZptER5AJbb+AOoMF2?=
 =?us-ascii?Q?OJED+F6TgDwhaP8i/66zSOkHnEF2CoK2vgM4/BB37ci84mDvSxAnH/CTdpQR?=
 =?us-ascii?Q?cZXwNTwNIU/QXb26QNau/tpoIitGsgz/gLX2MBaP6Xcjz0QToliDDO0jBLGH?=
 =?us-ascii?Q?vZqzemFwtl93WxZVvEwL+IV22m98dJOYQwjVFNKGd8wEtzngt3EKZcX8sHxW?=
 =?us-ascii?Q?VPP+XXmPtAzMY2I7qYQweO7gZWrKWXLYOLK78iAuot8U7SLF/1E3OHywBPgt?=
 =?us-ascii?Q?ryUmhOziRKn0VgL+Rm/JmPUsV/toG8l/IOWPiLJ5xVlV6ZsJPNgSDhEEbzHq?=
 =?us-ascii?Q?iSOhMeids6s7eHhqHWz3b494rzPq3HggfEy9I2l0m5TrV4UQ3wUej11NMceN?=
 =?us-ascii?Q?7AELvDL7XunfHhz4FlkmO6lPJknqlx4m5SI+rDtfPJg2oWrMkdArDmZnGxW3?=
 =?us-ascii?Q?FAAKsIiXon7mMiB6mqK8JW/OecWesynPhomg9iA63IpRInCsAMHpkbT72wFa?=
 =?us-ascii?Q?/MZdNh3HybuVstQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:07:54.1615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdac878-393c-424c-d5e5-08dd1dd2a74c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8096
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

- Added a testcase to verify the multiroot force merge fini.
- Added a new field in_use to track the mm freed status.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/drm_buddy.c            | 20 ++++++++++++++++-
 drivers/gpu/drm/tests/drm_buddy_test.c | 30 ++++++++++++++++++--------
 include/drm/drm_buddy.h                |  2 ++
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index ca42e6081d27..39ce918b3a65 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -102,6 +102,18 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 >= e2;
 }
 
+static bool is_roots_freed(struct drm_buddy *mm)
+{
+	int i;
+
+	for (i = 0; i < mm->n_roots; ++i) {
+		if (!drm_buddy_block_is_free(mm->roots[i]))
+			return false;
+	}
+
+	return true;
+}
+
 static struct drm_buddy_block *
 __get_buddy(struct drm_buddy_block *block)
 {
@@ -303,6 +315,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 		i++;
 	} while (size);
 
+	mm->in_use = true;
+
 	return 0;
 
 out_free_roots:
@@ -335,13 +349,17 @@ void drm_buddy_fini(struct drm_buddy *mm)
 		start = drm_buddy_block_offset(mm->roots[i]);
 		__force_merge(mm, start, start + size, order);
 
-		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
 		drm_block_free(mm, mm->roots[i]);
 
 		root_size = mm->chunk_size << order;
 		size -= root_size;
 	}
 
+	mm->in_use = false;
+
+	if (WARN_ON(!is_roots_freed(mm)))
+		mm->in_use = true;
+
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 9662c949d0e3..694b058ddd6d 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -385,19 +385,31 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
 	drm_buddy_fini(&mm);
 
 	/*
-	 * Create a new mm with a non power-of-two size. Allocate a random size, free as
-	 * cleared and then call fini. This will ensure the multi-root force merge during
-	 * fini.
+	 * Create a new mm with a non power-of-two size. Allocate a random size from each
+	 * root, free as cleared and then call fini. This will ensure the multi-root
+	 * force merge during fini.
 	 */
-	mm_size = 12 * SZ_4K;
-	size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
+	mm_size = (SZ_4K << max_order) + (SZ_4K << (max_order - 2));
+
 	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
-							    size, ps, &allocated,
-							    DRM_BUDDY_TOPDOWN_ALLOCATION),
-				"buddy_alloc hit an error size=%u\n", size);
+	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
+							    4 * ps, ps, &allocated,
+							    DRM_BUDDY_RANGE_ALLOCATION),
+				"buddy_alloc hit an error size=%lu\n", 4 * ps);
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
+							    2 * ps, ps, &allocated,
+							    DRM_BUDDY_CLEAR_ALLOCATION),
+				"buddy_alloc hit an error size=%lu\n", 2 * ps);
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, SZ_4K << max_order, mm_size,
+							    ps, ps, &allocated,
+							    DRM_BUDDY_RANGE_ALLOCATION),
+				"buddy_alloc hit an error size=%lu\n", ps);
 	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
 	drm_buddy_fini(&mm);
+	KUNIT_EXPECT_EQ(test, mm.in_use, false);
 }
 
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9689a7c5dd36..d692d831ffdd 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -86,6 +86,8 @@ struct drm_buddy {
 	unsigned int n_roots;
 	unsigned int max_order;
 
+	bool in_use;
+
 	/* Must be at least SZ_4K */
 	u64 chunk_size;
 	u64 size;
-- 
2.25.1

