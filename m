Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E4A7FA84D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 18:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB3410E3BD;
	Mon, 27 Nov 2023 17:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6035010E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701107421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRrmnFrODFs76V+ONVt7h6z4FfX5C6d9b8+U6ygm7mU=;
 b=Fplc3xLXOcyQmtWJW/eGttAk4o64OQSPkC/FpjgTyJfhryUcLSkR6O0S1ZWhneq2igaiD6
 My9+3hKsDi/zNpji+Jvpqja5lTxRUWwBycz29rRzYCS13opXJyvIxjTr6YxeGLLcc5RvKM
 4daoDSjU/w1amy/4xFUntdzayA0fAfA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-_Aq59BuFO4-eJdZ3qk3ilA-1; Mon, 27 Nov 2023 12:50:19 -0500
X-MC-Unique: _Aq59BuFO4-eJdZ3qk3ilA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-543298e3cc8so3155524a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 09:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701107418; x=1701712218;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRrmnFrODFs76V+ONVt7h6z4FfX5C6d9b8+U6ygm7mU=;
 b=oNGhKbW2zuM43y1PJ4JcjbLhxVN76Jy9rk/r2X73sYuJOSm5P+tai7jyRJ6xwIltr7
 bj9J+fiHYiqBYTKi8lh9WzViaPDXu6P3fSJpcPOZJ4AjbmEJEEwGt1m7BGBz+re9uiVo
 PL3JkuKMO+G4TRcDwI5o/kXSrYLV/uJR2j6R02MO34FaI7ccEeYovecavJzmEXy+s99W
 NpuDwrTADbdI89iIJGLLee93mvjxDTuxG7J1jekbSgyW0b4TMT5i2X+SXoEuchipREnb
 pJU/1kHLEPCx2nw/gqAG+vclu9GZN0VsDo/shN7VzH/cCl+v5yAKvjICgy7FqV5wORFj
 YbJQ==
X-Gm-Message-State: AOJu0Yyiv80LXOrQ201FIYPk1Dqe0E+wCb9Kt4Syn47U2UHX1oVGzwvU
 aQMvs2qV9kpg5aiJSo9u2oQ/Tfie22FLoRqFxV8Wz2LsZdyb8vAgHTMZ8J9oypcf0d2+bZPZ/8Q
 7CWNCQ+rjxffX+lOmsXKa5U6xfADU
X-Received: by 2002:a50:aac2:0:b0:548:4a43:8c6e with SMTP id
 r2-20020a50aac2000000b005484a438c6emr8223134edc.5.1701107418599; 
 Mon, 27 Nov 2023 09:50:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPK4FxFJY84U6jF2RP0ECMu2gN/ocuxDS4lXEx/ksyXdPig8RJk2QSEVzOtCjY/itBQ/RFzQ==
X-Received: by 2002:a50:aac2:0:b0:548:4a43:8c6e with SMTP id
 r2-20020a50aac2000000b005484a438c6emr8223123edc.5.1701107418261; 
 Mon, 27 Nov 2023 09:50:18 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7c783000000b0054901c25d50sm5405285eds.14.2023.11.27.09.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 09:50:17 -0800 (PST)
Message-ID: <92227297-af97-4d64-bd95-3217de851fe7@redhat.com>
Date: Mon, 27 Nov 2023 18:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next 4/5] drm/gpuvm: fall back to
 drm_exec_lock_obj()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-5-dakr@redhat.com>
 <3c7b7683-da36-4ffe-a250-91eef019499f@redhat.com>
 <762bb5f4-f9f5-4ebc-84d3-5465df3ffbf6@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <762bb5f4-f9f5-4ebc-84d3-5465df3ffbf6@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: sarah.walker@imgtec.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, matt.coster@imgtec.com,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/27/23 14:52, Christian König wrote:
> Am 25.11.23 um 00:40 schrieb Danilo Krummrich:
>> Hi Christian,
>>
>> do you think it makes sense to handle this in drm_exec_prepare_obj() or
>> even dma_resv_reserve_fences() even?
> 
> IIRC for drm_exec the discussion has gone a bit back and forth between handling 0 and having a separate function which doesn't allocate fences.
> 
> We ended up with the solution using separate calls since you either know that you don't need fences (because you for example only need to look something up) or you need fences and eventually calculate the number you need dynamically and if you then end up with 0 it's a bug.

I don't have a strong opinion on that. Though, in GPUVM I'd probably still need some wrapper like

+exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+         unsigned int num_fences)
+{
+    return num_fences ? drm_exec_prepare_obj(exec, obj, num_fences) :
+                drm_exec_lock_obj(exec, obj);
+}

to prevent either duplicate code or rather unnecessary complicated abstractions.

And I'm not sure it's super nice that drm_gpuvm_prepare_objects() allows zero fences, whereas drm_exec_prepare_obj() does not.

> 
> So to sum it up the conclusion was that it's more defensive to complain about 0 fences to reserve (which reminds me that dma_resv_reserve_fences() still needs to get a warning for 0 fences as well).

What's the logic you'd want to apply there? WARN() but still allocate at least 4 slots or WARN() and return doing nothing?

- Danilo

> 
> Regards,
> Christian.
> 
>>
>> - Danilo
>>
>> On 11/25/23 00:36, Danilo Krummrich wrote:
>>> Fall back to drm_exec_lock_obj() if num_fences is zero for the
>>> drm_gpuvm_prepare_* function family.
>>>
>>> Otherwise dma_resv_reserve_fences() would actually allocate slots even
>>> though num_fences is zero.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_gpuvm.c | 36 +++++++++++++++++++++++++++++++++---
>>>   include/drm/drm_gpuvm.h     | 23 +++--------------------
>>>   2 files changed, 36 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>> index 54f5e8851de5..d1d1c2379e44 100644
>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>> @@ -1085,6 +1085,36 @@ drm_gpuvm_put(struct drm_gpuvm *gpuvm)
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>>>   +static int
>>> +exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
>>> +         unsigned int num_fences)
>>> +{
>>> +    return num_fences ? drm_exec_prepare_obj(exec, obj, num_fences) :
>>> +                drm_exec_lock_obj(exec, obj);
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
>>> + * @gpuvm: the &drm_gpuvm
>>> + * @exec: the &drm_exec context
>>> + * @num_fences: the amount of &dma_fences to reserve
>>> + *
>>> + * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
>>> + *
>>> + * Using this function directly, it is the drivers responsibility to call
>>> + * drm_exec_init() and drm_exec_fini() accordingly.
>>> + *
>>> + * Returns: 0 on success, negative error code on failure.
>>> + */
>>> +int
>>> +drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>>> +             struct drm_exec *exec,
>>> +             unsigned int num_fences)
>>> +{
>>> +    return exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_vm);
>>> +
>>>   static int
>>>   __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>>                   struct drm_exec *exec,
>>> @@ -1095,7 +1125,7 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>>       int ret = 0;
>>>         for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
>>> -        ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
>>> +        ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
>>>           if (ret)
>>>               break;
>>>       }
>>> @@ -1116,7 +1146,7 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
>>>         drm_gpuvm_resv_assert_held(gpuvm);
>>>       list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
>>> -        ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
>>> +        ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
>>>           if (ret)
>>>               break;
>>>   @@ -1186,7 +1216,7 @@ drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>>>       drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
>>>           struct drm_gem_object *obj = va->gem.obj;
>>>   -        ret = drm_exec_prepare_obj(exec, obj, num_fences);
>>> +        ret = exec_prepare_obj(exec, obj, num_fences);
>>>           if (ret)
>>>               return ret;
>>>       }
>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>> index f94fec9a8517..b3f82ec7fb17 100644
>>> --- a/include/drm/drm_gpuvm.h
>>> +++ b/include/drm/drm_gpuvm.h
>>> @@ -544,26 +544,9 @@ struct drm_gpuvm_exec {
>>>       } extra;
>>>   };
>>>   -/**
>>> - * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
>>> - * @gpuvm: the &drm_gpuvm
>>> - * @exec: the &drm_exec context
>>> - * @num_fences: the amount of &dma_fences to reserve
>>> - *
>>> - * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
>>> - *
>>> - * Using this function directly, it is the drivers responsibility to call
>>> - * drm_exec_init() and drm_exec_fini() accordingly.
>>> - *
>>> - * Returns: 0 on success, negative error code on failure.
>>> - */
>>> -static inline int
>>> -drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>>> -             struct drm_exec *exec,
>>> -             unsigned int num_fences)
>>> -{
>>> -    return drm_exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
>>> -}
>>> +int drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>>> +             struct drm_exec *exec,
>>> +             unsigned int num_fences);
>>>     int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>>                     struct drm_exec *exec,
>>
> 

