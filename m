Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC324652FC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 17:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845EB6E4F8;
	Wed,  1 Dec 2021 16:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE73289230;
 Wed,  1 Dec 2021 16:40:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMgYnGbddnnkjwMLIdOqyG6RRBkCrlAu7yUdjkVpezps0dl62XA58b+ZaPIcsUNVlUMRy28Fofg6/vHV6WJuC8BGlxOQ8YyiC4dwyIdkGbWRNqw17mr3ms8puot+vUBn9nol2QMRngOkH6njs53M0zdFczWlWk8WMOZ7PRCKxv26Ny79dyQgErczA+Vx3b4u9WKtTo+TJwGfcL9qaZPIwA6GuIwqXnQoapPeoAafCKmh8aXCzpBpiLpBLLnw8xhBiE0z+AHd12iKas4EWmRY4DMGsCWJgcdgxkD3dt+wYIjzyBkPF0LyCQj9ilLh1H150oI2AV9MqK3Ah8TpVMr41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNu5Olah898ASzXUpQEkkLp0pIhYM3p0y90wdDNlkoM=;
 b=P+cpAsIGBLDxx88iHjW5IsYd8Mnyj9SrnanOdJ9eWFq1wtdUxMYd84IPF8zLYCUo2zBwT5esZ5x3JLo/NtjIWXtjmxLcvYwDavIttLwK770i3qkroHBnZ+IBy/w6qZghcKW9Fr7sFDCOQbwfaPJfqTJQOZhivCK+0+Y9/6aZfcRa3GkDfzycvlvpUhfVrlTVUL4nq4yt49y9BSJqtGFK2IbbNZqEeug2jFhLd36IKL3wLRGoTJJFIlaoySv8AgfzoPJgfJxuzdS0sDn85YzbtVMJwWu1dM+fLbPo93XkC/cCFK7V55AuICB2adZlD/z86M5jzCDIn5900430UkBurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNu5Olah898ASzXUpQEkkLp0pIhYM3p0y90wdDNlkoM=;
 b=P8eVpnC1SRciK7lKhWIKcx+j9I9yHIJR0aX62HPtLgNWrK8IFUMlKJ1pY0od0asCgSM3fI0BMc5w+vGj8IAdaetPDj47bfc54T1rQKcD5ne1Xrar8LX8x710AFVpUiLxXjbd0/3/lsFDfjz8m+J8vWv+yvsol3nM4BTj0mznGVg=
Received: from BN9PR03CA0119.namprd03.prod.outlook.com (2603:10b6:408:fd::34)
 by DM5PR1201MB2523.namprd12.prod.outlook.com (2603:10b6:3:e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 16:40:36 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::bd) by BN9PR03CA0119.outlook.office365.com
 (2603:10b6:408:fd::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 16:40:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 16:40:36 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 1 Dec
 2021 10:40:33 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 3/6] drm: implement top-down allocation method
Date: Wed, 1 Dec 2021 22:09:35 +0530
Message-ID: <20211201163938.133226-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e339a699-f2e8-4898-040d-08d9b4e94d0e
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2523:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB252335EC3155BF1D9A2A1895E4689@DM5PR1201MB2523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M1eLguhJ861eW8FMkQ7eR2m3ifzBiXHlVtz8R960D1vF11jWA+Y1AnJk/6sExtmfeSblDlL028ZCdvkN/hSnbYA/Quzbj0IOqGemizfrQ6TdOf0n1BYeE3Vk+GPb0inl3sDHeAeOTr6ba8JeUsmtwH1FIEWXEtDzoCoOWTodTj0Gc+/s6k7ndL4+2M1Q0ZScrYNOlX0Aq4r2ZAscVNRqGXy/RTU5R/dlhymJW+0txdEgc7BjfkPEdgVnvH2Zo/9mqhJ3LZxbo996fwG3UfLuLgMcgpiZLzz0WEFH/W4Yntg/aC/DXasFvktezo1RH8nTMQW8P9d5ceafls1DeDpUR7mVxlOmCWvI6knfn+3C5A+VQUXe3Vzb4KDtnHnTbiXzxUmCsBrQBYRtYd2wj6QuX3BHdqrIBjSZR25fSyp9k4uQL7tQTrjTT1JY4dU+dSoCkVvbNw1tI6hXuArcCIiqdY8z01D6LEZxLrFFq50JgzWOjhFPtoZW/wtoZrC6Z4XIEOqRnZFINCqTdN8zNdnyCIyusGpwqUJNq5mhul7MNXpWNEeOh863O+Esa9iuU8k78Mie5JNM4CeviLDrOq4h7t2EN+sYLo+qr5Ym4RGPei0kuulk3Y1BDF7+g/nZhaBgohCuBkbZJsfKDKYDTLUkxK7waWyKQ3NDCmUIsURqeF+gZo4G8q3yMz7JUuF1ua9Mcq8w8RAFIAJfei0mpal3SJlkyrrcWrBln1D3BwYdbl7WcZOh2X2DacTgO5MtHptO+VskHZdAXnlyGw3Yck5/9NEGy3iuGGQPqO9Hhz9e2eQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(186003)(316002)(2616005)(356005)(70206006)(336012)(86362001)(82310400004)(8936002)(81166007)(110136005)(508600001)(426003)(54906003)(7696005)(1076003)(83380400001)(36860700001)(2906002)(26005)(36756003)(4326008)(47076005)(16526019)(8676002)(70586007)(40460700001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 16:40:36.2310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e339a699-f2e8-4898-040d-08d9b4e94d0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2523
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
index 221de702e909..316ac0d25f08 100644
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

