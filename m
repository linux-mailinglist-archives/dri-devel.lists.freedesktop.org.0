Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5846D4C006A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5D310EBF7;
	Tue, 22 Feb 2022 17:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8437110EB5B;
 Tue, 22 Feb 2022 17:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyWinUI4eeY/Q0IPTf48DIsQal1Urj11R2fuVGKdiKO1trtc7xJV4glltJXnOywBQ+RncQnsdBmQ+3G9FbFOLag9y3E1gpHUPktXPUuWsKUmo2Jkjq/oLIEA3PVwfYrC0/lb0kcNDG3SL43nUVZpJ91rT3ER61cvQiiSMEF3mXOHcN9VVNVvtVuL5VkGeoWPjgaLQY2FpyTK1J2w+Tf3pxQWMS8XNEWAzIARkOZi8HdBg4r41a3XOwM3wSvs9YZb5hFUqyLHSGFWsorixDZPqyfUhMJmnQem2cp9qjBAnJimU6VIwHEibcxy/Kt0VCfoZjGCvrxSeskB06InFCY3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Mc+ZRIpT2vfwpXHdeIuThwSoynsSZDzVE5GUyXXHFQ=;
 b=db0fc/0kfdDh/whU+gBykDryTOogNOZiMyWVOLLnkkumWDQNY7d3A6FYcO6FEiJChv2h77xfAIuN6DMHeZMNnxZT0tdt3Y8wbb7xNkiQzhakPu3sl/FIAIrsI8uFHG7qLDRNdYQAzHO09dXCK0H0ca4t4X6+hmdm7InlP7upYYr7UaXzTwvE4Vqlw4zsPGFX6GeuuZryfG7YaU9dBzfykeSOfrPEzN5lSUPMy18OpUIeMet9zKWf45bFffQnzhzoJC0FRO2ifX5EOauml7wkn1ImKdlZwFgy4Ou13RXFHUBj6QQ6FQPude3N+CJJ1CNYwHK/iWGPx3VtlOcI2Nkjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Mc+ZRIpT2vfwpXHdeIuThwSoynsSZDzVE5GUyXXHFQ=;
 b=jpksWk0v5bRBMnlNi6fUNoBlJr1i0vX4XWqyzrdhrcFgnKN4TfJw/RLNR9OwpZci0NTlEkuWhy/Pg0qT4AYUf+WPttNn0CrUQ/oqjHaHtFg893Imcbfo8R1nv0vJkWooTCmjuF1LZtCCje74kD+0L7k+RpDGCXHqVLUHG2lCbWw=
Received: from DS7PR03CA0115.namprd03.prod.outlook.com (2603:10b6:5:3b7::30)
 by BN6PR12MB1522.namprd12.prod.outlook.com (2603:10b6:405:11::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.23; Tue, 22 Feb
 2022 17:49:27 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::32) by DS7PR03CA0115.outlook.office365.com
 (2603:10b6:5:3b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17 via Frontend
 Transport; Tue, 22 Feb 2022 17:49:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 17:49:27 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 11:49:23 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 6/7] drm/selftests: add drm buddy smoke testcase
Date: Tue, 22 Feb 2022 23:18:44 +0530
Message-ID: <20220222174845.2175-6-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c0e65f51-1b8c-417b-02f3-08d9f62bab9a
X-MS-TrafficTypeDiagnostic: BN6PR12MB1522:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1522D3ED97ABCCF4D3ECB945E43B9@BN6PR12MB1522.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvRdYexe+q/HH4Za4clPA7YgLxvb5jMFc0ILgn38Bf4U9Q/0+LWy7s5MIEbhfd7MynnWZj65SwuMFv1ArRAQnE3IlY6+ns+uFtzVOVKTbjXxY5eJiPDD70S4Y0LF/YPZEAq5vsJiyUg43sMts97VkfIfBIwvH6gZnNv76gLQXp7dsbLulz2gRgllNrHQR4+T1NZyIm6f1S3Cv0A3G0KPfqYVRPDu2TR6mNINmkyPF4rYa4HU3nwJQ161Zs0Ee/4tCTGL/0pLsIBcxbN3ULLdCGsQNTAlfmxZ7JxbYf73EXjeSga7P+A0ElXgZF1zvcwPuFXy79w74wUBg/n+RPXj6TvgZbKYYF3shJw6evpQZiLBwS6K0Mefi/Lbb/Ha7MemBeqPbt6g8v0fEM9gHx2LhgU49ibp97KeL1LByTPRW25BL3kRjro6dO0r1SxSiWW/cmQxjof2S9kGrMAJOQe2n0Dk0doVCQWrFaao1q4OVLqA/Eo3ic2acRXn5hMYThuePkPdYTPM0TYBaNJyqRDg05VTvsYFQzYnOCpW+td+ARJk7v2n3WwQqSL9c3NQ664KS27PJkRYxrqmJAGXNTFVUdVtP+t825q5E++pejNvofy3989E5pPqHOGGeTsXPS8iiRsBeDkbAZ95NP5PrP/tDNPgQueNZuCM4fCUiWlWdZCgZnyGU+YYds1x+8OeH7fP5e6Rg2eLmsJ/vFJF5FySzw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(4326008)(186003)(81166007)(1076003)(70206006)(356005)(70586007)(8676002)(2616005)(16526019)(508600001)(82310400004)(86362001)(316002)(26005)(2906002)(36860700001)(83380400001)(40460700003)(426003)(66574015)(8936002)(47076005)(5660300002)(36756003)(110136005)(7696005)(336012)(54906003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 17:49:27.1409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e65f51-1b8c-417b-02f3-08d9f62bab9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1522
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

v2:
  - removed unnecessary test succeeded print
  - replace list_del()/list_add_tail() with list_move_tail()

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 139 ++++++++++++++++++
 2 files changed, 140 insertions(+)

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
index 2496113c4868..e1cc2353a476 100644
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
@@ -314,6 +338,121 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
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
+			list_move_tail(&block->link, &blocks);
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

