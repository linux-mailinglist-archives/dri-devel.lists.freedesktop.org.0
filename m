Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941F75AA54
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAC010E586;
	Thu, 20 Jul 2023 09:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1FB10E586
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 09:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkSgVHgswfmJgzvH31NO59h94eoagiPqrKglkQFb6+UX+/9vnh2ryInPDiYL2WgzJpS+DrZhc87kyI/WZuwz7JxyBZjoBfdy4/XMa6S6vOae+6nNZpSDUNpUiDXAsIoBvD42I3yT6aFiiA3HlIixjgkDLdAgwitS/yhxKKR21Yr59ocbgKaE2JSA38umaFPY83s89tXfIFohhysnuXkGaDJv32EsvR2/xlF/ciVzhX/DzKWBUpj7oASMbFwN9gtMLJfQpjTdlxl8v1otRwu3oTJZ+hJEHDjrBVqHQHFm+lDfisg/Hvig/O2SpWZJ6Pgx6J73KVS7MojM/7FtwHg0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khD7ZhxwqAb5fXBaQKeQhkBGpFgpt2ta3Q3MHqoO4hM=;
 b=XjBSFh34TWfv8wkTksT1peEAWZtETFY0LKxWk1yJJHbpyNZ3PmehJoOwy8C53qyzkOcar9gqCwwi1WJfk2sxgb02aP2QjK5SjvBCLXyLw/HKdcJvUrOnZ4iAhgdNvKS++8LkqCBZkmNPurQcubBjo7FbrjjcTBZ94+JphP3gHBaFXQcMeOQbHD1klE9d3p3xItG1HLrdrYNKifml8nFJneXvJfrMjuKGoyraHC9VoEtKdG0J2RAPuy0mkXTHHuRTPIvxkxvsi1XbuJ46tKN6GAi6OTqfKGY6HpnOhs9fySyPLrrjePBi1hpUxjqE487H+VnED/WpbdKu8Q4rkVeUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khD7ZhxwqAb5fXBaQKeQhkBGpFgpt2ta3Q3MHqoO4hM=;
 b=sgoMsd8CySmIjpGmCgI2bxUOjAsSUa0hJ7HPWJTT/p9wOl94F87I/OUaah4xc9APApD009iqlSpOvYh5upZUpcpSfr+HiIp2xYr58oxxYOFEuHrIZ6lZbe6c3QhH0HqDOwJXmjg1m5cuwvfADacsZzSEqNecP3BYSeyIYZvnfPraRk+yTshvm9oV5TuGzO9AiZKHG7jQ7KVyb2QYVIchh1RhoJabpcbf8t02y/B6Z12kFo87wSOqlHS5bO5LA5d+uW5CDe5fugpO9yUlnkdQFxt6upbMGVizdcC3xBGIH+mNo8msHGkS5RWeXYjhPdWyPEE7hzG68zq5Ws94Y3Rrjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 09:01:36 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 09:01:36 +0000
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Date: Thu, 20 Jul 2023 19:00:52 +1000
In-reply-to: <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
Message-ID: <87pm4nj6s5.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0130.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:209::10) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|SA0PR12MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9fc37f-f155-44c5-fdb3-08db88ffec2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9t2Lkt7L52saxXH94vyGHRF/MCQ9gRlBGPD3QQWyntCB0+ufe5T4iLKWDwy6yBtHJRMa9VE4riEjhcz906j3DXqrLGCla4b0/MG3V8tf6CBrOOo8uUOt8S3jBkCD/Xp4wWLdQSRaYZeF4Nm0sZIlhn1zqWr5FfJmzlXYi9EWWtIaBHoBh9PT89Zw2JwpaIdYLZZOTEHfCnVHG8cNr5c+ZQzkvNJhHpww4WvgPc4uX3hhzAqCL3OsYsN0FHbnZiP/agHmbygxrpB9fMd1bSzEcgkX3c+Bf2PO+z1pYH/vDQDp6ut1JdAs0mSitqyJj0NQhdxxQBDDyD+ESjqgRUURfla3TexaIYI0b5FUTxo0LyxHHfmyAV1NcxOG/jXKkl2NMNsfGeSnllxOgvMQ48AJ6+mY2MYPogtuLBx0VqK61R3tgDW5aegsc4zzhA6u8EPgfstpkzDt8hn5JhayQhUOqOjBBILYsVEmr3F/3aloanR+z9y24XeWe4Bzp51n8jh8YqDxf1jQEdEX5sDlVI5WxPlJprHSY0JIGYuFbqaL1wOF2cMO/pP4HB1oucqBKf8y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(54906003)(478600001)(6666004)(9686003)(6486002)(6512007)(186003)(6506007)(26005)(86362001)(4326008)(6916009)(66946007)(66556008)(316002)(66476007)(8936002)(7416002)(8676002)(38100700002)(5660300002)(2906002)(41300700001)(15650500001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t+hvKg1vCQvkhVifdFrM/m3iV0tQwf7EoQAvMoH12W5ypTGMMNzBUtZTC1Bv?=
 =?us-ascii?Q?tt8S9K1jdLGuj2Et1baDgSH0PCb50SGg8MmRuzvJ/f2RYNQoFgaeqH7qohlZ?=
 =?us-ascii?Q?L+RQGDTIV1RttfQEIh77QWiY0RBQZVKoLnhVy0kDeuYSH5FFY4mdUD/vOavc?=
 =?us-ascii?Q?f14tryPSMYX8OJ+imyeQeyf8e+h/EOZL/FmlKVrHVPgbjCTcnLZ9+sHJiIg2?=
 =?us-ascii?Q?PpbovWORTS+2+xQ4ZD9Leqv5SRWyTDWCKDwezz+etEly5cJeXd0Vs/2fxQsB?=
 =?us-ascii?Q?mVKrXtXZxecJ6lKo/Do+wBwHM/uznImfw+SCauQFL1nIGGGAJwoA94nGzoeS?=
 =?us-ascii?Q?wU6KresE8vjz4aoEOTUionn7fZE/V6CmT74Ou8NOchwiQbfQZkRyLjTx+4ip?=
 =?us-ascii?Q?Yegcbo9s2Vy0f8n1i7MBkgXCatzpTsqSGsY6AnqkJMcnqw09QL8BI74zV/5F?=
 =?us-ascii?Q?rJBGyCFB+h3G9KQf5Ut32d9qwYKjGh7XuZhF8Bw4v3oBxl/0mxGnr97m/uj2?=
 =?us-ascii?Q?fzDl0xa5WN4G6BgARtiT4N3cgiX4ErqLa36rqAUh7pN4AQuJ/wSiSKgftFzW?=
 =?us-ascii?Q?MMcFiaYhE6xStSDzcfJlXkhIMeS9m98Qdrqu03vwqRARup0rvVKr6lVC5xLU?=
 =?us-ascii?Q?Bo48vyZWlv2tNbU2WQMPjhdIW/Wy5LihdYU9gv1iK6QpdUawSDBP58pV8slC?=
 =?us-ascii?Q?Ya27a+XHoCBC8gxqZ1rEGB/0yRezaSV10nRN9DypeVYKOcDxRh0a5jEUX/Cf?=
 =?us-ascii?Q?5HXmREJ/QUXTk5tltzTSGlKnpeszyxQuaDZRpy5HkK6n6uXQUK6n015cjQ35?=
 =?us-ascii?Q?sqabjrhrJm6prje34BMkRIhReyY/NibrYFe89LW/9VEv8LtJ6jLSyUaTL/JC?=
 =?us-ascii?Q?u6+9jEq8BRPp3DYJpfEqSu3Ye3FUthdNoe3klVC9A6JCcktF6Z1U9Xxju0Od?=
 =?us-ascii?Q?zsuhOzerMVA/NXE7bOZMnW2C9C8ElR2KayBHd334KSv0dDdUvS0Lsxocm1yN?=
 =?us-ascii?Q?EpsE1sKyTa3te1QToTIczEhKX95B57JzFGdcPJ0buLPcQT/9B5b+kBLu6pJ2?=
 =?us-ascii?Q?Y5SSOFaGpwSl8YLR2YNP/FoD0uBWleXrjWo0QtMNygH6c16vZWR5Xl65woO4?=
 =?us-ascii?Q?tMkULrCuyB5vbj4eIetZp4Zmg8payZnXd2OwoX2uaRm2Z1xzTh4SKX+uj4Nu?=
 =?us-ascii?Q?/vFBk7RNG8IYkJC0n8RgJMdO4m8+FE2PkzTjxyyZG2NUcePmq6OzXm3K1xhe?=
 =?us-ascii?Q?t1FUTMi8UYL7JSj/gj4K3P8h+uQQ3bqBDtIQWb2XWNYgTVJwGn9GZsC9YLlO?=
 =?us-ascii?Q?BKDlC/R2xqUJlS4PIT1R5UAwN26x9sGboM7ahgfN0NK921X3twX+Fr0qwqUb?=
 =?us-ascii?Q?wEDXBuoOg/khovXLirazSN944bWNLDccruJSx5oCzvWFQDgHQXy1kuwd43sF?=
 =?us-ascii?Q?8fAIiP8ptID6lt9CjZr50Amb1PW9fj6h1zib9vPmW+KjD5FoSXtTc9EKV6OY?=
 =?us-ascii?Q?O3bSscf/K4eV7RYapwQRh/Qjt5lJUN4+t/1iRgt0K0hDBTioZ7fhpJzNKkgP?=
 =?us-ascii?Q?ds3w6v/PTwL65wuGZDF8uAMdpaYnguBj3hrLlf9U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9fc37f-f155-44c5-fdb3-08db88ffec2a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 09:01:36.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ak4dKXpXgumhRVI0eQibI27NaVU1CONqJqP3JM+6hRJ+gGjnhdOTpsVW23ykoCV7pcc/wxJdSfJm7i4qj3tjXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


"Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:

> Hi Alistair,
>
>> 
>> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> > index 64a3239b6407..1f2f0209101a 100644
>> > --- a/mm/hugetlb.c
>> > +++ b/mm/hugetlb.c
>> > @@ -6096,8 +6096,12 @@ vm_fault_t hugetlb_fault(struct mm_struct
>> *mm, struct vm_area_struct *vma,
>> >  		 * hugetlb_no_page will drop vma lock and hugetlb fault
>> >  		 * mutex internally, which make us return immediately.
>> >  		 */
>> > -		return hugetlb_no_page(mm, vma, mapping, idx, address,
>> ptep,
>> > +		ret = hugetlb_no_page(mm, vma, mapping, idx, address,
>> ptep,
>> >  				      entry, flags);
>> > +		if (!ret)
>> > +			mmu_notifier_update_mapping(vma->vm_mm,
>> address,
>> > +						    pte_pfn(*ptep));
>> 
>> The next patch ends up calling pfn_to_page() on the result of
>> pte_pfn(*ptep). I don't think that's safe because couldn't the PTE have
>> already changed and/or the new page have been freed?
> Yeah, that might be possible; I believe the right thing to do would be:
> -               return hugetlb_no_page(mm, vma, mapping, idx, address, ptep,
> +               ret = hugetlb_no_page(mm, vma, mapping, idx, address, ptep,
>                                       entry, flags);
> +               if (!ret) {
> +                       ptl = huge_pte_lock(h, mm, ptep);
> +                       mmu_notifier_update_mapping(vma->vm_mm, address,
> +                                                    pte_pfn(*ptep));
> +                       spin_unlock(ptl);
> +               }

Yes, although obviously as I think you point out below you wouldn't be
able to take any sleeping locks in mmu_notifier_update_mapping().

> In which case I'd need to make a similar change in the shmem path as well.
> And, also redo (or eliminate) the locking in udmabuf (patch) which seems a
> bit excessive on a second look given our use-case (where reads and writes do
> not happen simultaneously due to fence synchronization in the guest driver). 

I'm not at all familiar with the udmabuf use case but that sounds
brittle and effectively makes this notifier udmabuf specific right?

The name gives the impression it is more general though. I have
contemplated adding a notifier for PTE updates for drivers using
hmm_range_fault() as it would save some expensive device faults and it
this could be useful for that.

So if we're adding a notifier for PTE updates I think it would be good
if it covered all cases and was robust enough to allow mirroring of the
correct PTE value (ie. by being called under PTL or via some other
synchronisation like hmm_range_fault()).

Thanks.

> Thanks,
> Vivek
>
>> 
>> > +		return ret;
>> >
>> >  	ret = 0;
>> >
>> > @@ -6223,6 +6227,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm,
>> struct vm_area_struct *vma,
>> >  	 */
>> >  	if (need_wait_lock)
>> >  		folio_wait_locked(folio);
>> > +	if (!ret)
>> > +		mmu_notifier_update_mapping(vma->vm_mm, address,
>> > +					    pte_pfn(*ptep));
>> >  	return ret;
>> >  }
>> >
>> > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
>> > index 50c0dde1354f..6421405334b9 100644
>> > --- a/mm/mmu_notifier.c
>> > +++ b/mm/mmu_notifier.c
>> > @@ -441,6 +441,23 @@ void __mmu_notifier_change_pte(struct
>> mm_struct *mm, unsigned long address,
>> >  	srcu_read_unlock(&srcu, id);
>> >  }
>> >
>> > +void __mmu_notifier_update_mapping(struct mm_struct *mm, unsigned
>> long address,
>> > +				   unsigned long pfn)
>> > +{
>> > +	struct mmu_notifier *subscription;
>> > +	int id;
>> > +
>> > +	id = srcu_read_lock(&srcu);
>> > +	hlist_for_each_entry_rcu(subscription,
>> > +				 &mm->notifier_subscriptions->list, hlist,
>> > +				 srcu_read_lock_held(&srcu)) {
>> > +		if (subscription->ops->update_mapping)
>> > +			subscription->ops->update_mapping(subscription,
>> mm,
>> > +							  address, pfn);
>> > +	}
>> > +	srcu_read_unlock(&srcu, id);
>> > +}
>> > +
>> >  static int mn_itree_invalidate(struct mmu_notifier_subscriptions
>> *subscriptions,
>> >  			       const struct mmu_notifier_range *range)
>> >  {
>> > diff --git a/mm/shmem.c b/mm/shmem.c
>> > index 2f2e0e618072..e59eb5fafadb 100644
>> > --- a/mm/shmem.c
>> > +++ b/mm/shmem.c
>> > @@ -77,6 +77,7 @@ static struct vfsmount *shm_mnt;
>> >  #include <linux/fcntl.h>
>> >  #include <uapi/linux/memfd.h>
>> >  #include <linux/rmap.h>
>> > +#include <linux/mmu_notifier.h>
>> >  #include <linux/uuid.h>
>> >
>> >  #include <linux/uaccess.h>
>> > @@ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct vm_fault
>> *vmf)
>> >  				  gfp, vma, vmf, &ret);
>> >  	if (err)
>> >  		return vmf_error(err);
>> > -	if (folio)
>> > +	if (folio) {
>> >  		vmf->page = folio_file_page(folio, vmf->pgoff);
>> > +		if (ret == VM_FAULT_LOCKED)
>> > +			mmu_notifier_update_mapping(vma->vm_mm, vmf-
>> >address,
>> > +						    page_to_pfn(vmf->page));
>> > +	}
>> >  	return ret;
>> >  }

