Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6CA854252
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 06:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26CA10E36B;
	Wed, 14 Feb 2024 05:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qYCxAjuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA72210E33A;
 Wed, 14 Feb 2024 05:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Si1+bpoQNfoyqWwiDPJEjDIGOwV7SqI2GKX3myzAbTi51svXmXMROaQddlPAvclBqKMoVceOPQjq7BQXAnQ7BvtOe0Vl+twvCQxUl81H0jHj1vE+pRiCq/fhuKpvtmAruFz/NipPtpWF+bNbOvdUCEwkClF9ZbJlVrVlmBV7P+bIIL3OkeHCzu1UtEa+zP9sTvDPGd1FOTL8iLxcI4h+LOdOxlTH8XnSMvNZa2l69R9eC4gt9jy+Uv/88mh4/bi2akydqsuRxz4ErFiQRCGnRyUtwK2Ybiki2jzP3fpULxu2P3vbYwkN4LuBjJFwWVJAzFs4gRR/9/IcpN7GJjYSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGh7i6wAe3vTIS5iSMRiWzVAXCQn1NU1AqQdWxMKfV0=;
 b=Vicie5IRr2EKpRQlQBUGgVp3axxlky/4oXCxDX/LQ7qNRGiicUq/fQBxSJMt0jdB6p9YhBefSG+0P4G7htixzxOgOhE7Ux3q8/RSB4pIv+G4qAbtWzuPIeDPmBqe+Ht2I3wMQJqeTjxIOzTvIpYZyPU7T/dahDqgOpnVM2Jzh4AeP63SqYlmOJowWYWx/1YOMzqtBHRawe0XXCtYtuvtmCZyaVZ17OFEHZKReh5dBY19Kw7msHSNOmbrv4gB1t1rB/SHkJnmIpCM5jvVPnqc9bMVD+zs94a9I8UahG+SGBDKSvr/ziyUa9npon3ANUR64r9IM9P4USv/6wYo0f3xkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGh7i6wAe3vTIS5iSMRiWzVAXCQn1NU1AqQdWxMKfV0=;
 b=qYCxAjuyB4HHHvaEb8NDq1ffjr265VjZSEYOec1JQZYq4LydB9hPPIb5ePZbRhjBD1OEVXwCuU9Gm5PpjEcJRPyzX2fwt4C3npnS4EZ14sfAlACLtUVOI0rnsmsOfg2h4jryh04WJIiCXplnrk7MiNrWEJSs6rJaUe6Htft4VO4=
Received: from CY5P221CA0096.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::31) by
 SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.18; Wed, 14 Feb 2024 05:22:32 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:9:cafe::8c) by CY5P221CA0096.outlook.office365.com
 (2603:10b6:930:9::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 05:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 05:22:31 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 23:22:28 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>, <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 2/2] drm/tests/drm_buddy: add alloc_contiguous test
Date: Wed, 14 Feb 2024 10:52:08 +0530
Message-ID: <20240214052208.3035-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240214052208.3035-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240214052208.3035-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: eb009395-3353-4355-a96c-08dc2d1cf1e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UUs4qmGvJwb+ruhfp8RxwV0pPi0Jjr48OkYPtCd4PODH9iSgCbj2qCUFygh2C4jgyhIA9+5vSIM2UfQZVoxoGoiB/N7MLU2WDWLXv8ioaZMkJd8ZqJ8k3Fu9ow4kO3wNTnUpb39Gax6ikLYCQz6n40VGGqiXeARu3x9E2PCePpqaHRE7adD2IOiErqsV6LIyPCWnOiPUMtnSiapHmUX/LfB/rkVEHkSX6IvR80+qqH2xjfyN/9afdED40e/zXSTVl4EcxGO1cLKTd8xnDk8hg/wLgP+uVpXlFWl5zBQBTGnE4e2AZE+70PCbs+euNLsWR9C7asL63JtcXw56wf8IiaploMr/vfdrIgFTv4zW9RMO4llLkNbJyOO4gA5Fpxw1iXpve05xywvmUQeTlLxz+cg7DvKCwB/BkGFFeFHh0/tNTyN9FfyFl/NbghNDt0fN0KiPGmmGRf0fw1H6nLyIkUB0pR+KAZ+zlFyniuxG/NsfpItYE74ud8WbcL0dbrPgnkbywEurKuryJBciecRoKJraASeG9mMQCBSiI8ztK9Xp96mR+Mf5xIL7lA04/hpxrTKSt+4oKxPTk+raYVGAg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(64100799003)(1800799012)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(356005)(83380400001)(86362001)(82740400003)(70206006)(70586007)(478600001)(81166007)(966005)(426003)(6666004)(110136005)(2616005)(54906003)(16526019)(1076003)(336012)(7696005)(26005)(36756003)(66574015)(316002)(5660300002)(8676002)(2906002)(4326008)(8936002)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 05:22:31.8325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb009395-3353-4355-a96c-08dc2d1cf1e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177
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

References: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
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
index ea2af6bd9abe..4215d8b5fcf0 100644
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
+							   2 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc hit an error size=%d\n", 2 * ps);
+
+	drm_buddy_free_list(&mm, &left);
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   3 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
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

