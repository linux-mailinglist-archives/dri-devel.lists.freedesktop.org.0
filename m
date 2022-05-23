Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B63530EB1
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 14:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FA510F4C0;
	Mon, 23 May 2022 12:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940BF10F4C0;
 Mon, 23 May 2022 12:38:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/AfIUwb9yWc2v8wXts6w0ZNriJRxloJZEzZbsCh5T3NHxGSKUtsVMAthQWU2yt724SWrbtpo6Ml7R7ZYlpMaRWZ5kNQ6oAEhqCCoKn2/vH1Ax7Bxp+5oy4FN4uZf8HEKaFS5o9hn3aKB+ffXJ46cTKFzUmf10WpFbNU1a0LPPi6glKzBuZ2OjXUdlYo/DAf5aiI4T9qYDIER6z6uI93RTQOKx4lr6cN4ylsPLFvGwBI/rMmrVktrHIaVni8GLz8QmVQg36ApCohpGTi8bZFbwOrBusPM4FJEMAA0qn+1hRtM0eI6eucGLfrVlkb/fk+L4AwocMY2r+JsfxD8HJrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRJ/T0WcP6GVpQOqSzojy4Sjm3+H8NZJJdQRYlE3/n8=;
 b=BRE3DzJG5YBQaDBtJWTtjzuMh8GhBRtzVRyfkM3cD5hzsDIqddQEMYKuiyBW1o3TBKqHI9LbaGVk0kvfncMA+vCCz9UQST24wMGHH4GdBY8hAXTt7DFvsAKCylO9nsZEybwlFtSPdyN1tjQcfPNmmQMcK4wYZyA88I3/SbV/fKzH1o9yOE4P66BqnG8koeCMZf2EupIelX0sIKgiZ/07VJkJNkFOKN0SAFYLelwBNtHhUvgWS5b+oomvTNzI+VxWRkmVXKkrxeXXOHsKg4kR5nc8GMx2nlwD2H5FN2+zRCdyRTIVzXFb0dSl31fufxC6vxvaUR1VyZOjSMhqjYi5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRJ/T0WcP6GVpQOqSzojy4Sjm3+H8NZJJdQRYlE3/n8=;
 b=k6Nt4IcpI9lfQb0VlVuQXOPBpwHq3y1mE+Uwf3gVEMR7pDQXyASZG1p+zkLymmsyFQZR/jFIB7SMPsWmc68BZKjgDY4Te6QzV+UMIlLHBv8XdxJ78pHiZbXVdk1j4FQ8KobFIx272kPmtBckUGqis/Wf2WsW+KNgCO+qVxZujdoGc1BoVYjg4Cd9ruuO78Xunp4SJb9HAu98+3JZ6aPfvS0K0Ium6BT/8WZB6nmZqhEHCeOPWjF31ztl9eDDkqI/TqziAjhTuHE41W2JtKs9dlQke6sP0KqoAd/H3NsUoeV5rRvicxJAfLZk/NyM6jITG0mAQB6clqSVRJxfVGAefw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM5PR12MB1322.namprd12.prod.outlook.com (2603:10b6:3:70::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 12:38:07 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 12:38:06 +0000
References: <20220516231432.20200-1-alex.sierra@amd.com>
 <20220516231432.20200-12-alex.sierra@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v2 11/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Mon, 23 May 2022 22:02:35 +1000
In-reply-to: <20220516231432.20200-12-alex.sierra@amd.com>
Message-ID: <87wnech1as.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0cc4191-8446-4011-4782-08da3cb9163a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1322:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1322B47C685CAF0E1FDD8EABDFD49@DM5PR12MB1322.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+4GgxPFLCipUXlw/vN3NKTzHEePGrIz2my4r8GOXYngC7ICV1eGBuQyhaCIfuPagJ354ZvyopJHma9a8PMt4lRKfisXZrKaeyNn04bMtd/l23rxiKSRDEDrqoQRtBayFAihOrjlwdMuLa6UWRMaly38pc4TdDMcYAdcqO3aLKHTfD4gGYKTlgQNkKg0yoFSBFm8OGLDncmVCqGVcfxiayszyZyyjzn5Fm25TEW7yZvrv5i/9knjtmBvUV/NP1kaiLpA9ij+OFASf65dZiE+6hOVXz5Oi3qL8CK2rzluFvtQpfigYTyB8e1uJfwlptIPG1Zb7MVL4jHC/jRgiMPMeAHvVyyom6ndSuuB6tVxh8Z7xWv/iFlk6jftxqPLHaUvokPpOX1E0hzQ2nJFEGQRneMdIMYGGl5/jksiWB47JfLstsaygEScuhR6fS2EWn373fYoD8Vk+aT9odTxmyjo1CYyz2vJgi0W80UtMS2zfkdsHglIy2spy/XojGNK+mriYwG/hJQtmUcxjpYF37vAHFIqx79J37ACrPLmn25qmuZBJP6hVGJ05tnJJaGlqXiDovVfBXNxiljvVNG9V2KJElQTEn3hx/tNGHBgFeIAFkgc7tvZUZuZEoILvkek83/YF/uctpX7cxD4qgwKeLCQxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(316002)(4326008)(83380400001)(6916009)(8936002)(66556008)(7416002)(2906002)(26005)(508600001)(5660300002)(8676002)(66476007)(66946007)(186003)(6506007)(6512007)(6666004)(86362001)(9686003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zNzvfxn0DYY40IKAsHUe/XDAKG6jWMKMe5l2a6IKG0qiJ028xY1hu3QEfCuL?=
 =?us-ascii?Q?mb3wLI7I7ZA91mChvUcPpAKaPHN0BpHTNAyyHjfmO5ipUF07p3ZPwK7cC6jV?=
 =?us-ascii?Q?RJCSsdBhJmdgmZ7ESfMW3dbcQpxd1dkrfY2Mbb5zHxaQBvYuJ8G3oRJLpDSI?=
 =?us-ascii?Q?FVjsbeEzi2BZRFkly/2QUcZEAFvWytS54jhsC478JAAkHtzcicDi33qOCTiQ?=
 =?us-ascii?Q?5bigzQM6AAHDVtkb13Zbclp7VN4xPVdNpun77uJgs1V091mezDp9hHGljw3S?=
 =?us-ascii?Q?4Jnw4B4sgvHCuQ1IPD2M72/OauwuFij7nRLAVtLV+e9yGpCwtfSe8Cf7bWpj?=
 =?us-ascii?Q?MiRuxCY9Idp/e6QbivF1Vo+Qebu9TfSPMuEfS1AQQa9QWLxkYekJ3n3XkmNj?=
 =?us-ascii?Q?dKxeX6MuArOyZ+oyXRQ7RFhtg5IZoHtw+B9O4QWnzSmE00f17e7Re3ZsMlBh?=
 =?us-ascii?Q?9B94Nnpcj34rAMqS2lNkA45eiaNgL6nU2Ptu1P4KzgG0YW6JOm/OoUuOdevq?=
 =?us-ascii?Q?xCzg47GbpJv5HIkYYzQC5U9mpeY3BaXRkDs3KYG1BDP48obX80mrGVTSrKYp?=
 =?us-ascii?Q?XaN7fDI6OVu65yBH4ipg918kutnlQVI4N3hNwH0/XMvh/FdJi3DVAB3F8pRU?=
 =?us-ascii?Q?SqRWsK58GWuOhPRcXGQfLYsYxs5/B/6FhDzMblRbFk9bu4KgZHbYodHQVLn9?=
 =?us-ascii?Q?Vb2Abm9TkJ1K/8ENiymVVBhYYLBhr50aHA383gZoT9pEvmIoXJvr0+oaVIJv?=
 =?us-ascii?Q?MsHJreZ5JxKqV8lo4ohaKq7Afx9JQltiIjP4d5JpL4J3uZrhGFeGF7fX5C0a?=
 =?us-ascii?Q?UzZbXM/QAzVarfkJGQvGsj3+4zMqW/ykDSlonimylmXf8CAqSAr5FznRCqDb?=
 =?us-ascii?Q?8ZHFd0NDjHKCFYxNpFHYq125wXtuoCQNfi1FudSCVmJx9EBkiyfuV8K2n+kO?=
 =?us-ascii?Q?RdyJL0+cC5kKYR43Yqk52iurVuBYOL61aIr5uKGtONc5b7kbmaDyNK5dNss0?=
 =?us-ascii?Q?wN5IEzBhQIT5utCijhEFmL4cUn67FjCJcSGC5uwBEyu0FMxw91CAzQFlweh2?=
 =?us-ascii?Q?XOvco1ix/O7ImZBFJIpZPk+FboBj8VPlmohg/VPfUDzwosVkA1AIKtzUulUT?=
 =?us-ascii?Q?wC9AHznMEW3ka/ZdmTElCBH5Z5MtLJibcA9jRVrixunk0Yy53mTk0OKE3zXW?=
 =?us-ascii?Q?WCTupogKYkI1JJqVE3sgPfyx0xRRzSXAe7zIbzHEuBiGEsp90BiCNAhdtUhn?=
 =?us-ascii?Q?PBph+Ok8gBIKkNHGY/eVf6ws26wluXRESS3Ue99Q9Uq2B6YlkyEarjiLsGUF?=
 =?us-ascii?Q?Jc1c2CGXrcmvJE/hjA8vDGuRCCoSzl7z3/Hnf5USrH0nmcxyNtBcK1YQyEGL?=
 =?us-ascii?Q?71YT/YcargfFZkxvnI6vtXX3epa1be8YoIzSedYSbUVHmOVq04ZeVGcAFtiU?=
 =?us-ascii?Q?qSLd2i7BZFp+QjU2SuxuVlqWGssq3/aKRPXY3IiC4djkuDtQCtAUKm4ncxS3?=
 =?us-ascii?Q?ieCcrf0GjizEobiM3/zTjdyE7Ua+JZpJR3lky2Q7Y9SM2yfRsEUM34m50lpa?=
 =?us-ascii?Q?kYjc5RQJ1oqKvQnzRbH632bqoWL7dIpIJqkmFPRNZbOK8RaHwTnCJSs4jDVo?=
 =?us-ascii?Q?5wUoiVnjjuEmpT5yNAyC5CGI+vIifqrzCWG5WqOfQ15pt0h7YXnE7IhePvE1?=
 =?us-ascii?Q?xHuquV37cD2Kxhuh1eCmHXijDkSSOd9wXzPeneHkZyRAbCbEORPtl/OLitZk?=
 =?us-ascii?Q?4hf7hW54hA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cc4191-8446-4011-4782-08da3cb9163a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 12:38:06.8068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwO4Dh0LNNhBZ53lut6CR4HaY45b2JQt1cMMKtRinaMpZiXhsuyCJGIjQFTTpBQLvnl2UwS+G5nZhVxl67O7nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1322
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Technically I think this patch should be earlier in the series. As I
understand it patch 1 allows DEVICE_COHERENT pages to be inserted in the
page tables and therefore makes it possible for page table walkers to
see non-LRU pages.

Some more comments below:

Alex Sierra <alex.sierra@amd.com> writes:

> With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
> device-managed anonymous pages that are not LRU pages. Although they
> behave like normal pages for purposes of mapping in CPU page, and for
> COW. They do not support LRU lists, NUMA migration or THP.
>
> We also introduced a FOLL_LRU flag that adds the same behaviour to
> follow_page and related APIs, to allow callers to specify that they
> expect to put pages on an LRU list.

This means by default GUP can return non-LRU pages. I didn't see
anywhere that would be a problem but I didn't check everything. Did you
check this or is there some other reason I've missed that makes this not
a problem?

[...]

> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index a4e5eaf3eb01..eb3cfd679800 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -627,7 +627,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  			goto out;
>  		}
>  		page = vm_normal_page(vma, address, pteval);
> -		if (unlikely(!page)) {
> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>  			result = SCAN_PAGE_NULL;
>  			goto out;
>  		}
> @@ -1276,7 +1276,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
>  			writable = true;
>
>  		page = vm_normal_page(vma, _address, pteval);
> -		if (unlikely(!page)) {
> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>  			result = SCAN_PAGE_NULL;
>  			goto out_unmap;
>  		}
> @@ -1484,7 +1484,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>  			goto abort;
>
>  		page = vm_normal_page(vma, addr, *pte);
> -
> +		if (page && is_zone_device_page(page))
> +			page = NULL;
>  		/*
>  		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
>  		 * page table, but the new page will not be a subpage of hpage.
> @@ -1502,6 +1503,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>  		if (pte_none(*pte))
>  			continue;
>  		page = vm_normal_page(vma, addr, *pte);
> +		if (page && is_zone_device_page(page))
> +			goto abort;

Are either of these two cases actually possible? DEVICE_COHERENT doesn't
currently support THP, so if I'm understanding correctly we couldn't
have a pte mapped DEVICE_COHERENT THP right? Assuming that's the case I
think WARN_ON_ONCE() would be better.

Otherwise I think everything else looks reasonable.

>  		page_remove_rmap(page, vma, false);
>  	}
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 063a48eeb5ee..f16056efca21 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -474,7 +474,7 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr)
>  	do {
>  		cond_resched();
>  		page = follow_page(vma, addr,
> -				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE);
> +				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE | FOLL_LRU);
>  		if (IS_ERR_OR_NULL(page))
>  			break;
>  		if (PageKsm(page))
> @@ -559,7 +559,7 @@ static struct page *get_mergeable_page(struct rmap_item *rmap_item)
>  	if (!vma)
>  		goto out;
>
> -	page = follow_page(vma, addr, FOLL_GET);
> +	page = follow_page(vma, addr, FOLL_GET | FOLL_LRU);
>  	if (IS_ERR_OR_NULL(page))
>  		goto out;
>  	if (PageAnon(page)) {
> @@ -2288,7 +2288,7 @@ static struct rmap_item *scan_get_next_rmap_item(struct page **page)
>  		while (ksm_scan.address < vma->vm_end) {
>  			if (ksm_test_exit(mm))
>  				break;
> -			*page = follow_page(vma, ksm_scan.address, FOLL_GET);
> +			*page = follow_page(vma, ksm_scan.address, FOLL_GET | FOLL_LRU);
>  			if (IS_ERR_OR_NULL(*page)) {
>  				ksm_scan.address += PAGE_SIZE;
>  				cond_resched();
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 1873616a37d2..e9c24c834e98 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -413,7 +413,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  			continue;
>
>  		page = vm_normal_page(vma, addr, ptent);
> -		if (!page)
> +		if (!page || is_zone_device_page(page))
>  			continue;
>
>  		/*
> @@ -628,7 +628,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  		}
>
>  		page = vm_normal_page(vma, addr, ptent);
> -		if (!page)
> +		if (!page || is_zone_device_page(page))
>  			continue;
>
>  		/*
> diff --git a/mm/memory.c b/mm/memory.c
> index 76e3af9639d9..571a26805ee1 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -621,6 +621,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>  		if (is_zero_pfn(pfn))
>  			return NULL;
>  		if (pte_devmap(pte))
> +/*
> + * NOTE: New uers of ZONE_DEVICE will not set pte_devmap() and will have
> + * refcounts incremented on their struct pages when they are inserted into
> + * PTEs, thus they are safe to return here. Legacy ZONE_DEVICE pages that set
> + * pte_devmap() do not have refcounts. Example of legacy ZONE_DEVICE is
> + * MEMORY_DEVICE_FS_DAX type in pmem or virtio_fs drivers.
> + */
>  			return NULL;
>
>  		print_bad_pte(vma, addr, pte, NULL);
> @@ -4422,7 +4429,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
>  	pte = pte_modify(old_pte, vma->vm_page_prot);
>
>  	page = vm_normal_page(vma, vmf->address, pte);
> -	if (!page)
> +	if (!page || is_zone_device_page(page))
>  		goto out_map;
>
>  	/* TODO: handle PTE-mapped THP */
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 8c74107a2b15..e32edbecb0cd 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -528,7 +528,7 @@ static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		if (!pte_present(*pte))
>  			continue;
>  		page = vm_normal_page(vma, addr, *pte);
> -		if (!page)
> +		if (!page || is_zone_device_page(page))
>  			continue;
>  		/*
>  		 * vm_normal_page() filters out zero pages, but there might
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 6c31ee1e1c9b..c5d50e96ecd7 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1611,7 +1611,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
>  		goto out;
>
>  	/* FOLL_DUMP to ignore special (like zero) pages */
> -	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
> +	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>
>  	err = PTR_ERR(page);
>  	if (IS_ERR(page))
> @@ -1802,7 +1802,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
>  			goto set_status;
>
>  		/* FOLL_DUMP to ignore special (like zero) pages */
> -		page = follow_page(vma, addr, FOLL_DUMP);
> +		page = follow_page(vma, addr, FOLL_DUMP | FOLL_LRU);
>
>  		err = PTR_ERR(page);
>  		if (IS_ERR(page))
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 716caf851043..b14e929084cc 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -333,7 +333,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>  		if (!pte_present(*pte))
>  			continue;
>  		page = vm_normal_page(vma, addr, *pte);
> -		if (!page)
> +		if (!page || is_zone_device_page(page))
>  			continue;
>  		if (PageTransCompound(page))
>  			continue;
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index b69ce7a7b2b7..a6f3587ea29a 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -91,7 +91,7 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>  					continue;
>
>  				page = vm_normal_page(vma, addr, oldpte);
> -				if (!page || PageKsm(page))
> +				if (!page || is_zone_device_page(page) || PageKsm(page))
>  					continue;
>
>  				/* Also skip shared copy-on-write pages */
