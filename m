Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 033E7492404
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFA510FF76;
	Tue, 18 Jan 2022 10:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F03D11217E;
 Tue, 18 Jan 2022 10:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7fwAZ949IZSfv11Wj8sTWTxqUsiZkicP2+fsGv5GToKKJkCf4b8sihORf+4H/7ItClw1FgClPD8p15qV48VJQlLsUAJdX4EqP+qEvVuhnjqe/SeBm/2BogPp15+VKrTmVIPr0pzj3I7ELw0z1Cd2z8TGaaf9nDsrdRVobzqbOhKW0qFCIKfyun0KL6jXGfPllFiXo1zUh3vmg6BSXgBAjqOhF9Txl18ImEtfNI4W5p+se7A8qqfzDvXBrWqVAV6qu7hG/CA9nFRKM4VSuEUi597Z9MONCkHQtxTcamVWFI3CHnH5/nAWUAJwRavwdngOa5OaV7Az6dsWRvByHAZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fEwF10gb2Zem3pxpj4UXllxgQbOdIzc3WeqlbbBfuM=;
 b=Swgzgyfz1JYqdDPB5iDFRjL5p+rU142NPTOFwmdg8MWSxp2Z8fXNKiZtUJjSO2t+96nCHyMSyP7Cpxvt6fcg2i/Ul01jJQ9t0dPs/9gAkiVaot2uvprmGO3jAG83agSqLvwZeH39eH+Kegj7ghBCoz7X3RJq8e1cLTj4bjpZB7gwkxH3IC9591FH/PXDRhvBbDHwp5hciyBuNPw6Yri4lOsA8DmvUlOL8BefSQX2HBRTijqS3UskkAqlwK0K7mZ+Vq4/QF5JODPOZaa/CNi6e3K2RuYYtEY2srM/Y5X46j8PJkUk9zD8vn/Dw3ixhLtFhzqVoc3yfBm9jXeFdWEugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fEwF10gb2Zem3pxpj4UXllxgQbOdIzc3WeqlbbBfuM=;
 b=apSodjHBwlFkoR9aYq9DG2EkChP1IPH+sFQ8CQMuPksNvjLQ74l0kjXTbGNKoqZNaotffjrf+WjwdTv9NAODLRESBnqv3o3sPWAvtsGcuHiin4vpJrnHZ/5r+RZCA1KwXMA5DOCg2cfN4esZIZ7zzkx/cLtL3J6/j9pVzaMeUaI=
Received: from DM5PR10CA0022.namprd10.prod.outlook.com (2603:10b6:4:2::32) by
 DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Tue, 18 Jan 2022 10:45:55 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::e5) by DM5PR10CA0022.outlook.office365.com
 (2603:10b6:4:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 10:45:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 10:45:55 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 04:45:51 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 3/6] drm: implement top-down allocation method
Date: Tue, 18 Jan 2022 16:15:01 +0530
Message-ID: <20220118104504.2349-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104504.2349-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220118104504.2349-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a96cf7ac-f383-4708-c7b1-08d9da6fb4b2
X-MS-TrafficTypeDiagnostic: DM6PR12MB4372:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB43720BBD5BF74B4BFEA72B33E4589@DM6PR12MB4372.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VsfR8FXb5byLroDze8jMibmCg0tQPjOwVpKooYQtuZCz1HSYrbTEREhK354/YZvOUZW9bRrtucNZFZ/BWHFcWgzwEpLTgbBunknZQD5Esj34d4PpzICg5qolykpQVRcUe2KtLeFDlbiroUWzjT8fz1bJ+MvGlnYYleUjCJXgmvB5EdtQ81WQ7rTgvUtnm+rUbbccA08pq+SBdAbeXxgvMoRpQNPmOS+kDm57eB6gNMPq+MUXLx6VclXMHNALXPaDJ36yu/lbt3h9Q7S+O1sqxnJrNwduB39o01H8j4X29oD9mqduk5GeNxDrY/HE8RxbWStbfat+gXPOGOt+YW22yd0RbMfUFYuapK5sA8JLmQQErd10+zhqpAty6D89cfVIttpY1KIPGhwAgfTUeAg/vENL9JZ/FIXdfJA095fSCG+5+03J66UFSOVEUTDaE67X+4Q3hW8NVsv+SFVur2UwTqEQOYNczgJ6NmURdOuHfj7fTjuHGK0bX7MKz314mimZxDdrV7syyLCBnzy9p1EUfbVmGou6bg6gne1yP54n1epKUoLSXQKnHosbV2Vc1OB1DG6UjGpDaLBb6Zq8VWnuMQPhlST8xrH/dHGtkeLBse0ebPDo4PZMfKNw04BT5PK2O2A8BBHwT3cW4yezxsiIEVU6fvfBO2tLFCH0V065q+aK9PDx6Usgh7J4Q9x7253ovOVqiCBLbXDxYORX8texnzKwMKxHHled+i6M4vRK+5dwu34Amo9CbkDaBxZQP5ocRvU2IkxopY9WAACzYB03mqPeLVb4TkexoCUAcXPvJ+4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(36860700001)(426003)(110136005)(336012)(186003)(8676002)(2616005)(70206006)(316002)(70586007)(8936002)(508600001)(16526019)(54906003)(82310400004)(47076005)(40460700001)(1076003)(81166007)(6666004)(4326008)(86362001)(5660300002)(7696005)(2906002)(83380400001)(356005)(36756003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:45:55.6382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a96cf7ac-f383-4708-c7b1-08d9da6fb4b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
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
index 954e31962c74..6aa5c1ce25bf 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -371,6 +371,26 @@ alloc_range_bias(struct drm_buddy *mm,
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
 alloc_from_freelist(struct drm_buddy *mm,
 		    unsigned int order,
@@ -381,11 +401,17 @@ alloc_from_freelist(struct drm_buddy *mm,
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
index 1411f4cf1f21..3662434b64bb 100644
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
index 865664b90a8a..424fc443115e 100644
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

