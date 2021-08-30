Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DDE3FBABF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 19:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E70989DC9;
	Mon, 30 Aug 2021 17:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E370989DC9;
 Mon, 30 Aug 2021 17:18:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgkWA/EiyM5GsOSHQqDGjDYd7ExZjl40ZryqoffK7Cc4PR495V7xVjSGsloQxbIFiYDk4DLPEdBgIFPF88ZKza4weQ1A3xTR4f4MnvR5iYwcQGuXyUvq6j+AbfM1/fyY9Nyl9QHt8DmWb8jmcrTIJoJYmUnBA8OAoErTJ1jIcvSghxLWi8M2UcCnDiv4XOpvIlYyJfUxO0mi7SGEYJIlIR73L3S+OFB9nicAWpwXpe4Rl5TghdUPAb56bgFD0ZHX6nsuy8XORxQg9008oSlBwa12jvZ+gpIVu5FAu4WzgB5DYPQgxtyS2XtzcIi8/YOMO5SOSgIeNhZul6vYvPUuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br9AxyPoWHNVE62/QTVHtAQIn3VeyqizjyDInV9lGOw=;
 b=e1yihEPZfGolD2YeiTJirj9zGNhsUH1iEGl3orfMYZWqNxy8c46LqOV7EI/2y5sQdpTPlOul38pvKY2tPeDYG+TyIiQ+qGUHpU67QIHyr3zVY7+dLpmbKwzFDHJX9kqFyhlLw3uU9dME0lusGErHvXuU/5/r9fO6YIYtazxVxnUhZDMB4mB/i1gOTh54ADwjxSsZDyakYkEliBRg0vWkAFxjTVoRK7w5NW7ipQB1cfqyaS6/brf1D0I1p2VkwASxUjzsz3rWQ02MGPwebJufsKdWcPRJ9tL2LctDaPUE5H5yrGsCflqi/I13to7ZGPGMGwzx8lBBo1BvngwA/ZXA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br9AxyPoWHNVE62/QTVHtAQIn3VeyqizjyDInV9lGOw=;
 b=P1hNOtF0Xsb+w2CmONg86bAac9bCNi11MAjsIlghvYK14TwNNfrRbCnDv6ufxg4TmNLDx8FfXms9QoUSbMDV1wrPl6qB7bT7qfRvWOW8d3holonbW385jraWeIpwEWvkbhhNGw1OO6gA8r1gqhzRDVHtsFwUrTLSSSBMmgq0WSE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 17:02:47 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 17:02:47 +0000
Subject: Re: [PATCH v3 1/4] drm/ttm: Create pinned list
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
 <20210827203910.5565-2-andrey.grodzovsky@amd.com>
 <a13d095d-1b0f-a31c-1479-1275c2e93877@amd.com>
 <e716dd6d-a338-86ae-9100-0e869f12732c@amd.com>
 <e70b7078-eea6-c798-0c67-0e59ec68d75f@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <b985fb23-b74a-9401-154d-5f240a97799f@amd.com>
Date: Mon, 30 Aug 2021 13:02:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e70b7078-eea6-c798-0c67-0e59ec68d75f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::35) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:fe36:59a5:493:2924]
 (2607:fea8:3edf:49b0:fe36:59a5:493:2924) by
 YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23 via Frontend Transport; Mon, 30 Aug 2021 17:02:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d39108f5-4e43-481a-8c50-08d96bd7fdb9
X-MS-TrafficTypeDiagnostic: SA0PR12MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4399FF403FCD182572776A3CEACB9@SA0PR12MB4399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/gfsGbLxeJ7FjY9otw4bHYD9gZ6B6fpA1UamVudfLSywCj5drDFwjyP4PLe/xElcpyppvR9FJcAKD7IWNOjziwmNiEp+TMFN5/3YKS7uZSPH+W5jkbZQelkwTuA9l7ivQf/ydzPoEw44Vi/Mfta+3k/hrbyGhNpagxGK/AbdO6SYHUYniQfXx3GMW7RtCJqCNtQ3ZKcG2BBKbpLnBvkwUZW1jFbmKgXboW70FDrrQVyxy8UDYSwjj181q1lOSB8RZNO+FcgHoyExvohUEB5iuGAb5X2p9OcIWQtr94Vu1BoO4g4FSzza6Bi+rAJtJEKMZotP+kF93wfc/fxK+Hobu+tPveMgFp5ePFurn6eGR1CDNUxPPwp+50UzDPxqeyO3im7Gve5FggRc+NPISm+CDfjWudTze3vR41tThse5WAaZ9njLTyNNMAT/nSzKbsPuQcKcULWao+4YB7ccOsiONajmdwLlr+q2DpcYAoJN5POiqs///kGGmII2s4ybUiAAknOOM7bU3NTKfjy6Hj+9WIN5JWqRRh8sn+e2KC9qpSd3L0n0Gtfi11u9ch3KxMWEMTrEacMUxvezdshWbFJOr+Hkq6HoX1ORW5CMIkIG8yuHxeDO5t86pLesUlN7v+LJMv7JiRiD6+HjrZAQPjkMOdwzgUmHVmbVKht7s3Xj0pMwsO7AKScVi68R5XPOFWawhlB6hjKiLckCaJuV5Mp7kc+QZqNlymaCSr5HfQfjvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(31696002)(86362001)(31686004)(2616005)(2906002)(66574015)(186003)(38100700002)(44832011)(66476007)(36756003)(316002)(6486002)(110136005)(66556008)(478600001)(8676002)(83380400001)(5660300002)(8936002)(53546011)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVp5YTJOMVk3ZndPUVI2NWtzNkcxdUdadFNjeFZLL0xOUHNodzVOcDFFaW9i?=
 =?utf-8?B?V3RqR21Zb0F3MFVYcUZrZDJTdzZaR2dYSEZ0L3M0dEV2Z3g3Z25xamV3VnBZ?=
 =?utf-8?B?SzRsRjV5emRCcUczeHBhc2c2YllqQ1NIRFRKS1c1MWk2NFJBVHExVnE2c0Vp?=
 =?utf-8?B?NnBRa1dlOU9TcDhXc3RVS0JoWVBuRUE5UlNnUVF6WjUrQklpamJna3V0Yld2?=
 =?utf-8?B?R2xobzVuU3NCZ2h0QTRFNHNIR054NTRlbkZpbGlMYXNsZmFhR2ZyMWhmcVZR?=
 =?utf-8?B?ZEpNYis3VmdKYUlIUjU0UGtYOU1QVmVmaFBPWS93bmNMdk1qczY3UmhyTWpY?=
 =?utf-8?B?TmNScnRhRHR0QmsxU051SjRJZ2YwRWJxVy9TbTdvQU9hMk9zbyttT3VzRDVq?=
 =?utf-8?B?cWJlMkRZRDAvN2N3cEt4QzlCNVhkUGtFNzNSV09vUy9mUG5qNi9DZ0d0WXVQ?=
 =?utf-8?B?Q2EvTzJjTVllYzh4eTZTUXlicEN3bnhrTEZIRitnZlZmek1jY3VJNS9vUVpu?=
 =?utf-8?B?WlhiVXFPSjh2RFBWeDRVY1Q4TmRoZW1xK01COXJZYnB6L2VkcmVVN0p3YXNG?=
 =?utf-8?B?SWFkWlc2K0FXcG1vdGtqRkVLQWZnNjkxSG5IQkMzKzE0MXdSSTB3OHRKMFpa?=
 =?utf-8?B?MFN3NmhCem5ndG9QZUx0TW4rQktOdGlpcUhLc2pLK3RhcEM5NTlwbGE0Y0JU?=
 =?utf-8?B?aTdON2NjRllwWnk2K3NMSTAvcnZIZDJhV21nYUtPdVM5RDlrdW16azc1dXpn?=
 =?utf-8?B?dHhtUHZVbTZXZ3BBK2krNEtqeVRhbTcxUFpiVkhTOGYzVmVFRklQbWRySmo4?=
 =?utf-8?B?ekVBTTlZMFRyUkwrQWFrdXJ3ZlpaV2dSNTJCMzJiT2U1R04zMC9WbDhCcG40?=
 =?utf-8?B?cE1nUjRNYUYwcDdmRUxvV2IwSVhiT1dxUWI0ZUJucDYzOHF4em1lODFKc0t4?=
 =?utf-8?B?VUdRVmEzQVVDcWFWMTcvL2pwVnd5RFZIcUppL2pGczhWR0grL1RwS1h4U0Rv?=
 =?utf-8?B?RjFYb2xldkN6Q29DVjFBOXh5N2VjZnd2SmFlRm1wbGJMZXBvNTFYdzM3dnU4?=
 =?utf-8?B?ME83QW82UWtyV3N1ZkZGN0hUZTNKa21DdlJWeG9aV3ZCdXZ4REJaa2FYR1dB?=
 =?utf-8?B?VXY5THhHeWNleWJPZ0t0QkYvNGZmY0s3TzNtTU9GdGMwcnVTQVRZZGo1U2dC?=
 =?utf-8?B?MmRDVWtHYmI1Y0ROUnJaZDBRaXR4d1JzdGZqSTRBNDMrM1JOazNlamFOUGFR?=
 =?utf-8?B?K1VoMFhwNHIyejR5cXpROEluTnRUY1l0UlhCbnIwczAyVjhuK0JWcFZ2ZUUv?=
 =?utf-8?B?Rk9lUjFidnJERXZlWmZjaEhvOGM4N05OT3IrbUhMUFlLemdrTWNUNW8yQU1r?=
 =?utf-8?B?UmlWeU5VQWJVTDdkQjhtTy84RmlNWVo1ckhxUnRZOVFLNEFxUDlQZFVhTG5t?=
 =?utf-8?B?VmdqZTNlMG16eitxV1dEem03enNLME1ldzhmZ2xtbEsxcG0wcU9mejR4WHVN?=
 =?utf-8?B?QXZ5UXdpN052MGl3bnRWZFFocUI2ZER6T2tMSGRydmRPaXN5a1lDQ0lmY01N?=
 =?utf-8?B?cTN5QW9JOGFSaXMyNTBJZC93bkFYVUcweHhZT0hSamVJbWlGZExoaU9zQ0Rw?=
 =?utf-8?B?dXg4MnBqZndxOFFBK0FVaTBJUDJ1NjBvQTZaeUZQTFRlR1QwbWtXUlpIZDhw?=
 =?utf-8?B?eUNIemg1TlhWMWRHQmxQTGViWnU4UmxuV2FmVnIzNmZCQXlDaTRTQUNiRFhN?=
 =?utf-8?B?eFRKSHovNEQwQ2k1cVBaZWVVWnNaQUZPclBWaWtuSEhrdm9OMWdKb3MxWXVk?=
 =?utf-8?B?L2d0RldoWVR3UlVlQ0lZQnhvdmRaaGFuNlJlZkZiSWRkbzdQYTVJcmhFdlZH?=
 =?utf-8?Q?65qkwmJGwifk7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39108f5-4e43-481a-8c50-08d96bd7fdb9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 17:02:46.9761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQ+CBqVS5YWjWFSdyPoYMv8qjjgqHyFL02j3Lm9cIGstDIWmEv6zv1wgkrmkMOSIrOBxtL0dFYRVmyFz4FuAOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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


On 2021-08-30 12:51 p.m., Christian König wrote:
> Am 30.08.21 um 16:16 schrieb Andrey Grodzovsky:
>>
>> On 2021-08-30 4:58 a.m., Christian König wrote:
>>> Am 27.08.21 um 22:39 schrieb Andrey Grodzovsky:
>>>> This list will be used to capture all non VRAM BOs not
>>>> on LRU so when device is hot unplugged we can iterate
>>>> the list and unmap DMA mappings before device is removed.
>>>>
>>>> v2: Reanme function to ttm_bo_move_to_pinned
>>>> v3: Move the pinned list to ttm device
>>>
>>> As far as I can see there is not list_del() remaining. So this won't 
>>> work correctly.
>>
>>
>> It's in ttm_bo_release, there was no code change there hence it's not 
>> captured in the patch.
>
> Ah! So you keep the logic as is there. Sorry totally missed that.
>
> In this case the patch is Reviewed-by: Christian König 
> <christian.koenig@amd.com>
>
> Can you push this to drm-misc-next?
>
> Thanks,
> Christian.


I think It's supposed to go on top of your changes you mention here 
which are not pushed yet.
I will need to apply all the patches on top of yours and retest (I was 
doing everything in amd-staging-drm-next)
until now.

Andrey


>
>>
>> Andrey
>>
>>
>>>
>>> I suggest to rather rebase on top of the stuff I'm working on for a 
>>> while to move the LRU into the resource instead.
>>>
>>> Just send out the latest patch set of this with you in CC.
>>>
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_bo.c     | 18 ++++++++++++++----
>>>>   drivers/gpu/drm/ttm/ttm_device.c |  1 +
>>>>   include/drm/ttm/ttm_device.h     |  1 +
>>>>   3 files changed, 16 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 1b950b45cf4b..1fedd0eb67ba 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -69,7 +69,17 @@ static void ttm_bo_mem_space_debug(struct 
>>>> ttm_buffer_object *bo,
>>>>       }
>>>>   }
>>>>   -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>>>> +static inline void ttm_bo_move_to_pinned(struct ttm_buffer_object 
>>>> *bo)
>>>> +{
>>>> +    struct ttm_device *bdev = bo->bdev;
>>>> +
>>>> +    list_move_tail(&bo->lru, &bdev->pinned);
>>>> +
>>>> +    if (bdev->funcs->del_from_lru_notify)
>>>> +        bdev->funcs->del_from_lru_notify(bo);
>>>> +}
>>>> +
>>>> +static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>>>>   {
>>>>       struct ttm_device *bdev = bo->bdev;
>>>>   @@ -98,7 +108,7 @@ void ttm_bo_move_to_lru_tail(struct 
>>>> ttm_buffer_object *bo,
>>>>           dma_resv_assert_held(bo->base.resv);
>>>>         if (bo->pin_count) {
>>>> -        ttm_bo_del_from_lru(bo);
>>>> +        ttm_bo_move_to_pinned(bo);
>>>>           return;
>>>>       }
>>>>   @@ -339,7 +349,7 @@ static int ttm_bo_cleanup_refs(struct 
>>>> ttm_buffer_object *bo,
>>>>           return ret;
>>>>       }
>>>>   -    ttm_bo_del_from_lru(bo);
>>>> +    ttm_bo_move_to_pinned(bo);
>>>>       list_del_init(&bo->ddestroy);
>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>       ttm_bo_cleanup_memtype_use(bo);
>>>> @@ -1154,7 +1164,7 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>           return 0;
>>>>       }
>>>>   -    ttm_bo_del_from_lru(bo);
>>>> +    ttm_bo_move_to_pinned(bo);
>>>>       /* TODO: Cleanup the locking */
>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>   diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>>> index 5f31acec3ad7..530a9c36be37 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>>> @@ -208,6 +208,7 @@ int ttm_device_init(struct ttm_device *bdev, 
>>>> struct ttm_device_funcs *funcs,
>>>>       INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>>>>       spin_lock_init(&bdev->lru_lock);
>>>>       INIT_LIST_HEAD(&bdev->ddestroy);
>>>> +    INIT_LIST_HEAD(&bdev->pinned);
>>>>       bdev->dev_mapping = mapping;
>>>>       mutex_lock(&ttm_global_mutex);
>>>>       list_add_tail(&bdev->device_list, &glob->device_list);
>>>> diff --git a/include/drm/ttm/ttm_device.h 
>>>> b/include/drm/ttm/ttm_device.h
>>>> index cd592f8e941b..03fb44d061e0 100644
>>>> --- a/include/drm/ttm/ttm_device.h
>>>> +++ b/include/drm/ttm/ttm_device.h
>>>> @@ -265,6 +265,7 @@ struct ttm_device {
>>>>        */
>>>>       spinlock_t lru_lock;
>>>>       struct list_head ddestroy;
>>>> +    struct list_head pinned;
>>>>         /*
>>>>        * Protected by load / firstopen / lastclose /unload sync.
>>>
>
