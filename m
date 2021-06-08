Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4445F39EF50
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C036EAC2;
	Tue,  8 Jun 2021 07:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779C6EAC2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 07:14:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so1161684wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ZqFi++HHJPqxNYaZ5G1OViGZEwXCPQNujHfz9oI/5Ys=;
 b=fA2AwiX8TEz8/siJlQnMG6YZ8SDWlf+H1QyVAcyLa6G1T3upV1w8xWARvoz69KEM8V
 uDGROe3OGKrgIsjRDncd9f1zAos9/oDHMnJFi/s3tUZm6xF0oEovtVrUs5qNgsYVA16j
 fyONVy4HPBkXLt7jCHSFKjf/uh7b8N7RRiljAnX1k5dxsr/dgqG2ePSCEzWKqzfu3Xto
 9FASw/imKLN/B2/m+kjAqY/PbkDGAKrP1tu/KDHc2qx1JaRdR69SxntjJpYnlH6H/1/y
 ycsMubzWzHFZFc0/sTN/nP/35+EHCx1jxZ13kxRmUSK89RWwtqOyVs3DAjurrIT5h4FE
 GpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZqFi++HHJPqxNYaZ5G1OViGZEwXCPQNujHfz9oI/5Ys=;
 b=dmqJaPOWU5evMw6Xbz5q1tcEGJ2rwWs7IlyjfXA/9enb7Pd3HJaXMat9e3wbpN/HLA
 KcYd9ATzyupPIyha3mOXViztpU19+imp/svw9H23ircLWyDWtnqvs2MDr06VLPzhZfJ7
 9zdZZh83uH9Vq/AKxzDZMA/TNeFYtVA8ucWbJ1Be5ihFyUMXIAmXZU7dweLBewf1E31E
 1rBeV0xIzoWNxlGQh01XRV9Mj5z/FjPcZVqkHlO+Ba3qROIBnTv07uwfoMIzzedIbHMv
 KscSdv5aVaU+UMUWHquSLWkaH5ZuWM+rCut0DFVAmsF19tBT4Gchj/HZLAUI3HDDoMQG
 xQyQ==
X-Gm-Message-State: AOAM53112PSUe/UB00hddWJrBjA9VFvucmWYXCcirK4e6y6lyaxq91RV
 9ck9/q/lVN9PBwioj7eUw0bGcz31TZ8=
X-Google-Smtp-Source: ABdhPJx97hybn+uDCS8fu6yoFR6CR5GEOIDQJwqLT7T0OSx0eMyvUlAmtwLfMVsGdHkkwgDZLC4xfw==
X-Received: by 2002:a05:600c:8a9:: with SMTP id
 l41mr2616827wmp.73.1623136471340; 
 Tue, 08 Jun 2021 00:14:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:197a:8536:afbe:3762?
 ([2a02:908:1252:fb60:197a:8536:afbe:3762])
 by smtp.gmail.com with ESMTPSA id l3sm16840167wmh.2.2021.06.08.00.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 00:14:30 -0700 (PDT)
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
 <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
 <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
 <6d316dfe-0378-8284-1f8e-29caf5619e34@gmail.com>
 <a08db95b-7c75-d998-7443-73d809121e47@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aa1d9fea-d425-608d-6696-96e437acd08c@gmail.com>
Date: Tue, 8 Jun 2021 09:14:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a08db95b-7c75-d998-7443-73d809121e47@shipmail.org>
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

Am 08.06.21 um 07:29 schrieb Thomas Hellström (Intel):
> Hi,
>
> On 6/7/21 7:59 PM, Christian König wrote:
>>
>>
>> Am 07.06.21 um 19:58 schrieb Thomas Hellström (Intel):
>>>
>>> On 6/7/21 7:54 PM, Christian König wrote:
>>>>
>>>>
>>>> Am 07.06.21 um 19:06 schrieb Thomas Hellström (Intel):
>>>>>
>>>>> On 6/7/21 6:40 PM, Thomas Hellström (Intel) wrote:
>>>>>>
>>>>>> On 6/2/21 12:09 PM, Christian König wrote:
>>>>>> ...
>>>>>>> @@ -728,14 +728,15 @@ static int ttm_bo_add_move_fence(struct 
>>>>>>> ttm_buffer_object *bo,
>>>>>>>    */
>>>>>>>   static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>>>>>>>                     const struct ttm_place *place,
>>>>>>> -                  struct ttm_resource *mem,
>>>>>>> +                  struct ttm_resource **mem,
>>>>>>>                     struct ttm_operation_ctx *ctx)
>>>>>>>   {
>>>>>>>       struct ttm_device *bdev = bo->bdev;
>>>>>>> -    struct ttm_resource_manager *man = ttm_manager_type(bdev, 
>>>>>>> mem->mem_type);
>>>>>>> +    struct ttm_resource_manager *man;
>>>>>>>       struct ww_acquire_ctx *ticket;
>>>>>>>       int ret;
>>>>>>>   +    man = ttm_manager_type(bdev, (*mem)->mem_type);
>>>>>>
>>>>>> Isn't (*mem) uninitialized here? Should be place->mem_type? 
>>>>>> Eviction is immediately sent to the bushes.
>>>>>>
>>>>>> Got at least one additional NULL pointer deref to track down in 
>>>>>> the eviction code, but could be a merge error of mine as well.
>>>>>
>>>>> Actually this last one was probably due to a bad temporary fix of 
>>>>> the above one.
>>>>
>>>> I've found one more warning during my testing now. But that is just 
>>>> a false positive.
>>>>
>>>> Apart from that I haven't seen any other fallout, but fingers crossed.
>>>
>>> vmwgfx doesn't seem to happy. It works AFAICT., but warns in 
>>> vmw_move() about ttm_bo_assign_mem() replacing an existing resource.
>>
>> Yeah, that's the one I've just fixed. Patch is underway.
>
> If that's the move_to_ghost patch, I don't think that would fix the 
> vmwgfx issue, as IIRC vmwgfx ever uses ghost objects.

Mhm, could be that vmwgfx is hitting the same warning with a different 
backtrace.

Do you have the log to double check?

Thanks,
Christian.

>
> /Thomas
>
>

