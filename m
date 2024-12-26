Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3CE9FC953
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 08:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7968E10E770;
	Thu, 26 Dec 2024 07:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fsAX4Ins";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4A910E76F;
 Thu, 26 Dec 2024 07:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAJg3r0tGI7Rkm4d+bN8oh6/00CBOG8RCOBzPgp4MPnEOa7jMXjM9IewAgZ76a08rIeLtiQQHXbeDrEnBEyDsTiL40bIAhOJcchFtZimEmdXCLm5/B4fZsFq0OOvt+fWUDtpPjh58YUV6S7wHdX1r5MdZqsAaYPRncDhIa4xtl8nRkCbkHIXSwsC2R9JI/QXbvI5bTuhjK5uOUAhG0xEp19getdnbSu7C37P7qJvbpjjhH8YzAn/ya3gB7YgrscbT0gjh/QivklGR1dSDOocyaeZud/XEhDZ21Lw0FYZJsJlcZfdvVNCnceveR3iViDyMlF8R9hHwvTxflFJxKEVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOX2tPGGtpPP16seFY3EzxZgGDea7JdFrZGAg8l7Ldo=;
 b=bm6p4+dCkPcMNHMS60IE1CCH8M9ZolbxNNw+IjLCq2RQ0hFOzGjflBChRkl0KDUrmFgiivhJTDpqEGmot6PFg4AFZj3EWTsQUYDrvM3UpLwqleimvIs58U0T/N2mkpx+gwwAYLDbvvfs76XGAnrxpe6yYpmJbiN12aIzcvRqH1EGDFUFI+QKQC17ap55gTXXEBqPHoip9IKYLsJ71cW/bBz2BcmEPMaDkb5vyzlwnnzcAjTPJZwor53RIaVvA61XmLxmaM1zCgIyEsTcluvbaxbajVeAlppzwd5TEcw+GaMIaDmHgGRCie4Q4iRoCc426D5UyMV1NOtzYbbDQJTn2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOX2tPGGtpPP16seFY3EzxZgGDea7JdFrZGAg8l7Ldo=;
 b=fsAX4Insdi1g/5bVAGfzo2gD8DjD48g6GUnUzNwhqA9IFDmb82fkQZfw1Kie7JBbuoWYBGiIVKM9BDXLjVj8lSS7XyWWjyhD6MOKYGii4IdawftFLV+3+l2B6cPWDxa9cxDLG4yHyAzlLT863Wu+OmfRI/f+0RyE1Ey5GS92x3Q=
Received: from SA0PR11CA0097.namprd11.prod.outlook.com (2603:10b6:806:d1::12)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 07:01:41 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:d1:cafe::27) by SA0PR11CA0097.outlook.office365.com
 (2603:10b6:806:d1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Thu,
 26 Dec 2024 07:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Thu, 26 Dec 2024 07:01:40 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Dec 2024 01:01:38 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>, "Arunpravin
 Paneer Selvam" <Arunpravin.PaneerSelvam@amd.com>, "Lin . Cao"
 <lincao12@amd.com>
Subject: [PATCH v2 2/2] drm/buddy: Add a testcase to verify the multiroot fini
Date: Thu, 26 Dec 2024 12:31:16 +0530
Message-ID: <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241226070116.309290-1-Arunpravin.PaneerSelvam@amd.com>
References: <20241226070116.309290-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d172c4-77ed-4956-a790-08dd257b2636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckhsWVZPSUkyRGw4WXFwQ2JkOXF1NE9BYjFkOVZJdlN1R2JYUm81UXR0d0NR?=
 =?utf-8?B?MU1OQ2RzOWJnQk8wZVNnNUYxSVdVNitFaVRkNmhtbk5xSCtQYkFnOE9MeGVM?=
 =?utf-8?B?UXRGTTcvV3U4ZGw5N2NzMW9vQVE1UVpCLzkvNWNqM3hRL2E5dWlCbDNYM3NF?=
 =?utf-8?B?STZUbUtDK2xrYUE0WWtWdU1FdHBQTmgvQ0t4T29COFRZT0VjMktMQkNBcmRE?=
 =?utf-8?B?bHBxQnJHRXA4bndEQmk3cFh2WHJkbFpPL3EwM05ySkxjOFArNnNPa1NuK1hp?=
 =?utf-8?B?Z2FtWnJmOHIxTkxadzJrSUtReE5jVGRNbmZEQmh4bXNnMTdpeXNXbnprdisv?=
 =?utf-8?B?eWI3VG9aZUtnUTREa1ZVYXVYOFNGYVdkZ3NoU0RNMU1pMHlSSWJ2YWpIcFJn?=
 =?utf-8?B?SEJySy9JUXIrL2V2a0dPZnQxdkN5UTMvQ0lPZjRidGhWU1YvRUtJN3F4TEFs?=
 =?utf-8?B?VklVR1UwdFFkVmoybTJnb1ZnRTMvK3BqQUxxZk5zZzFLUC9NOUR1UDR6ZDJv?=
 =?utf-8?B?eUwzTEdUWDZJVzc5Lzg2cStNZGNlUTI3MnF2UlM4OXkySk1IdE9HNDRmVnho?=
 =?utf-8?B?aXdYWC9ab0lncUJ1TXJOZnlBUkpVNXZHeHNZZ3dKZ3ZsSEZXQmhnRHdRMnp0?=
 =?utf-8?B?VURvK1gvejdiRFg0Z2h0ekswU2pXMzB6WFRMUTVlemhmZUtGVnY3UnNmTHo0?=
 =?utf-8?B?RVQ1OTJsaWhSK0JsNHp4bnZVb1lYU0RVd2VSU2ZwaGFxM2I1b0lMU1Y3cjF6?=
 =?utf-8?B?UlRnY0FrSlRJb1MrMTA3VWNzdFlzT1Y5R3o0SXNNMGkwcjhnNE1maUxDaXd5?=
 =?utf-8?B?dTdaTEZIcjVtK1ZSaXZ1b3dCMWpRSG12cVZSY2hCdU1pY0cyZXIweU1tcTVH?=
 =?utf-8?B?S2NCSzJWZnlKVEVlTlppbGJ1cm4rbnlwdWhieVp3eHZIejlsZ09BVW9KU1Ro?=
 =?utf-8?B?bTFCTVQrVDJ0SDBqRXNOMkl1SzQzVDhSUE9Fc3VIT21sMlVpWWhQVFJSeW5L?=
 =?utf-8?B?Q0trQ1MyVDd4L1NubE1yMmdQWENnRy9wN1J0TlZtL051NVhyYXlHNVlOOW1B?=
 =?utf-8?B?U2pQamJVVXM4ckNuWnFPUWlkak10YmFFNnIrZm05QUE1YW0vWFROcHVlcThZ?=
 =?utf-8?B?VnNIRDJJMThRK0ZvSG1hQTVLSE9EK1V1UmdqU2dVMnV1Uk1Hd3VqOXVBSFA0?=
 =?utf-8?B?WXlncHdpSDhaUnJoYmtWeGROOFVrTys3bUhWR2JmTU9BOUhEQU1aTTVNelJt?=
 =?utf-8?B?eFc5QTJnVUFFZzhQR2RRZE5sVzhwak9vSGg1SHhaNHlXTGdpa3NkeXg3TDI4?=
 =?utf-8?B?S3g1M1QvbEVJdGpFM25UNURCQTVRMzFwb2xRNER2UytsbnB4Rk5pYTM0Zmx2?=
 =?utf-8?B?WjM4aUpJTFVBWS9OU2M5cCtxNFp0R3ZSbEdTR1FLUHdWQmpPOFNURXJramNQ?=
 =?utf-8?B?cjJXRmczM2pJZFNkTnl2UFJjTUFucCswWTdPUVhXOHlSRDBYQ2I1YXhNMWl3?=
 =?utf-8?B?dlBBenpBZlJIRWtIY3I4UWZQbFpMajFGVjNDajBINlBPdy91dXl3ZjEyOWVw?=
 =?utf-8?B?UGpqTllKQnFWalQwT0dxeVlMRVFjUjd2MUZnT2pqczFjdXZFYUZYNHgyZ0xX?=
 =?utf-8?B?amk0UGRhNTd2R2hCNGsybmdwWmZTRjNmMFpNY1lMQjZMZElPMUU2RzhPSUFQ?=
 =?utf-8?B?U01NV3pEa0lydk5YQWx6NkkxK2E2YXNTcnBaWUhYU1pGMUlZWkxUWmZuSUZI?=
 =?utf-8?B?N2hGVC9xWTZ3V1ZCV1lOTVpZWktDRkZZNWhFVFB2Tlp1dXZiZlBNTnRUTTdL?=
 =?utf-8?B?WmdzUzA1UENhRGE0Q2tBMzFaWFkzMW9VdlBJOVVoMnc2UXBTSW9GTTU1OHhi?=
 =?utf-8?B?SVo3bE9uYUc1VFVub0RONHlpVlJOYXZRNmpQRHlRMmZKQ1VSWDFyRnJORVJn?=
 =?utf-8?B?YmRoK09NL3dXZmh0aFBKUm1STE5kZUN6SXIrSnZjMnNMWGM3Zy8xeCt6RHl0?=
 =?utf-8?Q?pU0uO4CX7eKv9vLuLM4W2Nu6/QEJwk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 07:01:40.7862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d172c4-77ed-4956-a790-08dd257b2636
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255
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

v2:(Matthew)
  - Add kunit_fail_current_test() when WARN_ON is true.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/drm_buddy.c            |  6 +++++-
 drivers/gpu/drm/tests/drm_buddy_test.c | 29 ++++++++++++++++++--------
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index ca42e6081d27..241c855f891f 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -3,6 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <kunit/test-bug.h>
+
 #include <linux/kmemleak.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
@@ -335,7 +337,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
 		start = drm_buddy_block_offset(mm->roots[i]);
 		__force_merge(mm, start, start + size, order);
 
-		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
+		if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
+			kunit_fail_current_test("buddy_fini() root");
+
 		drm_block_free(mm, mm->roots[i]);
 
 		root_size = mm->chunk_size << order;
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 9662c949d0e3..4b5818f9f2a9 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -385,17 +385,28 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
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
 }
-- 
2.25.1

