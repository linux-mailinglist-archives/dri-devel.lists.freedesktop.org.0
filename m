Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2DD84E458
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260A910E966;
	Thu,  8 Feb 2024 15:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BbAo5X1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F2810E95F;
 Thu,  8 Feb 2024 15:50:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYZuFUkAFemr6fOUF0eOa/G1hPozGz5bVa7uNRRpcQiBXJivGLvTP3IK+hpMWVy53c25IbGjFa+baTzty4ymA9NatsdO7sqHdhFce8Hoj2Y6QWD0/ywT6BK9YSbcjk3gubN7zZG+xRnaa7Kb/GkDZbYnbIjBrAOXAif3SHSxX+BW2zR5bJvvV9FVGpBneJ+smPFZhVujQNU/6+LfDLwEQOuJ1LH+6WweeJDujNjmEvlsa0vXaO2qtIEvo82dUqjdNL8Rkyxzdd/kxcJ/6U/uefNSTmAepM/FV8RYj1EedcXCd2ixLaVJhJU5vxCcJ3b/f12R/x1puGM42apKg9P5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hgM3DhoXd6/cqJsMx8lPIs0DRqvXqUuFAbBDkaX+m0=;
 b=B+TZQTTsBD7WRTfTJWcNvKiZH/K1wv7Y5IZ5rOynWXi4vwh1rd2OYwIGxetbArdumQMxalkl+896LsC6nJO5ZUQ99HvSNyh7H/qVnodL3FqI1PRU4UJOYMcKh8km4sLMTqV6JDfvOGg3uUZ6MKqe65WVSVin8BygT3UgcE12WRq0oaa90tjR0IDcokqN5w7NszmNJ73INhJbHrQTV//vylMHlvEnJDG3zcwVDyd+xHeGMKHE3AyagC0rPy9acj4egGPhik2eINo4RYvy2KRsNjmj5tLrko+xBjMY1rSSu3QPZrqD+auf+iwzGweTDCdA7q40QwPlj+Wc6IJRDeHe3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hgM3DhoXd6/cqJsMx8lPIs0DRqvXqUuFAbBDkaX+m0=;
 b=BbAo5X1+VqDkST3raLueEzDsgkDadY+nK4xcXOBNA6Irg+BCij+CoFfQj+9fSGoWm43os1FzY0XjtrTp3cXpkuZBFSFSKsQnvt7qs+4UA+KqO6cAMNvZwZD7hW39XYJxsE2tH3NeaZtF48BqJN0LG+4oaDQxsfWml4WA0Yp/nUA=
Received: from DM6PR21CA0025.namprd21.prod.outlook.com (2603:10b6:5:174::35)
 by PH0PR12MB7077.namprd12.prod.outlook.com (2603:10b6:510:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Thu, 8 Feb
 2024 15:50:29 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::55) by DM6PR21CA0025.outlook.office365.com
 (2603:10b6:5:174::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.8 via Frontend
 Transport; Thu, 8 Feb 2024 15:50:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 8 Feb 2024 15:50:28 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 8 Feb 2024 09:50:24 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <felix.kuehling@amd.com>,
 <mario.limonciello@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v6 3/3] drm/buddy: Add defragmentation support
Date: Thu, 8 Feb 2024 21:20:00 +0530
Message-ID: <20240208155000.339325-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|PH0PR12MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1859ba-ca86-42a1-fbb6-08dc28bdac78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tskz9LibgNdcv6AjkhRt8+UOP2J2NiJRH+E2nqjtJJd2xzXEH0TxbUlcmbD2lwGgy5oYauE7Jbh1bDB8PKaWChmjW5BWfB4l1HtXMT4OSyECkLvo3Y75ESDaMvr3/GajJQVwSrQFS9vobtySI/Jiwi+AQyd7qXDN/ibRnDME9zmG2sVXNqRFp7Yb7KnSKo9Aq0UVugmf/m3xeFaarlTwweTfhXUlXjrr7D05i5FHdlMbfNnFaOQTubip19reyRr9qF0TOIk9cODWZgBCAc8gr/mYGT83YfqC7X9Uy612VAFEs4eZL/LxDI8vyD6WYTnvTMj170LhhgO7QzSU1rIhED+fb3DSqPEvvxjgNi/ffq3g597X0+ykwPyEyU74leu6Z9p7vteSGAm7JkIBFBU59/rawp6yx3YwuhzWmqy2+yUZLauLawqOJLPlImsE8B2wvj+3Ba5CzmK3tV0FH9xUrDrEX5tZCLkG3GbgWDrCV1B1G2F0b4YI6/tEs0cR5RlTzeOCKRBhXkW2WlPMbOf12sfAnnY+Sg22EZhWsBgqhIXNQOIjkfLsrLZoEIlEpitsO4jx0uv3wE8A3KLm6HzcET4x/oV1sXgUh65PVNsqB34=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(86362001)(36756003)(478600001)(54906003)(1076003)(2616005)(16526019)(41300700001)(426003)(83380400001)(8676002)(70586007)(356005)(6666004)(7696005)(70206006)(8936002)(316002)(110136005)(81166007)(26005)(82740400003)(4326008)(2906002)(5660300002)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 15:50:28.4807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1859ba-ca86-42a1-fbb6-08dc28bdac78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7077
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function to support defragmentation.

v1: Defragment the memory beginning from min_order
    till the required memory space is available.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 67 +++++++++++++++++++++++++++++++------
 include/drm/drm_buddy.h     |  3 ++
 2 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 33ad0cfbd54c..fac423d2cb73 100644
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
 
@@ -304,8 +308,49 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 		block = parent;
 	}
 
+	order = drm_buddy_block_order(block);
 	mark_free(mm, block);
+
+	return order;
+}
+
+/**
+ * drm_buddy_defrag - Defragmentation routine
+ *
+ * @mm: DRM buddy manager
+ * @min_order: minimum order in the freelist to begin
+ * the defragmentation process
+ *
+ * Driver calls the defragmentation function when the
+ * requested memory allocation returns -ENOSPC.
+ */
+void drm_buddy_defrag(struct drm_buddy *mm,
+		      unsigned int min_order)
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
+EXPORT_SYMBOL(drm_buddy_defrag);
 
 /**
  * drm_buddy_free_block - free a block
@@ -321,7 +366,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
 	if (drm_buddy_block_is_clear(block))
 		mm->clear_avail += drm_buddy_block_size(mm, block);
 
-	__drm_buddy_free(mm, block);
+	__drm_buddy_free(mm, block, 0);
 }
 EXPORT_SYMBOL(drm_buddy_free_block);
 
@@ -470,7 +515,7 @@ __alloc_range_bias(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -588,7 +633,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 
 err_undo:
 	if (tmp != order)
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -668,7 +713,7 @@ static int __alloc_range(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 
 err_free:
 	if (err == -ENOSPC && total_allocated_on_err) {
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index d81c596dfa38..d0f63e7b5915 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -166,6 +166,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
 			 struct list_head *objects,
 			 unsigned int flags);
 
+void drm_buddy_defrag(struct drm_buddy *mm,
+		      unsigned int min_order);
+
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
 void drm_buddy_block_print(struct drm_buddy *mm,
 			   struct drm_buddy_block *block,
-- 
2.25.1

