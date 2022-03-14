Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7A4D8C75
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 20:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FA110E1FB;
	Mon, 14 Mar 2022 19:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD6C10E1D3;
 Mon, 14 Mar 2022 19:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxdYPEao6/ePpZ/pN43JGmar968kYwVB9UTyx3PB6pb9skXPo9MaZRRwyZJ54dcuGeVQxJmnc/9fjh+Klk9Crq1yAQbI09/QF+GdMYHslbYP/ZDXaUsMigCC82oRzuYf5EOJiBm97IFb7/IAAIQFtyOoKotdfO9uOwfsVmM4vOP1xgxr0hGqfJ3Ao28Pz9hgAa6SfuzMKoccO/77yLehaXPacXMg2cKuzDn19OSr+776XPOFdQdrdVAlin1Vl4OWHtKIcErf0FS5ZpqCyCPI75T7yUI9XtTKPTdwqaPvNT0QA7AjLrt/MDtOp7V2K8WHNmZtTO7FSDowHcFPuBC3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPEuEhCgC7liPyu+YPnFdOD0V7Ya1381j5SwCQ0SDXw=;
 b=bYg/Dtycbs4kPUO6srggs5PAVqEzI2I4z5cnMOUDpz5+9SZgcr7etYbNXrCbLMcLz0FRncio1JQY4Vyw4CBUO+WcRt6A20xNN40FDuwbUDeuaa9ygxNwYxSspTRPTiNqi31xkUaKjatEM21CrxPTCBiset7AqIr7rxuaQXy71zjwYcmM7uAe7AeIqTe59H/dAq5LrKeptRrXryK5ZR/F/gB+VkRUzPByJJ4Z7rJZB8iN7VdZ3vGGt6AoWvsdHhTVx8VYqlzHTMjVHZnXKqL9Jj38flDKBj0ecBagTsrQCOHqwXrgEKJ4CfKCgukLvuoEVadD+Ditt4RhdCAxKBoGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPEuEhCgC7liPyu+YPnFdOD0V7Ya1381j5SwCQ0SDXw=;
 b=vSyGaR3C3mFzywr7nz3Vb5avJrNk2mCM/1//HlHet/jdhUMane/6qeg8MObaP29hrQg8pNgFUP6jc2XXQJMNEyo++cPca+a29He5V8i913IAyhUbzj+jT7OzIqYfZpzOnDrOcnsrX5uijn8nJ+0fcVf0j0Yabk1AdRkPFXR+oV4=
Received: from BN9P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::18)
 by DM6PR12MB4700.namprd12.prod.outlook.com (2603:10b6:5:35::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 19:32:25 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::aa) by BN9P221CA0016.outlook.office365.com
 (2603:10b6:408:10a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21 via Frontend
 Transport; Mon, 14 Mar 2022 19:32:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 19:32:25 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 14 Mar
 2022 14:32:22 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/i915: round_up the size to the alignment value
Date: Tue, 15 Mar 2022 01:02:06 +0530
Message-ID: <20220314193206.534257-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89810c64-a243-46b1-d3a9-08da05f15e37
X-MS-TrafficTypeDiagnostic: DM6PR12MB4700:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4700DA13EF0F0BAA0BD49D01E40F9@DM6PR12MB4700.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 97hHAS32W54Bdo8FQsW22mJ6s8w9wihq+gX0oUOz4mX98Pyxmfpxk3s3cJN03OiQ4URapQZj7xXO3kFAYkvPKWuXao35urFx68ab9t8viprNeo0GQ3jNHnw1RXzVUumR+yEIhRnT8V6gJaoE9qcK1haN5UpjnT3ZTVXoBlIDrlQ5isw9hyx647HMnRarOiJYmqpKH0YMnj6dYWwiveLZY55UzbiMRNHvACxTkK4NiDYwsNIgJuB2DByWcVulYsRGFcjrlrN7XN4cF20ASZgkmaGfLedXLa81Jvdgu+5ZunJ1+9IvKghyBgqjOVBv0IgU4eSaQWiZnDIemiXRFuU9zdS+jtZCg26UU/nPjUnbq/ydf0KlQrsHqHXVYNcju0y+YuPMKf+nPyJvUP6oJu5c0N6ltRnO1Xjt6fVRlPq4LWl/RX4bAtJQsQoKM9jiJ18kTivX3x0h2CsxW7gg0p2lgrWKcS38Ximm7g//LafqK2PNqCb9Cn+6yLM2fw+bKcSPwQv8MyBV5CiNvGV/FIgq5joVo9KkWhsFX8cqvhgTCUngmMMdz0t77ICBy3EaytaWMmh6xkeMcTfjmu4nr4aqTL1/j1glG7weSFrGlwQJYKrzgfp2FuzvLOy5cge4qQVfgCj+EFrLdVZRwtiV3ew9ssgpB78s5RxNFvFWkjqIvyBOLZsakLxaox4Iqey2H+FGiyV+eN82N5m/SD5gG/KZEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(110136005)(356005)(81166007)(47076005)(6666004)(54906003)(316002)(2906002)(336012)(426003)(36756003)(36860700001)(83380400001)(40460700003)(5660300002)(4326008)(82310400004)(2616005)(8676002)(16526019)(70586007)(86362001)(8936002)(70206006)(508600001)(1076003)(186003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 19:32:25.1695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89810c64-a243-46b1-d3a9-08da05f15e37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4700
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
Cc: alexander.deucher@amd.com, Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

handle instances when size is not aligned with the min_page_size.
Unigine Heaven has allocation requests for example required pages
are 161 and alignment request is 128. To allocate the left over
33 pages, continues the iteration to find the order value which
is 5 and 0 and when it compares with min_order = 7, triggers the
BUG_ON((order < min_order). To avoid this problem, round_up the
size to the alignment and enable the is_contiguous variable and
the block trimmed to the original size.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 129f668f21ff..318aa731de5b 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -40,6 +40,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_resource *bman_res;
 	struct drm_buddy *mm = &bman->mm;
 	unsigned long n_pages, lpfn;
+	bool is_contiguous = 0;
 	u64 min_page_size;
 	u64 size;
 	int err;
@@ -48,6 +49,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (!lpfn)
 		lpfn = man->size;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+		is_contiguous = 1;
+
 	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
 	if (!bman_res)
 		return -ENOMEM;
@@ -71,7 +75,12 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+	if (!is_contiguous && !IS_ALIGNED(size, min_page_size)) {
+		size = round_up(size, min_page_size);
+		is_contiguous = 1;
+	}
+
+	if (is_contiguous) {
 		unsigned long pages;
 
 		size = roundup_pow_of_two(size);
@@ -106,7 +115,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+	if (is_contiguous) {
 		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
 
 		mutex_lock(&bman->lock);

base-commit: b37605de46fef48555bf0cf463cccf355c51fac0
-- 
2.25.1

