Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B29B922E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 14:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB9F10E2DB;
	Fri,  1 Nov 2024 13:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JbBiIhfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94FB10E2DB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 13:40:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCk04U1dN/AMsIn0sYHHgpiScHb7rdayPuPA6qo1wC/likW9uObFXsqpaffqS8Dlinn/K2sRHo/ol8FRgXLm+HDdfsEjlVLR9CSIF06wa60eMH2chGXPTJcU+Q/w+wYkPYEC31rWHHdyBUkjxvmdVLs25bbDmtweuWES2seWOloTxtPgvow03OzeIZ3FRspiC0wgMhLEv1KW3uuN5JuH13TrXn91y8EseU+zOblLGKMng2JgepR/F5l82ooKvMb/VK+J2bGJXlyfIAx6oiJH5UlOjRzHNHXUbybyz3kIddRwpSjvjw+X7gflZee5WkqOCIRVGWJdiLEFhn1Hc2w8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbJldVtD0UTzSyeSORjqKJs5VMu/WuEyrg6iefWHtGA=;
 b=D0bPlioV+BWJWN0ysFJAvrZeuuh23/l8blTRbyFm9c7c7WhzMsHSe5ahNkPNympGSoj4a0xwyuFAzVq+wDjRKQgpvzacznkBA5mC+3vzoW9tp0N6qDBOlhY0g+/XlCFVmOBVE68v4cmIRhG/G3M4E3maHU+5LhRtYu25pdnStz/25neDMDQhjW0NKuF2OM9b0JnLspHfJLMfUPzOafbwNE/BQpJ/j8xpffZ4//UxRjgoTTPLnWxh3o1Ou36OmZ+fD/zRXVEG/2dFEmp3UvC3Vk7OwAUCZIuzuz2n5u9SYZSS7r34F8+XHD9XseEccGiTzhharLK3fEJ5Ga4Z97/HMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbJldVtD0UTzSyeSORjqKJs5VMu/WuEyrg6iefWHtGA=;
 b=JbBiIhfyAgrKLb5/0WFgmPzRF/beRlJUXM43/HFe6wWWBdMarQatAXeOmywPClwuRdvqJvubJKyuZfx5dy/M2YG4yQsgkd/hqKcMi9n1bhRMBh+yrO17E+icc6Ijuf6JH6/jaNejSXDywZF3vmeQ7/Fwt22Ibli5JxH+iyvq83EAiWc8sfV4Zrd2Y9vFbP6moUhGXrJTAF3eWnLd5L8Yt99Qmdr/Ofhd5gaDu2WEfJvhaaOnvBEEL2xA9K3dBcOS3YoDR0ZeS1qgw7TYgIev57DzS/WuAI8/sHl44GGHXWP6bfv3+tq7DDQFybM6upgG0TSFERnrpf8xOes64iiAdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.34; Fri, 1 Nov
 2024 13:40:07 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Fri, 1 Nov 2024
 13:40:06 +0000
Date: Fri, 1 Nov 2024 10:40:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <20241101134005.GA109739@nvidia.com>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd6f1c8-1e8e-47f7-57bb-08dcfa7ab272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0m4XCnAEM/N+uOP8lHPjlwMHEMTqiRKZrAnv/4zOlKgqL+aMqevcfO0/i5Fi?=
 =?us-ascii?Q?uEer524X4mr3kHOKy5ZnJWaXE4jQDRA0hmYwPPJ56JTdiL1vwgCLrkjXZ0bT?=
 =?us-ascii?Q?QW41Qu5KCMfUgHYtRVB3nQOKKX51Kfj82RJXUI4Dl6RuBfUePX2XBjsoSLoP?=
 =?us-ascii?Q?n9HowyQih7Q+l6TecFM27z7ddKndEeVDxe4xsYQTM8GcLHlMQUOx9u2ldFMd?=
 =?us-ascii?Q?w9WKrEiFbKCjVOJCSRlwHpD4X1Pky7xTn8FNpW+OGjYTBbrD17Ow7+q2YvS7?=
 =?us-ascii?Q?ocwHOOrS490y9awueEaibI+uuswbKVBbdMtokoiBlps7+A/TpMk92mZ0cfE8?=
 =?us-ascii?Q?T35FLCl70s7RjUEHYvkAzDajEUuYUqvzOlHhC120r/JAuzogzUur0elgV4sr?=
 =?us-ascii?Q?DPj+LPUXhFyAp3jBPBeMbzHhrHpqu//Amh3ZZ5HZ7hT9a/y3hXg3sCB+QnhX?=
 =?us-ascii?Q?5DNPryDQMSOfdidzjSP4JTeO7xHgHpVowh0fRkVS5vHWyZQ2YERhxAhfUawx?=
 =?us-ascii?Q?a8P+OT44WnfCP8bq72Q/VBsiQqylW8PAuyIeY3xOlxnZnZLnFpU0EGCxz4kx?=
 =?us-ascii?Q?cIADYAfhTfq+M5NLYcDHxPIaqLrLRaKaKSFIvm5VWYEWUPXhtYPi4VOdtUJE?=
 =?us-ascii?Q?44oh6+q9ZI3TxFJnrZKT0vbKQ3iRzawEFtdRC6Fw63Uo1MYNl9UFek+Xz7lU?=
 =?us-ascii?Q?VWNLljAAXOirkw4HVIsAmVqC8hnC8IleMtZzVY/L8F3MZ3ja8HUlwmkANssk?=
 =?us-ascii?Q?elR34BAi4sPwP7gXpLiqJvb3oxDi+HwsCVFAO0oQtzOpTKqa8K1jVNoyx/QV?=
 =?us-ascii?Q?F4jXU8ZHg7m1dxzHRZ7iKz5uDNzygwb4RLsvR9c902KXuyto4TIKl798YuR2?=
 =?us-ascii?Q?SLkHfKYc7KdJG5e3IeAGbNhE4+pYtDrbZMw7AsEE4RnpnNtZJZK7XkBV+Uhw?=
 =?us-ascii?Q?Po26OQBoFSiH2izj14vPFi1SCJUVBXSkffynbKHwJAXnF0PknBzCyzlFc7w8?=
 =?us-ascii?Q?Yvb9zqOOmLou8QC3F1Qs60GKcoBvoOHbJTAD5q5dFKgmLHTHshgyAQO1+cw6?=
 =?us-ascii?Q?oz97eNSDiL0DPuOSq+CFDFKvzCUnNvKHBkcf8M6/Wu1Zc1naQB/ITSCR3OC9?=
 =?us-ascii?Q?8X4EVWdHG7F8QlPpY/C7QJaIQYv32xaMcBtEhi3Z91IGhnv4t+DNFDPpZFxs?=
 =?us-ascii?Q?zaYGxgcWqajzfBVjqFyBn2qsOo5LNYIgvZxGoukMwAjqS7ZXYXuOlxXB/y0j?=
 =?us-ascii?Q?P1mDOLiKLSk6gqGa2lFTra+hWr2uPvw8EI1FCJL+izPyB34vBLU6uXRLhEcp?=
 =?us-ascii?Q?5vbMPqHkB5b3HGPKKke6ARXS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B9/DZtcTEDxRabtA683QF/PiXPSSyxIyMRGtwNCPHGT/ds65s5Cmw7xFHbd9?=
 =?us-ascii?Q?n5v+MDlOZXWxgU7rYOFtr3IXo0VhnwbKdNVt/pdOMTggSSWqDIgLV7m2wl5o?=
 =?us-ascii?Q?V+IryL51/0PTYOM5gu5u3BZBwRwa/1EcUYnzUl60L6EGn32MuV8KqvnjRduF?=
 =?us-ascii?Q?hPQ0a3GPKUj6NxdFZ7xdKLd8JXLU2iSml9ZFoWhwFoeqZ1kkfkzQBITGqwwR?=
 =?us-ascii?Q?bbzTy4L7ixTNrvf4+yvQuG9KBTuEODijQsS36xbEnXQA2Kc9Qj7I/Qx9rSKo?=
 =?us-ascii?Q?MtuQv/+hzRheMy9+9tbQfA4T1hRrA8IyEBtVgG+JcasxK5dIySAt2IvIYHU0?=
 =?us-ascii?Q?eLiSl7Rq9lh0C8sj/ikAorfGKUcsnhK99z7srJD058thv13PKIArgwMSS0ms?=
 =?us-ascii?Q?n7iMw/8q+8i4NL+pGwNDkNaKu08Ts9zw+Nb05GRSWsoD66n/BcI41XNwrB/z?=
 =?us-ascii?Q?hiImd15wRl9dt61ZxB237hXNykQV5ohldqGfTtyEv7sF7ZvNxm7cZK/zl19a?=
 =?us-ascii?Q?zbGsOb+tWkSsl4pwYbMn5vqkGM/N2XX6KZ3XVUEbhbBUsMHVvxSYQiTNVAdG?=
 =?us-ascii?Q?n/9hibkdzDmZc5J6zajz/oIscft0rvsZ7e/mmZW8DhE0TJm0wfM4tnvezQpD?=
 =?us-ascii?Q?RYL98QxfoGClbjltKsjzF1pph50G/0nIaM0iHUg87Wvm1WaFwE8A6kW5o1tU?=
 =?us-ascii?Q?xDr2py9aWtD09DrOyHC8WrCUeumJXiOo9FAmFgBbq+9MLRhi0STmkTxLvEHX?=
 =?us-ascii?Q?3VymoXEryfrcmEIN6gfwL59tu88IPDHpttXDoGGkUPH3Sgtb1MtG3pzeapoQ?=
 =?us-ascii?Q?Zin1eVnfjsv3O/xZt6Dto5YFHxvq0qBdP6NObZE4hC0nWnP0h4iUJGhyFt6E?=
 =?us-ascii?Q?OLABRCir48HpJLUgXG7/VKEqp1ol/mzXsahkoqmU+fPCrTRHoYQQDzBbef2b?=
 =?us-ascii?Q?+GgmHLtEXpfUSytvRoIrc0vmwpkRUGmwqpLGoRTDUGzxOGJBBqf+Cos9k19l?=
 =?us-ascii?Q?iR2xNXkMzTwQo2p+qqFxB85mpf2nIg36XK4vb6+jrP9JUcHes4zcE3ISqt54?=
 =?us-ascii?Q?8wjF6qDv8addgcY6REbHdHWdvcQpdHVCo5Z1DCtPuKxLdtB/fk26Fkll7vWc?=
 =?us-ascii?Q?VHvkB+NTTMuGo9ELVucqpeu3fXCG7yBJZ3ZvuMY+/G1cd3Rpc7WYhvg7xiDA?=
 =?us-ascii?Q?I1yimU+BN/W44tCAr64eer2hu5HZYN65cNKybsg9g2K89LoLtebmcYTeg09P?=
 =?us-ascii?Q?2WMKfh0R9yCtr4i+1D3VtA5EMnSC933FqCefl94nCrUmytzajD51797qzRq8?=
 =?us-ascii?Q?J8OvJJEsSyyVxHhtg+RZS5+CXBFsQ+1cH79uQaJu6lnM0aA9nIXesS84PR3g?=
 =?us-ascii?Q?9a1N9HNSMFRth8d/Jw+LBzcLVs2kcEVwZaCnMuTxdj4zeZtfUMvCa8Y5wBMP?=
 =?us-ascii?Q?Fj1tz0wS062sxt+d6yvqIEkp5Vowv7/Dr0xF3fevMmKVB5jtTqSSLS0rSgeh?=
 =?us-ascii?Q?vowN9IJlWIBEBBqdN1+OmurdrZuNlUBSc+XK+h6sZsntOkHedcd3zhPtIYWk?=
 =?us-ascii?Q?Mlj9K3Q28hXbrAHnnrI7/7FTMyRtYuLgeSwemgqJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd6f1c8-1e8e-47f7-57bb-08dcfa7ab272
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 13:40:06.8271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBg4gAtWIwdV0rWRJ8aqJ9V/OztHRpBjVvrlIt0LbD/RS3sMw69WYnEQmaP6LoEx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966
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

On Fri, Oct 18, 2024 at 02:19:26PM -0300, Jason Gunthorpe wrote:
> Of the page table implementations (AMD v1/2, VT-D SS, ARM32, DART)
> arm_lpae is unique in how it handles partial unmap of large IOPTEs.
> 
> All other drivers will unmap the large IOPTE and return it's length.  For
> example if a 2M IOPTE is present and the first 4K is requested to be
> unmapped then unmap will remove the whole 2M and report 2M as the result.
> 
> arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
> the 4K and returns 4k. This is actually an illegal/non-hitless operation
> on at least SMMUv3 because of the BBM level 0 rules.
> 
> Long ago VFIO could trigger a path like this, today I know of no user of
> this functionality.
> 
> Given it doesn't work fully correctly on SMMUv3 and would create
> portability problems if any user depends on it, remove the unique support
> in arm_lpae and align with the expected iommu interface.
> 
> Outside the iommu users, this will potentially effect io_pgtable users of
> ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
> ARM_MALI_LPAE formats.
> 
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 72 +++-------------------------------
>  1 file changed, 6 insertions(+), 66 deletions(-)

Updated commit message - Will let me know if you want me to resend
with this, or any changes:

iommu/io-pgtable-arm: Remove split on unmap behavior

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
