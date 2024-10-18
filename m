Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B989A447F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 19:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CF110E235;
	Fri, 18 Oct 2024 17:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JqZ9hpvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FCA10E235
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 17:19:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iem36KvEquJ50gHglAzUVcgBRvZY4Zaui7nd578XhzDE9zuSU6gjhnuVyqLckALVFFL3dM7QmL7N+4WnEHtCPZ4HiTp67nTaXdKsQA5vzpp5TuByJRk0mn708IFYfIZuD+PghjcZYCfxcGgZH9FeTNpIUd2hV1Uxa+MoOOYK1p3d18rg638YJNS2lO85aXwiskFt+KBdQHnNXVE3hb7Oy5tkpdO3HK5wUQkbcbwjH84aZAmgEsjHZRA+TJrtDPHnI++aImaHliDoUZ8tRDDj33dJD7toR1VWL83C1uDYfzFjAI0BK0pzqZhYMKK5a/tl8AOhqnG+wJjoURTXQAhNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxXJIqZC1PSTPYQ5PtEahEZeaPXGSZwVDqCcZifwqdI=;
 b=fi2xF3Zixdu6fy1gNlVSbmujIT8yzbFejRJalm3cjP3RbxTe0JrTZ0icCdmcERzhnfxPI3YgqH5jb1OxJPpdHhPVb+G/hEDiR2Th4aJQ9q3BrXcfw5/cdO9FMjnnFcFyQOahExWAjZ6VH8hiD1VilAHNKzva3Y4twzTIat68CUrwhwdoyHJQ6jEqCnJdKWXphblvlKY5/fkMlg7IXrp2a7qO+8yzfVwLQVRj7x559kvAVCB5X6ENcB/fwv60C1nlvPXkeiDw4uI7kQZTxczEdlJNi14sgBJHkoJtgKin4HlN5Dd1V5sZCHmTlxMCDiMY/+Xz3J6Xo2AdZsrqKECqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxXJIqZC1PSTPYQ5PtEahEZeaPXGSZwVDqCcZifwqdI=;
 b=JqZ9hpvvSJRqtqigoCB1qPbhMue7gjfmLusgkxEkwe7CXU/isT2dUTyOSi3cYYJzMA5k7PROCwYDgrUUgIBScQ6j4tOoEvAVY+pQilJlpM9UvPN10DKGTZ+SmihtxRg5j+jJ6w3Y4t57AjhjodBALhbnbg6YGXWQZNpXVZncmGtAlYAEqzrfboXawFDFf3FyC0ggb3waBQjfxBXQmDj34n7t6tGU6Qm4AbfzXztVyCpa5lRohfolrO3K53nrypT8I7R7ktsCuC2Xk2zpt6AFqqy741ieZDijrtKk/RPqXVbXl2R5Ycs0jv/K7f3CibPgdGcqjHM2R0/QLjMwnxWL+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW4PR12MB6682.namprd12.prod.outlook.com (2603:10b6:303:1e3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 17:19:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 17:19:27 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Date: Fri, 18 Oct 2024 14:19:26 -0300
Message-ID: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:408:112::19) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW4PR12MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cc54ca-dbc4-48cf-2411-08dcef9904c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PdQw2LlcAxBlrNEmdpXCIzBXatAGvGFqlR7wCqpHNCYQm3JkFsCztSx/acwq?=
 =?us-ascii?Q?acfEHWJ7ZZ4VGN3h9n0lx98WGR9ZiXLpjhdHfb+O4bPzT/V6ZTYXGWQbaf12?=
 =?us-ascii?Q?xsgVszYnkagQy3tG9T8EliOJKQ1XTMEHGpJ5efAm0rdNgdKVVR+9QrlZoslL?=
 =?us-ascii?Q?EfCPVMCC0og/fjAPL8yeGvn0s6x4ZfXu4L8o3liIsC39eaI7HOuwrCcGdGUQ?=
 =?us-ascii?Q?tV+Y3zF2qodbtPbIy6xgV3yWPahvgcbcTzSXz6LPjhnAADmeELps0qypFyBi?=
 =?us-ascii?Q?PoAuAqfXHGhYUFGHNuUmCXsvQFWkoUHIA5aF87OOkqoj1OsKjjem2wj4jMED?=
 =?us-ascii?Q?Ytj8lM/3QwSLOHdWd0xuYLkv262ROZP1bEVluNTkuGyFTHyf1UiHz9h37wRh?=
 =?us-ascii?Q?E9GeAS9EfR3H2CBOfVkOhxPqVZ0KZiqZg0yZU5lyoNIdhAKhEZNNiRA6hSLA?=
 =?us-ascii?Q?OLajRgcMiD9VQD4pY8poa0rz4azTdFLS0fPHQviTq8MS9nB7TbuOmBdpX4Q1?=
 =?us-ascii?Q?Ujq1DJqkJucKXPa2oyIpTtnsirOy+lmEwOfVbIjXTfC+PKPi3lZXSRF/fdf4?=
 =?us-ascii?Q?6roF4l2KJwmiX7V27YNE4P6XCQLk1TuZbBxCcTfM+3FtG1YDvBFpQQLwTmmK?=
 =?us-ascii?Q?rDA6Pog8QthUUHaGJKiZw5O3t6sGX2QYCq0LhFoY0F8X6j6wLtswJ/qKSguy?=
 =?us-ascii?Q?k3pSW2a+HONdJ5/T2nzXR9jIKppDqivHrPfh0dVgecwt9N58GjS7OyQyIVnA?=
 =?us-ascii?Q?MMwXimlBFGlL7MD4otwS1H+g2urunISMxkw3O+KdQC2E/HO/x9ntv9mW/0SV?=
 =?us-ascii?Q?zAc+EK4Mg/0gIWz/Y9ilmvixbMn1bnl4lpXdEV2mh4ZoTrJEKIP5XzrfN2p/?=
 =?us-ascii?Q?SdGZqBZa3DdAZ055m4xpqMu5ArlyWod3v1tPEzmjVcDJnJL+woiBh5H8pSz7?=
 =?us-ascii?Q?LPce8wSHupeODQl0Coc1LRh5twZZhjbrpH3sVEXNjSJlgiolCISK4ngFeKiN?=
 =?us-ascii?Q?9NJ/Cv8Np6wT0cG8Z+cbUur+gJ8Unt5vxsPFTTEMBSUb6wUtiqGGplAZbcdC?=
 =?us-ascii?Q?SLtTcEHRkloJGHfOF1yzqBOMFt4XwLLdL7mUc6PRxQxdd9WZujX+9YIxet4l?=
 =?us-ascii?Q?P0cYFIJgRVmlgtqyz2JqowXaQccsgzp5DnEaAmHgGhr3g8XUG8NJ7aKnHe+h?=
 =?us-ascii?Q?6z4fMeJbNIIMFGVtQUQRpIDDsu8QamPHH9AFmm67LImvL11wvZ0nCBWikX05?=
 =?us-ascii?Q?L4Xhy6SrNxoPGftbCaVSZDahahS3j5NVY1FbVFu3IkuLuNjPp7EDYl5R0i20?=
 =?us-ascii?Q?LPfx6iXc8BnPsQmwB8SSjt58?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dPi8Bvy2w2S/XN3rLuxYMisn2oiW58SDIMSNxe7fiMLcBZ3FebPJIau+HzxF?=
 =?us-ascii?Q?s4tFVjWhftzkhnn/4f909mY1qScYgyVllWsLk+xYlzhmuQNaUBpEw5vxzv3s?=
 =?us-ascii?Q?vQhv1lPAir54JvhD+AS98jNebGRGeSxJwNHI5xhjjCDY32PlWNPhsQbMtF8Z?=
 =?us-ascii?Q?Kg39G/BeNGAM/vmFGHyc0sCJEpe8XZl9osW7BA9xT1RACPJ+Y7JtxwOKm3/n?=
 =?us-ascii?Q?Y9021lvUJlG7wxv8jMqxyPAr/KJGkHJGKbwxV6T0cwvH5O+C2XWpQrXezlNz?=
 =?us-ascii?Q?tnKLNnVR2RhQ94alXQg2js3CHOi4TzYZGyWNOmHB1IpwvAKwHKTnVPiIATs7?=
 =?us-ascii?Q?YlvJO4lAblAU5DSfia68TJCI8RBlOGqhmCPgDMU+v22gOEEjG4I4JQUuG0tx?=
 =?us-ascii?Q?8MQsbLILRnlpUl8PF0vIdS1A9Aktv1kZ9GLFENaPuJX4Owa3pxZemI0g0F2k?=
 =?us-ascii?Q?HqvZboVhFBzVWl3nVBWnlL9Bd2Ost5dGZqOcHxaFWqYh8fqmCiRirbtDv4HM?=
 =?us-ascii?Q?D3pte//aEOqenm+uSYu6+fWJGHlW6AnMShY7OKCDXIzTWJDyqhntPFKkrQ0J?=
 =?us-ascii?Q?Pp7B2pvYsqQF/RDTpgcjvX4aLgJafWrqyHigR3VJQNSRb//jyu/DXNhVhQAy?=
 =?us-ascii?Q?hHMJQ1LEjTkU+E0SNYjn5Eo1WvOnEXwEl64iX+DcNgQaA7tGxxK5UNZWr9PT?=
 =?us-ascii?Q?B8SosDvOb+WwK72DwmcRavs0Fs4qErvIBClhHiiwqrysu7VqXH9wCp4J/OUn?=
 =?us-ascii?Q?1g+cUc0ZiqeZhBkabW5cBxDkY+2dUu6k3oc3FL6a/GmgWnYZEIEfGy5DI4L+?=
 =?us-ascii?Q?odewH6mco9bW/7A+oAJ4s/bydRYxvO5rYKX+cDx1FFHnZ1uHmxNUDAOenQAN?=
 =?us-ascii?Q?b+gF3u8UPMt+0vHO+9iiYdN6Px66G/Y7MQ8SJ6ifRVVsXEWN/MSUfnzNjno/?=
 =?us-ascii?Q?7D64UiXaBKICdOO758YeDp/mBvVkH0fySuHsv20LiF0FIOzM0m/7TU4XEom4?=
 =?us-ascii?Q?lgokybmEWheDnQgRqhVF+GhZpnlb65qEyHXhPKUb3xg0mHygX9qTRA6fB2Uu?=
 =?us-ascii?Q?En9kJshobNVdhW0TbbQ1CluqJhgt0BMpDxL0QG8rTxOkf2p6ET5YmS90tYKb?=
 =?us-ascii?Q?i6R4l3WI3zbcE/2vRgWpZ2o0+LekHi6VJQ+EHTpo4GEchu/6ClRRhXgAPX/S?=
 =?us-ascii?Q?r99rj/SNl9Z8x4gd0b+ZOoGCSh9gWhZgXMSgN8JDkwRlC81dA3HxdXbexB4a?=
 =?us-ascii?Q?6DF+9CjwSYyanIfwQXdmp73q68ocoP5SkaA7kyTWww4i8CfGCqTpVP9l9AkH?=
 =?us-ascii?Q?2W7EKi4fe4ppRBWKMOPbgV95kbx0gk7LwiqrT2+5C8OKMuAFAOf5ox8a07ca?=
 =?us-ascii?Q?NmVPnicLHk99+AhlMk4xjMFkQkpCBQo4FQe+DEoIB9Y16sev2aH0jtXmjBHX?=
 =?us-ascii?Q?a+FQHcYnmjNT6u4+0JN6QSOwsenIxCHeE2RuTQfGuAHGrrDrwwee2Juad7GK?=
 =?us-ascii?Q?xfcZxU0i05Dckj6ZWjVY19jcMqfn6gIy+UM+V0W5Zemnm0AK2pOIYghpTQZq?=
 =?us-ascii?Q?bWCrhJfVIaDR8VgJfRI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cc54ca-dbc4-48cf-2411-08dcef9904c7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 17:19:27.0311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/M/RbIR7CuiO6aJV5+6rxP+FnJsEGeaUDxHBJR5Es6Z4D4LJo996HmqfvSweUnk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6682
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

Of the page table implementations (AMD v1/2, VT-D SS, ARM32, DART)
arm_lpae is unique in how it handles partial unmap of large IOPTEs.

All other drivers will unmap the large IOPTE and return it's length.  For
example if a 2M IOPTE is present and the first 4K is requested to be
unmapped then unmap will remove the whole 2M and report 2M as the result.

arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
the 4K and returns 4k. This is actually an illegal/non-hitless operation
on at least SMMUv3 because of the BBM level 0 rules.

Long ago VFIO could trigger a path like this, today I know of no user of
this functionality.

Given it doesn't work fully correctly on SMMUv3 and would create
portability problems if any user depends on it, remove the unique support
in arm_lpae and align with the expected iommu interface.

Outside the iommu users, this will potentially effect io_pgtable users of
ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
ARM_MALI_LPAE formats.

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/io-pgtable-arm.c | 72 +++-------------------------------
 1 file changed, 6 insertions(+), 66 deletions(-)

I don't know anything in the iommu space that needs this, and this is the only
page table implementation in iommu that does it.

I'm not sure about DRM, I looked for awhile and only Panthor was unclear.

If DRM does use this, I'd respin this to make it into a quirk and iommu won't
set it.

Thanks,
Jason


diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d98..a51fae9c909111 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -569,66 +569,6 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 	kfree(data);
 }
 
-static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
-				       struct iommu_iotlb_gather *gather,
-				       unsigned long iova, size_t size,
-				       arm_lpae_iopte blk_pte, int lvl,
-				       arm_lpae_iopte *ptep, size_t pgcount)
-{
-	struct io_pgtable_cfg *cfg = &data->iop.cfg;
-	arm_lpae_iopte pte, *tablep;
-	phys_addr_t blk_paddr;
-	size_t tablesz = ARM_LPAE_GRANULE(data);
-	size_t split_sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
-	int ptes_per_table = ARM_LPAE_PTES_PER_TABLE(data);
-	int i, unmap_idx_start = -1, num_entries = 0, max_entries;
-
-	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
-		return 0;
-
-	tablep = __arm_lpae_alloc_pages(tablesz, GFP_ATOMIC, cfg, data->iop.cookie);
-	if (!tablep)
-		return 0; /* Bytes unmapped */
-
-	if (size == split_sz) {
-		unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
-		max_entries = ptes_per_table - unmap_idx_start;
-		num_entries = min_t(int, pgcount, max_entries);
-	}
-
-	blk_paddr = iopte_to_paddr(blk_pte, data);
-	pte = iopte_prot(blk_pte);
-
-	for (i = 0; i < ptes_per_table; i++, blk_paddr += split_sz) {
-		/* Unmap! */
-		if (i >= unmap_idx_start && i < (unmap_idx_start + num_entries))
-			continue;
-
-		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, 1, &tablep[i]);
-	}
-
-	pte = arm_lpae_install_table(tablep, ptep, blk_pte, data);
-	if (pte != blk_pte) {
-		__arm_lpae_free_pages(tablep, tablesz, cfg, data->iop.cookie);
-		/*
-		 * We may race against someone unmapping another part of this
-		 * block, but anything else is invalid. We can't misinterpret
-		 * a page entry here since we're never at the last level.
-		 */
-		if (iopte_type(pte) != ARM_LPAE_PTE_TYPE_TABLE)
-			return 0;
-
-		tablep = iopte_deref(pte, data);
-	} else if (unmap_idx_start >= 0) {
-		for (i = 0; i < num_entries; i++)
-			io_pgtable_tlb_add_page(&data->iop, gather, iova + i * size, size);
-
-		return num_entries * size;
-	}
-
-	return __arm_lpae_unmap(data, gather, iova, size, pgcount, lvl, tablep);
-}
-
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 			       struct iommu_iotlb_gather *gather,
 			       unsigned long iova, size_t size, size_t pgcount,
@@ -678,12 +618,12 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 
 		return i * size;
 	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
-		/*
-		 * Insert a table at the next level to map the old region,
-		 * minus the part we want to unmap
-		 */
-		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
-						lvl + 1, ptep, pgcount);
+		/* Unmap the entire large IOPTE and return its size */
+		size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+		__arm_lpae_clear_pte(ptep, &iop->cfg, 1);
+		if (gather && !iommu_iotlb_gather_queued(gather))
+			io_pgtable_tlb_add_page(iop, gather, iova, size);
+		return size;
 	}
 
 	/* Keep on walkin' */

base-commit: 27ab08d646a1b53330229a97100200c9567d28b5
-- 
2.46.2

