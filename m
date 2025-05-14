Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1A5AB6854
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 12:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2A010E607;
	Wed, 14 May 2025 10:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Am3ybjKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B6510E5FD;
 Wed, 14 May 2025 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e9DzE2b+0+EPHIGM4XP87LuxDvJ8yQfz8YtW+QxjxY8=; b=Am3ybjKgdpTXQq8oTBxlNJpuNd
 KuA4pYUPdX3VLAvjbxwLWXBzNCbmnD2bjO6Cywlb55oQpZRDAm6MvPolrT5c7J91skpX3o6JlUUTL
 lzL1TF8g5NqjG9+NTB0bFMGHOAPKlU0r41+vN/TDMbJwo9q0cfIJiqIgPQaNmmBQ5+NpIFvM9IAqq
 oM5cMwetKMcv/P4Tx3kCgqz2AA/0kBTr5XuNho08+mCWviiAGDKg/5+0f3eeeBfqSHgDIlKYNCDYB
 xYwypK6uQdB08anq6KfupQYoBgHBtYIqst6TiwdZILPvuExAAIxe8b9HEwlcytOwnFNvjhIm/3Odb
 g/e8BIpA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uF8qL-0085Qn-O6; Wed, 14 May 2025 12:01:49 +0200
Message-ID: <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com>
Date: Wed, 14 May 2025 11:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 10/13] dma-fence: Add safe access helpers and document
 the rules
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com, Rob Clark <robdclark@chromium.org>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
 <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
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


On 13/05/2025 15:16, Rob Clark wrote:
> On Fri, May 9, 2025 at 8:34 AM Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>>
>> Dma-fence objects currently suffer from a potential use after free problem
>> where fences exported to userspace and other drivers can outlive the
>> exporting driver, or the associated data structures.
>>
>> The discussion on how to address this concluded that adding reference
>> counting to all the involved objects is not desirable, since it would need
>> to be very wide reaching and could cause unloadable drivers if another
>> entity would be holding onto a signaled fence reference potentially
>> indefinitely.
>>
>> This patch enables the safe access by introducing and documenting a
>> contract between fence exporters and users. It documents a set of
>> contraints and adds helpers which a) drivers with potential to suffer from
>> the use after free must use and b) users of the dma-fence API must use as
>> well.
>>
>> Premise of the design has multiple sides:
>>
>> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
>> signalling a fence and freeing the driver private data associated with it.
>>
>> The grace period does not have to follow the signalling immediately but
>> HAS to happen before data is freed.
>>
>> 2. Users of the dma-fence API marked with such requirement MUST contain
>> the complete access to the data within a single code block guarded by the
>> new dma_fence_access_begin() and dma_fence_access_end() helpers.
>>
>> The combination of the two ensures that whoever sees the
>> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
>> valid fence->lock and valid data potentially accessed by the fence->ops
>> virtual functions, until the call to dma_fence_access_end().
>>
>> 3. Module unload (fence->ops) disappearing is for now explicitly not
>> handled. That would required a more complex protection, possibly needing
>> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout(),
>> where race between dma_fence_enable_sw_signaling, signalling, and
>> dereference of fence->ops->wait() would need a sleeping SRCU context.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++++
>>   include/linux/dma-fence.h   | 32 ++++++++++++-----
>>   2 files changed, 93 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index dc2456f68685..cfe1d7b79c22 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
>>          struct dma_fence *fence =
>>                  container_of(kref, struct dma_fence, refcount);
>>
>> +       dma_fence_access_begin();
>>          trace_dma_fence_destroy(fence);
>>
>>          if (WARN(!list_empty(&fence->cb_list) &&
>> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
>>                  fence->ops->release(fence);
>>          else
>>                  dma_fence_free(fence);
>> +
>> +       dma_fence_access_end();
>>   }
>>   EXPORT_SYMBOL(dma_fence_release);
>>
>> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>>    */
>>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>   {
>> +       dma_fence_access_begin();
>>          seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>>                     dma_fence_driver_name(fence),
>>                     dma_fence_timeline_name(fence),
>>                     fence->seqno,
>>                     dma_fence_is_signaled(fence) ? "" : "un");
>> +       dma_fence_access_end();
>>   }
>>   EXPORT_SYMBOL(dma_fence_describe);
>>
>> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>          __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
>>   }
>>   EXPORT_SYMBOL(dma_fence_init64);
>> +
>> +/**
>> + * dma_fence_driver_name - Access the driver name
>> + * @fence: the fence to query
>> + *
>> + * Returns a driver name backing the dma-fence implementation.
>> + *
>> + * IMPORTANT CONSIDERATION:
>> + * Dma-fence contract stipulates that access to driver provided data (data not
>> + * directly embedded into the object itself), such as the &dma_fence.lock and
>> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
>> + * after the fence has been signalled. Drivers are allowed to free that data,
>> + * and some do.
>> + *
>> + * To allow safe access drivers are mandated to guarantee a RCU grace period
>> + * between signalling the fence and freeing said data.
>> + *
>> + * As such access to the driver name is only valid inside a RCU locked section.
>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
>> + */
>> +const char *dma_fence_driver_name(struct dma_fence *fence)
>> +{
>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> +                        "rcu_read_lock() required for safe access to returned string");
>> +
>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> +               return fence->ops->get_driver_name(fence);
>> +       else
>> +               return "detached-driver";
>> +}
>> +EXPORT_SYMBOL(dma_fence_driver_name);
>> +
>> +/**
>> + * dma_fence_timeline_name - Access the timeline name
>> + * @fence: the fence to query
>> + *
>> + * Returns a timeline name provided by the dma-fence implementation.
>> + *
>> + * IMPORTANT CONSIDERATION:
>> + * Dma-fence contract stipulates that access to driver provided data (data not
>> + * directly embedded into the object itself), such as the &dma_fence.lock and
>> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
>> + * after the fence has been signalled. Drivers are allowed to free that data,
>> + * and some do.
>> + *
>> + * To allow safe access drivers are mandated to guarantee a RCU grace period
>> + * between signalling the fence and freeing said data.
>> + *
>> + * As such access to the driver name is only valid inside a RCU locked section.
>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
>> + */
>> +const char *dma_fence_timeline_name(struct dma_fence *fence)
>> +{
>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> +                        "rcu_read_lock() required for safe access to returned string");
>> +
>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> +               return fence->ops->get_driver_name(fence);
>> +       else
>> +               return "signaled-timeline";
> 
> This means that trace_dma_fence_signaled() will get the wrong
> timeline/driver name, which probably screws up perfetto and maybe
> other tools.

Do you think context and seqno are not enough for those tools and they 
actually rely on the names? It would sound weird if they decided to 
index anything on the names which are non-standardised between drivers, 
but I guess anything is possible.

> Maybe it would work well enough just to move the
> trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
> if some things will start getting confused if they see that trace
> multiple times.

Another alternative is to make this tracepoint access the names 
directly. It is under the lock so guaranteed not to get freed with 
drivers which will be made compliant with the documented rules.

Regards,

Tvrtko

> 
> Maybe a better solution would be to add a new bit for this purpose,
> which is set after the tracepoint in
> dma_fence_signal_timestamp_locked().
> 
> (trace_dma_fence_destroy() will I guess be messed up regardless.. it
> doesn't look like perfetto cares about this tracepoint, so maybe that
> is ok.  It doesn't seem so useful.)
> 
> BR,
> -R
> 
> 
>> +}
>> +EXPORT_SYMBOL(dma_fence_timeline_name);
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index c814a86087f8..c8a9915eb360 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -387,15 +387,31 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
>>                                 struct dma_fence_cb *cb);
>>   void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>>
>> -static inline const char *dma_fence_driver_name(struct dma_fence *fence)
>> -{
>> -       return fence->ops->get_driver_name(fence);
>> -}
>> +/**
>> + * DOC: Safe external access to driver provided object members
>> + *
>> + * All data not stored directly in the dma-fence object, such as the
>> + * &dma_fence.lock and memory potentially accessed by functions in the
>> + * &dma_fence.ops table, MUST NOT be accessed after the fence has been signalled
>> + * because after that point drivers are allowed to free it.
>> + *
>> + * All code accessing that data via the dma-fence API (or directly, which is
>> + * discouraged), MUST make sure to contain the complete access within a
>> + * &dma_fence_access_begin and &dma_fence_access_end pair.
>> + *
>> + * Some dma-fence API handles this automatically, while other, as for example
>> + * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
>> + * responsibility to the caller.
>> + *
>> + * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
>> + * between signalling the fence and freeing the said data.
>> + *
>> + */
>> +#define dma_fence_access_begin rcu_read_lock
>> +#define dma_fence_access_end   rcu_read_unlock
>>
>> -static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
>> -{
>> -       return fence->ops->get_timeline_name(fence);
>> -}
>> +const char *dma_fence_driver_name(struct dma_fence *fence);
>> +const char *dma_fence_timeline_name(struct dma_fence *fence);
>>
>>   /**
>>    * dma_fence_is_signaled_locked - Return an indication if the fence
>> --
>> 2.48.0
>>

