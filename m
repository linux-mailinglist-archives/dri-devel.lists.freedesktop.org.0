Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743B4C0061
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5E410EAD3;
	Tue, 22 Feb 2022 17:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5EB10EA39;
 Tue, 22 Feb 2022 17:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo0mbsGvvFhcIH7qKe3mgJxyt0YV6Tiq7TxUNanpXTd5GlwsxzKSTPddDK0OZNlSy7Qb7V4IzvnRFFF9PQ12huL2UBUTwttrvY/KJaVo8+VngCVOF/iQcFiH9Ueamgv7lyHSRJvzGTxk78d1SIsmRIokOg8E8RhjiwLQaSchKcMjrKrQ1iyVEL8Rg6FemFpb57CjH6veeAbfg/jabUIIgD+UjZIegsfHpC9yUbs6vRzJitISJQGyITYxjd3ekNBffoiQA5VmI6JCmtSIwn6a3IYZaPHSg/foWh2gN1sN2G1LY0RUkJVy8ZgNz8SDqZmB6wkuaD5WPJM57OkwgySWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/dCFDbgs4rlZXGQYmMR0bgm4dSWbaQbHR3cPnn9z4I=;
 b=JBVEYEaF7qO0b78DPeRBoGELXDG9RSo2RtqP0bVA4j/Hss/YV/r7D35Xq1lS68A2mvXRWbWeWaDm6TJ9gxc/yPrpP+Sjssjg/uGipC0HTuIN3n1ERA4cPogB4taZiA96O96GgzI9pMAQobWtcpvZnNfHuuS/ZC3z5B7U+j/DZ00K2IJfg1yRflXhkjgDXrfvXUjZsO2CtnB3Rm/FAFlWgLLjFU6flp1sgeYOjZxhS0ycPVzuvd0hJAE9723qPmXhzo5A5XLcoJJN67XhAIbfnFddJLtOs7k2DbVHU55H0ny0hoGT6An/qyemx1QQ67oIUCA1Xhp6cOXvmzT4zWLgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/dCFDbgs4rlZXGQYmMR0bgm4dSWbaQbHR3cPnn9z4I=;
 b=r3rWctl5Pxg3H01BvybILlLGE7Zq0HjUYncPGDX8VnF1yist7+s6GSQ31J9ajI8dpkF+jrZcRb6eMa4pgj84i9aIcagPzUDIMk/J1zLsaR2kPQ5LDoEqt3E3aq4NhkOmZvmcoP+AYeR5/fmaWkZgYQLbylJObdpmSckwy/MGqj4=
Received: from DS7PR06CA0036.namprd06.prod.outlook.com (2603:10b6:8:54::14) by
 DM6PR12MB3097.namprd12.prod.outlook.com (2603:10b6:5:11d::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.22; Tue, 22 Feb 2022 17:49:20 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::b5) by DS7PR06CA0036.outlook.office365.com
 (2603:10b6:8:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Tue, 22 Feb 2022 17:49:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 17:49:20 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 11:49:17 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 4/7] drm/selftests: add drm buddy optimistic testcase
Date: Tue, 22 Feb 2022 23:18:42 +0530
Message-ID: <20220222174845.2175-4-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 50010644-3238-46d9-d704-08d9f62ba7ca
X-MS-TrafficTypeDiagnostic: DM6PR12MB3097:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB30970BE97E4B2DE4BEC33004E43B9@DM6PR12MB3097.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bnADqHybt8ifWEA5BMVVp+gICbXPlM9w506gG6TcnycCdB6tXtrJUkxFxRx6JbTBd6/OIAEGG9Ci9nf9KFOzctFzCzNS/77qMRWZQTscXhJfPZqi8NjHXH29Rf44lcFG4iVlEHqZzWxwnD6pQMtc/Bf6It0A0NZXb+5YLL44rTCXXs35hHt1wjStyrX4kcbzZQmBQP53MrIp/NMgCl6FgDRf4KpHktnCm1dxPoCRnDMBCYNrC2YmwOi31wYBER4pUQud5aZ2uSiv6rtc226vEpoLb7bdms0p49npXdpxsGvaymjPjRh9s9ePTjSFD5+HOVKuDi32GiT6zIq93yoqVZqHLMY13jAZvi+c4cq18dYRtMkIBguGg5D8hj5gmICTaDGHtYUbaUKWduBzUK4gcSxQCs5JLFqcgHdUKn3Fjbe4RC0PNrjj8u3h85dtBls9idMK+8my0lARhkZs/QLgzmtaS5dC1x14hnnGSiUqgYzm7q/M9T/pje6Rsr6NAaSd+Zh58KbxMs1M99uc0AeGF5hu2m/w6ZQ5UxHhMI88nx/Jq0UwL9k6WBr0Nn7foPGq5m5sS+AdL2NxjzX6jLqVSuvQH/g+QTAi5nXeGrnK8G/71Eua9KStqK8RfJIFT+AWcSDYxpqGyYyWTP0AgXGfgHDUVvDFBq4i23IqWKKRqlcj4v5oRJVNtp0Xl0vCjsgmA9V4vnDLTkb60jMfkbUBug==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(2906002)(2616005)(40460700003)(66574015)(1076003)(336012)(186003)(426003)(16526019)(26005)(5660300002)(81166007)(356005)(36756003)(8936002)(47076005)(36860700001)(86362001)(316002)(8676002)(82310400004)(508600001)(6666004)(54906003)(110136005)(7696005)(70206006)(70586007)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 17:49:20.7657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50010644-3238-46d9-d704-08d9f62ba7ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3097
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

create a mm with one block of each order available, and
try to allocate them all.

v2(Matthew Auld):
  - removed unnecessary test succeeded print
  - replace list_del()/list_add_tail() with list_move_tail()

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |  1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
index 3230bfd2770b..21a6bd38864f 100644
--- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -9,3 +9,4 @@
 selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
 selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
 selftest(buddy_alloc_range, igt_buddy_alloc_range)
+selftest(buddy_alloc_optimistic, igt_buddy_alloc_optimistic)
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index 586e0673a67c..f20d3ad1ac65 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -17,6 +17,11 @@
 
 static unsigned int random_seed;
 
+static inline u64 get_size(int order, u64 chunk_size)
+{
+	return (1 << order) * chunk_size;
+}
+
 static inline const char *yesno(bool v)
 {
 	return v ? "yes" : "no";
@@ -309,6 +314,81 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
 	*size = (u64)s << 12;
 }
 
+static int igt_buddy_alloc_optimistic(void *arg)
+{
+	u64 mm_size, size, min_page_size, start = 0;
+	struct drm_buddy_block *block;
+	unsigned long flags = 0;
+	const int max_order = 16;
+	struct drm_buddy mm;
+	LIST_HEAD(blocks);
+	LIST_HEAD(tmp);
+	int order, err;
+
+	/*
+	 * Create a mm with one block of each order available, and
+	 * try to allocate them all.
+	 */
+
+	mm_size = PAGE_SIZE * ((1 << (max_order + 1)) - 1);
+	err = drm_buddy_init(&mm,
+			     mm_size,
+			     PAGE_SIZE);
+	if (err) {
+		pr_err("buddy_init failed(%d)\n", err);
+		return err;
+	}
+
+	BUG_ON(mm.max_order != max_order);
+
+	for (order = 0; order <= max_order; order++) {
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
+	/* Should be completely full! */
+	size = min_page_size = get_size(0, PAGE_SIZE);
+	err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
+	if (!err) {
+		pr_info("buddy_alloc unexpectedly succeeded, it should be full!");
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
+		err = -EINVAL;
+		goto err;
+	} else {
+		err = 0;
+	}
+
+err:
+	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_fini(&mm);
+	return err;
+}
+
 static int igt_buddy_alloc_range(void *arg)
 {
 	unsigned long flags = DRM_BUDDY_RANGE_ALLOCATION;
-- 
2.25.1

