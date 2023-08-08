Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E418773811
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 08:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BBB10E0AD;
	Tue,  8 Aug 2023 06:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0456510E0AD;
 Tue,  8 Aug 2023 06:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIqb1ceS0Qu86A/u2/ulDwFq9frGJ5x+GqOQdfmMLqMcba9k+IVtIDLU5IlPeayFMQPkP0OIaA16rznkWdWDkopPC0Wvmx4GTINJ70H5JcnQ1lWvXbGf4hrkh7i7H1l8pQTaeL4aHmTLuNwEYv+5W+Cv3LgrqCV8P0GrgOsGDu6AxXV06fOfLUONoU0y9W/qWujNt1wLoMLcvB6oUi2qnGfHOlb7/GNVxc8JkR3JU1dWaKRQN2dQCGMMxM80wd052YGWzVpv8ZEOOieMfXEsbDS2HOTaZ5Y/gUU1zbJ8Z/MVohwoWVeOwaX9Hx+oHTVEYQ+ra9L0owqdSv/cl18zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8j/l86vLHiha8P3UyVITeKvGAlBglcEbxvI0xBqGMc=;
 b=anokxk+UhdlUmgKdegunHcW2VkYYmYS1FC1cLjyFlbVbQzHC75UR9FQ4KKoO/iYpXWO3FUXgu2Aim0pbtlM77lYX++k9lKYnprfBWh2SlNsV3AlP9IdXKgLqwPoCdeQN0eIj6nGUWvn9ivmO2n3Uz6r9ESW57XwEFwUsBf2mjmWjPtTBc8LF+fegoKPgcKOLzuVXqarLdqXMMWE/VWE9uDIhRHROhCZfdKNFM2B3rdzSYe1ObMF8TnVg0qMoTtN0BzHx9Jh6XtkPEQMTCmXwDK+MB4k5fh1ijYH8kkMWe+yjUKQM/1zlXJxTMCWKkdCHVYXnGYGGVL9c6H/oJChPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8j/l86vLHiha8P3UyVITeKvGAlBglcEbxvI0xBqGMc=;
 b=PEWwO/gqoWYSzZwOo34fXGFRFNeXaWfje5eKJtyQvWz7obYuWVOgabHp44u7/TSMYBwIAL9+jdmMuNlZxijFLbbcPQRFeGSaGMsVqArE6IPlBnr/zzltPYpi3MOw3kv4SDetrFgFuMzLC2SAoHs+mtfIZvmm0A2/o9zAqJSATVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 06:06:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 06:06:50 +0000
Message-ID: <fa6e771f-39fa-5e1e-b062-a9a4c3182852@amd.com>
Date: Tue, 8 Aug 2023 08:06:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v9 06/11] drm/nouveau: fence: separate fence
 alloc and emit
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
References: <20230803165238.8798-1-dakr@redhat.com>
 <20230803165238.8798-7-dakr@redhat.com>
 <91fa63c6-dcce-34b0-938b-2f47362541e0@amd.com>
 <619cbc61-d40f-a19f-179d-1ae35a1a17d4@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <619cbc61-d40f-a19f-179d-1ae35a1a17d4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2250a5-e60d-4818-feb6-08db97d5a769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6ZUpF4w/eKMdlYI+i9IVIGNyUZWISPP+VuH27ytTrdEcSpNjjICIoN3FrSU0IdOC/HLWJImWaCaXXWX3XcpHBr+hkYtcHGCk2sbmAB95v+YKQGzgieqbbd1DnAXI1f8oN6IijKsj0ij0lpYGM7UVAn2aN23Rq9L0JQp5TymIuV0V72n4OHfO8E0ZrCYi39rNEIgcaI5CW1mFCTogUc/fLF6BWiFCmBs2PmcQrBSdYyy7ohpCrwOvsCQiKlzcZ5HwJoUELQNHjXo+zu4EAcMI3wJV+vcXH3O2k29rH311uZmTcvTYwu+ifXU5+fM8mTBqpS4o4kXcUZJ3w+/jxfjjt4gsFnMin2rrvdv5DBjjkUJMbhWF7wZsYzhBM1McTZ1/osqJSBYFij639/ZJiqOID9ZigqKbz8FQKN6E+pZwWMiJoWqU1ZNRQxPlzhtZFOLusJ4afXvzyb1pm5/MbL9VqKEo77P0LydI/JqVe+VH3HSW4tJaH3Vvijz4t17go5lXX3X/5s+TyUv1fk942EiIcQV5L6Y/lzKGin66RI6mp7AwlhSfN1CqsQ7siDjGZ6oplUkKW3+1Z/wtKBgOyU8RqS3kFoQkNS3T+ppe9TwX1T8OMBpq/Dj16Vst/mOAI4Pp9W049ZwU4EGiMHct2yZh0wYCWHH3MhHaRvpU1chL8pDPuM4kOGvUybMeofDujt/ngNAAJuC+GOuWO+GjaOmOoWPJ638T80iWdwjcoN7dJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(90011799007)(451199021)(1800799003)(90021799007)(186006)(6506007)(53546011)(41300700001)(8936002)(8676002)(83380400001)(66574015)(2906002)(36756003)(921005)(2616005)(38100700002)(31696002)(86362001)(7416002)(5660300002)(66946007)(4326008)(66476007)(66556008)(478600001)(6512007)(31686004)(6486002)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEtuZ3NnOWQ3Wmx2TE1jQTEwY1BKbHVTRDhaYUxSQ05Ucm5CTTVKSnN3bmcx?=
 =?utf-8?B?MlZZRHIyR1haWjZNZDNVa3U3ZXpaRm5mVWNzQVd3cHJWMkI5UTEwd1FBdjFk?=
 =?utf-8?B?SkV4TDl3Y3RLcERPWVROVGYrWTJ0anJRQkorck1Zam1KZ0pHKzhGUFRZaHZX?=
 =?utf-8?B?V3o4M3Zkb1BKTkNNTDV2c0NKVFNFL1NiOTlPMHc3RTJRcXJ5YTlpRUhJV3hT?=
 =?utf-8?B?Rms1NnV1b2hFcFVkbkNXNlpuVUVsWE4zdU1VOFN4WVFCYkR0bHVNbnYwenJD?=
 =?utf-8?B?OUZrUmpXMGN2THlFQ2FYMmFYWUowQ3RmNnlvM1pkdWNuNFM2Z3JPTEdyREZP?=
 =?utf-8?B?VTJqckhyWjcyZ2NhcmY2cElYbGU2NHRydVNJcnNWV3VBN2dvVGlTbHhEN3hp?=
 =?utf-8?B?dWVZNTN5M1E1TDU5ekR6d0lERE1JVUV4VUJRaGJMcVpDbGV4WWlQRk5BKzdN?=
 =?utf-8?B?WEJQSGRZOEYwMDVnUnVtNmZ0OGl6WEFXaVhkdUZaczlLZ05HMzJPU1VFaGhZ?=
 =?utf-8?B?R2cvK2UxY29xcWprVWRHUkxEdzYrYWJESDdsWEJ1VHFQUGg3VlMvaTZ6Rmpj?=
 =?utf-8?B?ZDE1THZGbnhjcWd4MWNoOE5TS3R0dzV0ajZWdjBZY2xxRnA0QmN4WURCWk0y?=
 =?utf-8?B?SjR3STJVRFFqZXh1MDhFOGk1Yi9TZ2NFNWV3eUtTRUxTNFdBMmpJQmliTkdF?=
 =?utf-8?B?b3A0eTY2aThSckZQbFUyK0lNNnQ4ZWJFTWtFTlE5Tjh2UlNTcGF1M3RWMjJT?=
 =?utf-8?B?TTFWcWJMV014bjJ4UFVsYms2NEhLcEhMUVl6UnVwdU91QnNtazZQdGhXdjdm?=
 =?utf-8?B?RndlK3g3STFUY21KR3N5eG9pQnhCV25hTm1zazVZY3ZpUEFxQlFhTjFhWlpu?=
 =?utf-8?B?VVdIUVVROU9pamxuU0JTZGx0bTJjMExlam9obkwzTnd1Q00wMWFvOWJ4eDkv?=
 =?utf-8?B?Slp3M1FJU2ZHY0oveEpqZFV2Y29GLyszNGRwWW42MmZBY0x2dHM5WnRuSlE5?=
 =?utf-8?B?NERKVzVRTUhwVXJUSCtLOU1MUGQ5VGUxRStVTmV3ZFZzSE05VWN4NUlCcm1k?=
 =?utf-8?B?dnd3Y25KWnM1OTJQVG0xZ2hOSlB6U3hmcThNZ3MrYWt4QURjRS81QzRYTXc5?=
 =?utf-8?B?RVRsY2JxK3F0bTRPMktLbG9leHk1QTREdTVhRUl4cER1QldBTVE1dFRpUVZN?=
 =?utf-8?B?eVlyMFpPSXhpdTg2WDVRQitCUEsrQ2ZKSXIwTTBjTzNUc0dMTXpsM0E0VDZR?=
 =?utf-8?B?NFRpS1hTVE55MHNLRURiSStoN3hVSU94NGNpUFA5WXZSTXMyOWd2OEZST2Iy?=
 =?utf-8?B?K2t2TjcvRDdiVU9aT21VZjZ1RC9NM3BiTkNteXRhbHd2dWx6VzZoTTJhWVFO?=
 =?utf-8?B?bGFGbXJwZ1Vqd3lqU3E1cUNMWmR4UkQ0RUhXK01Qb25GMWw4ZndTUXppRkRT?=
 =?utf-8?B?RUYwRnpzNkdSYWVmakV5dWlxaVZIbmI3bzRhVHRrRmJXLzluNm5EaGYrS05k?=
 =?utf-8?B?ME5WLytwNnRrdWpJVFBNTEUxS1F5YXduZnZMMXpxQ3BVQ1BmUVFwcUVxbkJH?=
 =?utf-8?B?MXpBeHZwamdsQjRJMXZ6cEViTzlqZkcvUmRYeDV2NjFFemlWRUhsdkduazhk?=
 =?utf-8?B?QWlmaklURjNOL1owYXM1MU1tMU9SamlNSDVPNHhMclpoY3VvZFNVV05WOUlG?=
 =?utf-8?B?WmlLWjAxdGpHd3ZQaktiaHcwTU8wdTFscGJiSm5Id3k5cUtrT1F3MXVlNmxY?=
 =?utf-8?B?OXZyUTc4aHloZ2JuNlZraDNIQWovZXVGSExZTHlDZ1E3ZGNRSzJSNUhMNjI5?=
 =?utf-8?B?NHc1SS9Ud3M0MDlsV0ZzaE5EeWsweW1teDdUTFFIdk9TOVZuUm5hTHlRNjFt?=
 =?utf-8?B?OVQzQVE2T3gza2dTN1ozdTRsaHRjNVY2eW0vY2hMeUYrT3hhajhtejZzZ2tw?=
 =?utf-8?B?UTlQTnd3em8ybDE2QXVpQTQyNWczUnhXTUFVSjk4NFl0Rlh6TmFVaDZOZW94?=
 =?utf-8?B?WTVaUlQxbmtiandMM3RhQnFJS3VENndBV2ZGbnJSand4VjRueFNpMktlNFlk?=
 =?utf-8?B?NTNsSFJCOTdscW92QzJyaHB1UzZZNnRqVCtnaFNHVmNUVGdUZTRMZnVvRUJE?=
 =?utf-8?B?MUVjMG9iZlQ3ZmJvWTh1SjlzU0NYOFRNYVg0Y091WFF2MUZoR0lteitkbnFN?=
 =?utf-8?Q?kUKWIlqVl1rXEg2Vq+S6yW956EklQO8osykdpCRDNbee?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2250a5-e60d-4818-feb6-08db97d5a769
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 06:06:49.7960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olXrd3HNRtiTIpLYrOjmixpYQOb2rfOglYyDomyzh9zR8RjYVYcrNOfqqwJcRziT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 07.08.23 um 20:54 schrieb Danilo Krummrich:
> Hi Christian,
>
> On 8/7/23 20:07, Christian König wrote:
>> Am 03.08.23 um 18:52 schrieb Danilo Krummrich:
>>> The new (VM_BIND) UAPI exports DMA fences through DRM syncobjs. Hence,
>>> in order to emit fences within DMA fence signalling critical sections
>>> (e.g. as typically done in the DRM GPU schedulers run_job() 
>>> callback) we
>>> need to separate fence allocation and fence emitting.
>>
>> At least from the description that sounds like it might be illegal. 
>> Daniel can you take a look as well.
>>
>> What exactly are you doing here?
>
> I'm basically doing exactly the same as amdgpu_fence_emit() does in 
> amdgpu_ib_schedule() called by amdgpu_job_run().
>
> The difference - and this is what this patch is for - is that I 
> separate the fence allocation from emitting the fence, such that the 
> fence structure is allocated before the job is submitted to the GPU 
> scheduler. amdgpu solves this with GFP_ATOMIC within 
> amdgpu_fence_emit() to allocate the fence structure in this case.

Yeah, that use case is perfectly valid. Maybe update the commit message 
a bit to better describe that.

Something like "Separate fence allocation and emitting to avoid 
allocation within DMA fence signalling critical sections inside the DRM 
scheduler. This helps implementing the new UAPI....".

Regards,
Christian.

>
> - Danilo
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c |  9 ++++-
>>>   drivers/gpu/drm/nouveau/nouveau_bo.c    | 52 
>>> +++++++++++++++----------
>>>   drivers/gpu/drm/nouveau/nouveau_chan.c  |  6 ++-
>>>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  9 +++--
>>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 16 +++-----
>>>   drivers/gpu/drm/nouveau/nouveau_fence.h |  3 +-
>>>   drivers/gpu/drm/nouveau/nouveau_gem.c   |  5 ++-
>>>   7 files changed, 59 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c 
>>> b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>>> index a6f2e681bde9..a34924523133 100644
>>> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>>> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>>> @@ -1122,11 +1122,18 @@ nv04_page_flip_emit(struct nouveau_channel 
>>> *chan,
>>>       PUSH_NVSQ(push, NV_SW, NV_SW_PAGE_FLIP, 0x00000000);
>>>       PUSH_KICK(push);
>>> -    ret = nouveau_fence_new(chan, false, pfence);
>>> +    ret = nouveau_fence_new(pfence);
>>>       if (ret)
>>>           goto fail;
>>> +    ret = nouveau_fence_emit(*pfence, chan);
>>> +    if (ret)
>>> +        goto fail_fence_unref;
>>> +
>>>       return 0;
>>> +
>>> +fail_fence_unref:
>>> +    nouveau_fence_unref(pfence);
>>>   fail:
>>>       spin_lock_irqsave(&dev->event_lock, flags);
>>>       list_del(&s->head);
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> index 057bc995f19b..e9cbbf594e6f 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> @@ -820,29 +820,39 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object 
>>> *bo, int evict,
>>>           mutex_lock(&cli->mutex);
>>>       else
>>>           mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
>>> +
>>>       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, 
>>> ctx->interruptible);
>>> -    if (ret == 0) {
>>> -        ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
>>> -        if (ret == 0) {
>>> -            ret = nouveau_fence_new(chan, false, &fence);
>>> -            if (ret == 0) {
>>> -                /* TODO: figure out a better solution here
>>> -                 *
>>> -                 * wait on the fence here explicitly as going through
>>> -                 * ttm_bo_move_accel_cleanup somehow doesn't seem 
>>> to do it.
>>> -                 *
>>> -                 * Without this the operation can timeout and we'll 
>>> fallback to a
>>> -                 * software copy, which might take several minutes 
>>> to finish.
>>> -                 */
>>> -                nouveau_fence_wait(fence, false, false);
>>> -                ret = ttm_bo_move_accel_cleanup(bo,
>>> -                                &fence->base,
>>> -                                evict, false,
>>> -                                new_reg);
>>> -                nouveau_fence_unref(&fence);
>>> -            }
>>> -        }
>>> +    if (ret)
>>> +        goto out_unlock;
>>> +
>>> +    ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
>>> +    if (ret)
>>> +        goto out_unlock;
>>> +
>>> +    ret = nouveau_fence_new(&fence);
>>> +    if (ret)
>>> +        goto out_unlock;
>>> +
>>> +    ret = nouveau_fence_emit(fence, chan);
>>> +    if (ret) {
>>> +        nouveau_fence_unref(&fence);
>>> +        goto out_unlock;
>>>       }
>>> +
>>> +    /* TODO: figure out a better solution here
>>> +     *
>>> +     * wait on the fence here explicitly as going through
>>> +     * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
>>> +     *
>>> +     * Without this the operation can timeout and we'll fallback to a
>>> +     * software copy, which might take several minutes to finish.
>>> +     */
>>> +    nouveau_fence_wait(fence, false, false);
>>> +    ret = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
>>> +                    new_reg);
>>> +    nouveau_fence_unref(&fence);
>>> +
>>> +out_unlock:
>>>       mutex_unlock(&cli->mutex);
>>>       return ret;
>>>   }
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_chan.c
>>> index 6d639314250a..f69be4c8f9f2 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
>>> @@ -62,9 +62,11 @@ nouveau_channel_idle(struct nouveau_channel *chan)
>>>           struct nouveau_fence *fence = NULL;
>>>           int ret;
>>> -        ret = nouveau_fence_new(chan, false, &fence);
>>> +        ret = nouveau_fence_new(&fence);
>>>           if (!ret) {
>>> -            ret = nouveau_fence_wait(fence, false, false);
>>> +            ret = nouveau_fence_emit(fence, chan);
>>> +            if (!ret)
>>> +                ret = nouveau_fence_wait(fence, false, false);
>>>               nouveau_fence_unref(&fence);
>>>           }
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>> index 789857faa048..4ad40e42cae1 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>> @@ -209,7 +209,8 @@ static vm_fault_t 
>>> nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>>>           goto done;
>>>       }
>>> -    nouveau_fence_new(dmem->migrate.chan, false, &fence);
>>> +    if (!nouveau_fence_new(&fence))
>>> +        nouveau_fence_emit(fence, dmem->migrate.chan);
>>>       migrate_vma_pages(&args);
>>>       nouveau_dmem_fence_done(&fence);
>>>       dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, 
>>> DMA_BIDIRECTIONAL);
>>> @@ -402,7 +403,8 @@ nouveau_dmem_evict_chunk(struct 
>>> nouveau_dmem_chunk *chunk)
>>>           }
>>>       }
>>> - nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
>>> +    if (!nouveau_fence_new(&fence))
>>> +        nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
>>>       migrate_device_pages(src_pfns, dst_pfns, npages);
>>>       nouveau_dmem_fence_done(&fence);
>>>       migrate_device_finalize(src_pfns, dst_pfns, npages);
>>> @@ -675,7 +677,8 @@ static void nouveau_dmem_migrate_chunk(struct 
>>> nouveau_drm *drm,
>>>           addr += PAGE_SIZE;
>>>       }
>>> -    nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
>>> +    if (!nouveau_fence_new(&fence))
>>> +        nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
>>>       migrate_vma_pages(args);
>>>       nouveau_dmem_fence_done(&fence);
>>>       nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> index ee5e9d40c166..e946408f945b 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> @@ -210,6 +210,9 @@ nouveau_fence_emit(struct nouveau_fence *fence, 
>>> struct nouveau_channel *chan)
>>>       struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
>>>       int ret;
>>> +    if (unlikely(!chan->fence))
>>> +        return -ENODEV;
>>> +
>>>       fence->channel  = chan;
>>>       fence->timeout  = jiffies + (15 * HZ);
>>> @@ -396,25 +399,16 @@ nouveau_fence_unref(struct nouveau_fence 
>>> **pfence)
>>>   }
>>>   int
>>> -nouveau_fence_new(struct nouveau_channel *chan, bool sysmem,
>>> -          struct nouveau_fence **pfence)
>>> +nouveau_fence_new(struct nouveau_fence **pfence)
>>>   {
>>>       struct nouveau_fence *fence;
>>> -    int ret = 0;
>>> -
>>> -    if (unlikely(!chan->fence))
>>> -        return -ENODEV;
>>>       fence = kzalloc(sizeof(*fence), GFP_KERNEL);
>>>       if (!fence)
>>>           return -ENOMEM;
>>> -    ret = nouveau_fence_emit(fence, chan);
>>> -    if (ret)
>>> -        nouveau_fence_unref(&fence);
>>> -
>>>       *pfence = fence;
>>> -    return ret;
>>> +    return 0;
>>>   }
>>>   static const char *nouveau_fence_get_get_driver_name(struct 
>>> dma_fence *fence)
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h 
>>> b/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> index 0ca2bc85adf6..7c73c7c9834a 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> @@ -17,8 +17,7 @@ struct nouveau_fence {
>>>       unsigned long timeout;
>>>   };
>>> -int  nouveau_fence_new(struct nouveau_channel *, bool sysmem,
>>> -               struct nouveau_fence **);
>>> +int  nouveau_fence_new(struct nouveau_fence **);
>>>   void nouveau_fence_unref(struct nouveau_fence **);
>>>   int  nouveau_fence_emit(struct nouveau_fence *, struct 
>>> nouveau_channel *);
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> index a48f42aaeab9..9c8d1b911a01 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> @@ -873,8 +873,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device 
>>> *dev, void *data,
>>>           }
>>>       }
>>> -    ret = nouveau_fence_new(chan, false, &fence);
>>> +    ret = nouveau_fence_new(&fence);
>>> +    if (!ret)
>>> +        ret = nouveau_fence_emit(fence, chan);
>>>       if (ret) {
>>> +        nouveau_fence_unref(&fence);
>>>           NV_PRINTK(err, cli, "error fencing pushbuf: %d\n", ret);
>>>           WIND_RING(chan);
>>>           goto out;
>>
>

