Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F161C633656
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 08:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3282E10E395;
	Tue, 22 Nov 2022 07:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7910E008;
 Tue, 22 Nov 2022 07:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlMTvbAdZeJruWyr/VNzVzeqAKm3Kw/WjlA/ky/X7VchvrHJkqhqE36w3LmFIxBh31XgE2WPpMQpB5w52H7hOMEAbDnkWdlfUFniTXxLY4rQXz6AnpLeLhzhOsUS6GDKMqUpvq8B1gLtxeeLwHwNIYsskAX4AnIlf2lLh9KZSKTv8ertV742lkh9ibzjEHa/3W+8IKgejTxbMr072Lmc7FSOh6XWY3NWTM3Jk3GVDzZ1rguozGH+Ufrwqh800CCveZYeDYaEvnS3odL2cBkjuveDCDwXvL+F6JgGTQ1Jssen0Uj/CeOnxxvVnUV8DACoSJ+7Il/euCaC00F+GA6dow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVSzKv7uSbgsCPu3eG4kq2yM5z8SnjztdwZKsK204SA=;
 b=KFdnEy/24mHH8MzweRpcdfB8dTq2kfDYVFLG2pdwiEzpWIWie1qTwOc92DX0Z4sdsS8f6tLEWNTjQ2QuvR2abH/FUOwTTPKcjJMxwHt97N8YkxVMNYRgmrLEAcOaQv0fUQ2QU4BHdx72NTL0RXLMn2VSV63iB6o0DcSIDlbvsV+uo6YzJYr5dYv2bVNSZ0x0/ICzbTdJWSoFZ7z3IIMWF4KzN5OlX9PApeWoLj3AVOQh8/NXS+eC0FQKt4+lVFLJs0qlrOhxhW9DtWRjM94mtpR1S2HYnks8pfskm5A0ad5HZtjGFH0LXhzSOG+Q5BF5bqG/25YBe2nrQIhkooz3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVSzKv7uSbgsCPu3eG4kq2yM5z8SnjztdwZKsK204SA=;
 b=0hkOkTYNjd3M62r4st/GmAt/M23aQYt/uXK6YDkxp6LM5S3bji2HQukKEXemk17/17UZyWsyC5gA2yY103Itc87t4jEZnOMgdDwva6RFdYLJQNzvCfKvfCHUhjmeV1Q45RYR3shXidwiBspt8rUxvRgRv02mvovQ7AbJXU3lulo=
Received: from BL0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:207:3c::22)
 by IA0PR12MB7532.namprd12.prod.outlook.com (2603:10b6:208:43e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 07:53:12 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:207:3c:cafe::27) by BL0PR02CA0009.outlook.office365.com
 (2603:10b6:207:3c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Tue, 22 Nov 2022 07:53:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.9 via Frontend Transport; Tue, 22 Nov 2022 07:53:12 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 22 Nov 2022 01:52:35 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1] drm/ttm: Clean up page shift operation
Date: Tue, 22 Nov 2022 13:21:44 +0530
Message-ID: <20221122075144.505736-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|IA0PR12MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 053ce8f6-0860-4756-d3c2-08dacc5e9ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2oa8tc05965mTsCm+DmJbLMvQ+x3WTPja3cNBMOoBx32x2LvhqE8exgZmDZ7ZVS7C/lsSXCqMaMH/KANCUrLx7gx7PDTGJLHu9HvXEiwbhJWAFf9vcoPc6hJZfRpKboVJltq8HMoy1YU3jqZ+xajGxFVkD4izzb3q0p1x+3aUNiJz0mmW9vm3gfGxh8Oqy7paR6pFUgstpnxqcdxrrpQuX0mfQ2xfX9CNaF8fNk3aVMj+ctNB1hnUC/2FPZouQYWKP7dNL8rC+n1K/B1PRudes6DOU/YnhXsNMmbl26wVfEtbxO6fZWUvwPMnHnA+2Gw92hFijUwGmSRIcu+XZOEOa7GweViZ1Xl++k51uzqfP/M9x5tX+QXhNMfR+EacIPrXQgaatCUUDHFUczrGZn25vX8BjrEnPiHyhGSBik3Fr9XFpnMpcPQXk9rNsI6tgSONPLOw0kDKJjOPQGqHMFxgEPty51PGOBAzayVBdoYz2rQu+jrn/pqokUtRBreRdxJZ2EymkQEuJ6E8QGp5NxOOEM+GjtCmonwjNrNeawI4/m8n6RPKjlu7Gt5e0acvBHhaQ9iEdKGkjXVWWeVe0J76z8GFKvpkY8UBKcNEX+pRVGzQ/QbL0vArySv7j/NzVmXPh3iOC7TdENE9aSE74eTXxv2G6IrHkd4RdEayiHYls6SpEypFRsEZxHbYX97u60iY1Jh7d0tCigczkWHsYJ8skdYLQ+nGmYY60gPFEMzsDE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(81166007)(478600001)(70586007)(356005)(36756003)(41300700001)(70206006)(82740400003)(8676002)(110136005)(54906003)(4326008)(450100002)(316002)(186003)(47076005)(426003)(1076003)(2616005)(336012)(40460700003)(83380400001)(36860700001)(82310400005)(26005)(6666004)(86362001)(7696005)(16526019)(2906002)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 07:53:12.3623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 053ce8f6-0860-4756-d3c2-08dacc5e9ae5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7532
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove page shift operations as ttm_resource moved
from num_pages to size_t size in bytes.
v1 -> v2: fix missing page shift to fpfn and lpfn

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 +---
 drivers/gpu/drm/ttm/ttm_range_manager.c    | 13 ++++++-------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 974e85d8b6cc..19ad365dc159 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -541,12 +541,10 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
 		/* GWS and OA don't need any alignment. */
 		page_align = bp->byte_align;
-		size <<= PAGE_SHIFT;
-
 	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
 		/* Both size and alignment must be a multiple of 4. */
 		page_align = ALIGN(bp->byte_align, 4);
-		size = ALIGN(size, 4) << PAGE_SHIFT;
+		size = ALIGN(size, 4);
 	} else {
 		/* Memory should be aligned at least to a page size. */
 		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 0a8bc0b7f380..6ac38092dd2a 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  PFN_UP(node->base.size),
+					  node->base.size,
 					  bo->page_alignment, 0,
-					  place->fpfn, lpfn, mode);
+					  place->fpfn << PAGE_SHIFT,
+					  lpfn << PAGE_SHIFT, mode);
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
@@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	/* Don't evict BOs outside of the requested placement range */
-	if (place->fpfn >= (node->start + num_pages) ||
-	    (place->lpfn && place->lpfn <= node->start))
+	if ((place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
+	    (place->lpfn && (place->lpfn << PAGE_SHIFT) <= node->start))
 		return false;
 
 	return true;
@@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	if (node->start < place->fpfn ||
-	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+	    (place->lpfn && (node->start + size) > place->lpfn << PAGE_SHIFT))
 		return false;
 
 	return true;
-- 
2.32.0

