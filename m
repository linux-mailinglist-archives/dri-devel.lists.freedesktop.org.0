Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7C49AE6EB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCB310E163;
	Thu, 24 Oct 2024 13:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mjzw7jQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733EC10E163
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 13:44:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptPoFlq8G1B4ev4EOOuw8YsgWw5QYRNidhj0HIpbXTCH0+5UFigWFxoFx8meMKSiyF0Svauf9y4VsV1k1SR6Rtjgsq2qbtZbYmP4GuA9g/cD9vqTfwU7t0O4mSI+g7RnMzblPcBn4SiiwHw+lG4qCRhB9Y1/dNgBt1dh/C8c9HPMEX2h2yfoX3dVXa9KaxlDfUyaepBV8GJwIPUHO0+8pAyowvKg5YspKFXNksyTvugf0p3Ayfqe/j4QCv5K2vO3t5xjevwIfBq3sE8+Qbbhi/duIEUpEtzzh/8+J4K2U6BMC8W9mqzywS5UoiGoM7729f0kGn22LonEU4d74HoFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMKci0AEBXn5elejLJBqF7rEQuFppZ/C8jh6C51ljlE=;
 b=BO2HrA4pKReZ66Qyn0uKtZiZya/lxIAl372YZdP8TvPPO9DYHGIBC7uAgyS7aA3t+vHc8AKziS6NrSp+dy6gA+kfUiW5PJIrXAFYOlex0fyDNszSmTWGnfaOz56AVXolfaW+4d0/i6QLN0gDmMrG6jxv7Sd2zXGiEHIhl7fYUkFvF1Zl9hPh1UViDwPZdsO67zuvlE1h7nyQMl6oJx19pwfxZacQJKTDblcjwfCBLgWYF2FbKSvlG1O0/IQohGgge5qrfDQ7kyvJ5Pwv14n60m+A5MGpYFTrcbgu3Yo98uAxaI5WmJKTkXvF+UBQfpUAu2fHuhcq8nqtXsmcnmnx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMKci0AEBXn5elejLJBqF7rEQuFppZ/C8jh6C51ljlE=;
 b=Mjzw7jQ5ePd4XZ9ccUrD+AUKN6ruXzFQDL8S0m3Tr4cRbE3z/K2OcBH1cXlmx2aHbMANIKb4N1NzlmNGPvx7KA1jgPhO9NpAvvVFzcUmq6WLUKwlDSfwLAQBSn4bQ0OIopskUoNHJF6xGB1HWgrtgHOFGTXowZP7PvdZrSxIgWc594aVvnSSvpr4PJU+ZDiDG75QvIbpA7P6tLtIwQ1XP8W5I15LlWtl8u44bHUPL12zdMYaEfh2bbKXohmQh/OM3ub+KM7hZ95bNWoKa68NI7lc5jFxfPSBoQdtGPjipzDdCVw/1PtMsfzdWjWkc6HPXC1hYwWNFONxfrjfwV0sIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 13:44:13 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 13:44:13 +0000
Date: Thu, 24 Oct 2024 10:44:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <20241024134411.GA6956@nvidia.com>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241024130550.GE30704@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024130550.GE30704@willie-the-truck>
X-ClientProxiedBy: BN9PR03CA0418.namprd03.prod.outlook.com
 (2603:10b6:408:111::33) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebad815-742c-48fd-4ddd-08dcf431f1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/bE6a/TZlK+Wi2y6KSVv3qf+D0vrkL6HajMA+Dj5DIcZoHOmzfYnfsVhbVfY?=
 =?us-ascii?Q?YrDBzalk1sxonbnLSQmBZ0Afum6I5LmjU6znkD28Ukl40E/TUYki0blIZJzz?=
 =?us-ascii?Q?EbvkelmCHpHnt/VrcA1GAUoqu5CQp1ZX5FYAc2b3VPkpJJV+UK0R1oHnBuOT?=
 =?us-ascii?Q?r3oW26oyjTVp1/YYmwzxQgZAB+KK3B6R0yWmZm+NBSeI5bVHzW4+WI4fURVY?=
 =?us-ascii?Q?X3SUawMpXF0zoa+DfYxGsiFjijUK0qFFD3jJBL6SPFcEmPdenpsdzSQBKVOF?=
 =?us-ascii?Q?JY0sOLqFmABYS2ql9NTZs4/y+gyr8l6ax8J5gvbnjp/CVFASEgep9ARTiAXn?=
 =?us-ascii?Q?QYSoaTFihiTEurTnDIfkaxy22r7ZfwvxLdeuyv6aRj8x9UkJ02X6NM413VG7?=
 =?us-ascii?Q?xSD9H2aDfc3bxZkexwh2VEKSuSZtEY0uQ2ZPOS5xy0za1pNmshU/Gq3jB8Si?=
 =?us-ascii?Q?jIsM9ujXcEO9wh4UqX31yMELAM592hTxCMjTJ+uMC/npE9UhOyRIgJKqGvIa?=
 =?us-ascii?Q?0njEq/St4XrZu+OLSC9YiV+7JENRtXcNnTG4RiROpYR3oilkbCJB+obH6Muz?=
 =?us-ascii?Q?/BmBFG9zGYrA17KxIy6a+s5nKyzvIkzbPdgcJKt2qlYJjkyCYVztBT8hDe7s?=
 =?us-ascii?Q?/yB/YrhPfDJnNR+oaPc47rwzIyS/xejNb5Apjmtx5YFQOHL2U2s5aH/uvSWK?=
 =?us-ascii?Q?ri0OKFhS4jllOPXaQK+STmcFaW9lep6zblNpYhpvgceGvOyYHyvtDbptHMEu?=
 =?us-ascii?Q?Rb7yPPdlKuJx/JTtiGyEySZEhMhz/Agz5hQv+qIXBzxEY1yW34G4NzcTE1AW?=
 =?us-ascii?Q?tUq5UYSsdRug4nfx4To+RuBAPWbE4fb26I+mcClgRHvk9pvw7Jjf9S8Z2fJr?=
 =?us-ascii?Q?5wYOsX7V/6dnB5Wfu0M8lUmPTvgU/xXzfh3iL+8u4+MLrdzeuTARrgUo/sFE?=
 =?us-ascii?Q?t0NRl3+CdbPl1SAFY9Y3ttFvSrJ8R+LcSOSugbKHlp+XgBHmtvyU2S2ITpZG?=
 =?us-ascii?Q?HH/CqtPIVa53xtAFa3SSVc/haOwQFCl99fsgYZtNxuYPsCqDm/Gsq8Wl+uaY?=
 =?us-ascii?Q?1c9B4bxjC80OqrNACogW5EQeiiPdE0f6LR4okdJRgalaZ8viAulduXiIVi0E?=
 =?us-ascii?Q?wiP8aIt2wB3vl7Q1nU6e468+HPSWjmqBisUrbBtpcFYWVfexkOl0C7CtWtXH?=
 =?us-ascii?Q?1oZEBf9BQZ66EesXLtCwpfCF+AbDYP16Yc1S3WIIzYu0bPOmpkPFVXYZNT0K?=
 =?us-ascii?Q?5qikkfyc4gvzYSNds7TzYUvjLRvaHxj09Hl30wEzwE4ieFvr+E3RDu6Mwqul?=
 =?us-ascii?Q?MN2LoUnaWLdHR7mjh77QLkkK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pZajRSkeRsWw3oHOi2ahIbaHpJU2FyN03GtFs74Xty5kgVoBniOG8g5kn65e?=
 =?us-ascii?Q?Rfs5BCJC6nET8YUzJnVIM6HsIXqw5dQBWgfj9gpCYyci+k20Q8muDLGw4g+f?=
 =?us-ascii?Q?HCA4YHE9AheqSoCUC85SGD1BYmhJGx8LDapiTrNwYXxBnbLi/NgsSB5xL04h?=
 =?us-ascii?Q?YCaDYnE9y57ZZhpS8vLnfPEDEHErTFvg+tCqqpLKGFpsYYYQ2clTZr3qqCBe?=
 =?us-ascii?Q?AYrVG4ngXUZ/C22Q2Zkuf3cQU2NgdGpEZC7q2lkHvH9FKVlUR2gDDeHrsAe+?=
 =?us-ascii?Q?5CpAyaNJuN5HbNbSE0Y4EFJ3SRSGPtcld5YSZjd/jIUyAiHAlgMe2TdxINvs?=
 =?us-ascii?Q?/GA7XUM70ilw+ZRxt7xjgyT4xJ2AL3yKlfNH+gk/Z5/KPFYdDO/BELLhTjBv?=
 =?us-ascii?Q?ysUtse2lN+o8BEagOKa0QVUWViCEjiohaB1gVKK+3PNrdH0yWQ6XRVgbaneV?=
 =?us-ascii?Q?7Xjsy4juBwUc879KOhMGeiycyR/yNWoUwOnoGkEFsjLyrbf82vnJF5PNOOfy?=
 =?us-ascii?Q?GlHneVHPeRsqA+6q37/9cMi4UuoRhNktAs+vcWOiuvEAnP/0d2bz6qRQFnrH?=
 =?us-ascii?Q?zeONRHiyrBVEPr0iDKXEimDjhgRGkojZ43gG+oFklq24xVu/j3QutRqQx+lD?=
 =?us-ascii?Q?QB+MBwp0smediI0if6yXs043jJ2h8q8ieXfSaA3lnDH8HamYFFP6JjsKh+Ua?=
 =?us-ascii?Q?q6MoHOn45NaLUKsoA7ZYSqxeI/8wFjgt30FJuXhsz7B24DE59ckufMAoVRpu?=
 =?us-ascii?Q?WVUXYVx6krEuzL5FMfoIDkqgmGtoTUPNP4/z0JI0ehQ8Aj2LS6jhXrH/5xkE?=
 =?us-ascii?Q?HNdYXqnDBixaGZIUzBSwajWKBFHJObJDVjY06ehibS+UOP1c8aSGh+BKs7A7?=
 =?us-ascii?Q?TPxuPOPwJRDaH48+PrmFxWiOzrrR1CcX0UIW9RauoAZp5NWk7I558QQn7nm4?=
 =?us-ascii?Q?DVjiv3vzYFPV3Q+662ecPtfZ1K5KyGyFBgbsjOCMQWFjBxI7hWzqzO9ZkzvI?=
 =?us-ascii?Q?GK3wKrWHFJk/0+1D95vg9T21k0fyVMlS71wshfAhgszfbRK5VODprScCQJFQ?=
 =?us-ascii?Q?GygeN/mKc67BU3b3q3uj5Bx7lIx1sTa+DX/X+4gMusJWELOiE6Ecsp8QBcD7?=
 =?us-ascii?Q?ax7n+y5ogH6HlzE7ZetJA+i0RWLJb2KSV/IdUyjc8Mqe+NXKtoQEnzMcVbvE?=
 =?us-ascii?Q?+U1+dV+oMuvz2ITJHJ1d8t+uJkQiTkTdc5dxQvLTnpFtmT83HUCs0GoNV2x4?=
 =?us-ascii?Q?07rl/XvfanjegS8t8AmLzKrKQ645wYFxIEG855TQyidPLLhHUE8KUMSPgM4v?=
 =?us-ascii?Q?d1SkF1cHRuym6w5IeRYDS7rxzGAQPhl3T/7ylCCA6AFEyoJYdvYrNO1uhayE?=
 =?us-ascii?Q?aoPN0/5r79MLtyBDzmEthUV+hXI92GeqkltoAznwwrxDXeHkYDPfShH3mgSH?=
 =?us-ascii?Q?RcZ80DXT33QiOjJF5orVUySuL+qaq+luqps5HIC4xMs1xgPeUPiC1khfte9Y?=
 =?us-ascii?Q?0vWFRaZdccLrfD84HTVkDG9PlHueYf6LFoe+1AqifdNsqjpvOD8Y+4F27qqm?=
 =?us-ascii?Q?wGnwRYiGQil8Kc+GjoHGmaiaExMpdVEbhunHSHwd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebad815-742c-48fd-4ddd-08dcf431f1d6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:44:12.9898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH57mjPIQhkTp07naEU9xq+F7QvUOWEMwKo3QaqEObQpEcY66GWQywvdhFwOX0tQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726
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

On Thu, Oct 24, 2024 at 02:05:53PM +0100, Will Deacon wrote:

> My recollection is hazy, but I seem to remember VFIO using the largest
> page sizes in the IOMMU 'pgsize_bitmap' for map() requests but then
> using the smallest page size for unmap() requests, so you'd end up
> cracking block mappings when tearing down a VM with assigne devices.
>
> Is this what you're referring to when you say?

Sounds like it, but I'm really hazy on the long ago history here.

>   > Long ago VFIO could trigger a path like this, today I know of no user of
>   > this functionality.
> 
> If so, please can you provide a reference to the patch that moved VFIO
> off that problematic behaviour?

Looking more deeply, I'm not really sure VFIO ever required this.

vfio commit 166fd7d94afd ("vfio: hugepage support for
vfio_iommu_type1") is the thing that added the huge page support, and
it called map like:

+               ret = iommu_map(iommu->domain, iova,
+                               (phys_addr_t)pfn << PAGE_SHIFT,
+                               npage << PAGE_SHIFT, prot);

But then the unmap path still looked like:

+               unmapped = iommu_unmap(iommu->domain, iova, PAGE_SIZE);
+               unlocked += vfio_unpin_pages(phys >> PAGE_SHIFT,
+                                            unmapped >> PAGE_SHIFT,
+                                            dma->prot, false);

So at that time it was relying on the "unmap smaller gives the larger
size" trick that we see Intel and AMD implementing today. No
requirement for split, but the ARM split code could be triggered.

Next came the introduction of VFIO_TYPE1v2_IOMMU which eliminated the
ability for userspace to request splitting a mapping. Userspace can
only unmap what userspace maps. commit 1ef3e2bc0422
("vfio/iommu_type1: Multi-IOMMU domain support")

    To do this, our DMA tracking needs to change.  We currently try to
    coalesce user mappings into as few tracking entries as possible.  The
    problem then becomes that we lose granularity of user mappings.  We've
    never guaranteed that a user is able to unmap at a finer granularity
    than the original mapping, but we must honor the granularity of the
    original mapping.  This coalescing code is therefore removed, allowing
    only unmaps covering complete maps.  The change in accounting is
    fairly small here, a typical QEMU VM will start out with roughly a
    dozen entries, so it's arguable if this coalescing was ever needed.

That blocked any requirement for splitting driven by the uAPI. Noting
uAPI based splitting never worked right and AFAICT AMD didn't
implement split at the time.

Finally, commit 6fe1010d6d9c ("vfio/type1: DMA unmap chunking")
changed the unmap loop to this:

-               unmapped = iommu_unmap(domain->domain, iova, PAGE_SIZE);
+               /*
+                * To optimize for fewer iommu_unmap() calls, each of which
+                * may require hardware cache flushing, try to find the
+                * largest contiguous physical memory chunk to unmap.
+                */
+               for (len = PAGE_SIZE;
+                    !domain->fgsp && iova + len < end; len += PAGE_SIZE) {
+                       next = iommu_iova_to_phys(domain->domain, iova + len);
+                       if (next != phys + len)
+                               break;
+               }
+
+               unmapped = iommu_unmap(domain->domain, iova, len);

fgsp=true is only possible on AMD, and this loop effectively
guarantees that the iommu driver will never see a partial huge page
unmap as the size is discovered via iommu_iova_to_phys() before
calling unmap.

At that point only the AMD driver will ever see a page size that is
smaller than what is in the radix tree.

Jason
