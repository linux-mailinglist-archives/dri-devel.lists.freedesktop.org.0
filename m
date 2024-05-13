Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3778C4355
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 16:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E1110E7E6;
	Mon, 13 May 2024 14:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="o4DNDdcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2092.outbound.protection.outlook.com [40.92.23.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74210E7E6;
 Mon, 13 May 2024 14:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5XT2txjeD3zL/PxVykda5MpEWVeN06RoCIfruhaSdQzL0FWz5P7M/rZ5X/Q3sAQMvGG/EW8Ekw5Epz30ZHmLIKOgP0P50piI1/dqs9IDWrCi4uaAVQYijiSNLidwueaofum455/kJJRZ8wWDa/tr2pHscCLzGzbSLvr+CO+4R/PgGhoG6JSIhO8jiMqz/SirjR7qISBf1o8UJ3GGyt0bex9dwxFfCc9OoFhU+AFWQZqY5LU2DZOMKflzRhErdXU1xUwo08msaoAEHUbeGIw8ZFHH9eQ0huD7piV3Nn5XunyxsavlDIldSmB+DBOWVyoTJhg3bH6hHY3ZT4ar6KMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=io7tNMpbOIsc/Devg/AdRlyTB4Dnardyd+SX0B8fH0A=;
 b=cnHK4tO0oI9H/iwPPzEpV8qNsg9E/tRmmrNe1lcUtweofskOhg3bS9hTlQiuIhm5xdh0j/ebCIjao1pha6Eb2klIe4SIwJZiJu9St6WXKhdqFduboHTWPfTnzLkpY5z7IGhszDZSLKXormHo6IHiDePzs4qzfwhyvCrRIvHxN0IN22wcgHoEokWt9MIzriPq+BkFBIgcLnnr/dIqX0kgH6oEztjCrChtHmMWVYXk+d4bTxn61yxt1NFD2CvOJftjFy24euFzzmUDIe55lj82vw9nSrRmy555YmAH14Of05OguwLlxaIEfWOJ1mMVLgrh2bss0b+DvR6m0aLL2GVUDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=io7tNMpbOIsc/Devg/AdRlyTB4Dnardyd+SX0B8fH0A=;
 b=o4DNDdcE+yFuuLzLwKvZ33eeHB3qqYMW+LpuPS+Yo+s64WcLcUGM2R+OUgPqDzHUTY/uJNA93c7PM9BMw9XymBwfTbLfwy1mOcnwLbNRQKKgWe8cBzrr2DzNIBGcLmuPbsQadTFRaPw8VxNsSF/8+kz4h2uJgSOwD4JD9DHqvHzrGA0YgFSm61uhOsmO5wfX/Vez7zt5ALTYjeyZiPJncL65LVGFsnG+U5Qx+AP0lIwvf4qnSZx/iMLLxvQ6REfvwtNGEhTawgQcSb3PNkaKCOIWjqiZ11Xvw7CWLeWDwY0SjgbeDo7ejiNG5D7CuXmbelO6emd9q3BlNcIdJkbgXw==
Received: from BYAPR03MB4168.namprd03.prod.outlook.com (2603:10b6:a03:78::23)
 by SJ0PR03MB6730.namprd03.prod.outlook.com (2603:10b6:a03:405::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 14:35:57 +0000
Received: from BYAPR03MB4168.namprd03.prod.outlook.com
 ([fe80::b8b1:7fdc:95d4:238a]) by BYAPR03MB4168.namprd03.prod.outlook.com
 ([fe80::b8b1:7fdc:95d4:238a%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 14:35:56 +0000
From: Jiasheng Jiang <jiashengjiangcool@outlook.com>
To: nirmoy.das@linux.intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 chris@chris-wilson.co.uk
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@outlook.com>
Subject: [PATCH v2] drm/i915: Fix memory leak by correcting cache object name
 in error handler
Date: Mon, 13 May 2024 14:35:48 +0000
Message-ID: <BYAPR03MB4168C6D020B750EAF8021731ADE22@BYAPR03MB4168.namprd03.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [nbHuf0Huc2lUYpRMJ7Cv6aulzoshEwyI]
X-ClientProxiedBy: CH3P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1e8::10) To BYAPR03MB4168.namprd03.prod.outlook.com
 (2603:10b6:a03:78::23)
X-Microsoft-Original-Message-ID: <20240513143548.2670-1-jiashengjiangcool@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB4168:EE_|SJ0PR03MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 991093dc-59c7-459d-264d-08dc7359fff8
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199019|440099019|3412199016|3430499023|3420499023|1710799017; 
X-Microsoft-Antispam-Message-Info: iHJaGdwxz6+ApXs0JqNOTpOL/vDcBTcavGHqrVxqYqAoFjr4XavK0InF37wo33fnKl2NAQfDJyBpq2adD4QcnOnMbD94VeNCX9K/uxON9HKp9jW4VQJGMbs7EIFRZPWowhuGgyJqxksnoMumYUchqjCiTIRoQG6vJg0c6dEWx3i2QLM/+8Rux4hSfhUX0F5TVt0Za69V93qCv+BECDjBgpsz6vd8EgTRbgiawZ3B4JOFxue0vwGz+17Jx3GrXEM5dhIl7ZqLNzUlpig/RMdjyb5l6ugEQw3h23C0VhDRi7tGOacjhXb9oL9TxGVa8NvNt9i24/ScHgGUQnWf/DTB1WI4h4sG/qzTKq7rYJLcUOGHH/cNTPieZz54KsKR8JXA4OsRrCuPBEh5hJ67L+0MGD0DRH+cfchiYB8Z4gjXcuYfIUQJ4LQq8E7RZIbcs+8ELS3iYO5A5CMlhuaYmUqpfzH5CkaqT48dP/GixtjZGAQDz3K2cd6PkwUqdzpOHnz0vjAuDaM2iWnvTA6Q3rTZm8pPTKB8Ags5+1prg9pfd+9G8jcWmfhE8bXv7g1mtSQZSPTJpHqZS7pBRTKsM15aj6+GCDyj63NNiFyxEv7ELMCNtldOzDbW6WI8ELsGTsbQ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iT2kMiF4xiUPXOrovIiDX3pRnwcrN9ThKtzc5GMMnrKxSXmWLEgbNTKrweJ4?=
 =?us-ascii?Q?MM6CP+gBa4My7SiBKouReeN9x8hJJuXefjL3QabyTKHEfwBSo2SrIcKdwKR2?=
 =?us-ascii?Q?z67S18TEzXWb7qujPYpHu3OPpjnQrvAzxE5iHkk61nrLPglpEOxRDUaUi9LP?=
 =?us-ascii?Q?zai3bac3d1G6IYhkBjwHWkkDJwLaHd5WfL0Gj5COdZT6p5br+Ysz+48hG8sr?=
 =?us-ascii?Q?jIUil28+5udzDFFmyyYfANT7mERF+txNyxSM6+8Ee+qHpCZMPwF+w+dqfPEA?=
 =?us-ascii?Q?n/LqhVJQ2wbUokpfTDWdyMq6oXLn51kt+KPPmZr0sAH1l320WlfMoWL46qba?=
 =?us-ascii?Q?q7+vvpwWwoBuNy4LLukaWHRSJJjpaFCQu5UFAKQeHBZGnK/XqR3nFymOVc0x?=
 =?us-ascii?Q?UJKv1isnrlx/p3+kCb4EcIQbNtiy9MGVixZrG/oHtNz8bKStv1KQUpCaGCK7?=
 =?us-ascii?Q?/E7QhNr6HsSvo0RM3uujOAb1H7Ri4fC7PlUdKKIuSbQ2vwMSc46TP6OQ9365?=
 =?us-ascii?Q?S61szPbons49PLWwqWGkSGht9UcHYQpk9xT8sTPj+L8+npwUCRwWCHjWLWUJ?=
 =?us-ascii?Q?KoxogVwvBTanzcM9x13BFybt9KQ5emA4xcPnZCUMdhATPKvXritgt3xkO3cJ?=
 =?us-ascii?Q?JNKS6htl+1TyBz9d4MjrhMz4iFG0bYvx3AI1kWLlapf0nMZ1rys8Nz2nwrCs?=
 =?us-ascii?Q?4Xv9nEYAKaQIL5OeOXIamI0YHmgYXSJc9F0js93Objlb4gqmePQ+5NCbEagJ?=
 =?us-ascii?Q?UwX1NE9DeycNg+4C/SkWSJmIF3uKWz5uQsj+xaDciypWlVWb9MRx/8HU4LQg?=
 =?us-ascii?Q?CcuvY8i00hSyJL+NEjKy1TMc0aYU8iuStbV/0K8JtdxtteJ910vilog45a/P?=
 =?us-ascii?Q?2kwMUDKqfEA+JKQvo0JZCjrLIamz99eNxvwvmu4C6T1tUrWZe6GeS8/uUl3k?=
 =?us-ascii?Q?5uMqelS3Fq4TcYAxgl1ETiGbRu+Bq0+HJgvNiC3+iW2bgfSLstz5Z/ZkdC7f?=
 =?us-ascii?Q?IHO+C0qcoH5eqPvjKSucURmfomJe2G8tIL5z2dv+oi8kPbnRIYJ8CMg71L32?=
 =?us-ascii?Q?ajOcC5Gpa0WuXwbGCBeu+SjCKj4g0AuJhkA7yKhgUjlyXcyHJIAUiRsADTpF?=
 =?us-ascii?Q?4bZc2gH5Q0tLypQsakR2hAM4svPy/Uq15Hw3ZeQkhy7JFRCsDMDTg++HWfBA?=
 =?us-ascii?Q?QwL6S4/KUJVP94zunQ0frfHopufr3Nwmmo98hLqPMtVNvA1Dld1TpczvlcYE?=
 =?us-ascii?Q?E5LF1ZRaxpGMe5DQBhYG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991093dc-59c7-459d-264d-08dc7359fff8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4168.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 14:35:56.5840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6730
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

Replace "slab_priorities" with "slab_dependencies" in the error handler
to avoid memory leak.

Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>
---
Changelog:

v1 -> v2:

1. Alter the subject.
---
 drivers/gpu/drm/i915/i915_scheduler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 762127dd56c5..70a854557e6e 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -506,6 +506,6 @@ int __init i915_scheduler_module_init(void)
 	return 0;
 
 err_priorities:
-	kmem_cache_destroy(slab_priorities);
+	kmem_cache_destroy(slab_dependencies);
 	return -ENOMEM;
 }
-- 
2.25.1

