Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1399C435D88
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 11:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E126EB4D;
	Thu, 21 Oct 2021 09:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2316EB4D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:05:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso54298wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 02:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ukXKBb8RlcksCxebKWOZPdUfGybue9Z9yPfSGtUckak=;
 b=pN3JX6MUo809uMYEZURfb2MqzboN4GNRKHYaf0D4ItLYvqtBcbZIVuvAIOje+9bZ+Q
 34F2IIVoc3GuP3sW9VRxc5KppvRaGmxIXM82UHAIyVoBxO52GVsWDys/XFszOaxoFQN3
 VuHUK+AxnVun/yHCqQ/AyxGxhalyKxDJ69Skh+AfMM4PklaORvF7cBEjVjpItsjBOZLT
 jRY/zmU/Z+PXB3Wpn8sQcpykkF7HRE6og5Znxo0PsCDzeyfua/eLPcksffIU/5CMZ/0g
 T0qYR4piVXFLZki0G2S+z2tANUklpSG1iL0ZcG4TZ9GRzyrBj5AmGTDpOjwdfAbKhMa2
 pC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ukXKBb8RlcksCxebKWOZPdUfGybue9Z9yPfSGtUckak=;
 b=73gHjBz+CjUayMjLAZ+epVPDhXiKPGbsvnmei2Z4nbgQBaFtbVMJS+fg1jGqS56nOO
 201vQsrN1yttDeQI9kSucffsP6bk5R8oktUh1h7vlEtkdy7FfKMikGe7y3g0Ap55Dq+x
 tsQg1cryF8VKYa8R+BjnssMQcWy46RoD2zI3XNpoq+rOy7rz1e2oGEmtw5k94msPrakf
 3W6Dv9E7QHc5wlLM1DfW34VJxlFuKYc/RnHYCeOc+RY6HhDredsjazreVJ10BFkjWL+W
 KYGnkMqxGMAAmBeNWGgLt584secrP8IkxXtNGirrc0vKq6cdijxciH5YhWOBDLC7nTXH
 Ogqw==
X-Gm-Message-State: AOAM531LTsnunSdJtmPCeUUPnKWlpmzxN1l3SaemioF05ze4FQpE64uQ
 WdsmAAQpNdJDYysQQTZRlLhTQju/3IA=
X-Google-Smtp-Source: ABdhPJz3C6JnJiIHJdDGp/NavrrI+ZG4S3koyRNjci0bVAEr8nJGVSXe0bv3XU1kR/uRp3WVLCCubw==
X-Received: by 2002:a1c:1b4a:: with SMTP id b71mr5226590wmb.33.1634807155081; 
 Thu, 21 Oct 2021 02:05:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:46a4:dec3:9292:691a?
 ([2a02:908:1252:fb60:46a4:dec3:9292:691a])
 by smtp.gmail.com with ESMTPSA id e9sm4351327wrn.2.2021.10.21.02.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:05:54 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix memleak in ttm_transfered_destroy
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>, Huang Rui <ray.huang@amd.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <20211020173211.2247-1-christian.koenig@amd.com>
 <CADnq5_M7Yb3Yq-NeOTtwyN=XKQKHLoJ3FSFPi+qyigqxfrzsMA@mail.gmail.com>
 <4dec11b0-a503-62d2-0d4b-5acc511f7492@gmail.com>
Message-ID: <9b508a98-8dc3-9da8-a0aa-3eb12eb2f7b2@gmail.com>
Date: Thu, 21 Oct 2021 11:05:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4dec11b0-a503-62d2-0d4b-5acc511f7492@gmail.com>
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



Am 20.10.21 um 19:47 schrieb Christian König:
> Am 20.10.21 um 19:43 schrieb Alex Deucher:
>> On Wed, Oct 20, 2021 at 1:32 PM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> We need to cleanup the fences for ghost objects as well.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> CC: <stable@vger.kernel.org>
>> Does this fix this bug?
>> https://bugzilla.kernel.org/show_bug.cgi?id=214029
>
> Yeah, I was already adding that patch to the bug report as potential fix.

Ok that indeed fixes the issues we were seeing.

Can I get an acked or reviewed-by so that I can push this to 
drm-misc-fixes ASAP?

Thanks,
Christian.

>
> Christian.
>
>>
>> Alex
>>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index 82af095f6b81..f37a8c53b35f 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -190,6 +190,7 @@ static void ttm_transfered_destroy(struct 
>>> ttm_buffer_object *bo)
>>>          struct ttm_transfer_obj *fbo;
>>>
>>>          fbo = container_of(bo, struct ttm_transfer_obj, base);
>>> +       dma_resv_fini(&fbo->base.base._resv);
>>>          ttm_bo_put(fbo->bo);
>>>          kfree(fbo);
>>>   }
>>> -- 
>>> 2.25.1
>>>
>

