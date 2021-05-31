Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C23958F4
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 12:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15A36E4C4;
	Mon, 31 May 2021 10:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F0E6E1DE;
 Mon, 31 May 2021 10:32:36 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id v5so14362171ljg.12;
 Mon, 31 May 2021 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=usO9+/gM4Zo9jeFsuuS4Ase+VqK8oMXSDPbQWD0BH1w=;
 b=XwNwPBrSXKB9gX0XCTa3nwqkyw+5/qHAMgz3KXUors7ZL1z6gPgD9vKKpVWtof3Aoq
 n4bdgXVkVFXgkxUGBUbB/u7AWWdDbbosvFfAU4o3s/ZVqjt+zGU6MHfg9g8Gh3BsZXVY
 wW4IEh7MRHIOO09XpEm+04Vc+qsOyd/WsAYYpj9+PZm4XnhetnyLMskHqbzb3qj/HCqy
 tV4bJiEHIm1OvR24COPmoj3F2xPBHx9WlblS9YUL04dbQRxXv5V8xxHqjdsqqEgMci+8
 8zjm6achdVxcwOGx08gPyYbe/znHksWCqprF3gn+3MnOr98JO2OA1BGL9LMY9QbcwawY
 DO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=usO9+/gM4Zo9jeFsuuS4Ase+VqK8oMXSDPbQWD0BH1w=;
 b=UDEfU5WmErzf2cDS5Dm4oc13vazdPXXQKyuKnMUmOYu72loNzpJ3jVNs968hoY7FE+
 /pBcpFKPO1xpM8dB4RoVGNDQvKXkGbAN830586zINTUxk2biXlYngbD4u5uSDTtw2cwU
 HudkUzssor3hfWvqYp9Vo0wl+OX3WQ3K+4uhOLFn6/Bz8SCwkB8FQ/B2wsn1Rrjp6UgN
 C1SjlUQPNFHo3TvaVvsCP7qWcY8+pYS4kdfa4T2PUIGjgVVi5ISK8qq3NUDpVynI9p6y
 dWyZLJtHIsbVJRCNexh0+om0muQONDv3B8X+XRSfjAwEcfneBCVrjK/mxSWRMFD7/v9q
 SLog==
X-Gm-Message-State: AOAM530lxdaH+Rsag0c7PwGZyM6rHB27Zg22atpgHgpbjfpL6UqwRYJc
 6YCNBwAoTGXf8d6CakI5zYY=
X-Google-Smtp-Source: ABdhPJwW7RCDsAOWoNOxEfbaI5cD1RW+UpupiDrRVHG/n9wESVlsAso4aDH+TORmmRT62MQgDxNZhw==
X-Received: by 2002:a05:651c:105a:: with SMTP id
 x26mr16157353ljm.440.1622457154572; 
 Mon, 31 May 2021 03:32:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81?
 ([2a02:908:1252:fb60:b94:4956:bad4:7c81])
 by smtp.gmail.com with ESMTPSA id j1sm1298342lfm.55.2021.05.31.03.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 03:32:34 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 "Yu, Lang" <Lang.Yu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
 <DM6PR12MB4250B79297F587313D7645EBFB3F9@DM6PR12MB4250.namprd12.prod.outlook.com>
 <14d7f047-cf6d-c84a-14ff-3f1d833a770b@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <883bd629-e3ad-07a2-8952-994f42cb02be@gmail.com>
Date: Mon, 31 May 2021 12:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <14d7f047-cf6d-c84a-14ff-3f1d833a770b@shipmail.org>
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.05.21 um 11:52 schrieb Thomas Hellström (Intel):
> Hi, Lang,
>
> On 5/31/21 10:19 AM, Yu, Lang wrote:
>> [Public]
>>
>>> Hi,
>>> On 5/27/21 3:30 AM, Lang Yu wrote:
>>>> Make TTM_PL_FLAG_* start from zero and add
>>>> TTM_PL_FLAG_TEMPORARY flag for temporary
>>>> GTT allocation use.
>>> GTT is a driver private acronym, right? And it doesn't look like
>>> TTM_PL_FLAG_TEMPORARY will be used in core TTM, so should we instead 
>>> set
>>> aside a mask in the PL flag for driver-private use?
>> Hi Thomas,
>>
>> Thanks for your comments and advice, GTT means Graphics Translation 
>> Table here, seems
>> a general acronym. TTM_PL_FLAG_TEMPORARY may also be used by other 
>> drives.
>> I have made other patches for this. Please help review.
>>
>> Regards,
>> Lang
>>
> My point was really that the flag naming and documentation should 
> reflect what core ttm is doing with that flag. If there is no specific 
> core TTM usage, IMO we should move it to a driver specific flag to 
> avoid future confusion. In particular a writer of a generic TTM 
> resource manager should be able to know without looking at an old 
> commit message what the placement flag is intended for.
>
> So here we add a flag where core TTM forces a bo move on validate and 
> that's it. And that appears to be how it's used when an amdgpu bo is 
> evicted to GTT, (btw should it be accounted in this situation?)
>
> The other use is to force the amdgpu driver to temporarily accept it 
> into GTT when there is a lack of space, and IMHO that's a driver 
> specific use and we should allocate a mask for driver specific flags 
> for that.
>
> So shouldn't this be two flags, really?

Well one flag makes sense for the use case at hand that drivers want to 
signal to TTM that an allocation is only temporary and not considered valid.

That we then use this flag to implement temporary GTT allocations to 
avoid problems during eviction is just extending that use case.

Christian.

>
> TTM_PL_FLAG_FORCE_MOVE
>
> and
>
> AMDGPU_PL_FLAG_TEMPORARY
>
> Thanks,
>
> /Thomas
>
>>> Thomas
>>> -----Original Message-----
>>> From: Yu, Lang <Lang.Yu@amd.com>
>>> Sent: Thursday, May 27, 2021 9:31 AM
>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>> Cc: Koenig, Christian <Christian.Koenig@amd.com>; Huang, Ray
>>> <Ray.Huang@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>;
>>> Yu, Lang <Lang.Yu@amd.com>
>>> Subject: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
>>>
>>> Make TTM_PL_FLAG_* start from zero and add TTM_PL_FLAG_TEMPORARY flag
>>> for temporary GTT allocation use.
>>>
>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>> ---
>>> include/drm/ttm/ttm_placement.h | 5 +++--
>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/drm/ttm/ttm_placement.h
>>> b/include/drm/ttm/ttm_placement.h index aa6ba4d0cf78..9f5cfc7c2d5a 
>>> 100644
>>> --- a/include/drm/ttm/ttm_placement.h
>>> +++ b/include/drm/ttm/ttm_placement.h
>>> @@ -47,8 +47,9 @@
>>>   * top of the memory area, instead of the bottom.
>>>   */
>>>
>>> -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>>
>>> /**
>>>   * struct ttm_place
>>> -- 
>>> 2.25.1
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

