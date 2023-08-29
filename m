Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D7178BCD2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 04:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697DF10E38C;
	Tue, 29 Aug 2023 02:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643B410E38B;
 Tue, 29 Aug 2023 02:30:23 +0000 (UTC)
Received: from [192.168.2.140] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 97B5B66071DC;
 Tue, 29 Aug 2023 03:30:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693276222;
 bh=TvkUBHJMrG6CO8fOzJNW2W4LBqEAv0nNIK9wm0HmjW0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EqEqk5kZVC37Y/oUIDGJFEkYg3GZSQtdHiLHqBiKSmQkJI7+sM3o5EcT2WdW7QNgj
 MBxHJA6YVHI4amFS/7uCiwOAX0uXw8R58ur283EP/zr7Pwx12Y3gb1ezdPV+tdBshV
 ujvCGYKmEZrCAL/UHXDJr7I6U+aidNMOU70qX1u+FxuabZet+tKgLlkZmlszFstJkX
 vFrBpDO3CoJktEYXxvW/XE4CVPxtb8IXuzRAsgMffSyuO6vlJ4sAD6JjygZsjWFLhj
 EF3AFLPOGxZo8gnC3SLKUkE5KnBEMXuSXrzQH6V99VnS6IlrNUqmr8f+E0X++x/cB/
 oNjv+UlDg9eDw==
Message-ID: <47b5219e-d425-1dfb-e676-9175d3ac4909@collabora.com>
Date: Tue, 29 Aug 2023 05:30:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 12/23] drm/shmem-helper: Add and use pages_pin_count
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-13-dmitry.osipenko@collabora.com>
 <20230828134654.7a2c6414@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230828134654.7a2c6414@collabora.com>
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

On 8/28/23 14:46, Boris Brezillon wrote:
> On Sun, 27 Aug 2023 20:54:38 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> Add separate pages_pin_count for tracking of whether drm-shmem pages are
>> moveable or not. With the addition of memory shrinker support to drm-shmem,
>> the pages_use_count will no longer determine whether pages are hard-pinned
>> in memory, but whether pages exit and are soft-pinned (and could be swapped
>> out). The pages_pin_count > 1 will hard-pin pages in memory.
>>
>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 22 +++++++++++++++++-----
>>  include/drm/drm_gem_shmem_helper.h     | 10 ++++++++++
>>  2 files changed, 27 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index d545d3d227d7..1a7e5c332fd8 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -234,14 +234,22 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>>  
>>  	dma_resv_assert_held(shmem->base.resv);
>>  
>> +	if (kref_get_unless_zero(&shmem->pages_pin_count))
>> +		return 0;
>> +
>>  	ret = drm_gem_shmem_get_pages_locked(shmem);
>> +	if (!ret)
>> +		kref_init(&shmem->pages_pin_count);
>>  
>>  	return ret;
>>  }
>>  
>> -static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
>> +static void drm_gem_shmem_kref_unpin_pages(struct kref *kref)
>>  {
>> -	dma_resv_assert_held(shmem->base.resv);
>> +	struct drm_gem_shmem_object *shmem;
>> +
>> +	shmem = container_of(kref, struct drm_gem_shmem_object,
>> +			     pages_pin_count);
>>  
>>  	drm_gem_shmem_put_pages_locked(shmem);
>>  }
>> @@ -263,6 +271,9 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
>>  
>>  	drm_WARN_ON(obj->dev, obj->import_attach);
>>  
>> +	if (kref_get_unless_zero(&shmem->pages_pin_count))
>> +		return 0;
>> +
>>  	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
>>  	if (ret)
>>  		return ret;
>> @@ -286,9 +297,10 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
>>  
>>  	drm_WARN_ON(obj->dev, obj->import_attach);
>>  
>> -	dma_resv_lock(shmem->base.resv, NULL);
>> -	drm_gem_shmem_unpin_locked(shmem);
>> -	dma_resv_unlock(shmem->base.resv);
>> +	if (kref_put_dma_resv(&shmem->pages_pin_count,
>> +			      drm_gem_shmem_kref_unpin_pages,
>> +			      obj->resv, NULL))
>> +		dma_resv_unlock(obj->resv);
>>  }
>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
>>  
>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>> index ec2d8b24e3cf..afb7cd671e2a 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -39,6 +39,16 @@ struct drm_gem_shmem_object {
>>  	 */
>>  	unsigned int pages_use_count;
>>  
>> +	/**
>> +	 * @pages_pin_count:
>> +	 *
>> +	 * Reference count on the pinned pages table.
>> +	 * The pages allowed to be evicted and purged by memory
>> +	 * shrinker only when the count is zero, otherwise pages
>> +	 * are hard-pinned in memory.
>> +	 */
>> +	struct kref pages_pin_count;
> 
> I know it's tempting to use kref for the pages use/pin count, but I'm
> wondering if we wouldn't be better using a refcount_t, which provides
> overflow/underflow protection while still letting us control how we
> want to handle the locking for 0 <-> 1 transitions. By doing that, we
> avoid introducing core locking changes that might be more
> controversial/longer to get accepted. Besides, I suspect the resulting
> code (the one using a refcount_t) won't be more verbose/complicated (no
> release functions needed if you don't use kref_put(), which makes
> things closer to what we have right now).

Alright, let's try to use refcount_t since Christian also doesn't like kref

-- 
Best regards,
Dmitry

