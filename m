Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4D75F84E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 15:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B518826D;
	Mon, 24 Jul 2023 13:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293C8826D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 13:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jpw4dWLC8Bh8hMm5AGK+BSAKATF5xjG7vA93BxZOBn2YlIqT12eftZjBIhd6pdzT0NJ87bKy96ll58EtUEPG1yBT3W5005gyCRLDQU7LYNcN0mLiepj4NOvv5xIv4tdgYUEzd5GcRbR8NOm1JSAV9uQPTBF6ADRic1pTBlfT0S5kgYiBTjka4EToUIkey+fsC+1zSKtmhvNHUFLtq9OB7cz5LSohidlUkdEYvsTs1vD+C7prTjptAYETuWHmEpR6C6D7Vg4FpHBfn+xZd+/mw411Yx52kK+DZ7g8oMmiRW1r0rj9YSYLftQbj98HDVhs+3i+qE1iKCl0hVJcqBWH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxvJodCb431dCygpgeEyWS/AjBzqzwvYnmxbREE7E/E=;
 b=m1BWPPUgCZm84UBU0cI/wd0aZap2nit7Unt3ZoJm2JtDMgSP/N89FETMValIeLUXPEiKsIVUi+revlnaldtUNIKCi1PBXmbRDVuTHaBX5IG9qfDHXHCWlSHIfcCzIRDykksF8qgvx1ZT7fMgRXG8iKHPK06hFWz2yh/Iqdk44KqIK9l/FGDOPqkBy5gM9dHLP2sbTAqRTc5IcwYZW1XQb2qjlnesCLgucN/r0giM0lbR2yLX+REzdx+CLTunVEtT6ZxDDJeLdy7lp0ycPPls4rEwj3n34r8mpVIuS6ffD5TVaPHaEztS1yLYU4O19E/WHXEVdceo7iBn6cO7Hjicaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxvJodCb431dCygpgeEyWS/AjBzqzwvYnmxbREE7E/E=;
 b=S+IMiP6ciW6Swzj2jpNxa3SkMgn0nNyNB6v/yL8tX0AuR/Qdk+AUo/i/eY9YM1kYI624GkhivrOJlMhOlMIHtcHs/66yC4WU2qAo9B6YDen5sIGgLx2W0WNinoLAV9DryCZzgufTsUgbS1zgt4GEQ1W9Zn63Uy0fhd5wyJLeAmu5p0w/HrEoYZhmRSHEvLqCgKjkn0gqFiWplnjaZu6DkxwkhrTdlighhT5K3IiEdYq9zhTPEqEJQyVgtmatLfXbS5ORRGQ16//t0Ek+znpSgyGjc8KfiB1O3ryKVO74s1AlhepeG06YNksJA3v138ROaq6zQVtnJR/btAVGQT7F2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3179.namprd12.prod.outlook.com (2603:10b6:5:183::18)
 by PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Mon, 24 Jul
 2023 13:29:37 +0000
Received: from DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::3eb6:cda8:4a56:25fe]) by DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::3eb6:cda8:4a56:25fe%7]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 13:29:37 +0000
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Date: Mon, 24 Jul 2023 23:36:47 +1000
In-reply-to: <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
Message-ID: <87zg3lzbd1.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0071.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::9) To DM6PR12MB3179.namprd12.prod.outlook.com
 (2603:10b6:5:183::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3179:EE_|PH7PR12MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: af028cea-5f9e-4856-3116-08db8c4a070c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a25Fpbq+Z4IPhjSGZzMe29SnjecmmQ1MOMwppln/pMSxA+snpV/zME9eQ9LxTJrOvH7nTKNVtqdg8wxHJkFCKA8eIELNmqOUJ3HrsY5ZiASjTRrDz/9wXOAUWeicwDrZnnQjbR+ER57icdKFmUJdq/Ax+ggU81LS518MNa2pQxTVJsM7wEAz48AYoDoJoOa12Ly12UYoM/8YT3Mu5w9afUnfkrZJWjSRezsV0BGwLhOLNF2fYpBisdtGtlY/OUCihqbZY7qcTaJj7hrdbtdKsOugbHgDan1rjiL5MM0zwfwz1+2xulbw/Pb36gXAg7TPLIGifcn8qPDdRHX0i8R8YlZy7eGOvxDnO6lf1iXJSBV8DF9HXvtTfufYuq8S+zPo2PfpDvyRAkclGyioBN0GhTAHf1pMocHiM8yeLKhDfe3cggHGT9kpCb/Xx3t6tq+LsNXjEANnWA0cBTBe3F/4GcUIb8JqFT1YNSpmIkKSO+lrpWeIDJyWLd17Q8eIb17RCQ1hPpdvCygaTD4ueFWxbgtuV61ngX85W78dz7IRNAFSBeAVv+NSdgiccclHAxo/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3179.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(6666004)(6486002)(478600001)(54906003)(15650500001)(83380400001)(86362001)(2906002)(6512007)(26005)(9686003)(6506007)(66476007)(186003)(6916009)(66556008)(38100700002)(66946007)(316002)(8936002)(5660300002)(8676002)(7416002)(4326008)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nPys/JIlFvlHs/MjZK3486UvCyfut3gp1vub96IXQFWc8v18CCABN253D5G?=
 =?us-ascii?Q?MGCOXfR6e7baVjpRlHGT/SUmJXMwWD36QX4Uf9cZTWj+Av00SbXbHexElfA1?=
 =?us-ascii?Q?2u19fasqu6HWcu3ue1fqaMQH63AQiLUsdBSMSZaDizWawTsDygdTKsJJJhni?=
 =?us-ascii?Q?EIfJZlHTvQ8cYMAxkfVSbiDh/O4Bkgfvt0lKI5rmo+EC/L3mr3MmPNu2BfL7?=
 =?us-ascii?Q?R8rLghbi/lZl/BLQ3zZSzzUZCHm228/xGsFSb0q82uO7m4fhVujdDPtoWvY1?=
 =?us-ascii?Q?gZS/aCTvINgWwAozZAwRLyrMg+GRQu4UydqXZRF8l+TygZvBve6cOcsnzUV6?=
 =?us-ascii?Q?9kE/zgTUOX0IyDqMGoHz/jIDjyo8hQqS0LkEZO2xkZY31cU6kUL6rT6OevCT?=
 =?us-ascii?Q?Q0mhQbTjM/R5enfmWzCsDNiDO3fai6cf1sL3fxoMOlUlNkWbExsipawYZtGR?=
 =?us-ascii?Q?Dv1RJ99yNwjuKUmZJu2H5M4buJ/CYcnV/FFZijsl1CNmHZ3QlbSC4cwcFr9O?=
 =?us-ascii?Q?i2LVpgJwk6qLvk9rB84NWqL9yxBdcqSExkA+xk8TZqGG0EKFDM40HChTBE2u?=
 =?us-ascii?Q?HyhrdUY3+mqbMtdqNsaLgYMu+E+z8TpZLzqOSiPdAOYB59pEJ63bPYLFpwjM?=
 =?us-ascii?Q?gpbt6c867Y8z7N5p4zVfQNtfYs3xT5P+aqm9ot0vZSJ90i8Xukma7SvS+AqQ?=
 =?us-ascii?Q?jRSntWTqD5rRkIiZq804TGlUqwtXbUKqHVLQPlmG7ZlG3sW2irsqs79iQvkZ?=
 =?us-ascii?Q?iHKVwfYrtVvG0pU2sWLliDzw2O5/iDQMSl6IApdlREwJqYZrxjGILPQp64WN?=
 =?us-ascii?Q?H1b5gsKhbsL1aJUrMIWZ2ONBPPvamDgHHfzx4ENt5KSXUuGSJHGI0Joj2XZ+?=
 =?us-ascii?Q?KGD6qobeCYuUbsdEcqXjLNhdLYCzD8lDkDfwjtLzbb6OxZNkQ00Vy0xvznXP?=
 =?us-ascii?Q?Fr6gcBdDu8lNu6nbsCyqn9ExZqonKHIPkL7+T12bBFIsWWzP3tmbxI2fMAhC?=
 =?us-ascii?Q?mvGTqo61AM2+KfkjH/UVXLutbi1MR0Y7aeNjgL9KezZteWyDe3pMOMe/G/w3?=
 =?us-ascii?Q?qL+VwQHSatJdSn2sxhE8GevZfLcb8+TTjoUheZmgq2fEJ7r7xLFH8T8QiQGS?=
 =?us-ascii?Q?b4E2sOqgf+05bTSaUgdv2wc8s1VoGzZbQmNHS8gIhM4QdqzWJVRKAMTAo1q8?=
 =?us-ascii?Q?ssSSYbZYUEuXnYtUypYa9ZgdSGiWPKV6EWii7+FOXG1C8o7DU7fZGO+EA4/t?=
 =?us-ascii?Q?Xc7GHKW/zSOM4uP4M30lYhcddQ4qGp+2sL6EeQ2VeG0YHUEAExUZwrnn8Ani?=
 =?us-ascii?Q?EbVLvuUSpApqz/CiqGQXvXCvdWjm16hYWV7T7oscfB/xgVbc8+cka1BBduVd?=
 =?us-ascii?Q?ZorLvtHQv/r1sJue112D5MZ/suJL0KogJj95v7GUSRDfAN0G7OT4I2WL3U+G?=
 =?us-ascii?Q?Jx+uxuXRZ+wgMAdBXgO6Gb50oeS4oVBEv0lD/He/z19NfTAolyS4BukaNrRY?=
 =?us-ascii?Q?Ek3nyh3RznGAejFUWbtV+FfOtdzzWPRK6r+ABAnW9Y3imWf5RNAMtKwmaeZ9?=
 =?us-ascii?Q?dLtxqodjFqfuqtvsr7zcBAbR0zYYt+Z3p8wCRD65?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af028cea-5f9e-4856-3116-08db8c4a070c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:29:37.8775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4y1JWjdoSYcqXrVIIuRhoi5wVyB9OACJKUsSXBtqQbu3foWtSuvpROx8U1PK33pzvZSy6LY+PTBLdgAIBO+XfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137
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
>
>> 
>> 
>> "Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:
>>
>> Yes, although obviously as I think you point out below you wouldn't be
>> able to take any sleeping locks in mmu_notifier_update_mapping().
> Yes, I understand that, but I am not sure how we can prevent any potential
> notifier callback from taking sleeping locks other than adding clear comments.

Oh of course not, but is such a restriction on not taking sleeping locks
acceptable for your implementation of the notifier callback? I notice in
patch 2 update_udmabuf() takes a mutex so I assumed not being able to
sleep in the callback would be an issue.

>> 
>> > In which case I'd need to make a similar change in the shmem path as well.
>> > And, also redo (or eliminate) the locking in udmabuf (patch) which seems a
>> > bit excessive on a second look given our use-case (where reads and writes
>> do
>> > not happen simultaneously due to fence synchronization in the guest
>> driver).
>> 
>> I'm not at all familiar with the udmabuf use case but that sounds
>> brittle and effectively makes this notifier udmabuf specific right?
> Oh, Qemu uses the udmabuf driver to provide Host Graphics components
> (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
> buffers. In other words, from a core mm standpoint, udmabuf just
> collects a bunch of pages (associated with buffers) scattered inside
> the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> them in a dmabuf fd. And, since we provide zero-copy access, we
> use DMA fences to ensure that the components on the Host and
> Guest do not access the buffer simultaneously.

Thanks for the background!

>> contemplated adding a notifier for PTE updates for drivers using
>> hmm_range_fault() as it would save some expensive device faults and it
>> this could be useful for that.
>> 
>> So if we're adding a notifier for PTE updates I think it would be good
>> if it covered all cases and was robust enough to allow mirroring of the
>> correct PTE value (ie. by being called under PTL or via some other
>> synchronisation like hmm_range_fault()).
> Ok; in order to make it clear that the notifier is associated with PTE updates,
> I think it needs to have a more suitable name such as mmu_notifier_update_pte()
> or mmu_notifier_new_pte(). But we already have mmu_notifier_change_pte,
> which IIUC is used mainly for PTE updates triggered by KSM. So, I am inclining
> towards dropping this new notifier and instead adding a new flag to change_pte
> to distinguish between KSM triggered notifications and others. Something along
> the lines of:
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index 218ddc3b4bc7..6afce2287143 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -129,7 +129,8 @@ struct mmu_notifier_ops {
>         void (*change_pte)(struct mmu_notifier *subscription,
>                            struct mm_struct *mm,
>                            unsigned long address,
> -                          pte_t pte);
> +                          pte_t pte,
> +                          bool ksm_update);
> @@ -658,7 +659,7 @@ static inline void mmu_notifier_range_init_owner(
>         unsigned long ___address = __address;                           \
>         pte_t ___pte = __pte;                                           \
>                                                                         \
> -       mmu_notifier_change_pte(___mm, ___address, ___pte);             \
> +       mmu_notifier_change_pte(___mm, ___address, ___pte, true);       \
>
> And replace mmu_notifier_update_mapping(vma->vm_mm, address, pte_pfn(*ptep))
> in the current patch with
> mmu_notifier_change_pte(vma->vm_mm, address, ptep, false));

I wonder if we actually need the flag? IIUC it is already used for more
than just KSM. For example it can be called as part of fault handling by
set_pte_at_notify() in in wp_page_copy().

> Would that work for your HMM use-case -- assuming we call change_pte after
> taking PTL?

I suspect being called under the PTL could be an issue. For HMM we use a
combination of sequence numbers and a mutex to synchronise PTEs. To
avoid calling the notifier while holding PTL we might be able to record
the sequence number (subscriptions->invalidate_seq) while holding PTL,
release the PTL and provide that sequence number to the notifier
callback along with the PTE.

Some form of mmu_interval_read_retry() could then be used to detect if
the PTE has changed between dropping the PTL and calling the
update_pte()/change_pte() notifier.

Of course if your design can handle being called while holding the PTL
then the above is probably unnecessarily complex for your use-case.

My primary issue with this patch is the notifier is called without the
PTL while providing a PTE value. Without some form of synchronisation it
isn't safe to use the result of eg. pte_page(pte) or pte_write(pte) in
the notifier callback. Based on your comments it seems udmabuf might
have some other synchronisation that makes it safe, but being external
to the notifier calls make it's hard to reason about.

 - Alistair

> Thanks,
> Vivek
>
>> 
>> Thanks.
>> 
>> > Thanks,
>> > Vivek
>> >
>> >>
>> >> > +		return ret;
>> >> >
>> >> >  	ret = 0;
>> >> >
>> >> > @@ -6223,6 +6227,9 @@ vm_fault_t hugetlb_fault(struct mm_struct
>> *mm,
>> >> struct vm_area_struct *vma,
>> >> >  	 */
>> >> >  	if (need_wait_lock)
>> >> >  		folio_wait_locked(folio);
>> >> > +	if (!ret)
>> >> > +		mmu_notifier_update_mapping(vma->vm_mm, address,
>> >> > +					    pte_pfn(*ptep));
>> >> >  	return ret;
>> >> >  }
>> >> >
>> >> > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
>> >> > index 50c0dde1354f..6421405334b9 100644
>> >> > --- a/mm/mmu_notifier.c
>> >> > +++ b/mm/mmu_notifier.c
>> >> > @@ -441,6 +441,23 @@ void __mmu_notifier_change_pte(struct
>> >> mm_struct *mm, unsigned long address,
>> >> >  	srcu_read_unlock(&srcu, id);
>> >> >  }
>> >> >
>> >> > +void __mmu_notifier_update_mapping(struct mm_struct *mm,
>> unsigned
>> >> long address,
>> >> > +				   unsigned long pfn)
>> >> > +{
>> >> > +	struct mmu_notifier *subscription;
>> >> > +	int id;
>> >> > +
>> >> > +	id = srcu_read_lock(&srcu);
>> >> > +	hlist_for_each_entry_rcu(subscription,
>> >> > +				 &mm->notifier_subscriptions->list, hlist,
>> >> > +				 srcu_read_lock_held(&srcu)) {
>> >> > +		if (subscription->ops->update_mapping)
>> >> > +			subscription->ops->update_mapping(subscription,
>> >> mm,
>> >> > +							  address, pfn);
>> >> > +	}
>> >> > +	srcu_read_unlock(&srcu, id);
>> >> > +}
>> >> > +
>> >> >  static int mn_itree_invalidate(struct mmu_notifier_subscriptions
>> >> *subscriptions,
>> >> >  			       const struct mmu_notifier_range *range)
>> >> >  {
>> >> > diff --git a/mm/shmem.c b/mm/shmem.c
>> >> > index 2f2e0e618072..e59eb5fafadb 100644
>> >> > --- a/mm/shmem.c
>> >> > +++ b/mm/shmem.c
>> >> > @@ -77,6 +77,7 @@ static struct vfsmount *shm_mnt;
>> >> >  #include <linux/fcntl.h>
>> >> >  #include <uapi/linux/memfd.h>
>> >> >  #include <linux/rmap.h>
>> >> > +#include <linux/mmu_notifier.h>
>> >> >  #include <linux/uuid.h>
>> >> >
>> >> >  #include <linux/uaccess.h>
>> >> > @@ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct
>> vm_fault
>> >> *vmf)
>> >> >  				  gfp, vma, vmf, &ret);
>> >> >  	if (err)
>> >> >  		return vmf_error(err);
>> >> > -	if (folio)
>> >> > +	if (folio) {
>> >> >  		vmf->page = folio_file_page(folio, vmf->pgoff);
>> >> > +		if (ret == VM_FAULT_LOCKED)
>> >> > +			mmu_notifier_update_mapping(vma->vm_mm, vmf-
>> >> >address,
>> >> > +						    page_to_pfn(vmf->page));
>> >> > +	}
>> >> >  	return ret;
>> >> >  }

