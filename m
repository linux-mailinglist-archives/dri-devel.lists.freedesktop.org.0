Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79C535B56
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 10:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE42710E398;
	Fri, 27 May 2022 08:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1105C10E290;
 Fri, 27 May 2022 08:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNgg75KtFq1cjKFkggxi4n5f2tMTu4WIQZv12E22FiBWkq1Nye0E43Zj1oM9PaAEDObrPSZt0/6VyNIlD1sHJ8Zr+VWmvXDzBY2lXFVmV5WYKx3n5sD0tp6vk2MopuLhXhSMUeKT4BKnrY24JOMCRWPvFN8gU1maq+9JduLJU+SZ4XVGZYZyzjNrP6u6Ir8oY6RVNzFY6wF5N3Y0p9fanB1aYwQHoovsoOTws4A1fjLvyYoRolGFuNDBmkdvge1JvJp7fHe3HHNQmrC42r/8XIe7Pk8+Su8XxIUU+U10Pzc2qn2KBAq/IYRZ2CEbuuXI29nn/icBBCOQ/WoS5hz5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyX7auqOZxEG9qRK3vYhQwBT1ani5seAI/SWjzaT6G0=;
 b=YM4F0O8PIBhUu7rAIRw2OmgWRFVxkNzj//loff3aiJncynBQ9PXm8VKXM+WFRKR3zmTpfGgJOXtaUjKLFMgKuKdKWwyp25b6DvT46CIYLQZHQB2IL+YG8eF/YWINye4YsLgrvUT2X5xxWJyasFYitZRIEuwvQfIfgQc27h9SXxu5506MwebNKLVUSyX2tpDMWnhnTbOX9H6MCLGycY10gXVPPujhuazKRUh8JphoqJ0/SrcoBCfzEZ9sGwPrNK0HU0giQSfUuJCOKB3g9dbMTO7SMlMUMZlcXyrxO/1Cvf3O/wkFBGhf1z1t91PF1h34BEjBUh1N6wXYkh1enqK+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyX7auqOZxEG9qRK3vYhQwBT1ani5seAI/SWjzaT6G0=;
 b=SOrIHwdkLtw9zFHtyKEgr6taPYuPL5cGsUc041iYetSASC6/KBYL93jKXfoHiJl2MW83Jty4fFcd+mIg6LBvgs9ACPyW5jg6aqXiscPTJ5se8kEeeU290xGyYPbTknxwRCReJEYnIQXsGXSy40niaAQycsyC02w2sC2m/YNiLGRcoc5z6cWPCKwHxGg7f7DPanQTspqBOeKVOkffJckqoslZk7PC5iPXAUZV+KZX9OnQutZh0IR8AfItbXmS5UyGokceYvu8LL8sgGKY0/5g8dyjHcGPx/HfoomWQXET3Vm0q6RLfGxDlNk0f6nmvjAa7IvXiqkvBMma9K4q+l3GIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 08:20:14 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 08:20:14 +0000
References: <20220524190632.3304-1-alex.sierra@amd.com>
 <20220524190632.3304-3-alex.sierra@amd.com>
 <87leuqf4oj.fsf@nvdebian.thelocal>
 <a3619730-7aa8-1f0f-c524-bf37f6fd5125@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v3 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Date: Fri, 27 May 2022 18:02:11 +1000
In-reply-to: <a3619730-7aa8-1f0f-c524-bf37f6fd5125@amd.com>
Message-ID: <87tu9b9ykm.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY6PR01CA0149.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::10) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2cd54f9-c437-418b-624b-08da3fb9b987
X-MS-TrafficTypeDiagnostic: CY5PR12MB6455:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB6455198D2874C7617728F3B6DFD89@CY5PR12MB6455.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vZkpnL7eS3TVNhY8Im/tgT3oys9tFrs15pj81Og5cUWJFnDxCJ9Dp2Tt9KRSJLw2V5rp4bQknsvl7O+7eziiVS8az8UPwZ3LGI3pm8ErDfJjs3OBhiHBRLEcCGbAFa7jQbPRD+dyP7d8ExjhflYsFHUy3h1Vtz9tAsejYqzA0seghVwATJ2IJFZtiZRWTPjf7KCyFREjc6VBtMrCP+PnE7FoBYrf8hWD6TBYyN2BvUeoKIfXEuwVackSjUM0iAD8+8mvtlzOKEdGA4knqxkmuCnh2LAQXjBd3lDpq6Nd6cSRBGHRcjHHa37/2kaKslUmsuVxDq9sWD7bulXlk8aq7fjPxd13AsUp+qFzztKlfJQbeU89HDjeZKSM6LtRXDTNS670WK+3ScmzSJM8Jf/l4kZhFZeVjLTL6xvOBZKGsavUq/EEjcZUypVOECgziqsdcysKDnHGvy2RaxRFFC05SvuLfNySsavqjJb2w59j7SDBaNS+n4las08KS9SU1dQkqbzIz2j9Ks7QHKPYRspJlGq52rEa4D9pgJPDV5hfDg79+cwnxOSm77vzVkdIySlvpWJOeqb9gszLcP0yYHJcam2eC2oYKR5rnJ678PHyTHWNrXS3Sk1/wIBfQELdIp1lZIPD2JPutGJujIl37kVQxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(186003)(26005)(6512007)(9686003)(6506007)(316002)(508600001)(6666004)(8936002)(2906002)(4326008)(86362001)(66476007)(66556008)(66946007)(6916009)(5660300002)(30864003)(7416002)(38100700002)(83380400001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pkanFmaTRvTXU5NlBScEdJRVRMOERnSEJrZ0lqVk8xc0trbjJSc1RLTkJD?=
 =?utf-8?B?a0RYdlF3Q3ZIenJhdEUwSTM0SkFYK014cEdGcFRoMXpFR214Qi9FZzdhZDVG?=
 =?utf-8?B?S2NIY05VM29yNDVkejk1ZjByT1R5YVdLTmdFclNiekVDTmdwbXV2K1dwZXJX?=
 =?utf-8?B?ZkdDenpJYTQ0eWNUVkhtK1FMbFREU0R5ODA0RkhJL1VQZXpOZHh0YTNXTksx?=
 =?utf-8?B?S1JvcHdNQ2NYSDBsZS8vcE5rZWtaNHNtSitaVS9kd3lFcWZXZFVnMUNiM1o1?=
 =?utf-8?B?OTJaWXNSRTRvTlRiNWt6eGxOcCtocWttaW5kZm1KWnl2ZTUyT3FHR1I5Uno0?=
 =?utf-8?B?cWVhcDVidkxoV3NpUHpGLytPVStoVi9iMHlMYUprVkd5WFVqN09ZSXJldzJU?=
 =?utf-8?B?eUE4Q2FIVVc3amxRb09HcERCSWJrRmVJcE9NSjQ4L0dxaElGVnB1ejdldGtC?=
 =?utf-8?B?L1FUQ2VSQ3ByZjZGWEptcGdUdHlkOWNPbStEbnpPd3k2SFZmcjg1cm8yZVNX?=
 =?utf-8?B?R2dvSjhDUFcvNTRwcmlRcWZpakNraHlYaHJ3akZhKy9iV3BHUW5sL2pqWGpY?=
 =?utf-8?B?TUJmWlZuZmxYWVFGSTdPTFViQkQ4My9DSjI3MTcyTjFUVUs4MUlQb2VXWEti?=
 =?utf-8?B?Z1VsalhEc3p1M0VCTXFicHNVN0dMRjA3RW4wYVREbmtMMG9tMm9QVW1vUjgz?=
 =?utf-8?B?S3g0SWtWcUxQMTY2ZWNsVTQ3NEIzdzEwaUZyRVJVQ0ZsbWhndmJSd2k2STA1?=
 =?utf-8?B?Qk9kZStrMDFlZjU1N1hCV0NmVk9TLzc2ODZrZnZlRzI1dUNuT0tYUyt4WTZ6?=
 =?utf-8?B?eER6YWpIZSsxeWFyclNXenZuWVh3MFJGYjNNa1FGdzBHOHdjVmZDdVhvZmJz?=
 =?utf-8?B?ZTJINkxiUE5oeGVJMW9OTEVvRXh6K2RxVlM2NG5ENGJiQjBXY1U3VnR6QTND?=
 =?utf-8?B?Zi9rZkRIZ0dDNW5QVE9FODVwZTBIU3BCNkZBcUJFd3ZPM0lWMnZvRHBuRUd5?=
 =?utf-8?B?R2t4bUw5L1prR2swVEZSL3ZSK28yL1F1VUJHZ1prVmJ3Y0dqZC9KZnB1OHdm?=
 =?utf-8?B?YjJpOVlWeVpPaGxZd1krRDd5a3Y4OGt0MXh5Y1BEbjQvSHBoWGFWYWN4Nlpy?=
 =?utf-8?B?d0JXOGtyWm1OTGxRRkpzU0VwbVBrQ28xeU95ZmxjUHUyOUxLSDkrdElmbFhi?=
 =?utf-8?B?ZDlGNTk5Y3Rpa3VFemVQekJVQkhvaDlBZzBiaE42dFpSTk9DM2NTbVZoZnF5?=
 =?utf-8?B?MzFRQnJZS2JXdGhTKzJ5YklYSkdQL1R1V3JyUTQ3SWlGOW9YcENxekU5NExw?=
 =?utf-8?B?c3NVT0MwSjQyU3Bsb21lcEwwVm5HK3cvRXE3c04ybjhmVENjK25RdjRJQ3d3?=
 =?utf-8?B?UGlCdjU5OGVlL3hLSXJvc1BJNTJqcXljaEpxMVdJbk5kTmFOWUlWcC9YWmdp?=
 =?utf-8?B?c3BZRTJnZUZ4b0xPS0NOejBTbU50dUpMWThrNmd0dFFYL0xTNXFOSU5wWDdi?=
 =?utf-8?B?Qm9tTFMrUDVMMjR3aDQ5N05iNjMwRm82bWxJYTI0bkRUd0Joelc5MjcyRW1R?=
 =?utf-8?B?RWtqb3pjQnNaMGI1UmdmSEZkQUYyQ2tmcFo3TVduRnNWWk4yNDdiWCs3WXNh?=
 =?utf-8?B?K2xiRUZweXA0bENJdldNbHpiRFFIRzc0RklTaVhqRnBFeFR5SnVyRWkxVFB1?=
 =?utf-8?B?cnVTVXhHbHBKOUJIL2oyV0Q0Zmh0RkZpUE1HdDNhZW5Rb1pDL3ZLSXZvMVJZ?=
 =?utf-8?B?cU51Yk9VMHVaUXBHNkwzV1VVbGk4R2ZjWVUrQXFQa1FpN1VMeG5jcHNRNDEw?=
 =?utf-8?B?WmpsRzBadlRteWxwUnRtOUlWK1RqMktuc3JLeXJ5eTRYRWE5Um9aWnZxNGhz?=
 =?utf-8?B?cnp1eE5ucEVMemFrZnZhdk42bE9lM2JYRHNkRHhKSjN2Y0M2UnV2ejhUcjZ6?=
 =?utf-8?B?b3o4aHgzUVN3LzNHZmFOTDhtR1NYSE1sMHY0ajRRVldjNzNTRHh1a0UrSkVH?=
 =?utf-8?B?TURrWmtBdVNyZ1NRQVZrc3ZjN0cyVFkwQjNJNzErYlRSeGVoOTViVHUxRFhK?=
 =?utf-8?B?YlBPbjB6Y1hGUVRMcjhLQWxrb2s5TzJpb0dUcXNDY29sTThLd2ZYNmR0K0pK?=
 =?utf-8?B?WDg2WWlNK0ttT1dLUUd5OVY0bXlBampoa1d5WU5FNzQxNmVyNVZMdTYzWktw?=
 =?utf-8?B?K2NyMTBZaUl1YU1mNlRxbzdVWFRGOWFZQjhxTzhnMytSaTdFbXRNaWMwVmV0?=
 =?utf-8?B?Lzdkcm9ReUF1bG9Kc1JSNUk0SHdGNWNIUndOdmFNRkRwYlJ5UHZZZXc3Rzdo?=
 =?utf-8?B?a0lQSWVlaWZINTByRHBaZ2xETnlwRVBPS1VxRThtOUdHY1plYTR0UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cd54f9-c437-418b-624b-08da3fb9b987
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 08:20:14.3472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0b3cMDzySRXnBvE1bIw59yTElki4t01Wq2Zx+1V5jBr2JyJCww8JI8aTXhIBkEoIcf944CbZu9JvCFGQGvvkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6455
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, david@redhat.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Felix Kuehling <felix.kuehling@amd.com> writes:

> Am 2022-05-25 um 00:11 schrieb Alistair Popple:
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
>>>> anywhere that would be a problem but I didn't check everything. Did yo=
u
>>>> check this or is there some other reason I've missed that makes this n=
ot
>>>> a problem?
>>> I have double checked all gup and pin_user_pages callers and none of th=
em seem
>>> to have interaction with LRU APIs.
>> And actually if I'm understanding things correctly callers of
>> GUP/PUP/follow_page_pte() should already expect to get non-LRU pages
>> returned:
>>
>>      page =3D vm_normal_page(vma, address, pte);
>>      if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
>>          page =3D NULL;
>>      if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>>          /*
>>           * Only return device mapping pages in the FOLL_GET or FOLL_PIN
>>           * case since they are only valid while holding the pgmap
>>           * reference.
>>           */
>>          *pgmap =3D get_dev_pagemap(pte_pfn(pte), *pgmap);
>>          if (*pgmap)
>>              page =3D pte_page(pte);
>>
>> Which I think makes FOLL_LRU confusing, because if understand correctly
>> even with FOLL_LRU it is still possible for follow_page_pte() to return
>> a non-LRU page. Could we do something like this to make it consistent:
>>
>>      if ((flags & FOLL_LRU) && (page && is_zone_device_page(page) ||
>>          !page && pte_devmap(pte)))
>
> This alone won't help if it still goes into the if (!page && pte_devmap(p=
te)
> ...) afterwards. I think what you're suggesting is:
>
> +	if ((flags & FOLL_LRU) && (page && is_zone_device_page(page) ||
> +				   !page && pte_devmap(pte)))
> +		page =3D NULL;
> -	|if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) { + e=
lse
>      if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) { |
>
> Is that what you meant?

Oh my bad. Yes, that is what I meant. Although as Alex pointed out we
should goto no_page as well. However we also need to fix up the return
code, because returning NULL will cause GUP to try and fault the page in
when it already possibly exists. So I think something like this should
work:

      page =3D vm_normal_page(vma, address, pte);
      if ((flags & FOLL_LRU) && (page && is_zone_device_page(page) ||
          !page && pte_devmap(pte))) {
          page =3D ERR_PTR(-EEXIST);
          goto out;
      } else if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN)=
)) {
          /*
           * Only return device mapping pages in the FOLL_GET or FOLL_PIN
           * case since they are only valid while holding the pgmap
           * reference.
           */
          *pgmap =3D get_dev_pagemap(pte_pfn(pte), *pgmap);
          if (*pgmap)
              page =3D pte_page(pte);

> Regards,
> =C2=A0 Felix
>
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
>>> @@ -1785,7 +1785,7 @@ static struct page *can_gather_numa_stats(pte_t p=
te, struct vm_area_struct *vma,
>>>   		return NULL;
>>>
>>>   	page =3D vm_normal_page(vma, addr, pte);
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
>>> @@ -2929,6 +2929,7 @@ struct page *follow_page(struct vm_area_struct *v=
ma, unsigned long address,
>>>   #define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
>>>   #define FOLL_MIGRATION	0x400	/* wait for page to replace migration en=
try */
>>>   #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
>>> +#define FOLL_LRU        0x1000  /* return only LRU (anon or page cache=
) */
>>>   #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
>>>   #define FOLL_COW	0x4000	/* internal GUP flag */
>>>   #define FOLL_ANON	0x8000	/* don't do file mappings */
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 501bc150792c..c9cbac06bcc5 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -479,6 +479,8 @@ static struct page *follow_page_pte(struct vm_area_=
struct *vma,
>>>   	}
>>>
>>>   	page =3D vm_normal_page(vma, address, pte);
>>> +	if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
>>> +		page =3D NULL;
>>>   	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>>>   		/*
>>>   		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 910a138e9859..eed80696c5fd 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -2856,7 +2856,7 @@ static int split_huge_pages_pid(int pid, unsigned=
 long vaddr_start,
>>>   		}
>>>
>>>   		/* FOLL_DUMP to ignore special (like zero) pages */
>>> -		page =3D follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
>>> +		page =3D follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>>>
>>>   		if (IS_ERR(page))
>>>   			continue;
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index a4e5eaf3eb01..8bf4126b6b9c 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -627,7 +627,7 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
>>>   			goto out;
>>>   		}
>>>   		page =3D vm_normal_page(vma, address, pteval);
>>> -		if (unlikely(!page)) {
>>> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>>>   			result =3D SCAN_PAGE_NULL;
>>>   			goto out;
>>>   		}
>>> @@ -1276,7 +1276,7 @@ static int khugepaged_scan_pmd(struct mm_struct *=
mm,
>>>   			writable =3D true;
>>>
>>>   		page =3D vm_normal_page(vma, _address, pteval);
>>> -		if (unlikely(!page)) {
>>> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>>>   			result =3D SCAN_PAGE_NULL;
>>>   			goto out_unmap;
>>>   		}
>>> @@ -1484,7 +1484,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm=
, unsigned long addr)
>>>   			goto abort;
>>>
>>>   		page =3D vm_normal_page(vma, addr, *pte);
>>> -
>>> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
>>> +			page =3D NULL;
>>>   		/*
>>>   		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
>>>   		 * page table, but the new page will not be a subpage of hpage.
>>> @@ -1502,6 +1503,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm=
, unsigned long addr)
>>>   		if (pte_none(*pte))
>>>   			continue;
>>>   		page =3D vm_normal_page(vma, addr, *pte);
>>> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
>>> +			goto abort;
>>>   		page_remove_rmap(page, vma, false);
>>>   	}
>>>
>>> diff --git a/mm/ksm.c b/mm/ksm.c
>>> index 063a48eeb5ee..f16056efca21 100644
>>> --- a/mm/ksm.c
>>> +++ b/mm/ksm.c
>>> @@ -474,7 +474,7 @@ static int break_ksm(struct vm_area_struct *vma, un=
signed long addr)
>>>   	do {
>>>   		cond_resched();
>>>   		page =3D follow_page(vma, addr,
>>> -				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE);
>>> +				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE | FOLL_LRU);
>>>   		if (IS_ERR_OR_NULL(page))
>>>   			break;
>>>   		if (PageKsm(page))
>>> @@ -559,7 +559,7 @@ static struct page *get_mergeable_page(struct rmap_=
item *rmap_item)
>>>   	if (!vma)
>>>   		goto out;
>>>
>>> -	page =3D follow_page(vma, addr, FOLL_GET);
>>> +	page =3D follow_page(vma, addr, FOLL_GET | FOLL_LRU);
>>>   	if (IS_ERR_OR_NULL(page))
>>>   		goto out;
>>>   	if (PageAnon(page)) {
>>> @@ -2288,7 +2288,7 @@ static struct rmap_item *scan_get_next_rmap_item(=
struct page **page)
>>>   		while (ksm_scan.address < vma->vm_end) {
>>>   			if (ksm_test_exit(mm))
>>>   				break;
>>> -			*page =3D follow_page(vma, ksm_scan.address, FOLL_GET);
>>> +			*page =3D follow_page(vma, ksm_scan.address, FOLL_GET | FOLL_LRU);
>>>   			if (IS_ERR_OR_NULL(*page)) {
>>>   				ksm_scan.address +=3D PAGE_SIZE;
>>>   				cond_resched();
>>> diff --git a/mm/madvise.c b/mm/madvise.c
>>> index 1873616a37d2..e9c24c834e98 100644
>>> --- a/mm/madvise.c
>>> +++ b/mm/madvise.c
>>> @@ -413,7 +413,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t =
*pmd,
>>>   			continue;
>>>
>>>   		page =3D vm_normal_page(vma, addr, ptent);
>>> -		if (!page)
>>> +		if (!page || is_zone_device_page(page))
>>>   			continue;
>>>
>>>   		/*
>>> @@ -628,7 +628,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsig=
ned long addr,
>>>   		}
>>>
>>>   		page =3D vm_normal_page(vma, addr, ptent);
>>> -		if (!page)
>>> +		if (!page || is_zone_device_page(page))
>>>   			continue;
>>>
>>>   		/*
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index 76e3af9639d9..571a26805ee1 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -621,6 +621,13 @@ struct page *vm_normal_page(struct vm_area_struct =
*vma, unsigned long addr,
>>>   		if (is_zero_pfn(pfn))
>>>   			return NULL;
>>>   		if (pte_devmap(pte))
>>> +/*
>>> + * NOTE: New uers of ZONE_DEVICE will not set pte_devmap() and will ha=
ve
>>> + * refcounts incremented on their struct pages when they are inserted =
into
>>> + * PTEs, thus they are safe to return here. Legacy ZONE_DEVICE pages t=
hat set
>>> + * pte_devmap() do not have refcounts. Example of legacy ZONE_DEVICE i=
s
>>> + * MEMORY_DEVICE_FS_DAX type in pmem or virtio_fs drivers.
>>> + */
>>>   			return NULL;
>>>
>>>   		print_bad_pte(vma, addr, pte, NULL);
>>> @@ -4422,7 +4429,7 @@ static vm_fault_t do_numa_page(struct vm_fault *v=
mf)
>>>   	pte =3D pte_modify(old_pte, vma->vm_page_prot);
>>>
>>>   	page =3D vm_normal_page(vma, vmf->address, pte);
>>> -	if (!page)
>>> +	if (!page || is_zone_device_page(page))
>>>   		goto out_map;
>>>
>>>   	/* TODO: handle PTE-mapped THP */
>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>> index 8c74107a2b15..e32edbecb0cd 100644
>>> --- a/mm/mempolicy.c
>>> +++ b/mm/mempolicy.c
>>> @@ -528,7 +528,7 @@ static int queue_pages_pte_range(pmd_t *pmd, unsign=
ed long addr,
>>>   		if (!pte_present(*pte))
>>>   			continue;
>>>   		page =3D vm_normal_page(vma, addr, *pte);
>>> -		if (!page)
>>> +		if (!page || is_zone_device_page(page))
>>>   			continue;
>>>   		/*
>>>   		 * vm_normal_page() filters out zero pages, but there might
>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>> index 6c31ee1e1c9b..c5d50e96ecd7 100644
>>> --- a/mm/migrate.c
>>> +++ b/mm/migrate.c
>>> @@ -1611,7 +1611,7 @@ static int add_page_for_migration(struct mm_struc=
t *mm, unsigned long addr,
>>>   		goto out;
>>>
>>>   	/* FOLL_DUMP to ignore special (like zero) pages */
>>> -	page =3D follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
>>> +	page =3D follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>>>
>>>   	err =3D PTR_ERR(page);
>>>   	if (IS_ERR(page))
>>> @@ -1802,7 +1802,7 @@ static void do_pages_stat_array(struct mm_struct =
*mm, unsigned long nr_pages,
>>>   			goto set_status;
>>>
>>>   		/* FOLL_DUMP to ignore special (like zero) pages */
>>> -		page =3D follow_page(vma, addr, FOLL_DUMP);
>>> +		page =3D follow_page(vma, addr, FOLL_DUMP | FOLL_LRU);
>>>
>>>   		err =3D PTR_ERR(page);
>>>   		if (IS_ERR(page))
>>> diff --git a/mm/mlock.c b/mm/mlock.c
>>> index 716caf851043..b14e929084cc 100644
>>> --- a/mm/mlock.c
>>> +++ b/mm/mlock.c
>>> @@ -333,7 +333,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned lon=
g addr,
>>>   		if (!pte_present(*pte))
>>>   			continue;
>>>   		page =3D vm_normal_page(vma, addr, *pte);
>>> -		if (!page)
>>> +		if (!page || is_zone_device_page(page))
>>>   			continue;
>>>   		if (PageTransCompound(page))
>>>   			continue;
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index b69ce7a7b2b7..a6f3587ea29a 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -91,7 +91,7 @@ static unsigned long change_pte_range(struct vm_area_=
struct *vma, pmd_t *pmd,
>>>   					continue;
>>>
>>>   				page =3D vm_normal_page(vma, addr, oldpte);
>>> -				if (!page || PageKsm(page))
>>> +				if (!page || is_zone_device_page(page) || PageKsm(page))
>>>   					continue;
>>>
>>>   				/* Also skip shared copy-on-write pages */
