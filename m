Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37A3A839E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 17:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE86E3A0;
	Tue, 15 Jun 2021 15:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D418189E7B;
 Tue, 15 Jun 2021 15:06:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARqU6p/fQUNhd8j4mvJbgifj8MJ+ouik97fXN48qO9pBBkXz2pni8FVVOWW6ZujyxyRbH9SeBHLdZMH1vJgxKwE3hclzgJXhSxn+s/dR0IMPC1KF7RFIk8tc6FLAxQiYZRFWI+42KQW9Y7kqAwelPu5sXFhq2/uIXIqQA0nL+12Cn02NK2MXHrBN4lYyXbuBxxc2LbwTsocmq1TqbguVzDj2dC9k55vuVgb9USFGwA01wxz+hOHrp6p4v8bjWZNAb1ukl1WR+yAy9wGh4JeaoeG8wblKBCO1HvD8gLdAZleRIGqFmxhvObN7oNz3/ErE6VjNK3Bnzln0P0vorRkTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kNEazOZBEll4JajZbiJuKfz9UXuPDMEAOb/fAHucFk=;
 b=OnQ5yoUphGD4mG6pXclAHG8M9Uxq24gC1N5QB0ynbtW4JmCHa8U3xcaqlPYL0Bux1NFnaZLuVJ6JIkHnCe9qWXJQ/aZL+tp2h2/jynzjBXbd3Jpi2rR99txvnnR19KxWnJGt5f5+KPmXc4cltXCZVHtdCkm4jOPBKwc1xoiK8U6iAccItx5ZjsiSivMZtNg2oacWWhsTUKY+Que/JMEENoInEyzcFoq2+3+IjrRdbsOY55rGjJPGMEKvd5O9ZViCX9pe1AtDIxWoco2EEf6Di/FeO85fWJV4acqzPBMa0dkaW3wqPG0FWvhJPIB5FZ0ZWOWc0EBlZxQuSGcFx4EE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kNEazOZBEll4JajZbiJuKfz9UXuPDMEAOb/fAHucFk=;
 b=IWtUJ5jf73bNEbHOQ+cs3XQ/aod6EqkkGktuY7bmU/5vpxXJYY+YCbpHLvJZUPlx/R38m34sepiMmxnGZRDGQFN57XORAu6qfegv0N05PER6ALU7wCcrW6238BMzUEGzmw/xqEOordDwSqL1XB7URx+sLj0wRC7jObzYGiLPETs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5116.namprd12.prod.outlook.com (2603:10b6:408:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Tue, 15 Jun
 2021 15:06:05 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 15:06:05 +0000
Subject: Re: [RFC PATCH] drm/ttm: Do page counting after populate callback
 succeed
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210615115746.27424-1-xinhui.pan@amd.com>
 <f70e88b3-f0db-fca8-f05e-f685f1a913ad@gmail.com>
 <4719A30A-0B23-4053-B8EB-AC9BD21DBE40@amd.com>
 <88115e0c-5cee-5b16-f60f-480136f0bcad@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <da147e95-e59b-3f38-2ba2-9f4447f7ea86@amd.com>
Date: Tue, 15 Jun 2021 11:06:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <88115e0c-5cee-5b16-f60f-480136f0bcad@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.203.225]
X-ClientProxiedBy: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.203.225) by
 YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Tue, 15 Jun 2021 15:06:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48489216-cd7b-4e82-d881-08d9300f18de
X-MS-TrafficTypeDiagnostic: BN9PR12MB5116:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB511673A837541AB8A5EC8F5792309@BN9PR12MB5116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kA007wykb2hBw1zsySK5G+gS+/zPSM6D8X+WesNhokmKa9n/BTL0/fp8B15dg5/IJRvgR0LtbX2cVZbLji1Fd8iD5A6VRUg1IAmZy8XSBbKujpwwXlNdowl+GrhuTw0bDTRGsOMXaE1UAHhgO5SBh3OP7eOQwBS9rHfd9LSV5QtOjU3ya16RDbQWZcxQmix/FqI/ZwkNQFmR1aZDqHAO7QbwPtjY+ErlJHZqf0HosA+Zhdo8d1tXyjgs5rjUMarrwQAdP1tHuu3D1ELEUjqt6pAALrw9TRv+3wuFH/jYlwzw0bIEz1DN1Sh02kIw8McxktLd62A3DEVIjDdODMCROsobKasCaQhSFoLdvLkN5rxNCQucH+BzlgL9ESje5njugo8nX3iSL/6FpICmLqyW0F/nyNVezAaMW0IB6zof5+oWncG4AblSOtAHxLVOCwz+S0+9V1tRZ0aJwySm14GbP742bpJhxB6WBED9zZsxnQP8w50U3xwm6URSFG/bPRanqIBr/+HrFqO9Ktn7OYohy3k6DPDMS9DrIX1jNlLOmztxnz/xGV5Hg28lp3Y+hLdraHfUXw6hih2OAQzQdvjIGTU2N199M/0u2UISHrdNoSZAwkzVoU6y6c1QmLuGCMDNkftu1U/XVh5Zw0ZDGVmbUx64KT+Z013qbskWXNjmXnFKuaxqW26CV74ZMTgToJq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(66476007)(66556008)(8936002)(2906002)(86362001)(8676002)(44832011)(16526019)(38100700002)(478600001)(186003)(4326008)(66574015)(83380400001)(110136005)(54906003)(5660300002)(956004)(31696002)(26005)(316002)(16576012)(6486002)(36756003)(31686004)(66946007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFkvSzhuVnZNRDdBNy9mMlRpRlNrUjhFQUk2Vm1tYml5biswSXg1Q2luaFpJ?=
 =?utf-8?B?UEFJNERCQ3VqdmszTkViaUdkUGkzQk54WmgvbzNzd3RMWC9ucllIaHB1MjZw?=
 =?utf-8?B?N2V2R3VXeXFuZkJkSi8wbHZUZUt0ZVJtWldCbnBheGNWV2RpNXloVTN0Nnph?=
 =?utf-8?B?ZUxhMXVZTWYvalJScThQQTB6L1VWTEwwZzNteDNwalFHakRPdzZEZTR2SDVi?=
 =?utf-8?B?MUdXS2hWNFU0RHh3cW1FbDFnMndvL2E3R1JRTVg4bUlHb2hZYlllZzkzRlYz?=
 =?utf-8?B?LzZINTJsQ1pHbWIzL3F1OUVISzFWR0VPVDYxMmlFc0g2YmhtSmNueE1KTnM5?=
 =?utf-8?B?a1FNcnR5bGo2UnVkUG00VnMwK3RZUWZoZjhScXk2azcvUE9nSGh5Y21QUlFR?=
 =?utf-8?B?UnNhTDBaSlZvRWlreThTc25tQnJ6SDFtMmU0YThqNVh6WWdQdkY3d1NqelBT?=
 =?utf-8?B?Tm9jREpIQ3ptRnBCT0R6bmhxRzMrUStkc2Y4TVRleHZ3L0ZLRWdibzc0TGtX?=
 =?utf-8?B?Q3Vtakl2MDhCYWphTURpK2l4b3RkNThhcGJsZ1B5Q1RRY2p5anp5a0xMeHJq?=
 =?utf-8?B?dyt2bENDcXRkV29IT3hCTE9RZjFCa3BpOU9XR2FnL2MwcE96YkplOVFpVUN0?=
 =?utf-8?B?R0RSYmhOc3ZyaUQreWNyb1kxbE81bWdpMXN3aFVQcjU2RmNsMVUvODBXem9N?=
 =?utf-8?B?WlZOaitFeVp0Q0k1ejZra2w3VU13bERrL1VIYUN2KzdnbThKVnNpS1JPRnJJ?=
 =?utf-8?B?aUpGaXpNYXNRMnBIYU8xMW85VkwvYnNtYmcydG50VTFMSyt2R1VkL2QyWUZG?=
 =?utf-8?B?QXhnTWxwV0JzczY2elU4ZDIwbGZVenYwS0sxL1dQU1RwSFFvb1Q0dW8rVzJP?=
 =?utf-8?B?Q1JFRFV6Z0tuaWRJcnQ3eDV1dWtZMmU4b3lmdU1COGs5K3VKVnd4ckxQVW0r?=
 =?utf-8?B?QzZyWnp1VjFQaU1VVkJmeUNnYk1OL05nMG1teTJXNkhzcEp6MWpGTTU3QlRa?=
 =?utf-8?B?dHRzSmpnK1ZVQ2FnTFdQci9SVUtMQUgvZmdra1V4M2djMFR1NXUxR0xINjEx?=
 =?utf-8?B?cmdzdHlVa2czN3pBMUdIRDVjaTNpVlZkUTRZN0lIUlU0dUJNNUdwZkRuK0Y1?=
 =?utf-8?B?SHlHYzRHcTRKRWE0WkVIVURJRnN1UkoraUFSUUhZMGREMUx1dS8yYTJ5SVRJ?=
 =?utf-8?B?cU53T2c4QWdqTDY1UUttOWFEZ2VBcU9oT1AwNFJVeWxXL096eW4xQU1XWnd4?=
 =?utf-8?B?bUlLQit5ZEtjNGZKQkVsenNwT3M4bEJkUkJDWDg0bldRU1Bvc2FyTVNmem40?=
 =?utf-8?B?ZW1naE5FN2RndDRsNGJFZVYza3hlc25IcldWelEyQnh0L0JqQXd2Skt1UWRi?=
 =?utf-8?B?YkQ1RWtLajA0S2xwVzFxUXM2WHZYYkVpZWdyTi80d2YvRmFhTS9heklOVy9V?=
 =?utf-8?B?YTZNWlYzTUQxQjZ1c1UyZm9sNS83K1liblR1aWRBUjdWNWNBR2owbitINzNE?=
 =?utf-8?B?RzgzdTltOHBKS3JIbGpGRjlEZEJVcmUwL3ZNbzRrOWZXdEhFNUpzajBScjVV?=
 =?utf-8?B?L09uZFo1NXlwbzArQ0laY1h2S0RqL0R0eXNnbU14b2ZWcFpkTGt2MEc3Ty9G?=
 =?utf-8?B?YTNERjJLR1pVSHVkcW1McmtJUjk2bnc3eHhFbmFmTitsb3h5V00xaHgyazV1?=
 =?utf-8?B?OGN2UjJ3WWNrRE4ycWNseUVYTXZmdGtvcVo4ZlgrS3liT0tYNGRTamRaUVNK?=
 =?utf-8?Q?HOtEVrMUEpBxA0hYZcaExANhdnDAcNaWVrcS1JD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48489216-cd7b-4e82-d881-08d9300f18de
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:06:05.2503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkSruNlVDgWmerkSdCsCOLKm/qj6/ZWUlBuAm+Sml1DrvDsZ2a0zSn/XhXddU9nYqFDz/WN/IXI8GAkQTFXzZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5116
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-06-15 um 8:18 a.m. schrieb Christian König:
> Am 15.06.21 um 14:11 schrieb Pan, Xinhui:
>>> 2021年6月15日 20:01，Christian König <ckoenig.leichtzumerken@gmail.com>
>>> 写道：
>>>
>>> Am 15.06.21 um 13:57 schrieb xinhui pan:
>>>> Amdgpu set SG flag in populate callback. So TTM still count pages
>>>> in SG
>>>> BO.
>>> It's probably better to fix this instead. E.g. why does amdgpu
>>> modify the SG flag during populate and not during initial creation?
>>> That doesn't seem to make sense.
>> fair enough. Let me have a try.
>> No idea why we set SG flag in populate years ago.
>
> That's pretty recent IIRC. Felix moved the code around a bit to fix
> another problem.

I moved some code from populate/unpopulate to backend_bind/unbind for
attaching and detaching dmabufs. I didn't change the setting/unsetting
of SG flags for userptr BOs. That goes back all the way to 2015.

As far as I can tell, this is needed because userptr BOs are not created
as SG BOs. That's something I've also pointed out before.

Regards,
  Felix


>
> Christian.
>
>>
>>> Christian.
>>>
>>>> One easy way to fix this is lets count pages after populate callback.
>>>>
>>>> We hit one issue that amdgpu alloc many SG BOs, but TTM try to do swap
>>>> again and again even if swapout does not swap SG BOs at all.
>>>>
>>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_tt.c | 32 +++++++++++++-------------------
>>>>   1 file changed, 13 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>> index a1a25410ec74..4fa0a8cd71c0 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>> @@ -317,13 +317,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>>       if (ttm_tt_is_populated(ttm))
>>>>           return 0;
>>>>   -    if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>> -        atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>>> -        if (bdev->pool.use_dma32)
>>>> -            atomic_long_add(ttm->num_pages,
>>>> -                    &ttm_dma32_pages_allocated);
>>>> -    }
>>>> -
>>>>       while (atomic_long_read(&ttm_pages_allocated) >
>>>> ttm_pages_limit ||
>>>>              atomic_long_read(&ttm_dma32_pages_allocated) >
>>>>              ttm_dma32_pages_limit) {
>>>> @@ -342,6 +335,13 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>>       if (ret)
>>>>           goto error;
>>>>   +    if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>> +        atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>>> +        if (bdev->pool.use_dma32)
>>>> +            atomic_long_add(ttm->num_pages,
>>>> +                    &ttm_dma32_pages_allocated);
>>>> +    }
>>>> +
>>>>       ttm_tt_add_mapping(bdev, ttm);
>>>>       ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>>>>       if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>>>> @@ -355,12 +355,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>>       return 0;
>>>>     error:
>>>> -    if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>> -        atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>> -        if (bdev->pool.use_dma32)
>>>> -            atomic_long_sub(ttm->num_pages,
>>>> -                    &ttm_dma32_pages_allocated);
>>>> -    }
>>>>       return ret;
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_tt_populate);
>>>> @@ -384,12 +378,6 @@ void ttm_tt_unpopulate(struct ttm_device
>>>> *bdev, struct ttm_tt *ttm)
>>>>       if (!ttm_tt_is_populated(ttm))
>>>>           return;
>>>>   -    ttm_tt_clear_mapping(ttm);
>>>> -    if (bdev->funcs->ttm_tt_unpopulate)
>>>> -        bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>>>> -    else
>>>> -        ttm_pool_free(&bdev->pool, ttm);
>>>> -
>>>>       if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>>           atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>>           if (bdev->pool.use_dma32)
>>>> @@ -397,6 +385,12 @@ void ttm_tt_unpopulate(struct ttm_device
>>>> *bdev, struct ttm_tt *ttm)
>>>>                       &ttm_dma32_pages_allocated);
>>>>       }
>>>>   +    ttm_tt_clear_mapping(ttm);
>>>> +    if (bdev->funcs->ttm_tt_unpopulate)
>>>> +        bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>>>> +    else
>>>> +        ttm_pool_free(&bdev->pool, ttm);
>>>> +
>>>>       ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>>>>   }
>>>>   
>
