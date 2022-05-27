Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE153575B
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 03:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C2310E2FD;
	Fri, 27 May 2022 01:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C8710E2FD;
 Fri, 27 May 2022 01:36:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOY704Brudh7TPiiNK8lOAPf/7aaaWW2fywfDGP7hV5kF9QAhjh3ov7DnAYne66wVJQW14+/AbwgKT4Agq1NsXt5QxVncZnE8cc7aWwFV2RiEHzlogWPC1sx1AapeaX3C2tRhP2cNaiuhL4QIcA0WGXwuH+Q7SITCVgu3hGEzedt56AvAzfibsTjr6/nqkUG4T1s6lq3ew2KzjMi/Ze8YvzcBpXYMYeiWY5AltBM8/+JDUEMiBx9ncIsICOC7keUejOa6fMkX1brQcOh34AaRtq4biZR02MVf0rggOAsCP28Mi+JKvDT17F+P99nA/mrUNlRwdb2RRMl2KkHqkr1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVzR4L0pQ0Ruj5IfvG27yAj3M4DdYESeY/+SmcuO9mg=;
 b=QYz8GS0cmwCHLunqs2JXKYj7ybjmRyNnlVPo+1C6uYq5Ur2DcREMcYyv4mora6YM9SVk39GYov8er/Ml61cwZBhPqQXJcNUGOgF32wZsvmhabQmhc4LTiPjIirTxMRfOAjJ6bc+J7R9k5a0EuihfdDZssOJ0E6lMdPL0xnCkSnQAvZ0tHXG2/A7O71qcyqhRawQO5CCL4mo1j353/A4huYYSWQVilr/6+l1T5hCGaqjT2JEkDjE3l8xKrBeJY5kddTcF4Ncjl4fi30qWo8ZUDpXg9tJU3PFNV5kMpzSNVtxwoBYOvcIho33585Db2JdHLEphtpQEYnxjEbQG0Y33NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVzR4L0pQ0Ruj5IfvG27yAj3M4DdYESeY/+SmcuO9mg=;
 b=r1YITTOLv5iUQ33MpA1CJ2PkV5pY5e9T4w+367j+//1Z0Qn/ONSfelvO2prlEsaiyduwgS1prkJWmuVmm7Vb6maD74GhC3CL19iilSQuDQ3lSgFzuknO6ABKuBDFD/BjZlDuubowv38fcjgRCNKc4vW73VXku/7k/xmSFRXFAkS/OKQ3TYA9LJmbKWWEdqd9o7oqdN8mqO45ZM63MnN76kWKkefc9apwFQPhwAe4nqLcG5EPGvT55BYYZI7Uoam1G3jow3OFTPpgAkXvK/06QANntCMkDEVUpa2S5/pAqsnADgZi4I+17NZWf19IdM9fuiEvvtdes3gQrq7Du49OVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 01:36:37 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 01:36:36 +0000
References: <20220524190632.3304-1-alex.sierra@amd.com>
 <20220524190632.3304-3-alex.sierra@amd.com>
 <87leuqf4oj.fsf@nvdebian.thelocal>
 <52fa81b5-c79e-6308-10f9-9304afa10727@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Subject: Re: [PATCH v3 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Fri, 27 May 2022 11:28:15 +1000
In-reply-to: <52fa81b5-c79e-6308-10f9-9304afa10727@amd.com>
Message-ID: <87o7zjiwny.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32062256-c3e2-486f-3425-08da3f815698
X-MS-TrafficTypeDiagnostic: MN0PR12MB6102:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB610257F2B14138727BB4531EDFD89@MN0PR12MB6102.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JnjEVGSxWnVIZQIRcj35zhmO5JTsc3HZUzVewUgzUUWlj7UwHbnkG19Awu84Ze9Wit9lVR/MIe/wrXDrSGq8Z3Mw5zFBFYdzdk7r7YHh2/q5sgsILtK1Ab6q0Kr8POhGp91ru+nQItlxPSEtx969z7THaKrNXS08uRsKcsB660Kz4TMu/hcJ6qEQcxr8ZgAZAYx92SKX/mUTnP2FXtFBOkXIsIRoX6J6vX957ErASQs4LlQYGc2o1nmChkr50le2ySiG1BN1WtSG5oPBnDI4az9OGULcMKLlIjNRIV7EwEDzo5SUUYnsPKsKuNKLpy1M1DvrEfPYYYTlnIIxJsax/89yNq/4CaHRlH4l/1ko2SAzS7cXosbvJ2QdUc/JFhLcuyjUD+/iT4kI7QEekLMVgE/gUbBR4MGZ3vMUpnr8EzY6kku0noEMqITtKxR/RkaO9nI8YCFEgFJ3XsP+Ufh2ekhhQ/TpeTvLAVHaJi+HRyYugzb5PPDtaz3uroZj2YTaVQFAzuk3VKhNp2Q/AeUzwcfjWSPYcscDmIwzkeB25evJVXe2x2v9PX54uei5vNnVL5CXermTAYNXeqB4wJN5NScO3/8L/mZTS4AM7Eegy7Cl6NeQAqxVix1KQT+MI14GV5EzQ0SW5MvmTqV9H7Nvfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(4326008)(66946007)(66476007)(8936002)(6916009)(316002)(8676002)(66556008)(9686003)(6666004)(53546011)(6512007)(26005)(6506007)(38100700002)(6486002)(508600001)(83380400001)(7416002)(5660300002)(30864003)(186003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1FVFKJsXxhjVMKF2VsKLGNzoofDDUiWT6qG+tE5Oxgf6L5KeSuDCQKnhx0cs?=
 =?us-ascii?Q?4MsZp4YzznOxb5H1FYE2OyRlO0rubWhUhJHefE6TZKRP3tuIXQCqzCfAZz76?=
 =?us-ascii?Q?Z+icE5/VaLt3WxaqSAcmQg6YBBbZSEIHgidhNfZkHOR6qRsvIig/hI1Oy9F1?=
 =?us-ascii?Q?V4JzBp0SEGxrwD3x/zbW6nRCwD40+TIkyF4cAZYWs7tWqvh4JO6XZgz1vgP8?=
 =?us-ascii?Q?4JouI9irq4FzIWsrCdSZDGpGj1y8rzaU1UC9N2yoLDlJtaDGrJjcHZ1Sk4Rz?=
 =?us-ascii?Q?1Oz4sv3NZJFiRHTJepCHNxcwYbHqk2eXmRyNgVgrKJicVaP5WkwgViFGMIj5?=
 =?us-ascii?Q?61snqOcZTiT0HtdaBOIbJoIXyM22sFCb3uMj4zNbrTJvB/Ll0+wwzdzZjnuT?=
 =?us-ascii?Q?bsJLxophdPDoG6Q+11T8zxzhYl3uDFT81WB3GSOQsyktJl3zTtL76btScZiv?=
 =?us-ascii?Q?na+KNQehl+kQKKpEY6TO1yl5t6ug6eUH4sO4xQV7nTv3JmIlF1GqdcugASCL?=
 =?us-ascii?Q?46sU6q85vse9RHtplRJNANIyjUPGjtpTor36+FS8yyGA1aTfGObu3OCGQWk9?=
 =?us-ascii?Q?8Y1Qgzhq1Hmtg2h8YbaNKj0TxLcPV2FokmAbeGVHKGIFVEG22tGhdtCFZYiZ?=
 =?us-ascii?Q?YRDmEdMA+HNftdOBYFup47XsnW/Q/Js5gifruIROsvM/ZGdHD3CGd8eK4WJ2?=
 =?us-ascii?Q?yDPRk79h2mZCWOdY3lDGAeh7mxloRzcWPY8Hw7qKypU2GpIU3LgfbnuGWWfI?=
 =?us-ascii?Q?6vHl3qqqmzatoESkptF8gqeRrsxGcB62j0LtTqlSKv9eUxJ2CCDaZhNBdmu9?=
 =?us-ascii?Q?L70OmuIE/NUf2EXEISt77qcUSGHLBYZ6v2rCdv3/3e2Ha6bToCj0D2WYf1oi?=
 =?us-ascii?Q?00vxw9YgZ3cUQEabFpXjdoI9bUVFyGAae2UtDefl4XMvDkB3L7NFQX2xUwK7?=
 =?us-ascii?Q?0mAbsZEVJHWpg2oZP6Gnhc34sDMDPYdkc+XK6MB/re/QFHMAwlIfddC/tAky?=
 =?us-ascii?Q?AeWxPtCQvPlVG37iVQ0w7q/NqvDrFUT1CRQ828qMt1hhkPkIZxxYzTUhiLTv?=
 =?us-ascii?Q?Y5lPIUbZceG5hZwXTkepef3jGU8lc1/RvwP886og32DX1w58s8RAQ4774o7b?=
 =?us-ascii?Q?C1AH5f57tDboRDpB5banAvK4fTO5ILhHrRIC3Q2OpnLwRG153RmggrG7xjAV?=
 =?us-ascii?Q?uzi9WxTltg3qpge0H3piKpZM355ZyqhStC2I0gVDv41sU4QkU9AKkkAORWFe?=
 =?us-ascii?Q?Uuv7/LMyd0A4K6L3XTrnWXsZNni77eikK9gtozUdn25Te0LTVdYmPFnIXoAy?=
 =?us-ascii?Q?o7Gds+9lBd3+Nlxq+PQIW2776rDUMfqu2SvDUDCzyhzKzUn19hra7cC1W7+r?=
 =?us-ascii?Q?8GGADaFbXKKDOMV5Et5R/2Og2L7LWZ31jX+prq3+QZsXo73Y1PxfECvb6b9f?=
 =?us-ascii?Q?Bjb7zCszv6bYusUQO84YG6VegrFGn6wy3g2d88IAwZ7eutEWUXKGsm9UZTT0?=
 =?us-ascii?Q?lIsHeFpB+MmpHlq7KrXgmnkIBGwwwuwK6t7sOQ+YTRSgNrPuyRwq5w9x0bWZ?=
 =?us-ascii?Q?ZfDiy81hSQdJIGuFi7J03PMIh9M3RM5h0avpjLKy9vdrBCdt6eu/fY4KlnYO?=
 =?us-ascii?Q?Lnb6CsxFZjGpbRTGo4XABYXGhmGEsxBwpG06wWoGT3D9x0X4Gf3sbCkr6H3/?=
 =?us-ascii?Q?YVeW7nHTerUI+iZy5zWOt0VHqE8r/MDaD8DEjNEMdOFd/RSHHKEDXoYz4DFC?=
 =?us-ascii?Q?e+DmE3GNwQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32062256-c3e2-486f-3425-08da3f815698
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 01:36:36.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEUR8LxllBFi0kk1tcCtiBvCd+MbPEr7dZ1zhSs1ZUwwhsqIrevs8QBu8fPNk4RMcTq20Kz8VjQXlKVGIxn+vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102
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


"Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com> writes:

> On 5/24/2022 11:11 PM, Alistair Popple wrote:
>> Alex Sierra <alex.sierra@amd.com> writes:
>>
>>> With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
>>> device-managed anonymous pages that are not LRU pages. Although they
>>> behave like normal pages for purposes of mapping in CPU page, and for
>>> COW. They do not support LRU lists, NUMA migration or THP.
>>>
>>> We also introduced a FOLL_LRU flag that adds the same behaviour to
>>> follow_page and related APIs, to allow callers to specify that they
>>> expect to put pages on an LRU list.
>> Continuing the follow up from the thread for v2:
>>
>>>> This means by default GUP can return non-LRU pages. I didn't see
>>>> anywhere that would be a problem but I didn't check everything. Did you
>>>> check this or is there some other reason I've missed that makes this not
>>>> a problem?
>>> I have double checked all gup and pin_user_pages callers and none of them seem
>>> to have interaction with LRU APIs.
>> And actually if I'm understanding things correctly callers of
>> GUP/PUP/follow_page_pte() should already expect to get non-LRU pages
>> returned:
>>
>>      page = vm_normal_page(vma, address, pte);
>>      if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
>>          page = NULL;
>>      if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>>          /*
>>           * Only return device mapping pages in the FOLL_GET or FOLL_PIN
>>           * case since they are only valid while holding the pgmap
>>           * reference.
>>           */
>>          *pgmap = get_dev_pagemap(pte_pfn(pte), *pgmap);
>>          if (*pgmap)
>>              page = pte_page(pte);
>>
>> Which I think makes FOLL_LRU confusing, because if understand correctly
>> even with FOLL_LRU it is still possible for follow_page_pte() to return
>> a non-LRU page. Could we do something like this to make it consistent:
>>
>>      if ((flags & FOLL_LRU) && (page && is_zone_device_page(page) ||
>>          !page && pte_devmap(pte)))
>
> Hi Alistair,
> Not sure if this suggestion is a replacement for the first or the second
> condition in the snip code above. We know device coherent type will not
> be set with devmap. So we could do the following:

Sorry, I must not have been clear enough. My understanding is if the
following condition is true:

>>      if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {

Then follow_page_pte() could return a non-LRU page even when FOLL_LRU is
specified (because I think a devmap page is a non-LRU page). That seems
confusing, so for consistency I was suggesting we should not return
devmap pages for FOLL_LRU.

To be clear I don't think there is an actual problem here atm, but the
inconsistency could easily lead to one in future.

>  if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
> -	page = NULL;
> +	goto no_page;
>
> Regards,
> Alex Sierra
>
>>
>> Looking at callers that currently use FOLL_LRU I don't think this would
>> change any behaviour as they already filter out devmap through various
>> other means.
>>
>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> ---
>>>   fs/proc/task_mmu.c | 2 +-
>>>   include/linux/mm.h | 3 ++-
>>>   mm/gup.c           | 2 ++
>>>   mm/huge_memory.c   | 2 +-
>>>   mm/khugepaged.c    | 9 ++++++---
>>>   mm/ksm.c           | 6 +++---
>>>   mm/madvise.c       | 4 ++--
>>>   mm/memory.c        | 9 ++++++++-
>>>   mm/mempolicy.c     | 2 +-
>>>   mm/migrate.c       | 4 ++--
>>>   mm/mlock.c         | 2 +-
>>>   mm/mprotect.c      | 2 +-
>>>   12 files changed, 30 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>>> index f46060eb91b5..5d620733f173 100644
>>> --- a/fs/proc/task_mmu.c
>>> +++ b/fs/proc/task_mmu.c
>>> @@ -1785,7 +1785,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
>>>   		return NULL;
>>>
>>>   	page = vm_normal_page(vma, addr, pte);
>>> -	if (!page)
>>> +	if (!page || is_zone_device_page(page))
>>>   		return NULL;
>>>
>>>   	if (PageReserved(page))
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index 9f44254af8ce..d7f253a0c41e 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -601,7 +601,7 @@ struct vm_operations_struct {
>>>   #endif
>>>   	/*
>>>   	 * Called by vm_normal_page() for special PTEs to find the
>>> -	 * page for @addr.  This is useful if the default behavior
>>> +	 * page for @addr. This is useful if the default behavior
>>>   	 * (using pte_page()) would not find the correct page.
>>>   	 */
>>>   	struct page *(*find_special_page)(struct vm_area_struct *vma,
>>> @@ -2929,6 +2929,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
>>>   #define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
>>>   #define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
>>>   #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
>>> +#define FOLL_LRU        0x1000  /* return only LRU (anon or page cache) */
>>>   #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
>>>   #define FOLL_COW	0x4000	/* internal GUP flag */
>>>   #define FOLL_ANON	0x8000	/* don't do file mappings */
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 501bc150792c..c9cbac06bcc5 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -479,6 +479,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>>>   	}
>>>
>>>   	page = vm_normal_page(vma, address, pte);
>>> +	if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
>>> +		page = NULL;
>>>   	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>>>   		/*
>>>   		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 910a138e9859..eed80696c5fd 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -2856,7 +2856,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
>>>   		}
>>>
>>>   		/* FOLL_DUMP to ignore special (like zero) pages */
>>> -		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
>>> +		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>>>
>>>   		if (IS_ERR(page))
>>>   			continue;
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index a4e5eaf3eb01..8bf4126b6b9c 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -627,7 +627,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
>>>   			goto out;
>>>   		}
>>>   		page = vm_normal_page(vma, address, pteval);
>>> -		if (unlikely(!page)) {
>>> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>>>   			result = SCAN_PAGE_NULL;
>>>   			goto out;
>>>   		}
>>> @@ -1276,7 +1276,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
>>>   			writable = true;
>>>
>>>   		page = vm_normal_page(vma, _address, pteval);
>>> -		if (unlikely(!page)) {
>>> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>>>   			result = SCAN_PAGE_NULL;
>>>   			goto out_unmap;
>>>   		}
>>> @@ -1484,7 +1484,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>>>   			goto abort;
>>>
>>>   		page = vm_normal_page(vma, addr, *pte);
>>> -
>>> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
>>> +			page = NULL;
>>>   		/*
>>>   		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
>>>   		 * page table, but the new page will not be a subpage of hpage.
>>> @@ -1502,6 +1503,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>>>   		if (pte_none(*pte))
>>>   			continue;
>>>   		page = vm_normal_page(vma, addr, *pte);
>>> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
>>> +			goto abort;
>>>   		page_remove_rmap(page, vma, false);
>>>   	}
>>>
>>> diff --git a/mm/ksm.c b/mm/ksm.c
>>> index 063a48eeb5ee..f16056efca21 100644
>>> --- a/mm/ksm.c
>>> +++ b/mm/ksm.c
>>> @@ -474,7 +474,7 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr)
>>>   	do {
>>>   		cond_resched();
>>>   		page = follow_page(vma, addr,
>>> -				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE);
>>> +				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE | FOLL_LRU);
>>>   		if (IS_ERR_OR_NULL(page))
>>>   			break;
>>>   		if (PageKsm(page))
>>> @@ -559,7 +559,7 @@ static struct page *get_mergeable_page(struct rmap_item *rmap_item)
>>>   	if (!vma)
>>>   		goto out;
>>>
>>> -	page = follow_page(vma, addr, FOLL_GET);
>>> +	page = follow_page(vma, addr, FOLL_GET | FOLL_LRU);
>>>   	if (IS_ERR_OR_NULL(page))
>>>   		goto out;
>>>   	if (PageAnon(page)) {
>>> @@ -2288,7 +2288,7 @@ static struct rmap_item *scan_get_next_rmap_item(struct page **page)
>>>   		while (ksm_scan.address < vma->vm_end) {
>>>   			if (ksm_test_exit(mm))
>>>   				break;
>>> -			*page = follow_page(vma, ksm_scan.address, FOLL_GET);
>>> +			*page = follow_page(vma, ksm_scan.address, FOLL_GET | FOLL_LRU);
>>>   			if (IS_ERR_OR_NULL(*page)) {
>>>   				ksm_scan.address += PAGE_SIZE;
>>>   				cond_resched();
>>> diff --git a/mm/madvise.c b/mm/madvise.c
>>> index 1873616a37d2..e9c24c834e98 100644
>>> --- a/mm/madvise.c
>>> +++ b/mm/madvise.c
>>> @@ -413,7 +413,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>>>   			continue;
>>>
>>>   		page = vm_normal_page(vma, addr, ptent);
>>> -		if (!page)
>>> +		if (!page || is_zone_device_page(page))
>>>   			continue;
>>>
>>>   		/*
>>> @@ -628,7 +628,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>>>   		}
>>>
>>>   		page = vm_normal_page(vma, addr, ptent);
>>> -		if (!page)
>>> +		if (!page || is_zone_device_page(page))
>>>   			continue;
>>>
>>>   		/*
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index 76e3af9639d9..571a26805ee1 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -621,6 +621,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>>>   		if (is_zero_pfn(pfn))
>>>   			return NULL;
>>>   		if (pte_devmap(pte))
>>> +/*
>>> + * NOTE: New uers of ZONE_DEVICE will not set pte_devmap() and will have
>>> + * refcounts incremented on their struct pages when they are inserted into
>>> + * PTEs, thus they are safe to return here. Legacy ZONE_DEVICE pages that set
>>> + * pte_devmap() do not have refcounts. Example of legacy ZONE_DEVICE is
>>> + * MEMORY_DEVICE_FS_DAX type in pmem or virtio_fs drivers.
>>> + */
>>>   			return NULL;
>>>
>>>   		print_bad_pte(vma, addr, pte, NULL);
>>> @@ -4422,7 +4429,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
>>>   	pte = pte_modify(old_pte, vma->vm_page_prot);
>>>
>>>   	page = vm_normal_page(vma, vmf->address, pte);
>>> -	if (!page)
>>> +	if (!page || is_zone_device_page(page))
>>>   		goto out_map;
>>>
>>>   	/* TODO: handle PTE-mapped THP */
>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>> index 8c74107a2b15..e32edbecb0cd 100644
>>> --- a/mm/mempolicy.c
>>> +++ b/mm/mempolicy.c
>>> @@ -528,7 +528,7 @@ static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
>>>   		if (!pte_present(*pte))
>>>   			continue;
>>>   		page = vm_normal_page(vma, addr, *pte);
>>> -		if (!page)
>>> +		if (!page || is_zone_device_page(page))
>>>   			continue;
>>>   		/*
>>>   		 * vm_normal_page() filters out zero pages, but there might
>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>> index 6c31ee1e1c9b..c5d50e96ecd7 100644
>>> --- a/mm/migrate.c
>>> +++ b/mm/migrate.c
>>> @@ -1611,7 +1611,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
>>>   		goto out;
>>>
>>>   	/* FOLL_DUMP to ignore special (like zero) pages */
>>> -	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
>>> +	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>>>
>>>   	err = PTR_ERR(page);
>>>   	if (IS_ERR(page))
>>> @@ -1802,7 +1802,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
>>>   			goto set_status;
>>>
>>>   		/* FOLL_DUMP to ignore special (like zero) pages */
>>> -		page = follow_page(vma, addr, FOLL_DUMP);
>>> +		page = follow_page(vma, addr, FOLL_DUMP | FOLL_LRU);
>>>
>>>   		err = PTR_ERR(page);
>>>   		if (IS_ERR(page))
>>> diff --git a/mm/mlock.c b/mm/mlock.c
>>> index 716caf851043..b14e929084cc 100644
>>> --- a/mm/mlock.c
>>> +++ b/mm/mlock.c
>>> @@ -333,7 +333,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>>>   		if (!pte_present(*pte))
>>>   			continue;
>>>   		page = vm_normal_page(vma, addr, *pte);
>>> -		if (!page)
>>> +		if (!page || is_zone_device_page(page))
>>>   			continue;
>>>   		if (PageTransCompound(page))
>>>   			continue;
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index b69ce7a7b2b7..a6f3587ea29a 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -91,7 +91,7 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>>>   					continue;
>>>
>>>   				page = vm_normal_page(vma, addr, oldpte);
>>> -				if (!page || PageKsm(page))
>>> +				if (!page || is_zone_device_page(page) || PageKsm(page))
>>>   					continue;
>>>
>>>   				/* Also skip shared copy-on-write pages */
