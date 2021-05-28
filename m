Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174083943E2
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 16:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD056F5C5;
	Fri, 28 May 2021 14:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E886F5C5;
 Fri, 28 May 2021 14:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2/glN4E6/185F7YZFD+P2XC4a8Vkg0IkNeBqj+VzbdKga6pAaOUo5YlkUE3LyqEH+xYAzrMov55nSRXOI5KNxkjEripndST6XNVMW1eZpb1ww4Klt8PN+DNb88/zXd5UjHXhhsC+/uP8/jHB1swxgQ/HWERr2E2MetGeDx1JA+yos9VeaCvnlyW9hhXoeuitN+X+WpSgXj2t1hxlKihh3WmP5HXVcGUQka4cEtJCy3HreRDfHRAh91hGsms24UPqBTKHR9a3E9Jk6OI9MrZkk08RBe+CMPj8Jeir1aw6tYIQ6TVVNFcg5gJZisMTSs3DgVOWybvNh5YXFOw6WJKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWHDrv8+e16qENmDN6IJaUIfLm96Nl2swzcYOtHXSnw=;
 b=dVMdrsMZVeJSQ5vE61O9U6b6pLSNMY3xEZmhfhC8GLQVA1IEbYUYuOW7HszTCWTuvM8mbr3AhA8MzZQfHIg7j5VBX7vpJlNYd9HBss1wfFFwf4Dlk5b91CkBhy3XQFfJYdl2PGn9SHHr2GZZkTYIxsq+nuZDv7/ILzoQg23PbTY4HQ/mFUEDZLUgAeRefPPm2n8ROLs8EnA3LNaUK3SfYtDoPmXoGKk6UsabiVfiTRct7cFmGQbdx1hazXPjMYxlzh4THg4yxT25uTLNb2CTrJSqd0tvhGcMP0RNvHiKgmztCOoDK1QBVRXTXMIoyxkLysd8pcxc69CYrF9h8iR1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWHDrv8+e16qENmDN6IJaUIfLm96Nl2swzcYOtHXSnw=;
 b=axaIpsniG5/q+BCRaX0MBwWyT+y4Mdpt6tPCpQmXLxAxhIPiFc96kfmS7s5N6mfKjYaIuJvCbu+UsdD9kCxgNhAkuHriCsQuhsi6koP9CJpXz3+L+JPEK9tpvMpDGK0pbKZkgJ7EztfwP/w/p4DV28bMmrf1Ke0N51FvbA6n4aY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2548.namprd12.prod.outlook.com (2603:10b6:207:41::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Fri, 28 May
 2021 14:10:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 14:10:40 +0000
Subject: Re: [RFC PATCH] drm/ttm: Fix swapping dereferences of freed memory
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210527141923.1962350-1-thomas.hellstrom@linux.intel.com>
 <883eab20-4326-d14a-2eb0-5e95f174a0d9@amd.com>
 <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
 <e594a1d45b22e92e052d1070beadc5928e5c0ba1.camel@linux.intel.com>
 <17037c04-603c-44c8-84a2-bce49c0e4f0c@amd.com>
 <97b0903d941c05a8877579749c6a2ea6ec107d0b.camel@linux.intel.com>
 <1dffe27a-bfc6-075e-f198-0c47cd282638@amd.com>
 <169de7a9af59135d1b63278b3b69a892ecfd4549.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <37dacfad-b557-b210-02f0-7afa202bac51@amd.com>
Date: Fri, 28 May 2021 16:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <169de7a9af59135d1b63278b3b69a892ecfd4549.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a878:922a:f147:ebc]
X-ClientProxiedBy: AM8P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a878:922a:f147:ebc]
 (2a02:908:1252:fb60:a878:922a:f147:ebc) by
 AM8P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 14:10:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dd85f67-34a0-4363-1aa4-08d921e25f77
X-MS-TrafficTypeDiagnostic: BL0PR12MB2548:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2548792367A02A10E4599E9383229@BL0PR12MB2548.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYxIUIrYZJ/HLOc4HFmp8bHMyN0KvHGjgdK3Ep/StKy2jEUqNEU8g6vBFX0L+5z3NjYM8gonJTThZz1OORSyCN0K4/I48Ys5CL0LGYSGvkfhfPTv7WhVNazzF2DpKyXPnKOFHG7ux6rWoPaWrSxPpXHCWAVLHb6fJnJLN4yYC+bDOMfri8gXIWUgKfM0MkNpWpq2fGIDqGZjECEGLMGEuBsFnei63N9wzhtZCbE3tUZYIaxeXef/Tkps74FKL89Xow6rvML+frum1y9uiRFKpES74VGeI4aUTLoSfaijTtxEiNHG2UqgHOSJGUPaxGi8i9oqPUsHRR8di1bCuN9eN0usuiwv/axuVdqApLuNbHRqKu2Do8egRrKaO0W8ravlBT9pfgmdy0bKTSB5Y6n6ylLzxoYqkZhtN3iVZOr9boQZKCDaU2rKcy5bBWw9jxqyFC6+WoLEt6WERUAnk+P4qAR7dHCW8irL9QY+CLev722jPRnnBXg11BuDuDMCIlMqcCHbPMlks83qs3b/cZogrr84HasCYoIWXMatFnaK43Df5YJZSofQjv2mDY6wS8x5K9zH929RTeRFR1+f6Q/P99enF6NFVIJ9GsAkARprFhzFL9MQCg50bKZpQOFddu0+i77RYLs4hnaXy7sg0daxxqAbr0/lY3aUz678qh088Zkm6JNq1dWQ6R0wA+/m18sf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(366004)(136003)(396003)(376002)(2906002)(66946007)(478600001)(83380400001)(66574015)(86362001)(2616005)(66556008)(66476007)(316002)(6486002)(5660300002)(8676002)(16526019)(186003)(8936002)(6666004)(31686004)(31696002)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEVYbmdPaUVzMG1rTEU0VG12dU9OVmljeHBhK3NvRzlta3JyMXNzbzJhc1Bx?=
 =?utf-8?B?QVJyWUpzb1pCME4ralhab2NuZUJnbWk5OSt0eGZDQktieE55TUw0dUxkbkFi?=
 =?utf-8?B?eTFwS3BnZ2JEZm9VeXRzUkdLWTJPS1JFN1NYaTZncEx5dXhYU25IV1NyWTdY?=
 =?utf-8?B?cVA4T0xIVEJJM0FGSWQrZ0xJZzFyOVJ3WW40K0FVOVVCT0s5SDNpV2VWblB1?=
 =?utf-8?B?NFpXb2laU3ZBM3ZwbXVDSnpybmNvVk9sZGlpTDFQaE53aGVrSFlXQ0hQK1dY?=
 =?utf-8?B?amFjWkcxME5YYWVxSkFOQ1U3Yzkya0ZxWEVXQzFtSlptWnhZeDBqQ29aU1VD?=
 =?utf-8?B?c2pMMUVqbC9uZ3QwMzRhT0N5ZE5CNEI5eGJyam1CVW9hR2VTRC9PMmZKaWcx?=
 =?utf-8?B?KzN4ejJVL3RMblhSamlLYk1HK3M4eVdSMHVKcEhnQWszSklzRjFMLzlUY1Rk?=
 =?utf-8?B?aDB4YU9zT3hmTDJPSEhWRVpXSERtczhzazFMV1V3UWsySncvSEw4bU9NZnhU?=
 =?utf-8?B?MUJLL20vL29pMVZUcGQ1Y1BrRkQzdkZTQnUxNHUyMVBNZ2RlWDBtZ2dMYW9T?=
 =?utf-8?B?SXpQYWk1TFhtSkxkQmFsdDhxdVU0eXJubG5scGpORWdQNnBFQ3pyazl2THRx?=
 =?utf-8?B?SDdNdTRqdzBPZElSUENQZ3VzY2p0azdCc2hIZUlGaGIvYXovY1ExUGg1SmY3?=
 =?utf-8?B?TFZzc25MUTlaSzkyUUNyRUlnTHhrS3NKU3p6L01lWTgxZm9sSGpGdjcvbHJ4?=
 =?utf-8?B?SDlCaUYvL2lyN2hPTE9wM1pZQ0ZxL21HNVBjV1loeVVyRDIyTlU1emQ5OTcy?=
 =?utf-8?B?bTJ3Y3Z4aUVPTnIrL1FBcHNxQ2pZbFlJdVFvQWhJcjljNzcwN1dWRG5uQ3pP?=
 =?utf-8?B?eTZyZ2wrbmx0OW9VNVV3QUZVUnpyN2QzeFQwZ1hqbjJSSjVxU3NTenFIUkhN?=
 =?utf-8?B?aVdFSW1DZW1CYmJ4ZG5RS1BSeWU3UTkwSHY2Q1ZlMXNXdDZCcThDSWxjTVI2?=
 =?utf-8?B?SExKd3hvYlpxcGZlWWxvemYvTzRoWmxxSm8ySlpXaldUQTVwYVd3OURHN3J4?=
 =?utf-8?B?RlNYaEV6S1BJUGMwTllCcVZRcDRSRmN3d0FMTExqOXE3MlFQL0RZTTN1SkNI?=
 =?utf-8?B?SEt3RVhXMlNyTTI3ODVPTmlRQTdtMlZad2lYNnM1bHRibnpab20xcisxNmMw?=
 =?utf-8?B?ck05elBEQVpPbFNodk9mZkc4dUNUbWpSWGFxWVFxQTg4azZuUDBheWRIZkFk?=
 =?utf-8?B?dmc3ck5kUmlqNlUvbmNVNXlMcEVCbDcyckZCSGZRSnE3VERnVnhwM3hjVDhl?=
 =?utf-8?B?amxrTjVoeHZLUmhpQ0VyKzlSaE0zVkQrR094bG8yNWZOSkw2ejlLR3JQdmg2?=
 =?utf-8?B?dW5vTDNha0dSSnhvZkdpT3pVeTJ0WWxsK0hwQVlKTWdaT1diZ3JDbzFhZjVm?=
 =?utf-8?B?bEpwNy9jdi9zR0NpL1hLYTQ3cWVsVGpGQkN4b3NIdVBkblpxNDVDd2tLS0Zk?=
 =?utf-8?B?dkVxMXR4U0FnakkzcjY3ZGt4bU5iK2JrSWVBSEtCU3dpUUZ1R0toWnM4RTBO?=
 =?utf-8?B?TWZla2ZMVlNaOHYxWGdGQlR2b1l4TzZ5YTQvZjRWUFNEcmJEQi8yUnlIcVFx?=
 =?utf-8?B?ZzdjN09QRk5LdlkzanRXKzJVcUtxZm85dVo2aS9nWWQzcDZRSGNLU3VBYmhX?=
 =?utf-8?B?dE8wT0I0QmV2TlZVKzNyMTlIYW9EL1dwdXNKazBzekIvcHpVM1gxVnQzdTJ0?=
 =?utf-8?B?YzcwVFNISG9Qb29rRnNuY0UwOS9OeWExdDB6eGxtZ1Z5bkYxb3VQLzE5V3E2?=
 =?utf-8?B?MXVxWk05QUNmb3ZJRkNCZ3NhQVcrWWdrckZPZDJYV2R5c0xiRlp0ZGlMZHI4?=
 =?utf-8?Q?a6vR3BEBEPBdP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd85f67-34a0-4363-1aa4-08d921e25f77
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 14:10:39.9721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0WnkUOtC/oHkolFXrC8d6O/sI4bo6XluKHZR4e3ZOCKtP+1b0zarrh3ikN95aN9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2548
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

Am 28.05.21 um 09:33 schrieb Thomas Hellström:
> On Fri, 2021-05-28 at 09:16 +0200, Christian König wrote:
>> Am 27.05.21 um 17:51 schrieb Thomas Hellström:
>>> On Thu, 2021-05-27 at 17:32 +0200, Christian König wrote:
>>>> Am 27.05.21 um 17:05 schrieb Thomas Hellström:
>>>>> On Thu, 2021-05-27 at 17:01 +0200, Thomas Hellström wrote:
>>>>>> On Thu, 2021-05-27 at 16:54 +0200, Christian König wrote:
>>>>>>> Am 27.05.21 um 16:19 schrieb Thomas Hellström:
>>>>>>>> The swapping code was dereference bo->ttm pointers
>>>>>>>> without
>>>>>>>> having
>>>>>>>> the
>>>>>>>> dma-resv lock held. Also it might try to swap out
>>>>>>>> unpopulated
>>>>>>>> bos.
>>>>>>>>
>>>>>>>> Fix this by moving the bo->ttm dereference until we have
>>>>>>>> the
>>>>>>>> reservation
>>>>>>>> lock. Check that the ttm_tt is populated after the
>>>>>>>> swap_notify
>>>>>>>> callback.
>>>>>>>>
>>>>>>>> Signed-off-by: Thomas Hellström
>>>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/ttm/ttm_bo.c     | 16
>>>>>>>> +++++++++++++++-
>>>>>>>>      drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
>>>>>>>>      2 files changed, 18 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>>> index 9f53506a82fc..86213d37657b 100644
>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>>> @@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct
>>>>>>>> ttm_buffer_object
>>>>>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>>>>>            if (!ttm_bo_evict_swapout_allowable(bo, ctx,
>>>>>>>> &place,
>>>>>>>> &locked, NULL))
>>>>>>>>                    return -EBUSY;
>>>>>>>>      
>>>>>>>> +       dma_resv_assert_held(bo->base.resv);
>>>>>>>> +
>>>>>>>> +       if (!bo->ttm ||
>>>>>>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>>>>>>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
>>>>>>>> {
>>>>>>>> +               if (locked)
>>>>>>>> +                       dma_resv_unlock(bo->base.resv);
>>>>>>>> +               return -EBUSY;
>>>>>>>> +       }
>>>>>>>> +
>>>>>>>>            if (!ttm_bo_get_unless_zero(bo)) {
>>>>>>>>                    if (locked)
>>>>>>>>                            dma_resv_unlock(bo->base.resv);
>>>>>>>> @@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct
>>>>>>>> ttm_buffer_object
>>>>>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>>>>>            if (bo->bdev->funcs->swap_notify)
>>>>>>>>                    bo->bdev->funcs->swap_notify(bo);
>>>>>>>>      
>>>>>>>> -       ret = ttm_tt_swapout(bo->bdev, bo->ttm,
>>>>>>>> gfp_flags);
>>>>>>>> +       if (ttm_tt_is_populated(bo->ttm))
>>>>>>>> +               ret = ttm_tt_swapout(bo->bdev, bo->ttm,
>>>>>>>> gfp_flags);
>>>>>>> Exactly that is what I won't recommend. We would try to
>>>>>>> swap
>>>>>>> out
>>>>>>> the
>>>>>>> same BO over and over again with that.
>>>>>> But we wouldn't since the BO is taken off the LRU and never
>>>>>> re-
>>>>>> added,
>>>>>>
>>>>>>
>>>>> In fact, we'd probably might want to take the !bo->ttm bos off
>>>>> the
>>>>> LRU
>>>>> as well..
>>>> No, we don't want to take any BOs of the LRU unless they are
>>>> pinned.
>>>>
>>>> Adding a TT object or populating it doesn't necessarily put the
>>>> BO
>>>> back
>>>> to the LRU.
>>> OK, but swapped bos are also taken off the LRU list so these
>>> unpopulated bos are just taking the same path. Only difference to
>>> swapped is that they don't get read back on re-populate, but
>>> typically
>>> cleared.
>>>
>>> But what would be the point of keeping swapped-out bos on the LRU
>>> list?, particularly when we're iterating under a spinlock?
>>> Shouldn't we try to re-add to LRU (if not already on an LRU) just
>>> before populating? There aren't really that many calls in core TTM.
>> I want to avoid removing BOs from the LRU as much as possible since
>> we
>> forgot on multiple places that we want to re-add them.
>>
>> Conceptual I think the swapped BOs should have a separate memory
>> domain,
>> this way we can ignore them cleanly when swapping things out.
> Yes, that would of course work as well. Keeping them on the system LRU
> is IMO highly undesirable.
>
>> Going to pick this patch up, modifying it a bit more and then pushing
>> it
>> to drm-misc-fixes for upstreaming.
> OK, I dropped the TTM fix for the purge-in-swap-notify from the i915
> series, hoping that the reworked variant of this patch lands first.

You will still need to add the second ttm_tt_populated() check since I 
dropped that for the back which I want to push to -fixes.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>> Thanks,
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>
>>>
>>>
>>>> Christian.
>>>>
>>>>> /Thomas
>>>>>
>

