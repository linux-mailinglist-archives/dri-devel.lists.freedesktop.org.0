Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F4A541C2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B1910E8D9;
	Thu,  6 Mar 2025 04:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dn+Qu8bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9410E8D8;
 Thu,  6 Mar 2025 04:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggu5p4kxFlm2+PduEV84jlg9TLFACTfOwisVNksUJHCDo9JILXJrnjcgwO2vikAD9IszqJvljyGJ1OykhkWQ186gFbzLgqPvfnEhZCLVOK+BYdwjtyNVv0hs7XGZSb6w1s7W+aiVAu4xPhYCRRo/vVOYHjeocF6wB/pGVGKD9zVG7/qyLzKdZUC03QGhdGtVjJgVjEVhWF3mDlX3gNm68pjiMz001ac2jqkNhGsY2KSlqmdrDrh1MZbFXhpiW8J+58mSjFfv3AadbxfoL7yWl7AUmzSMu0iH/mt91NVMD6JE6I5PbNdQJmmz6Qdwcm6B1MVafcyV4O0PYx7FNS5R5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTNdNLLeCR5CI6CJehh6Vp7DdtRyNzZCWL+jaDx0eCw=;
 b=WJO/j4FpUTSIxMviZjVTh5pwsJo6Anq0ynWF4NAWfS55/SAGbFNbHR0AxxjNsdK0+BzKVkF9yxKKXRk+nRJOqdw6al31InMqyTJ8Pvd29zZcVZmQNMEwBLNkYZPG4S4HgN2LlgWXS/Upu4zy8haRpyCI6vcpg3Ftg28bKVXbLQQyStZeDJzYO2Jgs8MZ3ClXiNfode0TXf7MWCt+EotPZVBkqUjW0GrUYcNbMYdbxBLVTwGFeh7nO5Fp7TVBV9PfFSEDbr/32L/7PKnfnWlg8BlitTQO0Iv+pXFNiaPlnMhOniQMThpfKu5r7zgplZzLKj3fYDvy+M7ReDHROzM+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTNdNLLeCR5CI6CJehh6Vp7DdtRyNzZCWL+jaDx0eCw=;
 b=dn+Qu8bsphe6yqURxs+q3gVPyjJcy52UntQSXrfEqqyo6MDenZURYOKkj7/7i+sYqPaBmJiZHEZhRubMuxLNd67bgnE9+6S+8Ou1LHot5NHmuB92/0B3oXsmKsfYGqnZa1U5xMIvk1sBwKlWlIMONZc2IZzuI0NiQAgE8/UC9B92uK9toPcsW6Ypo891ed62lXDuuoCkJGk/mZJLpQrNFMJwV6/GHxw2VHOcmu3bzUBjB4KlwP3+XxSeOhHMeEJdfp+UzU8ydXWo210w6cXlZqUQ/IXRC0pFtDpMS72Q2BpCWyBN3bxrxwbwL4LQtmt37vEnpMlfEgGHgpWdfSd8Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 04:43:47 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:43:47 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 04/11] mm/migrate_device: THP migration of zone device pages
Date: Thu,  6 Mar 2025 15:42:32 +1100
Message-ID: <20250306044239.3874247-5-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::32) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc6b347-22ea-4791-c3ff-08dd5c697b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wl3rA+uf2Q9BMTh8QkauWc4n017jLLH0Ae8dkr7Fa2NFO4wQSsLMJf+ThVik?=
 =?us-ascii?Q?VsoMW8zScgTYtgGiyp/ZKzJd4pyYZZpVPdvxrQkOMCnph6rMV63ef8B354GL?=
 =?us-ascii?Q?N2bT13PXvpxfm2/gl1Gu6xHp48sAmtGzJIm/T498cS1a8W8gkHuhTwcLUiHc?=
 =?us-ascii?Q?YVz2n5SPZpkOxsi1HZyHG9uDf8kmTlRlYbT0BIyywl1DPuvWLSIFQyhccqwq?=
 =?us-ascii?Q?co3EyNkI9e8TNrmbh+CTorlm/BcU04YK2jeLmI9Yd2O97jVXj4QucskRuHlD?=
 =?us-ascii?Q?8xui4WXdch4v6gO8Z3F0tdkdlskw+xWo1PPf2B2FuA0XSjm6I2nJXwDYDIUd?=
 =?us-ascii?Q?5gbfXbhYvM7R1YKHq+TgmGIf7BFfMqygZk3wHJAC6JIy4LYi2Cn5b++mrp0A?=
 =?us-ascii?Q?tOeE8gXuaA1NB2QzBJfc2WjG/9B/E0WOY7ezV6Byg62jwJc79xl3fsxQVc9K?=
 =?us-ascii?Q?qvpZKGvsSS3NYh3hT3vFfgnYckqYwnDGOFFxN1Giaz2HKOLyx6478n6Sri+C?=
 =?us-ascii?Q?da1A3k4grYiYcawNg16TVv0zlnba8ThVXyN0MuTZP4SKBk4yQlMnD+uaTXM/?=
 =?us-ascii?Q?+5MMuPoySGOJAQI8jqoFDwYqBrUTRj5FV3jnQk8z9T+aZ2NBGMCYuZpWg6hT?=
 =?us-ascii?Q?c/mlSVIbpmFdISbqVCxvdtGk4g+bTDZEPiUdRkXe0tcp5igR6W4o5fIXlqKy?=
 =?us-ascii?Q?sI9T/jWw808XprKCjc17W9BLZoWcDxcxJYOMToJoV35/KXMAuDoB0un4fClo?=
 =?us-ascii?Q?va3rLzvcyw/1xmizXQgrQm33qrSXM3K3Vr8UNqTWK4ed90sjFRiHaIa5YGQm?=
 =?us-ascii?Q?CPNJ9u+drGcDm6/iuGzdl83Y9iGuN/hvb5KpBcBZBBrO1YoX+SavcgB0WLty?=
 =?us-ascii?Q?LwdZCHDHG5KiaiTkTdy1jxHqzl+cm6+8+rSCCNNIHvp+ANducRjORCyKOWgN?=
 =?us-ascii?Q?+b/aiIanSKcr4qIX6g4b78cf4CJvYZG8+3d61yA//aR6SCXbTGJJiBOgkhCm?=
 =?us-ascii?Q?n6Fw7zwm+S7/N3fIij6slvJ3oodsAyg5T5KDCSyrJlRWE53b18f1zIB+njwl?=
 =?us-ascii?Q?Qty7o41nFizw+YoxVBN2vsaY6oea9zRZSs0Icjzab/pOE8N+7SA07YWe8/GH?=
 =?us-ascii?Q?YTXCltwAPw3Nebs/Qg9+A4nF8E2SrXY9Ubse37plmqJo9snBNGVxwufl3fxd?=
 =?us-ascii?Q?VkWKjspf9CiAc2tVGOPTNuqIaDTkpChqZ/cOKK6pZMbcOmu4KjKqXrOTz5So?=
 =?us-ascii?Q?WRNouW/TPGOTNdrmhqCudJghhGjQdA1YaQfiULrE0Bnp0vKmxkayIJu1soqo?=
 =?us-ascii?Q?nGknHhDSY4sZ/DTzyw14wFgjnhkuMm7075hiYfzT/04KwKQIPu3DsAgRh7HP?=
 =?us-ascii?Q?gin8+taS06TVIhkMns8pOPsl5rxn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TcYdEHrkvbPQ3F0knUJbvADOzJyyDrKTKZiRYlgDOFxOZnKmGnf2mBtezp/P?=
 =?us-ascii?Q?DUOl0FHBmgtm2691hNq8Mz1a8DqKBb2XFhYV8MUmPcv9jZ5fiy1dDUv1gYvO?=
 =?us-ascii?Q?0TTHgN0VXDeG9UFExi1US6pUyiy1Qm6gA3Ehd0nfjtjr513r5yRSCQylQ4rg?=
 =?us-ascii?Q?ysbIpNvCklIM9j3ZpRrEF2OArJ5+o+AaeLERnnU4JqOOyWCcG8jZpNYwqL/s?=
 =?us-ascii?Q?qxB6zzyhyaW3gVZ7lhzglIYxojunAM6Wsd3wSX5sIL85I9WPGP1Tg4+XsHus?=
 =?us-ascii?Q?X2Ker59sFR5IHWbSVTpRQs3fWfUGFnApXNqHIWwzjS56iX4RG2QohbZXvikW?=
 =?us-ascii?Q?tLrUm2clkJa6uJwafiOs5Es+MN4KnZ/BMvVonb76K8w6QmJQgEOF5ubS0JjZ?=
 =?us-ascii?Q?qreTvetz81XL5VtrBx0cm78jMHWk3+T19MDnxkIYdkTgUlD+2Dv6D/kuTLke?=
 =?us-ascii?Q?Cr7Xwz/LRkgKf46dwS9ZFKVIRo2xVWiNcmhzzczhIt6i9v0MK25AbEq1FiQ8?=
 =?us-ascii?Q?188vc9OPTzOEEMUHzhglmRuSINwy/YpNvDpCOsxopoj24kpxWU7ft9kW/pkN?=
 =?us-ascii?Q?moC2mMiSSkH2sni1b/W9nXPpMDAMakA4iMUoDvMTEVATyvEninqO6x59DyEa?=
 =?us-ascii?Q?6qZoMua/XI1ZlcmdZ4Daedqb+kXSZa4ENiA/RpfPo0NpFCNyhHabOJJjYE8h?=
 =?us-ascii?Q?G3v+OJnAG450Dc9To8QsnIJ/RNSsLvvTgcDj/SW18SuRFZpWuSwqADebDQSP?=
 =?us-ascii?Q?NjUCLktYzZK9IKPuBbW0rpMpxKRKVFtJ4Zg7BxDy97v8D0fF/8YBxAo9FFqG?=
 =?us-ascii?Q?rJ3jHJKcHiPkz2Eye94JjlIXwXHrDnNuvPi2eEGXSeJT6MvBd4aRW4E/f0Cf?=
 =?us-ascii?Q?HfGAs+WOqE1L8+5zp1iyPCYvwvu05BcztMhUWGGvZRXTBkUkRL0QfHrxO9r5?=
 =?us-ascii?Q?F8d3Ga0XxshYINUGuZrYmUFcERP6CsxhcWYBsxYk41iKfiV1HqAWEp6p090t?=
 =?us-ascii?Q?OVKFaMqJCm9unrhGOF9djMu5vgRNXmGJnbYWwmZ3D2p+9mqj28IX1EoSLgnl?=
 =?us-ascii?Q?QR6dnCm7utheUA7ucoQPmEZ/1304GtVoox18eiMU4ADtvdUaSdJwE0B7BFn0?=
 =?us-ascii?Q?1+p2KCH5rRZseNsJ040pY/XNH6KDqC3zKKF7NSs4jIiJEckcdEeF649eMPWi?=
 =?us-ascii?Q?gY1QlMMqYNPtW924P1SNgo4HLEcSOvAYhyYU1mUuB1/k5+0ZF8Z1lw64unZd?=
 =?us-ascii?Q?1HdVUcp6bC4PjYu+Gk5XMKLKn4bUhjIf1kOYaJXUPoVqe69HICx8NM3gVKmT?=
 =?us-ascii?Q?cIrM0N1MVxUUE1pZIuVoNLzdJ0frzpBUgNsNcEU0Cs9XqpgCbckVA3+A4tTG?=
 =?us-ascii?Q?Gjvi8EaEEERyJTT/buj47lT+o8HkvLIiP3DquvI+c2hkCt8YkQ9YSsRm7uuN?=
 =?us-ascii?Q?gfwW5PoKBIN27MYTCtbSilKtR7JGjfm/3dZqnXCKdYEzvpHzxB6BimaUq/Pm?=
 =?us-ascii?Q?xOKBMotCJlwacqWOe3BpUCrE+cENSzQwWli3VYuhkETfPpZ41NOL93zEfyCv?=
 =?us-ascii?Q?rEfjw0UJfIkq2eirwekQyPkK3pjXZqVmSmBupVRb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc6b347-22ea-4791-c3ff-08dd5c697b8a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:43:47.1511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkKCDzb86rbpf4G78jC8+yHg1FkM5qoFbPdkmfRlVX5sK8xo0P3bbB2AQxa7aBfaKke1OCjQVXkqkWs/L1z+xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
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

migrate_device code paths go through the collect, setup
and finalize phases of migration. Support for MIGRATE_PFN_COMPOUND
was added earlier in the series to mark THP pages as
MIGRATE_PFN_COMPOUND.

The entries in src and dst arrays passed to these functions still
remain at a PAGE_SIZE granularity. When a compound page is passed,
the first entry has the PFN along with MIGRATE_PFN_COMPOUND
and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
representation allows for the compound page to be split into smaller
page sizes.

migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
page aware. Two new helper functions migrate_vma_collect_huge_pmd()
and migrate_vma_insert_huge_pmd_page() have been added.

migrate_vma_collect_huge_pmd() can collect THP pages, but if for
some reason this fails, there is fallback support to split the folio
and migrate it.

migrate_vma_insert_huge_pmd_page() closely follows the logic of
migrate_vma_insert_page()

Support for splitting pages as needed for migration will follow in
later patches in this series.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/migrate_device.c | 436 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 379 insertions(+), 57 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 7d0d64f67cdf..f3fff5d705bd 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -14,6 +14,7 @@
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
 #include <linux/swapops.h>
+#include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
 
@@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
 	if (!vma_is_anonymous(walk->vma))
 		return migrate_vma_collect_skip(start, end, walk);
 
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
+						MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages] = 0;
+		migrate->npages++;
+		migrate->cpages++;
+
+		/*
+		 * Collect the remaining entries as holes, in case we
+		 * need to split later
+		 */
+		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+	}
+
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
 		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
 		migrate->dst[migrate->npages] = 0;
@@ -54,50 +72,145 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
-static int migrate_vma_collect_pmd(pmd_t *pmdp,
-				   unsigned long start,
-				   unsigned long end,
-				   struct mm_walk *walk)
+/**
+ * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
+ * folio for device private pages.
+ * @pmdp: pointer to pmd entry
+ * @start: start address of the range for migration
+ * @end: end address of the range for migration
+ * @walk: mm_walk callback structure
+ *
+ * Collect the huge pmd entry at @pmdp for migration and set the
+ * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
+ * migration will occur at HPAGE_PMD granularity
+ */
+static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
+					unsigned long end, struct mm_walk *walk)
 {
+	struct mm_struct *mm = walk->mm;
+	struct folio *folio;
 	struct migrate_vma *migrate = walk->private;
-	struct vm_area_struct *vma = walk->vma;
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long addr = start, unmapped = 0;
+	swp_entry_t entry;
+	int ret;
+	unsigned long write = 0;
+
 	spinlock_t *ptl;
-	pte_t *ptep;
 
-again:
-	if (pmd_none(*pmdp))
+	ptl = pmd_lock(mm, pmdp);
+	if (pmd_none(*pmdp)) {
+		spin_unlock(ptl);
 		return migrate_vma_collect_hole(start, end, -1, walk);
+	}
 
 	if (pmd_trans_huge(*pmdp)) {
-		struct folio *folio;
-
-		ptl = pmd_lock(mm, pmdp);
-		if (unlikely(!pmd_trans_huge(*pmdp))) {
+		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
-			goto again;
+			return migrate_vma_collect_skip(start, end, walk);
 		}
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
 			spin_unlock(ptl);
-			split_huge_pmd(vma, pmdp, addr);
-		} else {
-			int ret;
+			return migrate_vma_collect_hole(start, end, -1, walk);
+		}
+		if (pmd_write(*pmdp))
+			write = MIGRATE_PFN_WRITE;
+	} else if (!pmd_present(*pmdp)) {
+		entry = pmd_to_swp_entry(*pmdp);
+		folio = pfn_swap_entry_folio(entry);
+
+		if (!is_device_private_entry(entry) ||
+			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
+			(folio->pgmap->owner != migrate->pgmap_owner)) {
+			spin_unlock(ptl);
+			return migrate_vma_collect_skip(start, end, walk);
+		}
 
-			folio_get(folio);
+		if (is_migration_entry(entry)) {
+			migration_entry_wait_on_locked(entry, ptl);
 			spin_unlock(ptl);
-			if (unlikely(!folio_trylock(folio)))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			ret = split_folio(folio);
-			folio_unlock(folio);
-			folio_put(folio);
-			if (ret)
-				return migrate_vma_collect_skip(start, end,
-								walk);
+			return -EAGAIN;
 		}
+
+		if (is_writable_device_private_entry(entry))
+			write = MIGRATE_PFN_WRITE;
+	} else {
+		spin_unlock(ptl);
+		return -EAGAIN;
+	}
+
+	folio_get(folio);
+	if (unlikely(!folio_trylock(folio))) {
+		spin_unlock(ptl);
+		folio_put(folio);
+		return migrate_vma_collect_skip(start, end, walk);
+	}
+
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
+
+		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+						| MIGRATE_PFN_MIGRATE
+						| MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages++] = 0;
+		migrate->cpages++;
+		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (ret) {
+			migrate->npages--;
+			migrate->cpages--;
+			migrate->src[migrate->npages] = 0;
+			migrate->dst[migrate->npages] = 0;
+			goto fallback;
+		}
+		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+		spin_unlock(ptl);
+		return 0;
+	}
+
+fallback:
+	spin_unlock(ptl);
+	ret = split_folio(folio);
+	folio_unlock(folio);
+	folio_put(folio);
+	if (ret)
+		return migrate_vma_collect_skip(start, end, walk);
+	if (pmd_none(pmdp_get_lockless(pmdp)))
+		return migrate_vma_collect_hole(start, end, -1, walk);
+
+	return -ENOENT;
+}
+
+static int migrate_vma_collect_pmd(pmd_t *pmdp,
+				   unsigned long start,
+				   unsigned long end,
+				   struct mm_walk *walk)
+{
+	struct migrate_vma *migrate = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long addr = start, unmapped = 0;
+	spinlock_t *ptl;
+	pte_t *ptep;
+
+again:
+	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
+		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk);
+
+		if (ret == -EAGAIN)
+			goto again;
+		if (ret == 0)
+			return 0;
 	}
 
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
@@ -168,8 +281,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
 
-		/* FIXME support THP */
-		if (!page || !page->mapping || PageTransCompound(page)) {
+		if (!page || !page->mapping) {
 			mpfn = 0;
 			goto next;
 		}
@@ -339,14 +451,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 	 */
 	int extra = 1 + (page == fault_page);
 
-	/*
-	 * FIXME support THP (transparent huge page), it is bit more complex to
-	 * check them than regular pages, because they can be mapped with a pmd
-	 * or with a pte (split pte mapping).
-	 */
-	if (folio_test_large(folio))
-		return false;
-
 	/* Page from ZONE_DEVICE have one extra reference */
 	if (folio_is_zone_device(folio))
 		extra++;
@@ -375,17 +479,24 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 	lru_add_drain();
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
+		unsigned int nr = 1;
 
 		if (!page) {
 			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
 				unmapped++;
-			continue;
+			goto next;
 		}
 
 		folio =	page_folio(page);
+		nr = folio_nr_pages(folio);
+
+		if (nr > 1)
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+
+
 		/* ZONE_DEVICE folios are not on LRU */
 		if (!folio_is_zone_device(folio)) {
 			if (!folio_test_lru(folio) && allow_drain) {
@@ -397,7 +508,7 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 			if (!folio_isolate_lru(folio)) {
 				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
-				continue;
+				goto next;
 			}
 
 			/* Drop the reference we took in collect */
@@ -416,10 +527,12 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			restore++;
-			continue;
+			goto next;
 		}
 
 		unmapped++;
+next:
+		i += nr;
 	}
 
 	for (i = 0; i < npages && restore; i++) {
@@ -562,6 +675,146 @@ int migrate_vma_setup(struct migrate_vma *args)
 }
 EXPORT_SYMBOL(migrate_vma_setup);
 
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+/**
+ * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
+ * at @addr. folio is already allocated as a part of the migration process with
+ * large page.
+ *
+ * @folio needs to be initialized and setup after it's allocated. The code bits
+ * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
+ * not support THP zero pages.
+ *
+ * @migrate: migrate_vma arguments
+ * @addr: address where the folio will be inserted
+ * @folio: folio to be inserted at @addr
+ * @src: src pfn which is being migrated
+ * @pmdp: pointer to the pmd
+ */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	struct vm_area_struct *vma = migrate->vma;
+	gfp_t gfp = vma_thp_gfp_mask(vma);
+	struct folio *folio = page_folio(page);
+	int ret;
+	spinlock_t *ptl;
+	pgtable_t pgtable;
+	pmd_t entry;
+	bool flush = false;
+	unsigned long i;
+
+	VM_WARN_ON_FOLIO(!folio, folio);
+	VM_WARN_ON_ONCE(!pmd_none(*pmdp) && !is_huge_zero_pmd(*pmdp));
+
+	if (!thp_vma_suitable_order(vma, addr, HPAGE_PMD_ORDER))
+		return -EINVAL;
+
+	ret = anon_vma_prepare(vma);
+	if (ret)
+		return ret;
+
+	folio_set_order(folio, HPAGE_PMD_ORDER);
+	folio_set_large_rmappable(folio);
+
+	if (mem_cgroup_charge(folio, migrate->vma->vm_mm, gfp)) {
+		count_vm_event(THP_FAULT_FALLBACK);
+		count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
+		ret = -ENOMEM;
+		goto abort;
+	}
+
+	__folio_mark_uptodate(folio);
+
+	pgtable = pte_alloc_one(vma->vm_mm);
+	if (unlikely(!pgtable))
+		goto abort;
+
+	if (folio_is_device_private(folio)) {
+		swp_entry_t swp_entry;
+
+		if (vma->vm_flags & VM_WRITE)
+			swp_entry = make_writable_device_private_entry(
+						page_to_pfn(page));
+		else
+			swp_entry = make_readable_device_private_entry(
+						page_to_pfn(page));
+		entry = swp_entry_to_pmd(swp_entry);
+	} else {
+		if (folio_is_zone_device(folio) &&
+		    !folio_is_device_coherent(folio)) {
+			goto abort;
+		}
+		entry = mk_pmd(page, vma->vm_page_prot);
+		if (vma->vm_flags & VM_WRITE)
+			entry = pmd_mkwrite(pmd_mkdirty(entry), vma);
+	}
+
+	ptl = pmd_lock(vma->vm_mm, pmdp);
+	ret = check_stable_address_space(vma->vm_mm);
+	if (ret)
+		goto abort;
+
+	/*
+	 * Check for userfaultfd but do not deliver the fault. Instead,
+	 * just back off.
+	 */
+	if (userfaultfd_missing(vma))
+		goto unlock_abort;
+
+	if (!pmd_none(*pmdp)) {
+		if (!is_huge_zero_pmd(*pmdp))
+			goto unlock_abort;
+		flush = true;
+	} else if (!pmd_none(*pmdp))
+		goto unlock_abort;
+
+	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
+	if (!folio_is_zone_device(folio))
+		folio_add_lru_vma(folio, vma);
+	folio_get(folio);
+
+	if (flush) {
+		pte_free(vma->vm_mm, pgtable);
+		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
+		pmdp_invalidate(vma, addr, pmdp);
+	} else {
+		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
+		mm_inc_nr_ptes(vma->vm_mm);
+	}
+	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
+	update_mmu_cache_pmd(vma, addr, pmdp);
+
+	spin_unlock(ptl);
+
+	count_vm_event(THP_FAULT_ALLOC);
+	count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
+	count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
+
+	return 0;
+
+unlock_abort:
+	spin_unlock(ptl);
+abort:
+	for (i = 0; i < HPAGE_PMD_NR; i++)
+		src[i] &= ~MIGRATE_PFN_MIGRATE;
+	return 0;
+}
+#else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	return 0;
+}
+#endif
+
 /*
  * This code closely matches the code in:
  *   __handle_mm_fault()
@@ -572,9 +825,10 @@ EXPORT_SYMBOL(migrate_vma_setup);
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
-				    struct page *page,
+				    unsigned long *dst,
 				    unsigned long *src)
 {
+	struct page *page = migrate_pfn_to_page(*dst);
 	struct folio *folio = page_folio(page);
 	struct vm_area_struct *vma = migrate->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -602,8 +856,25 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	pmdp = pmd_alloc(mm, pudp, addr);
 	if (!pmdp)
 		goto abort;
-	if (pmd_trans_huge(*pmdp) || pmd_devmap(*pmdp))
-		goto abort;
+
+	if (thp_migration_supported() && (*dst & MIGRATE_PFN_COMPOUND)) {
+		int ret = migrate_vma_insert_huge_pmd_page(migrate, addr, page,
+								src, pmdp);
+		if (ret)
+			goto abort;
+		return;
+	}
+
+	if (!pmd_none(*pmdp)) {
+		if (pmd_trans_huge(*pmdp)) {
+			if (!is_huge_zero_pmd(*pmdp))
+				goto abort;
+			folio_get(pmd_folio(*pmdp));
+			split_huge_pmd(vma, pmdp, addr);
+		} else if (pmd_leaf(*pmdp))
+			goto abort;
+	}
+
 	if (pte_alloc(mm, pmdp))
 		goto abort;
 	if (unlikely(anon_vma_prepare(vma)))
@@ -694,23 +965,24 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 	unsigned long i;
 	bool notified = false;
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
 		struct folio *newfolio, *folio;
 		int r, extra_cnt = 0;
+		unsigned long nr = 1;
 
 		if (!newpage) {
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		if (!page) {
 			unsigned long addr;
 
 			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
-				continue;
+				goto next;
 
 			/*
 			 * The only time there is no vma is when called from
@@ -728,15 +1000,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-			migrate_vma_insert_page(migrate, addr, newpage,
+
+			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
+				nr = HPAGE_PMD_NR;
+				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				goto next;
+			}
+
+			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
 						&src_pfns[i]);
-			continue;
+			goto next;
 		}
 
 		newfolio = page_folio(newpage);
 		folio = page_folio(page);
 		mapping = folio_mapping(folio);
 
+		/*
+		 * If THP migration is enabled, check if both src and dst
+		 * can migrate large pages
+		 */
+		if (thp_migration_supported()) {
+			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+
+				if (!migrate) {
+					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
+							 MIGRATE_PFN_COMPOUND);
+					goto next;
+				}
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			}
+		}
+
+
 		if (folio_is_device_private(newfolio) ||
 		    folio_is_device_coherent(newfolio)) {
 			if (mapping) {
@@ -749,7 +1053,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				if (!folio_test_anon(folio) ||
 				    !folio_free_swap(folio)) {
 					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-					continue;
+					goto next;
 				}
 			}
 		} else if (folio_is_zone_device(newfolio)) {
@@ -757,7 +1061,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		BUG_ON(folio_test_writeback(folio));
@@ -769,6 +1073,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 		else
 			folio_migrate_flags(newfolio, folio);
+next:
+		i += nr;
 	}
 
 	if (notified)
@@ -899,24 +1205,40 @@ EXPORT_SYMBOL(migrate_vma_finalize);
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, pfn;
+	unsigned long i, j, pfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct folio *folio;
+	i = 0;
+	pfn = start;
+	while (i < npages) {
+		struct page *page = pfn_to_page(pfn);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
 		folio = folio_get_nontail_page(pfn_to_page(pfn));
 		if (!folio) {
 			src_pfns[i] = 0;
-			continue;
+			goto next;
 		}
 
 		if (!folio_trylock(folio)) {
 			src_pfns[i] = 0;
 			folio_put(folio);
-			continue;
+			goto next;
 		}
 
 		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j;
+			pfn += j;
+			continue;
+		}
+next:
+		i++;
+		pfn++;
 	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
-- 
2.48.1

