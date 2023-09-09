Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8479996C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 18:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29E410E2AC;
	Sat,  9 Sep 2023 16:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAFE10E2AC;
 Sat,  9 Sep 2023 16:09:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC9Jom6igeLB96f2b0dFyx6cz5ICFy1lWg1n9yH35E03dPzYOh1WMo4RShch6VvaUHrDPlKWyqOIAUy5TC0xZySMvItdvwg56YcsKWJkHBW43xPIa2QypuxmRUX8vFijxcli1CMo5c0x/RWShpA7wvW4PNVwnJAv6Urq2+yuCjR8Rej9i+EiYfHfoAkdz66JX1WxiMxJpUVyoe/a8iWlEAVJPuySNxNT36/SFrGRP3aRy2lC3sDDDhs0UN7ojV2hGwj8NcK1s48bHbwbxdRxCbJ5x2fxpbjyQ7UAQ+dhYrFUrbNJ7G93vQ5BeSlMmlItDzl196GP6CXrHTwOtJqhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpfIuV1k0qKZv5rIxshUaNFdKU54JcQLtzbKX3lOWBA=;
 b=KqOp2/Rl4rUhsJ2LaQLu24HItdYxlATfTGbPQrqXD2tGAwgMXTuofsTh15HOds8io12ptBEM2+TUSnrBrw/IYpBNR2WM4NLLMmZrEto3EIN32+zYV5oi+O8zxD9tWGdWj1gnlX9B56DZ3HO3X46HdDli0l0dmg3q1hT0Ioh3luKoH+sJvZbnBLZN1xm2kLKANX/9aIzntaDghc86EEehclOjcO32tx9HhlDXovXaUCuLUHoRPC4tefMAu7wHRIx52GqVq7468UKi+F375i3vqx8xdVDAwgkbM5MElpIcQOUtWqtVY+7+eUXpYxblimxqHASL3dwQig2d0kZyuvJH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpfIuV1k0qKZv5rIxshUaNFdKU54JcQLtzbKX3lOWBA=;
 b=i3rO9abCDHHKGIGJFhbnjCISAyNkPdHuKRR2PgVnHSBLaSqe62FC7Oss9ld8j4gmgNKLsjDLxfAAb9dMyDEtl5ok/Elhl8m3ZcZxWypjR1Myaa3InB23RFpsb30OZv7UqBZN7GlPj67REY+6lpsgW0zuzL0QqD8GsLhb+jFcujA=
Received: from BYAPR03CA0034.namprd03.prod.outlook.com (2603:10b6:a02:a8::47)
 by PH0PR12MB8824.namprd12.prod.outlook.com (2603:10b6:510:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.32; Sat, 9 Sep
 2023 16:09:38 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::ee) by BYAPR03CA0034.outlook.office365.com
 (2603:10b6:a02:a8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34 via Frontend
 Transport; Sat, 9 Sep 2023 16:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sat, 9 Sep 2023 16:09:37 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 9 Sep 2023 11:09:34 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 3/3] drm/i915: Move the size computations to drm buddy
Date: Sat, 9 Sep 2023 09:09:02 -0700
Message-ID: <20230909160902.15644-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230909160902.15644-1-Arunpravin.PaneerSelvam@amd.com>
References: <20230909160902.15644-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|PH0PR12MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 288e5a50-bab9-438a-3de1-08dbb14f2aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKmGxohtvQw7xoWt5DuR3GwktDwfoLH8mknCQpK+aMKcuVmExmNxW71McmDzO5u2CJ7hMXRhycyOXwcLBi6LSPXKK7Izduy7v4tQDQFr9qPTwK81EUdWhK+l+d212oq3Gow+u3kLjp1kW61mZtF0gWddJpK+Hr2hdzJWcNl43c6afErMcdaAlP94V5aeYebjqsH1xM4pQxqWaEMt9Bal0rtijrbZ/32yO7Ql28ABilIqFa7PgrB8p1YBZHX18lrxd0MtHfRcbituZV0s0OL6AFiTA6AA/mpwbARTqChfXOGQoeqjU2PysjKerByywyUus8u0/E72xkxREQ9tkjwvKqAsk8I7ze6m1lZwP3j8Dn3GuwArBda/mXEgHlEbXMDz38JbE0jH13G2DLf+aUaalkeQfNEM2roYrFwNGL9lxqSBDhHahb18tkMVHrG4xU0t0Nk4Xqbe7/o0PklJuPbHT7vXgniCSh7jse4nsYH6dFSHfmudWny8mlRSrz+hJzXPDOJihScfROqC1n6iwIfBqwUV4OaB8Ph2eMEle/Y+RvlfP+pa/c86gZZ0m8zwfaNZtEoYO8JfTdh52aVOqxHzYuHR1BW38ADStH4WSf//7i5Mm17uozyUDB4gLI1cjq7IHplrbJgoBdz70EfVAKe+a+6GOGW/cyWYvAelwi/xHx2FDOAr94U2gTOx6SsctHMJRWNP9XdD4/8Mf9YWQ9yXjxkeEYnWaOS9zZaAhruboSSF1ZLlW1cOhZ7TXvfTCEU6KBSpJz1XUi4Op5iiGu31cg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(40470700004)(7696005)(6666004)(478600001)(83380400001)(1076003)(2616005)(16526019)(426003)(336012)(2906002)(54906003)(26005)(316002)(70206006)(70586007)(110136005)(41300700001)(5660300002)(4326008)(8936002)(8676002)(40460700003)(356005)(36860700001)(47076005)(40480700001)(86362001)(36756003)(82740400003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 16:09:37.7852 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 288e5a50-bab9-438a-3de1-08dbb14f2aa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8824
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

- Move roundup_power_of_two() to drm buddy file to support
  the new try harder mechanism for contiguous allocation.

- Move trim function call to drm_buddy_alloc_blocks() function.

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

