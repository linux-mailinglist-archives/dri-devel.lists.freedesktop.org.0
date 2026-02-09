Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIcAK6+biWm1/gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:32:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E77E10D069
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292F9897FD;
	Mon,  9 Feb 2026 08:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PBcW5G3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010059.outbound.protection.outlook.com
 [40.93.198.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B809B897FD;
 Mon,  9 Feb 2026 08:32:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rREpaDJ4GVzlTuhKJuZpTrHQss7Y3zPdFadiYPad3ECJbN6v1N9AlfLAEaLGKCuUA52u36zuSH9v1kY8qqYzNUYekOGdsmYK3eKzVJ79fpYHPvGjeKoopl6z0iFGYHADKgc9ZEATrPLKRjiuJGV37DQj74BvFrGg6WvXJ2KC1BELdRsTr3xFI/fOVaWkSHdgB4UIzAqYhgKwris1lv7AeMEqHS3BafdKXqRZnYfxsGxyVCz18yIhzBVGVice+acQ45VHeEJw3QXoY9NASfLDmeg1532gPsCzaKI0JHBzwapXAYGyoyZ/bRwbo2bn98jkt0Jt3FkkaxLqIMnDy9EXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtSzeEP3dK2CFhDLgTmMyqVk8gsomk3zNDQwkXiY/Hg=;
 b=eacircYi1crVK5k0fNnYR8isqbtETOgCI9jRbGKuI8OoSy7OrNRZk3AQhM/mDTICcyTZQgMRQI3m190ojHGPdPXKhbP4NTrBwAtoCmkSxbuujt4n7AI/4q+vJYJ3ZK25ZySe6euV3fQZOeNZAUJO5QNZ3egwB0dy+lXfrA+2gh1VJlw1Dq0avqM/q2W8OQdXyR8gVG0GKL/JT8QlkPwXwSVIW8kUjdzQg7Zg/TL+Bh4Zm3kv64dD0LJ2vb9cte70yz4VU2pz42XhBQ6ZnXxboTXHUD581rtGJpucGcGUhzcifn8kTWiKnL9APjW/r9lIh2W4ZkH8/cvlm8FjZ0sbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtSzeEP3dK2CFhDLgTmMyqVk8gsomk3zNDQwkXiY/Hg=;
 b=PBcW5G3Ww4evuvcvNvl+fqRtg8U7q2IWumV3UtODlIkwcksdcmbE2/5AzkP0Gl7YSqw9pxAoQ2yXRYVvekuEYFNMaJ6b32+lzibjiGJ2FZDiqX63+VDlS3wNhhZwJCHJA+53z0mVip1dSP2DVQrj74jUwXCJdogCNmn550/6p+0=
Received: from SA9PR03CA0025.namprd03.prod.outlook.com (2603:10b6:806:20::30)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 08:31:21 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:20:cafe::d7) by SA9PR03CA0025.outlook.office365.com
 (2603:10b6:806:20::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 08:31:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 08:31:21 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 02:31:18 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v3 1/2] drm/buddy: Improve offset-aligned allocation handling
Date: Mon, 9 Feb 2026 14:00:50 +0530
Message-ID: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|SJ0PR12MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 913b73f1-fd37-4adb-aef1-08de67b59ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnR2bStsbnpIVXJaR3hRcVZ4Wm5rQTI2dGlPVTFuZmdjcHVZR3hhRjRVTisz?=
 =?utf-8?B?anVIaml6eElWcE5DLzZQdDdVS0NBdWEraE9KMnQyTWFST2xmd0kycS83MFpZ?=
 =?utf-8?B?UEwzTEpyS2hFYnBEV0d4U0k4OVA5ZFlIVHp2VEdpVkZyRE1VeHEwaGw0TEsy?=
 =?utf-8?B?bVFuMTB1Ui91TGJ1bVQwM2xub0FqWE9waFdHTzMrdHBrUVFiSklaN3pkc1hQ?=
 =?utf-8?B?bjF0Sms1WFlsYU5HeGNVOVJPTDhaRjV3L29yTm1oSCtuSzl4UDNaUWJOdzEx?=
 =?utf-8?B?dWkycXZENVJ4UmV1TUpGR0FiYjBJV013UjVTS2YvcWdVaU1kd25Ba2R2MzZV?=
 =?utf-8?B?aGhMWXVreWxja3VDWjROeHZFbGhKQlVpeGRzQlAvUG1oMlFhalMzNWNQczlQ?=
 =?utf-8?B?aVN3d3B1VldoSDQxaVZYZU81QWhldTRaa1NjK2VVdEY0eGc4UEhBMXl4M291?=
 =?utf-8?B?aGhVekZ4NURtOW1lTE9lR0l2RVVwTUVCNnU1REc4eUFJWGx6dnBHNlhrSE91?=
 =?utf-8?B?WHJvMEhuTzZSdGlxMVoxKzF2LzF2a29WK2JxUXhpdklBVnd5bFAxcU9uNEM3?=
 =?utf-8?B?U0d5QWo0MlFubzBFaGtma0h1bitacVUzb0NWYjZlYTU3RVZhSWlUU3F4cWN5?=
 =?utf-8?B?RkNLTlk4dXhzeXdpN1BicmVCRTN5SmhVNVhGbHloWlFWdjcwRWhFb0ltVlJn?=
 =?utf-8?B?a0k3UEF6QjlBMGtKN2hJQnhVcXBCN1Y5T0htaERmY2E0M0Q4L2VMaFlRUnhE?=
 =?utf-8?B?MEp0bFUwNHk5T216ODA2dlpLNEpCMXpmWDhYWlZubXgxaVN6Y2t4TndsV3Q4?=
 =?utf-8?B?TU5JMTUwUTUvZHFrUkdwN0NMcmNQZzF4cDdBY1daNms4c3pnOE9kcnpLTS9W?=
 =?utf-8?B?Uks0Mnc1NnhPL2ExOGE1WkxNaHd1WGdDeGlLZVhJU0RWb3ZoVXRZSlY3cjN3?=
 =?utf-8?B?N2Y1TEhWczhKcEV4TGNzTW1KaEpDOUFFOGdHMSt6Q0lpUkVDUUVrYW1YV21a?=
 =?utf-8?B?c01QSXEvK2RVekFESm01V3Y0VlhoWW1DcGN3QnpBR0xWYnRET0dIdHNQblpu?=
 =?utf-8?B?ZWp4YUZ2TnBnSHloNHBsNHNmNDdmUnJMOWU4cTA0R05aNDU1Yi9paG5oN1NH?=
 =?utf-8?B?Q291RkNRY1NQNFVYMEhLWnZLUjVKb3dwTkVDcy9ncGJtK2hWOTJPM2k2S0Y2?=
 =?utf-8?B?MDM0cGJSNS9kMncwdmlhMkJ1cE4rNzQxbXgycXVrY21MeEREOGFjcTNvUlA5?=
 =?utf-8?B?QllPaGtSbFdwZ1RNTm9HS2thNGxORUJVYW9vL1k5SWhkMDU0UlVsWHRlWUYw?=
 =?utf-8?B?aUFjTXZ6RlFkNXNlRkk0dVFDV282djhjbThvU3NSYjBjU1JyYzROSnBpbDdn?=
 =?utf-8?B?UHVUTlA3Q1pOUmdGWEluS1dPZW5ZOEpnSXFBcW1Gb0JYcjc1Yy93KzN5OEQ1?=
 =?utf-8?B?TG5MNGpPTFZRYmQ0Z2w1WUJsUHhnMmJHQWZHUldYdytBUUlsVG5xMTNEdUJQ?=
 =?utf-8?B?aWJIRm9JNzhiRmRaNGNtMjk1R2lLTGZPekxieHVMaWZsZmsrS2xiTGt3b0px?=
 =?utf-8?B?UjhWR1RZVEV5OTFYeklzSEpxMVBvNGFUZWxSbG5lemVIMzVla3RCZjMyc3NX?=
 =?utf-8?B?NGZ3SDZLYlRWSlVrUmxrcXIzeUQyNlF0cEZ1N09DckVBSGxGd0FCVW1yNFZG?=
 =?utf-8?B?WnJtMHNPZlE5K1JLQ2gzaERQQkRITFE0dVZ5QnI5clZjUDBKSXpBRE83ZEQv?=
 =?utf-8?B?UFlDd0pVZFRNQURlN1NWbTR2UkdxZ2I1SlY5SjlubGxpVTJrZDh0U2lNdUJu?=
 =?utf-8?B?b2plcFBRL2lKME5VSHRRQ2VSbC8wWWxhU1prWTJjRDBoTUVTamcxa2Yvcmg2?=
 =?utf-8?B?NFFMMmx2eWdXRCs2VTNLbEJ1M2V2a0tVbHhLaWFPZ3MwQjNna3NEMkx0RWM5?=
 =?utf-8?B?aGc3eUdyU2J3RlJVMkZSb1k1V0Q4UEw3MDZtQTJQWjA3TEROb0tGTm9WR1Jo?=
 =?utf-8?B?cXR5L2wwK0pTeWxwWHVja3dSSlpXVW55aHhUMnhUZ1pNeUdwdWViSVY2M3N1?=
 =?utf-8?B?UWFKWWc3OWhyem04SHEyZmhpcnZJaDZBSjM4b2dNdzNaWW9Bd1ZPdy94WUM5?=
 =?utf-8?B?TWxjNUhLQzFsR2F0YzlodEkxaWt1NUxERFRsd05XMHMyVUlpdU11WWl2L0M1?=
 =?utf-8?B?REMrdGppRUR4Z0lJYzA0b0l4cXVqUkZuTEFVRVZUdnZpUC9kaTdscWtLTG53?=
 =?utf-8?B?ZDdwckpySDZKY29EelU0RDErTnN3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OkaP0Hjs+Cq/yrRwcpuaIz34Zeaf8Kq+yVJiKkmQwn2TwXfveWBTUxPIfnXliu0fdnTIXY9ZOtcFFKHLb/mBHIHVe0XEtdusr8Z6X7UnV3Sj48I8dS56X4tfam3ns8KDK3w1XVdNaDniAWG943yBKEnJGXIGo1UDndIel8lF4nyfgaboOXuyMeggxt7w6+I9xcCy6O7EYpoG24lzidilFkho7w3yy04a90Ka1XwY4kPxWcIzXGIrxKTj57wvwnr+Djw365saMwqtIt6oJ1AajCxtJMYAD+L6mMX708wKkzluE7PTBr76iedsqJT2dOeq3UsL170gdead3HMdnqoY1A3SVsY1eua+tUxVP5oPvKswvMnXJY87bWzaiODopv8nq76XEzjqEjX3ebhHd7iuPTR7vlGNSTDej0IbREB1LipCAQIB24wyWPWkfoG33x7C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:31:21.8391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913b73f1-fd37-4adb-aef1-08de67b59ae6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Arunpravin.PaneerSelvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 5E77E10D069
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/buddy.c       | 271 +++++++++++++++++++++++++++++++-------
 include/linux/gpu_buddy.h |   2 +
 2 files changed, 228 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 603c59a2013a..3a25eed050ba 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -14,6 +14,16 @@
 
 static struct kmem_cache *slab_blocks;
 
+static unsigned int gpu_buddy_block_offset_alignment(struct gpu_buddy_block *block)
+{
+	return __ffs(gpu_buddy_block_offset(block));
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
@@ -31,6 +41,9 @@ static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
 	block->header |= order;
 	block->parent = parent;
 
+	block->subtree_max_alignment =
+		gpu_buddy_block_offset_alignment(block);
+
 	RB_CLEAR_NODE(&block->rb);
 
 	BUG_ON(block->header & GPU_BUDDY_HEADER_UNUSED);
@@ -67,26 +80,42 @@ static bool rbtree_is_empty(struct rb_root *root)
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
@@ -99,7 +128,7 @@ static void rbtree_remove(struct gpu_buddy *mm,
 	tree = get_block_tree(block);
 	root = &mm->free_trees[tree][order];
 
-	rb_erase(&block->rb, root);
+	rb_erase_augmented(&block->rb, root, &gpu_buddy_augment_cb);
 	RB_CLEAR_NODE(&block->rb);
 }
 
@@ -790,6 +819,132 @@ alloc_from_freetree(struct gpu_buddy *mm,
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
+	if (!node)
+		return false;
+
+	block = rbtree_get_free_block(node);
+	return block->subtree_max_alignment >= alignment;
+}
+
+static struct gpu_buddy_block *
+gpu_buddy_find_block_aligned(struct gpu_buddy *mm,
+			     enum gpu_buddy_free_tree tree,
+			     unsigned int order,
+			     unsigned int tmp,
+			     unsigned int alignment,
+			     unsigned long flags)
+{
+	struct rb_root *root = &mm->free_trees[tree][tmp];
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
+		if (gpu_buddy_block_order(block) >= order &&
+		    __ffs(gpu_buddy_block_offset(block)) >= alignment)
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
+		block = gpu_buddy_find_block_aligned(mm, tree, order,
+						     tmp, alignment, flags);
+		if (!block) {
+			tree = (tree == GPU_BUDDY_CLEAR_TREE) ?
+				GPU_BUDDY_DIRTY_TREE : GPU_BUDDY_CLEAR_TREE;
+			block = gpu_buddy_find_block_aligned(mm, tree, order,
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
+		if (__ffs(gpu_buddy_block_offset(right)) >= alignment)
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
@@ -1059,6 +1214,7 @@ EXPORT_SYMBOL(gpu_buddy_block_trim);
 static struct gpu_buddy_block *
 __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 			 u64 start, u64 end,
+			 u64 size, u64 min_block_size,
 			 unsigned int order,
 			 unsigned long flags)
 {
@@ -1066,6 +1222,11 @@ __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
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
@@ -1137,8 +1298,11 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
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
 
@@ -1158,43 +1322,60 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
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

base-commit: 9d757669b2b22cd224c334924f798393ffca537c
-- 
2.34.1

