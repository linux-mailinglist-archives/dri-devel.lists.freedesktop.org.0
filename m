Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51550853250
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6C10E5B7;
	Tue, 13 Feb 2024 13:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JhSNNuTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4B910E547;
 Tue, 13 Feb 2024 13:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQJ3SQoDseOr6Eppu4zm+4k/Hjw8gUCZK1SKRhSSiSSzKO8e93zEzLux8FJSZWKb9pHaspUVriEuaDTbDMLrBD6BmgKlZ5KvHIN6P70CYZ7uH1GfC3DcL4q821j2o4AulGdookT62mrnDmurf/5U1fu1KicTRDoRGVhLhR75cIiWBzh/SV86eqKvicH+1c3SRA0ZLLSd4qKiMJ6c7BWsfYR/i5S91k6i9ockpFvG2lWvY6vIdg1Od+10M37Hg+VA5L6FlFMYv7rcHjFJxl6EcdfZHQSptXxsXAGKlT8IAeY56CUb23/WzPxrOXEOLkVznVefGexqn5Uoarw1CI0dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giqYhbUlkuQtYIbZUlewWa/0WUX8N8Ll7EOK0gaohBs=;
 b=azB0/h7uvaThw6HLHHzb2FWhtL/IyKTOW2j3J2qLWPB7MbSalf6ffpiS2eOWLXAtcN96X/m8Ga/Hz4BcRPmQlHzYvnP650lIszEToeFlgjWaz9N1As9nZgvkhIXUFhZSOXXs2/z5o5zGC7eZfjXyUoFggbDeGc2dw4CZEvpYqR6dV6FOec/fWKK/GflteHI/tJK+zoP2y8De5tdNsmZF46jn8wbcPRDLJe36/twzBUG/sjm2f1nEfKSsOEfJJE4HNKjVo7qUiY35fUEv62fO+1j+ZVPzwBo4HquBR4uiA+HAl/eTz4hHtZ21FAnCrStpLCikNHRudvCfdPG2BSkHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giqYhbUlkuQtYIbZUlewWa/0WUX8N8Ll7EOK0gaohBs=;
 b=JhSNNuTmJDyOIZxIPffCNKSM3WYB5kJdip2sOK+cUyvJGOLIPP/tEYbCD4uBDTfn6IFj4UqLOKTVyHpYHzXk64nMCYsVePd8pNrNGJL3GDXg7gTSdutKMyYX7CwzjzN7k9Zv7A348miNLVAZT+KJ14q0Oz5153/OTDDGHNYubFA=
Received: from BN9PR03CA0364.namprd03.prod.outlook.com (2603:10b6:408:f7::9)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 13:52:31 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::2d) by BN9PR03CA0364.outlook.office365.com
 (2603:10b6:408:f7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 13:52:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 13:52:29 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 07:52:26 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>, <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 2/2] drm/tests/drm_buddy: add alloc_contiguous test
Date: Tue, 13 Feb 2024 19:22:03 +0530
Message-ID: <20240213135203.348050-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213135203.348050-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240213135203.348050-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b3451c-3773-43e4-6481-08dc2c9b0536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQ2zvcuvTxrsl2Mg3LzER2XBqi1G7roJNYNb7OWTbnyMmMjI9A9ddJ3wdQn+o0OLpAnDnmD0rN13Id7wNqZONMrGb/kEqG1UAHJesipnITNjn1Ggk7hY7xFFL8UyfOxiDL/xyksUgG4EbdVe3KVjO+yzKkAs0q7eiu6lwbPxnApdYvWwXuLFOORhlbgo9Rz2mp3BN9LsxVsMfNptfLdfN0//lDnQwf1xbCc1a7pWdlnjgDeU8N1WlNgn+HPb/80Gi7C7dmAzWD14sLwnWqP3Nyv1ikqYh4WfPBqf+CTpHUViPP8unga8Br/XHcwMTFT9a+fBSeP454BsF/R0y86sSUJYyv1FbpVUDrEJ0tkaSlxUQzNNdWIJBLm37ukvJRvikaw5kVu3k5drYHXl7Rr5s+jTceHzotRA9fCy67UXd0XAf1rUNKnDghnekm5KPL8tQMjEBR9if9gM6pKAy+hA/JxUzRvRmdoQvGyhlA8mcrfJddrGmQBU4/Dydah3UEtvYi53rdCvZXNuzvgOsu9mFUYQsJNqm340r4rR0B9DHOg66zKVew6f+/eBJLZgmtb5lbEomYQDVjiyqB0JEaD8ag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(46966006)(36840700001)(40470700004)(41300700001)(7696005)(478600001)(6666004)(966005)(16526019)(2906002)(4326008)(54906003)(5660300002)(110136005)(70586007)(70206006)(66574015)(26005)(336012)(1076003)(2616005)(426003)(36756003)(8936002)(8676002)(86362001)(316002)(356005)(82740400003)(81166007)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 13:52:29.8459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b3451c-3773-43e4-6481-08dc2c9b0536
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.

References: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Limonciello <mario.limonciello@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 89 ++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index ea2af6bd9abe..fee6bec757d1 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -8,6 +8,7 @@
 
 #include <linux/prime_numbers.h>
 #include <linux/sched/signal.h>
+#include <linux/sizes.h>
 
 #include <drm/drm_buddy.h>
 
@@ -18,6 +19,93 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
+static void drm_test_buddy_alloc_contiguous(struct kunit *test)
+{
+	u64 mm_size, ps = SZ_4K, i, n_pages, total;
+	struct drm_buddy_block *block;
+	struct drm_buddy mm;
+	LIST_HEAD(left);
+	LIST_HEAD(middle);
+	LIST_HEAD(right);
+	LIST_HEAD(allocated);
+
+	mm_size = 16 * 3 * SZ_4K;
+
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+
+	/*
+	 * Idea is to fragment the address space by alternating block
+	 * allocations between three different lists; one for left, middle and
+	 * right. We can then free a list to simulate fragmentation. In
+	 * particular we want to exercise the DRM_BUDDY_CONTIGUOUS_ALLOCATION,
+	 * including the try_harder path.
+	 */
+
+	i = 0;
+	n_pages = mm_size / ps;
+	do {
+		struct list_head *list;
+		int slot = i % 3;
+
+		if (slot == 0)
+			list = &left;
+		else if (slot == 1)
+			list = &middle;
+		else
+			list = &right;
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							      ps, ps, list, 0),
+				       "buddy_alloc hit an error size=%d\n",
+				       ps);
+	} while (++i < n_pages);
+
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   3 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc didn't error size=%d\n", 3 * ps);
+
+	drm_buddy_free_list(&mm, &middle);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   3 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   2 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
+
+	drm_buddy_free_list(&mm, &right);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   3 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+	/*
+	 * At this point we should have enough contiguous space for 2 blocks,
+	 * however they are never buddies (since we freed middle and right) so
+	 * will require the try_harder logic to find them.
+	 */
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							    2 * ps, ps, &allocated,
+							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc hit an error size=%d\n", 2 * ps);
+
+	drm_buddy_free_list(&mm, &left);
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							    3 * ps, ps, &allocated,
+							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc hit an error size=%d\n", 3 * ps);
+
+	total = 0;
+	list_for_each_entry(block, &allocated, link)
+		total += drm_buddy_block_size(&mm, block);
+
+	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
+
+	drm_buddy_free_list(&mm, &allocated);
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_alloc_pathological(struct kunit *test)
 {
 	u64 mm_size, size, start = 0;
@@ -280,6 +368,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
+	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	{}
 };
 
-- 
2.25.1

