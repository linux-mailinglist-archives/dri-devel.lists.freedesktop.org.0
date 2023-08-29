Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219E78BCCA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 04:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053D310E2C9;
	Tue, 29 Aug 2023 02:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F69310E2A3;
 Tue, 29 Aug 2023 02:28:43 +0000 (UTC)
Received: from [192.168.2.140] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 37E3866071DC;
 Tue, 29 Aug 2023 03:28:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693276121;
 bh=DM5KhwPj8avJg4cJ+aVYATEnavak6IaIxX9ErWk0R6E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C25khkrDgJO3tLeM7ncP//gyJYaGGN2XWeD/tVXEDgzs3w7DHlFrfAcELXofi/BD4
 7FPc60rjkxlcPbmkkrL9xlpf4EZJ2EMjQc3pEt64TR+MncvddXPskqnCbOOrOg3eTb
 hdTDKilIZ+97+oa2hC4/KaJilt7TFoQ8aCrDTjQ01i/vWzGImgned04PVitiNckqoT
 yTEx42ceEZWUSbTfEVngu5HZfmvQYM/9dTijggUNikI0e+MpJXlfJGs5Vu+km2SIcB
 cAGnston0NJrF+KvT6ZjYWCiuq2m1Ntmyp4X2iCU/Z89WAqw9BrsRj7IkI/NrKi0pn
 qJcs9konCYJfA==
Message-ID: <4ec7af7e-d40e-dc83-63f8-44fa473f7035@collabora.com>
Date: Tue, 29 Aug 2023 05:28:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 10/23] locking/refcount, kref: Add kref_put_ww_mutex()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-11-dmitry.osipenko@collabora.com>
 <20230828112604.297db23a@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230828112604.297db23a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/28/23 12:26, Boris Brezillon wrote:
> On Sun, 27 Aug 2023 20:54:36 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> Introduce kref_put_ww_mutex() helper that will handle the wait-wound
>> mutex auto-locking on kref_put(). This helper is wanted by DRM drivers
>> that extensively use dma-reservation locking which in turns uses ww-mutex.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  include/linux/kref.h     | 12 ++++++++++++
>>  include/linux/refcount.h |  5 +++++
>>  lib/refcount.c           | 34 ++++++++++++++++++++++++++++++++++
>>  3 files changed, 51 insertions(+)
>>
>> diff --git a/include/linux/kref.h b/include/linux/kref.h
>> index d32e21a2538c..b2d8dc6e9ae0 100644
>> --- a/include/linux/kref.h
>> +++ b/include/linux/kref.h
>> @@ -90,6 +90,18 @@ static inline int kref_put_lock(struct kref *kref,
>>  	return 0;
>>  }
>>  
>> +static inline int kref_put_ww_mutex(struct kref *kref,
>> +				    void (*release)(struct kref *kref),
>> +				    struct ww_mutex *lock,
>> +				    struct ww_acquire_ctx *ctx)
>> +{
>> +	if (refcount_dec_and_ww_mutex_lock(&kref->refcount, lock, ctx)) {
>> +		release(kref);
>> +		return 1;
>> +	}
>> +	return 0;
>> +}
>> +
>>  /**
>>   * kref_get_unless_zero - Increment refcount for object unless it is zero.
>>   * @kref: object.
>> diff --git a/include/linux/refcount.h b/include/linux/refcount.h
>> index a62fcca97486..be9ad272bc77 100644
>> --- a/include/linux/refcount.h
>> +++ b/include/linux/refcount.h
>> @@ -99,6 +99,8 @@
>>  #include <linux/spinlock_types.h>
>>  
>>  struct mutex;
>> +struct ww_mutex;
>> +struct ww_acquire_ctx;
>>  
>>  /**
>>   * typedef refcount_t - variant of atomic_t specialized for reference counts
>> @@ -366,4 +368,7 @@ extern __must_check bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock)
>>  extern __must_check bool refcount_dec_and_lock_irqsave(refcount_t *r,
>>  						       spinlock_t *lock,
>>  						       unsigned long *flags) __cond_acquires(lock);
>> +extern __must_check bool refcount_dec_and_ww_mutex_lock(refcount_t *r,
>> +							struct ww_mutex *lock,
>> +							struct ww_acquire_ctx *ctx) __cond_acquires(&lock->base);
>>  #endif /* _LINUX_REFCOUNT_H */
>> diff --git a/lib/refcount.c b/lib/refcount.c
>> index a207a8f22b3c..3f6fd0ceed02 100644
>> --- a/lib/refcount.c
>> +++ b/lib/refcount.c
>> @@ -6,6 +6,7 @@
>>  #include <linux/mutex.h>
>>  #include <linux/refcount.h>
>>  #include <linux/spinlock.h>
>> +#include <linux/ww_mutex.h>
>>  #include <linux/bug.h>
>>  
>>  #define REFCOUNT_WARN(str)	WARN_ONCE(1, "refcount_t: " str ".\n")
>> @@ -184,3 +185,36 @@ bool refcount_dec_and_lock_irqsave(refcount_t *r, spinlock_t *lock,
>>  	return true;
>>  }
>>  EXPORT_SYMBOL(refcount_dec_and_lock_irqsave);
>> +
>> +/**
>> + * refcount_dec_and_ww_mutex_lock - return holding ww-mutex if able to
>> + *                                  decrement refcount to 0
>> + * @r: the refcount
>> + * @lock: the ww-mutex to be locked
>> + * @ctx: wait-wound context
>> + *
>> + * Similar to atomic_dec_and_lock(), it will WARN on underflow and fail to
>> + * decrement when saturated at REFCOUNT_SATURATED.
>> + *
>> + * Provides release memory ordering, such that prior loads and stores are done
>> + * before, and provides a control dependency such that free() must come after.
>> + * See the comment on top.
>> + *
>> + * Return: true and hold ww-mutex lock if able to decrement refcount to 0,
>> + *         false otherwise
>> + */
>> +bool refcount_dec_and_ww_mutex_lock(refcount_t *r, struct ww_mutex *lock,
>> +				    struct ww_acquire_ctx *ctx)
>> +{
>> +	if (refcount_dec_not_one(r))
>> +		return false;
>> +
>> +	ww_mutex_lock(lock, ctx);
> 
> Unless I'm wrong, ww_mutex_lock() can return -EDEADLK when ctx !=
> NULL, in which case, the lock is not held when it returns. Question is,
> do we really have a use case for ctx != NULL in that kref_put_ww_mutex()
> path. If we need to acquire other ww_locks, this lock, and the other
> locks should have been acquired beforehand, and we can simply call
> kref_put() when we want to release the ref on the resource.

Right, I completely forgot about the deadlocking

-- 
Best regards,
Dmitry

