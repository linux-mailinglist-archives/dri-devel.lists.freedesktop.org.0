Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815994E3977
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 08:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAAC10E523;
	Tue, 22 Mar 2022 07:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E0210E521
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 07:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3vNa6M4UrqQz2URsCGiWwAeCT2QjItnz0u6euQW+UhrAD/SWsjsI/JgIcLnXiQTkxSl4zQ/IqJSss/NQip5RMQSnmwdAOvruOcLPGWJrjcFhFRcSQkT3LMDcGXHY0fOBD54k0nn/ZTDHssb5DXAZO2Fhu2fvPAvKTA3jAxEPKBBKRLYHXAjdAu7NozsMrnRVSGapwL7fTACJ4ofIjWDjkMfs6YogiMaU4D9ifs3lqtvFO9VeyVwqcwQ4Fe5oTma5pcs48oJ5ZpGPj9yFBlULVfOXqPA8/mB2iVeW3DNP/d2MbO44TMdsYERV2U+xu1AFYphDKbpWINKxTwftXX1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kis/kT9lyoZ7gMkBMgE1iTo+zT0+5nqXmgjM2CkEens=;
 b=cCee1ox2cEFJ0KBhB9A59qrRruypJw0Q8AYZ+Gop+j13nyNlHGqH3Tm1QYT0ptIimC5no79S+EfdXPCh2T4b+PWsxDh4QXGR7n785jmKgkmPhmnIC5o0STgQBC8Hd26Cw+dXXj+VVk/d359/oBWaodPcvzh+tbMoAzYQxAlhNKRI8/x4mu6zfjgwUqohlqmqQCB6ptsW9L8GqXLVB8++pScceNIXB6IJuBue/6w//YUXeHhl2b+/662ebtDUyY+Uk7CZkxA5lHfogYj2564IxySynGs1hYOQBYm0IgFv7eAVUeWaStjeMiUnMcur8rB9GCZTXHCcuUZCDTY7DPdz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kis/kT9lyoZ7gMkBMgE1iTo+zT0+5nqXmgjM2CkEens=;
 b=tXcDEY7E6yFRSVBAtmXrrlyZc9nwfJ8mpLBN8cUV61oqJD93VhGBBBs+SdrJe1S1ZM6pjpYflghJLG0ic/QNHNBDAYVwW7yQiH9hFFn4WsKIldFa2A0lN2uAU8dYFGQjq7LNRuBEelEhpEa7bRea8MGXvCBGoKwzuMQkiXQMZlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3264.namprd12.prod.outlook.com (2603:10b6:208:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Tue, 22 Mar
 2022 07:17:38 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 07:17:38 +0000
Message-ID: <0d850493-d4f7-6b60-cff0-76374d8fe841@amd.com>
Date: Tue, 22 Mar 2022 08:17:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/ttm: fix potential null ptr deref in when mem space
 alloc fails
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>
References: <20220318195004.416539-1-bob.beckett@collabora.com>
 <8688c626-5858-18ba-593b-cdf179ca5201@amd.com>
 <a29021bd-1447-038a-e141-d06b53173d36@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a29021bd-1447-038a-e141-d06b53173d36@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P251CA0020.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 272ae2c4-1a91-4b18-bc70-08da0bd40b84
X-MS-TrafficTypeDiagnostic: MN2PR12MB3264:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB326466BE478CFF466098041083179@MN2PR12MB3264.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2naq1kHZm3xnHfS6cXXI00TXRkEdAl87KW2h6ePzMy2dPiwX/tjnp+ZeBb5NATRpFnsZaMPbZ5MGuFacW7ZDvN0yxCkm+Xgw0T2+1mg6nmJNVYEjJJN12z5Is4610b36qCbKvanSXPZHH8wHYpTAIAD59+piAHAwFibgQNB3y4ckToGLnzKZyuKQDgzTrahVwVebLTC60or1ugbqvGap7sfCtosQMDMrwsCnkx0L3JOMjJd0yoEl53NbgWmwOkYpm/mpKyD6w2TW8/WE2lY9mr4wnSJRjrrRIpuKlw2w+JGFuGLcZEcSbtP2JK4+rFHIw0iP6cM5floFo2Ierz1HExyOSjvuIbS/BmcKcFYCEwt9vnAm/A23Z+s7whdHruUZePzA9hD1febxzwslodOPYQIHej7uJVI/zZ0crrS9Gzi7A+VB2JjGNHIk8KIgGYswPJT/stFIAMLAys5VlYqP78OZjZxXf6TYFGpZAefhr514bx/mDsl+cNMIFC2ZNUq3+JBfMRf2Ote4Dtv+oMShAPgz/Sk5H0AXJnCCEygfsDgBdJ3btBgRQVSUQZcvhTBH/oR9NT2vF8n7MOPR3BZzHZ/mZoPItnD25lgbYzuuJZ5Ip1OZqYGW9JeoAbiVyLsRpOm+dWWGUqOTiWNQ00ctXiyCO9CGbfwEX4gdLqHbjxvlDFFNl9xs2IUTIUKwynI6MiKF0bx/kTjH2r/826S9qmjEftaTZtqFKTKU5DTLLChpqfLvnBeWTArSKWUeEZtTe9K9tVdS+kpXy6+L8jPpD/rLWmcyyk0GrXM/9QgOXjA9urfpc1bMzoRpcYq2aIWg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(4326008)(8676002)(508600001)(66946007)(966005)(66476007)(6486002)(5660300002)(66556008)(8936002)(53546011)(83380400001)(110136005)(2906002)(6506007)(6512007)(2616005)(45080400002)(6666004)(38100700002)(36756003)(86362001)(316002)(66574015)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXk2bmdJbmRwQ21rbzlaY2ZBblRBbW9OaHlNLzc3WjhsTEEyUUZpdno3SWJm?=
 =?utf-8?B?Sm13cWZoSHIzd0ZITlM0bU16R3c1M2tJelFObjRpdXZEMEl0N3pWdlVEUkhJ?=
 =?utf-8?B?WWdoUUgyay9KdDRuSFFZbGloVGFkUVdhbXBUTUtKOHdqb05YYi9iT1BlQU9O?=
 =?utf-8?B?eVBWOTJUSjRVM1J6UmZjcWg0WWZ6NjFiRFc5Q2RKYUhJL09YeDBSclREbi9q?=
 =?utf-8?B?eTFva1VDcmw3c2FDVlh4YURmZktWNzdKMnVBSEIwOERRWFdIRytFd0dqT3pF?=
 =?utf-8?B?d3JlZDk3YldmaDNVa2Zma2NaQWpwZENkM1AxOFg0U085eFRjUHkrQUExQ1Bk?=
 =?utf-8?B?VFphOC90SWxJM09WRGJiZ0YzSWJMNC9Gd25zcWtZRkhLNGpEN3JVVkxwajJ3?=
 =?utf-8?B?RU9tUmMwSzVXM050TC9vQStPRERzbUF3blhmTjVMQWs2MzRiNXF3cHB1alBY?=
 =?utf-8?B?OTE0U29lRVBtMHJ1MGVZUnhHbFVQbEUyWnI0VUNqZnA0czlNZU1GNEdua0N0?=
 =?utf-8?B?NFdIRlQzSzhIUk05TnR0cXFkU3hGZ2w3R0FRalUyUlZRSUhEVldtL1J3Z1M0?=
 =?utf-8?B?cTRCb1k3bjgydmpEZWFFTWRJNTFaTVA1aGZpbWs2MC9HZytlQ3Y1cXROQndS?=
 =?utf-8?B?RHRpeWs1U3V3MWpzaXcxUlhTZzJjdDYyVXFTNnhOY0FudG1tSmpScTlYL2lD?=
 =?utf-8?B?Z05rN3Vma0VJdFJ2UlRkSjBpRmJuOStLVVJmV0dSb2VWWFhTSHZkbWR5QkVR?=
 =?utf-8?B?SitsWnNTeXNmZURnWVAydG5rQllWOVlXUUZHL0xSMEJNZ1Y2NmRzRjFVOTVZ?=
 =?utf-8?B?VlYwSVlFRWF2WXhDQ2dPTGhsT0NKaGpFWnJ0R3RrZWNwSGZ0ZXYzSkJvWjNI?=
 =?utf-8?B?Q0hjZjlFVkJGV3dYd01ON0FzVnVqTkFaMFIwQ2wzWUNFaGc1VmxOS2dhQzV2?=
 =?utf-8?B?UEdrQS9jYmJJcDZmQnNkcDVObThyM1ZaY3VDMFpFemY5SXhRUTFIRjFQaVcy?=
 =?utf-8?B?YUdWTThNbmdWMDdwdzd2K1VBY0dBc1JjUFgvTVJkbXgzY2U2dElOUmpQbnli?=
 =?utf-8?B?WVRrcFRZd1JwNUR4UVRBRjZMZldhRE93R0YrVHpVa3Bad3NwUmIxUnZDeFJS?=
 =?utf-8?B?R0FtMEFnWUFNN2dqbENhNDJLcUZnMStFRTdlbHpvYUZKd3M3aC83R0VPS2lp?=
 =?utf-8?B?eThHS21mbkkrZUYwWGQwZnRkc2lXUlR1Q2xHbHE2cEJ5bnp3c2FicXo3enRp?=
 =?utf-8?B?eXA1dmVFQ293Ujl0c0R5MGI0ZURxUFFKQzFpMUI0dUF6TnV4UzY0TEYzVzlE?=
 =?utf-8?B?N0JjM2JrTkJPd3JMbHZGek9nRlRuNzZRdmpNSFdEKzlETDNtSnJWR3pZOGpF?=
 =?utf-8?B?MDBZa2hZeThLeDZPMGkxQkFjKzJSc2dYa1BtNmhWZEZJeUdKb2Jrc3c4TmVm?=
 =?utf-8?B?REh6YUdLd2hRazFaa3c5YmhJTCtVWEY4dDZic0pITVRlbGlEQmFWblFQUUph?=
 =?utf-8?B?MFJIQm5UWFBqNmZiWmxZaUpjdmY4UG1XMXR1QTNhVC9mQTRENkYxbldxd29p?=
 =?utf-8?B?T0FpZWx3SE8rVS9majlSeHFiV0FqaEJ6NnZUTTNDWUp6eVlrR3Z5TWlWMVh5?=
 =?utf-8?B?aGtJaDg1eC9iWmJrY0R2d1drYTlJWjNmRGY1amtCcytneC8ySFNXUXhnNUda?=
 =?utf-8?B?eHprS1RqVEVnWE4veDltWi9XOEZOR0pkdWlITHNib2RaUndYeWJ2TWZPUmRD?=
 =?utf-8?B?SWs3dWl2ZFVvWHp3elJCR0tqQUlKS1p2TDgxMDZzckF5MTMxdEQ2L1ZETjlV?=
 =?utf-8?B?dDhyNnRWaVV2TURpZG5nTlA4bnl4VDdCdTE2bUlPUVhEUmhsRGo3OW5Kcm15?=
 =?utf-8?B?MGNzNHVpMDVSSnRHQlBaNzZVOEZYSzhKdnRjZjlZTFBsOXpyWFdLZ3lrSE8y?=
 =?utf-8?B?cy9WcTA0cHBJL3luLy9odW03SHN5WWc0Zm9xbTlVUkRxOFVPVXZkWHJ6VjdG?=
 =?utf-8?B?cTRiZGM0SktWVU5oK05MbXR0b0FqQjJHWXhKVi9nOEdudE5EVXAyUklHMFZ1?=
 =?utf-8?Q?0R1qlO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272ae2c4-1a91-4b18-bc70-08da0bd40b84
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 07:17:38.2910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDMqobW7iCmlv0imKP7nFXKeJlSNsdz6LgSyR+7H3WgKgaR6fMfdNubZuNCrK7eB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3264
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.03.22 um 16:44 schrieb Robert Beckett:
>
>
> On 21/03/2022 09:51, Christian König wrote:
>> Am 18.03.22 um 20:50 schrieb Robert Beckett:
>>> when allocating a resource in place it is common to free the buffer's
>>> resource, then allocate a new resource in a different placement.
>>>
>>> e.g. amdgpu_bo_create_kernel_at calls ttm_resource_free, then calls
>>> ttm_bo_mem_space.
>>
>> Well yes I'm working the drivers towards this, but NAK at the moment. 
>> Currently bo->resource is never expected to be NULL.
>>
>> And yes I'm searching for this bug in amdgpu for quite a while. Where 
>> exactly does that happen?
>
> in my case, I am writing new code for i915 that does this. I will 
> switch it to allocate the new resource first, then free the old one if 
> successful.
>
> For the existing amd case, see 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_object.c%3Fh%3Dv5.17%23n384&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C81f91d39683e4991181008da0b51a8d0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637834742606744919%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=mjHPvBStFM7tsYf%2BL9fYCWqddZuIaeza6BsRF3fAmao%3D&amp;reserved=0
>
>
> amdgpu_bo_create_kernel_at calls ttm_resource_free, then calls 
> ttm_bo_mem_space. If the ttm_bo_mem_space call fails (e.g. due to 
> memory pressure), then the error path will try to deref bo->resource, 
> which will be null at that point.

Yeah, but that's a special handling only used during driver startup. We 
somehow have this on systems with DMA-buf sharing as well.

>
> to fix this, I honestly don't see a reason to not also have the safety 
> check for null there. It could check early and return an error if it 
> is null. I think that defensive programming here makes sense, better 
> than a null deref if someone programs it wrong.

Having it here is fine, the problem is you need to have that at tons of 
other places as well.

Maybe I should send you my WIP patch set for this? If you handle all the 
other cases as well I'm perfectly fine with this.

Regards,
Christian.

>
>
>
>>
>> Amdgpu is supposed to allocate a new resource first, then do a swap 
>> and the free the old one.
>>
>> Thanks,
>> Christian.
>>
>>>
>>> In this situation, bo->resource will be null as it is cleared during
>>> the initial freeing of the previous resource.
>>> This leads to a null deref.
>>>
>>> Fixes: d3116756a710 (drm/ttm: rename bo->mem and make it a pointer)
>>>
>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index db3dc7ef5382..62b29ee7d040 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -875,7 +875,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>>       }
>>>   error:
>>> -    if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
>>> +    if (bo->resource && bo->resource->mem_type == TTM_PL_SYSTEM && 
>>> !bo->pin_count)
>>>           ttm_bo_move_to_lru_tail_unlocked(bo);
>>>       return ret;
>>

