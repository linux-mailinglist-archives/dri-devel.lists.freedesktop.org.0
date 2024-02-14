Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D37854A56
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 14:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3884610E1B2;
	Wed, 14 Feb 2024 13:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qJtLoWia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399F510E126;
 Wed, 14 Feb 2024 13:19:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/ip50hv4mW3KPjP7+UT66Gom8TkTHX5qGnZMET84JCZvrqeUoM962oi27bYaiGCJ21R/4L2YIMweQ8kq//rP26WBDNs/Y5uKxoVF2jtAMFS4AhUyD1tcoHRF+hu1AKzFJDU2FKPxrUmFmNEgQ9ZpOiiKMPR0dbFMTBxc8qfusOVH40FSBf+XOuT/M8onIousrzF4IFhpZ0s8K05AsmULv0VEmZyLzDDn51rN/Wax7ehno19vw3n5olqugM8mh/beP3ZTRw++FliavHz72BzQcO0WrE122c2KlpnzSelu4RfLXBsg/INqav1Y4fIPHXdBOQTGVu+vUU2HRlp7jLGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdEe4Libb6vlpYEI+EqL0DNhnWRR1/Jj3+G9O1wRdI8=;
 b=MlHsWNde/+deTDW+TDOpdH47SR3yMG/VQOQvzayrsem5hizskZwn/KBQ6LAcq+PqVArmn8NBFbk0nsGwKGbm2Gq04A91b8oLbyGsvuZKfJegj2f5Fw6kq+fkn2JpjCmnjWi3osnsx0IsmsPzLovsPQeRzpMIUuYWumuu4CnW0xPj6+3UvxaOblRnJ7+Ix62oTFXhnGnhAuz3lywKrPUWAeicm5hO4j5qDGbv9fz1qlvOoReTItUqtGN+cpfz0/zN5HlsPBnE+5ATQj77dDsNBw8wqdtTb4VHvPRSfzUq/Ti7RUKeCvBV480HTlEF7X/HlIqBQTyHPYBrgO+EV3SlqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdEe4Libb6vlpYEI+EqL0DNhnWRR1/Jj3+G9O1wRdI8=;
 b=qJtLoWiaZwN9SYlUEoAZKV84pnz+Ptrmc1jXc49N7Jaa3Y7Lw2o8rIMJHs5/Msg0aHzr5GUkEVKR+BY2UA2FNrtcqNlSk3B0VoCj0P4j42eT1gQedp5JOjn4/REAk1+SJQoF+8zeIVFI2eL0snFW90a6HIrdbXMfNEvIdRb74kE=
Received: from DS7PR03CA0253.namprd03.prod.outlook.com (2603:10b6:5:3b3::18)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.17; Wed, 14 Feb
 2024 13:19:34 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::ca) by DS7PR03CA0253.outlook.office365.com
 (2603:10b6:5:3b3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Wed, 14 Feb 2024 13:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 13:19:33 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 07:19:30 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>, <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2 2/2] drm/tests/drm_buddy: add alloc_contiguous test
Date: Wed, 14 Feb 2024 18:48:53 +0530
Message-ID: <20240214131853.5934-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240214131853.5934-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240214131853.5934-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DM4PR12MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: 75296b21-1205-4f08-3968-08dc2d5f95e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VqdrtJLNmUkYYGcw6J7Eg0zkkaTTrpb69s7CJ7VDQyaQArgHz3pSg+2pudZTKp8fHC4gJ/WbOgm2XMk7Pmr7Nd/upPpO8OGcoRdD7fVyx81doNui5tv3cDPfGAbVqGuS1238j23IVeJ+MKPAV2ieHJo5RjZP3mEol6cKtOLAeg0CAln/SmDSiCdvmME4Nowrl7vlqwYOcLq/SXYqY4lFrNz41a+WlQ34kLbhQ08tyG/2BakuGhbfXWIOYIc1XLTOXuLE3p6jJR0RPF+64s75AbLOvA94rypSuzFOivKAIe9tcHbzZyoZyL1XnoOZaXniHdy6c55IxpdAqMIgfazXz6MXVgz0o5NiDkXXxbhtrCNCGZQx0tWnhGnJ58HqYXX938PZNZdnpDSC+ImxBCC0cYZ9eEAFElJDbtR2RLTPTiohj5EAXTt2CmPlpQo9qGxDofykWKcpnPMkOv3q2L0c/i492dbHc2o49VVHBuBuOh2eediAoGFXTJjmfPZQouO9T/HB/3zPvKXfXI2FS15mMukLaOfanBAT5jM1m7j4hJ+f8d0Snrpz9tLQrUbaC6ypykTx6PVilta2MzpuNGK1fQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230273577357003)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(40470700004)(46966006)(36840700001)(86362001)(356005)(81166007)(82740400003)(41300700001)(2906002)(1076003)(2616005)(316002)(966005)(6666004)(478600001)(83380400001)(16526019)(66574015)(26005)(426003)(336012)(8936002)(54906003)(7696005)(70206006)(36756003)(110136005)(4326008)(8676002)(70586007)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 13:19:33.9088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75296b21-1205-4f08-3968-08dc2d5f95e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
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

From: Matthew Auld <matthew.auld@intel.com>

Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.

v2: Fix checkpatch warnings.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Limonciello <mario.limonciello@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
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

