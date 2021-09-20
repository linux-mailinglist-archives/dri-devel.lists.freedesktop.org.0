Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EB411024
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 09:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DB36E400;
	Mon, 20 Sep 2021 07:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BA76E400;
 Mon, 20 Sep 2021 07:35:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x6so27070098wrv.13;
 Mon, 20 Sep 2021 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4P1io5nUKE9cYx4NjlZE02ncCC38OG0LveUarkFjV+4=;
 b=g1ECzyspCR1I5FXZUYHtyQjmn0g8obadz/rLTIBlDOnrWeK1lYdb3dq8fXweE8pgIm
 zeVqQxIrvocx0hYvxeUpUllzbjdMRJquTTNHCMqST+4ZUYhooFzm/It2BrdYC3HMLDnO
 CKvNyRc7uAY1bxU2Vac1ZSZySnmvoSB+UE4idjXKpjIEPn+fj0MfP4nPTwQWB/hJ+iKn
 2IAkDl8Wcz3jsqN1ck9SIn6J9NExLt/oGu9FfacfJqQwBghvkiGSAmbQ8+Sinn16cHj6
 JYMDp3ZC+4aP32H2XE2MPv2eqZGjXRM9J0pYcAF21RBHbCWTxF3rDxSFXMZZHnFTBbqG
 B0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4P1io5nUKE9cYx4NjlZE02ncCC38OG0LveUarkFjV+4=;
 b=koo3e2bhsasDT16Si2no5Pc0aS3FfMU5OrMG1t6RyXpOklLBUaMrhfM0tR6D+e+tJq
 VvWHD5F57sU1cYv5B+omXf5bBTZWKJYi4Me8Koj1cgobKJIoMYtm3F4Vnj0Vryt94oWZ
 K45p5teOGjO+Uqwl3iN+39TvZ2qLS7TzHClGX0wTugnWYNrA9FBc6kUx9vM4x5oJECEI
 ICkwDxeC2fOW3qBZZ+xUPxtZbgpQaT527b0lKNUIHgiRgzpD+nPLH3wSkEjRl5xiTm3N
 sz836qE48/XuWfOM7UXmumj7mJX25lsHrcLfjBc07hTkKjFcYB7D9AQeZooJGLbxpazw
 0Pwg==
X-Gm-Message-State: AOAM531lGzA3xo109t8ytUBg1ANQzIMBlgdzj0xDR2lTCPPHoZx5Tb7F
 Y997OqaQ4bq/WhLAEWxiPyTcVA0HFv4=
X-Google-Smtp-Source: ABdhPJypvNSGDrPpIVDHLrykJEmmH/dwdyUKHUY1DGVerjxgk4VaBJNzEgJNAkRV7PORtSTG0FxAig==
X-Received: by 2002:adf:ed92:: with SMTP id c18mr26101944wro.86.1632123322752; 
 Mon, 20 Sep 2021 00:35:22 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id q11sm14805870wrn.65.2021.09.20.00.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 00:35:22 -0700 (PDT)
Subject: Re: [PATCH 21/26] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-22-christian.koenig@amd.com>
 <YUSsdbTxvJwaRv9x@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2ded7e42-e1f3-72fb-5de6-810c000255be@gmail.com>
Date: Mon, 20 Sep 2021 09:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUSsdbTxvJwaRv9x@phenom.ffwll.local>
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

Am 17.09.21 um 16:55 schrieb Daniel Vetter:
> On Fri, Sep 17, 2021 at 02:35:08PM +0200, Christian König wrote:
>> Makes the handling a bit more complex, but avoids the use of
>> dma_resv_get_excl_unlocked().
>>
>> v2: add missing rcu_read_lock()/unlock()
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> index e570398abd78..d8f9c6432544 100644
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
>> @@ -150,9 +151,18 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>>   		return 0;
>>   
>>   	obj = drm_gem_fb_get_obj(state->fb, 0);
>> -	fence = dma_resv_get_excl_unlocked(obj->resv);
>> -	drm_atomic_set_fence_for_plane(state, fence);
>> +	rcu_read_lock();
>> +	dma_resv_iter_begin(&cursor, obj->resv, false);
>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +		rcu_read_unlock();
>> +		/* TODO: We only use the first write fence here */
>> +		drm_atomic_set_fence_for_plane(state, fence);
> Yeah I wonder whether we should/need to collate them all together. But I
> guesss whomever hits that first with their funny multi-plane yuv or
> whatever gets to do that. Or I'm not clear on what exactly your TODO here
> means?

Yeah, exactly that. Basically we have use cases where where we have more 
than one fence to wait for.

The TODO is here because adding that to the atomic helper is just not my 
construction site at the moment.

Regards,
Christian.

>
>> +		return 0;
>> +	}
>> +	dma_resv_iter_end(&cursor);
>> +	rcu_read_unlock();
> Imo we should do full dma_resv_lock here. atomic helpers are designed to
> allow this, and it simplifies things. Also it really doesn't matter for
> atomic, we should be able to do 60fps*a few planes easily :-)
> -Daniel
>
>>   
>> +	drm_atomic_set_fence_for_plane(state, NULL);
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>> -- 
>> 2.25.1
>>

