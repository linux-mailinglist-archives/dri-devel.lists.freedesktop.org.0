Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A1783B8E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FED010E1AD;
	Tue, 22 Aug 2023 08:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9C710E18A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FziMD/LCsRA7GEgdt9xvmcmsDJRX+FHgkTaC/6H0OSwf24/nIqQEcsHcY2p5kuOgh4Md6qm8R9k4Rv7vXQdoBGzCmd2YVftPg1eJQXvdTf6Ssuf2Ja/N/sbpZ90+Vko4GtNnfygWmfVGv5pca2pn7ZRnYbGuQLDoy4e0DShM0Wl+ZqOruFAQy59jdFsOrAALjruDr5lQ0XnUBJ22WH72iaIMYa6OTeUicp2svP5rn48HHXg6gCXD7MAn9WKeCV9KAQ4xvfBWExojpEGNu0Uwzf3qEaKGll53Pjk72q+XuV231iuF+cvkVFj1v1eYDhtwID+gwjDZuEk0pc1Zsy2aZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVhQU9Xwj5ucctajVmbLs0wBbmmzbslEpEX6f1ZJooQ=;
 b=VIK9it3ZBQhyusI5YzVF++YIb3naChdZEMt1+T/LA27MA86F06hbqPTXIZ+HjNzsuTPCzpRSycjM1DE9XwtKViX2EqEe1oK4tLb86cy5bIf30ph2kOLmNr6Dj2ry1ruwiFP8eciqfspwliVpOLwhfDRC2Zs951WWkMC+so8R1Npft7w6tcROfWRSuWzsr6ITdotRCSPd/db/GKPqBnh0OrRb64dbokq9tLmpCgOSocoTkEO8UpWgXHjJ0u3VtrTwDMgy343n4Ai+MBvYG5xy0ND5iu6A/I//dQyhaXLhQpIP2kL/BTug32M7MxyAaIK87k3lpxMIMX1mAJur5T0Shg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVhQU9Xwj5ucctajVmbLs0wBbmmzbslEpEX6f1ZJooQ=;
 b=S1PbwfXKzQcCcEJ5urNaU4P34z/UxYtWpmIB/OWppCqdgPcj/A6WLg917FvqnJ5G2E7bkZ9X/PrNBRnOd2QcI+Bp/ZuZaJqm3djy1sNFPCrDhDg0EbnekQZDsm3B1epgQGLkCesQOGwpL2szfvwMDtg40S314swg+KVErXXHfUgFysYGSMaWMcHhqhHdr1oClBChu+Z7xCpunb5omp1S9dlHwqc5ekePHH+yJ8uNEVxeAvguC7iHKmh57XI3K1UAhFzyKc6CS1XibGsthfCPAZBP1dCz+gazFM/80wxHeoDEsvmAuEFbe31cqYTc4+oj+9N+0iIc5cTvsP6cCtyUBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM3PR12MB9390.namprd12.prod.outlook.com (2603:10b6:0:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:16:00 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::3bf6:11f3:64d7:2475]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::3bf6:11f3:64d7:2475%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:16:00 +0000
References: <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
 <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMzz2OKbmiD6SKPE@nvidia.com>
 <IA0PR11MB718593A011700F06BD6414E8F80DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZNI4KV+Z7CvffiHI@nvidia.com>
 <IA0PR11MB71857FDD99CAC23C88C9F27CF815A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87h6oswysm.fsf@nvdebian.thelocal>
 <IA0PR11MB71853FB79625A4F2399FFD79F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Date: Tue, 22 Aug 2023 18:15:06 +1000
In-reply-to: <IA0PR11MB71853FB79625A4F2399FFD79F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
Message-ID: <87o7izlcg7.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0043.ausprd01.prod.outlook.com
 (2603:10c6:10:4::31) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM3PR12MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: db199b92-cec0-4bc9-74c2-08dba2e804c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cOQagsrxtQhMmykhzhdF5rX/WGUEMUdrFAgGWGeaJSMBx9H6UeSEjUFuwAGxebWlftxQjMnGRdbNrw+i6bmNXH3zj+Mp1i30iDP2z5ucQxNjN4pgVxnc6SlwcLIvkp5EOfH/JIc1k3eh93QH/AqEZxnvWPPdjT6hRlrE1zzJCzIDpgANA+FdXj0U/WY776rlDn7DXAYtMdIsNK603zi3A0eTnq5+I/PPRzjXxqgcEEC0LzVKu5h6GLdMn1G2sXaE2p74va7eaZLoGcvBO6O6fg4rrNM7Kw9zL4qI80t+0n6UBNCewkzhianJ+nCeH0Mz1upeKZJX2/u6yxgGYQuyqneeamFHsnTP5nWrjkdKiO8u3KRAWsyWu9ka9oZ7V2cuwb38KCdn8J/9FPIWr67sQB3/iC6CJWVHMTb+A1dXFNEgcgP70oWeyWJCIJSnoWIY0F/A0sohKi+zZ9ByjIA/WifTRY/FjemNANTBMtSO9MUNBGloIY0oc8Hqkr2yA5QKzphZikUalzoBnjl96QnXLUA4PhdFtTaZqOaYCqqTB3vN19u92A/oa5hrMUAiHbxd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66556008)(66946007)(9686003)(6512007)(316002)(66476007)(8936002)(8676002)(4326008)(41300700001)(478600001)(38100700002)(6486002)(6506007)(15650500001)(2906002)(7416002)(83380400001)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GVWY77soulzfh2qVvkSkcllVNr26lj/wVREm/oTWFJuFR6pkx5RD2nZcbOis?=
 =?us-ascii?Q?o2H4GQ3mpPe1+ywuPag2T5OGo29LP9+imNuo1rBuGEWf9Din+gMkM+CPx++K?=
 =?us-ascii?Q?fdKGu0bkt7dgeL9tebKWMLiRyrqpz2kY9SDQOIbW8shlInhY1dIalyJzP7HL?=
 =?us-ascii?Q?PGan+hAkg/Gynyq4QbGoHblfiSlKt8YRJpN3ABLPXZ6fIYfJnwT26/eto6V9?=
 =?us-ascii?Q?yZxYItWfEo9u1MZVTwp0UOdvYRLKTaTObRXLUAHBSj98QV05egoe67O6dvQ/?=
 =?us-ascii?Q?WuAxTM9NLBtshkywTBVjjWw2DRYtcWqC6IR/SA3ajztntiwK9d054JZIFQBJ?=
 =?us-ascii?Q?Wpzy6PRurTnXXbrZmVElLI2/9IE+FcKMx0mzbLMoNttBiiXbydHLA9oNXdKB?=
 =?us-ascii?Q?86eDcmGEZTAMAiQFdA4l/wWbS+iKIoqqsL44+SNkNzXJN+j1y+1QVmsT4toL?=
 =?us-ascii?Q?YPW3GYChFxfkq3Hl3mE7/wc0tpScfydkgUC8aXLHlMAxpMfM2cKK7bA44CR9?=
 =?us-ascii?Q?ICvjkf22eBuZZYzI9BYjpxtV2RHrzVjo1jCGCNiZvakGNoWb1VtK5fF3OFtP?=
 =?us-ascii?Q?qGa3eSbY1Qohs/Soz0XfiCTl+mJkuOtyeTlJ2C4is8JJMET473R9dYzDuKFj?=
 =?us-ascii?Q?fNOLQryOmLDgt+Vwh3w1iXonxNJJTQisiwQjp/O2K9EAk2vmQ5wUTaFmXiQZ?=
 =?us-ascii?Q?WsEQEcYjFB75qEtKK+xo2J8vdgS9mEB/dwdIfsv47HgApfYBl/rBojED4g/q?=
 =?us-ascii?Q?9swTlPqXzrhLUL3RdUEXJeeMYICncMD9s+Buo3BleRaXKHBPcx5jHAR0XN+I?=
 =?us-ascii?Q?LEE1kyb6/6Jx8xdqAcWkpSJ6uT2Q7eXGTTO61sS60Oga1ijK71RKm4Yi0KbM?=
 =?us-ascii?Q?LB9fW2x1jpDBnxpRJyAMDfj3Xn1h1DkTGoJjRWD/sNn7dwdht1hdj62N7a/q?=
 =?us-ascii?Q?lqkIwvWmXnc+HxuztgU3efbbeenq3rR10unrR2z3buHnw0gsCV8meqUmu4ZD?=
 =?us-ascii?Q?YC+lKzMF2woqo1t02E/+127QGOrc7VWfDDfdpeDSArRdfcPOvmv4WmpjYSSA?=
 =?us-ascii?Q?oA83yIoNo8rVC9FVEh6f3esrnp12symV/OSD3MZHhfbI/if1kfhqhyn/ydnr?=
 =?us-ascii?Q?Vpdf1oCu2GeDQ8dUj9SaSuPZAGEGlBgVrkeV5P8zihOb4N7Xp3i2fE4uXOn2?=
 =?us-ascii?Q?zs1PLVpogBBAGCtc+X76bLVq8W6zJ5jhU1dhBOKZ/HWcCFp5mBHJGpBOAbYA?=
 =?us-ascii?Q?6oCBcl/NCcbVGxwDksbbOhEp16WthOBhJzaginl8GeOncH5TdwChFiCoQt7L?=
 =?us-ascii?Q?w9syN85b+A0XVqouhfER+LXYQa2/Ys6+C5z7wqwJ83C/PsVYbZSxY4tmRRyH?=
 =?us-ascii?Q?REA8MMji0wyPQD95rKY21FuUW4z6RQ/rcMUVhfMUh4+bDMP91cNOQSd/+UbX?=
 =?us-ascii?Q?S3rxELhwF5IWt5tyBLFLdxAI+ATMf5vmMCs9dOL9XmAWXou7dFBKy2rm1Bn2?=
 =?us-ascii?Q?7IV0BLIB0BDwIEV3ztjB6SrX0xKFUeHoPSY6fW0BIDdKk6mQ3Y5B5Hfq7joM?=
 =?us-ascii?Q?8hnD7o+aCkzleWIeTteZ3MFN41M/1BqsNYT+jAsV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db199b92-cec0-4bc9-74c2-08dba2e804c7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:16:00.1159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y37GXDgUrzhI4fhp89oH3Pmz/wzNt3k3AkI5PCG8ew7tmHOQ0kMC6FE0Ya+EE2io8EC3SB5sbg89bKMgashsvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9390
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


"Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:

> Hi Alistair,
>
>> >> > > > No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the
>> issue.
>> >> > > > Although, I do not have THP enabled (or built-in), shmem does not
>> evict
>> >> > > > the pages after hole punch as noted in the comment in
>> >> shmem_fallocate():
>> >> > >
>> >> > > This is the source of all your problems.
>> >> > >
>> >> > > Things that are mm-centric are supposed to track the VMAs and
>> changes
>> >> to
>> >> > > the PTEs. If you do something in userspace and it doesn't cause the
>> >> > > CPU page tables to change then it certainly shouldn't cause any mmu
>> >> > > notifiers or hmm_range_fault changes.
>> >> > I am not doing anything out of the blue in the userspace. I think the
>> >> behavior
>> >> > I am seeing with shmem (where an invalidation event
>> >> (MMU_NOTIFY_CLEAR)
>> >> > does occur because of a hole punch but the PTEs don't really get
>> updated)
>> >> > can arguably be considered an optimization.
>> >>
>> >> Your explanations don't make sense.
>> >>
>> >> If MMU_NOTIFER_CLEAR was sent but the PTEs were left present then:
>> >>
>> >> > > There should still be an invalidation notifier at some point when the
>> >> > > CPU tables do eventually change, whenever that is. Missing that
>> >> > > notification would be a bug.
>> >> > I clearly do not see any notification getting triggered (from both
>> >> shmem_fault()
>> >> > and hugetlb_fault()) when the PTEs do get updated as the hole is refilled
>> >> > due to writes. Are you saying that there needs to be an invalidation
>> event
>> >> > (MMU_NOTIFY_CLEAR?) dispatched at this point?
>> >>
>> >> You don't get to get shmem_fault in the first place.
>> > What I am observing is that even after MMU_NOTIFY_CLEAR (hole punch)
>> is sent,
>> > hmm_range_fault() finds that the PTEs associated with the hole are still
>> pte_present().
>> > I think it remains this way as long as there are reads on the hole. Once
>> there are
>> > writes, it triggers shmem_fault() which results in PTEs getting updated but
>> without
>> > any notification.
>> 
>> Oh wait, this is shmem. The read from hmm_range_fault() (assuming you
>> specified HMM_PFN_REQ_FAULT) will trigger shmem_fault() due to the
>> missing PTE. 
> When running one of the udmabuf subtests (introduced in the third patch of
> this series), I see that MMU_NOTIFY_CLEAR is sent when a hole is punched.
> As a response, hmm_range_fault() is called from the udmabuf invalidate callback,

Actually I'm suprised that works. If you've setup an interval notifier
and are updating the notifier sequence numbers correctly I would expect
hmm_range_fault() to return -EBUSY until
mmu_notifier_invalidate_range_end() is called.

It might be helpful to post the code you're testing with somewhere but
are you calling mmu_interval_read_begin() to start the critical section
and mmu_interval_set_seq() to update the sequence in another notifier?
I'm not at all convinced calling hmm_range_fault() from a notifier can
be made to work though.

> to walk over the PTEs associated with the hole. When this happens, I noticed that
> the below function returns HMM_PFN_VALID | HMM_PFN_WRITE for all the
> PTEs associated with the hole. 
> static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
>                                                  pte_t pte)
> {
>         if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
>                 return 0;
>         return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
> }
>
> As a result, hmm_pte_need_fault() always returns 0 and shmem_fault()
> never gets triggered despite specifying HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE.
> And, the set of PFNs returned by hmm_range_fault() are the same ones
> that existed before the hole was punched.
>
>> Subsequent writes will just upgrade PTE permissions
>> assuming the read didn't map them RW to begin with. If you want to
>> actually see the hole with hmm_range_fault() don't specify
>> HMM_PFN_REQ_FAULT (or _WRITE).
>> 
>> >>
>> >> If they were marked non-prsent during the CLEAR then the shadow side
>> >> remains non-present until it gets its own fault.
>> >>
>> >> If they were made non-present without an invalidation then that is a
>> >> bug.
>> >>
>> >> > > hmm_range_fault() is the correct API to use if you are working with
>> >> > > notifiers. Do not hack something together using pin_user_pages.
>> >>
>> >> > I noticed that hmm_range_fault() does not seem to be working as
>> expected
>> >> > given that it gets stuck(hangs) while walking hugetlb pages.
>> >>
>> >> You are the first to report that, it sounds like a serious bug. Please
>> >> try to fix it.
>> >>
>> >> > Regardless, as I mentioned above, the lack of notification when PTEs
>> >> > do get updated due to writes is the crux of the issue
>> >> > here. Therefore, AFAIU, triggering an invalidation event or some
>> >> > other kind of notification would help in fixing this issue.
>> >>
>> >> You seem to be facing some kind of bug in the mm, it sounds pretty
>> >> serious, and it almost certainly is a missing invalidation.
>> >>
>> >> Basically, anything that changes a PTE must eventually trigger an
>> >> invalidation. It is illegal to change a PTE from one present value to
>> >> another present value without invalidation notification.
>> >>
>> >> It is not surprising something would be missed here.
>> > As you suggest, it looks like the root-cause of this issue is the missing
>> > invalidation notification when the PTEs are changed from one present
>> 
>> I don't think there's a missing invalidation here. You say you're seeing
>> the MMU_NOTIFY_CLEAR when hole punching which is when the PTE is
>> cleared. When else do you expect a notification?
> Oh, given that we are finding PTEs that are still pte_present() even after
> MMU_NOTIFY_CLEAR is sent, the theory is that another MMU_NOTIFY_CLEAR
> needs to be sent after the PTEs are updated when new pages are faulted-in.
>
> However, it just occurred to me that maybe the behavior I am seeing is not
> unexpected as it might be a timing issue that has to do with when the PTEs
> are walked. Let me explain. Here is what shmem does when a hole is punched:
>                 if ((u64)unmap_end > (u64)unmap_start)
>                         unmap_mapping_range(mapping, unmap_start,
>                                             1 + unmap_end - unmap_start, 0);
>                 shmem_truncate_range(inode, offset, offset + len - 1);
>
> IIUC, the invalidate callback is called from unmap_mapping_range() but
> the page removal does not happen until shmem_truncate_range() gets
> called. So, if I were to call hmm_range_fault() after shmem_truncate_range(),
> I might see different results as the PTEs would probably no longer be present.
> In order to test this theory, I would have to schedule a wq thread func from the
> invalidate callback (to walk the PTEs after a slight delay). I'll try this out when
> I get a chance after addressing some of the locking concerns associated with
> pairing static/dynamic dmabuf exporters and importers.

That sounds plausible. The PTE will actually be cleared in
unmap_mapping_range() after the mmu notifier is called. I'm curious how
hmm_range_fault() passes though.

> Thanks,
> Vivek
>
>> 
>> > value to another. I'd like to fix this issue eventually but I first need to
>> > focus on addressing udmabuf page migration (out of movable zone)
>> > and also look into the locking concerns Daniel mentioned about pairing
>> > static and dynamic dmabuf exporters and importers.
>> >
>> > Thanks,
>> > Vivek

