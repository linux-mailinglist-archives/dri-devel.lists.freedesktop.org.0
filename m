Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC8wOA6qhWlhEwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:45:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959DFBA7A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87AD10E5AC;
	Fri,  6 Feb 2026 08:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GIezg3al";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D0610E0D3;
 Fri,  6 Feb 2026 08:44:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSprqCb2h7HTS/IgEKrIAhGx+FAaaPOPVQAnofIamExw66mKoMGQzjOG7B8dsjwXPcKzjhqIIn5Ych02a+KoyRCFg6+Alc+nDfTeUy7Nkc+er4uQZWVofWyiU5L1pCInfL9GeYagGjSogv9y9Tpd8GNfPblgbX7sJpc7ciAgRAanIOsP4ITWIjwJOJhvyW6mmPi2gtEaYHU5vv3TW1SmvyuVeH5k+yZM8/pq/ixIviuFUuKsfWO8onuI6yKHQgDyU3YbdQrV3s4hBvSMWAFwpHokJJsrOdhY0MV6rZsZ5DI0hjTH2k+XBx8LFVZhB5fAKpBHTxGS0h1PW7IjU8/jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUwLo/UBr1vLutPGBgZtut3IGwl0gTrvqtmNyv64+q4=;
 b=fQLp0V6wW8glZCPClm4CvmqHOnXJqLs+Y/epQcjxSzmzOwlWSePRoS4ciAlbcA0yUWzvc55+iaJa7gREUNaLHRkL8w5gvo0biVtT0hVP2OFFi5rb3ePMdUd9flOmCe2rSuhoWa6d1dcCJ792xKk1hXy6mufssziKbXYcGDue+ihEajLo+SAjcUrwh2rrEZKrjDrpkFMX9Y7ARK/ulwXHg3XX3j3CGo7cod33gClVWhCTbm8fQZtIUol9qZVhsatUBa8TVuYIDOeRvcvENfXjwjI5q/Zvi5C3h/YwnF24njDS5O21SRk901snPzxjRSp3D1pszEHVqXzpr/UCYg/Ryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUwLo/UBr1vLutPGBgZtut3IGwl0gTrvqtmNyv64+q4=;
 b=GIezg3al1dHsD661XxhB6zF/TVPKN2iDitWTDqivgS79iymIq4AjB2GHQIv/uPPYgfFRl1peGrwrCFrU+tpNRNqyafMfnfXC9Thxvb5JdDQtH7o5nJcFFhZ0RlJIoyHenmvTd0X50EIUOc657d+6CIotk/9B5YzfQPs3PnyY5Qs=
Received: from CH0P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::20)
 by CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 08:44:51 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::c4) by CH0P221CA0024.outlook.office365.com
 (2603:10b6:610:11c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend
 Transport; Fri, 6 Feb 2026 08:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 08:44:50 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 02:44:47 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2 1/2] drm/buddy: Improve offset-aligned allocation handling
Date: Fri, 6 Feb 2026 14:14:23 +0530
Message-ID: <20260206084424.7360-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|CYXPR12MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: dae8e6e8-77ce-4343-310e-08de655bfd9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHplRFlUNUx1QlBaRmZBTk1KN240bHZ0amt1R1BSUC9mTzV6SmdQVTkrWWhL?=
 =?utf-8?B?ZkNPRms4VXhDd1dYTTJZZm40ODRrMlZkejc2OFVNN21lU3UvVGpiWFNiWTBH?=
 =?utf-8?B?aWlDYmJZY2YvcXo1Z3E2MkFRbXdzOVZDaDBKcU5EZ2lqMkM4eEc1RFIxYXFs?=
 =?utf-8?B?ZWFrSHRmR0Q4cGZOZEs3N3J3cGthQjhjS253LzJscExZL2NHR3p4ZDRQR2FZ?=
 =?utf-8?B?YTdzdVZsSTZmMmRyeUxOckIrU25sTU8xbkRBeDFueEY3UU01ckp1WGxHQmc5?=
 =?utf-8?B?ekFNUGlFekxiMHFGMUp2bFhTWnZEMVhGdmRnWVptSE5veHkwbS8rdWw0Mm5t?=
 =?utf-8?B?RDZDNVFtMGtsSTErZWdQYUoyU3Z1SkhyNzdjRGI3ZWl4ZjhpSk1hOExDR3BS?=
 =?utf-8?B?b1RybXRXVUlEajdaT3JrRHd1ak5pTGxHeEJ2SU1YRHR6WUpodEt5eXZNTkxI?=
 =?utf-8?B?UnYxdTYxUVNsMTlHOFV5bXFkMzJkcUtIZ1RaZStmT0wwM09URWpQbEt3Mm5B?=
 =?utf-8?B?QSsyTnVNcm82c0JoNnh3dW5oSnJ6OFNLMUlwL3JYdjZhV2JrK1JpcmgzRFFH?=
 =?utf-8?B?K1JmNHBhcTJJK28ydHpMNjBlWVN3WW5tWFVLckUrR05NLzIzWWVSazRKVjhI?=
 =?utf-8?B?YlZERDJsWFNoQWxNRUd2dTBHbzlyci9EemQ5Ty9vVW9NbGtRc204VmJ4U2VX?=
 =?utf-8?B?VjVMdWhxbFVQT2ZVRU5mMEVwTlEwbzBocHMrdzNkSHZEdnN4aDhpU3pOU3JB?=
 =?utf-8?B?Umx4eThpQ0ZQbU85YmFoeVNYRkNxSXJDTDFTNkhQREhGZndXK1NlQXNPZUJh?=
 =?utf-8?B?NlhONmRNMVhha0xWK09mT2FRY2M4QjJYbzAvSkhqSVkxaElpNmxrd1Y3UEJZ?=
 =?utf-8?B?NWc1NHg3VTVZQkN3TkRTVDB3M2hTY0VoSW4wb200em5tM2R3dUxMNDFvbHZT?=
 =?utf-8?B?TkpsL0pXdmd2RmRWVXdmK1I4WVFTcWVvanRkaTNSMXdsNGttZldydWRrcVA1?=
 =?utf-8?B?dm5qeUxIU3k2UGhPMlpoSDMzckVRRFMyVC8rWFltcm9sMnhEb1pPblZvaEh4?=
 =?utf-8?B?RXhCT0J3bVpUbFZOODZSWDJBRGtzN1JxeHRxN1ZYaXZmK2kwdVNtTW5PanZJ?=
 =?utf-8?B?Q3R4MTJuNk91dzVhaDgrTDBjZ2VacXc5Rlo3Z2hSa3NxWlpDMVVlZmRWeEsz?=
 =?utf-8?B?UlBLYVRMZVh4QitpQnhHRmgxcHFGY2JRbG9qVTN1eVlsOXdDVUVBVUh1TVlZ?=
 =?utf-8?B?cGRyTXNTUlE5Y25DWTg0ZkJsVjZGUTg3OEhoSlNSYlZFeWF6c1Z0S3hUSVVU?=
 =?utf-8?B?dWRGOTloUGh5dVYvRksxU2NlK0hwRGZobTlZVVBraHhEWWV5azhySjhLcWpT?=
 =?utf-8?B?SjVnY1RNMHNpVTRYOUl4Y0kybEhrRWRCWFVxZmdrRkpvdmg3OGxnTmQ1NEdT?=
 =?utf-8?B?dGxIcFNUblFoNEpuWG9hWm4vZXdLRVlPOWR2Nm5ZSnFTTHA5OHNRUDdzSFN4?=
 =?utf-8?B?UFZRNUdCcDFLaVQ2TEovaWhQVXpiRDEzcC9FUEFWamxCQm1Ha1ovenFSd3pV?=
 =?utf-8?B?MFhpL3JEQUsycGVtbGJ3U3B6TDcwcU00US9LSFNnWUdHcDVlV2RLdzBDbU9x?=
 =?utf-8?B?aFVtVzBzS3I0MTI2c0xITnRPbEZ2c3VIK2RSZ05XRGtYVXRzY3Y0K2FLbDJr?=
 =?utf-8?B?aUpCakdkZmlJaUQwbVhsNHpaTWlwWEVKSTM5VGZQbTFpVkg2WlR0MG1vQ3lS?=
 =?utf-8?B?WndoTUlmU3Z0WFBEZjY2eXc4K0tzaVR5RXVjakhaRDNGMjg5OGdOSDlhL09j?=
 =?utf-8?B?K051M1pBbE9aRzZhaHVQL2hTSDBjcVhQNThFTUZtZ0d1SnV4L1R1WUduZndE?=
 =?utf-8?B?SXY0TzRocXUzaWpOazZIcEoxWFVOVTArNElUdGJYL0dvcEpUU2l5RjNHQWVY?=
 =?utf-8?B?U1BwOUxwYUJTREFRckFQQ2pVOEVIRDNvblR5NmlmalRyeUF6K0NNTGFjcjRt?=
 =?utf-8?B?dm4zSUZleXVzTkR1Ykx2Z0NSMmsyMXhuUTJuU2s1VXptOFNSbFRpeXk1SDNL?=
 =?utf-8?B?UnRBMXViKzZaZ0x2eG45S0dqM09PckN1eW1yVHRRMHlVNGpOM1JSaUdieGF0?=
 =?utf-8?B?NllMVENtdURNd0xqNDJRVU81c2c0bUFwcjQreWRZbXpzYmpqZTZ6STlyckti?=
 =?utf-8?B?cWhhZDBTUlVNQmtzMWdQMFNLQ3NTbVg2UjEyZWt6ZlRrcC9uMStHSHZkRUgr?=
 =?utf-8?B?SUI2bG4vbU5RMFp2QXJtU212ZHlRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G4z/Cj/B33xnjhaFy2kPHso1dNsZn/NNIoxKS/OXdZpaR6G2MpIC9ALa5Uw4W7RRd/VtAwdUJKXPRORbyIh5RE9zdg1AgxJhT3hn8HnaDAr2Z5Bst/f2+Y26JtY2uWB3a7gFSp9X/9dmrlmKcLv2e3iEqtdmhwEapQ2+1Fv0sVcYf5IioRTVYhHDKJyNQE0UZE1fXRuU5fZz3cna2eqfz+jp/cZzu//uJvSuD73wvRNHjqNsdtPn/xJyTD04bpsIL7d9KLV631FyQ9r6Eb92YIxdToefVqSBz9o6MsNpwswHflf4KgZdy+KIqKsWvL1Z1/l6I0cU3t5urrzZ++1XaOh7T3+oBL8BOtiSoOWVQN9XNtBYSfGNTHb/lrb8Tz4l2pcymAFN+/DPTRn7FYNgRARtlgGqHzxFdbvSeFQDy/g0S9XF6ISc/sd4vL9BAKNi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:44:50.3862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dae8e6e8-77ce-4343-310e-08de655bfd9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8959DFBA7A
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 271 ++++++++++++++++++++++++++++++------
 include/drm/drm_buddy.h     |   3 +
 2 files changed, 229 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f2c92902e4a3..fc4fa444b506 100644
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
@@ -76,26 +89,42 @@ static bool rbtree_is_empty(struct rb_root *root)
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
+	unsigned int block_alignment, order;
+	struct drm_buddy_block *node;
+	struct rb_root *root;
+
+	order = drm_buddy_block_order(block);
+	block_alignment = drm_buddy_block_offset_alignment(block);
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
+		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
+			link = &parent->rb_left;
+		else
+			link = &parent->rb_right;
+	}
+
+	block->subtree_max_alignment = block_alignment;
+	rb_link_node(&block->rb, parent, link);
+	rb_insert_augmented(&block->rb, root, &drm_buddy_augment_cb);
 }
 
 static void rbtree_remove(struct drm_buddy *mm,
@@ -108,7 +137,7 @@ static void rbtree_remove(struct drm_buddy *mm,
 	tree = get_block_tree(block);
 	root = &mm->free_trees[tree][order];
 
-	rb_erase(&block->rb, root);
+	rb_erase_augmented(&block->rb, root, &drm_buddy_augment_cb);
 	RB_CLEAR_NODE(&block->rb);
 }
 
@@ -798,6 +827,132 @@ alloc_from_freetree(struct drm_buddy *mm,
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
@@ -1067,6 +1222,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
 static struct drm_buddy_block *
 __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			 u64 start, u64 end,
+			 u64 size, u64 min_block_size,
 			 unsigned int order,
 			 unsigned long flags)
 {
@@ -1074,6 +1230,11 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
@@ -1145,8 +1306,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
 
@@ -1157,43 +1321,60 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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

