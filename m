Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658739E60B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E666E9A6;
	Mon,  7 Jun 2021 17:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE75C6E9A6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:59:48 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so226472wmd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=GbI1/CS5Yg21LVSxBugoEXoIm0v4GOLbCqwFVGLNU6s=;
 b=hEfC5nr5otIkXALfA6AIe0uYT1gWPFkOmzfQxVWcikPbA3ZwCTT9Bp58w664FgfrLv
 FR4M0MnMeT/h2QmL1icLwiWMBJaE3+cMyijRwp+i+e4tNRoeMNrGuj3UBNzK0jJl0OBz
 CcHrmVoTMbX0dCIdNDwIa+wV1FwLMTezRlbS21p3a2YU+sFz2/ryJCyh+W2iUSKmQIFc
 oaOSVf81BDoBB3+JJlfEtuYcY1SKcbs5nwPQX9Ri+0BGoBQahOyMliQtWGpzLLqsTr1w
 hh2WzIH+3mKSVi942BvntXBtDqY7VyMfZFmJeX3ekg8GBkqxxG+H8dcUQtWiZmkQFBWB
 u9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GbI1/CS5Yg21LVSxBugoEXoIm0v4GOLbCqwFVGLNU6s=;
 b=ALPyuc0jbQzgKznZmwWp4CXBYU856UuSoqXxow0eAl7LB7z2Vt55PwhTCYVBgfbPCZ
 Ae+rFA3Wh4Grjcw2rTf5Xw9+hgxshfAUu+828aWolEPLiL+JzWxIkbNfAnLvlq03TQsS
 Tefnppfn5XYgnctN7jsnuY8i9Mm7oCA7fDb/jGBUquXNRSfGpllVWVga0n4ZwhzaKDm8
 bpuegzCg+JbX5btr6Fz0f8vfxsQ0I49QB54zGObDj7QGRgl9ofVUvFU8iPone+E++R2s
 GFR+4TNEN8fWPeKCIZhOQXB6nSi62XiIriwXIKdx0VDydObO5bmJ3eoC3h9jjWSgQt2k
 vD/g==
X-Gm-Message-State: AOAM530z83G2VcZIp9/KpMPKauVhp7xmpZ4BVCJZo4aO3jMfuBSWfM9k
 wjA9JlRVhbPc6fsjyAXIsdZxtV3cy7k=
X-Google-Smtp-Source: ABdhPJyQEUG0mLFFZrCRunt3a+wMfk5pcVWZDdhtxhe+M9wwgGEj20Yw7hpRtRpEei0CIYJJTAlc8Q==
X-Received: by 2002:a05:600c:3ba0:: with SMTP id
 n32mr294775wms.107.1623088787464; 
 Mon, 07 Jun 2021 10:59:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id b15sm2391960wrr.27.2021.06.07.10.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 10:59:47 -0700 (PDT)
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
 <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
 <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6d316dfe-0378-8284-1f8e-29caf5619e34@gmail.com>
Date: Mon, 7 Jun 2021 19:59:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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



Am 07.06.21 um 19:58 schrieb Thomas Hellström (Intel):
>
> On 6/7/21 7:54 PM, Christian König wrote:
>>
>>
>> Am 07.06.21 um 19:06 schrieb Thomas Hellström (Intel):
>>>
>>> On 6/7/21 6:40 PM, Thomas Hellström (Intel) wrote:
>>>>
>>>> On 6/2/21 12:09 PM, Christian König wrote:
>>>> ...
>>>>> @@ -728,14 +728,15 @@ static int ttm_bo_add_move_fence(struct 
>>>>> ttm_buffer_object *bo,
>>>>>    */
>>>>>   static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>>>>>                     const struct ttm_place *place,
>>>>> -                  struct ttm_resource *mem,
>>>>> +                  struct ttm_resource **mem,
>>>>>                     struct ttm_operation_ctx *ctx)
>>>>>   {
>>>>>       struct ttm_device *bdev = bo->bdev;
>>>>> -    struct ttm_resource_manager *man = ttm_manager_type(bdev, 
>>>>> mem->mem_type);
>>>>> +    struct ttm_resource_manager *man;
>>>>>       struct ww_acquire_ctx *ticket;
>>>>>       int ret;
>>>>>   +    man = ttm_manager_type(bdev, (*mem)->mem_type);
>>>>
>>>> Isn't (*mem) uninitialized here? Should be place->mem_type? 
>>>> Eviction is immediately sent to the bushes.
>>>>
>>>> Got at least one additional NULL pointer deref to track down in the 
>>>> eviction code, but could be a merge error of mine as well.
>>>
>>> Actually this last one was probably due to a bad temporary fix of 
>>> the above one.
>>
>> I've found one more warning during my testing now. But that is just a 
>> false positive.
>>
>> Apart from that I haven't seen any other fallout, but fingers crossed.
>
> vmwgfx doesn't seem to happy. It works AFAICT., but warns in 
> vmw_move() about ttm_bo_assign_mem() replacing an existing resource.

Yeah, that's the one I've just fixed. Patch is underway.

Christian.

>
> /Thomas
>
>
>
>>
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>>
>>>>

