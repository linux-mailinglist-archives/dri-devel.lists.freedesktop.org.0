Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA5533763
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 09:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A77112214;
	Wed, 25 May 2022 07:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CA7112214;
 Wed, 25 May 2022 07:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlmEiKyxOmlgwaQGlGeOtVluJdud6WyAjPuHXUFEC26jv8n0z2u18pn6Dqa5iU26reG8wgUodVsmGzm+6a/IpBSQzTVdJPRbaII1BunkUEZOwHKP7tCQmHAkD+kTb5EA2Is8D3319qstVkNBXIGYWGcohEoiIFMoB0iL878gFPHXb6ieLLyt5MLXHvNcntPOICXTKC3AQYPuT9kjlmj1Yy+Ex0u6Y4T8v12G6sdypoVNeqCXsHEI5g60IFG5gy6Qg4HgUUmrAOhNwDniWCJUzlKuh2sNiegGpZo9FD/MltJkwKUb4JMXTtD5fo3hrlhkSpEVh1NvDMWV8DogGpY83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYHDQmuQ7udjTOU1J/nU3Iwwl5ic62llU61AS4c2Ebw=;
 b=icJpzNHSgKZYgS71jlaFzmHMp8hIsB2QbXZdrJU59j7OldI269luYtXaQI2uYLWIAteWBihDOCNPDbH/Hs9Soxnc/27Rvmm2pG5NbNYFR4miFIf/GsVPuS8ZCzm6w/8u+Em+sA3R8BgQeorJRKanch+8jFxulJkNSCTiOUXuh70EKXP4gBuM7gSYwkimmFUNjCKMe74pSdsjWyCiyEB5FhmJL2IAZEzzHi2oIdEeQ2jKSO+81Fmg/RgDrhwK/lfEOs8JklZM/ikSERlJIhsA8hAgPr6Tb304MbJmQ3z6Y9bTFPqckstFU+li678zKmMXmcZtpRmjww6F9Nb37+9yow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYHDQmuQ7udjTOU1J/nU3Iwwl5ic62llU61AS4c2Ebw=;
 b=DNsL9tGYWDHalN9r5fBXUC8eJNLdYjfoqxoT0pM3r1mgsi3ck7lzVTdQRW0XPzNXRjTqhcs/E5+2cNN3H+weOp5CLllduXQr0CBwUHxaBF57BLNGMhvZriGOfKuJ2IvwJFYlx17CQ4aIm0k7W45stJ12fmW7LvUu+3MeNn754tWgcVhoWk5Nn2XYHqa7ZeeLYabipHomtuZpeKxN0t+TcMi3DtyJZW7iPa6vkZLMeDQ76XodkbJKTg5ocsLne4VrAe1EqYSAO5cBi1TUEuF1NSYbZXr336KFaOqmE0I3uUKTD0YHXNdcOu3dSWNwtHapZDKCmzil9jX5GZEHxvl/IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB2953.namprd12.prod.outlook.com (2603:10b6:5:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Wed, 25 May
 2022 07:32:32 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b%5]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 07:32:32 +0000
References: <20220524190632.3304-1-alex.sierra@amd.com>
 <20220524190632.3304-3-alex.sierra@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Wed, 25 May 2022 14:11:40 +1000
In-reply-to: <20220524190632.3304-3-alex.sierra@amd.com>
Message-ID: <87leuqf4oj.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26fce0b1-22ef-4370-2fcd-08da3e20bab7
X-MS-TrafficTypeDiagnostic: DM6PR12MB2953:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2953855675E57EFAACCCB563DFD69@DM6PR12MB2953.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NsSvrbzrVr0GP+MF+sTwJYXkpx14Sy6CPqzBZ4KNjoWhlld4tyUscHbDxH8cbjk8+nilz57TMVqv6u+WRspCLCGD/DW2d9itMo/5rFkMPJPmixbZiePT+2jWXI5nm4wvCPdolmxeRNDixcJbaTkBwKAt3yGmGCzonEncAh2V/X8AakaXdVOhkhCe56jyWTeSZSzmWET/CU7LJ1YTugphsEHYan8JMCz0gGn6H27OMw5JM4QZo2U99QlmIcxMLtZm/YfO5QZ7XrwOSHvkq8kteK9cv9J4uMOahZzqpIxa7x6Qfz1s7PTlRIFq+w8Z08MArPrS/R3te0zigzWosLXOKH4qHe4YtYOLHaYhu/CKrY1+cfcKjNTmFXbXtPYlvsAIghURRwYAveXm/fBsn5SPMP1EmdQMF0xfcjuI5XsegHahn12uGm/nYa0pA2EqEJ9lCFTTg59mc1PQgRjU/iYpTaVCYyCosVtvHFdBQq19vWnid2z5wZGLn9dy9iYmIpX2X8GNNFVZhwCCSY7l3io/+lT0L2RZdFjNhiGBm1l4B/dk00JZ2N+wWpl7s2/LZ+s1bNHpW/AtijmBFHKU0frNeYu04Y1a2sNH1d4eNeiPj7+zGK8qDf5Y9puWtZ2/u2HGaIGqYNxBZDLK3nebdyiHTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(8676002)(7416002)(8936002)(4326008)(5660300002)(6916009)(30864003)(26005)(6506007)(6666004)(6512007)(9686003)(6486002)(508600001)(2906002)(66476007)(66946007)(66556008)(86362001)(186003)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O1+Y/V0AsE4gahB1po+oeqd/WYhm0bUyKIMkp3aHKSrUcSE9VXKOa6vwyUO9?=
 =?us-ascii?Q?CWJsKV463h4OTQAJBxkZSbkw4910uEtk7Ui4LPrPcBwJanlhu0s+lwbuygZ8?=
 =?us-ascii?Q?jdVy05EPA9z9QllnPFxbbn7zN5l5ku5ZIPyPCEbf3WONJVUsGy/efLINFXHE?=
 =?us-ascii?Q?r0u4hQIkWIyE59ohuEIE/4sisfDIJ2hnNY7JaOe/QFav8dxh0uuNxBi+YSgd?=
 =?us-ascii?Q?PdKhnyIAWCOR1uHv+bC6/qTb8CdZpeaL6gKqa3tFVVxUxMwao41NbHfpeZ8m?=
 =?us-ascii?Q?VAYSPvYUsInu9HsypnviUbir6YSlX0opwZerZxDr8oy4zgyJLzPV69ufULn+?=
 =?us-ascii?Q?hBNf7RxXCM349gHyjBMRwzes4BSr/rmLMfcIgls4jLXWk71XV6S2pGPlILp1?=
 =?us-ascii?Q?vKNtNgPjjZ2eFK98rxUTojnzAcKhU1+y687x4Ch4PwX9HbFJTgx2OWYXAe31?=
 =?us-ascii?Q?yNkqEaxDwVKVTqd67BVJpl+S8df6fsRPhza0xqYtK+KuCdiG5wUJdPRYChph?=
 =?us-ascii?Q?XcK07yPzEG0smTT636erO2ChxkXfeOXpHfLt840aVIYEhu2s0UTUGg5bZwSm?=
 =?us-ascii?Q?SssyFWxYdBecGcDXnNUae+sBMU7elRHCu7FL+aKjpT4atWxsehu+U+uAPNm5?=
 =?us-ascii?Q?UO/pAfXK1cJp1XBuNkbwz6XHuMW9lY7VlSrV9hg60ulZsTwAFFG0HLWzHLwH?=
 =?us-ascii?Q?7Z53/IdN/ltxB1Mk7lmxwj5XaMOC3Y1KWwlLk+U1TBI+uPM31zqp02YDMfQm?=
 =?us-ascii?Q?YVtbBJAag4gBhMnQVM/LXaNR9TE0qezRrOL3SJDhQTGM6OdY9OfUAC6XMuY9?=
 =?us-ascii?Q?dVq0M/6hy/aYPPJQj4euhrnSyyZGqMxq3MjSgGg8wzpeRFFZ+Qz2H/ax9OqH?=
 =?us-ascii?Q?/tdbuj2fbJW5aM+4shE95UDGzBiIHBenCBdXje7iOxeqkvftatdDJRLApaBL?=
 =?us-ascii?Q?FniVwwWp3sfk1cX6x0xrXRSgOIEpAwfQoawXbtlXMaJs9oJ/imeSi0VqEgHl?=
 =?us-ascii?Q?uT7S7GF51Vq0GcwzQWCgwJtTt65xMxuO6bmV+RajqNLkhNFLysB18n7330gh?=
 =?us-ascii?Q?6fqRufS3gJFC1y8hKiLr6WkxFHnRd0Fz9iEno0xlZc6kq/bRnoK9fkqX3ZUG?=
 =?us-ascii?Q?5wsYzuuYMZCtLIMZymQrmlFagC+bblLvw066/VdWjxB0kM6oTwxPVJ8pm17a?=
 =?us-ascii?Q?4/FneW+XMTTl8svkBrTwpZ7trraEQYqKpkG1KRuOeqo5opZyaLoojYZxFMKc?=
 =?us-ascii?Q?K3ebth6sH0hyBIQOdPrpRJlJZcG7MFNimtDtfr9Njg0XDD2OIspN46HCaJWi?=
 =?us-ascii?Q?v28ffRjpEjbUfFgx2SgId8k0vKezve4gR6CzNiYHdczzmtYCCmJ7wDwLMe1f?=
 =?us-ascii?Q?mo+F7PpeY448jlAAcpw4nxmEP4H2pz31S8KX0Jo9OaySwS6+mNEKPz8uoGuW?=
 =?us-ascii?Q?I6ITe0YAjUFL0cz3wJrbALLTGq/Q60UsaRgMQ3A/m0yErWTOcFU47HWcf1/Q?=
 =?us-ascii?Q?azLWCL4gO53gxpN2XnJ1XH5tDgowh9Rrkm8e9bxa8QBLU7044V0KgCAY/FV/?=
 =?us-ascii?Q?Vgi9KLuBgdg3rjHZXr96Q6sXUemWSKfyu5j7ZsgGOsORoZlbWwyKEvYtP5TP?=
 =?us-ascii?Q?YIp/3zLpQDGSbJYvnXfE90Vv9uU5sKj0SZZUY7MI8iZAhlcCW/yvxIAd3oo4?=
 =?us-ascii?Q?CyQyT7w9Vu2QMhDnjlDuMOjy/KRv8iEMKZpPYdkjB9IfeQQ15a6Efn2EUk1v?=
 =?us-ascii?Q?8omDzBXIaw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fce0b1-22ef-4370-2fcd-08da3e20bab7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 07:32:32.0976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xO7FdSa+C5nAZXKLVzBpSqZTQy+I9UYyBkI4M9eTs3HZVmcB4zVs382DflBBpTVrZ6WquIQ3TlN+GMiskcHOcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2953
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


Alex Sierra <alex.sierra@amd.com> writes:

> With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
> device-managed anonymous pages that are not LRU pages. Although they
> behave like normal pages for purposes of mapping in CPU page, and for
> COW. They do not support LRU lists, NUMA migration or THP.
>
> We also introduced a FOLL_LRU flag that adds the same behaviour to
> follow_page and related APIs, to allow callers to specify that they
> expect to put pages on an LRU list.

Continuing the follow up from the thread for v2:

>> This means by default GUP can return non-LRU pages. I didn't see
>> anywhere that would be a problem but I didn't check everything. Did you
>> check this or is there some other reason I've missed that makes this not
>> a problem?

> I have double checked all gup and pin_user_pages callers and none of them seem
> to have interaction with LRU APIs.

And actually if I'm understanding things correctly callers of
GUP/PUP/follow_page_pte() should already expect to get non-LRU pages
returned:

    page = vm_normal_page(vma, address, pte);
    if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
        page = NULL;
    if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
        /*
         * Only return device mapping pages in the FOLL_GET or FOLL_PIN
         * case since they are only valid while holding the pgmap
         * reference.
         */
        *pgmap = get_dev_pagemap(pte_pfn(pte), *pgmap);
        if (*pgmap)
            page = pte_page(pte);

Which I think makes FOLL_LRU confusing, because if understand correctly
even with FOLL_LRU it is still possible for follow_page_pte() to return
a non-LRU page. Could we do something like this to make it consistent:

    if ((flags & FOLL_LRU) && (page && is_zone_device_page(page) ||
        !page && pte_devmap(pte)))

Looking at callers that currently use FOLL_LRU I don't think this would
change any behaviour as they already filter out devmap through various
other means.

>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>  fs/proc/task_mmu.c | 2 +-
>  include/linux/mm.h | 3 ++-
>  mm/gup.c           | 2 ++
>  mm/huge_memory.c   | 2 +-
>  mm/khugepaged.c    | 9 ++++++---
>  mm/ksm.c           | 6 +++---
>  mm/madvise.c       | 4 ++--
>  mm/memory.c        | 9 ++++++++-
>  mm/mempolicy.c     | 2 +-
>  mm/migrate.c       | 4 ++--
>  mm/mlock.c         | 2 +-
>  mm/mprotect.c      | 2 +-
>  12 files changed, 30 insertions(+), 17 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index f46060eb91b5..5d620733f173 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1785,7 +1785,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
>  		return NULL;
>
>  	page = vm_normal_page(vma, addr, pte);
> -	if (!page)
> +	if (!page || is_zone_device_page(page))
>  		return NULL;
>
>  	if (PageReserved(page))
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 9f44254af8ce..d7f253a0c41e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -601,7 +601,7 @@ struct vm_operations_struct {
>  #endif
>  	/*
>  	 * Called by vm_normal_page() for special PTEs to find the
> -	 * page for @addr.  This is useful if the default behavior
> +	 * page for @addr. This is useful if the default behavior
>  	 * (using pte_page()) would not find the correct page.
>  	 */
>  	struct page *(*find_special_page)(struct vm_area_struct *vma,
> @@ -2929,6 +2929,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
>  #define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
>  #define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
>  #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
> +#define FOLL_LRU        0x1000  /* return only LRU (anon or page cache) */
>  #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
>  #define FOLL_COW	0x4000	/* internal GUP flag */
>  #define FOLL_ANON	0x8000	/* don't do file mappings */
> diff --git a/mm/gup.c b/mm/gup.c
> index 501bc150792c..c9cbac06bcc5 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -479,6 +479,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  	}
>
>  	page = vm_normal_page(vma, address, pte);
> +	if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
> +		page = NULL;
>  	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>  		/*
>  		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 910a138e9859..eed80696c5fd 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2856,7 +2856,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
>  		}
>
>  		/* FOLL_DUMP to ignore special (like zero) pages */
> -		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
> +		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>
>  		if (IS_ERR(page))
>  			continue;
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index a4e5eaf3eb01..8bf4126b6b9c 100644
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
> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
> +			page = NULL;
>  		/*
>  		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
>  		 * page table, but the new page will not be a subpage of hpage.
> @@ -1502,6 +1503,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>  		if (pte_none(*pte))
>  			continue;
>  		page = vm_normal_page(vma, addr, *pte);
> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
> +			goto abort;
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
