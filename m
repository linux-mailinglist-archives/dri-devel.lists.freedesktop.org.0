Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB924393D93
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 09:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BDF6F581;
	Fri, 28 May 2021 07:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522096F580;
 Fri, 28 May 2021 07:16:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaBkO9IQfahyiiwcE8SnKpd7eLPL3nYBq5cSa6TYuaNy9yKfXUjSgWePbLKXW5Il0ZR0HWXPQkJYC2SiKoTvcAvFat+fWk0fBdUp/5Q1OvGn6/FkUhP/EQlAnyQsigZQXY+l7weu9iVQFGB17kvqNY8Ntnmk6X5LDREZAN0st+qpmLXW9yytbOiylceD6/htiU1KJGAxQiey8BqvGqlPJ+5hNcbgJ5FnO1NzkOg6lxTKVtQMIZN/TJGcmV51hQnzh+m1EWrBQ+1nVRV8oTIM/Jry26EgSZu0EY5wfcNJ5z25eh54SE6wBAi5YeeR7XFATKCHuOJhp1lFUALvVgQw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Erw6+7NRaoY9U7yiW6sSmRJ614zuI9D35RzFKbjSEAM=;
 b=eK4nywo7SWikv1KpWgypUaM7tNcb25mB6sm3mR8N93awYBM9hK+jGNVR+Yzqb4KqptGpODazkrNsDmH8rdF9qtTO5dnMhdiJUxdOT7EvBkbrdawn+mvo99bh99/r8diniQBRGZgDOH0bbTJnpQHXr9jqwtxLz5NJV3CpAK8ztC1ElsQ2Ib5LIWMDDit7g4L7g/vkETRi5wRLeWvr3u9O7Jv1K7820mbjOo1lIFfNCcRSdM/4h2CkSWtHvkXJpOHu1xaecexM7NpZ5EWlTu+DLc90fUbE1zS/dfClsSLIaUIcf8OkmrljSvaN0oId7RPgsQWjshMf7yPz1TdrD44xkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Erw6+7NRaoY9U7yiW6sSmRJ614zuI9D35RzFKbjSEAM=;
 b=IhRLkBYDEtClqKYVHTb2a+CxKr7mJqQ86wO6ojByWW2n17wq8Ys3fGpMhpY9l62yja6C+7iinWZvv/4aP5rPCMNiuXpFTL9gwbwzd8BkZJDub2XQGQK8ls8FJyjtjgmuzdGmqoo6MrQkJJaacBh9PHRO5wpSKMpu1pajnD3+54c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Fri, 28 May
 2021 07:16:14 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 07:16:14 +0000
Subject: Re: [RFC PATCH] drm/ttm: Fix swapping dereferences of freed memory
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210527141923.1962350-1-thomas.hellstrom@linux.intel.com>
 <883eab20-4326-d14a-2eb0-5e95f174a0d9@amd.com>
 <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
 <e594a1d45b22e92e052d1070beadc5928e5c0ba1.camel@linux.intel.com>
 <17037c04-603c-44c8-84a2-bce49c0e4f0c@amd.com>
 <97b0903d941c05a8877579749c6a2ea6ec107d0b.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1dffe27a-bfc6-075e-f198-0c47cd282638@amd.com>
Date: Fri, 28 May 2021 09:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <97b0903d941c05a8877579749c6a2ea6ec107d0b.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:2960:4608:1392:c6ae]
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:2960:4608:1392:c6ae]
 (2a02:908:1252:fb60:2960:4608:1392:c6ae) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Fri, 28 May 2021 07:16:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdb4eee7-b3fd-46bf-0346-08d921a87a77
X-MS-TrafficTypeDiagnostic: MN2PR12MB4062:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4062B598A32210996476E43383229@MN2PR12MB4062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPV6B8Ldu0GZ7enpC/tprmHoQI0vFs15tPuTweQF3RMt7Wdx/3Hu9ZigaIyI07dBQi/UfPy4tjJuBVV2XU+raFnflF8v8jtmOWYJc5sIODGHLxlk3cXhvzM4Cf3HU1bPsMNclcD/17Oz8dsriGbUATo1xSgNWcKL+XzteiWD0sw81c7YdwEY/NcPByTeE3BnwYpyXODFq95AAF9eAO5dtuliSPpOpluZKJ+4tuml6MV/ncKtOX1KYL4fvSeJlobcccL0g+W78xIUkmHP1pT6FakZkj1xHreBomK1ATaP+/tzFVc9S9WIXRVH/L36uuYDIRfQWHAolg1CmceA3ADF2b3xHg/Tb05TBsaCnRwiCrNxkwFcI41eJxvN5WTjc5GhPjuvkpwgSTnY0cDHWWdmripZhOlJDiWvIauksK8j+tD20FZKiCHrQeSSlQKRz7dB6B75NvfZcAjeNL29PCy6g/VJNI+0S4NWGHo7ZTi7yf2pJvycgVsrxhDoCU6H2mS8E5SQ2yr7dkSbXXswq49vUrKoPP6z4B0I0henvFYOTyGRKZ16quxmYk1K4qWBjLjdyk4QHnST4nMEC4gV68GV/bDz++XVuxD/EhMCIp5ojYbmKnizHYzuX+Tz1ISj09jXMFYps+3HUoqPPrzG9uKY7PMR2azCETm1PZnw7eAqhS/3srxbzIb9qx/ml/viksHu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(31686004)(36756003)(6486002)(478600001)(83380400001)(316002)(66946007)(6666004)(66574015)(8676002)(66556008)(66476007)(8936002)(5660300002)(2616005)(31696002)(2906002)(86362001)(16526019)(38100700002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TjNjNnFnaEh1Q1I0UytIUUNqU1hCdGtZUlNwOWJkNWZJOWFoK0UwR3FwY0Vn?=
 =?utf-8?B?Qk5vZ0lUeCsrakFTN2xRMVhXc3B1dUJ3N1NJVkl5VjY0bjlPdG1OdnhsOGl4?=
 =?utf-8?B?M3RUUjE4clppL3FuVU5rOTRSckROd1FnNHgwa0o4M2ZvbmdIWHAwc3JzNStv?=
 =?utf-8?B?Znp5bzFkSDNiS1JhU3RuNHlTaDI3S1Z2YStma1d0eVRXQXdGVHhMcmNKODlR?=
 =?utf-8?B?S1pzaGRkYWM4UzlCazBDZTUxZ2c1ZHBua2d1dHVjeHRzU3pqTWp6VXg1S01N?=
 =?utf-8?B?U1Z1TW9yajF0K093LzN1OEVCQytOWklIWnczNzNIKyt3M3dJdWp1eUh3ZE53?=
 =?utf-8?B?Snd5dUk3RXRucDlzR0ErQmppckZQdCtSL2x6MC9RR05KalhDQUN1Y29HTkJE?=
 =?utf-8?B?Q2RodW1FRU04NEtpV3F3SVQ4ajBLQVVLY0JtK3o5QmVvcWZ3NU11T0hKbTFv?=
 =?utf-8?B?TGpvc3JYV1lZVVg4T214WUcvSk5xMHFpSGJBVlI0UnRUY1hFVUVNUkFXODJZ?=
 =?utf-8?B?MHZ0YUcveDZIMUVvVmZuTUprVmxOTk9XRjQ2MllIRFQvbUpyaWR0SU5Rc1h4?=
 =?utf-8?B?a0t1dzFZdGNlR3JxRlY5amJOR0lmVVZvMzErdWZDZnkwQ1BOT1U2ZEl4bVpR?=
 =?utf-8?B?MUxHUndtY1ZQNVNBdndlbE1iT0V3VGZIYU11QXU0MjBaUnJraTBua0VKODBa?=
 =?utf-8?B?SzdXODI1MUN1b3V3L0l1dEo5L0NseTE0OXI3YzlrSHc4V2xYN205YnB4a2Yr?=
 =?utf-8?B?SU82Wjdrc0MwZHg5bWVyRkxJR3BWR3JMR1pxT0lNRTR5ZTFWR2lDS2FPaTYx?=
 =?utf-8?B?MVFQaU52TUpFdTJKM1JhUzVvT0RJOEpIWEluRlZ6ZFBzMHY1bzRpQTVpamRN?=
 =?utf-8?B?Wm41V3Y5aXJLYWt0Q0NFb0dWTGRwbThmbHVuZ2hRQXZBdVBxdzF3WUFpM2xp?=
 =?utf-8?B?QTRJb2RVR3ZFbFdOZWthOUNLaCtnejA3VEFXV2F5VzRJTjM1NzRvWHg3Szlm?=
 =?utf-8?B?QXdhWEh1NmgrTThwclhtUmUwcVFBNS9SU0RISG5xbThLZjl0T3YvNTF2ZVFU?=
 =?utf-8?B?ZUdZbmh0eVYzWjAwYnVLYk5FVllTR1lsVlBmaXg1QmZiU1NIdUhQU1dXOTZR?=
 =?utf-8?B?UVIzdFl2Rk5WN0JnRmd5L0RYY3grK080L1lSeU40a1RXQXllUmEwZ2o3QWhB?=
 =?utf-8?B?VE92eTROdUZMODZkT2hmWWFuRFFvNHU4TDFYbkoyK3RRMWJtV3QyUWlQOG1H?=
 =?utf-8?B?RGdJZFRKOWt2aGNIaU15anl0Rk0rbm1ZSlQ3MTlIQVdxQ01aK2FiM29FaEtq?=
 =?utf-8?B?VzhNR0VMQmQyVTRENmJtOVpNT2I2dlNwNUVzMHZCNDYvTW94QXFIWTV5c1Bo?=
 =?utf-8?B?ZXlTWkc1aGVrRktueUxZbVBwQWEzdGd1Z2hyU0Jnak5EWlpDS3lHdzExR3Fz?=
 =?utf-8?B?QUNzNk9CS05TaHd2M29VN0RjYVNLbXFoKzVFdTJrNW12SzYvUGNmMWtZU0pH?=
 =?utf-8?B?YmhMTUNhbXRlb2s1L2ZXZDB5QWpFUEFXWUJQRTlycW1lTmdJSU9qU1NVNFc1?=
 =?utf-8?B?bHo3VjZTbUZDcmU3V2xVaHJhT0hYU1dyQ3lMVTRKZ2drNEI0RXFTZTBQODFY?=
 =?utf-8?B?bWFmQ2FZbUcrb1g0eld4Z1BScExwZkRSZGhuMFpWaktXN0pTVkppZHRlQ0Vn?=
 =?utf-8?B?NzVzR1BzTC94eVRLSjcwcUN0eUVoekNpNEZTYXBKUHZoUW9WempnOTY4ai91?=
 =?utf-8?B?NjdublkzcFNTK1VHS2QyOFpQdnhPNnZaTXZJRFVJbGRHMEw4dGVlRzZrUk1D?=
 =?utf-8?B?OTZkSTNKZnhVM1h4VjNjNWhRTHBEdG0raTB3VEg4TWFFSmlQVTdPNjc2Kzls?=
 =?utf-8?Q?wW87DcN68EMuA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb4eee7-b3fd-46bf-0346-08d921a87a77
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 07:16:14.4007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNuybHaebcAPjHbFlgCZfaaSVZog2kn+R2IaWthPvDpio4w7fIHK9XY3FJm4Crsb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.05.21 um 17:51 schrieb Thomas Hellström:
> On Thu, 2021-05-27 at 17:32 +0200, Christian König wrote:
>> Am 27.05.21 um 17:05 schrieb Thomas Hellström:
>>> On Thu, 2021-05-27 at 17:01 +0200, Thomas Hellström wrote:
>>>> On Thu, 2021-05-27 at 16:54 +0200, Christian König wrote:
>>>>> Am 27.05.21 um 16:19 schrieb Thomas Hellström:
>>>>>> The swapping code was dereference bo->ttm pointers without
>>>>>> having
>>>>>> the
>>>>>> dma-resv lock held. Also it might try to swap out unpopulated
>>>>>> bos.
>>>>>>
>>>>>> Fix this by moving the bo->ttm dereference until we have the
>>>>>> reservation
>>>>>> lock. Check that the ttm_tt is populated after the
>>>>>> swap_notify
>>>>>> callback.
>>>>>>
>>>>>> Signed-off-by: Thomas Hellström
>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/ttm/ttm_bo.c     | 16 +++++++++++++++-
>>>>>>     drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
>>>>>>     2 files changed, 18 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> index 9f53506a82fc..86213d37657b 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> @@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct
>>>>>> ttm_buffer_object
>>>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>>>           if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place,
>>>>>> &locked, NULL))
>>>>>>                   return -EBUSY;
>>>>>>     
>>>>>> +       dma_resv_assert_held(bo->base.resv);
>>>>>> +
>>>>>> +       if (!bo->ttm ||
>>>>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>>>>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) {
>>>>>> +               if (locked)
>>>>>> +                       dma_resv_unlock(bo->base.resv);
>>>>>> +               return -EBUSY;
>>>>>> +       }
>>>>>> +
>>>>>>           if (!ttm_bo_get_unless_zero(bo)) {
>>>>>>                   if (locked)
>>>>>>                           dma_resv_unlock(bo->base.resv);
>>>>>> @@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct
>>>>>> ttm_buffer_object
>>>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>>>           if (bo->bdev->funcs->swap_notify)
>>>>>>                   bo->bdev->funcs->swap_notify(bo);
>>>>>>     
>>>>>> -       ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>>>>>> +       if (ttm_tt_is_populated(bo->ttm))
>>>>>> +               ret = ttm_tt_swapout(bo->bdev, bo->ttm,
>>>>>> gfp_flags);
>>>>> Exactly that is what I won't recommend. We would try to swap
>>>>> out
>>>>> the
>>>>> same BO over and over again with that.
>>>> But we wouldn't since the BO is taken off the LRU and never re-
>>>> added,
>>>>
>>>>
>>> In fact, we'd probably might want to take the !bo->ttm bos off the
>>> LRU
>>> as well..
>> No, we don't want to take any BOs of the LRU unless they are pinned.
>>
>> Adding a TT object or populating it doesn't necessarily put the BO
>> back
>> to the LRU.
> OK, but swapped bos are also taken off the LRU list so these
> unpopulated bos are just taking the same path. Only difference to
> swapped is that they don't get read back on re-populate, but typically
> cleared.
>
> But what would be the point of keeping swapped-out bos on the LRU
> list?, particularly when we're iterating under a spinlock?
> Shouldn't we try to re-add to LRU (if not already on an LRU) just
> before populating? There aren't really that many calls in core TTM.

I want to avoid removing BOs from the LRU as much as possible since we 
forgot on multiple places that we want to re-add them.

Conceptual I think the swapped BOs should have a separate memory domain, 
this way we can ignore them cleanly when swapping things out.

Going to pick this patch up, modifying it a bit more and then pushing it 
to drm-misc-fixes for upstreaming.

Thanks,
Christian.

>
> /Thomas
>
>
>
>
>
>> Christian.
>>
>>> /Thomas
>>>
>

