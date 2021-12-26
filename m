Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C247F8DD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 21:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD7410F220;
	Sun, 26 Dec 2021 20:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0F410F21A;
 Sun, 26 Dec 2021 20:53:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WT3knJFJYbGOL5JhyWHQjcoxFFlYDzogrMypHAQT02VNO4w75yrx7/A4byzdzsZbKpQjy97tVafG/lGSYi7EDAJMRuTaQ/Vo/I/UT6AZ5IF1BX6d/xbKrB+eRCgc9uDyaAXRL+agAT2n2i3ELylz4LQWP5NGfkLwugQI5wDGwsD30yxI5LFvZVewal9rtvHiSlhaIkeRqjzuUesO+R3TrEDfZRkw7M3NLzGcfsf5D+Z7ZCZkqTEhqHk+hGFqpZEMbIrJsqQy/NSG8pmVKcK9J/XBjbKb0eikeFcbjGpRpa5eFSJX9PYzFIjsMTmtp/NgfQfl41+lqv2SuHYK2RvINg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0Hml9T6zIeI02EAQjAnBOuo5KkmntZfA3FOLJopL0M=;
 b=F8VB2+hzkOuW/WuiEyC31DhJ6YYjyfoEEy4nYUqtSGwDy5GP+xk5MDSVwWqI2wpZD2xLvZozk0TFriMqBHQyxEH+3qOE50TuvKS9pC+TQYk413ZPDb9INvaEcHnQAa0WP+p2c614oR+18Wa9UP09ye5F4EFChmVtCE9IMtSNM4CZ6T7ULNXrTUDzJEXC8Tdn+UwtLDkHBEMSbZzqALhmRkG0qOBqyC1+IBpQNmkPcQS+yDku1m4EcVYSeYqeKWJmRmE20ENiycueNw84YBb7Q/nKS9/diIRfeijqx4kpyuBPyCoQHf/4IV0rcl5VGkJZe6BqakSacfGpjV7lQRTLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0Hml9T6zIeI02EAQjAnBOuo5KkmntZfA3FOLJopL0M=;
 b=qR7UjoGOybY8QkzTyXZzYKH+4ZvLP1A+YGAMrzNFWHlHNrN8R6smwkheUPLYZkwGxWxwe6Kh61zvH94Yk+UCDz4i4QIzij2JFWUE1AUXMl3XL2VM2Sul3oarjErEoILosPoml0SanECwZFn+owKAhv2EuMFOx9+yCJ2qDL/fHco=
Received: from MWHPR19CA0015.namprd19.prod.outlook.com (2603:10b6:300:d4::25)
 by BL0PR12MB2418.namprd12.prod.outlook.com (2603:10b6:207:4d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Sun, 26 Dec
 2021 20:53:25 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:d4:cafe::2f) by MWHPR19CA0015.outlook.office365.com
 (2603:10b6:300:d4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Sun, 26 Dec 2021 20:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Sun, 26 Dec 2021 20:53:24 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 14:53:21 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 3/6] drm: implement top-down allocation method
Date: Mon, 27 Dec 2021 02:22:32 +0530
Message-ID: <20211226205235.142049-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226205235.142049-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211226205235.142049-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29fef32e-6053-4435-ab73-08d9c8b1c2ae
X-MS-TrafficTypeDiagnostic: BL0PR12MB2418:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2418618C30B9CD38AB10DD89E4419@BL0PR12MB2418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpTO4lt8UIennB/pG7qGbcgzahH9wCQv5HnMMdodunGIyISKucSEiARdAPwiac1AIqzoVaWaPXzj4hp9If91mSfFcvzkTfICOZS2eA8a8mMVPYyG/iYYjFragqEz7j5E1QzL8glCbz1BEP0+OlD0bR032x8qoNnd0vzQQfQv8MCif/EUYChsj8YPlHj+0KJqxkQpWnbAPR+CsiBfeSHZ27bmXHNVWdb3MJgS7TZKY2gfTBT9mzlzV8+FOVedOhXZL2Oj4DZCliQxpRHffGQZjAqIW8+NBo+Hx49E3r/TxowUy49/c3aafO9l6pWYwJskw8RIRRilRtki6Ct3tWtN8ek1D5YiKmohHzIboMz5xvmvrn98dlZJSOer/MEakuWqyR5tsptDby2u3wMmVdMtIocTkBL3WCxjJ4zv4N2vAFOVs8ukjttw3o2WLxudRe8ILy6jsWOs3yZxjCemZOPgVhtB2bapQbkCAAqk9wj3bFIaNyoVZO0/JwuT2mo9nJs7/rvEYgMV8I312pjQZJCJwjD16XIqt58otslHT/oC0BZv/nsGYf3t5kV1zmha6XYf2F8AhGLxGXC5tCVwrWxZkgdAbXGi/xQqPcF5Nw2gHh3HjTgMDXnBg60ldBbwZ2qZvMzWU7Nw/YGot7Kn46lrAT3cs3x9I4OjG3tT/NW97hQsjIlniNfmId+AHxmzRAVH8VZiWGGJiCQRKfLZM4AG1gkz8rpLzo89CIwT/8dy6F4J/sQ0pZBqt1FMObWTJC64BaSMhx6kXsFPgqBa7CiNakyLh87xZwJaczIihid9lAw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(54906003)(110136005)(316002)(356005)(7696005)(2616005)(426003)(86362001)(70586007)(36756003)(5660300002)(4326008)(26005)(2906002)(6666004)(70206006)(8676002)(8936002)(508600001)(16526019)(1076003)(186003)(336012)(36860700001)(82310400004)(40460700001)(83380400001)(81166007)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2021 20:53:24.8910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fef32e-6053-4435-ab73-08d9c8b1c2ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2418
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

Implemented a function which walk through the order list,
compares the offset and returns the maximum offset block,
this method is unpredictable in obtaining the high range
address blocks which depends on allocation and deallocation.
for instance, if driver requests address at a low specific
range, allocator traverses from the root block and splits
the larger blocks until it reaches the specific block and
in the process of splitting, lower orders in the freelist
are occupied with low range address blocks and for the
subsequent TOPDOWN memory request we may return the low
range blocks.To overcome this issue, we may go with the
below approach.

The other approach, sorting each order list entries in
ascending order and compares the last entry of each
order list in the freelist and return the max block.
This creates sorting overhead on every drm_buddy_free()
request and split up of larger blocks for a single page
request.

v2:
  - Fix alignment issues(Matthew Auld)
  - Remove unnecessary list_empty check(Matthew Auld)
  - merged the below patch to see the feature in action
     - add top-down alloc support to i915 driver

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 36 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  3 ++
 include/drm/drm_buddy.h                       |  1 +
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 7f47632821f4..eddc1eeda02e 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -367,6 +367,26 @@ alloc_range_bias(struct drm_buddy_mm *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+get_maxblock(struct list_head *head)
+{
+	struct drm_buddy_block *max_block = NULL, *node;
+
+	max_block = list_first_entry_or_null(head,
+					     struct drm_buddy_block,
+					     link);
+	if (!max_block)
+		return NULL;
+
+	list_for_each_entry(node, head, link) {
+		if (drm_buddy_block_offset(node) >
+		    drm_buddy_block_offset(max_block))
+			max_block = node;
+	}
+
+	return max_block;
+}
+
 static struct drm_buddy_block *
 alloc_from_freelist(struct drm_buddy_mm *mm,
 		    unsigned int order,
@@ -377,11 +397,17 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct drm_buddy_block,
-						 link);
-		if (block)
-			break;
+		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+			block = get_maxblock(&mm->free_list[i]);
+			if (block)
+				break;
+		} else {
+			block = list_first_entry_or_null(&mm->free_list[i],
+							 struct drm_buddy_block,
+							 link);
+			if (block)
+				break;
+		}
 	}
 
 	if (!block)
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 7621d42155e6..7c58efb60dba 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -53,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->flags & TTM_PL_FLAG_TOPDOWN)
+		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 4368acaad222..f573b02304f4 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -28,6 +28,7 @@
 })
 
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.25.1

