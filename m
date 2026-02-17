Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yODJLbdTlGl3CgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:40:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEE14B81A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBCE10E247;
	Tue, 17 Feb 2026 11:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CcTuzzZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012037.outbound.protection.outlook.com
 [40.107.200.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6FF10E230;
 Tue, 17 Feb 2026 11:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWuniIQWNVaBz5XukZWBC58DdcXFBekSYFjctc7ZjHW4QcaFZb9buypytb1JZNiMnN8FwNpM2FXgdYBX3iYovlKM/V21H4pgGYeCsPhihwPFQdy1mmm+3CN1V37yNEC6t4XR6gctK/FeV9g1T5gL7bOag4SqOKB6ZPTmyOxmvAmXhJMQJSVpQEtmX8aEmGabZ9Qtttnen8cn+yRzxaYH00Rafbobv99swiSg1zmJhw302noXzpMrXbdNjG1uiyEoSb6uk967/GmdEWhmzxzkDDpM3Uj5BthJ8Av4eSkVIlEkbC0n6v7L3lFkv8s6/Mic0qn43fn+zF+d4fVfpGzZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDW+Pp86JxgKT3HjyYnyWzyID6/Qv+87XS7oXdI979M=;
 b=nRp4MwLcFzGljkGnZATRyY4gkAvO22OvxxbZAkUnVT2vqlq2OxUhVkl57bGRSd1hRDSvxlgMMQFD0A6VTZTdm1Mvxb/WL9ou4HX+xKOGp9Xzqt+EepDJvwo8cQhyfadYoFa5kfaM1x8kSUyQTaVIit0aG7mFVrEn4it/HiQDel0CR9IYWVSH8tr95DAdcsl4yYLgucjzlvUpaqPHJubVLIs8IJfQHMu4J3tGtZ2PXQtBLy/yf0FTspaIxKeXM/+4Chm0dasH1xIeMnEjZA8nfX3vHJ74mMw0wGBOuctklo6U78RGY0zNB7aAJsalAwxJlLgs49pI65W/DX9GTHuJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDW+Pp86JxgKT3HjyYnyWzyID6/Qv+87XS7oXdI979M=;
 b=CcTuzzZy1PRNVX8xc9vOSMcVZDcFjt48eqKPNmSoeWqnr6vJsCb19keKC1zXvWS7NntSdNlceHMi3ZRuvDBYK7NyZIG2O7rX1ChgdeP2gjCPUOkt6/RMpnqgkPGMTw5EU+QCaR5ApZ7v+k1P+TPEXq6JS0wjaEgiSDp06F9ezBk=
Received: from CH2PR16CA0001.namprd16.prod.outlook.com (2603:10b6:610:50::11)
 by PH7PR12MB9221.namprd12.prod.outlook.com (2603:10b6:510:2e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 11:40:28 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::5d) by CH2PR16CA0001.outlook.office365.com
 (2603:10b6:610:50::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 11:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 11:40:27 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Feb
 2026 05:40:25 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v4 1/2] drm/buddy: Improve offset-aligned allocation handling
Date: Tue, 17 Feb 2026 17:08:59 +0530
Message-ID: <20260217113900.10675-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|PH7PR12MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e486c4-d037-48c9-4992-08de6e19590d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|19052099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlBrWjRXdE0velJhRnR1bVpNK1Z0ZXFXRnpoWnhIL252TlZ3N3p6SHRrSWQy?=
 =?utf-8?B?S0szTnk4ZkhNYmFFRDc3VGtqMm15QWtUZjlpS0daOU5XQnJUS2s4NzRxMlNw?=
 =?utf-8?B?WjVoVXhIcnJ2SkJybXdSK1Fxa3A4cW1lWHNQdVllbFJqNDJQNUFhUk9tUEdk?=
 =?utf-8?B?N2dndjBmU2xPUE1OUXVmZlZVbCs3KzR5UFF5MmtMdlIzVmRMNHg1emlSZ2Zl?=
 =?utf-8?B?Wis0bFM4NHpmTEJyTjdxakZIdUFScW8vdGVaVDZES2ZUeWRwejVsQ082QS9a?=
 =?utf-8?B?RlJ3aEs0Vkx5SFZNekFMK0Z4cGlxTFJ1YWZyMjBwcVpGbk54VkYzQWRwT1Y4?=
 =?utf-8?B?UFVSNWZBdlBBdHFaYk93UjR1R0lCK3U1QnlENEdzU0xUUTlIRTcyVy9vQXpN?=
 =?utf-8?B?am54eFVGL2lqYjRlYTBTQlAzN1pETlByTzBqSWkrVERLUndqc29tWFFqRkdj?=
 =?utf-8?B?MzlDbVpCYnJ3eXZjbnU2RkI4NUwxT2xCYUxuWmZvSDREMjljeC94S05iQlFj?=
 =?utf-8?B?UVM0ME5VdE9OUk1NY2IvaEhCbWM4Wnp0ZlhMZDlaY1FFamNieTUwV0VrY0d5?=
 =?utf-8?B?cC9tOTF3TUFkTGhqTElabXhHa0dEMUdmeklGWWNLUm1KUzdIYkxtYmJBZldn?=
 =?utf-8?B?R3BJeVNJcVhhTjZmaWxmVWZ5d0dkR1Fac2huUGxhb3RRNjFjZlgyb0wvc3kw?=
 =?utf-8?B?TUpiQ3gybU9rSEcvMk1GWmRsSFBOaUVrVm1lNE5BRkxoU1VVK3BrSStOTVFR?=
 =?utf-8?B?S08yZFJraXlHS2htOWdyc0F1eEJ6L0I3UFh2d2o0SGhDblNmSVZqNmt0OWhT?=
 =?utf-8?B?SEE2U0dKT1NKNHU5a1NXMTdQT01aN2hIeHdrMlkzWDMrVGorY3FraE9yMHZN?=
 =?utf-8?B?UVBqZkhZaVN6TVd4VDc1QjBxVXA0a0gzTS9JcXZSdy9wa2tCeDg3WnpXeVlr?=
 =?utf-8?B?OUJzd2FxVDVRNTZINjdBZVpmQjVpSklDbzZWQllOQVJLL1RyVUhrejZyL1lM?=
 =?utf-8?B?VW9iUFN4WVBKdyt5WEVqZHlHeG9CejRtZlE2anhWdlZGUGRLVjFWUHU3SWNY?=
 =?utf-8?B?a3hhRGlFQ2FGS3NmaWFYVTJCM2l0bXd3S2hSMm05d1c1aGxKSEJhQThGdGw1?=
 =?utf-8?B?Nk1TbXBSNTdsNUEyci93dTRhNXNRQXJndlJZWElDcWxpdnIxZzkwMDZjSmsx?=
 =?utf-8?B?QzgxL01wOGxnN3Btc0diNUkyajRNNUJ2dGVsdkRNWW01WnlwNXpvVFlDRmRh?=
 =?utf-8?B?SVJ5OUtlQ0pWUHQyekQwS1ZRYVNmMkFWMGYxZGl3Y3p3WUtzeHMxUDdZN3pN?=
 =?utf-8?B?YXNtNU94dUR4UTVwelc5S1pjb29FV1llZ0ZOaEIxaWRkRzhOYUxnbTI4WEdN?=
 =?utf-8?B?TU02YzBiQU90K0pkcmc1dC9hQXYzamxyQTVCR2ZLYUo0dU9KVzhGQWl3SlA4?=
 =?utf-8?B?UE1ieStFdkJEcFlBa0FYVWt6Uk1WWldiSkkrVVFiOU13V01rMnBDZEE5SFBC?=
 =?utf-8?B?WGl1Wm9WMnFuaC8yZjJnNmpwcklDMnBKdyt1anNuRis5eUVNRlFKKzBseFRw?=
 =?utf-8?B?NGZFblNUd0tRa0RKcDhEeVVCMFFzZy9VeXVhOVJjNjNxa09kOU43ZlU2Ujl1?=
 =?utf-8?B?SWpTS0RDQ2l2eE8xWExvYkRTb0QrQnZ6di9KTjNwTnFBejJFM3NBeWVKVjFW?=
 =?utf-8?B?b1NMM3o1MWlPckV4TURteDVucTVHWmhYcERSOS82cmE1ZnZLZ1FuWEc0enZq?=
 =?utf-8?B?bVNXN3JsV2xMQkd5UVNpOUs4YVI4NGw4UURCYmpHRVZsY2ltdVp0M2U0ZUNT?=
 =?utf-8?B?VTU3Vm43TlAxbHZvd3ZmdExaTHJHUXRRc2R2azVaTFJmeU5zczBzS2pPVWVG?=
 =?utf-8?B?THNiZzhZdmZ6S2xvcDRjRFhYQ1lUQk9Jb3l2U0Y3U3Q3NWtYbnd3NE55SytR?=
 =?utf-8?B?UEI1Q0hnUEVieGRGZmc1aW4yeVpsdWR2TWxWMUxoYnVSTVpZNWl4SU1OSGZh?=
 =?utf-8?B?Tk5DK2tVZDlETE80SDYySDdxZkQ0RE45Sm44SWJ4RDFHS2s3WXBZZFBPS3dH?=
 =?utf-8?B?SHZXMWhVY1JuVWI1SUV1ZVc4MEEwbU85elpzbXpFTlVBcE1kWU1tUk5JWk0z?=
 =?utf-8?B?aEZZZnJTVmQ0Q2J0bjJacXBvVFVCdzN5NHp6M1YycEVmR1lJeHlIanlvaGhI?=
 =?utf-8?B?bFlGRnpUVmFqWk1DclNhMHlVQlMySkd0ZXZzVFBMMnRqT2c0UW9lOXpkRWZL?=
 =?utf-8?B?dmtzVTVFQjZoUzNLRkFnRTJpbWd3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(19052099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W1HgRHIw/hFX0UXOq/VdVKNQm2Bub3rQSieSj7/U/+Qaaj42MMUOBpYj8DcozGP04DWYrP4xtxZXwj2FwkgHp3RLwbJlPZt9DKlgfirAiT9yV0RKoo7YWm6utYWvbXPz25dgH5deQEupZB1tb0cFuFQZEzeDZ3h4TtLLFsjSLIqssNgzcqmOSa7L6p76X9k5hI/Dj/m/ltQUHs6PlEucJSkwRbzV9bRo1jv9dEn/n17hWkPVvn6k/yiB+7IGFdAGUn48cNJIYUFZJIn7Kg6gkQ5qRAuFEnuALOIpYeC38wEkx0sl7e2wK/DfkOtVgrLx+Tef1Ub+AJWWLoXEB0H1UfLokozob1X2C/PVP/X1+zoYuvAKWY9wNhjy8FO5pq8x8ka5gBrp1U5Il2BH7iJCcWaIfQkCrHwcPFV2GD25e9xbFVjAhMn0rQTmWQ9ysozs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:40:27.9861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e486c4-d037-48c9-4992-08de6e19590d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9221
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
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
X-Rspamd-Queue-Id: 68CEE14B81A
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
  order- 5 free:  493 MiB, blocks:  3941
  order- 4 free:  246 MiB, blocks:  3943
  order- 3 free:  123 MiB, blocks:  4101
  order- 2 free:   61 MiB, blocks:  4101
  order- 1 free:   61 MiB, blocks:  8018

By avoiding unnecessary splits, this change improves allocator efficiency and
helps maintain larger contiguous free regions under heavy offset-aligned
allocation workloads.

v2:(Matthew)
  - Update augmented information along the path to the inserted node.

v3:
  - Move the patch to gpu/buddy.c file.

v4:(Matthew)
  - Use the helper instead of calling _ffs directly
  - Remove gpu_buddy_block_order(block) >= order check and drop order
  - Drop !node check as all callers handle this already
  - Return larger than any other possible alignment for __ffs64(0)
  - Replace __ffs with __ffs64

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/buddy.c       | 275 +++++++++++++++++++++++++++++++-------
 include/linux/gpu_buddy.h |   2 +
 2 files changed, 232 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 603c59a2013a..542131992763 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -14,6 +14,25 @@
 
 static struct kmem_cache *slab_blocks;
 
+static unsigned int gpu_buddy_block_offset_alignment(struct gpu_buddy_block *block)
+{
+	u64 offset = gpu_buddy_block_offset(block);
+
+	if (!offset)
+		/*
+		 * __ffs64(0) is undefined; offset 0 is maximally aligned, so return
+		 * a value greater than any possible alignment.
+		 */
+		return 64 + 1;
+
+	return __ffs64(offset);
+}
+
+RB_DECLARE_CALLBACKS_MAX(static, gpu_buddy_augment_cb,
+			 struct gpu_buddy_block, rb,
+			 unsigned int, subtree_max_alignment,
+			 gpu_buddy_block_offset_alignment);
+
 static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
 					       struct gpu_buddy_block *parent,
 					       unsigned int order,
@@ -31,6 +50,9 @@ static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
 	block->header |= order;
 	block->parent = parent;
 
+	block->subtree_max_alignment =
+		gpu_buddy_block_offset_alignment(block);
+
 	RB_CLEAR_NODE(&block->rb);
 
 	BUG_ON(block->header & GPU_BUDDY_HEADER_UNUSED);
@@ -67,26 +89,42 @@ static bool rbtree_is_empty(struct rb_root *root)
 	return RB_EMPTY_ROOT(root);
 }
 
-static bool gpu_buddy_block_offset_less(const struct gpu_buddy_block *block,
-					const struct gpu_buddy_block *node)
-{
-	return gpu_buddy_block_offset(block) < gpu_buddy_block_offset(node);
-}
-
-static bool rbtree_block_offset_less(struct rb_node *block,
-				     const struct rb_node *node)
-{
-	return gpu_buddy_block_offset_less(rbtree_get_free_block(block),
-					   rbtree_get_free_block(node));
-}
-
 static void rbtree_insert(struct gpu_buddy *mm,
 			  struct gpu_buddy_block *block,
 			  enum gpu_buddy_free_tree tree)
 {
-	rb_add(&block->rb,
-	       &mm->free_trees[tree][gpu_buddy_block_order(block)],
-	       rbtree_block_offset_less);
+	struct rb_node **link, *parent = NULL;
+	unsigned int block_alignment, order;
+	struct gpu_buddy_block *node;
+	struct rb_root *root;
+
+	order = gpu_buddy_block_order(block);
+	block_alignment = gpu_buddy_block_offset_alignment(block);
+
+	root = &mm->free_trees[tree][order];
+	link = &root->rb_node;
+
+	while (*link) {
+		parent = *link;
+		node = rbtree_get_free_block(parent);
+		/*
+		 * Manual augmentation update during insertion traversal. Required
+		 * because rb_insert_augmented() only calls rotate callback during
+		 * rotations. This ensures all ancestors on the insertion path have
+		 * correct subtree_max_alignment values.
+		 */
+		if (node->subtree_max_alignment < block_alignment)
+			node->subtree_max_alignment = block_alignment;
+
+		if (gpu_buddy_block_offset(block) < gpu_buddy_block_offset(node))
+			link = &parent->rb_left;
+		else
+			link = &parent->rb_right;
+	}
+
+	block->subtree_max_alignment = block_alignment;
+	rb_link_node(&block->rb, parent, link);
+	rb_insert_augmented(&block->rb, root, &gpu_buddy_augment_cb);
 }
 
 static void rbtree_remove(struct gpu_buddy *mm,
@@ -99,7 +137,7 @@ static void rbtree_remove(struct gpu_buddy *mm,
 	tree = get_block_tree(block);
 	root = &mm->free_trees[tree][order];
 
-	rb_erase(&block->rb, root);
+	rb_erase_augmented(&block->rb, root, &gpu_buddy_augment_cb);
 	RB_CLEAR_NODE(&block->rb);
 }
 
@@ -790,6 +828,127 @@ alloc_from_freetree(struct gpu_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static bool
+gpu_buddy_can_offset_align(u64 size, u64 min_block_size)
+{
+	return size < min_block_size && is_power_of_2(size);
+}
+
+static bool gpu_buddy_subtree_can_satisfy(struct rb_node *node,
+					  unsigned int alignment)
+{
+	struct gpu_buddy_block *block;
+
+	block = rbtree_get_free_block(node);
+	return block->subtree_max_alignment >= alignment;
+}
+
+static struct gpu_buddy_block *
+gpu_buddy_find_block_aligned(struct gpu_buddy *mm,
+			     enum gpu_buddy_free_tree tree,
+			     unsigned int order,
+			     unsigned int alignment,
+			     unsigned long flags)
+{
+	struct rb_root *root = &mm->free_trees[tree][order];
+	struct rb_node *rb = root->rb_node;
+
+	while (rb) {
+		struct gpu_buddy_block *block = rbtree_get_free_block(rb);
+		struct rb_node *left_node = rb->rb_left, *right_node = rb->rb_right;
+
+		if (right_node) {
+			if (gpu_buddy_subtree_can_satisfy(right_node, alignment)) {
+				rb = right_node;
+				continue;
+			}
+		}
+
+		if (gpu_buddy_block_offset_alignment(block) >= alignment)
+			return block;
+
+		if (left_node) {
+			if (gpu_buddy_subtree_can_satisfy(left_node, alignment)) {
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
+static struct gpu_buddy_block *
+gpu_buddy_offset_aligned_allocation(struct gpu_buddy *mm,
+				    u64 size,
+				    u64 min_block_size,
+				    unsigned long flags)
+{
+	struct gpu_buddy_block *block = NULL;
+	unsigned int order, tmp, alignment;
+	struct gpu_buddy_block *buddy;
+	enum gpu_buddy_free_tree tree;
+	unsigned long pages;
+	int err;
+
+	alignment = ilog2(min_block_size);
+	pages = size >> ilog2(mm->chunk_size);
+	order = fls(pages) - 1;
+
+	tree = (flags & GPU_BUDDY_CLEAR_ALLOCATION) ?
+		GPU_BUDDY_CLEAR_TREE : GPU_BUDDY_DIRTY_TREE;
+
+	for (tmp = order; tmp <= mm->max_order; ++tmp) {
+		block = gpu_buddy_find_block_aligned(mm, tree, tmp,
+						     alignment, flags);
+		if (!block) {
+			tree = (tree == GPU_BUDDY_CLEAR_TREE) ?
+				GPU_BUDDY_DIRTY_TREE : GPU_BUDDY_CLEAR_TREE;
+			block = gpu_buddy_find_block_aligned(mm, tree, tmp,
+							     alignment, flags);
+		}
+
+		if (block)
+			break;
+	}
+
+	if (!block)
+		return ERR_PTR(-ENOSPC);
+
+	while (gpu_buddy_block_order(block) > order) {
+		struct gpu_buddy_block *left, *right;
+
+		err = split_block(mm, block);
+		if (unlikely(err))
+			goto err_undo;
+
+		left  = block->left;
+		right = block->right;
+
+		if (gpu_buddy_block_offset_alignment(right) >= alignment)
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
+	    (gpu_buddy_block_is_free(block) &&
+	     gpu_buddy_block_is_free(buddy)))
+		__gpu_buddy_free(mm, block, false);
+	return ERR_PTR(err);
+}
+
 static int __alloc_range(struct gpu_buddy *mm,
 			 struct list_head *dfs,
 			 u64 start, u64 size,
@@ -1059,6 +1218,7 @@ EXPORT_SYMBOL(gpu_buddy_block_trim);
 static struct gpu_buddy_block *
 __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 			 u64 start, u64 end,
+			 u64 size, u64 min_block_size,
 			 unsigned int order,
 			 unsigned long flags)
 {
@@ -1066,6 +1226,11 @@ __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 		/* Allocate traversing within the range */
 		return  __gpu_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
+	else if (size < min_block_size)
+		/* Allocate from an offset-aligned region without size rounding */
+		return gpu_buddy_offset_aligned_allocation(mm, size,
+							   min_block_size,
+							   flags);
 	else
 		/* Allocate from freetree */
 		return alloc_from_freetree(mm, order, flags);
@@ -1137,8 +1302,11 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 	if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION) {
 		size = roundup_pow_of_two(size);
 		min_block_size = size;
-	/* Align size value to min_block_size */
-	} else if (!IS_ALIGNED(size, min_block_size)) {
+		/*
+		 * Normalize the requested size to min_block_size for regular allocations.
+		 * Offset-aligned allocations intentionally skip size rounding.
+		 */
+	} else if (!gpu_buddy_can_offset_align(size, min_block_size)) {
 		size = round_up(size, min_block_size);
 	}
 
@@ -1158,43 +1326,60 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
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
 			block = __gpu_buddy_alloc_blocks(mm, start,
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
-					block = __gpu_buddy_alloc_blocks(mm, start,
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
-				if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
-				    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
-					return __alloc_contig_try_harder(mm,
-									 original_size,
-									 original_min_size,
-									 blocks);
-				err = -ENOSPC;
-				goto err_free;
+			/* Try allocation through force merge method */
+			if (mm->clear_avail &&
+			    !__force_merge(mm, start, end, fallback_order)) {
+				block = __gpu_buddy_alloc_blocks(mm, start,
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
+			if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
+			    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
+				return __alloc_contig_try_harder(mm,
+								 original_size,
+								 original_min_size,
+								 blocks);
+			err = -ENOSPC;
+			goto err_free;
 		} while (1);
 
 		mark_allocated(mm, block);
diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index 07ac65db6d2e..7ad817c69ec6 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/rbtree.h>
+#include <linux/rbtree_augmented.h>
 
 #define GPU_BUDDY_RANGE_ALLOCATION		BIT(0)
 #define GPU_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
@@ -58,6 +59,7 @@ struct gpu_buddy_block {
 	};
 
 	struct list_head tmp_link;
+	unsigned int subtree_max_alignment;
 };
 
 /* Order-zero must be at least SZ_4K */

base-commit: 0ef1dcf4c16bb6d90e8fbf7b18f3d76b79fcde9d
-- 
2.34.1

