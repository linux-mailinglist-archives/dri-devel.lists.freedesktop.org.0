Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DFC39E4FC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C36289394;
	Mon,  7 Jun 2021 17:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC64989394
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:10:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id h3so112981wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=LnXllFvFrGllYZ27nSOtR+iv/WKeM8K6lDTfzdK9Ch0=;
 b=YX/qX1LaSbGlNs1S1alDzuCB3zwzojGsYYuGIGeXdJEpQizCn+2rSstd2EiF3yRi/6
 w3LOB+cWbEsvviAnWcA4Ci9CGDZy2D/MyAT9maspFC52pcUSecVM2QhEAo//IGfEe/ra
 AVpNwOnHutAnT10d5J/ZmCCbm3Y6AZskVuFNSp452czyQSQMH/j1h/CRPpcwr0zY2/fT
 rmmLdEMmH8SJ61uAUW9hsBOtB2/s0b0Rve4K+QjXeNADvLPN59aRZV5ozCdC894oi1E0
 jcJnHxlU1pEdsoISM2BzYFXjQzCpPG4GAkbvQPGRfpJAyuMSdmM3DA8ThqH/R7RGLtJZ
 3LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LnXllFvFrGllYZ27nSOtR+iv/WKeM8K6lDTfzdK9Ch0=;
 b=Eiv7vegLTC4QYlxrawmuHgNhYKZIZTBOAxOvgxstyNsXfyjYopBA5JYhGaHveMQkm4
 DsM8A4FGXQh6Zm+zU413v0NDGjPGZRV48XKc0h1GC6BbXUolqG75GfLypIo5QWD5C4rd
 pxzscdXOe2zoQ1DyNsi0yYipC6X7e9VwipkCTo6Kxwh5ViZjO19tREqxUePTSbCgt3tB
 GC6va3p/Qo57Yy43K8C1n/7Uln6bTv3zh7VgLz3KvMZgU00fARAF7u5Y2vUZcsrMVx7L
 nfE9+phenUy1CYz3XXgFXiwqQgnQkr0ED7qAyfi7h09xOPpAmMkVNbDyuQWLeFEWMeX+
 AarA==
X-Gm-Message-State: AOAM5317/+vu9MMBL+0FAlGBzGkqpwUiHBqUU3YctrjI2GiFD4qVYqoJ
 2KEgIF/CT9q+wWLrbplfoQ9MFQS4i6k=
X-Google-Smtp-Source: ABdhPJwg0AWjKIWpdtFIZByJGfXHdn48DoUtCd7Nxd0Ts/1uiUleOqYCeCFexmbs/6nVRfYtg4CpZw==
X-Received: by 2002:a1c:9dcd:: with SMTP id g196mr105140wme.135.1623085819430; 
 Mon, 07 Jun 2021 10:10:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id 92sm18278775wrp.88.2021.06.07.10.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 10:10:19 -0700 (PDT)
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fd7fd792-5d9f-c685-6a12-6351bf7d2116@gmail.com>
Date: Mon, 7 Jun 2021 19:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
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



Am 07.06.21 um 18:40 schrieb Thomas Hellström (Intel):
>
> On 6/2/21 12:09 PM, Christian König wrote:
> ...
>> @@ -728,14 +728,15 @@ static int ttm_bo_add_move_fence(struct 
>> ttm_buffer_object *bo,
>>    */
>>   static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>>                     const struct ttm_place *place,
>> -                  struct ttm_resource *mem,
>> +                  struct ttm_resource **mem,
>>                     struct ttm_operation_ctx *ctx)
>>   {
>>       struct ttm_device *bdev = bo->bdev;
>> -    struct ttm_resource_manager *man = ttm_manager_type(bdev, 
>> mem->mem_type);
>> +    struct ttm_resource_manager *man;
>>       struct ww_acquire_ctx *ticket;
>>       int ret;
>>   +    man = ttm_manager_type(bdev, (*mem)->mem_type);
>
> Isn't (*mem) uninitialized here? Should be place->mem_type? Eviction 
> is immediately sent to the bushes.

Indeed and I'm like 99% sure that Nirmoy has pointed that out to me as well.

Looks like I missed to fix that one. We need more CI testing.

Thanks,
Christian.

>
> Got at least one additional NULL pointer deref to track down in the 
> eviction code, but could be a merge error of mine as well.
>
> /Thomas
>
>

