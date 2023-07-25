Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFAE76071B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 06:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63B810E195;
	Tue, 25 Jul 2023 04:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28D510E195
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 04:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAZwTa+aisOqTC7yUyz7tJjKjwoQ3+tBdUQtXxmCOOZ2XGrBjHv+HieKkyRAY0KYPkcjT/rFENIG7a22fDT5ytyWyBIkInTMOAVNBQoNtqVufOBgbsrJ8Zc1PcWzS7XIJq8yesEKMRyIhKRnU7i4UTDkoSa0GXQXezZrnoyPlO6C610yi7Sfva5vgafVXE/2U9O9EUJykB0Wgj1W7YIpYuqgynLMVecFUG9YQ++AVH414KNjwT6FT+R4VC7RxUpvb4YxCdylhr1lX+BbGcPcLL6/SDhneb3VZHerANuaB0TPoTOXuCd3P6dH7Cs+gpEpUyxiNJG9N+nAnQsrO9glTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsFrQgSgbzUvNK/Eo0MYCW9gIvWPJ9fHzMVPfIO6lw4=;
 b=m0qfpgaoFbMLxPV/8IMms6btJGmgPlCcnT1/K0k3nGH2EVeNJiq4MFiLdmyovkQ/b36XlkB0WaLcdJyfiBI1uSS8Y9Wvl9CywpUnpeYXfmTSHdWt54xTvZCG+3qF63VO8+717Tc2g9ZW1mb5ji2g/xZLLuXxU2Z53hyDQ/Sj4WxPz1mZq1ozuIQoMLsr7sqyhtGK+f3xRkFMiwssHS0PtKUWBinrD6lgkiSTMDttDUET9pDu8LZeNMTCVPNb8O2npwTYoAZTfzsk8AAvVRcpwyDC2KvZYPShWqqK/cM6l3VbiLpQfXH9M+Lyy6jZstO/nsnU17pxi1sI+z9GlXCnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsFrQgSgbzUvNK/Eo0MYCW9gIvWPJ9fHzMVPfIO6lw4=;
 b=EcMN5YLVD0H4MU64EWTBPyZnjxZ9dJb1aWVYB8RO6KeTFYC10mrPIMus+eYvj5Pb8bcnT1iID1vCM1HBOiB/7ErRaDJWHHh1oQlZbKppV5obiZ9HktoxB9TKivfbEDkeTqvw4wR/qDV2shDSY+92gnsCO3fnuftbSKHTVaHgF6HpoxZ/IvrHAQPmRE7ktliSlIQ5Fnch4hep0yvUgLx5IVo7QAKi48u3UOvg4qVrC8zLcpjFm5zlzu4emhfRt2itYQ81+6U1DUyETnXWcsZX9FejVKL8zqIXZqNglV/JdwuvVTO5iHM/8WG/YfNyjqj0jB9ntk8eo7lDSC7S3W8ELg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB9071.namprd12.prod.outlook.com (2603:10b6:8:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Tue, 25 Jul
 2023 04:16:13 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 04:16:13 +0000
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87zg3lzbd1.fsf@nvdebian.thelocal>
 <IA0PR11MB71855B4A7D0F428C9E8771D9F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Date: Tue, 25 Jul 2023 13:14:22 +1000
In-reply-to: <IA0PR11MB71855B4A7D0F428C9E8771D9F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
Message-ID: <875y68zkvu.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0171.ausprd01.prod.outlook.com
 (2603:10c6:10:52::15) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: 9664f805-b98b-4d5c-8551-08db8cc5e16a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Is5TInBGLzHxJmAUL3ZQlcVYAFngEaJ3fc4jnPSeQYVzjkgSi6sbsFkB+Ts5dcTNZeOwC2gZsnSW+GUMqxAi9+wBRPm02SDrEZyfCBHFoYFivX3Nn9TeI09WJSrPpiZGptquF2icUAuF0DxtI00nE00aEuxGfpnBT9E6gwDq+gwS6oecHg6XjiLYQyjkWbZrguBqNrzW454v1H0+BorCBdN1pLosD6sdsSneQnbnRnTaRaZtNpxJpT67aDFURnQpjefunFX7HXY8pDNGlmz8K33NZLNAMcygfrmwhaOAlKzJmez8U67Ke0VDlTQdPpBoUj38fdJrpynwi8IRpEQCG384seYUZZ1piLhr5Ax+CL8QI0b+cefKcP83sBCW1HMua9BzraVxHnkxaKJWcyS36as+Ip7Litnrz2q5sv6sBKONLy5goSiKwR7V89QgcDmR0VbT0nZpk4QM6oApn5B/8as4RNhI1kNpdna4ccGUsobAu8VpdXjme6egBi5YaimbvFaQA3gcVBMy+zYuCFaN+00k9mtUBemv7tqGQfGR57nrXkuCZkU+ZFZvpO1OJbth
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(38100700002)(86362001)(2906002)(66476007)(8936002)(8676002)(7416002)(478600001)(83380400001)(6486002)(5660300002)(6666004)(6512007)(6506007)(9686003)(26005)(186003)(15650500001)(4326008)(316002)(66946007)(54906003)(41300700001)(6916009)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9jsEBS4YPLt7Fm/dGBwvRoLN34h+1zN5hygyzXvsjvoD3n41BRfUC2f4DvIq?=
 =?us-ascii?Q?rrlAC1olWQMc2FPFRpMj5V+qlYENRTfq87TCaIRy/dH4Cw5JZCCIOb4JT12E?=
 =?us-ascii?Q?wVlv3/MQBvNNk447JcZ8GxQk1y879pMEGCbqNUutp8cCOsnGYwJGXznsvncw?=
 =?us-ascii?Q?6P7/gp9yVg4zKmrcN/sf5JAx8Beb9ZewueyM/S8MqabpUab0wcWZ+QnONgul?=
 =?us-ascii?Q?my2ykO0Haq/dPBrMbCDn6dp6u+FGcpIJHGKrMvG43NaBAzlQ9eBdBSZzhtt6?=
 =?us-ascii?Q?xOtwvisIqe2Cz6GwL9dsJtAAOiWmcuJGEZtcTkoU3nm5g6CKjzw4odOBex54?=
 =?us-ascii?Q?CSCJ5+NdaQ4DxsM+fE5BQH/tGBEyxRQL1IbyLJt8xbpmMtHP9lqm2SgCcmIs?=
 =?us-ascii?Q?FwSnzphlWVxLs38GPHn7mckYn62ESSusbbUCWlrDqb5fxNgOEeyA3XXg6bE+?=
 =?us-ascii?Q?8MFdxyGGOrpYhkDWPzD0HNe0sjuEm+RwqF7cnPsvq9036wSh+KOysx8XBVvr?=
 =?us-ascii?Q?2+wWo23yF9Pn8j1+Zy2YLFTULnRdnTrN+4VMOUakfXwXk2Trb+btuJ6UoRbL?=
 =?us-ascii?Q?c8GdtL3qgpENZidxSBdMyQO3DTDB0vjElvf1B38ZlmNnNMEfKx9zrHNRR+g8?=
 =?us-ascii?Q?tBBeExjrDFyzuqMplHlGAEAGR+b9zso8goEOWii6zVMXsk8A7tZTd0rS23hC?=
 =?us-ascii?Q?HS74Xb0NMqsmggVyKkqymHU6F693xj6eY/DEDsoDOkxLGN/V2YikTADb3goK?=
 =?us-ascii?Q?P6Hvu9VDSx01+aI4QRB8th2WFohWXxogQQmFP4cYdvV8+kHrr7pAdmJI8c5u?=
 =?us-ascii?Q?knNz53qeUwbwtBHqwSPeBS5+s6NJdodXBZZzqWIRhphJjm3zp3r+XDsKVXxo?=
 =?us-ascii?Q?x3Vc+PcB8hdezyCEsB6EKj5IhXaRZzst+ECarv4ZBcmzQEQmuhEBxpXo+1/k?=
 =?us-ascii?Q?iVsDhCdZ9+CD2yGmZkxGLjJapuuYYRRL6l5cUuAH7SHwLI10KG+psCEhW7Uy?=
 =?us-ascii?Q?8QMT9UMH20fZVkMgOi4n39S4hZMTeFNd8TPiwXzPDzvnNQG9AWBUDJ98MW1H?=
 =?us-ascii?Q?+4ZHgEJOb3VQCox8v6s7TcEeEgHGeZHVb/Jj21vQmoT7U5jWpIYjqAwkcLBp?=
 =?us-ascii?Q?wfy7k7Q/I0hpXHPSEx2rIfQOmvx5OGlX6QKrla/eFdhfxjjVySkrqiB6E9Jx?=
 =?us-ascii?Q?A1q66twlmSfRGtTihFdBuhBUWvJOtjxrfNxPQDewbCnoUtWSEKycYXUPi9dK?=
 =?us-ascii?Q?nnLNovtQ/bpL43koIgiaMt6YwoekUqftBQxV8svbcVOCuQUsVHcf3PM+j2FM?=
 =?us-ascii?Q?iCTR7HN6e4vG9g8eBsQ8CHj0aX9iTcwDldDNLtXzcawLHjRq1yUcw3Ys2YJh?=
 =?us-ascii?Q?AaVVqD97rnLynrLKcYnAIJJI2xaHplBsHnF+fTx33+ucjhUMnCJorAvtt8Go?=
 =?us-ascii?Q?cIZf6btN7SbYbkpWbkA44yoWE0Lqg19Gzybkr4RYCCvI3KbzR/YF7WvKiwPd?=
 =?us-ascii?Q?3byHK2W9c1DkxGhhtkGn+a07NoG3HsFnbgujMVwZepWOd0a8dZ2ydAR3RKaJ?=
 =?us-ascii?Q?ODpsNJwRDdfUMKMlVuPREL67OycxKn8FiT5UzpbR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9664f805-b98b-4d5c-8551-08db8cc5e16a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 04:16:12.4497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LT1F0j5ywKfmZR+WjEHIJdHw9BcibPwzrj7Ct/YOQODrziIth7OR7+/Vj5Q1LQZocr3Lv2cRReORLXWYPr+p3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9071
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang, 
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


"Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:

> Hi Alistair,

Hi Vivek,

>> I wonder if we actually need the flag? IIUC it is already used for more
>> than just KSM. For example it can be called as part of fault handling by
>> set_pte_at_notify() in in wp_page_copy().
> Yes, I noticed that but what I really meant is I'd put all these prior instances
> of change_pte in one category using the flag. Without the flag, KVM, the only
> user that currently has a callback for change_pte would get notified which
> may not be appropriate. Note that the change_pte callback for KVM was
> added (based on Git log) for KSM updates and it is not clear to me if that
> is still the case.

It is certainly now called from contexts other than KSM though. I have
no idea whether that's a problem, nor if adding more callers would
actually be an issue though so understand the motivation for the flag.

>> > Would that work for your HMM use-case -- assuming we call change_pte
>> after
>> > taking PTL?
>> 
>> I suspect being called under the PTL could be an issue. For HMM we use a
>> combination of sequence numbers and a mutex to synchronise PTEs. To
>> avoid calling the notifier while holding PTL we might be able to record
>> the sequence number (subscriptions->invalidate_seq) while holding PTL,
>> release the PTL and provide that sequence number to the notifier
>> callback along with the PTE.
>> 
>> Some form of mmu_interval_read_retry() could then be used to detect if
>> the PTE has changed between dropping the PTL and calling the
>> update_pte()/change_pte() notifier.
>> 
>> Of course if your design can handle being called while holding the PTL
>> then the above is probably unnecessarily complex for your use-case.
> Yes, I believe we can handle it while holding the PTL. 
>
>> 
>> My primary issue with this patch is the notifier is called without the
>> PTL while providing a PTE value. Without some form of synchronisation it
>> isn't safe to use the result of eg. pte_page(pte) or pte_write(pte) in
>> the notifier callback. Based on your comments it seems udmabuf might
>> have some other synchronisation that makes it safe, but being external
>> to the notifier calls make it's hard to reason about.
> I intend to fix the PTL issue in v2 but I am still not sure what is the best
> thing to do as far as the notifier is concerned given the following options:
> - Keep this patch (and notifier name) but ensure that it is called under PTL

I think that's preferable to adding a flag so long as it's implemented
and documented that this is called whenever a PTE is updated. Otherwise
a third user will come along and have the same problem we've currently
got with KVMs usage.

> - Drop this patch and expand the use of change_pte but add the flag to
>   distinguish between prior usage and new usage
> - Keep this patch but don't include the PTE or the pfn of the new page as
>   part of the notifier. In other words, just have this:
> mmu_notifier_update_mapping(struct mm_struct *mm, unsigned long address)
> This way, in udmabuf driver, we could get the new page from the page cache
> as soon as we get notified:
> 	mapoff = linear_page_index(vma, address);
> 	new_page = find_get_page(vma->vm_file->f_mapping, mapoff);
> This last option would probably limit the new notifier to the udmabuf
> use-case but I do not intend to pursue it as you suggested that you are
> also interested in a new notifier associated with PTE updates.

Actually the last option isn't limiting assuming it's sent whenever the
PTE is updated. It just means users have to use hmm_range_fault() or
some equivalent that already enforces proper synchronisation if they
need the actual PTE value. That seems fine to me.

> Thanks,
> Vivek
>
>> 
>>  - Alistair
>> 
>> > Thanks,
>> > Vivek
>> >
>> >>
>> >> Thanks.
>> >>
>> >> > Thanks,
>> >> > Vivek
>> >> >
>> >> >>
>> >> >> > +		return ret;
>> >> >> >
>> >> >> >  	ret = 0;
>> >> >> >
>> >> >> > @@ -6223,6 +6227,9 @@ vm_fault_t hugetlb_fault(struct mm_struct
>> >> *mm,
>> >> >> struct vm_area_struct *vma,
>> >> >> >  	 */
>> >> >> >  	if (need_wait_lock)
>> >> >> >  		folio_wait_locked(folio);
>> >> >> > +	if (!ret)
>> >> >> > +		mmu_notifier_update_mapping(vma->vm_mm,
>> address,
>> >> >> > +					    pte_pfn(*ptep));
>> >> >> >  	return ret;
>> >> >> >  }
>> >> >> >
>> >> >> > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
>> >> >> > index 50c0dde1354f..6421405334b9 100644
>> >> >> > --- a/mm/mmu_notifier.c
>> >> >> > +++ b/mm/mmu_notifier.c
>> >> >> > @@ -441,6 +441,23 @@ void __mmu_notifier_change_pte(struct
>> >> >> mm_struct *mm, unsigned long address,
>> >> >> >  	srcu_read_unlock(&srcu, id);
>> >> >> >  }
>> >> >> >
>> >> >> > +void __mmu_notifier_update_mapping(struct mm_struct *mm,
>> >> unsigned
>> >> >> long address,
>> >> >> > +				   unsigned long pfn)
>> >> >> > +{
>> >> >> > +	struct mmu_notifier *subscription;
>> >> >> > +	int id;
>> >> >> > +
>> >> >> > +	id = srcu_read_lock(&srcu);
>> >> >> > +	hlist_for_each_entry_rcu(subscription,
>> >> >> > +				 &mm->notifier_subscriptions->list,
>> hlist,
>> >> >> > +				 srcu_read_lock_held(&srcu)) {
>> >> >> > +		if (subscription->ops->update_mapping)
>> >> >> > +			subscription->ops-
>> >update_mapping(subscription,
>> >> >> mm,
>> >> >> > +							  address,
>> pfn);
>> >> >> > +	}
>> >> >> > +	srcu_read_unlock(&srcu, id);
>> >> >> > +}
>> >> >> > +
>> >> >> >  static int mn_itree_invalidate(struct mmu_notifier_subscriptions
>> >> >> *subscriptions,
>> >> >> >  			       const struct mmu_notifier_range *range)
>> >> >> >  {
>> >> >> > diff --git a/mm/shmem.c b/mm/shmem.c
>> >> >> > index 2f2e0e618072..e59eb5fafadb 100644
>> >> >> > --- a/mm/shmem.c
>> >> >> > +++ b/mm/shmem.c
>> >> >> > @@ -77,6 +77,7 @@ static struct vfsmount *shm_mnt;
>> >> >> >  #include <linux/fcntl.h>
>> >> >> >  #include <uapi/linux/memfd.h>
>> >> >> >  #include <linux/rmap.h>
>> >> >> > +#include <linux/mmu_notifier.h>
>> >> >> >  #include <linux/uuid.h>
>> >> >> >
>> >> >> >  #include <linux/uaccess.h>
>> >> >> > @@ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct
>> >> vm_fault
>> >> >> *vmf)
>> >> >> >  				  gfp, vma, vmf, &ret);
>> >> >> >  	if (err)
>> >> >> >  		return vmf_error(err);
>> >> >> > -	if (folio)
>> >> >> > +	if (folio) {
>> >> >> >  		vmf->page = folio_file_page(folio, vmf->pgoff);
>> >> >> > +		if (ret == VM_FAULT_LOCKED)
>> >> >> > +			mmu_notifier_update_mapping(vma-
>> >vm_mm, vmf-
>> >> >> >address,
>> >> >> > +						    page_to_pfn(vmf-
>> >page));
>> >> >> > +	}
>> >> >> >  	return ret;
>> >> >> >  }

