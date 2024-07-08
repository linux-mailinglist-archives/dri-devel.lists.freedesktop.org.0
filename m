Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C4692A6CF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 18:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440B010E3A1;
	Mon,  8 Jul 2024 16:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NEW9M+2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE20C10E3A1;
 Mon,  8 Jul 2024 16:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzlO8MnlkQy3aM0862oCLJeSvRol7avRPuJUoqlzWaybLBUhSw9bhMifYpVbnXsvL2h7b/kDQCIifsKYH+nPnJnENp3+67Q9U2OECRnbPw2ERVu1InYvd1KN73hPnLLko/At7uH11mW9LyJVkLNu+LbkBiXHDdUPFSAEl0CaU9gkE8bHi1/5ZpKLU5dwnexbOfvue2tY7O0FyVnBfGdrrt1i+kgj8dM7SbQs11JTBnmaFBfLjM5MlVhkKX91CUElD8NUKlkEZl01AX4CXc1WZqu4KJn8BhyX1pb3NUzUEOw45e8NhCXgjAJx5vDFD9sZnK74GckDZd0oKRw7SVK0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aiVI42DDJEMwFbuZiQwGvsDBCvwpfUaSMaauB0Tzf0=;
 b=XcjJ6txD/WfSaIJjmSfTPCcDSxtr8yl6CEoZwpiU8LqGUv7gKfeLuGeRkeAJ8CxGnI4squSnDUNGoTjEAN6DGbbQf1NROm5xsO0dtvHJcFCElaUy3Sz9zlLYD/06ch9/crj/vQPIYMTyA+/WAhvBKQJbxZgTlgCiz9ripMAY08LNfrJiOVWPFUgNVBzPue9ZaX2AFENlGrESdnumU/Wae48ev/RJrQGS0Wi53zXUl85r7IThnCPI+yk+/ywNj5MOpza8/2qcEGQLcmy5L2SmIcZ1aMpCy3uRfRfWa6lL2DrztL78WELr6vMpl09hvkF+62JVdYLx6+fpr/U6wiL/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aiVI42DDJEMwFbuZiQwGvsDBCvwpfUaSMaauB0Tzf0=;
 b=NEW9M+2PqBehf4Rj1xCvcvYXmZk8GtAsJs3vP3vYZPW3/TyK3+H0dmitrFRsMw7CoYxeYMYmnxr2xrzTi9Wqq/QIFC6Un56kh2H+r7IfYSncVGYiCA+lVTdBo5IugQJz3YoTLGJnWx/MBIutMaYwwdIYPHapp00tM0Xjpji07ag=
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 16:06:50 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::b6) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Mon, 8 Jul 2024 16:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 16:06:49 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 11:06:48 -0500
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <felix.kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Dave Airlie <airlied@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, "Daniel
 Vetter" <daniel.vetter@ffwll.ch>
Subject: [Patch v2] drm/ttm: Allow direct reclaim to allocate local memory
Date: Mon, 8 Jul 2024 12:06:36 -0400
Message-ID: <20240708160636.1147308-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a05b13-8152-4c0b-6f7c-08dc9f67f989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3lzdTdxdktxZUZTeW1pMmVDMWc5RzJraFB6T2RMd3NaYnlraWNtbE1wRHNY?=
 =?utf-8?B?MnNvc3ZXa0szZVBvbEFmV2xEUURSSVQ5UWE1SHI1ME1heDNBUDJrNS9NR052?=
 =?utf-8?B?cEhmZGs1dW1JUnVhR1QyZ1U1TGYwYkFYOWNkK2UvWWxVVWd1NFlOajFEUVR2?=
 =?utf-8?B?cUF1TG91enZsdkUyRnh5dkhqTFNBUjhaUG9hd1JRcHJGYkhSY3FoYlY0Z3Iy?=
 =?utf-8?B?VWRrNU83ZFVNNStRbWlOa25lbkFLTHVMUkVCWGZyTnRLRDZmVytrSHUydEti?=
 =?utf-8?B?SGxzaDd5Q2ZRSjhNSmhiN1lha3hMb2ZPM1RKZmVndDhiN1hpTTkzanc1b1Y2?=
 =?utf-8?B?S3NGcGM0REIwZlJCdkprRUtGUnllTkVJOS9TczAwT2RHd1l3WlJwSGVoUE05?=
 =?utf-8?B?NmJQRzJUNmtRcU04Mk5oQnNaYVN0b2ZhQ25SV1BtNTNJOHFOa3lEOUV5bEhM?=
 =?utf-8?B?NUNrczNVVFdjUHcrbVlRTlgzNEtGc09jMUovT1JyQ2NuRm0yVFFiMmJQa1Jp?=
 =?utf-8?B?SzBRVFJzeWdldTFrMzIxNkZRZHROb2dxbkVxUDNhSTcyaUxZZUZQMnZwMS8x?=
 =?utf-8?B?WDJaWnU4ZDJDTWdONXgzbStSaTR4enVTRU44NkU1WENvQjV0VWhxQTU1YjZh?=
 =?utf-8?B?RTMramVvZ3BNVEUwUTdTN2VVWHNnbUpJV3lrOGZXRlJRcXhuaE9YcEltbWZx?=
 =?utf-8?B?OThoZ3BuM3FBYlV6RTJUK3A1WUpzdmo4WENHV0ZROWFleVBWUEs1RVljZkdI?=
 =?utf-8?B?blZhRFJ4WklLVmNESVhzWE5mVjZsRy9TQjRmS09rNlZXNFRnNHhuZ3pyOGxL?=
 =?utf-8?B?VC9YbUVSYnNHbmVTVWJZMVJ1d2tBNDA5enRJcFlPRnJ6MlBET0NXbUJDdHdn?=
 =?utf-8?B?N2x1cVhoN3EvZTJXMlFab3RnQjJjMVRQbXM4ME04ZXRlclk3UnNTK3JEQ2Vn?=
 =?utf-8?B?RnZBUThGb2ErQi9xRGl6b0ZwNUVBRlhtdXpOVG1CMEIraTBTdUR4enR5aUoy?=
 =?utf-8?B?c2dsb2h4cmh4N0dvbG9ucWtaZGV0bE5zTXBnR0dlRENGWVdOWEhaNm9OQVRI?=
 =?utf-8?B?M0xmQTRoUVBMb1hxdC9tRzJseURLMUtkZGJDbmsyNFJaY1JEVFBob2t6bnd1?=
 =?utf-8?B?aUJvYk84OFpaa2RGMXhZdEg2ZUNmQ3lIKzFnOFJTd0Z0Qkp1MUx6aUxuSFJH?=
 =?utf-8?B?Y0tyenlpSDI5NVlvUHBIMi9MaFQxMmdtL0lQSVJQb05sdTdOQmdmb3ZHWGhH?=
 =?utf-8?B?dTFGbE9uV29kTHd5VHRNUk9Md21WcmgwcWZsZ2krd2JudUhMUXZVTHRSNklY?=
 =?utf-8?B?dG5PQzlnK2NaTXpGU0kwRmVKb3VsdVNBbjh6c3ZkZ1B5cGhMRzhabWNBWi9j?=
 =?utf-8?B?RTFuKys3bmxodVBVQURUSGlTaFRJTzIwL3lCTWJZd0FMb05reXUwV1F5Vzho?=
 =?utf-8?B?VEc0eFhmM3puZnVGVFgzRmVUY3VqM0NxUk5tSS9sVnRMWGE0bW00TTkrRjZB?=
 =?utf-8?B?RHZiRjFIRXZ3MEhmUDdoUE1BMkMwclJaQTVGWDMvV3hxMFY2SW5JTGFXN3FE?=
 =?utf-8?B?K2tEa0VsWWZ4enpLSENGcGxwMldtbEhGVG9TSUhWbC9HRWdBUHF6L1phb0Zm?=
 =?utf-8?B?bUFiKzd5QWEwSVZkRVo0VTZ0MUkvZHBtSHFjSXc1d3l4RHkvTFJzMkhFa2tn?=
 =?utf-8?B?SGJJeC95dTkrLzNLenVHczVaWkpmZm1wN2hsTnptSzlycFQvUTlVRUZ3K2Vm?=
 =?utf-8?B?aHZ1dUhIOUtVTlk0UFowWGVXMy9uN1BGajhqUmtZM0ZTSk9OdkxjK2o0Q1c2?=
 =?utf-8?B?Mmw3MklNVnBpbERGNzhKSkNzdFhUdFVCRkFvdG51b2todjZxdFNsM1czYWN4?=
 =?utf-8?Q?e+Qkwab5pqNKm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:06:49.4093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a05b13-8152-4c0b-6f7c-08dc9f67f989
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
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

Limiting the allocation of higher order pages to the closest NUMA node
and enabling direct memory reclaim provides not only failsafe against
situations when memory becomes too much fragmented and the allocator is
not able to satisfy the request from the local node but falls back to
remote pages (HUGEPAGE) but also offers performance improvement.
Accessing remote pages suffers due to bandwidth limitations and could be
avoided if memory becomes defragmented and in most cases without using
manual compaction. (/proc/sys/vm/compact_memory)

Note: On certain distros such as RHEL, the proactive compaction is
disabled. (https://tinyurl.com/4f32f7rs)

Cc: Dave Airlie <airlied@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 6e1fd6985ffc..cc27d5c7afe8 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -91,7 +91,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 	 */
 	if (order)
 		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
-			__GFP_KSWAPD_RECLAIM;
+			__GFP_RECLAIM | __GFP_THISNODE;
 
 	if (!pool->use_dma_alloc) {
 		p = alloc_pages_node(pool->nid, gfp_flags, order);
-- 
2.34.1

