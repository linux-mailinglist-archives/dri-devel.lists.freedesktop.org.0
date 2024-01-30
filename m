Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D904842D4E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490041134F3;
	Tue, 30 Jan 2024 19:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EC61134EE;
 Tue, 30 Jan 2024 19:49:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfc9dM2mofok3QKRHNtjHgMMcpvLDDbFhvYjzYBtyJPutnizEyENmq8T37b/K0gkwGbqjqw6kyPgkIBnwwCDs2Jcwv9krRgsRTQV2iqzcbsDgJ4Jo8uRNb4g+G1KymcNLafncIROdfHp/x1R55dMvty+/BEbq56FrOXQwgEFTnmdBoxT0OqwIDtTygtT60VgzZ1vm4jLoH7+ueMWtGYtMG2P2dtj5AxiszqDefvVesdIGUS5aMJcl448ZAi+uLAeaMup00PX7v8whtd/71OPGMREoJHeBuMwa7bo8csN6EuSiCEFEdMYG43Pk2/SbO1ctFpSe4125OB6/5EVUYWVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cqz/gzIxwFssLvlm0N2II7cv5nVh7Y5CWrxBhqoJjiU=;
 b=WE+AYMJfm4oF82Vng75wvFKrNvldIaHq699jlZCfeRgXrp9unZQ7V7M4OdwUqcJbhyYpqlysy15RrNmMNjfjgzw6mxitDKAO8Hprckt3GOUuAQrfRDvGQpNy6h4HVxSC0okpb6K3dkkGqD+KofBwMG3L+yWLdERZ65+Jvzd72Fo686SqQLpL6OVRk/iXm9OFFxDEsLKUCKl5zVB7tVokD1h9Qza42TS/TVgLi4LkInwbmrQcufnyHgTQ61zTHhCWyYA7gkoiSJ0yP98WRm55uu+uPUzK1UAYCrkmu5Uq9k6OVZaodR6C92r1o1w1PLslGApYXmLuGpILfO0Sg8f7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cqz/gzIxwFssLvlm0N2II7cv5nVh7Y5CWrxBhqoJjiU=;
 b=WDkRrXOGrIxpfO1/3UrOFI7Y4BKk3RQ2t4k+YP6DO3OJo5gHwoyJLtCM+eMr3thjlo2EDMtlTnxUrP7tNszz0JLKy+Qk9rs9rDiqB/nWJF2/Tz7ALdzK0Xef1WpYaQyqUiNMoj7xQkA4oRntI/i05ft0Ganq+41VFt+1/XkoPAE=
Received: from SJ0PR03CA0269.namprd03.prod.outlook.com (2603:10b6:a03:3a0::34)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 19:49:31 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::74) by SJ0PR03CA0269.outlook.office365.com
 (2603:10b6:a03:3a0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 19:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Tue, 30 Jan 2024 19:49:30 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 30 Jan 2024 13:49:28 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 3/3] drm/buddy: Add defragmentation support
Date: Tue, 30 Jan 2024 11:48:26 -0800
Message-ID: <20240130194826.398208-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130194826.398208-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240130194826.398208-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7770c1-4d3e-48da-0689-08dc21cc937b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ow21i9w2cEaDxHZM2levTYwrUnyhezpWVcuy3J3nq1zaBVDoan2eLQZqNa7Tluh2tI1r/ssUku5eAh85lTQtHZqfYo08W1acsTedjdW0m2S3SHWUhdcUfUV3cQ1QBlONXuTanTtFzfdEmHJFsILPgP/6yNVG8DjpysYcPuY9aKbs02IpIpjIpGZ5tckTHnpTv/I7ZlOKoB8Q8ZjjeDweXG7Ym/1ipS4IbHsuqeQ11cu624Ozkgmgv67nbh6G6XQltlBcY49W9INcy7zteeqL25VfLcFMNiQfhzsTSkHxbE202DsGpgBquQSRx33qS19UsEYBIwnmMxhIZUWY/72QRJNZvwzmHN358uJ4/CQM7I+50GHyuCUXjvJ6lzmMS6dS63XhS0yeZIxfEtC2RGTTfYiW3lXrc5mvw8I1dUKcWOHLRBFQ/cqC5H29FTnXy9+qfZxkf4AEy0bVCkBPX+GxmTKtduNxbj7U0JdPxqMmVLieIFVCkM+a73kLHvYHCfGwPWJVcc4RAJ9swQeyLkGH2vWhXw7aJVAsYG0AEuehvlKSp2yatvmkMKIsGSpWTXQwh6LRjZstEZ6KNfriXZZ0Px1hj8nbTwb35ymwKBeMM6HDBD4rQeorDJKLoSugeKGMJsGXFmroN94Wi2etXHGPn5X2MOE7hEwprlQKJ63cxyGBgYuTADchhCMp5rmS8+xhML7nuQSOOJOcV3dnRthFZEO8Z19qSmGUPCzX0XuuK73p6KjbCHTYI+cc6r/hqTO9dvnRsdep+NZDFKxL+zRaGg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(82310400011)(451199024)(64100799003)(1800799012)(186009)(36840700001)(46966006)(40470700004)(316002)(7696005)(83380400001)(1076003)(2616005)(5660300002)(426003)(8676002)(336012)(8936002)(26005)(54906003)(16526019)(70206006)(70586007)(356005)(110136005)(478600001)(36860700001)(86362001)(81166007)(82740400003)(4326008)(47076005)(41300700001)(36756003)(40460700003)(40480700001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 19:49:30.9876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7770c1-4d3e-48da-0689-08dc21cc937b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
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

Add a function to support defragmentation.

v5: Defragment the freelist order array beginning
    from min_order.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 70 ++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index d44172f23f05..8aa6d31cb826 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -276,10 +276,12 @@ drm_get_buddy(struct drm_buddy_block *block)
 }
 EXPORT_SYMBOL(drm_get_buddy);
 
-static void __drm_buddy_free(struct drm_buddy *mm,
-			     struct drm_buddy_block *block)
+static unsigned int __drm_buddy_free(struct drm_buddy *mm,
+				     struct drm_buddy_block *block,
+				     bool defrag)
 {
 	struct drm_buddy_block *parent;
+	unsigned int order;
 
 	while ((parent = block->parent)) {
 		struct drm_buddy_block *buddy;
@@ -289,12 +291,14 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 		if (!drm_buddy_block_is_free(buddy))
 			break;
 
-		if (drm_buddy_block_is_clear(block) !=
-		    drm_buddy_block_is_clear(buddy))
-			break;
+		if (!defrag) {
+			if (drm_buddy_block_is_clear(block) !=
+			    drm_buddy_block_is_clear(buddy))
+				break;
 
-		if (drm_buddy_block_is_clear(block))
-			mark_cleared(parent);
+			if (drm_buddy_block_is_clear(block))
+				mark_cleared(parent);
+		}
 
 		list_del(&buddy->link);
 
@@ -304,7 +308,37 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 		block = parent;
 	}
 
+	order = drm_buddy_block_order(block);
 	mark_free(mm, block);
+
+	return order;
+}
+
+static void drm_buddy_defrag(struct drm_buddy *mm,
+			     unsigned int min_order)
+{
+	struct drm_buddy_block *block;
+	struct list_head *list;
+	unsigned int order;
+	int i;
+
+	if (min_order > mm->max_order)
+		return;
+
+	for (i = min_order - 1; i >= 0; i--) {
+		list = &mm->free_list[i];
+		if (list_empty(list))
+			continue;
+
+		list_for_each_entry_reverse(block, list, link) {
+			if (!block->parent)
+				continue;
+
+			order = __drm_buddy_free(mm, block, 1);
+			if (order >= min_order)
+				return;
+		}
+	}
 }
 
 /**
@@ -321,7 +355,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
 	if (drm_buddy_block_is_clear(block))
 		mm->clear_avail += drm_buddy_block_size(mm, block);
 
-	__drm_buddy_free(mm, block);
+	__drm_buddy_free(mm, block, 0);
 }
 EXPORT_SYMBOL(drm_buddy_free_block);
 
@@ -447,7 +481,7 @@ __alloc_range_bias(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -577,7 +611,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 
 err_undo:
 	if (tmp != order)
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -657,7 +691,7 @@ static int __alloc_range(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 
 err_free:
 	if (err == -ENOSPC && total_allocated_on_err) {
@@ -903,7 +937,17 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 
 			if (order-- == min_order) {
 				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
-				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
+				    !(flags & DRM_BUDDY_RANGE_ALLOCATION)) {
+					/*
+					 * Defragment the freelist
+					 */
+					drm_buddy_defrag(mm, min_order);
+					/*
+					 * Try contiguous block allocation again!
+					 */
+					block = alloc_from_freelist(mm, min_order, flags);
+					if (!IS_ERR(block))
+						break;
 					/*
 					 * Try contiguous block allocation through
 					 * try harder method
@@ -912,6 +956,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 									 original_size,
 									 original_min_size,
 									 blocks);
+				}
+
 				err = -ENOSPC;
 				goto err_free;
 			}
-- 
2.25.1

