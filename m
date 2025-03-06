Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF1EA559E7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 23:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AF010E844;
	Thu,  6 Mar 2025 22:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gRuNDTPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CE110E045;
 Thu,  6 Mar 2025 22:36:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rixHV4JxOdUnAWo+O2Az2Wl16jpdB9nRK8Y/Cb6gtloZMrLqUY89OBYxg2Ms8jCvyeql71fkqHe3xcr79biml9RBLjUOtpKfydOakfdJ5fuw9zEeSCf+eEqZIjrDOWnpMWFxSX4gjSiFsQK+9hl+XOIn/xIe5DM6lcxvaRrzz44dbJzfeF92ZA/iWEnQhVtKDbrCOBPyzSC9X4Gy8VI1IivMp+TSgMNjwsrk+PhLCuZ1QEJIrs6VR52J8wQtJxN7KEf7g5i0NoOQzPIaBkRpPf13cCtMeo0Da1/0WoUZ6rh6gOi03CspVTty2YLbSo9ZccYO/SAxjS+7o7yO7Z2eZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aF4rOoQ7VzD03p9xpB62/Zono3PnealljC5tZ8tV7A=;
 b=yMVKij3GXHznLenHMzgqRD8u850hTzsL/7XCvJQf5RlJjUP/6Hi/XpnhnzqWYKTvgY1c2KDqXDut6D3zJEFsu4CtN1d/kJKC/eb5UCVpVYHXUQgymKgbn8vDz6HbCbMPvxH7wUIlaaES6omunF6XR3DspEhj7Um0gmul2broMr8g7+j3wYvi2EvtUq+7UXX/Ld5bueZubLsVuT2CC9AJQDldCI5HtfkU++6AL81NXgZwgH/9Ix2h7YYfJkLuYh3FVGC86hJbOOL7pTIqfxCQuwpOM3mNSwqQqzY7In5zIbqse5Sjir/ytEDVCBig69s8EFGItsxDH2/4+R7gzKb8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aF4rOoQ7VzD03p9xpB62/Zono3PnealljC5tZ8tV7A=;
 b=gRuNDTPW3nJCsjHpT2KRAvy5rN0vletjhKb57JYnPrBR5ZITs8lWPmlSBqZCeSOGAdGHV2rgiUJkFgBZifwi3g7gBLKCrP4vDDZDWYGQGS7nswpvkdcF+MeVSF9sUGswLL6oezQ1T5vq6Ysy6r2uuIdj2aKFw2iyvPtLto1x6BHF/SygXamfxGpXz1M09CSZkMHt7/yoF+Bc4SAcZNtSsvfaGhdm0tnUgJIj8MQ0B+jdp+IUQv6LmtEWiwO/ek9hcVr/EGqdrsHIvgfI4NvRa7BbT6/OLxUP/dG1za1+PiMbwzWz4y4svSHTwcvz4jzP1et4sPXI4MVDOeU7mNHhOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY1PR12MB9582.namprd12.prod.outlook.com (2603:10b6:930:fe::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.20; Thu, 6 Mar 2025 22:36:51 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 22:36:50 +0000
Date: Fri, 7 Mar 2025 09:36:45 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, 
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, 
 Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 Zi Yan <ziy@nvidia.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>, 
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 07/11] mm/memremap: Add folio_split support
Message-ID: <7jbfqmncp73arn2hrugmjin42akxan4krqij46psxyfdc77io3@wigq7szhibpb>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-8-balbirs@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306044239.3874247-8-balbirs@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0047.ausprd01.prod.outlook.com
 (2603:10c6:10:e9::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY1PR12MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: ff09ed91-10bc-4944-086f-08dd5cff62d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4YGQXyoo14HndZ61vzA8Yn2lNG+xvbPAL6IizbYIsYXRlzwI5QWvG5kJ1L50?=
 =?us-ascii?Q?gb8M6CbBY5nMiXUlxk+69Jw3WYSpylyrOTBAYNA3hk9gyw0JuE6FCnBpi/9j?=
 =?us-ascii?Q?65Pj5kWcbwdzK+FxUipcD6hXIUyG+Pqa26gD+Qi9tLaLUDsrco7hpW34aNXK?=
 =?us-ascii?Q?kHRvmh76xNIee4ehpJTIrCYm3dQyHoqDn8D+0VcGhqihtLSO7Qvgx4DhCv0F?=
 =?us-ascii?Q?0m7/9dl7izXWTH6wABRLSpd1q3uWo8AetmKQ75tUxXJj4HPDz12hGT7nVS/O?=
 =?us-ascii?Q?DzGGXizJ9nF5dVZuSHcK24kggY3zc2jUV0EdZJyob+u83xPtcLxCcfauNWmH?=
 =?us-ascii?Q?0W4fgtlinuU3L2/ikrxtfZax+rDHn/jD2M7gjDKj+MVyp1h3u/GJC8WEg4ak?=
 =?us-ascii?Q?jt9oJnGoUHJu4aPCaZPBpsFFim9gIUxRS9kNHErqgVfxACiGlJoJoptmj5K6?=
 =?us-ascii?Q?Ny9PBYRuGr+WqDBl1zS5EXCVdusQ5SFGE5wLZ5XHa4D4D38LdwSDX1YU3WKI?=
 =?us-ascii?Q?1vvkN7Oo3iCjRbbszYFJkdciyZUXaDDfBFG5kklasJbrWJ8gqUsVwdfxd851?=
 =?us-ascii?Q?WN4NUfgXyLir4GmeT7xI4hMs0SC0ih7XZxAbF1OKV67prZc/TxtmhNfKwrO9?=
 =?us-ascii?Q?GXJJBm5EgL7VfFaf0HC2QXnI0udfDKdP7KvGOgx+sOftMwKkJIMVkYCu14sM?=
 =?us-ascii?Q?UBbzx978cgeUVrNFu+ztwxF2vVPcRnqOPwLEMfDNoJSOqeubAMJ/JhYnK7gB?=
 =?us-ascii?Q?w0r6hOytnOd/S2zviZHvvsAYpov+rfQKem8NDLpJbwLqkdi6hBlpwX5npr/J?=
 =?us-ascii?Q?hSoZyuTdk37iVSIL7lfIfvy/9R/3RjKSk3VemCx4m5CThnKVFizSUShMR2vo?=
 =?us-ascii?Q?jIIwQSsmbAy3H0dABrViTFFu52rk3DXO2okGzrb2+ueGK55g2PL/9Djpz7vd?=
 =?us-ascii?Q?8RqIfsK5APvYv9cPE1mVTQqXGKefCLlcJjREejsZoaxwwfI0ESR9hHyc//Xt?=
 =?us-ascii?Q?/EiNx5kOiEQ/dnNxJyV5D3XCKkPcifWMcO2Eo3FRU+dNMqomDwcTwb0oNZNR?=
 =?us-ascii?Q?bRO0N9F0jdQSAd3RHJtp1uR5wyst6JnkAkEfkVQdh+vHYySVinu/l7f1i9Ci?=
 =?us-ascii?Q?uX4gso3whkWmj7A4rSjKYZVnyykOcAo6O1f3KclTfbKv3Hoe1+xD1ScGhaJy?=
 =?us-ascii?Q?WKXv7VUROC8OEGaG9LcDd3M4PyePc0Ph3Njh4cK5CZNKuH04eWJ81HIvq5ea?=
 =?us-ascii?Q?iF59+y9OHvgS1Ue1N3wLPEyW3UKbiJpBEh6SM3v2mgrX+r6BPntbL/o1bSlS?=
 =?us-ascii?Q?LXJxlcAMX5vanO40UXXzCI2i10j0FkxpVTuzZ6tJGEgnzwPTXXAOhQihZeEq?=
 =?us-ascii?Q?B9G2LRq6vsvprAb8H2+M8P1O7kRD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x/ujtAm6I9Y6AWp1ctT0o3H8NHShlB2WLt/VgKwXpColA//dQE6wIvrG7NNs?=
 =?us-ascii?Q?dQTDHlYofcwNDdv2USJRvS1293JJL7Ze4OYeF/pnL855VXwcGBChNpWvfI3c?=
 =?us-ascii?Q?Tj2l9h4O8xhnuZLifAQimfkArGM37PfOtp/fkiQtufTI7hjgQJzdXkKrCFOM?=
 =?us-ascii?Q?+FkIyGILvT1fqs15QLh32o59iLcxgMjjhze9y4CyI3CH8HPSC0dFn9wWpmBT?=
 =?us-ascii?Q?XyquiAS0yA/kzwYJKwm5U7foE4TnaFAGYm/9L2cvz189/kOAFoQC1De9iJCe?=
 =?us-ascii?Q?6e8/eCJ9lHrwUi0zymlrQ2eUMIM3il28BwAYuPXF7aHgPxC3HVCY1zppmJrX?=
 =?us-ascii?Q?GQ4jwIJKPQLQ+kJXtBeRc8iFhyicNkCPYXwRT6yeO8XnUc8Isiz53tGVZ1G+?=
 =?us-ascii?Q?SasChS/Bo0x+KprhxiRGmyknqbdy1Hbc1BcKQo2YxXUoAGsVw0MyeiQ690TH?=
 =?us-ascii?Q?hQ62vnEbRew6HcHApkJTpd6upcyNLSkw1NgqBg8vt5lJW1ubjj01juSf5qBC?=
 =?us-ascii?Q?mMEqKv6yT57RbdYyUmBKaBWRC6DqUwLDDVgdZbZ7yoTneoxeZ5GC5s4jdUKv?=
 =?us-ascii?Q?ZGQXXNIhvBLssb80mzAQfrxWwt7XLrkWp7e55oRYSMjXE99zgP0qpLjampWV?=
 =?us-ascii?Q?hqmdGSV6ZKa4pR53iwg6y9RBK7GE7jDEXbzOUPcclgXmGgdf4D+Afwnhbuli?=
 =?us-ascii?Q?YKvkNbT2hHVc53N+dxrmRYX1tvKb9bW4IES5Crxd/Dqbqwy8itayaFpSYgnO?=
 =?us-ascii?Q?86ay/sBxPLlh6dtSRTbnCjZctTEA88+0vDYskmOSdLoaCPGRaQZ5ZgeTfMRp?=
 =?us-ascii?Q?E2BwAnTjwLYo+nZqOK1w4zlvwUX9Fd3Z4JL5/rDnel+t6qwInm1uy5AEcMqK?=
 =?us-ascii?Q?egBWbKSy8kDZyBzkGGpVO+kC7VVCOe9Ic+K+BR4PwDf2el8bEjUPOoU2oEEl?=
 =?us-ascii?Q?3jP6OUVYouj0+6lHftdvvIqRQdZVGx+Nsk2/mXCF6yJOe+CtJCP4fdVHlRI+?=
 =?us-ascii?Q?kWDamMuvFeeTxV5MvfZtgIo2aA8i4vMbAYYLUgWTtnq1xTOk34G9shoTFDMH?=
 =?us-ascii?Q?qGC8iMeMG3I0rTaUsfoiDlu3zgDoFb7V7H72tM0k2BesM1uRIVIbBrKcNyl4?=
 =?us-ascii?Q?r95+E2IIIT7fc+qzJzrv7IlOf2+la6Kh08Da+1VKMegwEd55dUNt46u+fUSJ?=
 =?us-ascii?Q?ccRd8Sf3rQmtjK995BOwp2f7a6dgfFHL6KihuotAxXFA5zEv8S+jkxFg7c6F?=
 =?us-ascii?Q?HKosx/wMvZIi2MpiXduPvVe38UfPFSV0f2esOJJhjNANfvkcAtuFTPpmUBMq?=
 =?us-ascii?Q?gs/xyYz2Bhtkuzyh5H9kDiQuRTsdHvQ3mvfiCssodmxyUfrtAYTRIxhh4N5A?=
 =?us-ascii?Q?HxGjSLrT3E1BrAgyerSOT1Wo2kHsWG3B6N4N/tLQkrDiUvFWiv5Z91qE0DUN?=
 =?us-ascii?Q?+3cZo99aXaQ6Q0nxPX2oPkH3kCoXVxhuh0eEB4QFLzKoYYWHdb6P6mhLVCbZ?=
 =?us-ascii?Q?Gy0x8tcn97VziUavB48+4qrCs+BQWu9MIt2E8ZzXDIvouMT+ws2PFhaLxDsz?=
 =?us-ascii?Q?pFlKrZoqLqALybCwI0r5W+Ga3Bj5Q0bWh4S+XWov?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff09ed91-10bc-4944-086f-08dd5cff62d4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:36:50.3271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfjsbbyr9Auq4zQTLNeglP4ecTaLxveNdgSWDH2q0YX45eRqfcYHX5STHReKLCLzSYC2ueZ689bMGDdOhkQ/sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9582
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

On Thu, Mar 06, 2025 at 03:42:35PM +1100, Balbir Singh wrote:
> When a zone device page is split (via huge pmd folio split). The
> driver callback for folio_split is invoked to let the device driver
> know that the folio size has been split into a smaller order.
> 
> The HMM test driver has been updated to handle the split, since the
> test driver uses backing pages, it requires a mechanism of reorganizing
> the backing pages (backing pages are used to create a mirror device)
> again into the right sized order pages. This is supported by exporting
> prep_compound_page().
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/memremap.h |  7 +++++++
>  include/linux/mm.h       |  1 +
>  lib/test_hmm.c           | 35 +++++++++++++++++++++++++++++++++++
>  mm/huge_memory.c         |  5 +++++
>  mm/page_alloc.c          |  1 +
>  5 files changed, 49 insertions(+)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 11d586dd8ef1..2091b754f1da 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -100,6 +100,13 @@ struct dev_pagemap_ops {
>  	 */
>  	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
>  			      unsigned long nr_pages, int mf_flags);
> +
> +	/*
> +	 * Used for private (un-addressable) device memory only.
> +	 * This callback is used when a folio is split into
> +	 * a smaller folio
> +	 */
> +	void (*folio_split)(struct folio *head, struct folio *tail);
>  };
>  
>  #define PGMAP_ALTMAP_VALID	(1 << 0)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 98a67488b5fe..3d0e91e0a923 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1415,6 +1415,7 @@ static inline struct folio *virt_to_folio(const void *x)
>  void __folio_put(struct folio *folio);
>  
>  void split_page(struct page *page, unsigned int order);
> +void prep_compound_page(struct page *page, unsigned int order);
>  void folio_copy(struct folio *dst, struct folio *src);
>  int folio_mc_copy(struct folio *dst, struct folio *src);
>  
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index a81d2f8a0426..18b6a7b061d7 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1640,10 +1640,45 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +
> +static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
> +{
> +	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
> +	struct folio *new_rfolio;
> +	struct folio *rfolio;
> +	unsigned long offset = 0;
> +
> +	if (!rpage) {
> +		folio_page(tail, 0)->zone_device_data = NULL;
> +		return;
> +	}
> +
> +	offset = folio_pfn(tail) - folio_pfn(head);
> +	rfolio = page_folio(rpage);
> +	new_rfolio = page_folio(folio_page(rfolio, offset));
> +
> +	folio_page(tail, 0)->zone_device_data = folio_page(new_rfolio, 0);
> +
> +	if (folio_pfn(tail) - folio_pfn(head) == 1) {
> +		if (folio_order(head))
> +			prep_compound_page(folio_page(rfolio, 0),
> +						folio_order(head));
> +		folio_set_count(rfolio, 1);
> +	}
> +	clear_compound_head(folio_page(new_rfolio, 0));
> +	if (folio_order(tail))
> +		prep_compound_page(folio_page(new_rfolio, 0),
> +						folio_order(tail));
> +	folio_set_count(new_rfolio, 1);
> +	folio_page(new_rfolio, 0)->mapping = folio_page(rfolio, 0)->mapping;
> +	tail->pgmap = head->pgmap;

It seem what you're trying to do here is split a higher order driver allocted
folio (rfolio) into smaller ones right? Rather than open coding that I think it
would be benefical to create an exported helper function to do this. Pretty sure
at least DAX could also use this, as it has a need to split device folios into
smaller ones as well. That would also address my comment below.

> +}
> +
>  static const struct dev_pagemap_ops dmirror_devmem_ops = {
>  	.page_free	= dmirror_devmem_free,
>  	.migrate_to_ram	= dmirror_devmem_fault,
>  	.page_free	= dmirror_devmem_free,
> +	.folio_split	= dmirror_devmem_folio_split,
>  };
>  
>  static int dmirror_device_init(struct dmirror_device *mdevice, int id)
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 995ac8be5709..518a70d1b58a 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3655,6 +3655,11 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  						MTHP_STAT_NR_ANON, 1);
>  			}
>  
> +			if (folio_is_device_private(origin_folio) &&
> +					origin_folio->pgmap->ops->folio_split)
> +				origin_folio->pgmap->ops->folio_split(
> +					origin_folio, release);
> +
>  			/*
>  			 * Unfreeze refcount first. Additional reference from
>  			 * page cache.
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 17ea8fb27cbf..563f7e39aa79 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -573,6 +573,7 @@ void prep_compound_page(struct page *page, unsigned int order)
>  
>  	prep_compound_head(page, order);
>  }
> +EXPORT_SYMBOL_GPL(prep_compound_page);

I think this is probably too low level of a function to export, especially just
for a test.

>  static inline void set_buddy_order(struct page *page, unsigned int order)
>  {
> -- 
> 2.48.1
> 
