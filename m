Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30D758B3E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 04:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD30F10E0C8;
	Wed, 19 Jul 2023 02:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F04110E3F8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 02:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB0QwBPjFBwr23JtmqpgdyCM6PToV06l2Qv28nGRtzXCQuLuLCUmbnxWh0GStWdxV+Bo09lggkAz55rbpeXbh7R/rTUxXwiDPRWJE3h5n+nx3kbWwIqyZbL+B9TwGkUSJ2D35rLZ79mM912POKeJefxWA7BNiwKHsCdxu1mOR8weSQ0yT0hOrQXsPaaEOc8vFOsrroyEImFamyglMJ0lf7mn4aULGEC64r/7JmIgzaCKLTMOJy8zv8BF6Xex2SLjIjplFg9sAYyv/SNZI3ZiajEWLyM09HUDYKzvdJ0XANOh13VlhuyB5cD4lVGQdcxDG8tpNpjdh+g1EOexAVQL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcfkrh3V45XeZetbhyXX85uRXsE3/idF7RAh9LdaU3Y=;
 b=TwcBXdauafrO08o91YLWP7TY9bVBHgcSfgQWc/tD2RLlWhtXspi1e+cr1K4nERKsspQvLsX0j1+Wku64fnbaxdXpG8k14ZwClXF5WaTGGo23Jsl4gHNcXOefFptD8itHceliJ3tSz5MiIDQJEWHr3FvBPhh/uLfRMTPGhM/cLnp++3XHYIGu1nqixYaTMfcaADoTaFBilk0DsK3YXE4umArJYm1dbtwpwrEce3tZJTq9AhXlY48wW4xRq8BuUJ/guplqUjfIeYklOiUjkH05yo+pEf/kkxjUx96UaJsFT67Slj84py+/hdB/ECrJ/TjcH2Ch6AbxCjTGXtfwcMV6Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcfkrh3V45XeZetbhyXX85uRXsE3/idF7RAh9LdaU3Y=;
 b=pjaRx69yXeY0Mgjy4WeCwQZ4YXWGHvVKcsY09V3fLYb1Wev4h2pmvt0HBhuMDb8MT35BT2CJI5qFs0m7TSNTzridnMPKDCSUcmQu9fO8CMEIIP5GNK57DCW/x9GJaAJ9lfUC/SzWS1W8gpeTi3jR37hmba2QqetRZnuw/1/xmWklEJOUnCJ4TGoIbHv+ZBDRHcR13n74yRLUPoeJPojEQJKjLt2XcVSw+ap6YCs68baOYVTAK14wCm+Eq51+z6kTZqF0XP7+Fe6O0jeE743wtBlTRA4X3PIWdgLyYUsyMQ9y0238zk5Sc82MsQyhxo+UoOkajPSuXa7FjjLzxVxbMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by LV8PR12MB9420.namprd12.prod.outlook.com (2603:10b6:408:200::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 02:14:43 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 02:14:41 +0000
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Date: Wed, 19 Jul 2023 12:08:53 +1000
In-reply-to: <20230718082858.1570809-2-vivek.kasireddy@intel.com>
Message-ID: <87jzuwlkae.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY2PR01CA0015.ausprd01.prod.outlook.com
 (2603:10c6:1:14::27) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|LV8PR12MB9420:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ebdee7-581a-4ca3-4e8b-08db87fde860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TU0XV3t0IX9ib6MBbz1OOF8q2rH/P16ly4Omi6MWgTaM2nIEsAOI5hHezcP8w2HA42cPezBfjSKGuGZq5wqy7yV1op5EjTvZnjznKHvNRCQLpSMadwrgDmFFrIRDuXf9R3z2E0F0A6SZ+DrDjkNFQ0qm9pkPRcLN7nbxUdX1j1Frg4uSDlSqD5SQMN2kb9iNM+BOj1MK1PUtQAC1yAp/6F1WeElIImPjF7BSDbKSdJIKHLQT7/D3FobvlTNFEbgFv+yLpWa0LzSzZpWUy/iU8mmlRE89M8RZ/vxzKyrB7bA8AT78itXW1ne7rFNKAm/2Za4ZqY1gbqFMBYdti51/UqEqPgSij37QgzrrJ25Z1BJK1pZZI99SaZTTQMpOKpx1qCuFngSTm9YYV5jsnB+AVCAMNClEPA6mXYbNwCYcF2fSnUlHXIKsln7tlh2FYl/HLIQYqN4O1gbsJwrc408C415V6cHDmo9JbYaYP6XCTReDF945KaSjFQ/z5zCrwJsTzK90BCDM81aqMNj5HgO2Y7BKw7SGxF8ebs3AxhZzOl3c2/XRk14dgsYTbFCq6RPE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(38100700002)(6666004)(54906003)(6486002)(478600001)(6506007)(83380400001)(86362001)(15650500001)(2906002)(26005)(186003)(6512007)(9686003)(316002)(6916009)(66556008)(66476007)(41300700001)(4326008)(8936002)(8676002)(5660300002)(7416002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sS+heCsgalhaZev/K+Hv2nvV4PbSyE5zuoJl6yEU65ToEekKjhEE7FviuUpb?=
 =?us-ascii?Q?1MNnck638lteTDmzWnUhCY32vIl3B7avxCSRus+vr7OEL4GvElccmsoNl3n4?=
 =?us-ascii?Q?ZqfDG2Fvh0/exS9OKcgUnbwlKD9DraWCr3SiePdkMt7JLrDBi+tynEZOPVGp?=
 =?us-ascii?Q?OTm8KusFxWA7L5zUhch1ZzJdJqnOXJM1sUrtd5epi9Os0HiVhwz2cTBeyXjs?=
 =?us-ascii?Q?dw39j2mVWcWNZgVPO3AbPP7uYJBX8+7QcdGdrwViI34qryrxJE1GN1BYU7+l?=
 =?us-ascii?Q?gfzTKAWTPRqMM3dGWy/fi6KwbfA8nQo+sMQ8fN3J7gLcinjs/7B12qKwzsGB?=
 =?us-ascii?Q?cW6isFzMrSN1+kzveBY48l9VdiEqJk8mlvVseD+DyOBzyE2DKq4IjOlXm/xI?=
 =?us-ascii?Q?w4dhoKqk+IkxNCPareo71vUwf5nLg4fi+cF5dF7D0qBXo9LYxg6wostnn59s?=
 =?us-ascii?Q?oC/XAtTC/tdM52C8w1mAHD3K0uboaobxVNIpgeAzQDQbtbiLCuq4fMD8S05A?=
 =?us-ascii?Q?e4JUS0Ou0TNX5eWah4ILzu/2SnY0N/cdTqtjacsWNuEfnG0UrJyy7lcvQW7v?=
 =?us-ascii?Q?z/Yvjc9Nu8JQU+NttgEUUU57o4KrhVxpfBjWpbhlh0bEEKHEfx8mh4qAY/cH?=
 =?us-ascii?Q?SbPXIlzTacLMNyKPtKV8RT4/3kTZUeMcboyavXxaibTMdNm5+FSNr17hrcHi?=
 =?us-ascii?Q?wip/RTNpc5NH/cL3KEIUKtprYNmo1E0ERqRkD7xbc81wRELvnguzlm9gZss3?=
 =?us-ascii?Q?lPAt/5oWssIshpu2hZ7aAxgJIvf55AG3BPmvHjjZd4vAkaaK+K9azy73G/DZ?=
 =?us-ascii?Q?nKmkXmc/lnrlZf+8Z0qzuvuL2WxWR/2f+9g8XszIiJj1C+WDClNppNrgoYUl?=
 =?us-ascii?Q?5yxkiYcrw7qBj7GPmk5VCFR0v/0oHoTFnGZ4SEoXJ6tjS6kKh0Nbi+Ts+y1D?=
 =?us-ascii?Q?FXm0DUOducMFuzcHGxXHF7avz0nwJmpEMHQPgUQYoUzjV9XRVm0s/kTgpny7?=
 =?us-ascii?Q?cc2Y+z0boQl0POhYG/8im2RXkaIsZlTWEQVgnGOnlox/LsDsr35aiju70p8w?=
 =?us-ascii?Q?n4NUhX7XoGKnlkYeZsyKIdhDOha2KGQcxthaHmoDlWj4OEneg5tKNwwrNqes?=
 =?us-ascii?Q?ws/RVNsmvB0z4eJwshtmtHcyALjf57NfESrb1q0EFWxi8upMbcXM5rSNs9Fw?=
 =?us-ascii?Q?bA/f5iH20J78Bl7xsp6pPv6uuh/QzRSBDjBjeMwnQLie51Ga+jshxDx/6mdO?=
 =?us-ascii?Q?0Mjz1mr0OsAVa2Ru2v4cIYhH17u1SqUBnRX4E2jIP5J+yBH4qTNOTn0rcFXu?=
 =?us-ascii?Q?9tL5mL5mXmclfeA15zH7K8gbpQIY89SoS6BkF7B+d/6Ja5NI+176zKipohve?=
 =?us-ascii?Q?fhL5jez8+rg5jPBzeT8XKnBwBB8H83wDjkBMVxGyr4TKTKlVUUdB7SUYuPG6?=
 =?us-ascii?Q?RzHwF6DqamJMeTJI9pHk3mm480TRL/MtFZNTDbud9OBLSn0FUmnkFaZDdsHZ?=
 =?us-ascii?Q?m/xXpFJQDOtoIG+X5Nj+NEWmVl+QN3Ln4UbtQTHk1oSo2M/s13yF432SpRmU?=
 =?us-ascii?Q?8IDNZxqNVPQDUpXt9kdWl3+U2JDFJzs+x4wrlijo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ebdee7-581a-4ca3-4e8b-08db87fde860
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 02:14:40.0962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mnv/58OEK5hZKi5rdaHV1Oz6nTqA2HrndWp7TXas0puf2sDDYBPnrNep0ziZ0NpvH5i1I/vEkgcPdNml8vLvPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9420
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Vivek Kasireddy <vivek.kasireddy@intel.com> writes:

> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 64a3239b6407..1f2f0209101a 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6096,8 +6096,12 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  		 * hugetlb_no_page will drop vma lock and hugetlb fault
>  		 * mutex internally, which make us return immediately.
>  		 */
> -		return hugetlb_no_page(mm, vma, mapping, idx, address, ptep,
> +		ret = hugetlb_no_page(mm, vma, mapping, idx, address, ptep,
>  				      entry, flags);
> +		if (!ret)
> +			mmu_notifier_update_mapping(vma->vm_mm, address,
> +						    pte_pfn(*ptep));

The next patch ends up calling pfn_to_page() on the result of
pte_pfn(*ptep). I don't think that's safe because couldn't the PTE have
already changed and/or the new page have been freed?

> +		return ret;
>  
>  	ret = 0;
>  
> @@ -6223,6 +6227,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  	 */
>  	if (need_wait_lock)
>  		folio_wait_locked(folio);
> +	if (!ret)
> +		mmu_notifier_update_mapping(vma->vm_mm, address,
> +					    pte_pfn(*ptep));
>  	return ret;
>  }
>  
> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> index 50c0dde1354f..6421405334b9 100644
> --- a/mm/mmu_notifier.c
> +++ b/mm/mmu_notifier.c
> @@ -441,6 +441,23 @@ void __mmu_notifier_change_pte(struct mm_struct *mm, unsigned long address,
>  	srcu_read_unlock(&srcu, id);
>  }
>  
> +void __mmu_notifier_update_mapping(struct mm_struct *mm, unsigned long address,
> +				   unsigned long pfn)
> +{
> +	struct mmu_notifier *subscription;
> +	int id;
> +
> +	id = srcu_read_lock(&srcu);
> +	hlist_for_each_entry_rcu(subscription,
> +				 &mm->notifier_subscriptions->list, hlist,
> +				 srcu_read_lock_held(&srcu)) {
> +		if (subscription->ops->update_mapping)
> +			subscription->ops->update_mapping(subscription, mm,
> +							  address, pfn);
> +	}
> +	srcu_read_unlock(&srcu, id);
> +}
> +
>  static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
>  			       const struct mmu_notifier_range *range)
>  {
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 2f2e0e618072..e59eb5fafadb 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -77,6 +77,7 @@ static struct vfsmount *shm_mnt;
>  #include <linux/fcntl.h>
>  #include <uapi/linux/memfd.h>
>  #include <linux/rmap.h>
> +#include <linux/mmu_notifier.h>
>  #include <linux/uuid.h>
>  
>  #include <linux/uaccess.h>
> @@ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>  				  gfp, vma, vmf, &ret);
>  	if (err)
>  		return vmf_error(err);
> -	if (folio)
> +	if (folio) {
>  		vmf->page = folio_file_page(folio, vmf->pgoff);
> +		if (ret == VM_FAULT_LOCKED)
> +			mmu_notifier_update_mapping(vma->vm_mm, vmf->address,
> +						    page_to_pfn(vmf->page));
> +	}
>  	return ret;
>  }

