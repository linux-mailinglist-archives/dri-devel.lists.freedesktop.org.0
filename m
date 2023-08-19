Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4AD781695
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 04:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE81510E56B;
	Sat, 19 Aug 2023 02:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC25D10E56B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 02:13:12 +0000 (UTC)
Received: from [192.168.2.14] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5EEFA660724E;
 Sat, 19 Aug 2023 03:13:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692411191;
 bh=q62HCHW63yJR86HTh+OQrjoGs/tFr7YE097jqB4WM54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ArLU2p26PsJ1Ufj9XksPw1sweAQB2fkh3UAluzjKcJVWBHitdBq/UGezAaowqB8iQ
 E+TSXeiRkl2acCHAra08/hanS8FTl7D5YHMO5KoLDyndYmpzgH5VC5AINSf2UPDRGR
 EXQ39GbiNLoJ+gZQTGsxCShxVFdNRQ0uIw9LbUkGGoyJjttE3S9RkMrpdTvZIbJ6m5
 8OQfbX9FqMQQeEe2squNIJ24dtkXCVK6WqUmUMG4HpOb7Jc/8yvH14WQCQxgaVE7B9
 /IHQiDERHlI3LS8m5AIY/M4X+y1rWGEabitTAt/ac30/l1qEGQLy1Ksb/Abh2iPiVt
 mB4UmaGT0N+9w==
Message-ID: <7327e03f-2ce9-f35b-4281-d2cfb57d2bf3@collabora.com>
Date: Sat, 19 Aug 2023 05:13:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/15] drm/shmem-helper: Make pages_use_count an
 atomic_t
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-2-boris.brezillon@collabora.com>
 <b6bf9a39-0b61-363c-324b-eb6789a24b74@arm.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <b6bf9a39-0b61-363c-324b-eb6789a24b74@arm.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/11/23 16:08, Steven Price wrote:
> On 09/08/2023 17:53, Boris Brezillon wrote:
>> This way we can grab a pages ref without acquiring the resv lock when
>> pages_use_count > 0. Need to implement asynchronous map using the
> 
> NIT: s/Need/This is needed/
> 
>> drm_gpuva_mgr when the map/unmap operation triggers a mapping split,
>> requiring the new left/right regions to grab an additional page ref
>> to guarantee that the pages stay pinned when the middle section is
>> unmapped.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 28 +++++++++++++------------
>>  drivers/gpu/drm/lima/lima_gem.c         |  2 +-
>>  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
>>  include/drm/drm_gem_shmem_helper.h      |  2 +-
>>  4 files changed, 18 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index a783d2245599..ca6938ea1b82 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -155,7 +155,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>  		if (shmem->pages)
>>  			drm_gem_shmem_put_pages(shmem);
>>  
>> -		drm_WARN_ON(obj->dev, shmem->pages_use_count);
>> +		drm_WARN_ON(obj->dev, atomic_read(&shmem->pages_use_count));
>>  
>>  		dma_resv_unlock(shmem->base.resv);
>>  	}
>> @@ -172,14 +172,14 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>>  
>>  	dma_resv_assert_held(shmem->base.resv);
>>  
>> -	if (shmem->pages_use_count++ > 0)
>> +	if (atomic_inc_return(&shmem->pages_use_count) > 1)
>>  		return 0;
>>  
>>  	pages = drm_gem_get_pages(obj);
>>  	if (IS_ERR(pages)) {
>>  		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
>>  			    PTR_ERR(pages));
>> -		shmem->pages_use_count = 0;
>> +		atomic_set(&shmem->pages_use_count, 0);
>>  		return PTR_ERR(pages);
>>  	}
>>  
>> @@ -210,10 +210,10 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>>  
>>  	dma_resv_assert_held(shmem->base.resv);
>>  
>> -	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
>> +	if (drm_WARN_ON_ONCE(obj->dev, !atomic_read(&shmem->pages_use_count)))
>>  		return;
>>  
>> -	if (--shmem->pages_use_count > 0)
>> +	if (atomic_dec_return(&shmem->pages_use_count) > 0)
>>  		return;
>>  
>>  #ifdef CONFIG_X86
>> @@ -263,6 +263,10 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
>>  
>>  	drm_WARN_ON(obj->dev, obj->import_attach);
>>  
>> +	/* If we are the first owner, we need to grab the lock. */
>> +	if (atomic_inc_not_zero(&shmem->pages_use_count))
>> +		return 0;
>> +
> 
> Unless I'm misunderstanding I think this introduces a race where two
> threads call drm_gem_shmem_pin() at the same time:
> 
> Thread1				| Thread 2
> --------------------------------+------------------------------
> drm_gem_shmem_pin()		|
>  - pages_use_count == 0 so not  |
>    incremented                  |
>  - lock taken			|
> drm_gem_shmem_pin_locked()	|
> drm_gem_shmem_get_pages()	|
>  - pages_use_count incremented	|
> <thread descheduled>            | drm_gem_shmem_pin()
>                                 |  - pages_use_count == 1 so is it
> 				|    incremented and returns early
> 				|    without taking the lock
> 				| Code tries to use shmem->pages
> <thread rescheduled>		| and blows up
> drm_gem_get_pages()		|
> shmem->pages populated		|
> lock released			|
> 
> I think you need to modify drm_gem_shmem_get_pages() to only increment
> pages_use_count when shmem->pages has been populated. That also gets rid
> of the atomic_set() in that function which scares me.

This is correct, both pin() and get_pages() should use
atomic_inc_not_zero().

Note that we shouldn't use atomic functions open-coded, there is kref
helper for that which uses refcount_t underneath and has additional
checks/warnings for count underflow/overflow. I'm going to post patches
converting drm-shmem to kref around next week, Boris is aware about it
and we should then sync shrinker/panthor patchsets to the common
drm-shmem base.

-- 
Best regards,
Dmitry

