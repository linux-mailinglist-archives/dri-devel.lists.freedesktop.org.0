Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B786433694
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 15:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D123898EA;
	Tue, 19 Oct 2021 13:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7B4898EA;
 Tue, 19 Oct 2021 13:02:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t2so47713757wrb.8;
 Tue, 19 Oct 2021 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zoeKeQkU3KvxnJa2mZcZh7Nvtdmvi6KvvNHJWqgrlL8=;
 b=FSCLJ7rXFMRdh8Hphd/PqIDV+GZiMLqJSKAwavuZJNmFA/mMD9Ak0NQPQbbpgDDnNc
 fXKDZZ1y9N1+JUIR4tKmMmLZOZ3nnVtTcDn8tRKqQbKVIX6v7xwHeff2kEU7BiR1NA+g
 PQV/Nwg7i1nm+yqzXLYYhPVunq2dbEY0AuI+jw943gw1sg35lXKh2L/36UxV8SoLJa0l
 K7mBye1O98rGDeQKm4zm16bdddNgVXAXlKvqLPcxu1k1UlWpsV9KV5AmlNlydNp8OYDV
 FDoW/JXk8+BGNCmOWKNE8QMVSKSjFNSqd8lns9m6GnYyI4059eFsZI7tKciAzZzjQqyg
 2RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zoeKeQkU3KvxnJa2mZcZh7Nvtdmvi6KvvNHJWqgrlL8=;
 b=VaxbO+GyTD3+3ZSUdDZcTF+s/918QH4pX3XmaI1o5MgVYSVueB7KJChs5riW1a2acU
 xgugmkPDOCexWyEpXiMfa/xCbnyg8JuF6+N6ApYMCMiCLqgc3MBNffodIW06rlNIVqph
 DNc79/FsXtYLPKcpcM0a0KT/0aJBNuwNiMBcVxvuLbhwkvo6bFEjzXAjAfoq9K6DwhSw
 junTHBaXPnVQ7I7yhI1EyeHJlDdtuGS/xnqQtaw+NasipSmHUAhb1cP66QXVxBRqmcP2
 E7BMYNzU5Loy2B/e3edJVYe4Z+APWeyXkyoJ/65Z4aP+Hj3D2g0B9EQG6iQaPGmIKzyn
 0haQ==
X-Gm-Message-State: AOAM533xSbejIq4y+i4DBvCwrPMhLJ3A3v1dpGNs7f1PaBnzllcK4/or
 fKCwDq+Vhr7sk9K8u2DTjeM=
X-Google-Smtp-Source: ABdhPJwYkuZW66DOQ5LnvWYT8S9+EZRh5ym4fe7u61zzmk2TGTHLVlTipFq0g7dFHF62PBJ/0ELvHg==
X-Received: by 2002:adf:a38d:: with SMTP id l13mr43616254wrb.103.1634648547710; 
 Tue, 19 Oct 2021 06:02:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f344:748e:38f7:c50?
 ([2a02:908:1252:fb60:f344:748e:38f7:c50])
 by smtp.gmail.com with ESMTPSA id t8sm15103147wrx.46.2021.10.19.06.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 06:02:27 -0700 (PDT)
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-25-christian.koenig@amd.com>
 <YWbr0/ey1rCbb0Yi@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <405b9df8-58fd-b8f2-cec2-acde69aa5633@gmail.com>
Date: Tue, 19 Oct 2021 15:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbr0/ey1rCbb0Yi@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 13.10.21 um 16:23 schrieb Daniel Vetter:
> On Tue, Oct 05, 2021 at 01:37:38PM +0200, Christian König wrote:
>> Makes the handling a bit more complex, but avoids the use of
>> dma_resv_get_excl_unlocked().
>>
>> v2: improve coding and documentation
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> index e570398abd78..8534f78d4d6d 100644
>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> @@ -143,6 +143,7 @@
>>    */
>>   int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>   {
>> +	struct dma_resv_iter cursor;
>>   	struct drm_gem_object *obj;
>>   	struct dma_fence *fence;
>>   
>> @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>>   		return 0;
>>   
>>   	obj = drm_gem_fb_get_obj(state->fb, 0);
>> -	fence = dma_resv_get_excl_unlocked(obj->resv);
>> -	drm_atomic_set_fence_for_plane(state, fence);
>> +	dma_resv_iter_begin(&cursor, obj->resv, false);
>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +		/* TODO: We only use the first write fence here and need to fix
>> +		 * the drm_atomic_set_fence_for_plane() API to accept more than
>> +		 * one. */
> I'm confused, right now there is only one write fence. So no need to
> iterate, and also no need to add a TODO. If/when we add more write fences
> then I think this needs to be revisited, and ofc then we do need to update
> the set_fence helpers to carry an entire array of fences.

Well could be that I misunderstood you, but in your last explanation it 
sounded like the drm_atomic_set_fence_for_plane() function needs fixing 
anyway because a plane could have multiple BOs.

So in my understanding what we need is a 
drm_atomic_add_dependency_for_plane() function which records that a 
certain fence needs to be signaled before a flip.

Support for more than one write fence then comes totally naturally.

Christian.

> -Daniel
>
>> +		dma_fence_get(fence);
>> +		break;
>> +	}
>> +	dma_resv_iter_end(&cursor);
>>   
>> +	drm_atomic_set_fence_for_plane(state, fence);
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>> -- 
>> 2.25.1
>>

