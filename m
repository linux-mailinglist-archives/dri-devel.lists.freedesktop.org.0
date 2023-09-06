Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC5793734
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 10:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B882E10E07C;
	Wed,  6 Sep 2023 08:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3900910E07C;
 Wed,  6 Sep 2023 08:34:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3ff1c397405so33711085e9.3; 
 Wed, 06 Sep 2023 01:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693989243; x=1694594043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WXUiG0N/v5C+H/IW/AbWw2gVJrJnScZs8V5H+ZsKEsQ=;
 b=lgeqgSfaDXuQ+f191BGez4XxSoWRhP93e7iVFB7SOMlUeUfCpFPUAhIGMXAlbQIDZW
 0COg9dZJSIAA9euH2NzVrYBYNHi2mdwJHY/AKbR0YkqczrM44Kw6cUXTFMBZtffmIYzZ
 yne4EfH5SJo7vbyqYtNwjP3APgtil8M7hflB14MYxoTQCvqZ9TRoWbT2D+qAciL0qA34
 33aYbxlPzH4ftyC2O0Qeu4Bk1C7PlvcvxgS7vKucWR1Eekvo2ZMUR6XnFUN4usNaUrVs
 07bEEnGp+ytS0C9XbnuY7Jj6CJ/2tHikVSxQlVzjLQuiWCJf+0RFAR3cxSG+eGovhnii
 2RSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693989243; x=1694594043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WXUiG0N/v5C+H/IW/AbWw2gVJrJnScZs8V5H+ZsKEsQ=;
 b=bGHJjwunSkQlS1l99Xz0De2zO2B8kzqMLqE6Pog+vjHNVZEmhk67KceGtaLYiZuEy2
 ZcoraQgOOGEkQIY2zCFYIrdmYV7YuFYKat0HmLj+pjvJm5NAQS+NT65RE8WbG2BWAolC
 yshzKDFoUhDZLHT1W6/7ofVEFGRFUq/2dmSECnYG0hJBeO/eqbaQR9cSEM2IjX4w9F5b
 Fcv6qNCwdlnXot1e236H7k9R9swVhALqx0oiJ47UxIxLtUJ/Qoirqkw1T+dElphq6cb6
 pdtkGe+O2TjfAXflkvfC7KTh3ZTeZhhA67m1ZsfG9+aunrSpJ/Sts454gh/mDvVHa1Jq
 BQ0w==
X-Gm-Message-State: AOJu0Ywk0dgZE6ksC//EV/yvgcyatoR+/8JRizCVnoECWNsbHLbJbqas
 QNfpsk79QeYL3iZwDusDQVGHuNChllmMiw==
X-Google-Smtp-Source: AGHT+IFG7kInihoWZiZVzvnKai9uupXkq31UCB5s1VkCReYepFkIhZ1IE/OwCNGJCZEPR0fJHPZk5g==
X-Received: by 2002:a05:600c:d5:b0:401:aa8f:756f with SMTP id
 u21-20020a05600c00d500b00401aa8f756fmr1676433wmm.17.1693989243344; 
 Wed, 06 Sep 2023 01:34:03 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfdd89000000b003196b1bb528sm19872279wrl.64.2023.09.06.01.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 01:34:02 -0700 (PDT)
Message-ID: <13c39e75-2ba7-2a1c-ab9b-acf10ad23a3f@gmail.com>
Date: Wed, 6 Sep 2023 10:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/drm_exec: Work around a WW mutex lockdep oddity
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-4-thomas.hellstrom@linux.intel.com>
 <eabe3626-9fd1-c56f-5405-44653d2aab33@gmail.com>
 <2457e9ba-ecdb-b427-692b-a5c85f9e8828@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2457e9ba-ecdb-b427-692b-a5c85f9e8828@linux.intel.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.09.23 um 16:29 schrieb Thomas Hellström:
> Hi, Christian
>
> On 9/5/23 15:14, Christian König wrote:
>> Am 05.09.23 um 10:58 schrieb Thomas Hellström:
>>> If *any* object of a certain WW mutex class is locked, lockdep will
>>> consider *all* mutexes of that class as locked. Also the lock 
>>> allocation
>>> tracking code will apparently register only the address of the first
>>> mutex locked in a sequence.
>>> This has the odd consequence that if that first mutex is unlocked and
>>> its memory then freed, the lock alloc tracking code will assume that 
>>> memory
>>> is freed with a held lock in there.
>>>
>>> For now, work around that for drm_exec by releasing the first grabbed
>>> object lock last.
>>>
>>> Related lock alloc tracking warning:
>>> [  322.660067] =========================
>>> [  322.660070] WARNING: held lock freed!
>>> [  322.660074] 6.5.0-rc7+ #155 Tainted: G     U           N
>>> [  322.660078] -------------------------
>>> [  322.660081] kunit_try_catch/4981 is freeing memory 
>>> ffff888112adc000-ffff888112adc3ff, with a lock still held there!
>>> [  322.660089] ffff888112adc1a0 
>>> (reservation_ww_class_mutex){+.+.}-{3:3}, at: 
>>> drm_exec_lock_obj+0x11a/0x600 [drm_exec]
>>> [  322.660104] 2 locks held by kunit_try_catch/4981:
>>> [  322.660108]  #0: ffffc9000343fe18 
>>> (reservation_ww_class_acquire){+.+.}-{0:0}, at: 
>>> test_early_put+0x22f/0x490 [drm_exec_test]
>>> [  322.660123]  #1: ffff888112adc1a0 
>>> (reservation_ww_class_mutex){+.+.}-{3:3}, at: 
>>> drm_exec_lock_obj+0x11a/0x600 [drm_exec]
>>> [  322.660135]
>>>                 stack backtrace:
>>> [  322.660139] CPU: 7 PID: 4981 Comm: kunit_try_catch Tainted: G     
>>> U           N 6.5.0-rc7+ #155
>>> [  322.660146] Hardware name: ASUS System Product Name/PRIME B560M-A 
>>> AC, BIOS 0403 01/26/2021
>>> [  322.660152] Call Trace:
>>> [  322.660155]  <TASK>
>>> [  322.660158]  dump_stack_lvl+0x57/0x90
>>> [  322.660164]  debug_check_no_locks_freed+0x20b/0x2b0
>>> [  322.660172]  slab_free_freelist_hook+0xa1/0x160
>>> [  322.660179]  ? drm_exec_unlock_all+0x168/0x2a0 [drm_exec]
>>> [  322.660186]  __kmem_cache_free+0xb2/0x290
>>> [  322.660192]  drm_exec_unlock_all+0x168/0x2a0 [drm_exec]
>>> [  322.660200]  drm_exec_fini+0xf/0x1c0 [drm_exec]
>>> [  322.660206]  test_early_put+0x289/0x490 [drm_exec_test]
>>> [  322.660215]  ? __pfx_test_early_put+0x10/0x10 [drm_exec_test]
>>> [  322.660222]  ? __kasan_check_byte+0xf/0x40
>>> [  322.660227]  ? __ksize+0x63/0x140
>>> [  322.660233]  ? drmm_add_final_kfree+0x3e/0xa0 [drm]
>>> [  322.660289]  ? _raw_spin_unlock_irqrestore+0x30/0x60
>>> [  322.660294]  ? lockdep_hardirqs_on+0x7d/0x100
>>> [  322.660301]  ? __pfx_kunit_try_run_case+0x10/0x10 [kunit]
>>> [  322.660310]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 
>>> [kunit]
>>> [  322.660319]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
>>> [  322.660328]  kthread+0x2e7/0x3c0
>>> [  322.660334]  ? __pfx_kthread+0x10/0x10
>>> [  322.660339]  ret_from_fork+0x2d/0x70
>>> [  322.660345]  ? __pfx_kthread+0x10/0x10
>>> [  322.660349]  ret_from_fork_asm+0x1b/0x30
>>> [  322.660358]  </TASK>
>>> [  322.660818]     ok 8 test_early_put
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_exec.c |  2 +-
>>>   include/drm/drm_exec.h     | 35 +++++++++++++++++++++++++++++++----
>>>   2 files changed, 32 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>>> index ff69cf0fb42a..5d2809de4517 100644
>>> --- a/drivers/gpu/drm/drm_exec.c
>>> +++ b/drivers/gpu/drm/drm_exec.c
>>> @@ -56,7 +56,7 @@ static void drm_exec_unlock_all(struct drm_exec 
>>> *exec)
>>>       struct drm_gem_object *obj;
>>>       unsigned long index;
>>>   -    drm_exec_for_each_locked_object(exec, index, obj) {
>>> +    drm_exec_for_each_locked_object_reverse(exec, index, obj) {
>>
>> Well that's a really good catch, just one more additional thought below.
>>
>>>           dma_resv_unlock(obj->resv);
>>>           drm_gem_object_put(obj);
>>>       }
>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>> index e0462361adf9..55764cf7c374 100644
>>> --- a/include/drm/drm_exec.h
>>> +++ b/include/drm/drm_exec.h
>>> @@ -51,6 +51,20 @@ struct drm_exec {
>>>       struct drm_gem_object *prelocked;
>>>   };
>>>   +/**
>>> + * drm_exec_obj() - Return the object for a give drm_exec index
>>> + * @exec: Pointer to the drm_exec context
>>> + * @index: The index.
>>> + *
>>> + * Return: Pointer to the locked object corresponding to @index if
>>> + * index is within the number of locked objects. NULL otherwise.
>>> + */
>>> +static inline struct drm_gem_object *
>>> +drm_exec_obj(struct drm_exec *exec, unsigned long index)
>>> +{
>>> +    return index < exec->num_objects ? exec->objects[index] : NULL;
>>> +}
>>> +
>>>   /**
>>>    * drm_exec_for_each_locked_object - iterate over all the locked 
>>> objects
>>>    * @exec: drm_exec object
>>> @@ -59,10 +73,23 @@ struct drm_exec {
>>>    *
>>>    * Iterate over all the locked GEM objects inside the drm_exec 
>>> object.
>>>    */
>>> -#define drm_exec_for_each_locked_object(exec, index, obj) \
>>> -    for (index = 0, obj = (exec)->objects[0];        \
>>> -         index < (exec)->num_objects;            \
>>> -         ++index, obj = (exec)->objects[index])
>>> +#define drm_exec_for_each_locked_object(exec, index, obj)        \
>>> +    for ((index) = 0; ((obj) = drm_exec_obj(exec, index)); ++(index))
>>
>> Mhm, that makes it possible to modify the number of objects while 
>> inside the loop, doesn't it?
>
> Sorry, you lost me a bit there. Isn't that possible with the previous 
> code as well?

Yeah, indeed. Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

>
> /Thanks,
>
> Thomas
>
>
>
>>
>> I'm not sure if that's a good idea or not.
>>
>> Regards,
>> Christian.
>>
>>> +
>>> +/**
>>> + * drm_exec_for_each_locked_object_reverse - iterate over all the 
>>> locked
>>> + * objects in reverse locking order
>>> + * @exec: drm_exec object
>>> + * @index: unsigned long index for the iteration
>>> + * @obj: the current GEM object
>>> + *
>>> + * Iterate over all the locked GEM objects inside the drm_exec 
>>> object in
>>> + * reverse locking order. Note that @index may go below zero and wrap,
>>> + * but that will be caught by drm_exec_object(), returning a NULL 
>>> object.
>>> + */
>>> +#define drm_exec_for_each_locked_object_reverse(exec, index, obj)    \
>>> +    for ((index) = (exec)->num_objects - 1; \
>>> +         ((obj) = drm_exec_obj(exec, index)); --(index))
>>>     /**
>>>    * drm_exec_until_all_locked - loop until all GEM objects are locked
>>

