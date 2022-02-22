Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670FB4C006C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75310EB0C;
	Tue, 22 Feb 2022 17:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802B910EB0C;
 Tue, 22 Feb 2022 17:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvU4p5gPQWpwddnyCImjIqAXomyUKmHuYLvukF4VLXQ9EfRe/qtkorIIr0oz1/VxuOdzgA4BqgSwOzOcndZVaOcIkUSg7a+Tzz9ecwI22+IDyh5fPsFdei6WLCC036HdedBmDmUbsHi7dmdUP736iCX0mqe0lcobCkqPYNAsjY8PhXyRvaETUPupxSFXkvJZgKDTaZDPd3hdL2zvBA3jON92LF24oswNNRZrHN2Igyg+hwKPO9sgBbmrpXLhYPiacV/wSr42IMS8o+BI+Lj59t/oPXKO0UzeB2pI89/2MU8HaAzkJz4Lr985FmOpa9FdFNPRs8os+2KHmYVMBmC3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSzXPckqby4dMdApPpuaUCYgP7e4IXjA23AIwJ+m9Rg=;
 b=i3K7u1AZKZE+QykYUspDe6gKIr+GJcv1s/2Okgr/+mDodceDqZFliGD2wXmG7Mail+JTD8w4zaWDmnIxoI5t3xugjTd+rV5ydUUYzvuRA6wXKY2FrZcGtCeVPr4z2iLJY9ccLv0GbsAmAD4vQ+F4Gb4/PpWBtJq05sJg/7OcXAF2zldztOrO7uqJQQUimLwnfRYS9dufkCg8xHFk8vAUCZsXeSmb2ixhqoEkTycJcaY5BokeSZfwCxj06jXJl/4iNu2UrRjABhYsgUk98BVQDDKrIBI6ew9xYKD+kiW+Y3orYY9OqdwmZ8LEVL0N10NKFumF2O6NlgqLxXTivL0u6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSzXPckqby4dMdApPpuaUCYgP7e4IXjA23AIwJ+m9Rg=;
 b=GEn3L1C9lEQ98wbfgbhwTBLKT6AmMDfqqLb3A6PM7Q9cpILdORaBEIOTIcAq0OIW//awe6nWuYtoAMRrITV/55K9o6q9Or3s3CeWLtZu0vfv/Iut7iypSTrnFCDMgdmwqCxPlhOL6c04hFN78OIhd0M/v31urBcbskjEZuR+At8=
Received: from DM5PR07CA0156.namprd07.prod.outlook.com (2603:10b6:3:ee::22) by
 BN6PR12MB1411.namprd12.prod.outlook.com (2603:10b6:404:1f::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.17; Tue, 22 Feb 2022 17:49:24 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::ef) by DM5PR07CA0156.outlook.office365.com
 (2603:10b6:3:ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Tue, 22 Feb 2022 17:49:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 17:49:24 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 11:49:20 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 5/7] drm/selftests: add drm buddy pessimistic testcase
Date: Tue, 22 Feb 2022 23:18:43 +0530
Message-ID: <20220222174845.2175-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222174845.2175-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220222174845.2175-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9d4bef9-a051-4aa7-a601-08d9f62ba9cd
X-MS-TrafficTypeDiagnostic: BN6PR12MB1411:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB14118530AA56C8CE9CC107E5E43B9@BN6PR12MB1411.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fmP+dnV6rg0l0iOFIziqFS0aVJoOwE+3utiuYc7x3ELBJFtaVwURmfMdY100/bBXIZ3W2MgVmVC2ynRh2s60g1kLTaWPrJ6a8WIWgEtQ5Y62oJunr+P1/WTHYRU9J1/lKitgGD9SQD6Ii0k9fcknWk5M8bmbSaCZkHxXrfvWm3aa316pHiL00L8j51xYZ7Pi3n+URRv8rTnOI8WZ67fYMhBxSTdii/NJW0uYRlmDhq5j+sS49MV36EVlZ5TBfiF3VP7+4j7nGtsY4Q1QP7GUOvDyzrVCh07EG/rbKKTke1mwrCqUWcPvnHm9J7NplvhpsSJ+/6FDuUnVS3+775Yy7kfeKyL43X2aXedKrXezy10Irs3sYgdieOWmiZa0cO3TBG4jKqVwd3RbxANKx7Wl4wpN0BmcGd+CdhfqyrL6MxtEhWW4lyOUORrdvBiiTbZOep6bfNSONFau25lsWVACtWdz8RdVqxrxq9/lGbjBYpxHixthW3QlNg63y8gCD1orzKQt294jmNMYWEw0gTncqF4YaNzrxMm9PUAF1UqRc63PNFlE13BTxcYpkyJSS/j1esx6IFxwryLZcPZGYVUHth9gsgHvyySYp8qMZpqFWVpHeFHP0739V+25eQkGVdX4Plg5lwCUe45oPHhuQpFyLt5egqAhMjeFxXPp7NgDkSO+N725QLybiORXIN3qVzWb7zD1MmWdTlGmahJ0FG7BSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(1076003)(8936002)(7696005)(5660300002)(54906003)(82310400004)(86362001)(110136005)(508600001)(316002)(6666004)(8676002)(4326008)(36756003)(40460700003)(47076005)(36860700001)(70206006)(336012)(66574015)(81166007)(2906002)(70586007)(83380400001)(186003)(356005)(16526019)(426003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 17:49:24.1239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d4bef9-a051-4aa7-a601-08d9f62ba9cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1411
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

create a pot-sized mm, then allocate one of each possible
order within. This should leave the mm with exactly one
page left.

v2:
  - removed unnecessary test succeeded print
  - replace list_del()/list_add_tail() with list_move_tail()

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 147 ++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
index 21a6bd38864f..b14f04a1de19 100644
--- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -10,3 +10,4 @@ selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
 selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
 selftest(buddy_alloc_range, igt_buddy_alloc_range)
 selftest(buddy_alloc_optimistic, igt_buddy_alloc_optimistic)
+selftest(buddy_alloc_pessimistic, igt_buddy_alloc_pessimistic)
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index f20d3ad1ac65..2496113c4868 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -314,6 +314,153 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
 	*size = (u64)s << 12;
 }
 
+static int igt_buddy_alloc_pessimistic(void *arg)
+{
+	u64 mm_size, size, min_page_size, start = 0;
+	struct drm_buddy_block *block, *bn;
+	const unsigned int max_order = 16;
+	unsigned long flags = 0;
+	struct drm_buddy mm;
+	unsigned int order;
+	LIST_HEAD(blocks);
+	LIST_HEAD(tmp);
+	int err;
+
+	/*
+	 * Create a pot-sized mm, then allocate one of each possible
+	 * order within. This should leave the mm with exactly one
+	 * page left.
+	 */
+
+	mm_size = PAGE_SIZE << max_order;
+	err = drm_buddy_init(&mm, mm_size, PAGE_SIZE);
+	if (err) {
+		pr_err("buddy_init failed(%d)\n", err);
+		return err;
+	}
+	BUG_ON(mm.max_order != max_order);
+
+	for (order = 0; order < max_order; order++) {
+		size = min_page_size = get_size(order, PAGE_SIZE);
+		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+		if (err) {
+			pr_info("buddy_alloc hit -ENOMEM with order=%d\n",
+				order);
+			goto err;
+		}
+
+		block = list_first_entry_or_null(&tmp,
+						 struct drm_buddy_block,
+						 link);
+		if (!block) {
+			pr_err("alloc_blocks has no blocks\n");
+			err = -EINVAL;
+			goto err;
+		}
+
+		list_move_tail(&block->link, &blocks);
+	}
+
+	/* And now the last remaining block available */
+	size = min_page_size = get_size(0, PAGE_SIZE);
+	err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+	if (err) {
+		pr_info("buddy_alloc hit -ENOMEM on final alloc\n");
+		goto err;
+	}
+
+	block = list_first_entry_or_null(&tmp,
+					 struct drm_buddy_block,
+					 link);
+	if (!block) {
+		pr_err("alloc_blocks has no blocks\n");
+		err = -EINVAL;
+		goto err;
+	}
+
+	list_move_tail(&block->link, &blocks);
+
+	/* Should be completely full! */
+	for (order = max_order; order--; ) {
+		size = min_page_size = get_size(order, PAGE_SIZE);
+		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+		if (!err) {
+			pr_info("buddy_alloc unexpectedly succeeded at order %d, it should be full!",
+				order);
+			block = list_first_entry_or_null(&tmp,
+							 struct drm_buddy_block,
+							 link);
+			if (!block) {
+				pr_err("alloc_blocks has no blocks\n");
+				err = -EINVAL;
+				goto err;
+			}
+
+			list_move_tail(&block->link, &blocks);
+			err = -EINVAL;
+			goto err;
+		}
+	}
+
+	block = list_last_entry(&blocks, typeof(*block), link);
+	list_del(&block->link);
+	drm_buddy_free_block(&mm, block);
+
+	/* As we free in increasing size, we make available larger blocks */
+	order = 1;
+	list_for_each_entry_safe(block, bn, &blocks, link) {
+		list_del(&block->link);
+		drm_buddy_free_block(&mm, block);
+
+		size = min_page_size = get_size(order, PAGE_SIZE);
+		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+		if (err) {
+			pr_info("buddy_alloc (realloc) hit -ENOMEM with order=%d\n",
+				order);
+			goto err;
+		}
+
+		block = list_first_entry_or_null(&tmp,
+						 struct drm_buddy_block,
+						 link);
+		if (!block) {
+			pr_err("alloc_blocks has no blocks\n");
+			err = -EINVAL;
+			goto err;
+		}
+
+		list_del(&block->link);
+		drm_buddy_free_block(&mm, block);
+		order++;
+	}
+
+	/* To confirm, now the whole mm should be available */
+	size = min_page_size = get_size(max_order, PAGE_SIZE);
+	err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+	if (err) {
+		pr_info("buddy_alloc (realloc) hit -ENOMEM with order=%d\n",
+			max_order);
+		goto err;
+	}
+
+	block = list_first_entry_or_null(&tmp,
+					 struct drm_buddy_block,
+					 link);
+	if (!block) {
+		pr_err("alloc_blocks has no blocks\n");
+		err = -EINVAL;
+		goto err;
+	}
+
+	list_del(&block->link);
+	drm_buddy_free_block(&mm, block);
+
+err:
+	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_fini(&mm);
+	return err;
+}
+
 static int igt_buddy_alloc_optimistic(void *arg)
 {
 	u64 mm_size, size, min_page_size, start = 0;
-- 
2.25.1

