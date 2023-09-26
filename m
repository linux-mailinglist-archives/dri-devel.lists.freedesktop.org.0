Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348907AE2FE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 02:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8162110E339;
	Tue, 26 Sep 2023 00:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62F10E339
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 00:37:27 +0000 (UTC)
Received: from [192.168.2.47] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ADFE06607243;
 Tue, 26 Sep 2023 01:37:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695688645;
 bh=Awnj1HSyG7f4LqqDwPj+Y+XJIJXRPsKOZA+pJHfGHi4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VPEP6kAqHgihHX6Y5wkrwMDH0KClVvOCpYGfCA1LoxlHg97uVlJh/hAiRDkxxB2ql
 wRTOPQFe0TxbJyDG+qLQ934ehIw2pJOWKDqB2lA4AbBbCt+MLgy5lL0gp/stGnNrVe
 5vvyP0SeJDE9ZRYaPGgCANmzvsLdl/3TYwPBFoGdNCnTxqO3jpqcQPJOZMo+Hr1i/Z
 s6RncAYU+wElW629MX1xdnA1+0gBb5jN2oZwm6tz9EKvVCSFzGH/oRjoangxPd05ML
 SuQL+Ibij6hxwqvniV4zuBwS1bm0fo8i6hHzzc7NfvM/eghDseAAleTep+RHNMIOx3
 oE2SFqjnNSgNQ==
Message-ID: <64e8708a-bb73-96ae-90af-f7b51317613b@collabora.com>
Date: Tue, 26 Sep 2023 03:37:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v17 13/18] drm/shmem-helper: Add memory shrinker
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-14-dmitry.osipenko@collabora.com>
 <20230915104633.0d5c3932@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230915104633.0d5c3932@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/15/23 11:46, Boris Brezillon wrote:
>> -static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>> +static int
>> +drm_gem_shmem_acquire_pages(struct drm_gem_shmem_object *shmem, bool init)
>>  {
>>  	struct drm_gem_object *obj = &shmem->base;
>>  	struct page **pages;
>>  
>>  	dma_resv_assert_held(shmem->base.resv);
>>  
>> -	if (refcount_inc_not_zero(&shmem->pages_use_count))
>> +	if (shmem->madv < 0) {
>> +		drm_WARN_ON(obj->dev, shmem->pages);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (shmem->pages) {
>> +		drm_WARN_ON(obj->dev, !shmem->evicted);
>>  		return 0;
>> +	}
>> +
>> +	if (drm_WARN_ON(obj->dev, !(init ^ refcount_read(&shmem->pages_use_count))))
>> +		return -EINVAL;
> OOC, why do we care? Is there any difference between initial and re-pin
> that make the page allocation impossible? Feels like, if there's a
> check to do, it should be done in the caller instead, and you can drop
> the init param here.

This is a sanity check that addresses additional refcnt tracking
complexity imposed by shrinker.

This function is used by both init and re-pin that is invoked from
several places in the code. It's not trivial to move that check to the
callers.

-- 
Best regards,
Dmitry

