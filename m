Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9278BCDB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 04:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510A210E390;
	Tue, 29 Aug 2023 02:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E7910E38B;
 Tue, 29 Aug 2023 02:34:28 +0000 (UTC)
Received: from [192.168.2.140] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CBA5D66071DC;
 Tue, 29 Aug 2023 03:34:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693276467;
 bh=zCen/op7wjIViqDfv+0NVKrUFjfQTD9AYmbvMVtk7Kw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W1tbxb/5VsSOn3rRGQU03/q8ShP/ocfyo846hcjEpv+yPGEcRkyz4bAw9Rq1AsIC2
 i2AZ4LVCCrkKv0jndNrxNLJB2i8Y4P+afaIybxKqYR1YQM0B+oPZAtR3rdvRnWot+4
 zu1AywW6h7UeEBhKnHVX6D+l6DB77pJs/BPy/yd61CeOlns7YZWm6H8lxj6EfAm9Hj
 fSVJpZXVDAFf9pcc76h5n/fFLIJhR+f7aNsor+uEA0HjNb8CbxAk25S0G1xQEVvDD6
 E/ymlXw5rDXqpAzHh1kWcq0CAuFB/KxxkBHsQk23XN8DYxhAtDpgC87GuffSGljg+h
 Wp3YHLWy0rpfw==
Message-ID: <01930e66-cba2-5d81-7f46-d46907bdd300@collabora.com>
Date: Tue, 29 Aug 2023 05:34:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 17/23] drm/shmem-helper: Add and use
 drm_gem_shmem_resv_assert_held() helper
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-18-dmitry.osipenko@collabora.com>
 <20230828121239.78a180e6@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230828121239.78a180e6@collabora.com>
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

On 8/28/23 13:12, Boris Brezillon wrote:
> On Sun, 27 Aug 2023 20:54:43 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> In a preparation of adding drm-shmem memory shrinker, move all reservation
>> locking lockdep checks to use new drm_gem_shmem_resv_assert_held() that
>> will resolve spurious lockdep warning about wrong locking order vs
>> fs_reclam code paths during freeing of shmem GEM, where lockdep isn't
>> aware that it's impossible to have locking contention with the fs_reclam
>> at this special time.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 37 +++++++++++++++++---------
>>  1 file changed, 25 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index d96fee3d6166..ca5da976aafa 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -128,6 +128,23 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
>>  }
>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>>  
>> +static void drm_gem_shmem_resv_assert_held(struct drm_gem_shmem_object *shmem)
>> +{
>> +	/*
>> +	 * Destroying the object is a special case.. drm_gem_shmem_free()
>> +	 * calls many things that WARN_ON if the obj lock is not held.  But
>> +	 * acquiring the obj lock in drm_gem_shmem_free() can cause a locking
>> +	 * order inversion between reservation_ww_class_mutex and fs_reclaim.
>> +	 *
>> +	 * This deadlock is not actually possible, because no one should
>> +	 * be already holding the lock when drm_gem_shmem_free() is called.
>> +	 * Unfortunately lockdep is not aware of this detail.  So when the
>> +	 * refcount drops to zero, we pretend it is already locked.
>> +	 */
>> +	if (kref_read(&shmem->base.refcount))
>> +		drm_gem_shmem_resv_assert_held(shmem);
>> +}
>> +
>>  /**
>>   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
>>   * @shmem: shmem GEM object to free
>> @@ -142,8 +159,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>  	if (obj->import_attach) {
>>  		drm_prime_gem_destroy(obj, shmem->sgt);
>>  	} else if (!shmem->imported_sgt) {
>> -		dma_resv_lock(shmem->base.resv, NULL);
>> -
>>  		drm_WARN_ON(obj->dev, kref_read(&shmem->vmap_use_count));
>>  
>>  		if (shmem->sgt) {
>> @@ -156,8 +171,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>  			drm_gem_shmem_put_pages_locked(shmem);
> 
> AFAICT, drm_gem_shmem_put_pages_locked() is the only function that's
> called in the free path and would complain about resv-lock not being
> held. I think I'd feel more comfortable if we were adding a
> drm_gem_shmem_free_pages() function that did everything
> drm_gem_shmem_put_pages_locked() does except for the lock_held() check
> and the refcount dec, and have it called here (and in
> drm_gem_shmem_put_pages_locked()). This way we can keep using
> dma_resv_assert_held() instead of having our own variant.

It's not only drm_gem_shmem_free_pages(), but any drm-shmem function
that drivers may use in the GEM's freeing callback.

For example, panfrost_gem_free_object() may unpin shmem BO and then do
drm_gem_shmem_free().

-- 
Best regards,
Dmitry

