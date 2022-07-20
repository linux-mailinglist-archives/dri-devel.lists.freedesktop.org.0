Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A912657B1EB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0160210EEFB;
	Wed, 20 Jul 2022 07:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E87E10F32F;
 Wed, 20 Jul 2022 07:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSNKfCe0eMACy4Mvzq58CyudSCP3/vZIrxzbQ9F9Tz46I5pR8RusFvth7uHL3tNONVwFjUQKQqtqNZIwQYMVMQj/74RgIEwTG2GpQhT/H8Vgj6tWDhj+GdkJz4jXCEraGeo70jPMzNOME36cddKSoU5uXbGN5hQg37/II4hrD3ZQ2V+rtTfocU3gbNyP6F537mtUUfRFrWND8MjNkgfWQpKx+FyEhU+yds3ksc6KN4gHJMnFy6uh3xkmck4SLOOtaRY54VMjReDZVvqpaux4awl6CyzAQ494iBaob+7X00yHSluBXHD79mcNPoS7axoc23qgpA33kP8LDYZenFVOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByHo5yDs5s1Imb3nJc7NLGwDstL+YMUwak6J3JkGHLM=;
 b=cTEro17bMX2+Qj4eudoLftGwgEYmSVgYkUsuQ+kcNOSV+r/cqREEbCUtIPVyInlkk9QNMVBTHVWWb4don+NLCWQcpTjDkti/sHWPJazn6NVh/FmZ2LGBnCSmJkdBRGzHVzwyPEJa+vYwN1JTbK+lKqhuE5jRkrjgsNxJY1IxSR0ucawyzvzWjyIO6yT0F6RYm9MqPDCBL6hnIItvDEwN3FRVnltIjdHnflzI+9NQmYSeGNp6NoDkfVHm7VqYWSD+uwLQ2hfdPMOjnzNcThjTAA7A11kXf3aaS/SpclFM1MhDdmmIRv/YUtJ7o/hLTlGE1HsPSRhKxETcaSnw4OT1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByHo5yDs5s1Imb3nJc7NLGwDstL+YMUwak6J3JkGHLM=;
 b=x9IBp8DFzpYR+yuGlyOKTHJ6KmFi1Ou9sGbSWXMenV1/laPSKCTaXOvMTjSNQyqE+B/y5Tq7M3zyZQGHViNahwOgGcjlf1dkOC3lm07+D0GcNE8WfzJai4uaGOnUJNQciYT//4BZ1hlDlUYwXHlXgnZZFfePnhmm+Czk2ENq9tI=
Received: from DM6PR08CA0033.namprd08.prod.outlook.com (2603:10b6:5:80::46) by
 MWHPR12MB1405.namprd12.prod.outlook.com (2603:10b6:300:13::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.21; Wed, 20 Jul 2022 07:41:01 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::a2) by DM6PR08CA0033.outlook.office365.com
 (2603:10b6:5:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Wed, 20 Jul 2022 07:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 07:41:00 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 02:40:57 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/i915: Add intersect callback function
Date: Wed, 20 Jul 2022 00:36:04 -0700
Message-ID: <20220720073606.3885-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbf8bd53-7ee9-428a-6fb2-08da6a23311c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1405:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfTOKtfM3o0IIBVqpLbhE1oBLdNsR7DeNwdNEC/JN1pF9VcLxUonnt7X5D2AcDPzQNwy0WrbyT6t2HMptYWUGnLbf+u7ZU0+ISWmz1E2ElFx6Uf91g72dLInnhyFqHoD7NxyzNpmr3/CFQYGSJv7vjG/mAuKuK9W0Ms2VEYPycMfwUF0Pa+KNEDiKp4OHHySTh5kbtXhHuf86UVF2TE7fIDnyrhkhEYNtaCr8jTRQSsCmZbbd2qPFMv5nhlD2YtkunlDwRuf0BE7w7ucXSQEL1OLl3TGP9NuQclt4vHuCnYtvMIeepcmY6pQMK2iXXdVYBcOcn66nUugxGgJEeVUe6+5T+USr15g/c5lHD2DHlZQTUYsdymd9EpmSRaq3XGTyXGHm8sgqSIRqGBLKV100yv9lUri0zPS5SuJffC6I7mRwvE3QrhTFImC1shY7JmmJKlpDCuOc2T1FoZUir4agt9WlaMemhePnsYRhxvc/zcrK5/Kt6A3KC36ZQjO3MBLV3OuDlyxxywWnLAdwXlHXX+b8VUIDvS+ykZOeFlIiRwnHpOy35dM60ZPS2FQhTRoOtcq8ArYsigqmpVeqYldO5jIVM3mwA5bwwH+vZ/sjvAVvfpuC/0TErtSIxYzA7HWgAbvG9Wcdc4i7RPyqAI8Q36/4if/ngrws7txrl4+826qEcSUFTEHwb7EbP1BmpS0I+UdVEN6SEk+WRZYxNzoaO83rEhY3HJQ+wwjNOxdLd+CmJ/rTVzB5e49J78RI9Ju5VQATksT8kFDm8i/Mb575zXOtrySrDS/5pHHVqB7mdZX6V80kpam5x7+qwqc0ocYSisSy9P/u4KpJ65NVOXETA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(40470700004)(46966006)(36840700001)(54906003)(110136005)(16526019)(6666004)(36860700001)(47076005)(41300700001)(4326008)(7696005)(316002)(1076003)(2616005)(186003)(8676002)(5660300002)(426003)(336012)(26005)(86362001)(36756003)(8936002)(70586007)(70206006)(356005)(2906002)(81166007)(83380400001)(478600001)(82310400005)(82740400003)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 07:41:00.5599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf8bd53-7ee9-428a-6fb2-08da6a23311c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1405
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

Add a new intersect callback function fetching
start offset from backend drm buddy allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a5109548abc0..30bb8ade67a9 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -178,6 +178,28 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	kfree(bman_res);
 }
 
+static bool i915_ttm_buddy_man_intersect(struct ttm_resource_manager *man,
+					 struct ttm_resource *res,
+					 const struct ttm_place *place,
+					 size_t size)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+	struct list_head *list = &bman_res->blocks;
+	struct drm_buddy_block *block;
+	u32 num_pages = PFN_UP(size);
+	u32 start;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, list, link) {
+		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		if (start < place->fpfn ||
+		    (place->lpfn && (start + num_pages) > place->lpfn))
+			return false;
+	}
+
+	return true;
+}
+
 static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 				     struct drm_printer *printer)
 {
@@ -205,6 +227,7 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
 	.alloc = i915_ttm_buddy_man_alloc,
 	.free = i915_ttm_buddy_man_free,
+	.intersect = i915_ttm_buddy_man_intersect,
 	.debug = i915_ttm_buddy_man_debug,
 };
 
-- 
2.25.1

