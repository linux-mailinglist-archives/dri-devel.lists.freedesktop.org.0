Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF3B47F8E7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 21:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6C710F22C;
	Sun, 26 Dec 2021 20:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAAE10F22B;
 Sun, 26 Dec 2021 20:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZKffx+SvpMgyOplUw1lO1wJJ1MA7zxcDsqqTJrIx5h/Q0WGvlpE9hD8WzhV+rbUKZKIoOUYI0fMyO5g0z7eA9XOgx6kqcs8bKtiHJrcxEml3GUvxn5QRpaqLQXirRQVu+vqDJJVv84R7wXW+anbuD1eHSg2vzWurH8ATXRUKblwkw6ydx1JzQ1GDbaiO0Ya4t5cCnQbJbtG1fMXztYqJH7xpQWkAA22eK3y7vAGGLhvXxFQLqcPhFecfjT6cMUZCXh8P5rugPoh6gAQYhH2Th448bsyPxzaZWOr1/aKk68jQ8jcI+o6fhGMjV8OEVFLbOsoGKJ4dtXAse8Ens/HqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA46zzUf+lgx7eMZf/MDolJWw5Sn4vy055ACOawN8Cg=;
 b=K/T/LC0Aabeq4RKdsze0TR9EcXd7PcKkPpFO1QJ7jkRRfanqomBJgiukyJwrwsn/K5YQ//s1tP4reLPmIt6eNLN961jQ9NfnrwuU3bWHmEMFmao0WXPkXD/NetfHWx3bPvt/OsHTNHp8sQv4lkMzj9HBj5lNUnR502dVH+hg7smxJ0TFU4WnKMDUaezjJmkURcXi7Hnd5P/RtstYq1kFW96H1B0b9A0kkC9Yy0UzzyFO8QJNxqXuTsAdm1yPgHO3QsME34oG7CAtBi6IrUraH2mmtVx2R2wHePITpcZrrCgBGPRdlGZqfBXtakz6ncgt6O12PjoEVzKHgYinYLPuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA46zzUf+lgx7eMZf/MDolJWw5Sn4vy055ACOawN8Cg=;
 b=Nlk1YZxLfWT2syN9pYBRFFuDhwauOvxLs89iaW3oX0oLyde5wKpTQyo32VDnDvdqea3hJtX5ix7FcP8/4v+vqb2RoVApTbzYFO24brG5ufldkkgvW8irAUCNZaL/y1LdPqccq+aDYdrycFMLHceyPC3OuXpEBQs23BuQYsTKC00=
Received: from MW4PR04CA0032.namprd04.prod.outlook.com (2603:10b6:303:6a::7)
 by MWHPR12MB1373.namprd12.prod.outlook.com (2603:10b6:300:14::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Sun, 26 Dec
 2021 20:53:28 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::9f) by MW4PR04CA0032.outlook.office365.com
 (2603:10b6:303:6a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Sun, 26 Dec 2021 20:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Sun, 26 Dec 2021 20:53:27 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 14:53:24 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 4/6] drm: implement a method to free unused pages
Date: Mon, 27 Dec 2021 02:22:33 +0530
Message-ID: <20211226205235.142049-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226205235.142049-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211226205235.142049-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea9336f7-d6c4-41c7-1a49-08d9c8b1c487
X-MS-TrafficTypeDiagnostic: MWHPR12MB1373:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB137325A39CB6F5585CCF721BE4419@MWHPR12MB1373.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: baEpzklVmFChG5W4W4Zzj0vpfJPb/Pkr+XmFyYwZm/AaB9j/SYKn2+HiAd+ZNDNUrwBbbX+qYnytjH3FDXZaSelShg5SMlR3P15pdcn1NdKHSo14lTdSoOWll7albSdwV5/xn8CaluZVrU6m4Ro1tHrC6qnKMgK9s556AhyIuVhDVjlXk6gLdNWtjtF5eRdi0B53cTMc2wFIRErgA+EB+iRD8rPbhPwIb6Y+U3V0UsE5VQp44ZixVPA2w25yIJEb8eaterT7p+95hlrWhj8fvfyJgfnTo3TOWdpQ33TRqtGxGEye1TDZK6encmETt8O87ejY/H8kcNnfhNzA+lIzoGWhQmGME0/lDX6AQ6ZJVPEGJxh8yJvCv5SxSet+2qt7fmqrjnjT8x8Dsm26yGaE1jXGmuLuGvhG87x/YyRyykNmXXqimj9tLfr7aBHDlaHcVlJ7rL0vYrdT9fqlkyeCM6eiq1K86agpjBw84vwGItii4VHXGqONIdZ02aS/IwKiurc5B95Wfiwqk8B4PHfbOdDC5riZ0d0ZMfFPdyFaoTxgPUwBiCXU2NKKwod8KbDvKCH4sY2arA43jLkcLun8S0mETKXvtX9Rs+3ClBh7wsNDu7TIXT0TcD8IDyc6wni3BhC3a1PFWUxZRzbdeswUZx9wMjSGMOVIACo5G8dVPcLoTrZuVDParVwq9xXFH+OOJSUhP5Euu4hAQLEn0hM9nLHZYGJCfABvGVko9Wt2q2T02vg90k7yC/nMGBMrYt2H9xPQErgQS/967GpXPXebt8LVJhqVLdl38JRKgB8xO4E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(5660300002)(4326008)(36860700001)(356005)(54906003)(47076005)(8676002)(8936002)(110136005)(2616005)(6666004)(1076003)(26005)(36756003)(86362001)(336012)(426003)(186003)(70586007)(16526019)(83380400001)(70206006)(40460700001)(82310400004)(81166007)(2906002)(316002)(7696005)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2021 20:53:27.9872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9336f7-d6c4-41c7-1a49-08d9c8b1c487
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1373
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

