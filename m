Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615F99BBC36
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 18:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C605210E4A4;
	Mon,  4 Nov 2024 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xq8tv1tB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FB910E4AA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 17:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRkf32p6YQIi9Vq1cjDbQZMtZNUT+myoXUry1dVlx7Zd7aNr/4JkCk42tjQZqYUHzHteTl0kgSUDhvbf2V2ilzlv7uUK+47TGJz/D3Jk7NCYsJ5QxvUCudYabNtJ+OuXByct0RGBsuPy5F1dBJx3KO+cYEvt/i5EQA6n5rQOLcC7VJnFKtZ4e8ovUtcbZWQGyNK9t5yHHMXaWuzsn6c/H74O2JjAO3VjRxVoFyBCqspVPKzQE3lEZW5GNuGKunddNSvwHDrfa2RNxD95oDJkCojozvrDpKE0WDdJkpy6vwDznlqADqJvaGy+S8cpREFXZSH5jBYmodSMdy8CpxINKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4lP75VHOZXzY4aLyenhJUvf9MzNwBiTzNXMKjL0i7Q=;
 b=YLEXmPQ++xEIHHfVwB/AtMIVHykqpZ9l5xPmetZs6QV0z23R8TVoaUIlXy1q7u0eTGJiOyFXxvZQ49B4Ujiupd6/juGm1+AMxg6m2+Bp2o59bB3R2clPIsX//SKlXqtbT7Vw+N8cMh5aaGA6f1s5n0et7vbJ5Ht9eEUEaoxI+86GRLEfLPOa4RlvWi03qI5lA3JXKwnimLquWktR1f9CDPWBLD8xCFl/dXBRChHYLXls6+boYBUs9frQ8z/fRKUD1IXCNjXhga3bFnW0sXFzpK7R++0tIeAexyFKmPGTanFRsWWnPFVHQIJPbfuok3etqAkHiSL1+laJfW17uBEF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4lP75VHOZXzY4aLyenhJUvf9MzNwBiTzNXMKjL0i7Q=;
 b=Xq8tv1tBRt8ylch8HmhhHGlXVZgC4GlsTZV8jN2dmCvLCkUmrju/we1o7IHPikeAPti/17GeLq4rrmwN7G3Vzj1K8x+ljllefRa2xs7BzQ4FKWAJITFpl7bnIC5cDZ+3HYhoYMFIJcW6zHJl8yKXsJFBSaWIA/jiWRfw9UJwqc4ArhDtKzSmSwZLkMMOWdt18Psr5d+RpJuD8ye8cR3WQNEI4zgLcTPVRDdwhkdZmU7ujQqcH4IoC/JvV75wu/Tr0PQkHqE5vv6iWPWjBGrWWhlsnEh1teFyiUweZovIX7DZCmrYvwi/1CuRiUQnjFDxbwl3jrF07GeehF/Ec2AKig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 17:42:05 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 17:42:05 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH v2 1/3] iommu/io-pgtable-arm: Remove split on unmap behavior
Date: Mon,  4 Nov 2024 13:41:29 -0400
Message-ID: <1-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
In-Reply-To: <0-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0421.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::6) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe5103c-2591-4b95-ba13-08dcfcf7ebdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SftlwhmoIMuEnxWlCfXTUSeVn+Fw9TYoScnZysJ0IZix5cpHIras7WjLkdKj?=
 =?us-ascii?Q?7nV7WX9RXMvbTtkXC2wJkEFFwKkNxqYFfuWG25kJRqFxYegYtXL696SFxiMN?=
 =?us-ascii?Q?YJAsu1C2ypb3b+XvSSSlXO1Cl3rCbObUW/Ooo+w8EYH4XnLcJC+HtuZmGehG?=
 =?us-ascii?Q?YuPqGovpwjjBz8HX5jMzzAgE/uBBgnBvMGrNSMMyaKNruIMgQVPCB12zCzzJ?=
 =?us-ascii?Q?UUcLpVA4sXnwGngXKFMR5mg2nwOr49Esq2x6zjRngwkly1TM1wEO0oakZlGS?=
 =?us-ascii?Q?Ygi2CJdTabFYNC16q8kfnRaSbTyIVJx7t1endXnYQ2kgGVffd2JPG4XrXOXc?=
 =?us-ascii?Q?FsUn2vswPdZgW01FfXViI0OUpdp+M7sBrw1ZIgT7XxMSQ3nLB1GRstKYOviU?=
 =?us-ascii?Q?PG4MxfGRPzatb5N7l5qfm23UnBB+qfB6RfjEyw9Wb4hqmJJBTxoyrvDe+6u9?=
 =?us-ascii?Q?wZOhwBCv7PD7lOcg69awkYMgQoncA8NPEywK8Xw0sk9cLmDYZ4k3f8Q3w8H2?=
 =?us-ascii?Q?63S5F6Zyw3xzdbNnnfVPriSZeGUAEvZLhRXqvrSIDsXb41jsLH7tLOE6edUi?=
 =?us-ascii?Q?rLwY0UAJInZSilZi45hpUNf3FECxbQ30wKVUcYlgCC0AUe6VwHdnKjSBtLn7?=
 =?us-ascii?Q?Sfo42SJ+YgrhV7XPPR+Wsiif9g+WYQN+wej1fHif2ARFuKh9x2IP9Ql2d1AE?=
 =?us-ascii?Q?jPjwSUuXs6sSshkWVHoz3I0edBTxngyNR8FjHoUT7u5h+lnjEcV1zeZUq974?=
 =?us-ascii?Q?gniLmDJOtf1fjJFHQ4kxGcfTcerRrCpLpLQabqzV89Em/1yT/HOxxe5Zcgwc?=
 =?us-ascii?Q?T8hqdj4bxn9nryOFGEzui3c/da9n/O1bJW1F+Umm9e8oQTGUb7C8lGBK/JR9?=
 =?us-ascii?Q?92Yqh9IMln1H2XrYWRI31TLqQN3C4deJAD2zOFM0C1RZLkkMMycym8JEGJ/1?=
 =?us-ascii?Q?hrC5xA5hCckG4G3lgFWgNWbTKed3Y1fZ5y9ccxpSJMK/mpf0BDSari19r+ql?=
 =?us-ascii?Q?jU7JlYeoDbyzxt3QS5W1vD81459N9qCAYCoP2vG2X6+H5a9swY3zY2nBW1jU?=
 =?us-ascii?Q?qYT4inBLQ+PRDUidiOS5Cib07KnNigX+/CFnmV+ZWKmTxca7dDoxOuwfRu+0?=
 =?us-ascii?Q?f8slQHobr5qDLCZ+ZHAJJ8U1ikWA0GwDBtIJgF3QQhCUZBygHHf+N/VhpUHg?=
 =?us-ascii?Q?pG0HFPeDOfRj3c4YUOI+Chl8u1uKHIiDFvMdGgaut5QAFRJHhVydjhjOHVNk?=
 =?us-ascii?Q?w55jpdEHDnjufvIz4sQkPnt5L894YOQVsg08cb6vfpEdA02t8xzunt9mG87D?=
 =?us-ascii?Q?tL1ZQVq7f9UkfMZnXPfYNiVu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2/nGNQMMi5ES6gZgYHyS8QysWF5rwEe7CyNBPgtHtECQLos6tWhJcpb/xoYC?=
 =?us-ascii?Q?fves81txyYBYVaGE3OqUUsFO6rXK4AALpr0x5NLARN/3X3sdn8gzUesWl4I0?=
 =?us-ascii?Q?hPT2IjRoQoXxRdGmab6WK+1cj/zSc47islZalM5yeDUTnwcotB7IW1F07nlK?=
 =?us-ascii?Q?O4343QjR4p8yAYED0/dpetadZFBxSKg6Eoi3hIqGXGeSZkOWZT1yiozpz+ov?=
 =?us-ascii?Q?PLer8hcsHb08bPFCFGBMgcHqCptnCpinCMOEMvq0tix4WD7Zm4oEMYvS/9+9?=
 =?us-ascii?Q?SOZCJZg6qtLZQhru2SRKAv19gW0x+CRT0mGLBV2hNijeHCYgHQkasoE1L9WN?=
 =?us-ascii?Q?3jpX9PN55SkoQLhNbVDlt9bmdLzW4Xm/jXkkOWOMwlnxxTuH9cmdJMOG39Y/?=
 =?us-ascii?Q?589ezQuQMsWDZ7fy4GILOYKveQTeWJ9v2XT1R7W9IRrOG1CnB1u7ox6P38Ec?=
 =?us-ascii?Q?trcHThvjUUvxjmKMKTtkiLEDM2Jyl1rjWrSRiUt/X+bWJVsn9j7tGC/jWhUD?=
 =?us-ascii?Q?vYcbFU52TTPgaqEVEVQ+v/vTb0LvsFAnsdkULwoaL6rPxInk1+jErXZ+ra9+?=
 =?us-ascii?Q?Ckd2h/R0ZVSIAn1M+j0eHkTCGbzixYAYETDOHPubiJxBYSQDYrlM3X4B4XO1?=
 =?us-ascii?Q?kAjT3WyuuY+hKnceWt3z+SDcMegr266OIPaOhR4rrYyCEbSr8mWXDwmbVDQK?=
 =?us-ascii?Q?/9nWUpjUys1w0DOrynGuH7gWA/ad/PMEVHEHU7vEj4iQosxWsyW3cDGmj1Wc?=
 =?us-ascii?Q?8wrSkGXQo6zqyJ89rzdlL6NXF9+R2cqqmVI7XYc+3F44aqs5tAl6hu4/XdLR?=
 =?us-ascii?Q?esg/kxrQEarkD8J9udDLWd+Dz1v/SZXNvJVjSx7pAXm6OX7g60D9fOIWlob/?=
 =?us-ascii?Q?gnMLzs8lGiyaOBQ41lJK9d8m6g6nCt5JKG/zuHleWRKgvUSA0tYCRl3K0nvs?=
 =?us-ascii?Q?a/XDf/RfbBsTaKxNrKCnIIZdO3DW8FzI7VURY3aL26S1ek6adK7fPOR1P5yI?=
 =?us-ascii?Q?pHFA+W2JMOM93tktCy46nro3tX3NRVf5uRAAnfoAQXdto5GS90r7b7lBovWy?=
 =?us-ascii?Q?aDqaYcStVg5fYqgySs9Js3ddbkKosKu/S6O2hGssd+DMg2W0Fq2OT6ODGaFM?=
 =?us-ascii?Q?UBLFvwyC3RABTGh+N+cVUjV1GbFcK+L36/I4H4FFcNAUXdZXeMXfTtzoJvlK?=
 =?us-ascii?Q?GSKev+B7cg6CuNCmMwW4cqsYDJoyDxnUiRAPIovPJx44ySI7jBNjTyQCVjVD?=
 =?us-ascii?Q?B4W2ObXzXMNUQLUX24gdBYWkJnNOkvhCb5Nrw0f8CasIJZAFaZzKyRYgB/cB?=
 =?us-ascii?Q?s/oCJvd2eF0XXIyYJdwODOIUKmEF4q+3NJh1ErOKOPW+hkyJ1KN62HO5cko5?=
 =?us-ascii?Q?uWiKhlk57JSt4WIH7u2IQfdqaHR+NmX5qlaalAQQlO/rKNQ9/W2hfNrVNejX?=
 =?us-ascii?Q?SDmhAegCPdnIXV4spkO/UtQlqAhEiqHL6Mq6PmxVjUex73m2eXj+wcln1QOJ?=
 =?us-ascii?Q?lboq8jJzSul+mr7xAgL+vquU7UgYISoOAcw0y8KOBgIaXMjtRSC6IjiHY/4N?=
 =?us-ascii?Q?GYYeMvcEBCSQ6IOXOKE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe5103c-2591-4b95-ba13-08dcfcf7ebdd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 17:41:32.7086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fXtXv2oomVvB7GxYQYB2lcoK2cDDJSrUCXlY2xFvPYIvsHJyvbs//wIuaxUdeGf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578
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

A minority of page table implementations (arm_lpae, armv7) are unique in
how they handle partial unmap of large IOPTEs.

Other implementations will unmap the large IOPTE and return it's
length. For example if a 2M IOPTE is present and the first 4K is requested
to be unmapped then unmap will remove the whole 2M and report 2M as the
result.

arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
the 4K and returns 4k. This is actually an illegal/non-hitless operation
on at least SMMUv3 because of the BBM level 0 rules.

Will says this was done to support VFIO, but upon deeper analysis this was
never strictly necessary:

 https://lore.kernel.org/all/20241024134411.GA6956@nvidia.com/

In summary, historical VFIO supported the AMD behavior of unmapping the
whole large IOPTE and returning the size, even if asked to unmap a
portion. The driver would see this as a request to split a large IOPTE.
Modern VFIO always unmaps entire large IOPTEs (except on AMD) and drivers
don't see an IOPTE split.

Given it doesn't work fully correctly on SMMUv3 and relying on ARM unique
behavior would create portability problems across IOMMU drivers, retire
this functionality.

Outside the iommu users, this will potentially effect io_pgtable users of
ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
ARM_MALI_LPAE formats.

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/io-pgtable-arm.c | 68 +---------------------------------
 1 file changed, 2 insertions(+), 66 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d98..9a16815b3f3434 100644
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
@@ -678,12 +618,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 
 		return i * size;
 	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
-		/*
-		 * Insert a table at the next level to map the old region,
-		 * minus the part we want to unmap
-		 */
-		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
-						lvl + 1, ptep, pgcount);
+		WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
+		return 0;
 	}
 
 	/* Keep on walkin' */
-- 
2.43.0

