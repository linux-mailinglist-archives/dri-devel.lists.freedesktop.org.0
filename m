Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF17D4A853C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E78110F7E6;
	Thu,  3 Feb 2022 13:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F3910F7E6;
 Thu,  3 Feb 2022 13:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPr3K0GY3XkoKSIqeTR0BuNX6D529Lip7ElXAUovrnWgh2tqsoCSMVzbWeLLuNj1qN000kjnHzyjw8v3PqHsnW10MlZcEMrWXk2MVrw39mQfS+IcrGZWGzVKE9BSjuZfLFVWeDg83xRJoJsSlrxV9gRooNrhuaXtWJBiEXf+SJDyXFEvdC6NBAXTGzP6sSRSfB6spBgpXQ4TUSk35LQsOb5fSdFWWd7syw39RGlnMj7kDKGIR6OBIuIG85BZMWFeCl00QdoJNhpN3jU88FYknrvO4z23S1ovJIHhOFKALmQlGBvPf6G/3yt9NBDcGkAph9WB5O6xgZPBWzxYOEKqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvmMh86UJluZVk7AYwGhD5Yex+BhIiv01HjRKon0L6s=;
 b=OSR/Q3Ye6C5iovz5f4TywbqA5+feX0v5zcPBahCztoD6boi2r0sGZdYYxN4gdCT8s1u8gIO9vltffvED8i5d3IGEC6f1zojWwoOgWh3Dw4PxfQ7/pw/sMxfFc+axPu7posrV//084RqneOuBGszOcAR/ggocz6Yc+a0Josf4mjJfOyIUKbio66qeSn7OdBFHTbRgoXucpR9NFYPROZTkDvoFB5H+nJqIQgwcm99sysoRYjC8UGORi8nm+7oI7o8ODLUA8YCQmyq1izR+ufwIbhcdQqTQUVPs+pPyTbO9p6zyNeYp4IxpAwNox5Zpsjp7rQjTSNq36sNOBdEaqCgblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvmMh86UJluZVk7AYwGhD5Yex+BhIiv01HjRKon0L6s=;
 b=z+TFKO5h+V56Hmm+SAlR8PjYQDU3Koxh0PNAbz1niTeRLAureyh7NvbaSnbbLSNk3rYG9SP/AI76vSsmBGlLN84YDZkD44H1URn02/qIid1rUijWSx84+u99SNxsi7OZ68Jr4HWjDk7ZR8UEX7WrIBjD+EWGk0/iWYPl0ElO/rI=
Received: from BN1PR13CA0013.namprd13.prod.outlook.com (2603:10b6:408:e2::18)
 by CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:33:10 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::b0) by BN1PR13CA0013.outlook.office365.com
 (2603:10b6:408:e2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 13:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:33:09 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 07:33:06 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/selftests: add drm buddy pessimistic testcase
Date: Thu, 3 Feb 2022 19:02:32 +0530
Message-ID: <20220203133234.3350-5-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5da697d5-de0b-4887-56e6-08d9e719b82e
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5122BE34CC0C441D45E00586E4289@CH0PR12MB5122.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qO4PxbfindhCpEm5zVT+VMnq7JX4ErdwtPdT4URIFv9Wr6sNnEVYAZ3xA2dC36wiICQ8Xfp7piyBnrZkY+v+8J+/WNDwXqcCR1u773rd7I0UbT4iIpO+9JmbudY/bpn6R4RGhTaVeN1VEEfbJJ8pj6v992N3W4v5fYSDHiNL5iezx4y3H8WzLyp9LsZQk/iZd0TmOhXDoteo21cZRrUHbGQdkLsJN4SrTxlUkz75LTS9LpUavwvWnN/uzsl3CXcRZIRG7OU14VGSRgGaMmSUdETrcKb7L5gU6Hvxmyzx4HByWF3QCcGLQjQLTPZd7Yx+Xk9IfMTGHSXcHpZhVSdM3LhEBX1bbN5RtrAketp2tTJz3CQWbkiqYb2pc+g85gzgAyR5PYm/8NgP3E7ds287VBzHNcIkRFS8L8Ib/IDFywQ44m4+KvR4xgBWDVpzaR6ZEKtnFNc6CrLMU2do6X2Pb4ZcbqJxszYkPptFTiAmhFSc2fEX32F5XxKO3Vqr5CzT1z1lIw1tpJPplfLYvPv12dwWzGrxhrbjhevh55fQ+tW9tn8qf4Rwu6t0akQQCCGwRs0yN/Rgvxxe3T4VtSnypf0gj6heoom8L/53nwrgb12C33HcljayJ9r9l2azvGn2mdSyvSUHI/NbXFFBKsDh4ldMR7NNhwf3GMsEmMet7Zt6ztYEDeCUKJirJsJU9bBrv3sXZb0qyP5+AbFb0dsluw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(356005)(8936002)(7696005)(6666004)(8676002)(4326008)(82310400004)(70206006)(70586007)(186003)(336012)(426003)(2616005)(16526019)(26005)(1076003)(81166007)(36860700001)(508600001)(86362001)(2906002)(5660300002)(83380400001)(36756003)(40460700003)(54906003)(110136005)(316002)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:33:09.9097 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da697d5-de0b-4887-56e6-08d9e719b82e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5122
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

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 153 ++++++++++++++++++
 2 files changed, 154 insertions(+)

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
index b193d9556fb4..e97f583ed0cd 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -314,6 +314,159 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
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
+		list_del(&block->link);
+		list_add_tail(&block->link, &blocks);
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
+	list_del(&block->link);
+	list_add_tail(&block->link, &blocks);
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
+			list_del(&block->link);
+			list_add_tail(&block->link, &blocks);
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
+	if (!err)
+		pr_info("%s - succeeded\n", __func__);
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

