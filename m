Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C874B9BD456
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BFE10E5F7;
	Tue,  5 Nov 2024 18:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jfKbGY+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B8010E41D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:14:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDMxhwEzLh/5pUVrDVRbCDjJiMnnxjUrKaD3iLnFou+V2akgJgVU1XQJONVXw4pQ8Out3GzvkgZ6GMGlIVwIqGxzyoRn/ewWeEUOZfO12SFhiSwxT2x/U6gCKHimhHiDIXcx8zXxCIdpJ6k+vMjwIoXd0De8eGszQpRu4pnuRq8wrE7iX3/3WpWGDgcncu6QrHFH2wV8FsE/Wl38XaPDuT91e1QEwbYWIaFD0sgM/4ryVXpnFu7aXY5l4KD5WAJmBvIiAvLsXnCgg79XP8Qqsj0DSGK5LQcnB52P+T4DO1GNSaHtUW1H+okHkNTFJKVD7a0S9aztc+FKE5Ym8GAksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIANugGwnks22NqB2MR2YkkiCEPRDteg9Ba1oy9SDAU=;
 b=sfGUYHSeyF0jODt/AHSLh49qsNqQ/413b4phEF86FDM/QPX5JFsxZcBTIAocsDQF5CAyNqtOYCvG6Ukkr2T0HcyTL3xCXBG6IPfHYeT8taHHLBZaAulj5DcO6Y4s2NiyxzZDwXtcldKrWjl4GiOVTtBbuWd3JXdEIVyMdewOUasdEAd0lGwsVAnP7aRSMTxAlD48Aw3u78skfz90nmE5ZRJ64TZ9vReSrXtIJZDefPbiMwRd4poEIFkYbyuwnJoepSC/NBBWZRyAYgGFl4dR0Y9TWrS053qEML1VkGSoy+MIVaPB8GegGLH+nZFkpxLcRtNx7ONnD8IEZ5v2FZklPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIANugGwnks22NqB2MR2YkkiCEPRDteg9Ba1oy9SDAU=;
 b=jfKbGY+Yq8hTV1JDouK1v70d5+mg7OuAqu6nYDgOEtsuNMnFb0gxplkfwn3GRwCuyx+0kBruSKAgC+XKfnGURUECLsHD/GCSNxYHhnLq4NVbZbS4JJ0ZasvJFE9OEcVxmQqad5+HGXAh6EluAVs0HdNfneB2Yo83GEKoMdo8b7LzQZCUL7rx0Nxaw2r2slghltpFlNQvx3lHV3ATp8Tiqa2Bv46Z5SUtysZ3KEGMTHOQDij2Zrteed+8+C3rEUP/tclEbJcD2K/z8dGgunWbegeHBOq+14X4qVyxtfH5+4D9gX/lITL2O8LKiduRMpiLP+nplKA90n7YYpwthN9FgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB7508.namprd12.prod.outlook.com (2603:10b6:208:440::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 18:14:28 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 18:14:28 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH v3 1/3] iommu/io-pgtable-arm: Remove split on unmap behavior
Date: Tue,  5 Nov 2024 14:14:24 -0400
Message-ID: <1-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
In-Reply-To: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:208:236::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 8264e3de-73e4-49d6-e7a1-08dcfdc5af89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1P4glLet5wBtg0Tb4Na6agMq+CMnMJOGeSTONbnJ8UWptdjNoWlivnarY92w?=
 =?us-ascii?Q?CwbuYguJch/g2jErpWQCIheqXLixnt0eLl8qUZFcQNWq5txoa4H4AGuxLcby?=
 =?us-ascii?Q?qd84gn02+ELPn57BLEHwFC5Ju0IclI6lmTHxexjl2Ut2ZJ29ZnC4N1mbGzub?=
 =?us-ascii?Q?coUmqvcxQXpheDNlIhk2destXMVAkgvJRJ+dL4bIpQuH2n8k4tSKixw6Uj4Q?=
 =?us-ascii?Q?1NcdZUAN6CLUIpnPIdS5bTYjJr506kpS206O54DfqGvysLyfeBLSp6wAXAu7?=
 =?us-ascii?Q?e2g4NgLOsnlAwdzeCqQnl44NG3T/C8ejGmL1gI6zAKx3Y430gU5+n63K+Bri?=
 =?us-ascii?Q?HOMot/q/WtsMa3hbxknp6sD/FQPKuHY1ijJ6iJruVM5nYkQaZ1DXV0yQB3B9?=
 =?us-ascii?Q?ElO55NGdf9vENTJ2swaSh/TIKC7OGc3YfNJCDGjS86H/X84hza45MhQvJCzA?=
 =?us-ascii?Q?DZGKoL32xRvcg7MzO6b2Xx2lQs1N1RUbGrFucWCLjuK9R5tUgaUIoqM7lcTo?=
 =?us-ascii?Q?wb9/p1W802qxhCJwGy9ossUtzgowJk1OePKeXQd4y2xN82gYpC+tZvtMkQPP?=
 =?us-ascii?Q?7hL0wOxV/j+pP8cDNr1Dlj2HRjRlRFGo/cvtAzUEsY3LgV15Wg5yrrL9MDIB?=
 =?us-ascii?Q?1TOkqJINNVN//DsqAUsA0lnH1ZhHZdMxgm0LxF2Pq+GIPBYfS78fF0GB8b9K?=
 =?us-ascii?Q?oAFnWn/LNm0h5gDq0lxSZZm8zk6YuMcPaCdmteaNmWrBKFW4lCj0JaXKeGbx?=
 =?us-ascii?Q?3rXYqgDxBdNkM+l/8JCnfueDVVfCyd5KoOKNdYTTz8zw86sPZ/L2tk5hHoJW?=
 =?us-ascii?Q?4VESz23iYx4XIv1cXkANroSqp5Bp2r7MBzJlBitH9cgkh88ZpC2x+wiV/Zhw?=
 =?us-ascii?Q?iJepxi5r9yyqQW6H2k/a1otoeySWeMOZGFPd7MQtq4+MMGlnCLp0AnEm8fks?=
 =?us-ascii?Q?YhcfCOOzTNU8HoUjZf95Y4zitX7w9apbZxIsZBtCWzlukl/Wk7oqWMdf123n?=
 =?us-ascii?Q?XGQ/8QEbwvdjL+6svO8mBjAp/ZjyGxM47tmzzl/KEr5n+hs6cjeKOoU2LK11?=
 =?us-ascii?Q?B+NwwO25/gXJrXTwkGXrkyoNZBQ6Aw3QazqK56VvwRiDU3jIYSlBBH5o9Jv/?=
 =?us-ascii?Q?5abh0dm8ytV8mBDlEZvU1puGvzIkooZ1ukzNOqpETEeVyz0EjvOfaRqnNFFj?=
 =?us-ascii?Q?w7Q5FVhmYx+caL0gAQ37GsZLN+BQKPetEoX5ve+w1J97n1qWnoFd8yOWMYZA?=
 =?us-ascii?Q?R6bZjoD4CYnHURQmfymzVy6TDjFlGacEFC8Qxlhaxa8RpvTVQHEwoUep0N9h?=
 =?us-ascii?Q?TtIJqcn2RW3KIdo3YQe4DpUb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MUY+6Ayw3GnUAd9yp/J2W/UAf22kcg0c7JBHHuadxV/fHaroCES5XAR7ywyt?=
 =?us-ascii?Q?KUKK1PiRNQL4X2RSugF7OFBLMjTOXychklnkPj1KJIcp0c9kVL4OQC0kkQDM?=
 =?us-ascii?Q?xWKzUh8m/8yr0Id/2XB+eyl+nN30RfryQpFo9IcaS1U4Fw3lNjbwKJVPoY7W?=
 =?us-ascii?Q?1ENLO2XWBpYQcuHb1z7tBtei+lEXJeBqMqL8CKwf2wefhoIFPBTAFW0O1xlN?=
 =?us-ascii?Q?yxUB5uO9s+wGDkp31939s4OVh2ZQ5gmuK0Az+sPAHvIcUuAx9RwrHLcDnkKb?=
 =?us-ascii?Q?2HwBqnE54mE94vHRpBm3IxV5rySP58djIm2OGuE4yKSAPT6LRluB/a5SOXjz?=
 =?us-ascii?Q?7Hf6HZUjrzFwuUfLfxN1pAINv7Uphd43MMJlJ27hPd+xq3XGOkrLtBzbthPK?=
 =?us-ascii?Q?kEiauiAhq8EYATd3O7B8zGtn8LTDgMb8q+aq9oVX/WV+TubA9PxkXezQBQtS?=
 =?us-ascii?Q?uw24AvB0MeA/1Yn7+GR+K7n3FQ29ysAMSZ4eIXjXl3RBgAsLpGMzlpUGYXR3?=
 =?us-ascii?Q?MTZR4SiQdauUVApclTS93k3N13cktdTFQ4yT1ZQ4XlMeJVDU64CEFJ+wPw9B?=
 =?us-ascii?Q?cBqFe3PUFrukZR6UoAUyipXxRBPiuiLCDvz3lmoVrVRqhhQa3fJw/rtR/fhx?=
 =?us-ascii?Q?Oxvqzs0AJOudYD2cRCnIy+pE50Wyu0mObEmqzJBNrHy0/eVVEt60AeEjf7U3?=
 =?us-ascii?Q?jhG2xvktsMcSUdlE6jFY8Qdag5WekCBZExzjM9ietBU6v0xgioqIgBBqnLqM?=
 =?us-ascii?Q?Rh4LuId03r1gND9MovuTbwUeQsOoRVAdNLb5cGvq98sq/T7XwbFlr5jLx9Tx?=
 =?us-ascii?Q?zWmFpNWB2ONb1deQYBjKdPFs805yO9wqrIJqa1IT/NYH4D1OL6WS3QR4knGu?=
 =?us-ascii?Q?xRlcNnwEDyFgoGZTHb8XeX4ytvs2qYPqrl+JW/eOXtXs967h7yFqz6w1aBIW?=
 =?us-ascii?Q?12OLpNcA7GdiEcKVCVM8/bPZaBNcf1WObazo7hQ+5BAXGbCwl1X4u9ZQnwtD?=
 =?us-ascii?Q?DRjwLfe7FzoNMt2mzGH6U0vh0HH0Ioiaevk3Z3mNAX5kyv2S7GFefjnweD5N?=
 =?us-ascii?Q?+CZCeoX8ahP5pHvfb+lFVGg1X25yjOCq/E7iwDb/VDhTj3zTij5MMPdFUN5T?=
 =?us-ascii?Q?i3TBkth4Ud62ydnHqnMsBDXz2H4QFlBJM/bwlQFX7G7zqXtBLWxKf2KxaSPu?=
 =?us-ascii?Q?Si6gLlMln+ApqVyeQlZTQyQJnub4HcFXrEujNiURQX9Z9Nv8uEqOG1mwZ6Bs?=
 =?us-ascii?Q?nbJaf9OsG2m1Ur4R4y81dj29ubVsU7dzILeX37l8RKvihjPNiTQuyvElXl5A?=
 =?us-ascii?Q?LRRiXmPgu0RfDnZsoLQiwBlLSqkH5gArnCHZ+Z/ed6wTwYzUAYjz223p9Aqe?=
 =?us-ascii?Q?SWY/JkUgy6DvgtGgIA0ePHAX4Fqn417u6wbh5SmqgbguIzEpdRlBIVIfShRx?=
 =?us-ascii?Q?ChbarxYE7oQA9kAAOc5A395VZMttRrunE4TOsinK6866F22BCjfHb/PJXJTa?=
 =?us-ascii?Q?CSJjFkHitiyghw8I0WRWTYWZd34k8Q9wNCNv42jrLxYNveoNfXSw+TLPJwm9?=
 =?us-ascii?Q?Jq8bSMIoBOajCeAhD0uXk1GXC4fcHXcRbVAOJQaG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8264e3de-73e4-49d6-e7a1-08dcfdc5af89
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:14:27.6525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T/RSCxsZyB8hZ8Ha3tA0z/1jzrD3ESLFouvLwOw/vVXuFPw43bxwEd3ZnHuGUTZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7508
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
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/io-pgtable-arm.c | 81 +---------------------------------
 1 file changed, 2 insertions(+), 79 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d98..4e7689f5f12b4c 100644
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
@@ -1347,19 +1283,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 			iova += SZ_1G;
 		}
 
-		/* Partial unmap */
-		size = 1UL << __ffs(cfg->pgsize_bitmap);
-		if (ops->unmap_pages(ops, SZ_1G + size, size, 1, NULL) != size)
-			return __FAIL(ops, i);
-
-		/* Remap of partial unmap */
-		if (ops->map_pages(ops, SZ_1G + size, size, size, 1,
-				   IOMMU_READ, GFP_KERNEL, &mapped))
-			return __FAIL(ops, i);
-
-		if (ops->iova_to_phys(ops, SZ_1G + size + 42) != (size + 42))
-			return __FAIL(ops, i);
-
 		/* Full unmap */
 		iova = 0;
 		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
-- 
2.43.0

