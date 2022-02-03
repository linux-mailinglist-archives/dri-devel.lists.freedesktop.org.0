Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD24A8538
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AF010F7DE;
	Thu,  3 Feb 2022 13:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F379D10F7D2;
 Thu,  3 Feb 2022 13:33:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StCuygmHzbRQogs2rMDn1a6vdPCS16l+MJbe5q2fD19KcQeWflMbTh/PxtKZ/gXQH6epbP/lnreZtOVWsmAVF27MfdBl5iU0yqQcwotYM2Lw7I1NoikB0nIFJVTRH/DuhbUJK8ZRJRSiJ5LAFsPgrS/d94eay99O86ZsIE8oxxEAMmLtEB/Ei26OuG1j5YZ8v4kP7leDu4QvldpYeWNeL6QB/j2BUj2yf3813pBwguKdOvJHf1JPayFzvY1rhnH51cdDG8WpulvRbJZ7RKlvrVKGZqwnbJJAWvL1G3AT/rP4AQchwfeIw8whfp0Pbt49D66igNIQSlZ4ITBSkxQU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW9RgS3GjnHRwpVbLiNy0QYkgNmhfOXLtzfk6hB/ePI=;
 b=XfatAn+Al308aDX8yMwHoEdhWAJRGsi2R0xFu0F2vJ62FQ66JpJAFRwmVNvmD1LrpKBQe1VKA2m487dR5bdTPZAVOtaH1FvcnorBPjY3A1KDVJDS9cY076beckeTP6K4ogE3SsMfiUTTnC0SApFyGT//P8fopKk1nOZSFY79fNUflHScKh3gp8pMHLoygG5lyZ37q1jo2l1MXRVi45pT2dd9yvn0Alu2lvqnWGQPr9e3Mb6+JxYMlweP33eyYh6d0KtZeiqyIY6aM4vo+YzAZy6XXaj3SsQ0STh++CT57hqqgoS2NXskdzOGhK2bxcPYZiBj3duigxHbxiwArbGuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW9RgS3GjnHRwpVbLiNy0QYkgNmhfOXLtzfk6hB/ePI=;
 b=ULKaWe1EwWav+6loqba881Vvv//yuTcA9MgSn0DV51Y3zFyQJCPwYmnz/6k8KfopH12XdWaNRpY+lWVF5HuN6FBzb4B+GPUJAoY5mHGxDbADM86lO5CVXf5H4FNkz1rkbHxz2WKrYRJkVv960HpNiq3Rqh39PhIcG+mM+Y0uHao=
Received: from BN6PR22CA0071.namprd22.prod.outlook.com (2603:10b6:404:ca::33)
 by CY4PR12MB1622.namprd12.prod.outlook.com (2603:10b6:910:f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Thu, 3 Feb
 2022 13:33:04 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::4f) by BN6PR22CA0071.outlook.office365.com
 (2603:10b6:404:ca::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14 via Frontend
 Transport; Thu, 3 Feb 2022 13:33:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:33:03 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 07:32:59 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/selftests: add drm buddy alloc range testcase
Date: Thu, 3 Feb 2022 19:02:30 +0530
Message-ID: <20220203133234.3350-3-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b602489b-45c7-4b0b-4064-08d9e719b454
X-MS-TrafficTypeDiagnostic: CY4PR12MB1622:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1622F79ABF8A55D0195A77FEE4289@CY4PR12MB1622.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXCnqNEzKV7y8e9xSRfK1jkHiXLDVztq5XCi71XXTHcglymvR5RNS8WGteBtwQAGs9ql5eW9MiXGNCZZdu0PpFN5elcau3AZpeq4JmExxSW8DAHt9nEDBKI1PCWAKonINbUmbyARIrDg2ypjnbadjqAShv3QIc1TVFhor1mSX4TCHV57GAjGazW5kSC1S6xxiEUuZHmlHw4LvzW33NlIPYSd9ouIHfYbEMXjFz9vDUbJJJyLPNA3sSiF5HDrKBxeKigbHf2XGTMR0EvtWSfDGodjrZBHfwbygp6jwUI+M/TY6TIKsdzgm5/Ck7IMatpQnwM2z/n36j0ugWduHJLIDU8q/15dKp+BmAaaDSADkial98NsNzldLVIPy4SoQ06VqG8PiHq1oyOlmjbfuysXlwVe9WI0KfRMnKF516E2+UTlBCmzKsp0rJLGh3Fl23zqBI/39CzYxOHx2EN+NytlDHh+EelViVEBhpxD005+RfIs44UDJyxX89aq9YpIZwmwi6hgRcbs+IhkdjD6S2be5WnDupiuUBWWZbzi/qIf9kEnODVRPUY2LnBAYTyZNvJw9fkwkb9BZFWsFeUTnN7088B99Vfby5LMlDf5cjWizXb4/b9u1JRn0LmY6iMtSFJpcwEforfyc1JfN3CBKDHRzPfPknl5rKEY47ivV6tfQenjvc65EInL2PEy5l9YC7X6PqxvOddxLLWstwo9Ca83/A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(40460700003)(30864003)(8676002)(8936002)(36860700001)(4326008)(70586007)(86362001)(70206006)(5660300002)(356005)(81166007)(82310400004)(36756003)(2906002)(1076003)(7696005)(186003)(110136005)(26005)(54906003)(426003)(336012)(508600001)(2616005)(47076005)(6666004)(16526019)(83380400001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:33:03.4629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b602489b-45c7-4b0b-4064-08d9e719b454
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1622
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

- add a test to check the range allocation
- export get_buddy() function in drm_buddy.c
- export drm_prandom_u32_max_state() in lib/drm_random.c
- include helper functions
- include prime number header file

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   |  20 +-
 drivers/gpu/drm/lib/drm_random.c              |   3 +-
 drivers/gpu/drm/lib/drm_random.h              |   2 +
 .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 390 ++++++++++++++++++
 include/drm/drm_buddy.h                       |   3 +
 6 files changed, 414 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 4845ef784b5e..501229d843c4 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -211,7 +211,7 @@ static int split_block(struct drm_buddy *mm,
 }
 
 static struct drm_buddy_block *
-get_buddy(struct drm_buddy_block *block)
+__get_buddy(struct drm_buddy_block *block)
 {
 	struct drm_buddy_block *parent;
 
@@ -225,6 +225,18 @@ get_buddy(struct drm_buddy_block *block)
 	return parent->left;
 }
 
+/**
+ * drm_get_buddy - get buddy address
+ *
+ * @block: DRM buddy block
+ */
+struct drm_buddy_block *
+drm_get_buddy(struct drm_buddy_block *block)
+{
+	return __get_buddy(block);
+}
+EXPORT_SYMBOL(drm_get_buddy);
+
 static void __drm_buddy_free(struct drm_buddy *mm,
 			     struct drm_buddy_block *block)
 {
@@ -233,7 +245,7 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 	while ((parent = block->parent)) {
 		struct drm_buddy_block *buddy;
 
-		buddy = get_buddy(block);
+		buddy = __get_buddy(block);
 
 		if (!drm_buddy_block_is_free(buddy))
 			break;
@@ -361,7 +373,7 @@ alloc_range_bias(struct drm_buddy *mm,
 	 * bigger is better, so make sure we merge everything back before we
 	 * free the allocated blocks.
 	 */
-	buddy = get_buddy(block);
+	buddy = __get_buddy(block);
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
@@ -500,7 +512,7 @@ static int __alloc_range(struct drm_buddy *mm,
 	 * bigger is better, so make sure we merge everything back before we
 	 * free the allocated blocks.
 	 */
-	buddy = get_buddy(block);
+	buddy = __get_buddy(block);
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
diff --git a/drivers/gpu/drm/lib/drm_random.c b/drivers/gpu/drm/lib/drm_random.c
index eeb155826d27..31b5a3e21911 100644
--- a/drivers/gpu/drm/lib/drm_random.c
+++ b/drivers/gpu/drm/lib/drm_random.c
@@ -7,10 +7,11 @@
 
 #include "drm_random.h"
 
-static inline u32 drm_prandom_u32_max_state(u32 ep_ro, struct rnd_state *state)
+u32 drm_prandom_u32_max_state(u32 ep_ro, struct rnd_state *state)
 {
 	return upper_32_bits((u64)prandom_u32_state(state) * ep_ro);
 }
+EXPORT_SYMBOL(drm_prandom_u32_max_state);
 
 void drm_random_reorder(unsigned int *order, unsigned int count,
 			struct rnd_state *state)
diff --git a/drivers/gpu/drm/lib/drm_random.h b/drivers/gpu/drm/lib/drm_random.h
index 4a3e94dfa0c0..5543bf0474bc 100644
--- a/drivers/gpu/drm/lib/drm_random.h
+++ b/drivers/gpu/drm/lib/drm_random.h
@@ -22,5 +22,7 @@ unsigned int *drm_random_order(unsigned int count,
 void drm_random_reorder(unsigned int *order,
 			unsigned int count,
 			struct rnd_state *state);
+u32 drm_prandom_u32_max_state(u32 ep_ro,
+			      struct rnd_state *state);
 
 #endif /* !__DRM_RANDOM_H__ */
diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
index ebe16162762f..3230bfd2770b 100644
--- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -8,3 +8,4 @@
  */
 selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
 selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
+selftest(buddy_alloc_range, igt_buddy_alloc_range)
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index fd7d1a112458..e347060c05a2 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) "drm_buddy: " fmt
 
 #include <linux/module.h>
+#include <linux/prime_numbers.h>
 
 #include <drm/drm_buddy.h>
 
@@ -16,6 +17,395 @@
 
 static unsigned int random_seed;
 
+static inline const char *yesno(bool v)
+{
+	return v ? "yes" : "no";
+}
+
+static void __igt_dump_block(struct drm_buddy *mm,
+			     struct drm_buddy_block *block,
+			     bool buddy)
+{
+	pr_err("block info: header=%llx, state=%u, order=%d, offset=%llx size=%llx root=%s buddy=%s\n",
+	       block->header,
+	       drm_buddy_block_state(block),
+	       drm_buddy_block_order(block),
+	       drm_buddy_block_offset(block),
+	       drm_buddy_block_size(mm, block),
+	       yesno(!block->parent),
+	       yesno(buddy));
+}
+
+static void igt_dump_block(struct drm_buddy *mm,
+			   struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *buddy;
+
+	__igt_dump_block(mm, block, false);
+
+	buddy = drm_get_buddy(block);
+	if (buddy)
+		__igt_dump_block(mm, buddy, true);
+}
+
+static int igt_check_block(struct drm_buddy *mm,
+			   struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *buddy;
+	unsigned int block_state;
+	u64 block_size;
+	u64 offset;
+	int err = 0;
+
+	block_state = drm_buddy_block_state(block);
+
+	if (block_state != DRM_BUDDY_ALLOCATED &&
+	    block_state != DRM_BUDDY_FREE &&
+	    block_state != DRM_BUDDY_SPLIT) {
+		pr_err("block state mismatch\n");
+		err = -EINVAL;
+	}
+
+	block_size = drm_buddy_block_size(mm, block);
+	offset = drm_buddy_block_offset(block);
+
+	if (block_size < mm->chunk_size) {
+		pr_err("block size smaller than min size\n");
+		err = -EINVAL;
+	}
+
+	if (!is_power_of_2(block_size)) {
+		pr_err("block size not power of two\n");
+		err = -EINVAL;
+	}
+
+	if (!IS_ALIGNED(block_size, mm->chunk_size)) {
+		pr_err("block size not aligned to min size\n");
+		err = -EINVAL;
+	}
+
+	if (!IS_ALIGNED(offset, mm->chunk_size)) {
+		pr_err("block offset not aligned to min size\n");
+		err = -EINVAL;
+	}
+
+	if (!IS_ALIGNED(offset, block_size)) {
+		pr_err("block offset not aligned to block size\n");
+		err = -EINVAL;
+	}
+
+	buddy = drm_get_buddy(block);
+
+	if (!buddy && block->parent) {
+		pr_err("buddy has gone fishing\n");
+		err = -EINVAL;
+	}
+
+	if (buddy) {
+		if (drm_buddy_block_offset(buddy) != (offset ^ block_size)) {
+			pr_err("buddy has wrong offset\n");
+			err = -EINVAL;
+		}
+
+		if (drm_buddy_block_size(mm, buddy) != block_size) {
+			pr_err("buddy size mismatch\n");
+			err = -EINVAL;
+		}
+
+		if (drm_buddy_block_state(buddy) == block_state &&
+		    block_state == DRM_BUDDY_FREE) {
+			pr_err("block and its buddy are free\n");
+			err = -EINVAL;
+		}
+	}
+
+	return err;
+}
+
+static int igt_check_blocks(struct drm_buddy *mm,
+			    struct list_head *blocks,
+			    u64 expected_size,
+			    bool is_contiguous)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *prev;
+	u64 total;
+	int err = 0;
+
+	block = NULL;
+	prev = NULL;
+	total = 0;
+
+	list_for_each_entry(block, blocks, link) {
+		err = igt_check_block(mm, block);
+
+		if (!drm_buddy_block_is_allocated(block)) {
+			pr_err("block not allocated\n"),
+			       err = -EINVAL;
+		}
+
+		if (is_contiguous && prev) {
+			u64 prev_block_size;
+			u64 prev_offset;
+			u64 offset;
+
+			prev_offset = drm_buddy_block_offset(prev);
+			prev_block_size = drm_buddy_block_size(mm, prev);
+			offset = drm_buddy_block_offset(block);
+
+			if (offset != (prev_offset + prev_block_size)) {
+				pr_err("block offset mismatch\n");
+				err = -EINVAL;
+			}
+		}
+
+		if (err)
+			break;
+
+		total += drm_buddy_block_size(mm, block);
+		prev = block;
+	}
+
+	if (!err) {
+		if (total != expected_size) {
+			pr_err("size mismatch, expected=%llx, found=%llx\n",
+			       expected_size, total);
+			err = -EINVAL;
+		}
+		return err;
+	}
+
+	if (prev) {
+		pr_err("prev block, dump:\n");
+		igt_dump_block(mm, prev);
+	}
+
+	pr_err("bad block, dump:\n");
+	igt_dump_block(mm, block);
+
+	return err;
+}
+
+static int igt_check_mm(struct drm_buddy *mm)
+{
+	struct drm_buddy_block *root;
+	struct drm_buddy_block *prev;
+	unsigned int i;
+	u64 total;
+	int err = 0;
+
+	if (!mm->n_roots) {
+		pr_err("n_roots is zero\n");
+		return -EINVAL;
+	}
+
+	if (mm->n_roots != hweight64(mm->size)) {
+		pr_err("n_roots mismatch, n_roots=%u, expected=%lu\n",
+		       mm->n_roots, hweight64(mm->size));
+		return -EINVAL;
+	}
+
+	root = NULL;
+	prev = NULL;
+	total = 0;
+
+	for (i = 0; i < mm->n_roots; ++i) {
+		struct drm_buddy_block *block;
+		unsigned int order;
+
+		root = mm->roots[i];
+		if (!root) {
+			pr_err("root(%u) is NULL\n", i);
+			err = -EINVAL;
+			break;
+		}
+
+		err = igt_check_block(mm, root);
+
+		if (!drm_buddy_block_is_free(root)) {
+			pr_err("root not free\n");
+			err = -EINVAL;
+		}
+
+		order = drm_buddy_block_order(root);
+
+		if (!i) {
+			if (order != mm->max_order) {
+				pr_err("max order root missing\n");
+				err = -EINVAL;
+			}
+		}
+
+		if (prev) {
+			u64 prev_block_size;
+			u64 prev_offset;
+			u64 offset;
+
+			prev_offset = drm_buddy_block_offset(prev);
+			prev_block_size = drm_buddy_block_size(mm, prev);
+			offset = drm_buddy_block_offset(root);
+
+			if (offset != (prev_offset + prev_block_size)) {
+				pr_err("root offset mismatch\n");
+				err = -EINVAL;
+			}
+		}
+
+		block = list_first_entry_or_null(&mm->free_list[order],
+						 struct drm_buddy_block,
+						 link);
+		if (block != root) {
+			pr_err("root mismatch at order=%u\n", order);
+			err = -EINVAL;
+		}
+
+		if (err)
+			break;
+
+		prev = root;
+		total += drm_buddy_block_size(mm, root);
+	}
+
+	if (!err) {
+		if (total != mm->size) {
+			pr_err("expected mm size=%llx, found=%llx\n", mm->size,
+			       total);
+			err = -EINVAL;
+		}
+		return err;
+	}
+
+	if (prev) {
+		pr_err("prev root(%u), dump:\n", i - 1);
+		igt_dump_block(mm, prev);
+	}
+
+	if (root) {
+		pr_err("bad root(%u), dump:\n", i);
+		igt_dump_block(mm, root);
+	}
+
+	return err;
+}
+
+static void igt_mm_config(u64 *size, u64 *chunk_size)
+{
+	DRM_RND_STATE(prng, random_seed);
+	u32 s, ms;
+
+	/* Nothing fancy, just try to get an interesting bit pattern */
+
+	prandom_seed_state(&prng, random_seed);
+
+	/* Let size be a random number of pages up to 8 GB (2M pages) */
+	s = 1 + drm_prandom_u32_max_state((BIT(33 - 12)) - 1, &prng);
+	/* Let the chunk size be a random power of 2 less than size */
+	ms = BIT(drm_prandom_u32_max_state(ilog2(s), &prng));
+	/* Round size down to the chunk size */
+	s &= -ms;
+
+	/* Convert from pages to bytes */
+	*chunk_size = (u64)ms << 12;
+	*size = (u64)s << 12;
+}
+
+static int igt_buddy_alloc_range(void *arg)
+{
+	unsigned long flags = DRM_BUDDY_RANGE_ALLOCATION;
+	u64 offset, size, rem, chunk_size, end;
+	unsigned long page_num;
+	struct drm_buddy mm;
+	LIST_HEAD(blocks);
+	int err;
+
+	igt_mm_config(&size, &chunk_size);
+
+	err = drm_buddy_init(&mm, size, chunk_size);
+	if (err) {
+		pr_err("buddy_init failed(%d)\n", err);
+		return err;
+	}
+
+	err = igt_check_mm(&mm);
+	if (err) {
+		pr_err("pre-mm check failed, abort, abort, abort!\n");
+		goto err_fini;
+	}
+
+	rem = mm.size;
+	offset = 0;
+
+	for_each_prime_number_from(page_num, 1, ULONG_MAX - 1) {
+		struct drm_buddy_block *block;
+		LIST_HEAD(tmp);
+
+		size = min(page_num * mm.chunk_size, rem);
+		end = offset + size;
+
+		err = drm_buddy_alloc_blocks(&mm, offset, end, size, mm.chunk_size, &tmp, flags);
+		if (err) {
+			if (err == -ENOMEM) {
+				pr_info("alloc_range hit -ENOMEM with size=%llx\n",
+					size);
+			} else {
+				pr_err("alloc_range with offset=%llx, size=%llx failed(%d)\n",
+				       offset, size, err);
+			}
+
+			break;
+		}
+
+		block = list_first_entry_or_null(&tmp,
+						 struct drm_buddy_block,
+						 link);
+		if (!block) {
+			pr_err("alloc_range has no blocks\n");
+			err = -EINVAL;
+			break;
+		}
+
+		if (drm_buddy_block_offset(block) != offset) {
+			pr_err("alloc_range start offset mismatch, found=%llx, expected=%llx\n",
+			       drm_buddy_block_offset(block), offset);
+			err = -EINVAL;
+		}
+
+		if (!err)
+			err = igt_check_blocks(&mm, &tmp, size, true);
+
+		list_splice_tail(&tmp, &blocks);
+
+		if (err)
+			break;
+
+		offset += size;
+
+		rem -= size;
+		if (!rem)
+			break;
+
+		cond_resched();
+	}
+
+	if (err == -ENOMEM)
+		err = 0;
+
+	drm_buddy_free_list(&mm, &blocks);
+
+	if (!err) {
+		err = igt_check_mm(&mm);
+		if (err)
+			pr_err("post-mm check failed\n");
+		else
+			pr_info("%s - succeeded\n", __func__);
+	}
+
+err_fini:
+	drm_buddy_fini(&mm);
+
+	return err;
+}
+
 static int igt_buddy_alloc_limit(void *arg)
 {
 	u64 end, size = U64_MAX, start = 0;
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index bd21f9dfd15e..572077ff8ae7 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -134,6 +134,9 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
 
 void drm_buddy_fini(struct drm_buddy *mm);
 
+struct drm_buddy_block *
+drm_get_buddy(struct drm_buddy_block *block);
+
 int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   u64 start, u64 end, u64 size,
 			   u64 min_page_size,
-- 
2.25.1

