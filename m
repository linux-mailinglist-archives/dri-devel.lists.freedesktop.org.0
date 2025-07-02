Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D452EAF5E2C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E396710E73E;
	Wed,  2 Jul 2025 16:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SIa2e93G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE38F10E73D;
 Wed,  2 Jul 2025 16:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLNVneX8HjZkm1mQ71NsGyQshIp5c9Fl2MGVdSGRGuAxa4oKpoWbe9c889yiA08L3Gp+BR69erx3uOqM1p79mWvFEe2AAIUlj69i1ed8nCO/SuT48idXZLR2XS1e795IC5A5p/YXgrfNh7YQFuJnOCcqu6p5hDufQ8F8Jlc6O+Evx8CibAO4WNTDjdSXntXmAujHh+T9ZTwb/G8TLfDQ5Wn4J1C2yoFkL5bRdwNSNLbkh7If/Shj48X59C2X+A0sjE6MEVdkdOYShvwkehqAOJgmsrBuQIwz7+VRgV7K5tAUULShQp9AlDNW0GcB52TGkKTFCtxUITO/IlKZPwr2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgDSJVhc+/W5LVX3K/iGY+J3F2lI8LWtPFYZt3Eij9w=;
 b=XZ0KXBMCezaT4zZj94lZ4oSC2vkjjpDs7kt6Qa58RAJrhgsz6K6WUCpiZB4X8UTq86iD2UuZKuZiWP6pNhtG5W/XjEhXtP4jCfDCAbWYcGl7zmpvnBc4Z6DUgwFVddDTY2UHmqWt3DaKr3CaXiitTuL1VUDrqe2gtjnPt5mo7KzFVOXINt3m8oP5xMv5AlsVZYb5fkyDsDEPVyYQzI4/Ue6l2+mReycJp84m4p2B8kgvm/4w0vf2SF4bI3oM8mDqXC20RmgOVzhS32JgaQs8CqDb5DRlvi98ZcztPTa/xmK6BbkvcGHVBTTC0dWelniLehykGCx89obX4yJb9H/+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgDSJVhc+/W5LVX3K/iGY+J3F2lI8LWtPFYZt3Eij9w=;
 b=SIa2e93GDOrnk9dldUIX8HsteYDMkk6TcqKKpzxvcEY8JUXMXCzZ7nKAkSknWWI+iE/ZZ4za4uJgFmWEGfDzrQMKcIkITnW+W4t+NgeoqUipxA5dMp7kmpu79Aq1cK/6AS6cJ+LVyXt9Ua4QDm8B/loUWg+1YJlfYcOBQjE6ff4=
Received: from CY5PR15CA0054.namprd15.prod.outlook.com (2603:10b6:930:1b::20)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 2 Jul
 2025 16:12:49 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::e8) by CY5PR15CA0054.outlook.office365.com
 (2603:10b6:930:1b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 16:12:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 16:12:48 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 11:12:45 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthew Auld
 <matthew.auld@intel.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/3] drm/buddy: add a flag to disable trimming of non
 cleared blocks
Date: Wed, 2 Jul 2025 18:12:02 +0200
Message-ID: <20250702161208.25188-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702161208.25188-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250702161208.25188-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: ce347b89-2b8b-4449-3184-08ddb98349d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rKZHtIJ6C4FpcmrkQuWuC6W4e4+WkZTzS8HKq3Iq/rcgcCSqVQuLbSl8j5mi?=
 =?us-ascii?Q?w1XrJBPWhM6azVMIDyhOPnjUFmzARYyrqe4XjfsIBUWQm7gSNtMq/qxmP7xD?=
 =?us-ascii?Q?/67v5k6LoUihzUa2OliWUHb40bI1sMMDqvzUAMDs+h14CdypC0ma2FYcKFVS?=
 =?us-ascii?Q?a2aUTHcpoJDNLRvszKUWGbDw3SLaDMzs/laWoyB+/ZZr3bGKn/H6Ja0FR9ep?=
 =?us-ascii?Q?jECpij0N9Rs5XGeOg/n6FuZj/M5OwlLX7w3s6uSTL86TZmNuqXMW6BAhfiPv?=
 =?us-ascii?Q?UA1RP4SN/9CIxmMDlji6yYKhd0PohlggnlhJRauDgR2OKc8wkfsbej1puT7f?=
 =?us-ascii?Q?nw5bpVxvXoEUei6tAPRznoTVz9dFzPSfWDLvgLn9VrKQRNg8Zw4pedDCMtUx?=
 =?us-ascii?Q?YX16C0ounrK1z2jX61vT4rjM1vU26BFmxRDaTzOmrPWiyB4usI+X2bsOaqg9?=
 =?us-ascii?Q?uwcWLG3OkpyxC/m3NzYpobbwBskjbZfboooAY4CQ9ILqyTU2YiEKoxkklP8H?=
 =?us-ascii?Q?fK9uSzqA78efEGuJVdEc4ohKB5CYC+/aZeKKHF89V4BegXiiZWE0zVBbUKpx?=
 =?us-ascii?Q?mqoJzPaSqHS6i6xZxXoQURRpjNlE+6hph1Lucx7Eo/B8ums1ysq108vClhvR?=
 =?us-ascii?Q?RW+7UJjAFR9xOb+QFFrhwh2MrYY3yKtBHeYuOroO1R9/pmy/BPIpwcWuMxKH?=
 =?us-ascii?Q?yRzEMI5j+dvCAIDX69GUNMea3/YHB04Cn/qotIHA/glWhzfh/WW5DfYrVhV0?=
 =?us-ascii?Q?5vIjKx/pcsSGs2M4Un5YRJFoab9eBOmWD1m05SR1oHhMk/hMCL/ZZhOi3CrU?=
 =?us-ascii?Q?CVfviAZ2viEErGutQQvtP8Kz9XKoYYUtVRdWmMFg8wSIjm6nMFS938LPUKFT?=
 =?us-ascii?Q?G/42fipdvxEyVxm9mPE2JTax0hFP9zXdUDrxEMXetrYhpPFMGDgCNb2MWi5q?=
 =?us-ascii?Q?pSI5cywlc8MzDbyGyrpI6jA82ff/AarGcs4dDEwtE3+9aDu77b5PtsX9WnWR?=
 =?us-ascii?Q?MmlcwpZTCtKbaFyKKVmwiGTI6nlb6JV2IjMQLxv1Zwj2HdaNV3Fh8FwcyNYc?=
 =?us-ascii?Q?2g8EsOr05ybckuyshUsI3iVckocOTAV2cEhAoPn2/+pT1Q4c0ZyrdEFbbmA1?=
 =?us-ascii?Q?l9/YlkNuwFbrWwt+9/p+9N415pnH10dEiz6m/x9VzQesefGglmnR+1qSA/5d?=
 =?us-ascii?Q?KlaQDrxh7rDhaqepP0JAVviP6vBT7JHjADdLKlK/mfP4tLHdnUabGag2G7kb?=
 =?us-ascii?Q?v/mYlrbebFJtKYQUPivZXckFsRxao+rzsEKwZ6S5RaGyYKIudK+YB9hZLQZ1?=
 =?us-ascii?Q?PIayoFIubUXeFRAijHEjE+jfGGyKVN6bymfYh0EFDtr1lp9X1ZWJNfbQvCJo?=
 =?us-ascii?Q?FkqOM8moad5Wue0cXanR3AZZV1GFqwjN7kFPy4Iks425DpJTpSkEKgNtBVfY?=
 =?us-ascii?Q?jTjniS2ORbQkEQVV9AuoepF5SRlj2sqsfqmliC094W3zRAAnzHbooactg3IE?=
 =?us-ascii?Q?V4ZA33YTDN89v4GvdFGvJs5yM6IZ65b2WhXn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:12:48.5779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce347b89-2b8b-4449-3184-08ddb98349d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156
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

A vkcts test case is triggering a case where the drm buddy allocator
wastes lots of memory and performs badly:

  dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000

For each memory pool type, the test will allocate 4000 8kB objects,
and then will release them. The alignment request is 256kB.

For each object, the allocator will select a 256kB block (to
match the alignment), and then trim it to 8kB, adding lots of free
entries to the free_lists of order 5 to 1.
On deallocation, none of these objects will be merged with their
buddy because their "clear status" is different: only the block
that was handed over to the driver might come back cleared.
Also since the test don't allocate much memory, the allocator don't
need to force the merge process so it will repeat the same logic
for each run.

As a result, after the first run (which takes about 6sec), the
freelists look like this:

   chunk_size: 4KiB, total: 16368MiB, free: 15354MiB, clear_free: 397MiB
   [...]
   order- 5 free:     1914 MiB, blocks: 15315
   order- 4 free:      957 MiB, blocks: 15325
   order- 3 free:      480 MiB, blocks: 15360
   order- 2 free:      239 MiB, blocks: 15347
   order- 1 free:      238 MiB, blocks: 30489

After the second run (19 sec):

   chunk_size: 4KiB, total: 16368MiB, free: 15374MiB, clear_free: 537MiB
   [...]
   order- 5 free:     3326 MiB, blocks: 26615
   order- 4 free:     1663 MiB, blocks: 26619
   order- 3 free:      833 MiB, blocks: 26659
   order- 2 free:      416 MiB, blocks: 26643
   order- 1 free:      414 MiB, blocks: 53071

list_insert_sorted is part of the problem here since it iterates
over the free_list to figure out where to insert the new blocks.

To fix this while keeping the clear tracking information, a new
bit is exposed to drivers, allowing them to disable trimming for
blocks that aren't "clear". This bit is used by amdgpu because
it always returns cleared memory to drm_buddy.

With this bit set, the "merge buddies on deallocation logic" can
work again, and the free_list are not growing indefinitely anymore.

So after a run we get:

   chunk_size: 4KiB, total: 16368MiB, free: 15306MiB, clear_free: 1734MiB
   [...]
   order- 5 free:        2 MiB, blocks: 17
   order- 4 free:        2 MiB, blocks: 35
   order- 3 free:        1 MiB, blocks: 41
   order- 2 free:      656 KiB, blocks: 41
   order- 1 free:      256 KiB, blocks: 32

The runtime is better (2 sec) and stable across multiple runs, and we
also see that the reported "clear_free" amount is larger than without
the patch.

Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 8 ++++++++
 drivers/gpu/drm/drm_buddy.c                  | 1 +
 include/drm/drm_buddy.h                      | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index abdc52b0895a..dbbaa15a973e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -499,6 +499,14 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
 	INIT_LIST_HEAD(&vres->blocks);
 
+	/* Trimming create smaller blocks that may never be given to the driver.
+	 * Such blocks won't be cleared until being seen by the driver, which might
+	 * never occur (for instance UMD might request large alignment) => in such
+	 * case, upon release of the block, the drm_buddy allocator won't merge them
+	 * back, because their clear status is different.
+	 */
+	vres->flags = DRM_BUDDY_TRIM_IF_CLEAR;
+
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a1e652b7631d..555c72abce4c 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -1092,6 +1092,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 
 	/* Trim the allocated block to the required size */
 	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
+	    (!(flags & DRM_BUDDY_TRIM_IF_CLEAR) || drm_buddy_block_is_clear(block)) &&
 	    original_size != size) {
 		struct list_head *trim_list;
 		LIST_HEAD(temp);
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9689a7c5dd36..c338d03028c3 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -28,6 +28,7 @@
 #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
 #define DRM_BUDDY_CLEARED			BIT(4)
 #define DRM_BUDDY_TRIM_DISABLE			BIT(5)
+#define DRM_BUDDY_TRIM_IF_CLEAR			BIT(6)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.43.0

