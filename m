Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E834F8992A7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 02:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E8811370D;
	Fri,  5 Apr 2024 00:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SuQZG1ni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2118.outbound.protection.outlook.com [40.107.223.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D7611370F;
 Fri,  5 Apr 2024 00:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Liqe2kBGrQd1FnJIZPonVWxdZGT8uaMURkguZrJECyoyo3yWr0FtSdsr2pIBEB64HmMMSiG1A2ieNzSuBLeq2mO6mNrKreWLXO1LpXyBcbHcvkY+NVnTF3u7CkmW1RjpnI1mMlMM+9GjGxBiGN7aoSktjHfd+EYevrYrLdB1ubV7njaX/1zAZozBAjckfA3ivt5YacmIhBm3IjKHo5Q3Wz+hJ59QBaVjGU6cNZOAJnXYFZ0U5BAr11iL9CYeH7QErkvN8E+5xeCJ9QBZLzmW+b/6V//6QtVgvDDKuyDDUW0CskVY6s64+BZ1KIDOJzSGfALd7p6+If4kf2SDrMszyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQWCIEnc/fstAu1vVsGcwYzGEcsW0EndKbty4ysr13A=;
 b=HBJvREdHiE1dhW4UrGpzugn1Egc4YGifki0Q3D8Van1sNlZdLFBk/FMzSoQQrI4RbRtjn9SaShAHmgzLVy2FmSgSCGnbmnsBJ0LhUso75kenWYZsnkCkYgBT5zWXoP+M4zECJ43mF7K7zyGA0P3shdWlOd08HDudPvDjjGGXOVyuI/vFdZNPwf7qQAeYyxbpCbAo+6Vg383K3MbnsSs4Xjrb7S43PIFnT23pSOp5/y/uBHG3BT01lYessheHl/UIJ803++2TXKhbzjeNob7lfyVApDbqSj85vcvydTtaOR8aiHDz6lneZJXjUO4rKY2N/mhEDQVaDGO4ScKogoCMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQWCIEnc/fstAu1vVsGcwYzGEcsW0EndKbty4ysr13A=;
 b=SuQZG1niouHfFeOmTc5Hd7oGvuMPHhJh2G+5iNyb8x/xMspQ0w2lY5uf3z1hWcGiLn2ATDj2d3o3H4WIuo6y8k7Ktt7ky8tITBVV2BmpLX/RNgK6jiDd9Fhw/kgys3C94W8qeZn0FR6c85vaRAdBVOKzFQCCmEdi5I1YqgQh1rx82i6N5gikGfzWHMCWyGcuOKz6RnFL5xv+WFxexe/sVQ3wG3CRACnaeiat+tWNPkszBHUxsJnkWY4sVUEIlXkvF2zzKkKBUngXtTg2/UbjgB7EFL4eRq/7k79Vyod1eoaCU9xp9U5I+NKfF0UrHdymQNegIF/Pc+lnu0fDfSwkKg==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SJ2PR12MB9192.namprd12.prod.outlook.com (2603:10b6:a03:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 00:39:28 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 00:39:28 +0000
Date: Thu, 4 Apr 2024 21:39:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oak Zeng <oak.zeng@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240405003927.GA11940@nvidia.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117221223.18540-7-oak.zeng@intel.com>
X-ClientProxiedBy: MN2PR15CA0014.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::27) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SJ2PR12MB9192:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nMK4PxEbFRVKmXNLjZk875tqJ+mdYDPYyftT2/ON6JiTwJY7naKLEjrN2JeTBDdVPlVnAEq0WlJt+iLlOmDPuo3NdQykKY90JmFoSc3LnYeivRipq63psofsORmRgIdt00hcLt5px4xuGmCKG6rja3UEfuj4kBd5Mrbyh49GpbW5blRiHt4/i0afEYfDtX/ZtfzCybzcUXDrRgtbBTbLFKo49piqkOr51Q6h9PpDXAwiN5ZBbbKspESfc/mo8CNPvX2i0eUu8OYGSm6QuUjdabdC0ruzx4fk/5U7Enrfnc1rXvcfokTadqiU917Rc9Udd30srvPrvXvQijknapJ8BhqSzXp+xkHOsELGsvPBOJ74jV0Yf7nIhwhEopJSD7tdeRFRhdlTxAOwdFBFoqU3iY9SMnoHS/fnJouSp2xAFUaiSpoOhLLyxgLNu4IIXrHef5ZAaualgXRBi4yryrVGVeSKUpKQ2NDVSm+B255GY1VBvr0qieoqweVBTZwIO7GR6sQRREBfzMlELhKMBz+1ldqgQWwo3Z+49FNoseY37D7EI3qTgb7honJildx633mfgAnbWjiICvPXEorh1rQJ7vBr2QJ1LcI6CbH72twQDkEXZgZpOlJ6mL5hc5SOq04WjWhNFUBaZcwW3itwo/ogu9O7P6J//zcC5MGITdQg6rQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LePs3CFRTMYQu6Xyai9GMccF7YLCs7WhGZWILNHTwNkXBtk3d4/4CJlmx50F?=
 =?us-ascii?Q?8StX3533uqwvA9BJU7yeOJkmlW+NkBsX+m9g9cMySeQV3Z57SZaC9ZGNOUsG?=
 =?us-ascii?Q?A92Xrz8S3Pc18o5cGvgDtUFI3c+FMDphD6CyVAHfEiAamocv6oSWNT12HpDa?=
 =?us-ascii?Q?jXb5ppcfdfbEzDJ2EmSFsNSZ77MawgxsZsLrIYxh1rfITuKMAQgNkSOyYSnK?=
 =?us-ascii?Q?NiCU6yZHESma0dkVWgRxVDpD5vQtreW18kHAkdGiQaRmis7n6baaMYmdPm8W?=
 =?us-ascii?Q?Okkt1hq2nSUoEjHAUcdaTyfMylSdyi+4PSKKsUH1/VPRubMqZzRSHmHIA7m/?=
 =?us-ascii?Q?CE52pxtZGIu/AvBGjX6dK/Sns9az7Aau2LjgaF6eieIc8Q/odlpS5sH4dV3m?=
 =?us-ascii?Q?y+cgPqDHfSh+FOqgEEGKTEXPzLrDK2srm5TnIKFp26y/E+9yXmjqiehAWJn+?=
 =?us-ascii?Q?VCAJbjhaHP8Z9LhmHPWMqQUWglNQfq1/cS+ywqn54+YLiInziBwehwql6i8I?=
 =?us-ascii?Q?5HoG5MIji1CWZO47lMDMXyXPWVI5VRX2UGr9DizLdONnd1Y7s9Hc7A5EV6tx?=
 =?us-ascii?Q?uBS6SSbGWZaQW+5hX6QC+T5hAI5+5IVaK7ePOSacP9++8k7mrvQOMw9Hog8R?=
 =?us-ascii?Q?jsxqXg77aQAiN4VYH5eWaLD0ltENoBZJuliFY1JnqXB7jL1Fds3bx0+owI1x?=
 =?us-ascii?Q?gHEeHe2FPwja9yWYiyXs8Y4lD9YPkK7VKzBFdETEq+EZhAC9IY42LYW1RYMw?=
 =?us-ascii?Q?+iHGB2Bxa88xyOEvuWudmnMs/Ly3DFE4IP2+bt6R8iSCPnKCT0y6CyL/NQzn?=
 =?us-ascii?Q?76fx2Cg7w1T7i6DHVDoS4EZH6b0kxeJFCQnt23iGpBP/X+2sYWW1N697LbU+?=
 =?us-ascii?Q?70lzGNVQ/RaCGbozAdrEEFC9je/xb2EIvGKDvKFqeFWy1Q8g/iw7hBAqPyV2?=
 =?us-ascii?Q?f6cRQtIqKENS8we2KPPyJTStGDTPCHwh+O0QZbfNLRE+gWfPm8QPEfQk8des?=
 =?us-ascii?Q?vlbBa3c21NNoOWBbqr4XgUqvX+mbJhaOPJ1oPT1s6yiA7lokpCj7EEf8whIr?=
 =?us-ascii?Q?zGvqWlqP5J+GMzpl6jRVyi/OvSKq9Q2sw4qS8WbUrdyxaVbpZqa1i4+dOCpl?=
 =?us-ascii?Q?AeErIqvZXEGIAhjFNkA6JXxOZlbCGUXcavIhXR7syahZxMBBfClHG+YiSRbB?=
 =?us-ascii?Q?J45/7w20zrmqFFwQQu65tVnd8kRjz8vXJyzMinj2t99CUKN0ydpmozhKj0eo?=
 =?us-ascii?Q?ezysOEAY8d5e1cLvObcddTbq98O5+P20X7QC3DsaH69WQCz7P1TCupR5hrVd?=
 =?us-ascii?Q?0RNoE3ODB7o4LUkZUJ/BR8MQjVavTbrpxCRSEhjOnObUZQEzm4WCiJWE8ZHG?=
 =?us-ascii?Q?AOrBeiceKzwXn9KXzyGtvPZtUi/HK7CRk3pEqsHCy/FxRM9pWcFda43trX/N?=
 =?us-ascii?Q?btHrcQBjoKjySorsjfWpwqNj3Lh2p9yrweq+N6HsaQ6o8FYYXZQKW6uk/apQ?=
 =?us-ascii?Q?m8jiW0kDFWWeAjLnsAjcmObt2k1ava0J0pTN1hUuB2Aoy+2DN8TuoJIhjbz1?=
 =?us-ascii?Q?1Pq8kQvQLHQLNvFV/+nQHrerY1vrv5kB1I5tbQC3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2203dd98-46fe-4e49-aacc-08dc5508d9c2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 00:39:28.3968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i3eW41w2CNONpLUjVIZFQ4m697ckarqhHpnM2pUsSmOBAQ8usOSQbN7mWpbqRdF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9192
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

On Wed, Jan 17, 2024 at 05:12:06PM -0500, Oak Zeng wrote:
> +/**
> + * xe_svm_build_sg() - build a scatter gather table for all the physical pages/pfn
> + * in a hmm_range.
> + *
> + * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
> + * has the pfn numbers of pages that back up this hmm address range.
> + * @st: pointer to the sg table.
> + *
> + * All the contiguous pfns will be collapsed into one entry in
> + * the scatter gather table. This is for the convenience of
> + * later on operations to bind address range to GPU page table.
> + *
> + * This function allocates the storage of the sg table. It is
> + * caller's responsibility to free it calling sg_free_table.
> + *
> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> + */
> +int xe_svm_build_sg(struct hmm_range *range,
> +			     struct sg_table *st)
> +{
> +	struct scatterlist *sg;
> +	u64 i, npages;
> +
> +	sg = NULL;
> +	st->nents = 0;
> +	npages = ((range->end - 1) >> PAGE_SHIFT) - (range->start >> PAGE_SHIFT) + 1;
> +
> +	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	for (i = 0; i < npages; i++) {
> +		unsigned long addr = range->hmm_pfns[i];
> +
> +		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
> +			sg->length += PAGE_SIZE;
> +			sg_dma_len(sg) += PAGE_SIZE;
> +			continue;
> +		}
> +
> +		sg =  sg ? sg_next(sg) : st->sgl;
> +		sg_dma_address(sg) = addr;
> +		sg_dma_len(sg) = PAGE_SIZE;
> +		sg->length = PAGE_SIZE;
> +		st->nents++;
> +	}
> +
> +	sg_mark_end(sg);
> +	return 0;
> +}

I didn't look at this series a lot but I wanted to make a few
remarks.. This I don't like quite a lot. Yes, the DMA API interaction
with hmm_range_fault is pretty bad, but it should not be hacked
around like this. Leon is working on a series to improve it:

https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/

Please participate there too. In the mean time you should just call
dma_map_page for every single page like ODP does.

Also, I tried to follow the large discussion in the end but it was
quite hard to read the text in Lore for some reason.

I would just opine some general points on how I see hmm_range_fault
being used by drivers.

First of all, the device should have a private page table. At least
one, but ideally many. Obviously it should work, so I found it a bit
puzzling the talk about problems with virtualization. Either the
private page table works virtualized, including faults, or it should
not be available..

Second, I see hmm_range_fault as having two main design patterns
interactions. Either it is the entire exclusive owner of a single
device private page table and fully mirrors the mm page table into the
device table.

Or it is a selective mirror where it copies part of the mm page table
into a "vma" of a possibly shared device page table. The
hmm_range_fault bit would exclusively own it's bit of VMA.

So I find it a quite strange that this RFC is creating VMA's,
notifiers and ranges on the fly. That should happen when userspace
indicates it wants some/all of the MM to be bound to a specific device
private pagetable/address space.

I also agree with the general spirit of the remarks that there should
not be a process binding or any kind of "global" character
device. Device private page tables are by their very nature private to
the device and should be created through a device specific char
dev. If you have a VMA concept for these page tables then a HMM
mirroring one is simply a different type of VMA along with all the
others.

I was also looking at the mmu notifier register/unregister with some
suspicion, it seems wrong to have a patch talking about "process
exit". Notifiers should be destroyed when the device private page
table is destroyed, or the VMA is destroyed. Attempting to connect it
to a process beyond tying the lifetime of a page table to a FD is
nonsensical.

Jason
