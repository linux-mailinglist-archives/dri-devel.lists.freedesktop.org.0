Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414D4A8549
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F9710F7EF;
	Thu,  3 Feb 2022 13:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580F110F7EF;
 Thu,  3 Feb 2022 13:33:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drES5KqrZuGv2X8E5Od9RGcuoxxa2Lr1WIllslaJ2/ji0EVJXsJ8Nu8v53XF0+rjImg3HGuwdseB7yZticyljPCGpbaRi4vGYP+AnxDUy7Afk2Oj5ZKGhvEXgBi7XQYnp+m4+xkO0qpw81tQD5TtGhAkJLgmRJwuanx9ew4BIJ6soPV+NJzU9PtONyOzPz0abbpVVqXo3mDhJ/0873Cxi5rB9/v7CTacvlWP9vpIC9Fm8yPc0aLzA1tJN1odb/sGElp8Acq/ydD/nUTyh/NNvA1PwuH7Qfuk/L9LcN1NMmvz2idlHsf9HvOPNUwgkhfEFITLFxfVO4qlZ62dFdvEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgujbPF/dWAgw3TPEYOUxkF6HSLg5ZZeFzG7vsSd7Z0=;
 b=KR5vogS2lesH7tCLQsWpA8NcgGfQFuCU3zUCxqwcS/eEFKY0EyOERBGhxAAn9ceFK67z98u/pcJzrtn+RRpGJACgBopRtOwa1c8g0BTIuHQiD90x+TQDBCgXdUcE40tJti+Mmi4btjOF4wt4v/jgIRVMBsP6SQaSY/YEoDMFgXN1X/zISVG96SD1DXdTt1J6tn5cF4Co+NqTuX7BqkQhdukjZhcZpf9DCMDB5vOCr/dSV6gAq1R+ScbcbFtKOAj+EHnBNDq7GiG0rJWnzo+TYZlaK28NKsSfdKzoRyxP2yLZoz/FE7v9Ds9JIbsFTMMPlNjgxV0KnwqgJXkmbQrB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgujbPF/dWAgw3TPEYOUxkF6HSLg5ZZeFzG7vsSd7Z0=;
 b=XJScnB587CAegD4OITA33NdfpxtyBKqVz9n51rk29UTrHzammDWNCtdO7+tn4zpUC+L/ydYzj9gwe4hOQr1Bgn7fK2i3jzdSKuoWiDFWKF6WSXKmQ8oMdXlFIgojgwHgYu0L7yWT8Bo16loe6AW/5qdSFT6onf1IOrlY78j97Bk=
Received: from BN9PR03CA0222.namprd03.prod.outlook.com (2603:10b6:408:f8::17)
 by BYAPR12MB2645.namprd12.prod.outlook.com (2603:10b6:a03:61::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Thu, 3 Feb
 2022 13:33:17 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::b4) by BN9PR03CA0222.outlook.office365.com
 (2603:10b6:408:f8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11 via Frontend
 Transport; Thu, 3 Feb 2022 13:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:33:16 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 07:33:13 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/selftests: add drm buddy pathological testcase
Date: Thu, 3 Feb 2022 19:02:34 +0530
Message-ID: <20220203133234.3350-7-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76976948-526d-4f69-986c-08d9e719bc03
X-MS-TrafficTypeDiagnostic: BYAPR12MB2645:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB26451DE5556DE4BA27CDA6EFE4289@BYAPR12MB2645.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zo4N21n9HpkTS0URbTowRieCESEtsM4P4Fmwn969Ul+ldQAXipHlwPAv0TG19WdeZ/t/zJsOkz/2rRB2nKQMYMlj9+eok1N5glmD+mwq5QAQWpa2MeaNbCQ9+kfF1c5jobzv8nG+Da6HX7yfB0z4RZmrx4NPAA3eNN1ejWw/J5wkBrHht5EcqtE6PchcqUfqMrOp3edQo/J3txYIVtEW6/JFe4daF5XowcryVOZucKVLWqPi9NpYIsz4LfEzNrNn1t1XoCZyC2ZDzVo21a2Z39ORcrUKjGUSghEIcKv/s0ssErFxPsX4KjK0I1z5BV6fXSi73DVaenORCWzrJ16ea3zXEEUl8prCnKj4v5EIQf4jF8VxnJT1mCJ0m8FGwx/48bpQ1J5CP2sexZKCv/YoczhfeLavL0PHcLACTEmqKUGbCOyat3Pq5UTzDqNZ79+olIMU3vkx2/NpQdY7aUuw0yyfRKSPqQ31ZSteQZDkWS5guniO7xJsMhZ9u0RVYszYASGOVWPPOLq8d+uhe42Iq+QNpZEdc6ICJAHhZamlBkk6jx9Sa2anaN5oRfKn8ngCyUeWsDZgnUETXeFjStM/mybqO2Ufrb9tOskqHeClUwfWvalC5hJh/dXNNp1StMA4ajd3AmN/FxPvLRosYgD1C/dAyfmnHUEefJS+A7JdwcG8h03+NvUKZ2Xz8NZtq29ucSOTG/tpO3Iw1pY6su62HQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(70586007)(86362001)(40460700003)(54906003)(4326008)(508600001)(110136005)(8936002)(8676002)(5660300002)(356005)(81166007)(316002)(36756003)(7696005)(82310400004)(16526019)(2616005)(26005)(6666004)(426003)(47076005)(2906002)(36860700001)(1076003)(83380400001)(336012)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:33:16.3561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76976948-526d-4f69-986c-08d9e719bc03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2645
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
page left. Free the largest block, then whittle down again.
Eventually we will have a fully 50% fragmented mm.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 136 ++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
index 411d072cbfc5..455b756c4ae5 100644
--- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -12,3 +12,4 @@ selftest(buddy_alloc_range, igt_buddy_alloc_range)
 selftest(buddy_alloc_optimistic, igt_buddy_alloc_optimistic)
 selftest(buddy_alloc_pessimistic, igt_buddy_alloc_pessimistic)
 selftest(buddy_alloc_smoke, igt_buddy_alloc_smoke)
+selftest(buddy_alloc_pathological, igt_buddy_alloc_pathological)
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index 2074e8c050a4..b2d0313a4bc5 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -338,6 +338,142 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
 	*size = (u64)s << 12;
 }
 
+static int igt_buddy_alloc_pathological(void *arg)
+{
+	u64 mm_size, size, min_page_size, start = 0;
+	struct drm_buddy_block *block;
+	const int max_order = 3;
+	unsigned long flags = 0;
+	int order, top, err;
+	struct drm_buddy mm;
+	LIST_HEAD(blocks);
+	LIST_HEAD(holes);
+	LIST_HEAD(tmp);
+
+	/*
+	 * Create a pot-sized mm, then allocate one of each possible
+	 * order within. This should leave the mm with exactly one
+	 * page left. Free the largest block, then whittle down again.
+	 * Eventually we will have a fully 50% fragmented mm.
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
+	for (top = max_order; top; top--) {
+		/* Make room by freeing the largest allocated block */
+		block = list_first_entry_or_null(&blocks, typeof(*block), link);
+		if (block) {
+			list_del(&block->link);
+			drm_buddy_free_block(&mm, block);
+		}
+
+		for (order = top; order--; ) {
+			size = min_page_size = get_size(order, PAGE_SIZE);
+			err = drm_buddy_alloc_blocks(&mm, start, mm_size, size,
+						     min_page_size, &tmp, flags);
+			if (err) {
+				pr_info("buddy_alloc hit -ENOMEM with order=%d, top=%d\n",
+					order, top);
+				goto err;
+			}
+
+			block = list_first_entry_or_null(&tmp,
+							 struct drm_buddy_block,
+							 link);
+			if (!block) {
+				pr_err("alloc_blocks has no blocks\n");
+				err = -EINVAL;
+				goto err;
+			}
+
+			list_del(&block->link);
+			list_add_tail(&block->link, &blocks);
+		}
+
+		/* There should be one final page for this sub-allocation */
+		size = min_page_size = get_size(0, PAGE_SIZE);
+		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+		if (err) {
+			pr_info("buddy_alloc hit -ENOME for hole\n");
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
+		list_add_tail(&block->link, &holes);
+
+		size = min_page_size = get_size(top, PAGE_SIZE);
+		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+		if (!err) {
+			pr_info("buddy_alloc unexpectedly succeeded at top-order %d/%d, it should be full!",
+				top, max_order);
+			block = list_first_entry_or_null(&tmp,
+							 struct drm_buddy_block,
+							 link);
+			if (!block) {
+				pr_err("alloc_blocks has no blocks\n");
+				err = -EINVAL;
+				goto err;
+			}
+
+			list_del(&block->link);
+			list_add_tail(&block->link, &blocks);
+			err = -EINVAL;
+			goto err;
+		}
+	}
+
+	drm_buddy_free_list(&mm, &holes);
+
+	/* Nothing larger than blocks of chunk_size now available */
+	for (order = 1; order <= max_order; order++) {
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
+			list_del(&block->link);
+			list_add_tail(&block->link, &blocks);
+			err = -EINVAL;
+			goto err;
+		}
+	}
+
+	if (err) {
+		pr_info("%s - succeeded\n", __func__);
+		err = 0;
+	}
+
+err:
+	list_splice_tail(&holes, &blocks);
+	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_fini(&mm);
+	return err;
+}
+
 static int igt_buddy_alloc_smoke(void *arg)
 {
 	u64 mm_size, min_page_size, chunk_size, start = 0;
-- 
2.25.1

