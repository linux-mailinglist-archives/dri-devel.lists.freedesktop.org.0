Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C44377CE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 15:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E8989ED6;
	Fri, 22 Oct 2021 13:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E446ED8E;
 Fri, 22 Oct 2021 13:17:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z14so3793900wrg.6;
 Fri, 22 Oct 2021 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=xzYyGlNbpTpvd6sNJdRWzkh7BYc81KJzN7aG/37+xnw=;
 b=Wb0IMU0euio0jP04+Ag5kuxoh1MQufsfd2QRp3sI+Az4W30cmQtw3AWAzQ9kufl2u6
 T86AdjyQRsKxL0Rcub27Y0pvseoX06QIabpUUcugftBPPSM1+G3HKXi3jxAVB3sxQlFt
 W1vsR38o56VZW/+5lP81/Wf3mpI513KMR752iV2YyVphELCzOlCQE9+Aj3M51BR8tLed
 xv4dgzu/VuEVzqrD2vZqfgrnRnCEfuCraK+xC+IQNEFburrJFRj1zZI7w16LzDJXKMxl
 WnLkXpRDcn7OfkNHVwIMTI/9CfkObryOC6dmedqohvuRhKWAuH+ZnLdOVk+A0Gz8jMnc
 FMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xzYyGlNbpTpvd6sNJdRWzkh7BYc81KJzN7aG/37+xnw=;
 b=fouoyzA0trXipuneY+/rIWOaV5sH9xSt/x7g+209/KMftAcWlRw9VCs1DSvwtv/I8m
 Jg4wuR6LgZuo4z87UoR062ON9+5dVYc3I7bWHiMdllVMiJHzrxSyYhxrO3EHRyFzb/Zj
 5GzQ51IGnKiFNHAD++GEJUujDzNlB1uG/6OLhxvb0ObvE5UBFKmQBQRRHjBLZinLKZGl
 TfL/J0Xy1gcum/QOjrW/GE2K5rBHvcYvyznQPRXqE7iQxYhWW4UuQmG6sY9WSxRwuFhC
 7f5Tf/AMlxIWGMEaM207rDZETtWvVVvtG7vFseee25+CztKeu1ymk8t/Ivmhwi0J2/kg
 YNGg==
X-Gm-Message-State: AOAM530q5KoguoYelYWsCyhPL5TntIGEOBkppEe2oyGG+LpqmTpGkQnF
 m7khEuzWZVQEZGWuXaKEz/BhvDsCdDs=
X-Google-Smtp-Source: ABdhPJz1bcP9pVdKxvZWKI3UICXsg+Jou2mv8pwgCLGrQkQRbz9ygCJr3KFv1jOtT9CfdADeNSXIRA==
X-Received: by 2002:adf:ab1c:: with SMTP id q28mr15823427wrc.39.1634908639344; 
 Fri, 22 Oct 2021 06:17:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a39f:d981:e7cb:e6dc?
 ([2a02:908:1252:fb60:a39f:d981:e7cb:e6dc])
 by smtp.gmail.com with ESMTPSA id e2sm3047986wrt.8.2021.10.22.06.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 06:17:18 -0700 (PDT)
Subject: Re: [PATCH 26/28] drm/nouveau: use the new interator in
 nv50_wndw_prepare_fb
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-27-christian.koenig@amd.com>
 <YWbtV2ZVHg7n1xpm@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cca39a70-5820-18e2-8bda-a4a0d7ad2c31@gmail.com>
Date: Fri, 22 Oct 2021 15:17:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbtV2ZVHg7n1xpm@phenom.ffwll.local>
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

Am 13.10.21 um 16:29 schrieb Daniel Vetter:
> On Tue, Oct 05, 2021 at 01:37:40PM +0200, Christian König wrote:
>> Makes the handling a bit more complex, but avoids the use of
>> dma_resv_get_excl_unlocked().
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> index 8d048bacd6f0..30712a681e2a 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> @@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>   	struct nouveau_bo *nvbo;
>>   	struct nv50_head_atom *asyh;
>>   	struct nv50_wndw_ctxdma *ctxdma;
>> +	struct dma_resv_iter cursor;
>> +	struct dma_fence *fence;
>>   	int ret;
>>   
>>   	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
>> @@ -561,7 +563,13 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>   			asyw->image.handle[0] = ctxdma->object.handle;
>>   	}
>>   
>> -	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
>> +	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +		/* TODO: We only use the first writer here */
> Same thing as with the atomic core helper. This is actually broken,
> because for atomic we really do _not_ want to wait for any shared fences.
> Which this will do, if there's no exclusive fence attached.
>
> So upgrading my general concern on this and the atomic helper patch to a
> reject, since I think it's broken.

Since we simply had a misunderstanding with that could I get an rb for 
that now?

Thanks,
Christian.

> -Daniel
>
>> +		asyw->state.fence = dma_fence_get(fence);
>> +		break;
>> +	}
>> +	dma_resv_iter_end(&cursor);
>>   	asyw->image.offset[0] = nvbo->offset;
>>   
>>   	if (wndw->func->prepare) {
>> -- 
>> 2.25.1
>>

