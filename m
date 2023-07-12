Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E89874FFA0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 08:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FED10E498;
	Wed, 12 Jul 2023 06:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDD210E497
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUQrn9YA7cMl/cYJCiFnku7RFJ45Vvh8e4xTEAyf++J1wVsW106rXsbqMQAKaDgj3SWzaC826mjgjngk/rNlFZ5onx+1X7ZCg6OvQz0X+0/yG3vfaPHu3mMzrjwNX9pD3af5/45WestxaF6dRNoYxRMNW4oRmR1S5psh15UGMUs7lqjIy33le/5AMIyo+Tl/SV8BBuTkofkrOHfpkwNHG+QYmpowzLxeLoHyWDXFfAdTm1HIlDfkPzHwoexb09kV8T2c+aFG07qQJjIxzF5OAen+8GRgqhp0pT7ihkqmitedZqEdRNv0k7oOkusEZ1ooWCz0rHg/Bqyz5ZBLWbwm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv7FosrDYe25BpFkpNFj7bAUHI0hgJpYSXjZRsQets8=;
 b=Kt3y3ReqIvU/vGxJuJ40v26vbgpZ/Tx+7KZCZ1E1HWYc5mk4+k4fllDxsu/sffEsu4+IXSj5HCwOJERFxhA5ZMPnTYmR1UbRNn14jS9Tm2mzKzr1UuVLjtFJjtwPuUBPj4SjBReYs8poKkrklp62O3Aq1nAabHmcvwFXkylUsi8soN4RVDErDYgj+0kWaQWKBtc2Gg6AenSyXRlWjkigdUPLv4dMZjFi82HzqzFvlyMVnCCDGeXXDNjpdHlXfRA/GwYgV2RLQC4NN1E53xx42Gq6VR1qUtt/eIY7mI+WLQYWjuifKqvolSZ2ykoQt+zQ/HRMrP025dW83ir/2Zq6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv7FosrDYe25BpFkpNFj7bAUHI0hgJpYSXjZRsQets8=;
 b=uBAdCON6FFFrlzLMplsjjLWH76ZU/RZtwBAhqkmWzIKVjabKl4K+ydLGn41m33HuGilC50EaCI8lWtoN8V2PcLi1wn+wQCj3c1AQpAmVgbsgZtVHNs94j4vn3l38NFny+VSMpIPVdstnohMzmWtOR12z2a6am2P+sthUaMNNKk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8414.namprd12.prod.outlook.com (2603:10b6:8:fb::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.32; Wed, 12 Jul 2023 06:45:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 06:45:57 +0000
Message-ID: <5fd348be-ec2a-d3fb-49cc-bb7b214ca3c9@amd.com>
Date: Wed, 12 Jul 2023 08:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/scheduler: Add missing RCU flag to fence slab
To: Rob Clark <robdclark@gmail.com>
References: <20230710205625.130664-1-robdclark@gmail.com>
 <3bcebac5-81d8-79a5-cdfb-48db782ec206@amd.com>
 <501a3dd6-d313-a03c-4bd1-74f4d27d0487@amd.com>
 <CAF6AEGsBeEMyT2+Dj1AH_KoZTxmig4tkxPadAP77Eavy7UXgJQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGsBeEMyT2+Dj1AH_KoZTxmig4tkxPadAP77Eavy7UXgJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8c8a72-f91b-4904-92d2-08db82a3a4e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9bR8sGAUaZZbNUHOcwzDIEUQhybp6nBw8newCYSspSMnUCdG4OTGMeO3FsnPoVflF7oNLTYfmKzbEnVGkcMvGMad3646TU3IeCv+S/xs720fsCyV5nxdLJbXPMG+e0uEHd/58aT4msm8jWJOj+Tom2mv6TlPbS4Ycjx/oDYe9+6dhiHYS0eCbaONTdDZilkQRTDP6z1TfrCQC4Nl/j6+KmQpycLeGJDa0pJTb2AzOyivnKXDsYLA1CZsPDZee5oIp9ifId0+YQVHxr/eCS18gR3zdWWegP8Jo7OlWFH3rCeZntU+det4rz6ntXTa5uIEzBKSGRR9phO+dR3+uIMcHbs4CeuZ3hB6VGIFjlw4st8VoDkHg75Rxa8iWZfoPwzy+opbxDPs1yS8Nrsm76CjXqvfYT+1uXDZAv152pC6c5KAs6hE7G78/fsdCEX2Fc6/QFbIZqSbSlK2eQ3McUk+QRhMdkaoLCWWsbEuJ0u36nGspBM52Ez2ZVRJ40NkcrgUOkAhIV/pliksEdDmNEIwnPEXJ2AG6apk/AfNS6YzQhJ1JtkKw2tzCKyaB8Z6FeerPIzEDO+TEPnOa3TKEcJ3D3FWBSLYKEOlaS3wJBh/4isatmDGVMosgR+a4hAnFJfnFAoX7B+SZMS7GjR3odXExg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(31686004)(478600001)(6486002)(6666004)(54906003)(2616005)(83380400001)(66574015)(36756003)(86362001)(31696002)(2906002)(66946007)(6512007)(186003)(53546011)(6506007)(38100700002)(66556008)(8936002)(6916009)(41300700001)(4326008)(316002)(5660300002)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U01YZ1I5ZHA2ciswWkh1S2xBeGhTN0JZS0VhTXFxWU4zbjR4dVBzb0tlT0Nk?=
 =?utf-8?B?ZHV2NVZKbTh3bWl2bjlUSmZVL2REQkh1WHY2TDVya3V1cU9mMk5HQ2hIZVIx?=
 =?utf-8?B?ODN4L1ZzdFMzSjVSeGtlMi8wMFRIOXVCK09ZNGVqMGQvdlNQdDFIYTBQNC90?=
 =?utf-8?B?emVVTmhUbFZnVlFOYkptdWtOMVRxR2p5WWFrNWJaYmZnSXVwelVLdVFkZ3FL?=
 =?utf-8?B?azU5U1Z5TWFSUE1GSzRLSE10SEpabFltYkQ1NkJLWkh5Qmh3eERvekNOR3RQ?=
 =?utf-8?B?SzdWeDdRWk9oNGhTR2VyUGErWkJ6NjVtUXB5VmZaampRMkhTMytseDZEbXdO?=
 =?utf-8?B?VjVxS05tNFROMmZiU0F5WWxSOWtzblFGVGZKNnNicWM1ZllxNnRIekRBbzBz?=
 =?utf-8?B?TzRpdzkyT2ExV0VxQnByRnV0bWJFdXpyV0tGRnJxYVUzbXdIazBNSUhVY3NM?=
 =?utf-8?B?WU9ITUVjV0lLeEZLek5HQnZZVXdHOU9rWnFSQzBzZi9VZEFXZGFZSDJDN0J0?=
 =?utf-8?B?NWhlUW1QWGhEdmtxbk5UakZZdDZkUGg5UVpMUUxVNVFZd0VtcWZsRFA0QitP?=
 =?utf-8?B?eFVaQVAydUJZVjVieVhmNmIwOEZGalZFTHM4cC9YQjZ4TnNGNm1mN21ScjBV?=
 =?utf-8?B?QjBOMDlBVnhKNHYzMys0TmFoMHI2L2N5QnMrZSttTUp3TU04MFNNcEZ5UE40?=
 =?utf-8?B?cndWK1dmNFFOaVZ3S0ZLTDRPVFMzVkZJakU3RVpjL3V5TnZORnFOVTE1U2ln?=
 =?utf-8?B?ZG9XeTlEdWM1c1FzV2hVS2FYWXBZRUpoTmVGZHFVNVFFVHNLS0JwSXozajFo?=
 =?utf-8?B?aHJ2cEpKK291MmpxMFhjZktaTW1ZWUpWeHpXM08rZDNoUEdZWEMyUzRRbmZX?=
 =?utf-8?B?dWhRRENMdGd6Zko1TmlTZUV4ajN1U2NuRTI5Q1ZnUjM5a0RUUnRuZFZNY0tS?=
 =?utf-8?B?cXpqMWQvWG5UZGJPd0lOWDMvVDFhNHg5NHlPQnYrbG5pbU5keXhWTEVna2Vs?=
 =?utf-8?B?MWp6T09WQ3I4bTBYcGU1eUtvQmY2bFVUY2pjUVIzNnN0S0xFR0tSVlJ5R1hW?=
 =?utf-8?B?Y0V1S1A4ODNEVVlyME1KT0llSVVLRkFrRHJXZ0xkZ2pCRi80L1hnbkdrWFB6?=
 =?utf-8?B?YTRTOWlqY1BrTjZ4QTAvdU5BTkJQcHp3dEtadkNrbXNiaVlmWjNzc1RWSk12?=
 =?utf-8?B?cGxieHl5OUFFUkN4eG00N01lN3p5eHY5dFhPVFlDZmc2SXMrVTJUMTcydVdK?=
 =?utf-8?B?QzUwSnEzamtTemFtSGxLZGxrZFZEWmt0TFJtK0tSYzhCQjlJTWJBdHhKdndZ?=
 =?utf-8?B?Z1pvY3JWUVhJYmRJVmpjbjF2Zy9jZkwvWnlPajc5dG1oNDVZYndVamxJaE5R?=
 =?utf-8?B?L3J5dVpQaHl5bStRZnJsRE1JZGVkNVZwMS9UbU8vRHJkSXJqNDB6L2tVWlBX?=
 =?utf-8?B?SzZKT3E4aXVuMk9GNWhsbE9VUnIyM3dxNzVNYXVQdVQwU3l6MmdpK0VaL3k5?=
 =?utf-8?B?N0dSTklSRWRwMWloOE9ZSUdMTU9Ta3FlUHI3SktBckF3Wk1Kc0UwMlpuYXV0?=
 =?utf-8?B?cVdKNFRYWldFKzRmenpwMDdDcm54K3NRbDFDS3RSalMzYlE1eWxDNitReGhO?=
 =?utf-8?B?MHBOQ1VCYSt3UFh6cFRVOEhIdTM4SnNQVzlFam9GMzU5dEFTNDhGQnVNNGht?=
 =?utf-8?B?aHAxSWc0MWtEYmdFWlVhemIva200WVc5NkxJN21STWRRTzkzYXhLa0l1WmFY?=
 =?utf-8?B?VHdvRXRtcUpJdk93MWpSV0xycjVpZkRrVmN5ME84OHdGOStnOGQyL3pRSnZK?=
 =?utf-8?B?ejdkOXR0dmVwaTNOUVFLVmt2VURMQTE1RGhOYkV3MGRwMFlmL2Ezb1hDZGFi?=
 =?utf-8?B?R0U5R3o5RWtIeW9FMU1zWUNuZURUTkx2YTV4M1ovUjhTekI1YkFTZStxRllv?=
 =?utf-8?B?bFVuSVpYNmYycThJb3hrUDREVDJxRFRsMEgxcHIzd04wYVQ1cEIzUE1qeTVT?=
 =?utf-8?B?TmpVQjEwZDc3aU1Wa3hGNDYyRTR5NTdDZEFOSFFJUGxyc05kbUY3Wm9jQ3dW?=
 =?utf-8?B?akw3dFU5N0owS0pEeUlKcHVGN2x2VXA1NnlKNkt3ZTB6TFd4U0d2bGZWTFNk?=
 =?utf-8?B?YnZPWlFjbkhvM2N6M1hxeEtvaW5haDBtM21udm12R2R2SHFLOFF0OUxGYm9p?=
 =?utf-8?Q?XDDjYMKcmkm/0yvvWQ7JKnUbO4Q5Z4UYl6m1reZM77Nj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8c8a72-f91b-4904-92d2-08db82a3a4e1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 06:45:56.2905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzU/mOYiaZQJdEYpTYidnregnWpkIDveoT4oJesR30oOeXlYgbzwO4+WdMRAQB2S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8414
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Alexander Potapenko <glider@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 11.07.23 um 16:49 schrieb Rob Clark:
> On Tue, Jul 11, 2023 at 12:46 AM Christian König
> <christian.koenig@amd.com> wrote:
>> [SNIP]
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_fence.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> index ef120475e7c6..b624711c6e03 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> @@ -35,7 +35,7 @@ static int __init drm_sched_fence_slab_init(void)
>>>>    {
>>>>       sched_fence_slab = kmem_cache_create(
>>>>               "drm_sched_fence", sizeof(struct drm_sched_fence), 0,
>>>> -            SLAB_HWCACHE_ALIGN, NULL);
>>>> +            SLAB_HWCACHE_ALIGN | SLAB_TYPESAFE_BY_RCU, NULL);
>>>>       if (!sched_fence_slab)
>>>>               return -ENOMEM;
>>>>
>>> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>>>
>>> But let it simmer for 24 hours so Christian can see it too (CC-ed).
>> Well that won't work like this, using the the SLAB_TYPESAFE_BY_RCU flag
>> was suggested before and is not allowed for dma_fence objects.
>>
>> The flag SLAB_TYPESAFE_BY_RCU can only be used if the objects in the
>> slab can't be reused within an RCU time period or if that reuse doesn't
>> matter for the logic. And exactly that is not guaranteed for dma_fence
>> objects.
> I think that is only true because of the drm_sched_fence_free() path?
> But that could also use call_rcu().  (It looks like it is only an
> error path.)

No, that's completely unrelated to that.

The SLAB_TYPESAFE_BY_RCU flag works only if you don't use 
kref_get_unless_zero() on the object.

The problem is basically that objects allocated with that flag can be 
re-used under RCU, but only for the same type of object.

This is ok as long as you only need information from the object to 
decide something and can still double check if you got the right object 
through different means.

But when the object can be re-used while in the critical section you can 
end up for example grabbing a reference to something completely 
unrelated to your code path.

The Intel guys had some very bad surprises with that and dma_fence as 
well as other objects.

>> It should also not be necessary because the scheduler fences are
>> released using call_rcu:
>>
>> static void drm_sched_fence_release_scheduled(struct dma_fence *f)
>> {
>>           struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>
>>           dma_fence_put(fence->parent);
>>           call_rcu(&fence->finished.rcu, drm_sched_fence_free_rcu);
>> }
>>
>> That looks more like you have a reference count problem in MSM.
> Possibly I need to use rcu_read_lock()?  But I think the idr_lock
> which protected dma_fence_get_rcu() (and is held until the fence is
> removed from fence_idr, before it's reference is dropped in
> __msm_gem_submit_destroy()) makes that unnecessary.

Well you can either use a RCU protected pointer with dma_fence_get_rcu() 
inside a rcu_read_lock()/unlock() cirtical section.

Or you have some protection in the form of a lock, but then you should 
use dma_fence_get() instead.

Mixing those two doesn't make much sense.

Regards,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.

