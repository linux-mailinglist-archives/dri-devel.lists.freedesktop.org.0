Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508013B8DE6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 08:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0DB6E9BE;
	Thu,  1 Jul 2021 06:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E306E9BE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 06:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fl/D3Jpg3eMEQi8+Dap5OlXtjkbxrhS5vkKA5F6ADBQ/tz9K3zfyfoAFUSAX95rD13VyyylOQtm8no1vuDv6Rsoe4ZR6q65Gm7g5ApioLzcx1dU8JMN6Sg00CQnu43tJAVnMhRuVwcD+TayAJpS1Kw134cVpM1SEZL9bZWplh40ZImEc6rmdZvRkze8+frMMOfKrNNlzNyn93cnbFPDwqr7EfTB8l0P5AvOZUNjJOSxGSR3oNtLd58uwmRuEmH0v1zxojQ8tk0jDdgQDww9VYg38Chn68qyrfq1i6aaER91H1tP9rT+P6092BwF2Ds6v+D1fc7JsEbNT42sGvg0DcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOwqJ07QW+D4TQpqDCAhLYBooe3jT4j6HL1x2k/cMgw=;
 b=k4M5AOssJHM3D15lhE2/TsQXE6ghtiMGbv1wuR8nOBrVQkEr0qCdkewl+3BKJKx0AsimTkLhWZmzbv5lV3dFDi2jXc545oyMykXujG5V3RKdqCzJJ57FVtMRAnKqCsqsz9GxXyTG+8slT080bv5CHWE9mMh/mQuWv7WeOPCqykURWBBKqsj4m1gckKwiTALEOkjiMH00JvitdRBQGiMVH/5AEjmc6Xv8O6kLEljaTKseKfebp8pb4mtnrLGpSXzBkzMdnZBoeyeiXdlUssSRKq3CV56Q8yo8VBFENhnHDij41mo7aonA0VL/tvV4hYtscwV2+Kql27XlnWzcb23C9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOwqJ07QW+D4TQpqDCAhLYBooe3jT4j6HL1x2k/cMgw=;
 b=UFasBp5IH8X2yaSiJkfLy+mEwuKbUFnbW8c28xEpdK1nujM55DrUlP/n4HAGH4JoY3mUJezzqwj8zpp5uZVHrG6IcpFRKYBeq+55LCRbrKyeDNiMlu0nrhP5ObbGtrtfvxFxqrof2fEWWl8KRL+xDHgO43coabjkHaUMiLQvww4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BY5PR12MB4934.namprd12.prod.outlook.com (2603:10b6:a03:1db::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 1 Jul
 2021 06:52:39 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e%7]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 06:52:39 +0000
Subject: Re: [PATCH v9 1/5] drm: Add a sharable drm page-pool implementation
To: John Stultz <john.stultz@linaro.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <ab35ed32-ead4-3dc4-550d-55f288810220@amd.com>
 <CALAqxLXWDKp3BZJdO3nVd9vSVV6B+bWnTy+oP6bzBB6H3Yf4eA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6a472a24-a40f-1160-70dd-5cb9e9ae85f1@amd.com>
Date: Thu, 1 Jul 2021 08:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CALAqxLXWDKp3BZJdO3nVd9vSVV6B+bWnTy+oP6bzBB6H3Yf4eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8c07:8ec5:3c97:d783]
X-ClientProxiedBy: AM0PR02CA0209.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::16) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8c07:8ec5:3c97:d783]
 (2a02:908:1252:fb60:8c07:8ec5:3c97:d783) by
 AM0PR02CA0209.eurprd02.prod.outlook.com (2603:10a6:20b:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Thu, 1 Jul 2021 06:52:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f35776e-27b2-4595-c26a-08d93c5cd025
X-MS-TrafficTypeDiagnostic: BY5PR12MB4934:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4934E7DD15ED7D41F40B445883009@BY5PR12MB4934.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OK5FK+ZCJ7XPdlEBdTcc1ur6KOPg/+BZlmkbURpXpDjZ5wFlYZEOkbVifovCUqQlODqPiMwJwK+EXsqvKH/VENMYPVITCj0LgfMyxieYKCtVARog1brp83wUHI1nKvR6ksLxCrg9LwPXW+SkGo+Hs/XMHuU5fLYe8MdjUjvmR/E+hlDUYRTMKYJQ0E9wFyDdcmkcyFMr0hUgLN1ruuxWrPXf49sAFTZy5LVh/91MvUACghi49n6Pti+tTTXraoamdva+5QMkT4OQqX0DIrW8WZ9/ZcnMin7wCgZ+SEb8Ih6H8noE3Kj56MNxO+dnEoPjitKoQ4EHXlepW+mFTLhH4sChV6xqkGlYzO4/6iMXKUXc7RP+ZbMWR/U0q6I5YPQyKm2l4/zdVQNaujNWe6OQXKj0ZVH720Ffq5MmwAeMYz51Nq9c2ObO5nDesdgX7lHbWKlsWamI7Ydgldt8tnwy4PPxZiPHD4cfkJ4wU7m7tvNyepUYzBXzVFqk+nCIByVZCP/Gu7ANzGl0RgCAaisrzm/1WpzrbkCd3X5EowxgBY5MXF4JHDYfXxFhMyg9TnlSCsF6Lb9CfSi6mMHBMCrN1FSsp77NHSsD0v8gq8HRQvWIgjNbA4cW3OV//P/BIrhfEV+FZSygW3D5A1zhX3L1+SqPiy5c8GSLZ/ZmCHTNSqdt8CY3HUUJLnYbilcUeDbG42h0K3oU6o29mgAtVCvdvvRPrRFrh5MCzt0kK4St2SiIkYSmYq413IZm35FZVpcI7HGWJ8MThZ3Dv4PO4yV8WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(86362001)(31686004)(83380400001)(8936002)(6486002)(186003)(2616005)(31696002)(4326008)(16526019)(5660300002)(66574015)(8676002)(36756003)(316002)(6666004)(54906003)(66476007)(6916009)(7416002)(38100700002)(66556008)(478600001)(2906002)(66946007)(53546011)(522954003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEJWV1lHL0JEZ0hacml2VGFQRjM3RUp0eWNLdkRhRHdoeTdmTy84SnN5Slc1?=
 =?utf-8?B?WWRBT2ZBL29VQW5QVm9GTGt5UnVvdTB3T3crU0JMNHZMQmc4emdMNlpJY25U?=
 =?utf-8?B?bzlodWtMdU9aa1JWR3RxcUNvaEZFVVFOTy80YSsvbWhQOXk5b0pWWUJDaFEw?=
 =?utf-8?B?ZEQwdS9vTVVkREo1eEJvTVBUSlBoc0U3N1NKSGx6eWRMTTRFZHZUNXhnZ016?=
 =?utf-8?B?YXdIdXAxVm56RjNaM2RJM0ZwMTB5VjUyUUFlUEQ3b1c1ekVyL1BKQ25CU0lF?=
 =?utf-8?B?RlFKL3JWb3RpMTA1dWQ0ZFYrbUtHOUJpbktrN2l1L1B5ajJDTytwL2Z2VVBP?=
 =?utf-8?B?VFR2Z1B2UC9ReWxXQjBBRXhwTFQ0ZVAwQWdSN2llblkxNC8rR2ZKZnBneHl4?=
 =?utf-8?B?VEZrbldUMW5yUWsvMXE2d0Y0dUtMV25zaEpERXdGeVBRS2dOd0FBbk56QVRx?=
 =?utf-8?B?eUJUWFJ1djY4MjlBR0tDdDFROHMwNmdtNEhnWEZZbEhKRDRPWjhxWUVFa3VI?=
 =?utf-8?B?Q2MyL25TVUFQNGVzbSszQUlPazFsNXNMS1ZtR0lVSHRUUFc2aFJwelpuNU5B?=
 =?utf-8?B?eUZMcGZvcUlkZGJsc3NFeHNuVVRQRjhuMUxnVlM4djcyUnVDL3p4ZlBadDEz?=
 =?utf-8?B?cVU5NXRhdmRaV0Z2MTNsZmVjRWNnVEFRZjJmY0E0Zm81R0FQTHJBZlB4aEE2?=
 =?utf-8?B?enZKTDF1RWE2S1VLRmJoTTZIWHdvbkhrbmFubzl3NG5DRWEzRlFwQkY3UkVi?=
 =?utf-8?B?eEF0anhUejVxMXFRNmlIYW5MY2dwVk5IU2R6MjJWSHlYb2V4Y1FKa3oyUVB1?=
 =?utf-8?B?OG91cU53bDQrdE44TmF6TEVGbDNqR0FqZFhtY3AxUTUzdDJXMC9sRHdwZnlK?=
 =?utf-8?B?K2UzRCtkdkExUVdOZEpBclRhMmFmOGYwSWxKUytveFNRSzdwUEpNVHUwdzZw?=
 =?utf-8?B?VThobWF5aUczMW10ZkxLNWR6bWtoRGJCY1EwakhpN2xyc2c5ZmRHKytkME92?=
 =?utf-8?B?YjVLQnRSNE9YNVlDTUlHWDdkMTlwVlVtbU1lZXhPUnZud0pYVU9lOVhXSlVh?=
 =?utf-8?B?UmRwNlBrNUVTZ2xaYm5LRVR5K2ZKSWtKUzRqeUV2NVJyZ0pZQ0xxMmlvYzUr?=
 =?utf-8?B?Q1V1RmpRaUgzbEVZYjk1dkMxR2swc2RFY2J6UEFndVNWcW1jeEc0UitzRFdD?=
 =?utf-8?B?QnJmZzVZOUhBUXdOc0RDQVB4WjdZT0RTYzNpMzc3N2IwdDFXOVFPelJDNDU3?=
 =?utf-8?B?ZlMwWXUxRHI3NFdabkJyZU1ielNlUmVmYjRvRmpTanFoT2tCaTNPeGVFSWox?=
 =?utf-8?B?SDlyQkxkZE1CM1hlNGUrbUJLK0k4MlJqczFiL0dzNWM4dlpDNzcrN1RneWR1?=
 =?utf-8?B?UjNUaU1VM2xsMUxadDN5ZUNJOXk4WFJCNWNOZTJ3cE9vUWk0L05STU15TXg2?=
 =?utf-8?B?cnFhczhEMythNkhFd3gyMU40R2V5TTJGcXZuaTVvSFgzU2dqNkkwS0huU3NV?=
 =?utf-8?B?T3B3Rm1FYnpaVnhNeGhpY1ZTYng2VXNyRTRQUk9WSU5UdnJhcXFpcU1Gb0Iy?=
 =?utf-8?B?cXJZQ3FiUVdNeDV3VEx5K1hhZFlQcDRCVSs2MFhDTnZXQnVDUjVFZFFaeS9M?=
 =?utf-8?B?bk85ME5MUUZVVFN1S253VW1UZTdsY3B2K3VtVzQ0Z1hUMlpXOWpMVC92cGZr?=
 =?utf-8?B?SFF3SGZRc2xwZjdZN3lMUXY2ZTFnR1JBRG5IWUl1alM3SE40U1R4a2lHRlVN?=
 =?utf-8?B?bVArcGR6U0UrbTJSdHFCalRLZkYrU05hTjJhYTNzS0FSMDR1MFIzcUcrc3lk?=
 =?utf-8?B?eEo3ZVFDZU9ZcW1hZll5MU1hMUlsZlY4Wk9kcG5sdkIwem11VisvU1huN2JC?=
 =?utf-8?Q?8IEEVmBMl7oDx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f35776e-27b2-4595-c26a-08d93c5cd025
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 06:52:39.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSVIsVJ2HvM3bQe8tQ6lQU8GAQzPJySfWuEkq1Nw+zMehyVKmFv870AyLCyxwgU0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4934
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.07.21 um 00:24 schrieb John Stultz:
> On Wed, Jun 30, 2021 at 2:10 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 30.06.21 um 03:34 schrieb John Stultz:
>>> +static unsigned long page_pool_size; /* max size of the pool */
>>> +
>>> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the drm page pool");
>>> +module_param(page_pool_size, ulong, 0644);
>>> +
>>> +static atomic_long_t nr_managed_pages;
>>> +
>>> +static struct mutex shrinker_lock;
>>> +static struct list_head shrinker_list;
>>> +static struct shrinker mm_shrinker;
>>> +
>>> +/**
>>> + * drm_page_pool_set_max - Sets maximum size of all pools
>>> + *
>>> + * Sets the maximum number of pages allows in all pools.
>>> + * This can only be set once, and the first caller wins.
>>> + */
>>> +void drm_page_pool_set_max(unsigned long max)
>>> +{
>>> +     if (!page_pool_size)
>>> +             page_pool_size = max;
>>> +}
>>> +
>>> +/**
>>> + * drm_page_pool_get_max - Maximum size of all pools
>>> + *
>>> + * Return the maximum number of pages allows in all pools
>>> + */
>>> +unsigned long drm_page_pool_get_max(void)
>>> +{
>>> +     return page_pool_size;
>>> +}
>> Well in general I don't think it is a good idea to have getters/setters
>> for one line functionality, similar applies to locking/unlocking the
>> mutex below.
>>
>> Then in this specific case what those functions do is to aid
>> initializing the general pool manager and that in turn should absolutely
>> not be exposed.
>>
>> The TTM pool manager exposes this as function because initializing the
>> pool manager is done in one part of the module and calculating the
>> default value for the pages in another one. But that is not something I
>> would like to see here.
> So, I guess I'm not quite clear on what you'd like to see...
>
> Part of what I'm balancing here is the TTM subsystem normally sets a
> global max size, whereas the old ION pool didn't have caps (instead
> just relying on the shrinker when needed).
> So I'm trying to come up with a solution that can serve both uses. So
> I've got this drm_page_pool_set_max() function to optionally set the
> maximum value, which is called in the TTM initialization path or set
> the boot argument. But for systems that use the dmabuf system heap,
> but don't use TTM, no global limit is enforced.

Yeah, exactly that's what I'm trying to prevent.

See if we have the same functionality used by different use cases we 
should not have different behavior depending on what drivers are loaded.

Is it a problem if we restrict the ION pool to 50% of system memory as 
well? If yes than I would rather drop the limit from TTM and only rely 
on the shrinker there as well.

> Your earlier suggestion to have it as an argument to the
> drm_page_pool_shrinker_init() didn't make much sense to me, as then we
> may have multiple subsystems trying to initialize the pool shrinker,
> which doesn't seem ideal. So I'm not sure what would be preferred.
>
> I guess we could have subsystems allocate their own pool managers with
> their own shrinkers and per-manager-size-limits? But that also feels
> like a fair increase in complexity, for I'm not sure how much benefit.
>
>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *p)
>>> +{
>>> +     unsigned int i, num_pages = 1 << pool->order;
>>> +
>>> +     /* Make sure we won't grow larger then the max pool size */
>>> +     if (page_pool_size &&
>>> +            ((drm_page_pool_get_total()) + num_pages > page_pool_size)) {
>>> +             pool->free(pool, p);
>>> +             return;
>>> +     }
>> That is not a good idea. See how ttm_pool_free() does this.
>>
>> First the page is given back to the pool, then all pools are shrinked if
>> they are above the global limit.
> Ok, initially my thought was it seemed like wasteful overhead to add
> the page to the pool and then shrink the pool, so just freeing the
> given page directly if the pool was full seemed more straightforward.
> But on consideration here I do realize having most-recently-used hot
> pages in the pool would be good for performance, so I'll switch that
> back. Thanks for pointing this out!

The even bigger problem is that you then always drop pages from the 
active pools.

E.g. a pool which just allocated and then freed 2MiB during driver load 
for some firmware upload will never see pressure if you do it this way.

So those 2MiB would never be recycled while they could be well used in 
one of the active pools.

Regards,
Christian.

>
> Thanks again so much for the review and feedback!
> -john

