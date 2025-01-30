Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42108A2373B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 23:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210310E9EC;
	Thu, 30 Jan 2025 22:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DnqsQeL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A57710E9E8;
 Thu, 30 Jan 2025 22:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCjSE2i7gR5riv0HmCrbzLqzbPqnSpozbVFBo/4WdRIPwFhzXl1VZLwkrs70J1+vAGNUqNsPlHm4yw0Z09z26lLj7f3rxA/UkWYgav/ONWjxO48ASnnM3iJJAMxuYiml9DjkKj8BZHp8DlHmvpx0FqJl5Rj1bZpnycTdL4YOd0OXdOlNc8GbElV/kKjUHrG9K8mOePMXrtDGlOtHtX/zmzoJpknpNJlTfmBHP+eK/2Gx9Qnb90lIWon34NwOf1jikfn7GbFpDjcJAGsOS5TJ2p4zP42ihLF4eH/yDibkLLLxMzIOiW6KSD++HZ6D9t3Vu9cu9pWM07iGraYYCfFErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snpmJoaUb/RWXJeAKWzApqndmleAw+jj5SK06cbZ47E=;
 b=Ko5+SyBusG4b52b/yzoTUs25mNzvf+oCz9se19crR8JNMDV+JwsiDGnLvc67Lpu5B6TFcC3/wSxh31WnRChqzo8oSXqLiNRbPLA01NIOSDBgHpRgdLkHFCvYeGnACDzOrhM+3F68Z1E/tx5Vy0Cw9JCXIvxMjRoCUbZE9dJ6ibRCwfAGIH278bXfKlE0DVEtev+b5GSvLdb9qltQpAZS2xt+wpl73XLeriuzO87RIltnUFpYc+dMFhLVUdV9irHpiyKY5A3CK7TDZhmzPUKBRwhPm8GAnroayj7WxXaxT4xN5DX3sFk0IA+vkMRaKYi5FI1wnxLG0nYnEq+QSXH6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snpmJoaUb/RWXJeAKWzApqndmleAw+jj5SK06cbZ47E=;
 b=DnqsQeL7iZweU9x8InhVj1JfCCHovirV73aNdDdyf8PqGEPWuI2ows1tff+DKvSi912DKa5aFnY1pO6f0kvH3Sj3OZKNf9ELQ+S+BcjPSkKfFj8QYPbeMHJG0ohIDfI06MQ5ujIuaT5uNMCkLsZ2BRcTPjhvN78qWupi8fCbUweLpBFq/bIrl5RInu2+weuB1XFxdb3PtKnXhqZyHK9YK9imxlzYnE/rvQo538CuojYigD/VTd/aFaoebm2hWpMTzu5964/W8OpIZ38eTXpXyIM5sCNG6xJbJVHWjBDzCJJ5buSJCOFxhDtDh3CXnP7/3BFbU2NmznwTqfQ8k4QIqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 22:31:19 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 22:31:19 +0000
Date: Fri, 31 Jan 2025 09:31:13 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive()
 using folio_walk instead of rmap walk
Message-ID: <fp54u2cgvyyp73lpp7bbc5zn7fmyoc7pjn3sokqmlvpq5y7toq@mj6dshe3hg7o>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <180e9c2f-51fe-44ba-ac68-5aa7b7918ab0@redhat.com>
 <c5befaa4-bd00-4784-ae66-ddbf16dfe1d9@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5befaa4-bd00-4784-ae66-ddbf16dfe1d9@redhat.com>
X-ClientProxiedBy: SY6PR01CA0162.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BL1PR12MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae236ac-7582-4dba-0ad5-08dd417dd0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Qv/84iMgbMUMMVbC84MmBjJj2tIwQKS8dvhXJ5Q0tUEgK0z8qOMbF9jIwFG?=
 =?us-ascii?Q?scOm5AtCwevNAgYwHt1ZQQeP1sdjV4dPOVHYWCl54jyfCe0DXvC3aRcisRCj?=
 =?us-ascii?Q?IgchbjdW1q1teh7m3pQx0fswrxXz4gHQdrsUitfWV5oZqR6Se9PVyDqSRL/D?=
 =?us-ascii?Q?x26EiuhLbVVyYofJYZxMJw3hC/GLWJG5Lc9CckefGv+ZIzm3RNjBnyNZ5qfT?=
 =?us-ascii?Q?NF23qYNraTK2kkThYI6ltjdiy8iikMlm5OgFz/O49UMnzO6yJufyM8IoFSWy?=
 =?us-ascii?Q?QKXQWMGCvYziCRrfuKauP15MjKs5/6PGSIiJ0ctgg63ilBnl2VcmVgP0XyFL?=
 =?us-ascii?Q?4Iv1nl/blcdS+FVyIpcOArRZW7vhQRCGSyTFLV/28t18+vgLXpoSVvRr0bnC?=
 =?us-ascii?Q?idnct7ugGsd+dvE43SkIF5do5fcoPtpZlCHJv/B0WUOMCl9pREhQC3ssp1OR?=
 =?us-ascii?Q?zW0nNU2dwkaaJ4mJ5lg6tDp03PuSChR/WYMRLrGi8UvFtaCQqYoKBiFoQ8FN?=
 =?us-ascii?Q?ngz3PemypnRKTAEQBUZOYLUHP5R246WHodYRLGLn2m5p0047I7dDyb1ed4os?=
 =?us-ascii?Q?3ept7XWEXgh4psgG8zc0Iur7mSyQJNA9YAmL5i4NN+vvKbOt+bc4GFa8GAcC?=
 =?us-ascii?Q?llH+p/zO8SdDU9+bQydVLZF706x/K7wZuELnMyvabzYg4iuL1tFwjrujTUp9?=
 =?us-ascii?Q?oDhLTEnPlcflSZO5PywbIRdN6ouY3vaRndIq+3HcPSmqXbmfzJ1BsChll8F0?=
 =?us-ascii?Q?2Cy03yzaSx+zTYY6sYLRUG/BadExdFO7PywNDyWO4WZwd9khoctW3mFLYVBt?=
 =?us-ascii?Q?s2WsKmm7KVUUj1GcvayqZIyrJq1A6eTEduYL9Tla+JJBeJb/2AsAUdYl7NYn?=
 =?us-ascii?Q?SRxlryBthtT9fqiSAKu8E/fQAPEeu04t+MnSe9Jh7vh3C/7D6Oi5bFnWnWM7?=
 =?us-ascii?Q?j8HGtTHslbEE2SHl2gok9pd5/GgCsjdpUh9VNfdj7tfAdGtuqjqdUB9gaVe0?=
 =?us-ascii?Q?il8JqBTt3w5QZrEvjhrj7ds3eurzxIXrm46ULLsfGayVDqgQoBXggvw9pztv?=
 =?us-ascii?Q?yTIUlS/umMYq2v1nMcURiv6ltX+2i1wYRjF5/shij5eOkgV5iB7AyrgxM6kU?=
 =?us-ascii?Q?xLSHcUsj2ORebvoH9H4d++gtmTqcMs308soRiTM+ruMXiuM2vmyC8vC2VS+/?=
 =?us-ascii?Q?Pxj857g/OLra+6HHUJrA5lSWCr4+LtRdgozEjSr8msdPfZ1eZbJJM/dEg3GM?=
 =?us-ascii?Q?fZidxIEPsr5or4t2Gg90EfDlvP+KmUdeqfng180pKbhD0OFVYG6HnOtU8bxg?=
 =?us-ascii?Q?EZwWzhI6AAS6lb8SZyeASHmLC44kMrNm7aCrmlVzbWrBkRwS8x56BlwC4AVO?=
 =?us-ascii?Q?0Sw1uR9lAfVGh5+gy9WCYanPwySo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zVXb+TivkkJrO7HaWRTPlOjgIi9qMx0PRtFwWVc8/9UChcFUaLKdS3bc20QN?=
 =?us-ascii?Q?Xxo8RdRmjXLjVvN1kjwx4nFr6AYczxRRKJXr0X47gu3bF5n2XwUhX1BAXwQm?=
 =?us-ascii?Q?tsXV/PJ7hQlmkH8naWA0q6/+DteXD/rNgvWggPIxFff/kf1HAk8aW7CdyWAj?=
 =?us-ascii?Q?ikd4dDOixJpro53cF0egGio9JxWdyhQHJOY9gFMswAWEg6RurNqtxeE8BaCP?=
 =?us-ascii?Q?AQuU1oO+wlwM2YG8tDP0vJP9rEt+7xvqEElVXmHn3DOz60OWL5pAE1GzddDA?=
 =?us-ascii?Q?ynY94ciPU+6OE4Loy6aCi1uQbVJUDXjco7e9T2WAWcOsCFjnpdm5vYeldzfZ?=
 =?us-ascii?Q?4V2rBqOd5YoojIPzBaye9weBoRQlkz16WcGArUL5w6PyUzwmngA+tRpzppNZ?=
 =?us-ascii?Q?ZqhyThT50q2JpXdBXLX2/PPpJxPzqZ+DVNAG0vPAXMSGi4Of4zFHBq2dF4d0?=
 =?us-ascii?Q?Y7mCCvTPhvnsCIhJFga/5gNVbqAA9zgGgFaBbzzdOw7uUQSPPLucz6mvlL8Z?=
 =?us-ascii?Q?0GbzbaLym8di8womvNTPCRyNWe0WW8pkp7gf3/R35UB030ZEpZ5t+TMgH7ub?=
 =?us-ascii?Q?yU1BC2LaKYI+HS/2DeTkSxS0s1a19UvG/D5WbxomI/D1lguxH2dFiX3TPHU0?=
 =?us-ascii?Q?LdJuo2mefjz1gzpsyUt7GUY9D2L4fFH/CWUrYBpalQWRWdvE5uzwfp3trPQn?=
 =?us-ascii?Q?tbA0aG78j0bAqfvYkz225mDsSLobWLmK2gjlKceVYZkKMgevqddE9buSqNyk?=
 =?us-ascii?Q?lPLiuxpKDCQQ0+1LsQ5vZNSwPP+7PdMwcdg1hjdC/bKea6jcnXmX8I+sUPzy?=
 =?us-ascii?Q?cpTdzrmvAQLGY29doAAiuqGyTVFNdsDF5RhOumoDr91HBaC9hpPwaXmH42N+?=
 =?us-ascii?Q?X4xdZaR9lk+fsYoVmJApOsqHHGcBqM0JAaAoDyvSEYGgDqnQ9yKBtN3ktp5T?=
 =?us-ascii?Q?APsaVLuXJu7gyIshlG+mRI15k+rMAWwpDWJPQP8VRYTc5S8eiGXZm8AmUZ2K?=
 =?us-ascii?Q?qZEiL6389G2aP3bBG+zJ3jC2D0/FcpPKbfH4cXWqX1NfsAYvAMeodcxxYs1C?=
 =?us-ascii?Q?qbZGtQ+MpdFvLoy7yxJEiZSnVjC5ppVuOcTGXI0n2AE4Qd6mfvT6WxiERQW0?=
 =?us-ascii?Q?/8NTHu06zCwQGqQTvTxGaIxufufi6Uf9F+VgYPXiQJ9FLJh9r+rPWur9umlo?=
 =?us-ascii?Q?9eWlkeV953tAbYWWKPJZF2JVU78waHIEsW9fw6qXulakxZlSPgcnqqcpxBIu?=
 =?us-ascii?Q?wOUJLS5yoio5EUsF0hH5ytnWO6eDGtM7ZC6xjsTC/PS2U+SaSNptuzrp9tW0?=
 =?us-ascii?Q?lfGbGnUiZrh93CHhgO8Yjll1H18nakCZS2g0az4apxZck+mHnm6dUKQUgmKx?=
 =?us-ascii?Q?HCfpoEBJ8QGk/Ss48V7Ari/R5zCTF2FnMZea5sq1qbB2+ofUKXE40lpikrIe?=
 =?us-ascii?Q?vwhHOCoHOrC4DKIJk+bIkurXQs72U634UO6m/5LfNjDF2F6OQrzdLU0md9tI?=
 =?us-ascii?Q?eA9Ci1VXHU9RqThip/om9KqBSt5VKiZ/oNOL8e+04gZUUZWeACaf4pw5JPJp?=
 =?us-ascii?Q?F/YqAGAULoyhCkvIGLl144fHeKiXyclRvlh+vctI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae236ac-7582-4dba-0ad5-08dd417dd0c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 22:31:18.9413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iw0KxIMA4eoqXYqPo5ypoRdWOTb6DgD0auwMsGJohKkvRQUSaJvHe3tqScNMDPCTVUyFxDxr79sCQHS/67fEEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970
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

On Thu, Jan 30, 2025 at 10:24:37AM +0100, David Hildenbrand wrote:
> On 30.01.25 10:01, David Hildenbrand wrote:
> > On 30.01.25 07:11, Alistair Popple wrote:
> > > On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
> > > > We require a writable PTE and only support anonymous folio: we can only
> > > > have exactly one PTE pointing at that page, which we can just lookup
> > > > using a folio walk, avoiding the rmap walk and the anon VMA lock.
> > > > 
> > > > So let's stop doing an rmap walk and perform a folio walk instead, so we
> > > > can easily just modify a single PTE and avoid relying on rmap/mapcounts.
> > > > 
> > > > We now effectively work on a single PTE instead of multiple PTEs of
> > > > a large folio, allowing for conversion of individual PTEs from
> > > > non-exclusive to device-exclusive -- note that the other way always
> > > > worked on single PTEs.
> > > > 
> > > > We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
> > > > that is not required: GUP will already take care of the
> > > > MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
> > > > entry) when not finding a present PTE and having to trigger a fault and
> > > > ending up in remove_device_exclusive_entry().
> > > 
> > > I will have to look at this a bit more closely tomorrow but this doesn't seem
> > > right to me. We may be transitioning from a present PTE (ie. a writable
> > > anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
> > > therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
> > > update their copies of the PTE. So I think the notifier call is needed.
> > 
> > Then it is all very confusing:

Can't argue with that in hindsight :-)

> > "MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
> > longer have exclusive access to the page."
> 
> So the second sentence actually describes the other condition. Likely we
> should make that clearer:
>
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -43,10 +43,11 @@ struct mmu_interval_notifier;
>   * a device driver to possibly ignore the invalidation if the
>   * owner field matches the driver's device private pgmap owner.
>   *
> - * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
> - * longer have exclusive access to the page. When sent during creation of an
> - * exclusive range the owner will be initialised to the value provided by the
> - * caller of make_device_exclusive(), otherwise the owner will be NULL.
> + * @MMU_NOTIFY_EXCLUSIVE: (1) to signal a device driver that the device will no
> + * longer have exclusive access to the page; and (2) to signal that a page will
> + * be made exclusive to a device. During (1), the owner will be NULL, during
> + * (2), the owner will be initialised to the value provided by the caller of
> + * make_device_exclusive().

Yes, I think that makes things clearer. Logically these are really two different
events though - I guess I didn't want to add another one at the time but I
wonder if we should just make them separate events rather than overloading them?

>   */
>  enum mmu_notifier_event {
>         MMU_NOTIFY_UNMAP = 0,
> 
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
