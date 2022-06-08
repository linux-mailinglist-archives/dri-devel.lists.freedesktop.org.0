Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C138F542788
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEC910E00C;
	Wed,  8 Jun 2022 07:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD1B10E10A;
 Wed,  8 Jun 2022 07:07:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGR2MGWu/Vb0gmzSpORw7gDyIW0qRSuom2W3xBYMV+9AaStL+VQIFQtHujGhWG9QGOOC3m+tCzpfHkigjLKm0RaVovDTpDhM0Y9PxZe+OEtDaMFtnAweu9tCNzRkRIy+JmPMA0POslUobOJMCe4eJUUsYpRm5PULkNY4JtRal+Iuxp08lrePgB57zmqIOEj1Zx+2EWRK7svvVWnFbMXmXgLtGSOnZjon4/N4qJlkOr7Gmuxfuy/CBvvnKdip4FmMVVp7iCp+bOWqaFskrPo3rxqQ2BvxI0Qtu9lirJJzaG3I/8UbXy33DytvoEWXQDOpME7zCI8pZWwHcpCzSlTakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JdNyq0j3Ok4dukbsNPsQWxOAkF3FVDRg7jq1vws/Is=;
 b=guu8zsjbEZw4gOI6Qxcxx0OxJfBjzzAeeZr3eYBz9yHnSpC1ijELa4KhNsZLW8Zh9h+IVcgcocXbVskzoKBf/L2usp/SQg7UqEQNhmLLB36zgFWXd19PbwdoLEiu9e3mTI1tLs3xN3bagpyiGZdw+G46eXOcFXXrWm9orDHvAqXRBhT4Fb6Kl/+ir/JFN/hnzfhK1EPaL/LbDyiZ2Q4Zh3wz3S/NRN3YOMPEMXHwQrfeEqWPhynWasPJE0cdAEDLoSZi1E1jxDL0v4JsnxyQ3ugMHuHfKQqduHCDYTaF7fuENTJ3AcI3zE9Vk3W5dTxmNsSP2HdN1w2tCE4+V38BRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JdNyq0j3Ok4dukbsNPsQWxOAkF3FVDRg7jq1vws/Is=;
 b=jWwIOSuPRALiUPIOPCwJKfkz/2o3gVCCE7CxS6pYPRLgwAqrQcMpD/WfMoh6P3b7Y6PRy4aFDYf/9wEaqeIp5wkSJLMcbYV+VfkwSsbPG5neosY8XJixaUgarRKXz2auvcDuMiBPj/ldn1hgtAmGEh4Mxjw/ZOgCPHsq5IabynpoAtK9Jnf6YiVSKuR5R8fmb1xdohYlChs79NmKwy60Sl7Gyf/xyBZ9TAU0R0IPND6MxclSpUzH5gnsW5op+aUB5QtcVUghkb4Zb0o3LxpFEksHcHlsOi+sanDMr3qnh9UxwjShjxh+9tojeUVEL6/ofMqjNmJf+GmH0kGAKbYsOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3179.namprd12.prod.outlook.com (2603:10b6:5:183::18)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.18; Wed, 8 Jun
 2022 07:07:20 +0000
Received: from DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::f2:c8b8:5343:91a3]) by DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::f2:c8b8:5343:91a3%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 07:07:20 +0000
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-3-alex.sierra@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v5 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Wed, 08 Jun 2022 17:06:28 +1000
In-reply-to: <20220531200041.24904-3-alex.sierra@amd.com>
Message-ID: <87o7z38wgr.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To DM6PR12MB3179.namprd12.prod.outlook.com
 (2603:10b6:5:183::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f256f99-9d9e-4b04-3171-08da491d8743
X-MS-TrafficTypeDiagnostic: MN0PR12MB5787:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB57877FDB90BC6E0FBDEFC25DDFA49@MN0PR12MB5787.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4FvMU9vmeLAwB6WNe4rPn8/Fn0mhoszRX4370Yt1RU9tnHWsL+Sywo/KNA5M+tyXJtTCQoWmvoJKVVq1TOof5R0F5AqXEhuM7s2kIi04ziQ3tFFkGdKEfwdbMQJ99ocVNWL1gF3aLLxZhDWQSSl/QOO7HPSy/YVMFJBRVtNt+GIklY3BwVBENjPSKRB/1CtdWF2n+v1YMV8joFBOOPUKCCkrIfNol3USoqJywN7bRjviu3epr/hnJRFoZmgn6ZynPtxSY47+iuL9gXPB0tuiN/CV64es+fdLjqLGVX+vaMPDQZ4qAodLhMwrJFHU3JjSO1U5Dx0xzUa0MdK9etK2Ego9YglIrlAXoC+Oo2368cD07SwlyS9wd2cPJFzPHrOpU5MsW6ORNfwc/vTp+Swq79dmmpBQ8oX/3j1/X/vylZo1H1qqfHWJCeBYaL15jAH9xVB75xU7hvuZ+bdwD0q6yOjH17B/EPMeEgP+L2zyW56Qz1Ud9eo/0NB0BJWGi17ZZNOvCEH+6JeqMFIBNjs9+ydvJLnyNCwOPaRnvbgI2myZej3vM0AAu0xaXsiGmpRBMsT04SAaO9uJSYM2AM18v98xIWd6t6tv1EzsENww/H9Xk8JbEdrJMdELBmzRu626w2ArZppKagJ5xnyXc4BxOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3179.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6506007)(2906002)(508600001)(5660300002)(186003)(7416002)(6486002)(8676002)(38100700002)(26005)(9686003)(6512007)(66946007)(66556008)(66476007)(4326008)(83380400001)(6916009)(8936002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/kNtRtHb7O6KxGa7qsw4VNRSuO102p72rNTCu3yfBTcw9+h9DcfweKZDzQL3?=
 =?us-ascii?Q?ceTILqzqjKbgBaZypB9CK4LVzM7EcxNqEDhC4pxlWRGNrDKS8M0rMlf12zv7?=
 =?us-ascii?Q?D/In3ihFiqDApcSULp1A0LwiNDyxWbo+jL4JXRMKHJ8F1bsC572yV4/HZIdH?=
 =?us-ascii?Q?FDmxIeywddqIWSiOEqJu/ozotjzhS6FZrEhUs3Cg1s2L+dsZirnXNh296wLv?=
 =?us-ascii?Q?ujlVStLS1keyeKdFRSv2z7OblXLsUt+VE+3pSbGkLzbEg+hmPqh3tQSw1HIQ?=
 =?us-ascii?Q?/uGRl+hrwcDmWTH/muRfZtMqAFHIk0dZwfsWW1Qtb+NvOnfWpCD7PqHhyFFB?=
 =?us-ascii?Q?c1dMPcGw7BH/YdWBADOV9mYoc2ILuh2j+bK8fnHQXMH4UsKq2QfAD7YtaZ4q?=
 =?us-ascii?Q?wl1aDsK+t00tFv726XHFt3IYHl5i5stGzjwrWs44dPGetLAfqCASHwc1G47m?=
 =?us-ascii?Q?FY+oPUi/H7IObhnQfUL8xTIk8s2imiUsfUB0jByTuV6x7lUzlZ8If+Ip4ePn?=
 =?us-ascii?Q?QkL/mtYtlzAIBVjEk0MaOt40kfadUZklTZ+HL1dTAZsvXOSiwolXsOypPCIj?=
 =?us-ascii?Q?0Hi+J64wLjxHNauIcdZ8xNTji12tPNrdVknB20Jj8nhQxYlkmptiKZ52UCik?=
 =?us-ascii?Q?O+yS/Wx3Wmk8HdGCQHEhUtcepLF0Q7nq6/1U/xF2Kayg3cvtAiOi6oRg3U/y?=
 =?us-ascii?Q?PxiWvc0FvP7GIbHKODiuLBDx5vVsjpJW42rz188gjL7aTqoFaO9OdDslOaaM?=
 =?us-ascii?Q?PKNejuVpXQGSB7cx+P8gz43ojU29Xt/qPzLmLVLk7pSkIKvuxpVKQ3bYaGFX?=
 =?us-ascii?Q?19N/UFZp55QkUXeVZn3opWcDyoxFn8C93tyWTZOifZ3X/RYkPUfacba7Gtz/?=
 =?us-ascii?Q?fTR8MqCrnR817OPyeRBvLQsOcm49vClwn3RQd7u/MTRsJyhRzghNGgVE0tmq?=
 =?us-ascii?Q?hF0nWjlfG89nA2EnkdIb0G2JXcwWZR7e6OBa+4ps/hyFWmth3xG5qTFj+y+H?=
 =?us-ascii?Q?Jq2IC/efETQPkFJq+g9lKWgWzj/PWzTg2nXo/izH41dZgzo+83USjflEQE0t?=
 =?us-ascii?Q?Ud8/N/ViZF8tWmBCM3bdmQLHeyIV2cEJBjBaPHx/FAuD788Eaj+lK0LGtn2e?=
 =?us-ascii?Q?hLG2NjC/iqz4NMXByXh5ewOECWdr0hJAaMY6mH381GJiEgEHgV5/slXkxtSW?=
 =?us-ascii?Q?LY8V1uGR1w3cGjfJkn9hR5EiqVySOxg/DjsWZzY9QeTFdP7/rzgdbWHlSX6y?=
 =?us-ascii?Q?1T9jhK1M173uAgqSvIrghWVznb3OWP4S1BR0ZquROz7qsHF2lmYq1EBFFhIx?=
 =?us-ascii?Q?1DTQSHRNmjNimbjIhoJHCsVHhgeqjZsTKV9YJbSQal/ZRkbfcZ7yDxhrdXHW?=
 =?us-ascii?Q?uN8Ywpx6l1ptPb52d8LYrwVtqMj5hEOF4+VKqJBvrGJDs473XYDOmUd+KyMh?=
 =?us-ascii?Q?Brsdv84o+FtkhmFw0i3lPVZyH3ywKr14CA8YP9VJVsSVT2QHbhKVVXjuQUOX?=
 =?us-ascii?Q?+Ev08fsJiOaMffYutNih7rBl4jwRcmOfQIRq2UkJC++H04wAjRewnaNvsP9Q?=
 =?us-ascii?Q?bvMU/kk8jCZa6WtVDZBb0PJ/96q5g27g+T/UAvFAOJsYtTX/mqpnRHVwyrNT?=
 =?us-ascii?Q?EJrkln85HsSRecfx54fmZptFlOPHAGosq5o158ypcwqug+LsD4ez0tfKJtOL?=
 =?us-ascii?Q?UCFvuEezKXHRZL7wedaScyZow0EYmqg1KcMkCLb8BCpitDqL+257qH56CIUG?=
 =?us-ascii?Q?5iBLRnKHgg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f256f99-9d9e-4b04-3171-08da491d8743
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 07:07:20.1834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRTJVSGX3lLy6nTLXJoSgxFPAADDnljciJXyF8GdGdHfevZwITTDoFfhd5iSzs/450okQPgbnRWR6mY7rP/nRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787
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


I can't see any issues with this now so:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

Alex Sierra <alex.sierra@amd.com> writes:

> With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
> device-managed anonymous pages that are not LRU pages. Although they
> behave like normal pages for purposes of mapping in CPU page, and for
> COW. They do not support LRU lists, NUMA migration or THP.
>
> We also introduced a FOLL_LRU flag that adds the same behaviour to
> follow_page and related APIs, to allow callers to specify that they
> expect to put pages on an LRU list.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>  fs/proc/task_mmu.c | 2 +-
>  include/linux/mm.h | 3 ++-
>  mm/gup.c           | 6 +++++-
>  mm/huge_memory.c   | 2 +-
>  mm/khugepaged.c    | 9 ++++++---
>  mm/ksm.c           | 6 +++---
>  mm/madvise.c       | 4 ++--
>  mm/memory.c        | 9 ++++++++-
>  mm/mempolicy.c     | 2 +-
>  mm/migrate.c       | 4 ++--
>  mm/mlock.c         | 2 +-
>  mm/mprotect.c      | 2 +-
>  12 files changed, 33 insertions(+), 18 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 2d04e3470d4c..2dd8c8a66924 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1792,7 +1792,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
>  		return NULL;
>
>  	page = vm_normal_page(vma, addr, pte);
> -	if (!page)
> +	if (!page || is_zone_device_page(page))
>  		return NULL;
>
>  	if (PageReserved(page))
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bc8f326be0ce..d3f43908ff8d 100644
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
> @@ -2934,6 +2934,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
>  #define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
>  #define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
>  #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
> +#define FOLL_LRU        0x1000  /* return only LRU (anon or page cache) */
>  #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
>  #define FOLL_COW	0x4000	/* internal GUP flag */
>  #define FOLL_ANON	0x8000	/* don't do file mappings */
> diff --git a/mm/gup.c b/mm/gup.c
> index 551264407624..48b45bcc8501 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -532,7 +532,11 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  	}
>
>  	page = vm_normal_page(vma, address, pte);
> -	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
> +	if ((flags & FOLL_LRU) && ((page && is_zone_device_page(page)) ||
> +	    (!page && pte_devmap(pte)))) {
> +		page = ERR_PTR(-EEXIST);
> +		goto out;
> +	} else if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>  		/*
>  		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
>  		 * case since they are only valid while holding the pgmap
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index a77c78a2b6b5..48182c8fe151 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2906,7 +2906,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
>  		}
>
>  		/* FOLL_DUMP to ignore special (like zero) pages */
> -		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
> +		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>
>  		if (IS_ERR(page))
>  			continue;
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 16be62d493cd..671ac7800e53 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -618,7 +618,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  			goto out;
>  		}
>  		page = vm_normal_page(vma, address, pteval);
> -		if (unlikely(!page)) {
> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>  			result = SCAN_PAGE_NULL;
>  			goto out;
>  		}
> @@ -1267,7 +1267,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
>  			writable = true;
>
>  		page = vm_normal_page(vma, _address, pteval);
> -		if (unlikely(!page)) {
> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>  			result = SCAN_PAGE_NULL;
>  			goto out_unmap;
>  		}
> @@ -1479,7 +1479,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>  			goto abort;
>
>  		page = vm_normal_page(vma, addr, *pte);
> -
> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
> +			page = NULL;
>  		/*
>  		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
>  		 * page table, but the new page will not be a subpage of hpage.
> @@ -1497,6 +1498,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>  		if (pte_none(*pte))
>  			continue;
>  		page = vm_normal_page(vma, addr, *pte);
> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
> +			goto abort;
>  		page_remove_rmap(page, vma, false);
>  	}
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 54f78c9eecae..400790128102 100644
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
> @@ -2307,7 +2307,7 @@ static struct rmap_item *scan_get_next_rmap_item(struct page **page)
>  		while (ksm_scan.address < vma->vm_end) {
>  			if (ksm_test_exit(mm))
>  				break;
> -			*page = follow_page(vma, ksm_scan.address, FOLL_GET);
> +			*page = follow_page(vma, ksm_scan.address, FOLL_GET | FOLL_LRU);
>  			if (IS_ERR_OR_NULL(*page)) {
>  				ksm_scan.address += PAGE_SIZE;
>  				cond_resched();
> diff --git a/mm/madvise.c b/mm/madvise.c
> index d7b4f2602949..e5637181de1b 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -421,7 +421,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  			continue;
>
>  		page = vm_normal_page(vma, addr, ptent);
> -		if (!page)
> +		if (!page || is_zone_device_page(page))
>  			continue;
>
>  		/*
> @@ -639,7 +639,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  		}
>
>  		page = vm_normal_page(vma, addr, ptent);
> -		if (!page)
> +		if (!page || is_zone_device_page(page))
>  			continue;
>
>  		/*
> diff --git a/mm/memory.c b/mm/memory.c
> index 21dadf03f089..30ecbc715e60 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -624,6 +624,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
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
> @@ -4685,7 +4692,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
>  	pte = pte_modify(old_pte, vma->vm_page_prot);
>
>  	page = vm_normal_page(vma, vmf->address, pte);
> -	if (!page)
> +	if (!page || is_zone_device_page(page))
>  		goto out_map;
>
>  	/* TODO: handle PTE-mapped THP */
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index d39b01fd52fe..abc26890fc95 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -523,7 +523,7 @@ static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		if (!pte_present(*pte))
>  			continue;
>  		page = vm_normal_page(vma, addr, *pte);
> -		if (!page)
> +		if (!page || is_zone_device_page(page))
>  			continue;
>  		/*
>  		 * vm_normal_page() filters out zero pages, but there might
> diff --git a/mm/migrate.c b/mm/migrate.c
> index e51588e95f57..f7d1b8312631 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1612,7 +1612,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
>  		goto out;
>
>  	/* FOLL_DUMP to ignore special (like zero) pages */
> -	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
> +	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>
>  	err = PTR_ERR(page);
>  	if (IS_ERR(page))
> @@ -1803,7 +1803,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
>  			goto set_status;
>
>  		/* FOLL_DUMP to ignore special (like zero) pages */
> -		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
> +		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
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
> index ba5592655ee3..e034aae2a98b 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -95,7 +95,7 @@ static unsigned long change_pte_range(struct mmu_gather *tlb,
>  					continue;
>
>  				page = vm_normal_page(vma, addr, oldpte);
> -				if (!page || PageKsm(page))
> +				if (!page || is_zone_device_page(page) || PageKsm(page))
>  					continue;
>
>  				/* Also skip shared copy-on-write pages */
