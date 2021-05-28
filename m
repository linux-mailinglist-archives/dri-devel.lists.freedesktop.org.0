Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB35394418
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 16:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811A46F5CF;
	Fri, 28 May 2021 14:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7525C6F5CB;
 Fri, 28 May 2021 14:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLg6w8zyAbZQzesjh5k6QcmVww/dhq0qA+o0gPZkhWrl9iFzxXmu21FPf6HXBBagkjtzk9lzI8VZXzoS0M5tXEJM4UR2HUB04VmfAc/3igemaahvORG/nZ1fshE1XVzk8Dt+rqIfylmoUnMoEflC2LHV7qZ/ambQXoPO+bsqBvQ8dDvacfz4vUV3JgHh2qqT+3AxJsn1xR8Oipw9iHrTQYbXngIo913C/5jajhfFYBF4nbfpr87UC7Z7BmqGhXpZAlgwi9oKQNl1HbvdneZN9TuUsRkvc/7b1EaZZ5kPniPbyES1bn+m5fcTwoyI17Ulsn7KN4O3LUg9X//5IfpgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKRPmtIhQELy6UJGZTjYcf0+YqSFZI3JB4EVAQLs3bE=;
 b=KNU4r7+FTmt2wnh27Zqmk1Cl4XIrR+tlCbXpFRQUF2qk2B7UyDdqRj86cTMlNlRwzwOXAYpaVJgTujb6o2cB2XMFhJI0VKSDYpNVkvJDmPI+uLJSjnc1cZ/xof9N8jWgVgkictx4ROqRrMX2qXW3Kr6MsH3FOOlOy6XL0YIR4w1o25ziiN4MWe8dZpar9/v8fmIqvlc/rZhOIbyojYGcrg2NJBPKxsEhjeP28BJuTbnI4PwmhHIW/1g0hRo9Bqlq1uv91MRlkrM+UlxSCW+PqcCY4wajg2+l43hkxhOrzmaBCNuQiVZMQ1I5wW3IWM6QqrZSvv55uS6KVFETt8GyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKRPmtIhQELy6UJGZTjYcf0+YqSFZI3JB4EVAQLs3bE=;
 b=zihfiEj7ns3aApZqj8/L6/wOR9uzpBt/QfCswu65+3QeSkche7iLLziMEC8sixMUtRb4NFT3JsWk5vIz6DoxAdO6nFAcO+zoVUHf6GbKBjGrqgiNL/md6OHMnmLQKkyUCm+N1xQ8DyxMtPSVwRUAhO71/xu+ztDlB+R+43rAkJA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3837.namprd12.prod.outlook.com (2603:10b6:208:166::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 14:21:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 14:21:04 +0000
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
 <37dacfad-b557-b210-02f0-7afa202bac51@amd.com>
 <f8220d79-240d-1ee8-b2f6-c28927b2856f@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <52bb8d06-4167-baee-92e5-1d61ea037d81@amd.com>
Date: Fri, 28 May 2021 16:21:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f8220d79-240d-1ee8-b2f6-c28927b2856f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a878:922a:f147:ebc]
X-ClientProxiedBy: PR3P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a878:922a:f147:ebc]
 (2a02:908:1252:fb60:a878:922a:f147:ebc) by
 PR3P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 14:21:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32cc0779-5363-4678-d0db-08d921e3d3ef
X-MS-TrafficTypeDiagnostic: MN2PR12MB3837:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3837E30E1547E7090136068983229@MN2PR12MB3837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNusQCw3nsuYH9pam8flb1w/XaiekmE8R6jlSGLncadByJo3Zfno8LNdpN2X8NATPai/KNCYkHFyI4vjlnMkB3c6+JKBjgxWv2ZoUuxvksRpHwYilRcjIKq0ZYo/20i4ruafs0Czh6OE0fXfAkpjzcMnKY7zPU1411JXGzxgc0cAsjMJg3xAbkbM/OeTdxCmlyxxKMn7IMRq9OzAvWVLhnqyPxnEFMRHNjxg3+3OueKp7BnEzUXNEVBwf/pOssT6BK35kPCyOQ+CUnOvEvQvgBMCs1p+zGc5EYXgpzA5/LrZBnI7lkjkwnMoDf/4wIUL3l9RU79wdOw5hCvT8XAMMgABL7V+XwoaCFwjrlcEBU+ROGED2tWq6yKtNGAdoMb5w2uFbjCHXnAzcSU3N5ppQvRq0HP6NoXnEh32mIcZEL3erPjywXG35tHlJcCqoeSd2dS+uhQoxyX9LB9rSWXx1ktSmqWQNlG5QwHxC+Hx0YYK6ZWFCEGwTDSCCqs+N4JRX+F20A76QQ+t/UBwiYGFWrWt2JV0PZZza7jsA5XD6bYDaLTjjprtjPRu0wQWskwL2xvinsozvqEZwo6xv0/xGtOg9PPUh8pzxe85xvCerO2w8C6LOx9YU9jx+gLrBiR3DDutpkdZtKkuTOHA2/EEiqxXStp2ledo1iM0HcSOWNTr0nzBpdj1o809+0UxJKIHkvGp/JHNVas8EYHldtOc5NYRt2PNORKQ/dR5XnZgRhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(53546011)(36756003)(66574015)(6486002)(38100700002)(45080400002)(66476007)(478600001)(83380400001)(966005)(66946007)(316002)(86362001)(6666004)(16526019)(66556008)(2906002)(31686004)(31696002)(2616005)(5660300002)(8676002)(186003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUVKR0ZYanFMYWh2RytCMS9RSjFVZ3Y5QjIxOU9PZTkvNWRKa3dTT3NPVmx2?=
 =?utf-8?B?TGR6RTZOenBDWGg1SGZhdHYxVHltdHhPeHhzNnRqSHI5bHE4RzVDQ2JlZ0tM?=
 =?utf-8?B?NVJMOXZrTFdlWFNsbmVmZ3IrK3U5VWdtSy9KSVZtcUk3dzFaRmdyUUFxMWR4?=
 =?utf-8?B?TGNaUU15eXl4U01VUXIvQ0NGcmRFSkdYWGppWk8xZXRpY1hNb09lbm1HYUpl?=
 =?utf-8?B?QW5rRTlMT3pVYXFUV0p1dnNMTnFWSmZROXBEeEtyWUFPUHhvdHBpSEQxcjds?=
 =?utf-8?B?ekZQYkkyZC9WR2U5MjkxZHh1R1l3SjR6TzFMdHRkUStvVnVsMHIzL3ZMc1gw?=
 =?utf-8?B?K2JqU2YxU1Zrc1NRUkpmZGdiN2RhR2VFZUgraDZHSm55TnNCN29QK1BnTDhN?=
 =?utf-8?B?OTZFRVM5VkpxeWdDdDFBbWRWUVV4QmNveUl6TmhuLzlQNDFkMVFyaUZkcUh2?=
 =?utf-8?B?KzEvZ1gwa0tYczdRdEpSR2txUXBoNVJxNG5WZTRSZ0F4Ri9EZUhYR0NPTkM5?=
 =?utf-8?B?dGpkQUwvejArZ2hhTm96UE9DT2RCMTFzaTkxRFhDVVNNT3FoeGtEelp6QWFx?=
 =?utf-8?B?VGtDbjR6NWl3Y2x2V1k3U0UybUFXMXBUalBSK1JFQVBMTDk4V3RIdW1IdVdQ?=
 =?utf-8?B?NUFsTkJHUjlsdzVKbVJTMkdTSW92QXdYY1VyYVE2THdTaTVKQjJSQTNndFd3?=
 =?utf-8?B?S0RtTjR3V0FoWnZGRWx4MFRocWlaVzZHVFlLWWFCNXVhWlhQcmppc1Q0VFJX?=
 =?utf-8?B?Vytwc2xKSTRGeVdDODZURCs5dUt6N2pmcXk2WVMvdHdMQzZuN1QzeVpxaHU4?=
 =?utf-8?B?eTdBeXJRaWg3SEF6L0IxZU9UL2dRV0wvelU1Y2pORU4yZjlPMTZrYXJRMkJ4?=
 =?utf-8?B?Vzl4RDlPY00yYTUvWWlxTVhGMVkyaWo3a2REYTNRMlpEanczR2lmK3NXRElW?=
 =?utf-8?B?M2tQdWcyTUlSeXFrd2RHeVRNbGhCK3Bmd010MnZESGxMRDB4SkVvV3BaZkxz?=
 =?utf-8?B?LytBNXRIU3d4NERpbU1Ra09kRDVZOUQvaWdxWVpVK2hySWtQcko2UkNvd3RD?=
 =?utf-8?B?eldscjQ1OXZwWnIzSjFzYmFvN29uTUpWM1ZjSUtTNzZKVHdkdVNidjVHUTJp?=
 =?utf-8?B?Si9oWEFrRHk0dWhNdm9naGNDN2lwaTJickEyM1A5aXZpb0pnZ2JFTHhTcm5m?=
 =?utf-8?B?T2FmVzVoYlRHRHlXZU9RMVc3Y0lZdWJTZ01YSHRHNHg1MmVKcHdpTzFlZnJV?=
 =?utf-8?B?cloyMWxlMHlvV3cwcDk2Zmp4OG1JQWM1YUFsdnlrZjFXcGFvMEpNbEtPODlI?=
 =?utf-8?B?YUkzVXhwMDBtTUpxWGJqS3c3V3cvR3E4aGR6clJKNDRUTUxOWHFQK3RZWlEv?=
 =?utf-8?B?Q0twK09HampScSt4OElKU21wTFJoaUo5Q05tVUdkQkgxL0lnSnc2K1RjS0h6?=
 =?utf-8?B?K2ZBc0VOcmY3TlBVUFRiNDZ2b2FicFRxam16eEUvSTJ5VnMxVnhNd3pJaTFI?=
 =?utf-8?B?WXI4bnBnVTMxUnIwM05jUE9SMHVBcURLOGFyYU9xT3RlbnBGbnVJbmxmdXA0?=
 =?utf-8?B?TWw3WVdHcWNsSGRjbU1LZVFXbHVkOHpxb1M3L0FhUXJPN1hnVGIyU2o1ME5I?=
 =?utf-8?B?VDMxckVzdEdEQit5T1ZJRjR0ZVdSWEpWUXhhNjZkU3VGZTB5ZUJnT0FtcThY?=
 =?utf-8?B?dXZtalh3NFZ5dTlHVno1V2ZnNkkwSzVaWGZ6Rk5meWZDNUxDdlRCaXhUVmM2?=
 =?utf-8?B?eVdXSDRQQXBNK21HRDhHOVpqOXJzSjQyZGNnVVBaMHhPSlY5ZC8vNk1EZEJt?=
 =?utf-8?B?UVVWUk5QZFh5VllqVWVIdHc4ejFIeGxSS3Z3d2FscmhsSUJuQm9mRG1VdkVM?=
 =?utf-8?Q?92lp4cxvWBewK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cc0779-5363-4678-d0db-08d921e3d3ef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 14:21:04.8386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmzQRJr97KVlWcNF64q/dBOGH6L8nyqyL38heaLcDIaKIe4igm2N1EKVmeeaxqSK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3837
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



Am 28.05.21 um 16:17 schrieb Thomas Hellström:
>
> On 5/28/21 4:10 PM, Christian König wrote:
>> Am 28.05.21 um 09:33 schrieb Thomas Hellström:
>>> On Fri, 2021-05-28 at 09:16 +0200, Christian König wrote:
>>>> Am 27.05.21 um 17:51 schrieb Thomas Hellström:
>>>>> On Thu, 2021-05-27 at 17:32 +0200, Christian König wrote:
>>>>>> Am 27.05.21 um 17:05 schrieb Thomas Hellström:
>>>>>>> On Thu, 2021-05-27 at 17:01 +0200, Thomas Hellström wrote:
>>>>>>>> On Thu, 2021-05-27 at 16:54 +0200, Christian König wrote:
>>>>>>>>> Am 27.05.21 um 16:19 schrieb Thomas Hellström:
>>>>>>>>>> The swapping code was dereference bo->ttm pointers
>>>>>>>>>> without
>>>>>>>>>> having
>>>>>>>>>> the
>>>>>>>>>> dma-resv lock held. Also it might try to swap out
>>>>>>>>>> unpopulated
>>>>>>>>>> bos.
>>>>>>>>>>
>>>>>>>>>> Fix this by moving the bo->ttm dereference until we have
>>>>>>>>>> the
>>>>>>>>>> reservation
>>>>>>>>>> lock. Check that the ttm_tt is populated after the
>>>>>>>>>> swap_notify
>>>>>>>>>> callback.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Thomas Hellström
>>>>>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>>>>>> ---
>>>>>>>>>>      drivers/gpu/drm/ttm/ttm_bo.c     | 16
>>>>>>>>>> +++++++++++++++-
>>>>>>>>>>      drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
>>>>>>>>>>      2 files changed, 18 insertions(+), 6 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>>>>> index 9f53506a82fc..86213d37657b 100644
>>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>>>>> @@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct
>>>>>>>>>> ttm_buffer_object
>>>>>>>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>>>>>>>            if (!ttm_bo_evict_swapout_allowable(bo, ctx,
>>>>>>>>>> &place,
>>>>>>>>>> &locked, NULL))
>>>>>>>>>>                    return -EBUSY;
>>>>>>>>>> +       dma_resv_assert_held(bo->base.resv);
>>>>>>>>>> +
>>>>>>>>>> +       if (!bo->ttm ||
>>>>>>>>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>>>>>>>>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
>>>>>>>>>> {
>>>>>>>>>> +               if (locked)
>>>>>>>>>> +                       dma_resv_unlock(bo->base.resv);
>>>>>>>>>> +               return -EBUSY;
>>>>>>>>>> +       }
>>>>>>>>>> +
>>>>>>>>>>            if (!ttm_bo_get_unless_zero(bo)) {
>>>>>>>>>>                    if (locked)
>>>>>>>>>>                            dma_resv_unlock(bo->base.resv);
>>>>>>>>>> @@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct
>>>>>>>>>> ttm_buffer_object
>>>>>>>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>>>>>>>            if (bo->bdev->funcs->swap_notify)
>>>>>>>>>>                    bo->bdev->funcs->swap_notify(bo);
>>>>>>>>>>      -       ret = ttm_tt_swapout(bo->bdev, bo->ttm,
>>>>>>>>>> gfp_flags);
>>>>>>>>>> +       if (ttm_tt_is_populated(bo->ttm))
>>>>>>>>>> +               ret = ttm_tt_swapout(bo->bdev, bo->ttm,
>>>>>>>>>> gfp_flags);
>>>>>>>>> Exactly that is what I won't recommend. We would try to
>>>>>>>>> swap
>>>>>>>>> out
>>>>>>>>> the
>>>>>>>>> same BO over and over again with that.
>>>>>>>> But we wouldn't since the BO is taken off the LRU and never
>>>>>>>> re-
>>>>>>>> added,
>>>>>>>>
>>>>>>>>
>>>>>>> In fact, we'd probably might want to take the !bo->ttm bos off
>>>>>>> the
>>>>>>> LRU
>>>>>>> as well..
>>>>>> No, we don't want to take any BOs of the LRU unless they are
>>>>>> pinned.
>>>>>>
>>>>>> Adding a TT object or populating it doesn't necessarily put the
>>>>>> BO
>>>>>> back
>>>>>> to the LRU.
>>>>> OK, but swapped bos are also taken off the LRU list so these
>>>>> unpopulated bos are just taking the same path. Only difference to
>>>>> swapped is that they don't get read back on re-populate, but
>>>>> typically
>>>>> cleared.
>>>>>
>>>>> But what would be the point of keeping swapped-out bos on the LRU
>>>>> list?, particularly when we're iterating under a spinlock?
>>>>> Shouldn't we try to re-add to LRU (if not already on an LRU) just
>>>>> before populating? There aren't really that many calls in core TTM.
>>>> I want to avoid removing BOs from the LRU as much as possible since
>>>> we
>>>> forgot on multiple places that we want to re-add them.
>>>>
>>>> Conceptual I think the swapped BOs should have a separate memory
>>>> domain,
>>>> this way we can ignore them cleanly when swapping things out.
>>> Yes, that would of course work as well. Keeping them on the system LRU
>>> is IMO highly undesirable.
>>>
>>>> Going to pick this patch up, modifying it a bit more and then pushing
>>>> it
>>>> to drm-misc-fixes for upstreaming.
>>> OK, I dropped the TTM fix for the purge-in-swap-notify from the i915
>>> series, hoping that the reworked variant of this patch lands first.
>>
>> You will still need to add the second ttm_tt_populated() check since 
>> I dropped that for the back which I want to push to -fixes.
>>
>> Regards,
>> Christian.
>>
> OK, great. then you have my S-O-B on this patch.
>
> BTW that original patch that added the ttm_tt_is_populated() was 
> considered "LGTM" by you, except for this ttm_tt_is_populated(). So do 
> I have an Acked-by: on that now?
>
> That is
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F435833%2F%3Fseries%3D90681%26rev%3D2&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4580ac1413cb414888a008d921e35e49%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637578082688432837%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=VHROKh319e5jJL9grI31fLnA3ByJpEuML3PoJB7T2Lg%3D&amp;reserved=0 
>
>
> plus the check added?

Yeah, sure.

Christian.

>
> Thanks,
>
> Thomas
>
>
>
>
>>>
>>> Thanks,
>>> Thomas
>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> /Thomas
>>>>>>>
>>>
>>

