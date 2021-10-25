Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77512439F00
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493456E1F8;
	Mon, 25 Oct 2021 19:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFB86E1F8;
 Mon, 25 Oct 2021 19:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejXyWgT0s1nHxU5dRUGO9zB9c+SsNkw+ABXv3RhMZBR8Dso5KBDWSD2Z35PJjeOBBARRCmJz/NP0pgVtrSHy/pvNqxOkWJBK03KrUoCYjBajYpxlwZEqEoW6WDpVCh2Ts1dW+qu8Xewppw/DfaYh5r5wVrrtupjs576TlGH1RQiPXgnXj33rKPXkUu2aB725JmWhiISDOwMZ+Y8ioYwcQUDRWspl0cdkQ8KXqpterMzDXSOT6WelvAZUu1Ohh1z6fOJs8zr1XyjJ2usLttYI6gjbzO+GjUOt4tInzMsBZ1HotZdBuY08CaC3aWlu2PTBUpT+V7OsVbz9oeIM7V8PRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YrzLOEXI5s58zcN1iDuga0DwIQVdYgzQNe3krUZ2pQ=;
 b=WLgWETBTqfkyAVlkmnOwDCD5o/cywXQdoIm+Fds8xIyYbYxH7vYzBfSBXUH1fRqYimY763rRC+WEaLay9V/fqrdu6tmXRh64ySh5JUz3l9vUDwrUoROhYGh2usWviDm0zrxeJ/qhtT8BGv4h2dEZgUGQmhQXfSxFYp99dBA5cQxQdRH2G+MoJNNkwtKDq5xsOuva2Ui0VKLpTgnGPmRe77Iq+QjlJCspD1XcmvDV/ri6nVWbFeHQpcCo3v62d5y6Itfg++Rop0MhJf7Mz+ORMd2yXJ78azjvgokzxX3W1snLg3ZqItMTvEI6MJgFOO+x1gsKMnphzTO8G6V61hlDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YrzLOEXI5s58zcN1iDuga0DwIQVdYgzQNe3krUZ2pQ=;
 b=awvmkJo9IQTPxDLShRp+ttLE32HilxP2w8vaQ9qujbP+5qLswDLWslVaUD+tNAfnVtwtX+W4DMrFyov0HBImm7/1PfZEBX6SfZl33LL0O5rVCS3NVRBTNyFFhWulwxDMterDu4ZenM7B4Hnlmyc1TX8UKWvaDiEzl41y6M4iS+k=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.20; Mon, 25 Oct 2021 19:10:38 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0%11]) with mapi id 15.20.4628.018; Mon, 25 Oct
 2021 19:10:38 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
Date: Mon, 25 Oct 2021 15:10:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
Content-Type: multipart/mixed; boundary="------------6859E91F491FB8B564A6EAE7"
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::20) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:32ba:a748:360f:6dc8]
 (2607:fea8:3edf:49b0:32ba:a748:360f:6dc8) by
 YT3PR01CA0107.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Mon, 25 Oct 2021 19:10:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c81931be-8e14-457f-84be-08d997eb218e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1578:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15782FC46B0997279225E0CEEA839@DM5PR12MB1578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 34fzT0RrA+ZLotW/ztkYGawehkPX7MURzZIztdzdBdvjVfHH1VZ6Iap+bPRtLxvZwLl4BIDv0tL03w7govzm1GY9zAZ4P9otExGKpWINQEdajLIat1mn7VQRqpHkK5yrsgZAn8QK3k/byVsFT0V2NBNgOoNsc/fzvqlhfHZHgD4TgxJT4eut/V4SC+Gg4Iy65zCqGkvFwQ2iruD0ZLcjcFcbASIJS0m+JzgzI+vPF+wHWCWK9XiYhFJszRJ9L4VJ7kZXUuIHEF6hKc7EVDrnWjtJ0UkhSGssMA3/YS3NLM+qHcjKSWyBxQNtjWg9Oq9Gxy1sdnN3TvjhqNntBmbs1AP5Kml45YJUYCSGVIriIPavIYvmGXfVRTi9HzXMNQ1m0XXOkbZy+ECdYLmccNQ5DDYKLANIh5HXJcEvc0ktDU4HArI1VmQ6DhY5uN3XN5Cji9ckTkM9lYrDOzC+ULdaFep/M6xjx/yLUuY3B/peELCky71BJ+XZ01irxHAKezBOfETP5aOA3W78Mqy7kEYbJtJ36C10tA7pV1GQOx8p0wGOxoxWJ6hOHLKoAsEfT/mhv3bhEs5tA3RxeL/A0Yv4fVxF33n0fkuaonCkiWPvrDrkhoQtHbuamfzwEkC7/kuT3BxhKw2zedBmdPD9ohDxMpPf9VF3+Y+y4rbqDnCf7h1TbGRjFNpIS1hXVzssilI22UK9AauwqGzsPj7E2HQXLEIHF+VofJ8NpWHxfluGLsVFXxklY5wJsLk5oY7h+rDrsK3f8Y2m7FgDbIxnleHz1AAjrH3N9LU1/WngFeN+wbm02x6ZARWxESHCZOsd+hOJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(31686004)(83380400001)(66476007)(21490400003)(2906002)(316002)(31696002)(110136005)(66574015)(38100700002)(66946007)(508600001)(36756003)(4001150100001)(6486002)(44832011)(8676002)(33964004)(86362001)(8936002)(966005)(186003)(53546011)(2616005)(5660300002)(235185007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KytTeFgva0RjOVRlbERlbHVPUTJpYis2a3JSRUlkSG1HajRtOVplY1VUL08v?=
 =?utf-8?B?WFFyQXVvV2xJdGdkT3RJRVdhNjBaemluMHdacGE4V1lTSG16YkhqbWRRTGhp?=
 =?utf-8?B?V0djOUlOL2FhY1FsUytjNHJCcWNKeUNmZHhhZTM2S0VicVhEd0lDaTJhVElC?=
 =?utf-8?B?dnBncG9kdWtJcHg1WEgzNWFydjVsTWt5bmxjZVVsalJlWm5JQjRnaEJRV0k4?=
 =?utf-8?B?T0psaDVsUS81K1JNUHJZTDdwTUk0WWgyUXYyc0hvcnVabjg0aU0yYU1neEU4?=
 =?utf-8?B?clUzZkNGb21oMzdORTlpb3kvVytIN1pmZ2JIU3BNeXp4bHV3QnlweDczZ2FH?=
 =?utf-8?B?UWpVRHZDZjhwRElwWFp4Vit6Ri94SHExMXc2emJJYTdEVDVnVmkzTXFWUTZr?=
 =?utf-8?B?Z0ZsS3dOY1lnT1liNEVVS3RrOHJkcGdqSkNjNm1YckJucmRDbU1EQzFIeE9B?=
 =?utf-8?B?a1FnWTNrVENyTzExdzNUZWhIWUF2TVVUaGpsMmlOYzBIM2phNFBCRXV5K2Vl?=
 =?utf-8?B?Z2lVNHJXdWkwQlo1TnM5b21HdjBDbS96ZHhQZWZCS0NucTIySTNjS2dGL0x1?=
 =?utf-8?B?dGZhdE1sUzJwRmVkc2E2bW90R0xkOWxjelpZU1NtUXhaVSt3bVJndko0NlF3?=
 =?utf-8?B?d2gxeFE5M212TjMyQkxGNEYvOEJmeVJxeWVZbTZONG1JclFSUFF6ZGJvKzIz?=
 =?utf-8?B?aEhxTVJORHg1RGdYYVJQU2VEUlZQK0NrOS9zWUI0QnlBVkVnN0FrZllhNy80?=
 =?utf-8?B?QktDcXVYYkFPMTZNdU5jV2g0MmY5SVRXZU4xd1U1bGpYc0NvbG5IdzJUcTFB?=
 =?utf-8?B?N0dPbUh1YkZBUlhCZ0JYQkJkRFI3TDU5VEd4S2xIVnJCYU1WYTRvamJWTUFY?=
 =?utf-8?B?enJpL2o2SEdYZU12VDQyTWlxNzVXd2pGbDd5NUxxeVU4QVd5ZnZJOStEa1k1?=
 =?utf-8?B?ZnNNWjZpdzBjdWVIaUJCVm9KUnprWWRnZWxzcTdReEl2ZzA3WHBzRlVVVVNo?=
 =?utf-8?B?VnZhS3ZobTFBWGdLLzNwTHB0dUpxU1BqdlNSQVlEWlBFWkdJNUdYanUyc3Zu?=
 =?utf-8?B?V24xNXpIUkwyVy9NQjN0azVvMkFLZHBMdFp4UzdGOWdWUUFsK0dHK24wTGh0?=
 =?utf-8?B?OU42VDc0cG1oU0xqSWhpSlFuL3lBWnlXNkRyY0RNS3ZZK1F0R2hidExqaVFz?=
 =?utf-8?B?cWtvaTBBamk1V3JaK21rUE5jbTRSamgvSjd3TVFySHBDK25WelhUNzdzTVFR?=
 =?utf-8?B?OWkzcU9LMDJPeEIvQVp4RWJwVEZiOElFaEV2cEtVZTRnSVoxeDRuMVg0T1l5?=
 =?utf-8?B?N3lSM0s2d3drNUdjWGNXOWNyaXpUMzl2dTF6K0xkRk5CTEUveUJrTnpiU2dT?=
 =?utf-8?B?RTJpTnRJUVVMbXhaUkFJdDlRK21nKzU2bEtMNXlqS2dmOGdCc0ozM2FTNC85?=
 =?utf-8?B?S1VEZnZFa3VGS1F0QVlJNHgwUi85UEdJWWNBblB5MTZWZ1VnY3VlbHJBc1hQ?=
 =?utf-8?B?VktwNCtvcG5UVy9XUS9IODRkck92R1BITUdia0FpRWtrOGJVQ05OWXZhNlk1?=
 =?utf-8?B?dWxSNDhQRU1ZU2hTaVh0V2c1TWNPQU5VbnFSVndXd2NpOG5YWWJCOXcyUlVy?=
 =?utf-8?B?bVRXV3dqcVN4S0xReVJyaEhOTFhyN1kzWGZOK3VRS1c3R3hZY2NNenR6dndB?=
 =?utf-8?B?MkNhNVdUcWFteUdTVDR2QmE5UWo5UFAzVExKQ3dIS1RXNmxWNlFZN3dBTWEr?=
 =?utf-8?B?Z3hQTEtBTDU2MGFvNm1PWDAwS2RHMFVYTFdVNVd4Smc4YzcxMWZncktjdWls?=
 =?utf-8?B?Lzl5MklKMUdrc0phcXlUYzRGZ2cwMkcyUzZnbFlMRnpBUmdySlo0N3JBWEdT?=
 =?utf-8?B?MGUxSTB5TGY3MjM4SlMzMURJVWpOUStmRFVRdnRSbGc2SDlyTUxWdmYxY0tu?=
 =?utf-8?B?MnVCc09Yc2QzOXRzL1NlNHg3TUVRUldPSXBoTkJOdnV3SmIzcVkvQ2ZDU0ZS?=
 =?utf-8?B?c2ZQTjF6QUJ4bk9aSHVYMTRZTXU2MDFrUnN4Rk5TNHN1czBvNmswV0JxZkVK?=
 =?utf-8?B?L1YrQ2VsdzFZNlRTbnlnT0xFcDljN2FLckc3VjRpVitJRXBGSjQ2Wi9wVStn?=
 =?utf-8?B?Rnkxc2V1R3RaUUJ3c1pTYVo1dVBlRkxoV21Xam16Vk54WjFLTFg1WE81b1Yx?=
 =?utf-8?B?VzVSRkdkOGZlL1FneDJXSldHV1Q3ZG5EZnUwYXRRMmZoYlc3YnFnRng3QTNl?=
 =?utf-8?Q?fel//ChZv4HrMFDwhGh+xbsJhzf09R5PV1ZYgS5pTs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81931be-8e14-457f-84be-08d997eb218e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 19:10:38.7032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBW3xtf0M3oJA19eyAoOtBaisC06u3zDmHy7TMFcFKURSW3zxX0jVkv1uhY86t3B7BiGOIDDUGGpMmUOL5LiRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1578
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

--------------6859E91F491FB8B564A6EAE7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Adding back Daniel (somehow he got off the addresses list) and Chris who 
worked a lot in this area.

On 2021-10-21 2:34 a.m., Christian König wrote:
>
>
> Am 20.10.21 um 21:32 schrieb Andrey Grodzovsky:
>> On 2021-10-04 4:14 a.m., Christian König wrote:
>>
>>> The problem is a bit different.
>>>
>>> The callback is on the dependent fence, while we need to signal the 
>>> scheduler fence.
>>>
>>> Daniel is right that this needs an irq_work struct to handle this 
>>> properly.
>>>
>>> Christian.
>>
>>
>> So we had some discussions with Christian regarding irq_work and 
>> agreed I should look into doing it but stepping back for a sec -
>>
>> Why we insist on calling the dma_fence_cb  with fence->lock locked ? 
>> Is it because of dma_fence_add_callback ?
>> Because we first test for DMA_FENCE_FLAG_SIGNALED_BIT and only after 
>> that lock the fence->lock ? If so, can't we
>> move DMA_FENCE_FLAG_SIGNALED_BIT  check inside the locked section ? 
>> Because if in theory
>> we could call the cb with unlocked fence->lock (i.e. this kind of 
>> iteration 
>> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/gpu/drm/ttm/ttm_resource.c#L117)
>> we wouldn't have the lockdep splat. And in general, is it really
>> the correct approach to call a third party code from a call back with 
>> locked spinlock ? We don't know what the cb does inside
>> and I don't see any explicit restrictions in documentation of 
>> dma_fence_func_t what can and cannot be done there.
>
> Yeah, that's exactly what I meant with using the irq_work directly in 
> the fence code.


My idea is not to use irq work at all but instead to implement unlocked 
dma_fence cb execution using iteration
which drops the spinlock each time next cb is executed and acquiring it 
again after (until cb_list is empy).


>
>
> The problem is dma_fence_signal_locked() which is used by quite a 
> number of drivers to signal the fence while holding the lock.


For this I think we should not reuse dma_fence_signal_locked inside 
dma_fence_signal and instead implement it using the
unlocked iteration I mentioned above. I looked a bit in the code and the 
history and I see that until some time ago
(this commit by Chris 0fc89b6802ba1fcc561b0c906e0cefd384e3b2e5), indeed 
dma_fence_signal was doing it's own, locked iteration
and wasn't reusing dma_fence_signal_locked. This way whoever relies on 
the dma_fence_signal_locked won't be impacted
an who is not (like us in 
drm_sched_fence_scheduled/drm_sched_fence_finished) should also not be 
impacted by more narrow
scope of the lock. I also looked at dma_fence_default_wait and how it 
locks the fence->lock and check if fence is signaled
before wait start and I don't see a problem there either.

I attached quick draft of this proposal to clarify.

Andrey


>
> Otherwise we could indeed simplify the fence handling a lot.
>
> Christian.
>
>>
>> Andrey
>>
>>
>>>
>>> Am 01.10.21 um 17:10 schrieb Andrey Grodzovsky:
>>>> From what I see here you supposed to have actual deadlock and not 
>>>> only warning, sched_fence->finished is  first signaled from within
>>>> hw fence done callback (drm_sched_job_done_cb) but then again from 
>>>> within it's own callback (drm_sched_entity_kill_jobs_cb) and so
>>>> looks like same fence  object is recursively signaled twice. This 
>>>> leads to attempt to lock fence->lock second time while it's already
>>>> locked. I don't see a need to call drm_sched_fence_finished from 
>>>> within drm_sched_entity_kill_jobs_cb as this callback already 
>>>> registered
>>>> on sched_fence->finished fence (entity->last_scheduled == 
>>>> s_fence->finished) and hence the signaling already took place.
>>>>
>>>> Andrey
>>>>
>>>> On 2021-10-01 6:50 a.m., Christian König wrote:
>>>>> Hey, Andrey.
>>>>>
>>>>> while investigating some memory management problems I've got the 
>>>>> logdep splat below.
>>>>>
>>>>> Looks like something is wrong with 
>>>>> drm_sched_entity_kill_jobs_cb(), can you investigate?
>>>>>
>>>>> Thanks,
>>>>> Christian.
>>>>>
>>>>> [11176.741052] ============================================
>>>>> [11176.741056] WARNING: possible recursive locking detected
>>>>> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
>>>>> [11176.741066] --------------------------------------------
>>>>> [11176.741070] swapper/12/0 is trying to acquire lock:
>>>>> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>>> dma_fence_signal+0x28/0x80
>>>>> [11176.741088]
>>>>>                but task is already holding lock:
>>>>> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>>> dma_fence_signal+0x28/0x80
>>>>> [11176.741100]
>>>>>                other info that might help us debug this:
>>>>> [11176.741104]  Possible unsafe locking scenario:
>>>>>
>>>>> [11176.741108]        CPU0
>>>>> [11176.741110]        ----
>>>>> [11176.741113]   lock(&fence->lock);
>>>>> [11176.741118]   lock(&fence->lock);
>>>>> [11176.741122]
>>>>>                 *** DEADLOCK ***
>>>>>
>>>>> [11176.741125]  May be due to missing lock nesting notation
>>>>>
>>>>> [11176.741128] 2 locks held by swapper/12/0:
>>>>> [11176.741133]  #0: ffff9c339c30f768 
>>>>> (&ring->fence_drv.lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
>>>>> [11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, 
>>>>> at: dma_fence_signal+0x28/0x80
>>>>> [11176.741151]
>>>>>                stack backtrace:
>>>>> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
>>>>> 5.15.0-rc1-00031-g9d546d600800 #171
>>>>> [11176.741160] Hardware name: System manufacturer System Product 
>>>>> Name/PRIME X399-A, BIOS 0808 10/12/2018
>>>>> [11176.741165] Call Trace:
>>>>> [11176.741169]  <IRQ>
>>>>> [11176.741173]  dump_stack_lvl+0x5b/0x74
>>>>> [11176.741181]  dump_stack+0x10/0x12
>>>>> [11176.741186]  __lock_acquire.cold+0x208/0x2df
>>>>> [11176.741197]  lock_acquire+0xc6/0x2d0
>>>>> [11176.741204]  ? dma_fence_signal+0x28/0x80
>>>>> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
>>>>> [11176.741219]  ? dma_fence_signal+0x28/0x80
>>>>> [11176.741225]  dma_fence_signal+0x28/0x80
>>>>> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>> [11176.741240]  drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
>>>>> [11176.741248] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>> [11176.741254]  dma_fence_signal+0x3b/0x80
>>>>> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
>>>>> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>>>> [11176.741284] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>> [11176.741290]  dma_fence_signal+0x3b/0x80
>>>>> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
>>>>> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
>>>>> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
>>>>> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
>>>>> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
>>>>> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
>>>>> [11176.742402]  handle_irq_event_percpu+0x33/0x80
>>>>> [11176.742408]  handle_irq_event+0x39/0x60
>>>>> [11176.742414]  handle_edge_irq+0x93/0x1d0
>>>>> [11176.742419]  __common_interrupt+0x50/0xe0
>>>>> [11176.742426]  common_interrupt+0x80/0x90
>>>>> [11176.742431]  </IRQ>
>>>>> [11176.742436]  asm_common_interrupt+0x1e/0x40
>>>>> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
>>>>> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 ff 
>>>>> e8 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff fb 66 
>>>>> 0f 1f 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 75 c8 
>>>>> 48 8d 14 40 48 8d
>>>>> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
>>>>> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
>>>>> 0000000000000000
>>>>> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>>>>> ffffffff9efeed78
>>>>> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
>>>>> 0000000000000001
>>>>> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
>>>>> ffff9c3350b0e800
>>>>> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
>>>>> 0000000000000002
>>>>> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
>>>>> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
>>>>> [11176.742495]  cpuidle_enter+0x2e/0x40
>>>>> [11176.742500]  call_cpuidle+0x23/0x40
>>>>> [11176.742506]  do_idle+0x201/0x280
>>>>> [11176.742512]  cpu_startup_entry+0x20/0x30
>>>>> [11176.742517]  start_secondary+0x11f/0x160
>>>>> [11176.742523]  secondary_startup_64_no_verify+0xb0/0xbb
>>>>>
>>>
>

--------------6859E91F491FB8B564A6EAE7
Content-Type: text/x-systemd-unit; charset=UTF-8;
 name="draft.path"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="draft.path"

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..011cb99afdfb 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -459,9 +459,21 @@ int dma_fence_signal(struct dma_fence *fence)
 
 	tmp = dma_fence_begin_signalling();
 
-	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
-	spin_unlock_irqrestore(fence->lock, flags);
+	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+				      &fence->flags)))
+		return -EINVAL;
+
+	trace_dma_fence_signaled(fence);
+
+	lock(&fence->lock);
+	while(!list_empty(&fence->cb_list)) {
+		dma_fence_cb cur = list_first_entry(&&fence->cb_list, struct dma_fence_cb, node);
+		list_del_init(&cur->node);
+		unlock(&fence->lock);
+		cur->func(fence, cur);
+		lock(&fence->lock);
+	}
+	unlock(&fence->lock);
 
 	dma_fence_end_signalling(tmp);
 

--------------6859E91F491FB8B564A6EAE7--
