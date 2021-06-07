Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F839E5F4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D736E9A4;
	Mon,  7 Jun 2021 17:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148D6E9A4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:54:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso167125wmj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=nAgytmjUu+6KW89FuChx6ZBV94q2zAnIMzbJV2LSk9M=;
 b=cSLM1mHNOXwqY71Pd0sL7g/IbNH6u7sMTwld4Vj4DzUCCF/M6jfjbVDq//kALiIriI
 MmjAo9+GI+H8xpLuaKU7nWgwlfz2eMfepbrTdbPOCr81IB4FXuCl/vPhpi+B8piTlETo
 fTjUtFdoyZvG/SFNPOFYJNiEgCb6Rl0feBUNqOjXcaPINXSQaHRVyupwAScKeJMDTlZf
 JpMQsFOP2BVWBGaBt4PAPZLXkLAXOGPkWCy6Mdquq4ev+HXuJuK/RsbUcyYswON8THxG
 GZoX7XsSPxmcF2G/eZmTx548XBO7knUbXzMMXIGBAl/IWnUpvmyOJk93zaXiKL7JDTp0
 3Yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nAgytmjUu+6KW89FuChx6ZBV94q2zAnIMzbJV2LSk9M=;
 b=Z3Maa8i8IMW2DiBUFYl0tHfeqi4xgBfQhKt8lH4CB0/5w+/ElsljVaTpAgd8OpLmgD
 xZmiAKGuTH3cp6mD7kASj/D2Dyq9K+l/zLnymk37QgkwDxHPUEQrSOC0ONSBYv6yY9xq
 oasr2OXtcbUnKHv6NQ/a698/lsdbGfWRicqk5AtFHQC2iEpAHMr+P9EDJ0CE/D6UyDYW
 MI6svkOmO8rhmCYi5Ibx7R9cFILYZee/6KMoM6HtVqesl65rGxij7XhhHfyM/a13m1U8
 Na0UMbIEjBpHI8qcw27Z+4Dx0JVXScINFwrRI7O+pOtKVjybiM2fXqHDT58RVG3TIfmu
 Pihg==
X-Gm-Message-State: AOAM532dlYV0biB9hYnVnA8Rk9or0RoOpJZoeuhC+ybkKVV4+V28ePFV
 VY8F5n75DuGRudc+lApEVE3UMEr1uT8=
X-Google-Smtp-Source: ABdhPJxPWuWHEUnKW0cyrUl/Obz5AoRw/YWXqu0ZDCZe0v+LXEexkeLJo/SO6LbOwQG9ROkNIavmsA==
X-Received: by 2002:a05:600c:3545:: with SMTP id
 i5mr264515wmq.179.1623088482868; 
 Mon, 07 Jun 2021 10:54:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id 89sm17795651wri.94.2021.06.07.10.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 10:54:42 -0700 (PDT)
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
Date: Mon, 7 Jun 2021 19:54:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
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



Am 07.06.21 um 19:06 schrieb Thomas Hellström (Intel):
>
> On 6/7/21 6:40 PM, Thomas Hellström (Intel) wrote:
>>
>> On 6/2/21 12:09 PM, Christian König wrote:
>> ...
>>> @@ -728,14 +728,15 @@ static int ttm_bo_add_move_fence(struct 
>>> ttm_buffer_object *bo,
>>>    */
>>>   static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>>>                     const struct ttm_place *place,
>>> -                  struct ttm_resource *mem,
>>> +                  struct ttm_resource **mem,
>>>                     struct ttm_operation_ctx *ctx)
>>>   {
>>>       struct ttm_device *bdev = bo->bdev;
>>> -    struct ttm_resource_manager *man = ttm_manager_type(bdev, 
>>> mem->mem_type);
>>> +    struct ttm_resource_manager *man;
>>>       struct ww_acquire_ctx *ticket;
>>>       int ret;
>>>   +    man = ttm_manager_type(bdev, (*mem)->mem_type);
>>
>> Isn't (*mem) uninitialized here? Should be place->mem_type? Eviction 
>> is immediately sent to the bushes.
>>
>> Got at least one additional NULL pointer deref to track down in the 
>> eviction code, but could be a merge error of mine as well.
>
> Actually this last one was probably due to a bad temporary fix of the 
> above one.

I've found one more warning during my testing now. But that is just a 
false positive.

Apart from that I haven't seen any other fallout, but fingers crossed.

Christian.

>
> /Thomas
>
>>
>>

