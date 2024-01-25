Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC583C4F1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 15:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6744310F836;
	Thu, 25 Jan 2024 14:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AE910EF31;
 Thu, 25 Jan 2024 14:38:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clucAtQm4qt3s+JKcAjKLI1sQahGTLdRAGX1snxWz9pMcKl5TXkM1RfPXwdJH/cX2SDaKRcTzhEqyfLPHduoYNKrIG6iCjM7waUe+T/dBArzdzi/5zMyZ3bNouyNEjuTTfaJUuW1GdhKPy7t6risK/hVQGxT/yChMUHvjaVggA+id8Gh4/wO50z+Fl2llmWJze9CLLWsTpl6xG9rYegbYlVfkunFNRB3ISnTIJFvGfMwXjz4qq0m/TtlI6lmiV3Bd/xsLiTEmE4ErKuPiGdoHTOupP+CYa5KHnTn8LDVzfJiPSvcbCnoz68dUOZWKmAOLOlZ7tvSlBxkgXYVL/Fbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aG5lDRTlKjMPIwbi6xvmQLCgixE6bNT6Hpuw9scFJzI=;
 b=S8RyaMRHRidFqC3mVD75tNQzrNI6PlPiXF/sWHbOC5uAg3+CiaMJsPEnBR1osRrC7Iliz2p8WxQYvG6mKekfwodZ9UqQOFHtjRXgJfj2f/uAb7aFBj2PdGrJTl9QUEH+PMwT8B4ASK2o0Sh2GdG7xywBSPRgNlmYqo4GzWsPMbg5CtDJSp4XhR3G2Y5SIsnJjF3Ls87l6haCH9emTsnn+AhP16hheSuAf2tTQEi1f8ilUO1GjvFMqnwal+ae9LtzNeFeSI/Qmvo0tAQKvApsQYSRCG7pR5+COclHfCfHLwOoJPY9/MXIVrdT4vIvzRJCi06k2F9b6NfGwDCuR8CoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG5lDRTlKjMPIwbi6xvmQLCgixE6bNT6Hpuw9scFJzI=;
 b=rzaN5pN5m8x03Xus98XiTFXQlEAjylJNdHazNh593acAJH7ak/Uuo38wreeyZbOcIWMKpUqhbd4RjMF2sqEjZEqCEHDefzvsGbvRi9VIIAiuWiTUPe9mwUbNiLYd7XYx0250dwZm8Q5mQsaSIcyUzAn48g2IJYZ0m5p5dI7xJDY=
Received: from DM6PR03CA0028.namprd03.prod.outlook.com (2603:10b6:5:40::41) by
 MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Thu, 25 Jan
 2024 14:38:01 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:5:40:cafe::eb) by DM6PR03CA0028.outlook.office365.com
 (2603:10b6:5:40::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34 via Frontend
 Transport; Thu, 25 Jan 2024 14:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Thu, 25 Jan 2024 14:38:00 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 25 Jan 2024 08:37:58 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 3/3] drm/buddy: Add defragmentation support
Date: Thu, 25 Jan 2024 06:36:52 -0800
Message-ID: <20240125143652.4387-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125143652.4387-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240125143652.4387-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fb6853-8e15-4914-ca58-08dc1db33b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVVTpnCZkLE1qlCvfWQa4Rrsj7HLFJFOOycQwg0joaFLgNWWZ/hEzTgSASd088BhAe0j4ZtCjKdbRYHDQ9J2EW9Zm1zyaMsAX/AITz2FfAcv6Tv86gLn0KU1jd4tcPVj4VVcVkQg/W1Zh77Tb9xCUXLUKIHTnSsNBeg4VWuZYHVLtr5DKHDkcuhKd1L74FhJRCrZxlq4RgftrOHZPURpiOTkZOtVXm529YreTXvEDIYYFnKoe1qx4BUbLO5KUf37Ch5d+fugG/7kuIpPAk4kEYgKGcJkpKaYdRF75hpSxpaaaqyrgSHUfcz3Jh/qytTGW79mdjwPioXe4/ncbQ5IA88cAtyB2+1/PDODnyHClHrX7hdTEH3a4x5UavSIMRsXtSA9FLSypSRaoLveFzVEp0tI7cxP7qdUFhMIWoEIUdDsOmKUKAwUzF+PS744x/PZJPNOkNc9xLv03pPfkaN644an9vbZ4jRcrUHn8d7YOPX4we1cTFY3EeM2Tx9CnBZh7xWWlT6z8MESIshbNes+N7oC/H4eYmJoOFqdADOm7STc6Ie6x6Q+VQvpWYSBxczzA/RX5qvsEwY0FFDVpgxZP65LXhBbbiFxhm56NElHEYEralbVVUp0bB+cfKUUjh9MLik7/tgEnprCF6rSIzFuaKfbwOTY29SsCXwe2Jm71fHzxZNxfgdYSRaE5Y8lDBb7QZgdeoVsCoBPFoIbPmqm9OD8niyjsZ/feG0ySsJCb/fjb6aBgMEOFM4EjLBbSL+KThIUPBBNZy2LF0UZJ69qqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(40470700004)(46966006)(36840700001)(36860700001)(2906002)(36756003)(41300700001)(86362001)(81166007)(82740400003)(47076005)(356005)(54906003)(316002)(7696005)(110136005)(70586007)(70206006)(478600001)(6666004)(336012)(426003)(83380400001)(5660300002)(8676002)(4326008)(1076003)(2616005)(8936002)(16526019)(26005)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 14:38:00.9928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fb6853-8e15-4914-ca58-08dc1db33b51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 48 ++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index d44172f23f05..3cffa9cc12d7 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -277,7 +277,8 @@ drm_get_buddy(struct drm_buddy_block *block)
 EXPORT_SYMBOL(drm_get_buddy);
 
 static void __drm_buddy_free(struct drm_buddy *mm,
-			     struct drm_buddy_block *block)
+			     struct drm_buddy_block *block,
+			     bool defrag)
 {
 	struct drm_buddy_block *parent;
 
@@ -289,12 +290,14 @@ static void __drm_buddy_free(struct drm_buddy *mm,
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
 
@@ -307,6 +310,19 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 	mark_free(mm, block);
 }
 
+static void drm_buddy_defrag(struct drm_buddy *mm)
+{
+	struct drm_buddy_block *block;
+	struct list_head *list;
+
+	list = &mm->free_list[0];
+	if (list_empty(list))
+		return;
+
+	list_for_each_entry_reverse(block, list, link)
+		__drm_buddy_free(mm, block, 1);
+}
+
 /**
  * drm_buddy_free_block - free a block
  *
@@ -321,7 +337,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
 	if (drm_buddy_block_is_clear(block))
 		mm->clear_avail += drm_buddy_block_size(mm, block);
 
-	__drm_buddy_free(mm, block);
+	__drm_buddy_free(mm, block, 0);
 }
 EXPORT_SYMBOL(drm_buddy_free_block);
 
@@ -447,7 +463,7 @@ __alloc_range_bias(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -577,7 +593,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 
 err_undo:
 	if (tmp != order)
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -657,7 +673,7 @@ static int __alloc_range(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 
 err_free:
 	if (err == -ENOSPC && total_allocated_on_err) {
@@ -903,7 +919,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 
 			if (order-- == min_order) {
 				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
-				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
+				    !(flags & DRM_BUDDY_RANGE_ALLOCATION)) {
 					/*
 					 * Try contiguous block allocation through
 					 * try harder method
@@ -912,6 +928,16 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 									 original_size,
 									 original_min_size,
 									 blocks);
+
+					/*
+					 * Defragment the freelist and try contiguous block
+					 * allocation
+					 */
+					drm_buddy_defrag(mm);
+					if (!IS_ERR(alloc_from_freelist(mm, min_order, flags)))
+						break;
+				}
+
 				err = -ENOSPC;
 				goto err_free;
 			}
-- 
2.25.1

