Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14DCA55A76
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 00:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4899810EA88;
	Thu,  6 Mar 2025 23:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cFi97kyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A3910E9E6;
 Thu,  6 Mar 2025 23:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3CWUj3c4n1dV9zNwi2IjQjzWW+CThQNuVoO7UE5ZPN1jDgsXSghFpQL6cjWc01oC1Wbn6PnUq2RrB4I3o0V1aLhGc/aylr6sVLtMyWqvvavxHQ9OOKDy5cQhzNn2dJN+ZknpM4lX4Dbi7rJ0GcJxDsJFKgvLC5t+eIOJkbKmzKsUg2c9+lLXA4bWCFu/xE1yIXLtpRV4PvysXJUZGCkdV+VbHPs0D3r3u/yn4LKc7g9F2P8qOWpwrv6V6B72zRkbZn/L2viJUkZC+44yErscZmRVlusNl+rbHRQhMvkCe6tS0vD1nJTIgp616LJLBjm3oj3bkuy2qDR1eCR9gk/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np5oS+T1zLJ4apS0RY1Tl+ikjSnkL3L7o1M0teU5Wzc=;
 b=LsL2z+nnghgsg5PnRmTaUMHa+IVHTyeD8V0eH2dMb/JoVFRBRixKxiNhBKzmwSvwDuxGUXIobHIPMWyNNugQ5xJ4jYVCSTc3Gx4v3ff+DD1g9Q4rUxvxfK5n5lnGjmF2oqiNkycD5xNQBtp2ZmGtlVfnqk3C83U9AgjGCxH7MD86Oz8ESOEMXiBZn9w51yEE+nm6xcqPZ7SHG5uEJgWa76YXJCRkIUiNG3IdTnughiDFNqC6LQ5j1Cq5BqcS59VX9ZHgUBe68RcfTExAtz6AOk2af8frKfs47Ps4Npf5WjWsW5SB5HuHwih2Qf8+5PEFweSDdy7qGX9wLZ59UbYqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Np5oS+T1zLJ4apS0RY1Tl+ikjSnkL3L7o1M0teU5Wzc=;
 b=cFi97kyjedp4jJJRs5bmMevjRN7BH+gAuJ/h+lnrGeuSfhapK4EVLgd51jTOMzQRYC3o2IEgfgTH5r2Jr+XxF8WQRxhJernY2GZblxA2qh42E0nGSZesKXhIH6tnePZWlFlK3D/gfBiB4isKyFTuMk1wNyJVzcAUYZOufnaKhQyGoNE8WR94AI+pUBt72zne4n8zGsQgaSc8bwLsXJYkwnGejPuEKZQg0PfbfiX19HcHY2N5cr+443r3fjjw6kf39U2bHLfpHw/ZSUmjdpAfAqaWIoB71q0w02cOTlLN0VQtF9sZJhi4Mk6FQkqnQdGz0sUjfs7JuQMrPo1myubehw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.28; Thu, 6 Mar
 2025 23:02:31 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 23:02:30 +0000
Date: Fri, 7 Mar 2025 10:02:26 +1100
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
Subject: Re: [RFC 01/11] mm/zone_device: support large zone device private
 folios
Message-ID: <7ehqxxccw5g4jgn4haaby2ichewajdearhv3h27qhhyvd6uofb@tpvz4egp7fkb>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-2-balbirs@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306044239.3874247-2-balbirs@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0127.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dd5ac6-99fc-4b75-04cc-08dd5d02f905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fT3EFWLv6hIqksogepITRAmmvLV5WVCjX0cQud+0VMts1E63FcMC6UvsB6Hk?=
 =?us-ascii?Q?9JsEbtoICwct1LMtHQpBDUcqaGC9+ivBz40G1pw7yKaf8Eyde6qpsU5oucwM?=
 =?us-ascii?Q?XMW5vEXXYGt9zw4xC8Cc/wDE6Vokxd9sUySu4Qi6cq44n+XnfrMjb1I+RBZ2?=
 =?us-ascii?Q?j3SObxIMIfE2wa09BM0ovNcwL6Hz9y2aEUPB3KgoBB0BL9rHmpPQCV0NXVZ6?=
 =?us-ascii?Q?foFkj5RmwAxpBatGjxavgfqY2i1Thjd+NRExKFWxCK6zYmj9qzKil9cFH3rV?=
 =?us-ascii?Q?U+bWoMitdYk1IPA0Arn1xuyCwZVvOFbv9FXUaumEXa/biqQZ9Toii/rNZcmN?=
 =?us-ascii?Q?8vooGPvb+jQZseXaMUvvGgR3PrSpw7QOkQzzJ2PnF2E1npUIMfbq+g2+PZFE?=
 =?us-ascii?Q?ygSb+gtt5F6ghCCax8Hu1rBtVsVZmhdzUdFQs9fmhODP9YMa/PC5r6cAB+/0?=
 =?us-ascii?Q?5QTgdq37td7mRRAnIKuiJbT0qTDk80vlE24qswk173/1+/5qEZdMP1Hp10G3?=
 =?us-ascii?Q?xYO2EMKpgDPsL55OBZs05fe+3AbLJFnKXi2rYj1QIUbUWBh2LwcJkbh7j4Vs?=
 =?us-ascii?Q?HoIp7NciGe2Sk07fEJozsNH/oLcqBSWVMV52JmjeMlLzqZz/6zHciYn+hK4f?=
 =?us-ascii?Q?HCCyPM3TTK+HhlSjuuRTWYQUz6cqJPTjSNQtFoI5MYKFJex+dzP7up/Obt+O?=
 =?us-ascii?Q?VGOsLb+gp6kEIsCWc+NJ2PY26Pi8/3ZtAL1gCbUcRL59PRlihldxM0frXGwk?=
 =?us-ascii?Q?OaexIEtOTe8hq++6EiOc60EocXpFX2qhOLIKcSoh9mWmuwWYlwpkjprbManG?=
 =?us-ascii?Q?5B2mfMpsQ/u95NexH29m8wFxkBjLR/EThp+b/HooYeFIaUoVaDRh0wBH1AHF?=
 =?us-ascii?Q?Dfi+8QntoReCvFfMeWwhBYKt6M6uJJJZCJi3i4b7n27/aTqD6faLz+JQG1UM?=
 =?us-ascii?Q?kMTaTWg2F7EO91a9CLYBLHTXYn8v6tKXTKpVVz3HgBTPzpUXwY4xxxqanSk5?=
 =?us-ascii?Q?gb5zePxZSyrcxpecd9ejBBkHBVCIKg2nmFZDFraz2ODY8u/z7eEKtL7WFkEu?=
 =?us-ascii?Q?J/+XuFUL0j8tRw47sGGNcD6+S1AJFCRY/mXAdDMwZyWSxAJVjUG/HRv3reyP?=
 =?us-ascii?Q?Ra93ksl3PRvyNJNXT5oRb6UuP8tjT5kzbaMYtdcwDzv7XYUYKxh8A0P9a2L4?=
 =?us-ascii?Q?uKc6GhD+R5ZqSff9+YMpkCSKUrbsmbbPCqLdKaBIUjXjZzuiWXpYEnUzwPeJ?=
 =?us-ascii?Q?w+FLYdK/f/o4DilQbiYtJPfKV0uPfku8pqavMbOEmCq/lCsZSGoE9tQED7wm?=
 =?us-ascii?Q?Y8PldHv519mw97JkJ4Bktz1wXTwThFPF3T8itFTp3oxlfeS22E3UO81HCE0H?=
 =?us-ascii?Q?gJ1JqrSE8UQdzPPK6Pu9YY499YWn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+MwZ87b9epKwuPa5Xz/0owKUOHoTSPnRgztdYMM2lNEKGv/I3nTr89hsxVh?=
 =?us-ascii?Q?fvph8DhqxxwOJkVTLTs6eHW7A7yfA0imwIWA73ydSDFQn2LbwcGLZRmusOb0?=
 =?us-ascii?Q?5LDVMzWHbOrBpRoAXHXbIWCVetdzqFe0kIOqCrwYOsrmj++EkxJV2Sr7uBDN?=
 =?us-ascii?Q?UAh59dN4YY2nNEn2RWUNea1uLF5ioif9tzYua1FGI0XLAjI21gvSV72Z+QlY?=
 =?us-ascii?Q?xXemKyMPEi7kfSnbANY2WE1JrP2rJIYzJFpTduKYkwYtzd9JmQP2M/waZB69?=
 =?us-ascii?Q?Pfnb6WVduWqhUm6xVugl5N9aep7hhcA6T5k2NEV5hml9HG8DEML7RHPQ4Ej9?=
 =?us-ascii?Q?93Mn2wL94sxIJpeG9hcQHfaBi05dBF6YcMfS6eOGWIldL31tesg1Wf6atKOP?=
 =?us-ascii?Q?14wnAD90zyFp/kwjOBdw6K1u9pSxR7A1QSiT/uzp2hlDoChK+TVVGESUaNcC?=
 =?us-ascii?Q?wTNoX8Waw6zcYCFImqbeaPGaF+DVZd3jgHYmx0EOZEkQN2B/jJFoqWNxzdbN?=
 =?us-ascii?Q?GoOsmk+Y2W61h0o3dChWXASsy+TJgZm/8JwG2aM03rtNnk8o6W/OvSPmt1ik?=
 =?us-ascii?Q?5/jkGuVKZ6GMloiqsYGHfLVDyJv+OMaGa7zAQADZjsL1ZlqdTJ5437/nInJ7?=
 =?us-ascii?Q?gwbB6KGcrcYX6S4hy7GayhLggAXaHEY97kBPsB16I0NTqbkf0lovNhJLYpO1?=
 =?us-ascii?Q?mcXJovIC10e5FBC8Bn26Yx8IcUdyw5bQgMGZFRTYFWmeIc7LOiFLllbSzwLN?=
 =?us-ascii?Q?+O6PIIO8xQelUNhPag9AT8cxz9i66UC2L+r7jkOpAS8R6Leumc4Ocv6KWojm?=
 =?us-ascii?Q?GDKjJVnBAE17uwhzmpHveqYfuiLvXdpeZs5eUMHzGUkB2C7mscBnMb2L2svv?=
 =?us-ascii?Q?fMQ86K10h88VrN05od/jpkm0U2dMma0tu/OAt3TKdAUyFgATbpu1fYu3HFFT?=
 =?us-ascii?Q?REJG1GQ4/RYJk1SHqfioodZQFKw+zw3Q7HyzLRCfOskTsikYYTu4Y0N5gFu2?=
 =?us-ascii?Q?SC4fWz1ScD3mdzLk2KaQlvbZwv0TW2jYMK3u9phEW8NRlQSaX6dly6AemOkh?=
 =?us-ascii?Q?Zyh52/bwkZWSy/Y7S7K0s/h9tOutzFnPXWLOFsisezRQbZ3xEzRu+oiSz/24?=
 =?us-ascii?Q?7Vwv9UxGPTLoXk+ahDcA2a2BasmpLiwcN9AE8jbtPiPzIU/mS0QPj6TJf3zd?=
 =?us-ascii?Q?lJ3lwwn+G/95o9aSJABdkE8S2zzQmR+ogSog/grUu5zTFYR+NpVkdNQ2WOjA?=
 =?us-ascii?Q?8+OAEjK4aSsCMN0ESDidsqomq1oq+btcS2XbWYxn046YhUPU/3qeNZ+2COsY?=
 =?us-ascii?Q?C8SgCemLUjIh5paHNrfw7N+6tK9hwUgYaFZKhLRvCX33eImA98gfwh7UnZoO?=
 =?us-ascii?Q?csgbMqMYalprn0DuwEilj6MAXvKz40wiMu8XbQTFNm6/pwmYAnYxAmSxehkX?=
 =?us-ascii?Q?GB9Gt2d6lKqkMRBMsHtf7zymVXz1B8a+ppz1deD4SVx2xMNwB2/TjAjMLrIW?=
 =?us-ascii?Q?UtVMko6+7ECaUChW7N14KEVCH2e5IiAnki1wCxyn5qaGipGV4uVLJQjc87TP?=
 =?us-ascii?Q?vnq3S9lvpO2HofHBv7fMRJBc4TnEQ6zJHKzOJStk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dd5ac6-99fc-4b75-04cc-08dd5d02f905
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 23:02:30.8589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lqn02k83PD0Mh/WLNHnPwFgWsVhhsaZuMtKpLDu0kUIr+ObBuGxutm7JUnYR2fWQq7JnKg6q7VAErKYeznHPog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880
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

On Thu, Mar 06, 2025 at 03:42:29PM +1100, Balbir Singh wrote:
> Add routines to support allocation of large order zone device folios
> and helper functions for zone device folios, to check if a folio is
> device private and helpers for setting zone device data.
> 
> When large folios are used, the existing page_free() callback in
> pgmap is called when the folio is freed, this is true for both
> PAGE_SIZE and higher order pages.
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/memremap.h | 22 +++++++++++++++++-
>  mm/memremap.c            | 50 +++++++++++++++++++++++++++++-----------
>  2 files changed, 58 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 4aa151914eab..11d586dd8ef1 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
>  	return is_device_private_page(&folio->page);
>  }
>  
> +static inline void *folio_zone_device_data(const struct folio *folio)
> +{
> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
> +	return folio->page.zone_device_data;
> +}
> +
> +static inline void folio_set_zone_device_data(struct folio *folio, void *data)
> +{
> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
> +	folio->page.zone_device_data = data;
> +}
> +
>  static inline bool is_pci_p2pdma_page(const struct page *page)
>  {
>  	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> @@ -199,7 +211,7 @@ static inline bool folio_is_fsdax(const struct folio *folio)
>  }
>  
>  #ifdef CONFIG_ZONE_DEVICE
> -void zone_device_page_init(struct page *page);
> +void init_zone_device_folio(struct folio *folio, unsigned int order);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> @@ -209,6 +221,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>  bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>  
>  unsigned long memremap_compat_align(void);
> +
> +static inline void zone_device_page_init(struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +
> +	init_zone_device_folio(folio, 0);
> +}
> +
>  #else
>  static inline void *devm_memremap_pages(struct device *dev,
>  		struct dev_pagemap *pgmap)
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 2aebc1b192da..7d98d0a4c0cd 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -459,20 +459,21 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  void free_zone_device_folio(struct folio *folio)
>  {
>  	struct dev_pagemap *pgmap = folio->pgmap;
> +	unsigned int nr = folio_nr_pages(folio);
> +	int i;
> +	bool anon = folio_test_anon(folio);
> +	struct page *page = folio_page(folio, 0);
>  
>  	if (WARN_ON_ONCE(!pgmap))
>  		return;
>  
>  	mem_cgroup_uncharge(folio);
>  
> -	/*
> -	 * Note: we don't expect anonymous compound pages yet. Once supported
> -	 * and we could PTE-map them similar to THP, we'd have to clear
> -	 * PG_anon_exclusive on all tail pages.
> -	 */
> -	if (folio_test_anon(folio)) {
> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> -		__ClearPageAnonExclusive(folio_page(folio, 0));
> +	WARN_ON_ONCE(folio_test_large(folio) && !anon);
> +
> +	for (i = 0; i < nr; i++) {
> +		if (anon)
> +			__ClearPageAnonExclusive(folio_page(folio, i));
>  	}
>  
>  	/*
> @@ -496,10 +497,19 @@ void free_zone_device_folio(struct folio *folio)
>  
>  	switch (pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
> +		if (folio_test_large(folio)) {
> +			folio_unqueue_deferred_split(folio);
> +
> +			percpu_ref_put_many(&folio->pgmap->ref, nr - 1);
> +		}
> +		pgmap->ops->page_free(page);

It seems to me this would be a good time to finally convert page_free() to
folio_free() and have it take a folio instead.

> +		put_dev_pagemap(pgmap);
> +		page->mapping = NULL;
> +		break;
>  	case MEMORY_DEVICE_COHERENT:
>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>  			break;
> -		pgmap->ops->page_free(folio_page(folio, 0));
> +		pgmap->ops->page_free(page);

Ditto.

>  		put_dev_pagemap(pgmap);
>  		break;
>  
> @@ -523,14 +533,28 @@ void free_zone_device_folio(struct folio *folio)
>  	}
>  }
>  
> -void zone_device_page_init(struct page *page)
> +void init_zone_device_folio(struct folio *folio, unsigned int order)

Is this supposed to deal with taking any arbitrary zone_device folio and
initialising it to the given order? If so I'd expect to see things like
clear_compound_head() to cope with initialising a previously higher order folio
to a 0-order folio.

>  {
> +	struct page *page = folio_page(folio, 0);
> +
> +	VM_BUG_ON(order > MAX_ORDER_NR_PAGES);
> +
> +	WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);
> +
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().
>  	 */
> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> -	set_page_count(page, 1);
> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> +	folio_set_count(folio, 1);
>  	lock_page(page);
> +
> +	/*
> +	 * Only PMD level migration is supported for THP migration
> +	 */
> +	if (order > 1) {
> +		prep_compound_page(page, order);
> +		folio_set_large_rmappable(folio);
> +	}
>  }
> -EXPORT_SYMBOL_GPL(zone_device_page_init);
> +EXPORT_SYMBOL_GPL(init_zone_device_folio);
> -- 
> 2.48.1
> 
