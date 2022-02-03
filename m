Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3444A8540
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005D310F7EC;
	Thu,  3 Feb 2022 13:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F20E10F7E8;
 Thu,  3 Feb 2022 13:33:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHHRCODYt88i03Fqyz/OU7cy0MqvfOipHqis7cW8mbfg96Ao+ACro8ld3P3MHjPI1C0zvWaHSlD4YT/4YwiiZ8DC805RJRaUwuLO1f9OZKLNVYIQUNI5ZF7z9L07bk/mP4qs91ngTMcseJoDXAGdFctOzpbopfoJSNHCwCAnYhiyGvlCHU0F61O2ocNektFU0qGHB+N691W5GiC+aY7dtB2QXjdeEwiJyfAteJAljaDbePZ0uuqTpgss8K8RyCGZk940gnz9VzVYxdFanem6ZPQLvtAU/rJHLG89WmzQO7YytGGgZ1Z+dCJgiJHYLUWaOnyWE4osZY+9t5tpl6IUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diHUITJP38VBN9xdJ03GS0k1N95OA8zUd3HAxYp3LrE=;
 b=FWcdYWldhwpNmT4RPZszbscEIbBadwqLGUa7Jmhjub98yBHBuH9ZK5d5q/Y7x5of2MLGER4tIrGK29LoE+YdIvXoSZClA0NPuM0KEXnw74TCGBe7kUZP5igQLROnZQqnJKkvEJPxE730T31oY0TSWxa6p3u0ITqs0g3NZJAegxptO8P000nEKoU5KklvMyJQn4LR4O4bGWswKCl0G3EOtLmv3dj+KcDwhFjJyDDj/Q97Mamzkf09BA+mGzwXLL7n9rQQgLadc1BqNsVD56FgPP9tuFyimHTqhNa6cxbq5Av8NTg7jvKYQZHJIiVsAOEgdZ+8Zn6AMySPZCF7H7SHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diHUITJP38VBN9xdJ03GS0k1N95OA8zUd3HAxYp3LrE=;
 b=iQy/d8DZrYkxTWWN321bIy0Lpnt4S+HV2/1S6etsBX0OAEcY5WCJZfH+Z9m3KqbOo4bzjXz1CIREjrQy+bgr/F1p+OUvDdjXHbnMxtWEvK26Erj7SiEXTJEc9oFN9XQABHAMiYY36mdtUaEvZsTKM2DZ0IEHUaWR0TbhaZs0rlc=
Received: from BN1PR13CA0004.namprd13.prod.outlook.com (2603:10b6:408:e2::9)
 by DM6PR12MB5024.namprd12.prod.outlook.com (2603:10b6:5:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:33:13 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::27) by BN1PR13CA0004.outlook.office365.com
 (2603:10b6:408:e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.5 via Frontend
 Transport; Thu, 3 Feb 2022 13:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:33:13 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 07:33:09 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/selftests: add drm buddy smoke testcase
Date: Thu, 3 Feb 2022 19:02:33 +0530
Message-ID: <20220203133234.3350-6-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 84711108-2058-4175-d85c-08d9e719ba1b
X-MS-TrafficTypeDiagnostic: DM6PR12MB5024:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5024F540BA22C4F27E23295FE4289@DM6PR12MB5024.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:294;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V/2zIlH+Mqb77eaLmxMHRBjH0iruF+flbCKwJkIb/K7/ctCN2RUf/dx2z3MIb+x8ANThMwgr1c3n1YETXIq+OLWR6O5cIY0bry2RnosjtsHtFy3xWA+1RwAW+mYMloqFtnRUGuspV2LkT4DwaJRPGsWLVrO5ujz1CXIbc3s1G//VxUMPzktstB6B1zZZi+hOmRmH9qhfFwgkbWRvdIHjsxfbHdbXKlUMBTOR2jNSVXl6b++4TZCqRR0sF6AXy1iS1Yh5khghUHJr6RXu3YiJde6ZLL8q3jP9/tXiQ+luFXaLnFHqD6X5lPeWFzBr9aYyqJPLlC3JVAX0oaB+sHzYSHFoFKCgaT6UKE2v55AtB8aLdUCNO1EwSpNmZdzML9+nGdfFTn3sage02yV328PX9I0svP/BvzyLpfh8NK067Us7CuT2tk8Vq2zpEUBX1yDhf04kJM4qbMncOcPKcDnUYoWrEbrQVsGNtq4ps2IRPoG5fxaU9Ye6uYqLct3Ln8/AjWu9L6FSq6ZWjvcDzJERT7jg7jdULJeIXNY70VHQkLJflkmaAtJ/9OyQft2ztZFNt9TM9rfKPK7Mgma8D/v0nRuovKzVZcRuhlI/fb0xJSyCM12HfMvfakWVYxwyYwTD23dhARFtevDVp5gC2X89YctzBi3m9AMnWCN0hloCxfHe1VMHF8+zGKJJkY0BEj8ql5Yhe+5f77ODLtHCoZqIyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(70586007)(508600001)(2616005)(2906002)(6666004)(8936002)(7696005)(81166007)(5660300002)(70206006)(82310400004)(356005)(8676002)(4326008)(426003)(110136005)(83380400001)(16526019)(336012)(186003)(86362001)(47076005)(316002)(1076003)(36756003)(40460700003)(54906003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:33:13.1440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84711108-2058-4175-d85c-08d9e719ba1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5024
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

- add a test to ascertain that the critical functionalities
  of the program is working fine
- add a timeout helper function

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 143 ++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
index b14f04a1de19..411d072cbfc5 100644
--- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -11,3 +11,4 @@ selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
 selftest(buddy_alloc_range, igt_buddy_alloc_range)
 selftest(buddy_alloc_optimistic, igt_buddy_alloc_optimistic)
 selftest(buddy_alloc_pessimistic, igt_buddy_alloc_pessimistic)
+selftest(buddy_alloc_smoke, igt_buddy_alloc_smoke)
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index e97f583ed0cd..2074e8c050a4 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -7,6 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/prime_numbers.h>
+#include <linux/sched/signal.h>
 
 #include <drm/drm_buddy.h>
 
@@ -15,6 +16,9 @@
 #define TESTS "drm_buddy_selftests.h"
 #include "drm_selftest.h"
 
+#define IGT_TIMEOUT(name__) \
+	unsigned long name__ = jiffies + MAX_SCHEDULE_TIMEOUT
+
 static unsigned int random_seed;
 
 static inline u64 get_size(int order, u64 chunk_size)
@@ -22,6 +26,26 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
+__printf(2, 3)
+static bool __igt_timeout(unsigned long timeout, const char *fmt, ...)
+{
+	va_list va;
+
+	if (!signal_pending(current)) {
+		cond_resched();
+		if (time_before(jiffies, timeout))
+			return false;
+	}
+
+	if (fmt) {
+		va_start(va, fmt);
+		vprintk(fmt, va);
+		va_end(va);
+	}
+
+	return true;
+}
+
 static inline const char *yesno(bool v)
 {
 	return v ? "yes" : "no";
@@ -314,6 +338,125 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
 	*size = (u64)s << 12;
 }
 
+static int igt_buddy_alloc_smoke(void *arg)
+{
+	u64 mm_size, min_page_size, chunk_size, start = 0;
+	unsigned long flags = 0;
+	struct drm_buddy mm;
+	int *order;
+	int err, i;
+
+	DRM_RND_STATE(prng, random_seed);
+	IGT_TIMEOUT(end_time);
+
+	igt_mm_config(&mm_size, &chunk_size);
+
+	err = drm_buddy_init(&mm, mm_size, chunk_size);
+	if (err) {
+		pr_err("buddy_init failed(%d)\n", err);
+		return err;
+	}
+
+	order = drm_random_order(mm.max_order + 1, &prng);
+	if (!order)
+		goto out_fini;
+
+	for (i = 0; i <= mm.max_order; ++i) {
+		struct drm_buddy_block *block;
+		int max_order = order[i];
+		bool timeout = false;
+		LIST_HEAD(blocks);
+		u64 total, size;
+		LIST_HEAD(tmp);
+		int order;
+
+		err = igt_check_mm(&mm);
+		if (err) {
+			pr_err("pre-mm check failed, abort\n");
+			break;
+		}
+
+		order = max_order;
+		total = 0;
+
+		do {
+retry:
+			size = min_page_size = get_size(order, chunk_size);
+			err = drm_buddy_alloc_blocks(&mm, start, mm_size, size,
+						     min_page_size, &tmp, flags);
+			if (err) {
+				if (err == -ENOMEM) {
+					pr_info("buddy_alloc hit -ENOMEM with order=%d\n",
+						order);
+				} else {
+					if (order--) {
+						err = 0;
+						goto retry;
+					}
+
+					pr_err("buddy_alloc with order=%d failed(%d)\n",
+					       order, err);
+				}
+
+				break;
+			}
+
+			block = list_first_entry_or_null(&tmp,
+							 struct drm_buddy_block,
+							 link);
+			if (!block) {
+				pr_err("alloc_blocks has no blocks\n");
+				err = -EINVAL;
+				break;
+			}
+
+			list_del(&block->link);
+			list_add_tail(&block->link, &blocks);
+
+			if (drm_buddy_block_order(block) != order) {
+				pr_err("buddy_alloc order mismatch\n");
+				err = -EINVAL;
+				break;
+			}
+
+			total += drm_buddy_block_size(&mm, block);
+
+			if (__igt_timeout(end_time, NULL)) {
+				timeout = true;
+				break;
+			}
+		} while (total < mm.size);
+
+		if (!err)
+			err = igt_check_blocks(&mm, &blocks, total, false);
+
+		drm_buddy_free_list(&mm, &blocks);
+
+		if (!err) {
+			err = igt_check_mm(&mm);
+			if (err)
+				pr_err("post-mm check failed\n");
+		}
+
+		if (err || timeout)
+			break;
+
+		cond_resched();
+	}
+
+	if (err == -ENOMEM)
+		err = 0;
+
+	if (!err)
+		pr_info("%s - succeeded\n", __func__);
+
+	kfree(order);
+out_fini:
+	drm_buddy_fini(&mm);
+
+	return err;
+}
+
 static int igt_buddy_alloc_pessimistic(void *arg)
 {
 	u64 mm_size, size, min_page_size, start = 0;
-- 
2.25.1

