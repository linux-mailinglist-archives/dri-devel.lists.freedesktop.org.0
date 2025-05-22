Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CBAC0FAA
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2AB10E0EF;
	Thu, 22 May 2025 15:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="vn76lKQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612110ECB3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:14:11 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so59841815e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747926850; x=1748531650;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a3sZiJ1HrIH0vvAPchdsYnMHjzF85vrKwPH62p4gbcs=;
 b=vn76lKQgQlZ1c0abi/HrqdU9MhRu88ensxA5Ptz5th1Qgx71ryELnMGS0mDIoXPYE5
 HKej5q8n5/88dKE+DU+yUfJET1jceJs3hwYmBoV3cgoHetuumpER/PqfESaYQB6S0/0K
 AJxoYS+prZxP3T+aDGWMneoMyvQCw7FkQMSjaOSM7r5mCkLw7vM/Njnt7K65l4vyzMRK
 f9/KqCwcpDQQzTBGuJNIh5i1IvDkzRos9HPRZf+8GDNDxPRHDB9e1yFsuLVwvSPSBlM3
 rLRTQ7g73Tzek/gvmHCEwY9J3PdCqZ91J2OhhrB3CCCAg6hDk9q6LnYLeuVtt4Ylc+q1
 AEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747926850; x=1748531650;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a3sZiJ1HrIH0vvAPchdsYnMHjzF85vrKwPH62p4gbcs=;
 b=F2PhNmIKaRrlNJROj8RP3VXKdj5rebdk4x/koylDZ50rbeih77tfTf+8EzGytw7eKH
 4GlVhcgrRdaAneCjq8IgX1oX/kUa3V3+UWgCb9Q6RJPQl82KxL2eWL0g5yVMbHz8S3zn
 /vjyDRyGKSa/pg/d+dMo49jNy3vINZxIrfJ4GxNdCOlEEhKDCg/7r4PN0o4qUEgg2R0i
 Y7iwhCH7uduIkcfb3prg9AzkSxCZpj0AZG2Z4nKsg3WhQ/OLQOncty1VIrHsUxh4ZFej
 MWYcGsmR0swjw69+wGXFz0IDjTYMe6o/HJbzUZnaOdbwPxoijIZVAP49jbnh7k5f6XOS
 zqkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaI6/AeM1z2t1nEyixIPwF2CjJkX5nAPu9pZBWqETyTj6oz+b1AngvhEhaDuYfsv5t3Ka+ezYGfHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeLyLv43Ik7kjDMnxshqwHOuuYLAdEw4Z6MLpLXLyDZFG8LNRB
 1/+QNxb9AoLGPKshqCeaY6mmrfORuPjhkc+zMa7JttEW5C0iNFhL/aGLyNuq/+E0ywQ=
X-Gm-Gg: ASbGnctyFSsRpMX3FIHZBED3L3FUOa8rCN7i6XpiCn7cKwqDvyeP8OpJ5JdJdjAtppf
 BAVJwp0bhWTQCA8J8I/Sdbnw/MCjz+OVErmEPdvosjbzvvcd0ggmqn0yoB9Ecs/EJzETuhxsIsj
 YcM3gVyxKaY9/OJ9ryo3uCJSaIYrvTPZODGdlPs601tFnC97JdX0y5DSgdXzDONhA+6T2BtOHsK
 i+rNj5zMFmUyjgplN5Or+eJCD4zbcbPZQVd+6v+m0PATEewatWqjk+Tw0YI7egB8YlXRorR5QfH
 Ub2D8/kL+wG3yCk6WRdnz+a0iK1s4mULu86Q33R8/Jgpiri2MsknsWfighCptDEXM/XkoelIN6W
 h
X-Google-Smtp-Source: AGHT+IHxyrHzqdJsJGzH7io+zfHcLiRaL/zyrDyhiAQN8cuxqU+RSBZPjdjsoOzMCl94ecGzCN7yUQ==
X-Received: by 2002:a05:600c:1e09:b0:43c:f616:f08 with SMTP id
 5b1f17b1804b1-442fd624854mr247610445e9.8.1747926849572; 
 Thu, 22 May 2025 08:14:09 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f73d4b68sm110285975e9.23.2025.05.22.08.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 08:14:09 -0700 (PDT)
Message-ID: <c5a7ed00-cbae-490a-86ba-e94060097760@ursulin.net>
Date: Thu, 22 May 2025 16:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/bo: add GPU memory trace points
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Cc: intel-xe@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Yiwei Zhang <zzyiwei@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
References: <20250521224239.856298-1-justonli@chromium.org>
 <vvtskvjaqcorex5xpeyyyuvljgikpdyo2vbncgmsdlutpnfaeb@u5gtlafthvh2>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <vvtskvjaqcorex5xpeyyyuvljgikpdyo2vbncgmsdlutpnfaeb@u5gtlafthvh2>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/05/2025 15:50, Lucas De Marchi wrote:
> + dri-devel
> 
> On Wed, May 21, 2025 at 10:42:35PM +0000, Juston Li wrote:
>> Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for tracking
>> global and per-process GPU memory usage.
>>
>> These are required by VSR on Android 12+ for reporting GPU driver memory
>> allocations.
>>
>> v2:
>> - Use u64 as preferred by checkpatch (Tvrtko)
>> - Fix errors in comments/Kconfig description (Tvrtko)
>> - drop redundant "CONFIG_" in Kconfig
>>
>> Signed-off-by: Juston Li <justonli@chromium.org>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>> drivers/gpu/drm/xe/Kconfig.debug     | 12 +++++++
>> drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
>> 3 files changed, 75 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/ 
>> Kconfig.debug
>> index 01735c6ece8ba..2371eeda0afd5 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
>>
>>      Recommended for driver developers only.
>>      If in doubt, say "N".
>> +
>> +config DRM_XE_GPU_MEM_TRACEPOINTS
> 
> is there any particular reason to make this user-configurable per driver?
> Why aren't we making CONFIG_TRACE_GPU_MEM configurable (if needed, but
> could just depend on CONFIG_TRACEPOINTS) and then drivers just use it.

Could be done like that too. Msm does unconditional select TRACE_GPU_MEM 
which I thought wouldn't be acceptable so I suggested making it 
configurable.

>> +    bool "Enable Xe GPU memory usage tracepoints"
>> +    default n
>> +    select TRACE_GPU_MEM
>> +    help
>> +      Choose this option to enable tracepoints for tracking
>> +      global and per-process GPU memory usage.
>> +      Intended for performance profiling and required for
>> +      Android.
>> +
>> +      If in doubt, say "N".
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index d99d91fe8aa98..49ee20d54ede6 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -19,6 +19,8 @@
>>
>> #include <kunit/static_stub.h>
>>
>> +#include <trace/events/gpu_mem.h>
>> +
>> #include "xe_device.h"
>> #include "xe_dma_buf.h"
>> #include "xe_drm_client.h"
>> @@ -420,6 +422,35 @@ static void xe_ttm_tt_account_subtract(struct 
>> ttm_tt *tt)
>>         xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt- 
>> >num_pages, 0);
>> }
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
>> +static void update_global_total_pages(struct ttm_device *ttm_dev, 
>> long num_pages)
>> +{
>> +    struct xe_device *xe = ttm_to_xe_device(ttm_dev);
>> +    u64 global_total_pages =
>> +        atomic64_add_return(num_pages, &xe->global_total_pages);
>> +
>> +    trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
>> +}
>> +
>> +static void update_process_mem(struct drm_file *file, ssize_t size)
>> +{
>> +    struct xe_file *xef = to_xe_file(file);
>> +    u64 process_mem = atomic64_add_return(size, &xef->process_mem);
>> +
>> +    rcu_read_lock(); /* Locks file->pid! */
>> +    trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), 
>> process_mem);
>> +    rcu_read_unlock();
>> +}
>> +#else
>> +static inline void update_global_total_pages(struct ttm_device 
>> *ttm_dev, long num_pages)
>> +{
>> +}
>> +
>> +static inline void update_process_mem(struct drm_file *file, ssize_t 
>> size)
>> +{
>> +}
>> +#endif
>> +
>> static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>>                        u32 page_flags)
>> {
>> @@ -528,6 +559,7 @@ static int xe_ttm_tt_populate(struct ttm_device 
>> *ttm_dev, struct ttm_tt *tt,
>>
>>     xe_tt->purgeable = false;
>>     xe_ttm_tt_account_add(tt);
>> +    update_global_total_pages(ttm_dev, tt->num_pages);
>>
>>     return 0;
>> }
>> @@ -542,6 +574,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device 
>> *ttm_dev, struct ttm_tt *tt)
>>
>>     ttm_pool_free(&ttm_dev->pool, tt);
>>     xe_ttm_tt_account_subtract(tt);
>> +    update_global_total_pages(ttm_dev, -(long)tt->num_pages);
>> }
>>
>> static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct 
>> ttm_tt *tt)
>> @@ -1648,6 +1681,15 @@ static void xe_gem_object_free(struct 
>> drm_gem_object *obj)
>>     ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
>> }
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
>> +static int xe_gem_object_open(struct drm_gem_object *obj,
>> +                  struct drm_file *file_priv)
>> +{
>> +    update_process_mem(file_priv, obj->size);
>> +    return 0;
>> +}
>> +#endif
>> +
>> static void xe_gem_object_close(struct drm_gem_object *obj,
>>                 struct drm_file *file_priv)
>> {
>> @@ -1660,6 +1702,8 @@ static void xe_gem_object_close(struct 
>> drm_gem_object *obj,
>>         ttm_bo_set_bulk_move(&bo->ttm, NULL);
>>         xe_bo_unlock(bo);
>>     }
>> +
>> +    update_process_mem(file_priv, -obj->size);
>> }
>>
>> static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>> @@ -1757,6 +1801,9 @@ static const struct vm_operations_struct 
>> xe_gem_vm_ops = {
>>
>> static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>>     .free = xe_gem_object_free,
>> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> 
> in future we may have other reasons for this, then we will need to
> refactor these ifdefs. So, maybe just assign this without ifdef, which
> allows to remove the ifdef around xe_gem_object_open. The impl of the
> update_* functions could also be in the form
> 
> static void update_...()
> {
> #if IS_ENABLED(CONFIG_...)
> #endif
> }

It was also my suggestion to do it like this to avoid having adding an 
->open() callback which ends up an empty function call on all builds 
expect Android kernels. I agree ifdef-ery is heavy like this, but in 
this case it feels justified.

Regards,

Tvrtko

>> +    .open = xe_gem_object_open,
>> +#endif
>>     .close = xe_gem_object_close,
>>     .mmap = drm_gem_ttm_mmap,
>>     .export = xe_gem_prime_export,
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index f81be293b260e..dd9d411e66dac 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -639,6 +639,14 @@ struct xe_device {
>>         unsigned int fsb_freq, mem_freq, is_ddr3;
>>     };
>> #endif
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
>> +    /**
>> +     * @global_total_pages: global GPU page usage tracked for gpu_mem
>> +     * tracepoints
>> +     */
>> +    atomic64_t global_total_pages;
>> +#endif
>> };
>>
>> /**
>> @@ -700,6 +708,14 @@ struct xe_file {
>>
>>     /** @refcount: ref count of this xe file */
>>     struct kref refcount;
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
>> +    /**
>> +     * @process_mem: per-process GPU memory usage tracked for gpu_mem
>> +     * tracepoints
>> +     */
>> +    atomic64_t process_mem;
>> +#endif
>> };
>>
>> #endif
>> -- 
>> 2.49.0.1143.g0be31eac6b-goog
>>

