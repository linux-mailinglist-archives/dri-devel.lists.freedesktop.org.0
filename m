Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE897826DD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 12:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B314710E22A;
	Mon, 21 Aug 2023 10:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6892A10E223;
 Mon, 21 Aug 2023 10:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY4GWguw/Du2igYDEpBCQRus8Z/VneK8W15nEF6/acc6ihskax4W5S3yQfFSSTyXeP0mlKGRoeEDl93Vn0SIr9mDM+YqjNS8DXVVMp6UDwBat3TWjSEFv8hO/OBAkOMQJDNawM0YtXz8+80v6OZDRreI9hfNvnrR+MWDskyCJiCiQeq3PpnFgS/CTpHcImqsS8rCU4zjtduz126795zfhMwznyXowui8oJjNipAkiH/TEtRIQUryMtXq24unhQDIg7ZYxmqwr66G/2orX9jONyt2acszSi/niy0goa61Bsv6IEmYO8Kkm67E6dQgN+hvROdh30Bl4uhHCi/ON6OTnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70V+JIWgKUY6vBS8qCTBY7nEnPyOQoxgklYacTG9hoQ=;
 b=mudYEY9siKcR1IFD4P0GknJ00CESIfuDLJjAUi5/p7O4Cr0ZQLWBqE5X4JoidaJ1nE2aqup1T6YaXfyhQiJnUD1MD1Ybxs6DsiJ8tziZ6vJ/MeoTUj62dMgjcTUE+Qa4MWSPimjXspH8rIdI2cOYz7XIAd0lxqmdjQ05Vruw8AoBCotPZ8YZnWtUt+kOKGWFf2MA5/uP8tpMPZHyz+WZQXwIpTcofuHpfd7Yx4U1Bx3FhxJ7PjfbhMgKB1LZZV90c+dlstPzTlTB0VvedVcrxEhmCVMBITrcuqXNw576u6vAcdVRRfhcam7U6zgxXSEe18pHaVzbNZiDvq4y9kRMPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70V+JIWgKUY6vBS8qCTBY7nEnPyOQoxgklYacTG9hoQ=;
 b=oX4qDGqSJcwnDcXTLnZZWjofJH8TQQcODnU4Ipt04+BTZI8N30zGUzyz+3qLgVGHlTXOUoro3O1PbgHC0zjHIGOsi7Q+YVmqZ+W+Vt+KlRwl3/O3SKmZn9AcFiGxZM6kI5z46dj/K2KxLjk0D6nKLguuVrRJ44OgcHVyD/vBkx8=
Received: from SA1PR03CA0012.namprd03.prod.outlook.com (2603:10b6:806:2d3::15)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 10:15:12 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:2d3:cafe::44) by SA1PR03CA0012.outlook.office365.com
 (2603:10b6:806:2d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 10:15:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 10:15:12 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 05:15:09 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/i915: Remove the contiguous computation and trim
Date: Mon, 21 Aug 2023 03:14:44 -0700
Message-ID: <20230821101444.119601-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
References: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|SA0PR12MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa85e7b-28c4-475e-3d24-08dba22f8194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CNxvr1Ut82fgCDC3pJ1kFr0Kcs0q0o4PH+50W5a6AA7gFcGSTiIF7+ltbXW9PPvap9l4jc0Eiah7a+gQGlZs3Nfgl2FAa8PY4cjND3kq0/nIXCluIndIHZXEUIENXtxvEXNqsIQyJ60h2ROYYxqEDYhkydDEYWmAOVloUzqaCC2Hy4Y3mqTc2Pj/zImxEN9Lfa7WEZlzem6Km0bdMVeicBUAhSl1L0m/Obwnnd3Xc/KibQPxGqQsvGP4OZ5PBPrBU59K3RXnfWP/ekJwqa46kuxRmX+PPV0zHx6vFIKvpDPmsRs0SqnniCfhK20TXhbPAFutW0RNiNsEbDk2dhNLy94lOnqsefk0uJnb4RlbVCzhVhwDu54vfYyWPzr3k9qNvqAnBFC7u4Sk1P9iE9aKDm0dYirk0pKoPaZstPeH3tWzYMadaB51JEY0nxdIVjjJra5WGRuMmgW4TUy3d+Vzfvd6dxAh0sC2XcW0L8fYhggQpMt5zTv2+IJKz2KmcOKcOvEa1dM0qE6EZKXvA++hbIx8Csds/w+gH0NTONk2Zja/k6fiCPzknTjcwPDZPeWwjNnZ+kU55CzSciHT1e0MC4EKORqk7qYUDsPOXDJfUQA3wfPGr8FC5uVgHC0CG2hhIhkk+zU7La4sBy6SIwKAZUdqK2JMEeYIsRr9svu+2tOi7oIWvgHHNTNHX7LwmpYltHblyOTiAioFsDRwvomtZQGPDJ4T4OJEr1LlyViZQP/x9wltZGh/BezXz6aJ2vDo7aecUejnyyrKS/4QnsORJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(54906003)(70586007)(70206006)(316002)(110136005)(8676002)(2616005)(8936002)(4326008)(1076003)(36756003)(40460700003)(41300700001)(82740400003)(356005)(81166007)(478600001)(6666004)(7696005)(40480700001)(2906002)(83380400001)(86362001)(36860700001)(47076005)(336012)(426003)(5660300002)(26005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 10:15:12.3570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa85e7b-28c4-475e-3d24-08dba22f8194
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we have implemented a new method for contiguous allocation
which requires actual size and actual min_block_size, hence we
have moved the roundup and alignment size computation to buddy
allocator. This way gpu drivers pass the required size and
alignment to buddy allocator and rest of the operations taken
care by drm_buddy_alloc_blocks() function.

We have moved the trim function call to the drm_buddy_alloc_blocks()
function as we dont have the roundup or aligned size in our driver.

Now we have all in one place and it will be easy to manage in
buddy allocator.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 23 +++----------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a1bc804cfa15..0d735d5c2b35 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -59,6 +59,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+		bman_res->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
@@ -72,18 +75,6 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
 	GEM_BUG_ON(!IS_ALIGNED(size, min_page_size));
 
-	if (place->fpfn + PFN_UP(bman_res->base.size) != place->lpfn &&
-	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		unsigned long pages;
-
-		size = roundup_pow_of_two(size);
-		min_page_size = size;
-
-		pages = size >> ilog2(mm->chunk_size);
-		if (pages > lpfn)
-			lpfn = pages;
-	}
-
 	if (size > lpfn << PAGE_SHIFT) {
 		err = -E2BIG;
 		goto err_free_res;
@@ -107,14 +98,6 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		u64 original_size = (u64)bman_res->base.size;
-
-		drm_buddy_block_trim(mm,
-				     original_size,
-				     &bman_res->blocks);
-	}
-
 	if (lpfn <= bman->visible_size) {
 		bman_res->used_visible_size = PFN_UP(bman_res->base.size);
 	} else {
-- 
2.25.1

