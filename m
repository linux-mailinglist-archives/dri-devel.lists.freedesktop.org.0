Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMxbKcAxcmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:18:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5D67CD8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717B210E09B;
	Thu, 22 Jan 2026 14:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j84baxiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F2310E09B;
 Thu, 22 Jan 2026 14:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRN5//29L3Xpl0Zkpv9kzUjsOZRhkpzY3rh1UDku27VqWHWIOXyrX3NlqUM+8naXuIPTB6xzs2tfgbSHxFCoN+b5hAi71VcOSMOBp0D8AZHI7IvUc3rWNr2WT6+n3+lQM+dlxM4aB+/l83fvoQ49/vNa3+AXc5giPh6060boYO3a7USgCSjSY8c0PMGlIITWCB7+QRkWV2hid9n23QDtrbVXfWxGyIrsXJlq6eOnvMvd3UmX9SmmbVkYBuit8da4XycK2tBr3x2xImLLzWlZsY7smGLrwj0JWd0NX/zao9HD+crbjCf+1I6oFybrfwMovCyjOd4r+yIaomMBh0ANTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTk9KVdEYgMjpMy9jj1159KcdfQZCTf9PHlyJVkLJsE=;
 b=kvR2SrTWBGIZZ2mfs9+i2V9UjUbpMkcIu5qmuqzluzTD68n8cG2c0qoKNToFIRKGk7OiHle10XqqyrnFnVNZVpshPy3sF0gQfR9IN2+axz207ge/OIQJ47X2scBg5xYtqv/MPTMVBN5nXeZVt/sskY1lhsbYs8g5s8AZjPsk4gmdM/4mODUYmzNUMXZ2vcv/Kl2Ma7O5I1mpT4ZjnBoSmE4iI9umtc644gpK9x+11Qu5ITxAkHg4RZF20xGWsL8tsF4d9iwe1IXRAU2LN9+abXCANkZl/nzR3mhB+A5twQJdC+OVKmAOIXYkjdGDWrTzuHAXseci9fHzCvFxxICGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTk9KVdEYgMjpMy9jj1159KcdfQZCTf9PHlyJVkLJsE=;
 b=j84baxiukBzMJ5WKfP1QFtzuvFj/aPXI6lOWFSU55YByP4sAO0IK1oYVLGgsozkK+8dinZRY8GvTm4wK+GRlIv3BXK6J2/nbonA+82nXx5uA5Y0ENQM7YI8CJ1f0rZ196/MlDVhBdNNWvC+EpqrWWzjkpgwWY2VAMwnMmehK9Uk=
Received: from SJ0PR03CA0374.namprd03.prod.outlook.com (2603:10b6:a03:3a1::19)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.10; Thu, 22 Jan 2026 14:18:29 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::56) by SJ0PR03CA0374.outlook.office365.com
 (2603:10b6:a03:3a1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 14:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 14:18:29 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 08:18:26 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 1/2] drm/buddy: Improve offset-aligned allocation handling
Date: Thu, 22 Jan 2026 19:48:04 +0530
Message-ID: <20260122141805.6678-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1a1a9b-dec1-4c95-e278-08de59c11d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGhaOWJuRjJJMnRoKzRYMTllL2EvR1NhcUxGank1ZlFtbUtod1dzUjRRc0F1?=
 =?utf-8?B?T0daVDZPMHVoV2p2N3VzTURkNVZ2T1oxMW43RTcrZ2t2Mk1oY2EyUk9yQWgr?=
 =?utf-8?B?eWpJbVNWUlZ1VHQ0ejBXYTVlb0lWdmQ5bDI2TzF3MzV1Tk93dGpoeGlnSWpY?=
 =?utf-8?B?V2llVm1PN09LeUhkY1FBOGZQU3o4OVE4aGNjRUF6YjhtQ0phMEhhaDI3eW9K?=
 =?utf-8?B?alRQbHZudU9BS0hwaml1dnhhWVRNcDd4d2FaaktjNldCVWowd3Z1TjQreERs?=
 =?utf-8?B?M2JXYWh2UWk1U3JUVEl4RXZzM0JoeXVxZnpxVlN0ZFpmakpmc2pldis1M0JI?=
 =?utf-8?B?b2djOWROQTREMDRHY08zT2tXd1E0SmNmaHF5OVVJenR0Q0tMUEk2T3VKNHFH?=
 =?utf-8?B?ZnJZZkFsOHFpRlIvcVYvMnIyakZycDFtK0prNktqTmZEUzVtazI4Y2lkMi83?=
 =?utf-8?B?UWd0Qkp6NXdLeXpjS2VqNVNEWlM4ZzFHUDAreFBweEloZlJNMGZYR2tWTTZ3?=
 =?utf-8?B?TjV1TTdLbks1NGFxaHprUHVLVWN2aUR0V0tLd0txaEI4SE1VcVM2UnZlUmFv?=
 =?utf-8?B?blE1eEZNYXpPSjBLUnBXUnIrVlY2S2hWSDh5cjYwWmtZb0dYNWFoQnZpTUhH?=
 =?utf-8?B?dUVHKzdHN0hndFl2YVhTMzdXeVljV1BzQVVRMzlLdkR1NEJhdU5NVko3VzFB?=
 =?utf-8?B?NUwvbE9NS2FCY2JDN2grTHcydW1LcnlMWnBkWVU5LzVmNDlYaWo1R2tjUHE0?=
 =?utf-8?B?bjFubWZab1JhSDZselVWZ3FPcmlYNWtxRGFTcm9VczlLeGxtNGhBRkFZRXE1?=
 =?utf-8?B?amlrRGFLRndzREVEMWdaZDVjeUQyS0w5TFJtZVA1OTMvY2VMYTNJY1ZUdnN2?=
 =?utf-8?B?NUdrOTR6L3ZTYzVsRGRqNjFSMUZOd20wR1NEVUlmY1pBYWRVWXdvS0RNZVph?=
 =?utf-8?B?ZTZ5eDBhK2psS2ZsZ0V3alNrd3dyTzVINU83SjRPVEh5N2p5S1AxZG5PZFZw?=
 =?utf-8?B?U0NlV2liblRVK0xaZnI3M0k2dkkwbzVVME1mWDJUdDJoMThPM09xVUZsQktP?=
 =?utf-8?B?ait4L2Y0YU43L2s1OG5MWnB3RVpBY3R2dmJ3SW5CK0hEd05NOVA1WjFhc2JK?=
 =?utf-8?B?bStwenN6WDhOMTdtQ2x0eHVPOHFSUndnUVhLZzB3VnZRM3Q3OVBXTGcwQ1pw?=
 =?utf-8?B?OTZ3aFh2SHJIRnlaakErMWQ0d1JQWU5LdlhvWmliNUxFMnZIU2wzNnpZa2t3?=
 =?utf-8?B?M1hhNlg5NjJIN1k2UEw1T3liaUNHOTdkc01iTXJidFRJMkQwLzMyblJoMG1l?=
 =?utf-8?B?K05JSHk4a0pqdk1ZRVJ5a3N5OVJPelJ2dWx5SXhuc3ViMWlxR0xEZ24xa0xn?=
 =?utf-8?B?SVdpSk9DbkJCRHVnVnR0cDJDV09YZkxmc0MwN2xCb212OUJ1ZWxyL3hLOGl1?=
 =?utf-8?B?VHh1SUtyUlhiRm4xaVIvVXJ5RE9wRTJuZ3IxVVJGNnkzZHJSeEc1MkpJZ2NP?=
 =?utf-8?B?YVhJMVR2TFZGczFHNUl5QXgyc3JrWFVMdVJxYmpBSkh2dmZwSGdrU2ZIRUJp?=
 =?utf-8?B?RTIwM0ZSbEorMDZxS3JGczEzckdpa2lmdk4vMFpCeGFEMHpRM1Y0Y3grZzgv?=
 =?utf-8?B?N3RpUlZ6NGdQTm1EUklIQ3hHWXRoM3AvTG0zQVpTV0RjTFVqYWFiVUdScXYr?=
 =?utf-8?B?RFQ3SHg2bzhlYnZyd1hiWEVpTlFTYlNvejhLdXlDUWFkcURJdXA5UkZGWGgz?=
 =?utf-8?B?bTk0aUZBYklwaXlienU1T0dYMmNMRmo3R0VDT0lOMkkybnl1VVBWVEc1VFFS?=
 =?utf-8?B?aUhvMEhGOHRmUVp0UXZjSlg4SFNJb3ErRkhXbnJyU1RWRzVGSDJyaHFUWlp3?=
 =?utf-8?B?b3YrYkZMZm9jMEtkTFExbUJSQnRLaGJoTEhLS1FHT3lPQWdzYkF0bG1hNC9l?=
 =?utf-8?B?bXFPWHRkWEc1UUNrNHFpQ3phcmhwQytGa01OZS9PVmVpbDFmV1d1RlhVYVJQ?=
 =?utf-8?B?N2pGMG1hRHNZWFFIOFRUaHh5Z0twWEhaeTl3c1ZNbUVrTDUrRXVyTDUweHpO?=
 =?utf-8?B?N1VCYWc5V1g1eUpDRVN2MTRqclVnNUFubHVqV25DVGxZNThXUGllUUZlTTZP?=
 =?utf-8?B?ZmplVmNkU3dWQmxyTlVLcWdGemhtdjVMMHFIN1FQVHNSeHplZ1VtSTBuaitj?=
 =?utf-8?B?aHlQNHdySGpaYU9qZEFsSy9Nd0RST0NGVy8xS2o4N3lvcmkzQ1Q4QWtUYW43?=
 =?utf-8?B?ME1tV1JVMFd4UGlMTGNEZC9uMmJnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:18:29.1024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1a1a9b-dec1-4c95-e278-08de59c11d86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Arunpravin.PaneerSelvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: EFC5D67CD8
X-Rspamd-Action: no action

Large alignment requests previously forced the buddy allocator to search by
alignment order, which often caused higher-order free blocks to be split even
when a suitably aligned smaller region already existed within them. This led
to excessive fragmentation, especially for workloads requesting small sizes
with large alignment constraints.

This change prioritizes the requested allocation size during the search and
uses an augmented RB-tree field (subtree_max_alignment) to efficiently locate
free blocks that satisfy both size and offset-alignment requirements. As a
result, the allocator can directly select an aligned sub-region without
splitting larger blocks unnecessarily.

A practical example is the VKCTS test
dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which repeatedly
allocates 8 KiB buffers with a 256 KiB alignment. Previously, such allocations
caused large blocks to be split aggressively, despite smaller aligned regions
being sufficient. With this change, those aligned regions are reused directly,
significantly reducing fragmentation.

This improvement is visible in the amdgpu VRAM buddy allocator state
(/sys/kernel/debug/dri/1/amdgpu_vram_mm). After the change, higher-order blocks
are preserved and the number of low-order fragments is substantially reduced.

Before:
  order- 5 free: 1936 MiB, blocks: 15490
  order- 4 free:  967 MiB, blocks: 15486
  order- 3 free:  483 MiB, blocks: 15485
  order- 2 free:  241 MiB, blocks: 15486
  order- 1 free:  241 MiB, blocks: 30948

After:
  order- 5 free:  493 MiB, blocks:  3949
  order- 4 free:  246 MiB, blocks:  3949
  order- 3 free:  123 MiB, blocks:  3947
  order- 2 free:   61 MiB, blocks:  3949
  order- 1 free:   61 MiB, blocks:  7878

By avoiding unnecessary splits, this change improves allocator efficiency and
helps maintain larger contiguous free regions under heavy offset-aligned
allocation workloads.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 261 +++++++++++++++++++++++++++++-------
 include/drm/drm_buddy.h     |   3 +
 2 files changed, 219 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f2c92902e4a3..285757a151d1 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -23,6 +23,16 @@ static struct kmem_cache *slab_blocks;
 #define for_each_free_tree(tree) \
 	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
 
+static unsigned int drm_buddy_block_offset_alignment(struct drm_buddy_block *block)
+{
+	return __ffs(drm_buddy_block_offset(block));
+}
+
+RB_DECLARE_CALLBACKS_MAX(static, drm_buddy_augment_cb,
+			 struct drm_buddy_block, rb,
+			 unsigned int, subtree_max_alignment,
+			 drm_buddy_block_offset_alignment);
+
 static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 					       struct drm_buddy_block *parent,
 					       unsigned int order,
@@ -40,6 +50,9 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 	block->header |= order;
 	block->parent = parent;
 
+	block->subtree_max_alignment =
+		drm_buddy_block_offset_alignment(block);
+
 	RB_CLEAR_NODE(&block->rb);
 
 	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
@@ -76,26 +89,32 @@ static bool rbtree_is_empty(struct rb_root *root)
 	return RB_EMPTY_ROOT(root);
 }
 
-static bool drm_buddy_block_offset_less(const struct drm_buddy_block *block,
-					const struct drm_buddy_block *node)
-{
-	return drm_buddy_block_offset(block) < drm_buddy_block_offset(node);
-}
-
-static bool rbtree_block_offset_less(struct rb_node *block,
-				     const struct rb_node *node)
-{
-	return drm_buddy_block_offset_less(rbtree_get_free_block(block),
-					   rbtree_get_free_block(node));
-}
-
 static void rbtree_insert(struct drm_buddy *mm,
 			  struct drm_buddy_block *block,
 			  enum drm_buddy_free_tree tree)
 {
-	rb_add(&block->rb,
-	       &mm->free_trees[tree][drm_buddy_block_order(block)],
-	       rbtree_block_offset_less);
+	struct rb_node **link, *parent = NULL;
+	struct drm_buddy_block *node;
+	struct rb_root *root;
+	unsigned int order;
+
+	order = drm_buddy_block_order(block);
+
+	root = &mm->free_trees[tree][order];
+	link = &root->rb_node;
+
+	while (*link) {
+		parent = *link;
+		node = rbtree_get_free_block(parent);
+
+		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
+			link = &parent->rb_left;
+		else
+			link = &parent->rb_right;
+	}
+
+	rb_link_node(&block->rb, parent, link);
+	rb_insert_augmented(&block->rb, root, &drm_buddy_augment_cb);
 }
 
 static void rbtree_remove(struct drm_buddy *mm,
@@ -108,7 +127,7 @@ static void rbtree_remove(struct drm_buddy *mm,
 	tree = get_block_tree(block);
 	root = &mm->free_trees[tree][order];
 
-	rb_erase(&block->rb, root);
+	rb_erase_augmented(&block->rb, root, &drm_buddy_augment_cb);
 	RB_CLEAR_NODE(&block->rb);
 }
 
@@ -798,6 +817,132 @@ alloc_from_freetree(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static bool
+drm_buddy_can_offset_align(u64 size, u64 min_block_size)
+{
+	return size < min_block_size && is_power_of_2(size);
+}
+
+static bool drm_buddy_subtree_can_satisfy(struct rb_node *node,
+					  unsigned int alignment)
+{
+	struct drm_buddy_block *block;
+
+	if (!node)
+		return false;
+
+	block = rbtree_get_free_block(node);
+	return block->subtree_max_alignment >= alignment;
+}
+
+static struct drm_buddy_block *
+drm_buddy_find_block_aligned(struct drm_buddy *mm,
+			     enum drm_buddy_free_tree tree,
+			     unsigned int order,
+			     unsigned int tmp,
+			     unsigned int alignment,
+			     unsigned long flags)
+{
+	struct rb_root *root = &mm->free_trees[tree][tmp];
+	struct rb_node *rb = root->rb_node;
+
+	while (rb) {
+		struct drm_buddy_block *block = rbtree_get_free_block(rb);
+		struct rb_node *left_node = rb->rb_left, *right_node = rb->rb_right;
+
+		if (right_node) {
+			if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
+				rb = right_node;
+				continue;
+			}
+		}
+
+		if (drm_buddy_block_order(block) >= order &&
+		    __ffs(drm_buddy_block_offset(block)) >= alignment)
+			return block;
+
+		if (left_node) {
+			if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
+				rb = left_node;
+				continue;
+			}
+		}
+
+		break;
+	}
+
+	return NULL;
+}
+
+static struct drm_buddy_block *
+drm_buddy_offset_aligned_allocation(struct drm_buddy *mm,
+				    u64 size,
+				    u64 min_block_size,
+				    unsigned long flags)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int order, tmp, alignment;
+	struct drm_buddy_block *buddy;
+	enum drm_buddy_free_tree tree;
+	unsigned long pages;
+	int err;
+
+	alignment = ilog2(min_block_size);
+	pages = size >> ilog2(mm->chunk_size);
+	order = fls(pages) - 1;
+
+	tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
+		DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
+
+	for (tmp = order; tmp <= mm->max_order; ++tmp) {
+		block = drm_buddy_find_block_aligned(mm, tree, order,
+						     tmp, alignment, flags);
+		if (!block) {
+			tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
+				DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
+			block = drm_buddy_find_block_aligned(mm, tree, order,
+							     tmp, alignment, flags);
+		}
+
+		if (block)
+			break;
+	}
+
+	if (!block)
+		return ERR_PTR(-ENOSPC);
+
+	while (drm_buddy_block_order(block) > order) {
+		struct drm_buddy_block *left, *right;
+
+		err = split_block(mm, block);
+		if (unlikely(err))
+			goto err_undo;
+
+		left  = block->left;
+		right = block->right;
+
+		if (__ffs(drm_buddy_block_offset(right)) >= alignment)
+			block = right;
+		else
+			block = left;
+	}
+
+	return block;
+
+err_undo:
+	/*
+	 * We really don't want to leave around a bunch of split blocks, since
+	 * bigger is better, so make sure we merge everything back before we
+	 * free the allocated blocks.
+	 */
+	buddy = __get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block, false);
+	return ERR_PTR(err);
+}
+
 static int __alloc_range(struct drm_buddy *mm,
 			 struct list_head *dfs,
 			 u64 start, u64 size,
@@ -1067,6 +1212,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
 static struct drm_buddy_block *
 __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			 u64 start, u64 end,
+			 u64 size, u64 min_block_size,
 			 unsigned int order,
 			 unsigned long flags)
 {
@@ -1074,6 +1220,11 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		/* Allocate traversing within the range */
 		return  __drm_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
+	else if (size < min_block_size)
+		/* Allocate from an offset-aligned region without size rounding */
+		return drm_buddy_offset_aligned_allocation(mm, size,
+							   min_block_size,
+							   flags);
 	else
 		/* Allocate from freetree */
 		return alloc_from_freetree(mm, order, flags);
@@ -1145,8 +1296,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) {
 		size = roundup_pow_of_two(size);
 		min_block_size = size;
-	/* Align size value to min_block_size */
-	} else if (!IS_ALIGNED(size, min_block_size)) {
+	/*
+	 * Normalize the requested size to min_block_size for regular allocations.
+	 * Offset-aligned allocations intentionally skip size rounding.
+	 */
+	} else if (!drm_buddy_can_offset_align(size, min_block_size)) {
 		size = round_up(size, min_block_size);
 	}
 
@@ -1157,43 +1311,60 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	do {
 		order = min(order, (unsigned int)fls(pages) - 1);
 		BUG_ON(order > mm->max_order);
-		BUG_ON(order < min_order);
+		/*
+		 * Regular allocations must not allocate blocks smaller than min_block_size.
+		 * Offset-aligned allocations deliberately bypass this constraint.
+		 */
+		BUG_ON(size >= min_block_size && order < min_order);
 
 		do {
+			unsigned int fallback_order;
+
 			block = __drm_buddy_alloc_blocks(mm, start,
 							 end,
+							 size,
+							 min_block_size,
 							 order,
 							 flags);
 			if (!IS_ERR(block))
 				break;
 
-			if (order-- == min_order) {
-				/* Try allocation through force merge method */
-				if (mm->clear_avail &&
-				    !__force_merge(mm, start, end, min_order)) {
-					block = __drm_buddy_alloc_blocks(mm, start,
-									 end,
-									 min_order,
-									 flags);
-					if (!IS_ERR(block)) {
-						order = min_order;
-						break;
-					}
-				}
+			if (size < min_block_size) {
+				fallback_order = order;
+			} else if (order == min_order) {
+				fallback_order = min_order;
+			} else {
+				order--;
+				continue;
+			}
 
-				/*
-				 * Try contiguous block allocation through
-				 * try harder method.
-				 */
-				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
-				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
-					return __alloc_contig_try_harder(mm,
-									 original_size,
-									 original_min_size,
-									 blocks);
-				err = -ENOSPC;
-				goto err_free;
+			/* Try allocation through force merge method */
+			if (mm->clear_avail &&
+			    !__force_merge(mm, start, end, fallback_order)) {
+				block = __drm_buddy_alloc_blocks(mm, start,
+								 end,
+								 size,
+								 min_block_size,
+								 fallback_order,
+								 flags);
+				if (!IS_ERR(block)) {
+					order = fallback_order;
+					break;
+				}
 			}
+
+			/*
+			 * Try contiguous block allocation through
+			 * try harder method.
+			 */
+			if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
+			    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
+				return __alloc_contig_try_harder(mm,
+								 original_size,
+								 original_min_size,
+								 blocks);
+			err = -ENOSPC;
+			goto err_free;
 		} while (1);
 
 		mark_allocated(mm, block);
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index d7891d08f67a..da6a40fb4763 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/rbtree.h>
+#include <linux/rbtree_augmented.h>
 
 #include <drm/drm_print.h>
 
@@ -60,6 +61,8 @@ struct drm_buddy_block {
 	};
 
 	struct list_head tmp_link;
+
+	unsigned int subtree_max_alignment;
 };
 
 /* Order-zero must be at least SZ_4K */
-- 
2.34.1

