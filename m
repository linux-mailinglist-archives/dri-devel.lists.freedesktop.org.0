Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F58FAD7878
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 18:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A8D10E0AC;
	Thu, 12 Jun 2025 16:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="c6pw1RMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A1910E033;
 Thu, 12 Jun 2025 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eTRNXW0fVGge2AWOB3MBFp05UH3BIqXQgyaRGEov/9o=; b=c6pw1RMdhgyBHvLW0z+HqZKxAB
 OtEmk+VL7J9K/o4VRJ1Gy8xcd9dfQu3yL+FJLQawSnl9okL+BXIRh4RXghtWGZX6dEiUMmSN+0q63
 zM6URuVowG7tgLN2IB38vANoX8YvysAueqvHoU8GzBIlJE5CRXScV/wosrQBgmGFIpPaPuyjuf+7q
 dihv3cSFiXwDFtGpgm068Ye4sg1EJYMePj/C46v8DxVJCjetz/Tvt1WaFzZMDSm5kKgyzVEMNzCBj
 twUSoMksyH93K/O6IWusXx6ezOz3v/tAmwUEcaXtVwfeiE7KFBV1xt8TsmH0y+Ia0PnzhGTjdhK2+
 /GlK8yKQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPl4n-002i0g-Fo; Thu, 12 Jun 2025 18:46:53 +0200
Message-ID: <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
Date: Thu, 12 Jun 2025 17:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tursulin@ursulin.net>, Yiwei Zhang <zzyiwei@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
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


On 12/06/2025 06:40, Lucas De Marchi wrote:
> On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
>> Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
>> memory usage.
>>
>> These are required by VSR on Android 12+ for reporting GPU driver memory
>> allocations.
>>
>> v3:
>> - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>>   per-driver Kconfig (Lucas)
>>
>> v2:
>> - Use u64 as preferred by checkpatch (Tvrtko)
>> - Fix errors in comments/Kconfig description (Tvrtko)
>> - drop redundant "CONFIG" in Kconfig
>>
>> Signed-off-by: Juston Li <justonli@chromium.org>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>> drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
>> 2 files changed, 63 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 4e39188a021ab..89a3d23e3b800 100644
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
>> @@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct 
>> xe_device *xe, struct ttm_tt *tt)
>>         xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
>> }
>>
>> +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
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
> 
> Isn't the first arg supposed to be the gpu id? Doesn't this become
> invalid when I have e.g. LNL + BMG and the trace is enabled?

Good point.

u32 gpu_id does not seem possible to map to anything useful.

Shall we replace it with a string obtained from dev_name(struct device 
*) ? As only Android parses them I think we can get still away with 
changing the tracepoints ABI.

> 
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
>> @@ -525,6 +556,7 @@ static int xe_ttm_tt_populate(struct ttm_device 
>> *ttm_dev, struct ttm_tt *tt,
>>
>>     xe_tt->purgeable = false;
>>     xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
>> +    update_global_total_pages(ttm_dev, tt->num_pages);
>>
>>     return 0;
>> }
>> @@ -541,6 +573,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device 
>> *ttm_dev, struct ttm_tt *tt)
>>
>>     ttm_pool_free(&ttm_dev->pool, tt);
>>     xe_ttm_tt_account_subtract(xe, tt);
>> +    update_global_total_pages(ttm_dev, -(long)tt->num_pages);
>> }
>>
>> static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct 
>> ttm_tt *tt)
>> @@ -1653,6 +1686,15 @@ static void xe_gem_object_free(struct 
>> drm_gem_object *obj)
>>     ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
>> }
>>
>> +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
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
>> @@ -1665,6 +1707,8 @@ static void xe_gem_object_close(struct 
>> drm_gem_object *obj,
>>         ttm_bo_set_bulk_move(&bo->ttm, NULL);
>>         xe_bo_unlock(bo);
>>     }
>> +
>> +    update_process_mem(file_priv, -obj->size);
>> }
>>
>> static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>> @@ -1762,6 +1806,9 @@ static const struct vm_operations_struct 
>> xe_gem_vm_ops = {
>>
>> static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>>     .free = xe_gem_object_free,
>> +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>> +    .open = xe_gem_object_open,
>> +#endif
>>     .close = xe_gem_object_close,
>>     .mmap = drm_gem_ttm_mmap,
>>     .export = xe_gem_prime_export,
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index e5d02a47a5287..b797e766ccbc2 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -641,6 +641,14 @@ struct xe_device {
>>         unsigned int fsb_freq, mem_freq, is_ddr3;
>>     };
>> #endif
>> +
>> +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>> +    /**
>> +     * @global_total_pages: global GPU page usage tracked for gpu_mem
>> +     * tracepoints
>> +     */
>> +    atomic64_t global_total_pages;
>> +#endif
>> };
>>
>> /**
>> @@ -702,6 +710,14 @@ struct xe_file {
>>
>>     /** @refcount: ref count of this xe file */
>>     struct kref refcount;
>> +
>> +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>> +    /**
>> +     * @process_mem: per-process GPU memory usage tracked for gpu_mem
>> +     * tracepoints
>> +     */
>> +    atomic64_t process_mem;
> 
> so... this is not per-process, it's actually "per dev node" open. Does
> this map correctly to the intended use and how it's handled in msm?

Per struct drm_file. Yes it is the same, both do it via 
drm_gem_object_funcs->open/close.

Regards,

Tvrtko

> 
> Lucas De Marchi
> 
>> +#endif
>> };
>>
>> #endif
>> -- 
>> 2.50.0.rc1.591.g9c95f17f64-goog
>>

