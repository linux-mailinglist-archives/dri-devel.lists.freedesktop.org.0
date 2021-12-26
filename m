Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D900C47F953
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 23:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F99510F5D9;
	Sun, 26 Dec 2021 22:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2088.outbound.protection.outlook.com [40.107.101.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B581410F5D2;
 Sun, 26 Dec 2021 22:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aemeF/oTLEKcurQ7Q8NFzFP3zbYTTMbZqPLIGq3Y+vOapXmpjRDKVTCTdKMYF28yixORyurhMhAZJDQxBfAYnj58O61NL+EkVU7m3M3Ik0D/4g624qTu5qGP8K63ykpXAifucpxyrYVMWC2rMGyMeVP6cZVlBtoKZY8RnVPSIf/t/vvic9aq8Ulu6Y5sj+Og1lVyhHuddzOqvrjfWBJxglynksvpGgR9hJD7UIQ2ReJW8L82iR6bLC0GDv6hp2+C0xKmJz00J148WIE8omDy5C6zrc0eVY3PcGQ1j2Z52kMxtEIwaNHA+fyL4g22soRZ5I5u+uV0FdciHMwF+2+R0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA46zzUf+lgx7eMZf/MDolJWw5Sn4vy055ACOawN8Cg=;
 b=ZzobuZlVUxmH7aLvLa1R4xc71qmnylxugKI02jlrIV7TBmnhZF/WAk8ZpxLwdJpiP9I8GAXzpyJx5Qt3ArvbzGCZmQVsW4tbNQgtuD6u4eG5E+1I0jW1XEbuvz03xm/N6uVVZcfWtVYmUwRGjeF+eX5wS6AxDnZ0cQPcx7cEP4zLSGdkD2vdbjboi+eaVRykMOVir+qeHY/c40MfviM5txxccgeKd9wUVeBRRZDi2ynmKfzXk1B/8KI8P3sm2JYwccxOEolI7uR5d/S2R6RZb5FMfkgG+cfp3tPHW3GJ8966sZXG5dZH2R8taMP1PTezOZhQxJcifrXZ9jy4CFbUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA46zzUf+lgx7eMZf/MDolJWw5Sn4vy055ACOawN8Cg=;
 b=EfZ4YvYsxMf9kPvIJanncXUJSeMw1W8eJEgDlF92IVoX7TdUX6ivzK7ccL0BOD7f+APLjd1JEVoF6DuZDdabbkZH/y6T+mtHmTxr6STBuOC7/6ss25Asw9+NwzBcDatB+XSrvZ/1d6B6fKtAzSb8Ahg0TXIXqHWCQFYx2wVDOVM=
Received: from DM5PR16CA0028.namprd16.prod.outlook.com (2603:10b6:4:15::14) by
 CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Sun, 26 Dec 2021 22:25:13 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::44) by DM5PR16CA0028.outlook.office365.com
 (2603:10b6:4:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Sun, 26 Dec 2021 22:25:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Sun, 26 Dec 2021 22:25:13 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 16:25:10 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 4/6] drm: implement a method to free unused pages
Date: Mon, 27 Dec 2021 03:54:23 +0530
Message-ID: <20211226222425.544863-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 156a662e-9dad-4370-5b71-08d9c8be9617
X-MS-TrafficTypeDiagnostic: CH2PR12MB4149:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB414921373C9818812F2C60EAE4419@CH2PR12MB4149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvMONzLGpeU55aYqF0tpMeiiaHCTN8h6rVbXX5F85kzov+oANFzCdaKOus7kp5pRfHU7Ln6OlZzqOfjnPcV8lXCUgwg17ilzr6y6UpqBYaiZFmQT4oQyf0o/fuLaBEUeUpk7fvKobw3nCoHMKf9C26iDz3lDcloqPt99+h5/OCrRy4PuHNPcWZqJljD+shgUxMWZvI9MTdxCcPt0sBDvMB1k5bxypkoGDFtKK5csAL9bQz9zma7Q++LKk1lAYAoDRdd5yvvoTr47lwGGZPwVL9U4euLQxiNhtrnUlikDBOtyLak0fbvhyMK0fAGbK/ShZSTMqwDUFDaG6feJUc2TFFqhObwC0VQ1YmKnbwVhZClkU9az8UE1SfL1iI4ahLxsikNfcuZPNsnu7F31xAMxjRV2OR/dVTliHc/XIQO3sYis+KZF5GTnmld1nzheGvKzegMivOrR9tExP1NsiymFy//PoysHJSqVezwGqbKHIFCuUpYVLragenn0zPMI2am6rIkkLz5TWJ2finki3N8aIftFodFfQXo4l/CiB2JfD+WQVWTo7VMeVNzZ1InBTVCitsDfYfHqSII3qSe/oP5jD95RWlT/VE65vQF5eU6Msz7FFYXua+tBnqu7PgXMjoLLlzMNeLpzy72uuZlE4uSMR2xsk4Wnz/Mt6TbkL83hdmtELqLWLLAhlyNgjgqsT65AsJn3EzaHJBTYp4a6gTTMZ9q4XDiYmomSgelqPTJAR2dmcQD28XwU5l1wxS6PvWQTdts8NkFgI7M2x4jF+bhp6S+OPQ9/cvl+Alw703Gqjn0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(6666004)(5660300002)(426003)(508600001)(40460700001)(7696005)(47076005)(2616005)(316002)(8936002)(83380400001)(356005)(16526019)(336012)(82310400004)(54906003)(86362001)(1076003)(110136005)(36860700001)(8676002)(186003)(70206006)(81166007)(2906002)(70586007)(26005)(36756003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2021 22:25:13.5996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 156a662e-9dad-4370-5b71-08d9c8be9617
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149
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

On contiguous allocation, we round up the size
to the *next* power of 2, implement a function
to free the unused pages after the newly allocate block.

v2(Matthew Auld):
  - replace function name 'drm_buddy_free_unused_pages' with
    drm_buddy_block_trim
  - replace input argument name 'actual_size' with 'new_size'
  - add more validation checks for input arguments
  - add overlaps check to avoid needless searching and splitting
  - merged the below patch to see the feature in action
     - add free unused pages support to i915 driver
  - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
    are all globally visible

v3(Matthew Auld):
  - remove trim method error handling as we address the failure case
    at drm_buddy_block_trim() function

v4:
  - in case of trim, at __alloc_range() split_block failure path
    marks the block as free and removes it from the original list,
    potentially also freeing it, to overcome this problem, we turn
    the drm_buddy_block_trim() input node into a temporary node to
    prevent recursively freeing itself, but still retain the
    un-splitting/freeing of the other nodes(Matthew Auld)

  - modify the drm_buddy_block_trim() function return type

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 61 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  8 +++
 include/drm/drm_buddy.h                       |  4 ++
 3 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index eddc1eeda02e..855afcaf7edd 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -538,6 +538,67 @@ static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 	return __alloc_range(mm, &dfs, start, size, blocks);
 }
 
+/**
+ * drm_buddy_block_trim - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @new_size: original size requested
+ * @blocks: output list head to add allocated blocks
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and it can be freed.
+ */
+void drm_buddy_block_trim(struct drm_buddy_mm *mm,
+			  u64 new_size,
+			  struct list_head *blocks)
+{
+	struct drm_buddy_block *parent;
+	struct drm_buddy_block *block;
+	LIST_HEAD(dfs);
+	u64 new_start;
+	int err;
+
+	if (!list_is_singular(blocks))
+		return;
+
+	block = list_first_entry(blocks,
+				 struct drm_buddy_block,
+				 link);
+
+	if (!drm_buddy_block_is_allocated(block))
+		return;
+
+	if (new_size > drm_buddy_block_size(mm, block))
+		return;
+
+	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
+		return;
+
+	if (new_size == drm_buddy_block_size(mm, block))
+		return;
+
+	list_del(&block->link);
+	mark_free(mm, block);
+	mm->avail += drm_buddy_block_size(mm, block);
+
+	/* Prevent recursively freeing this node */
+	parent = block->parent;
+	block->parent = NULL;
+
+	new_start = drm_buddy_block_offset(block);
+	list_add(&block->tmp_link, &dfs);
+	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
+	if (err) {
+		mark_allocated(block);
+		mm->avail -= drm_buddy_block_size(mm, block);
+		list_add(&block->link, blocks);
+	}
+
+	block->parent = parent;
+}
+EXPORT_SYMBOL(drm_buddy_block_trim);
+
 /**
  * drm_buddy_alloc - allocate power-of-two blocks
  *
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 7c58efb60dba..05f924f32e96 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -97,6 +97,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		mutex_lock(&bman->lock);
+		drm_buddy_block_trim(mm,
+				(u64)n_pages << PAGE_SHIFT,
+				&bman_res->blocks);
+		mutex_unlock(&bman->lock);
+	}
+
 	*res = &bman_res->base;
 	return 0;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index f573b02304f4..703866a87939 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -146,6 +146,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 		    struct list_head *blocks,
 		    unsigned long flags);
 
+void drm_buddy_block_trim(struct drm_buddy_mm *mm,
+			  u64 new_size,
+			  struct list_head *blocks);
+
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
-- 
2.25.1

