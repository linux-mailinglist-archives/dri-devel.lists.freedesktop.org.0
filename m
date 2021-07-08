Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABCD3BFAB1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1FC6E219;
	Thu,  8 Jul 2021 12:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9E86E219
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:52:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso6648365wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pOrjnaLx7sFBOlWekg8QRTtH36mIEVCRUaL9EWCS77Y=;
 b=Xo1b9Cnn+Yz8vTQHPdhIAe30n6CEV6HvuzGSDwOU6x7NAwRCYuGYAhiDDNRXjUYsr6
 o42+pHGkFHCR6UE2DZkYRub3nJ5JdjJUCrzLHk0HGQ3Wn4m/tXEv8pDyMaRoDXVytauM
 wTkefrWEDjDNGz8Bu1qwpfTHbUnR2Zt1dF/etkMg0j8e53+UKk7kG7yu2ztu8q1zVrAz
 rHQ/Y0CC6e1q+Gs1fw/05GEd9wMUr8kVocIOJpgVasOLB3E1WLPVqUpJz8uY6RZjDkFN
 iP0UrDn7TghyisbsBt8EjiGQAVuiZFekwYve2ge2uFIgxMDbwceig8K6dHHAF5r/eqM0
 ve3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pOrjnaLx7sFBOlWekg8QRTtH36mIEVCRUaL9EWCS77Y=;
 b=CgiK7Le5LExxlw4RwoCS2wbZFT43USimf0Y1s1A3UWxU8z5r0VFE9+VBw5f2ow9blV
 bhg0Ks/XkVx1l3BJ7PfGSuGcEo6kqaBuYODCrzOZ0zbb7IRaXcIUr7LjFbGyO5T2kVtD
 SQT2MN3DEA/rF+Zi1QRLi0W9ZNxTjYJzNiyXT2ZqDWNCmIMF1mJF9RIMsjePttSNRCcH
 qPEMu7SZYQ8089YayRsD9f4iVvYHI2M+JklO4fIs/O6E2h7KNxaCeEgSNOMAkuTh5LA8
 LEVjtbJrRO1QERfB3nha83jns0KCadkK9IDW1m2Btp9nchtGTZe+Ns2ofVx6WfjoIWHT
 BpXQ==
X-Gm-Message-State: AOAM531YRJkCHP7JqE6TYC6KHYOGnMK7TfEgjfbTEzwr5ZthQLwiC0Gc
 Z9FUaZQahYF0SOWJ6tSJymY=
X-Google-Smtp-Source: ABdhPJwmYNqXBkDxJj0VdIiA8fODtZTvRasPckqCJsODAIvo/folYezhexDa/CTcnebMvpM/EZ9PmQ==
X-Received: by 2002:a1c:26c2:: with SMTP id m185mr5171279wmm.146.1625748776669; 
 Thu, 08 Jul 2021 05:52:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e?
 ([2a02:908:1252:fb60:bc19:c1e3:6307:7e3e])
 by smtp.gmail.com with ESMTPSA id o17sm1076181wms.32.2021.07.08.05.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 05:52:56 -0700 (PDT)
Subject: Re: [PATCH 4/4] drm/msm: always wait for the exclusive fence
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210702111642.17259-1-christian.koenig@amd.com>
 <20210702111642.17259-5-christian.koenig@amd.com>
 <YN+a0NY8jB54zIes@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fabf87f1-d60e-c6d4-4e6f-e5ba695921b8@gmail.com>
Date: Thu, 8 Jul 2021 14:52:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN+a0NY8jB54zIes@phenom.ffwll.local>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.07.21 um 01:01 schrieb Daniel Vetter:
> On Fri, Jul 02, 2021 at 01:16:42PM +0200, Christian König wrote:
>> Drivers also need to to sync to the exclusive fence when
>> a shared one is present.
>>
>> Completely untested since the driver won't even compile on !ARM.
> It's really not that hard to set up a cross-compiler, reasonable distros
> have that now all packages. Does explain though why you tend to break the
> arm build with drm-misc patches.

Well having proper COMPILE_TEST handling in kconfig would be even better.

Otherwise everybody needs to cross-compile for ARM, ARM64 (with all the 
variants, e.g. BCM, S3C64XX, S5PV210, KEEMBAY, ZYNQMP etc etc), MIPS and 
so on.

We have tons of non-x86 drivers, but MSM is the only one which is 
painful to get to compile test.

Christian.

>
> Please fix this.
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
>>   1 file changed, 7 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
>> index a94a43de95ef..72a07e311de3 100644
>> --- a/drivers/gpu/drm/msm/msm_gem.c
>> +++ b/drivers/gpu/drm/msm/msm_gem.c
>> @@ -817,17 +817,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>>   	struct dma_fence *fence;
>>   	int i, ret;
>>   
>> -	fobj = dma_resv_shared_list(obj->resv);
>> -	if (!fobj || (fobj->shared_count == 0)) {
>> -		fence = dma_resv_excl_fence(obj->resv);
>> -		/* don't need to wait on our own fences, since ring is fifo */
>> -		if (fence && (fence->context != fctx->context)) {
>> -			ret = dma_fence_wait(fence, true);
>> -			if (ret)
>> -				return ret;
>> -		}
>> +	fence = dma_resv_excl_fence(obj->resv);
>> +	/* don't need to wait on our own fences, since ring is fifo */
>> +	if (fence && (fence->context != fctx->context)) {
>> +		ret = dma_fence_wait(fence, true);
>> +		if (ret)
>> +			return ret;
>>   	}
>>   
>> +	fobj = dma_resv_shared_list(obj->resv);
>>   	if (!exclusive || !fobj)
>>   		return 0;
>>   
>> -- 
>> 2.25.1
>>

