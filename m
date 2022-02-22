Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2134C006B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3544E10EC12;
	Tue, 22 Feb 2022 17:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9642510EA8D;
 Tue, 22 Feb 2022 17:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZCRxkFMQfx6tg/PstydCDrKwAwTMBemyHhycfIeUVwBAtEpF0DsIcDePIuPXo6QCKLRWqHZA86r/AMAH+cT231VQU9QIUHmJ9lv5OnCK78E9ydhaNjZOdJdu0wXOUTYRHbGs2LfUZd0sAnPtv4sgRPmNlU1o5BYLBXdoe1MWvvva+xrrVfwa2cy3PkojhhNGEeVjDgS9SsFfKfNybU23AdByqN0RO40Mwuqbk4MdY+vVqhwOxAQIukpVMPaKL0Eu3p2c9x70styouc0rFLbtiroxhNyaTDdNhcpl7H/hbMa+qWW5/Mw+OSOfF2eS4VyZkkMJGk4JdHtxrG/wYSVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZvQimyzZX8Aj+dJE7JXLLMae6MJzWV4EWFtPERj1J0=;
 b=Ax5Nx9kl/JIhg/aZnrGeg2xbIhn8u1UEwZ4YBDhiQzKXyyEjibXdilGd87FBIZrpKwshfKIMYXKLyWTQ4aKLg8xn600Pt/fvK7suaiUF8lFCrEXQTDnXhTt1AAbC1A16TKrN+/+at+iCqC+oWGbGctziY18BNMnqNul6jC7VrbJRaYTjKPwMJ2KTaLU2BI9xCEOAsMXgVtfZ6EwiBP/xCzW2qebtVMdmZ7o6p3R7nZBqD8jGIM29MUUnCSfqhVMdGTS9fq6g03Z84k6CnktRtJtfv+RXGs18b60yubCkNbyyRBHbl8fjCw3ty+96HUnWwIp20GV7wg9srluWbSn+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZvQimyzZX8Aj+dJE7JXLLMae6MJzWV4EWFtPERj1J0=;
 b=HSdMrPmMqjBmheF4ZeebSTGbMuklnq3we+FMioO43c2aBxIYqrh0y9i6V1fUQfoFxm0WVJX3qHEf7oSt2cvbWt80IGatO6jSXX8LpCnwXT7VVdQOJAmUqLx3NzfqmTiqnSGMMeCtl3b8LuEcGSLlR7sFEHKk0On7EOXSCz8Q9DM=
Received: from DM5PR13CA0026.namprd13.prod.outlook.com (2603:10b6:3:7b::12) by
 MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.22; Tue, 22 Feb 2022 17:49:30 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::85) by DM5PR13CA0026.outlook.office365.com
 (2603:10b6:3:7b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.9 via Frontend
 Transport; Tue, 22 Feb 2022 17:49:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 17:49:30 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 11:49:26 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 7/7] drm/selftests: add drm buddy pathological testcase
Date: Tue, 22 Feb 2022 23:18:45 +0530
Message-ID: <20220222174845.2175-7-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5b6b3f2e-755d-43d2-a792-08d9f62bad69
X-MS-TrafficTypeDiagnostic: MW3PR12MB4476:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4476B1C95863A6A948870010E43B9@MW3PR12MB4476.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 63kjsb+EipI7wUPc5MLfespFBPmlCrTuFKrLF/YsoOs0lvKOi4XeKxTFEAzx0hh7jV3hRj3qMp8IgmlLa2PFqKuk3kUaxQNVmwS5dpqWZiAp/fTfZB3Fm5O94YLROZQARSKSyC75Rq+XpZyEzy+5OabgnAbLazgHKRgg+lRsBCoUcgtC1CgWMdieQe8Z3TEXB3lfLWCgCIiljDDcD/wnIyH90aPbmIWHIle136xjtiXYuHyj9iiXm2KjDKhJcVFZ7eP2sxNBajr863oAFY3M+lKba3KljDBj6ef75Zj2gVNMVSKrgnn+auIIqWifh3Rqk9bNeyxiPRVEMpWqyd7XlsNYNReAQOrOe04VrBBUrbRpyt/ZEUV8BWhcKK7RtZYCGvXtTUBb/LU++mEHrwa+dCqr2XZwvqfaWmADk0FhqQRklmLayGxf5q6HnD9qogSe7RJphFjq/qmNtPsu7mhmZPRv2fiK7TsrL7LSOSmEAW9V6ep3eT+0LrSFv8vFgD6sS8C3BN/MmWQ1JbgJBq60yQcCSpBU7+HM1sRiMvNxXrXTd8no9OfPBVtrT8nb0rw3U08W0ICdKi5Df7DCpjZmrTfGDi8sERSAzVDi8JPv295N8DAdbMbLbNsKCnwwSMgfNGoun+JxqwjHd2D2te82kTkjXQo9m39/eOVjbA7GTOrMy6YY7uB8lpiCnUIm1GsCyrCetwH5uOwWdcDFmeobww==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(110136005)(54906003)(66574015)(26005)(8936002)(1076003)(186003)(5660300002)(16526019)(83380400001)(70586007)(70206006)(4326008)(8676002)(356005)(316002)(82310400004)(426003)(81166007)(336012)(86362001)(7696005)(2616005)(40460700003)(36756003)(6666004)(2906002)(47076005)(36860700001)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 17:49:30.1951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6b3f2e-755d-43d2-a792-08d9f62bad69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
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

v2(Matthew Auld):
  - removed unnecessary test succeeded print
  - replace list_del()/list_add_tail() with list_move_tail()

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 130 ++++++++++++++++++
 2 files changed, 131 insertions(+)

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
index e1cc2353a476..fa997f89522b 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -338,6 +338,136 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
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
+			list_move_tail(&block->link, &blocks);
+		}
+
+		/* There should be one final page for this sub-allocation */
+		size = min_page_size = get_size(0, PAGE_SIZE);
+		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+		if (err) {
+			pr_info("buddy_alloc hit -ENOMEM for hole\n");
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
+		list_move_tail(&block->link, &holes);
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
+			list_move_tail(&block->link, &blocks);
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
+			list_move_tail(&block->link, &blocks);
+			err = -EINVAL;
+			goto err;
+		}
+	}
+
+	if (err)
+		err = 0;
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

