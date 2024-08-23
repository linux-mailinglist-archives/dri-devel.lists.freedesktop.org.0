Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB595CDB9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A9610E82B;
	Fri, 23 Aug 2024 13:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W1vpBFct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9DF10E82B;
 Fri, 23 Aug 2024 13:25:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso15830385e9.2; 
 Fri, 23 Aug 2024 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724419540; x=1725024340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kvEl186Z5eC5g7hoyG1kfbymoU+aDnYKeCoAV9b4Er0=;
 b=W1vpBFctKwoNStUf0gDwIbeENFmug+SddSraGa/MAqhhPUXIEekj/Mzlp+OkTaH8bO
 TBB/m6a+3Bm0T2ufTmW2Xd/zlH0dRetVGtvSAb+sOV0acC8d4gwuxflBsrIiCHH6/Wdo
 VE3iT+si/k0s9CZd+vChcxovoH6xj1MK19rl1QOXc29WqPBzGwbhJazhAUT6xeJzAc3E
 /LvYOZttlM8zW2DgyItGy2WnjY1xyP3trzbhO73ENOUc6r2xOcw8sQNKdGkJQipTQKBz
 A2R+FHijz/RyCgEtg9b68HRWnfrvKtGDzZ2HwVIQVYx57Yq5sRgyAXRYF3HFCpVHZOuc
 UELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724419540; x=1725024340;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kvEl186Z5eC5g7hoyG1kfbymoU+aDnYKeCoAV9b4Er0=;
 b=qK3kCeBkYSBpdvo3IOUbSYIIRffd2fO7CvNHOCfdT38qDtSDUSTGabl1UmuxOWFyrO
 PSI3Vcjun/EzKHDvyCyvYhgPCMvPRtPogFrdQPy0N8q9RjxH45vLLrYJqt1It4Hh26Lx
 16/hVz2ue6hn+GpbE3LcrKpt2g0NwdvmYWDAp+x82SdK/UzwJcNEED6rdLiKqSUZj8aa
 cjNjcF5Y8I/+Km7ZS7m8H8eh579hnYs92EX+4plsu+Kles8a9DQoOahw6nwruTc0TjRh
 wHZWHBoUkBWF3BvIVpGUdaMs5X14Cwef0Ihvhw86BTr6pyytqQ7r9Tc15vlBEo3aKZ5e
 qG7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgncl60qJ2leT6iY3HHKOq4CukMcOQHuOGWe8OynCMv+/jXlfZGwssYRaqidpHY5yFfkyYuC858tg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbVJoCzG3HCRX9y3sFb9mFJ8y2dXhevmrb1Go/hlYLqOy+vnpb
 O2PZrwMquXDafdoXA1+OS+yT7Yt3MKEkfCoeQL+phS26RUJNKN3F
X-Google-Smtp-Source: AGHT+IFfrDoBiXvi51xJ/6IklAHPyg0l5JvzuTJMwB1ShwwWYvXSUbHOFrwuBGiWEDxpb/jCYt1u9w==
X-Received: by 2002:a05:600c:1e1b:b0:426:5fbc:f319 with SMTP id
 5b1f17b1804b1-42acc9fdde5mr15039865e9.33.1724419539628; 
 Fri, 23 Aug 2024 06:25:39 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac51579casm60506515e9.11.2024.08.23.06.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 06:25:39 -0700 (PDT)
Message-ID: <8e022c64-aedb-4dc3-bc6e-8b60f6836151@gmail.com>
Date: Fri, 23 Aug 2024 15:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/ttm: increase ttm pre-fault value to PMD size"
To: Alex Deucher <alexdeucher@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zhu Lingshan <lingshan.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240820134600.1909370-1-alexander.deucher@amd.com>
 <CADnq5_NsyR2eexPnsdx-RCWYef7SyuPed3r076+ZFhuBVxxPAw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_NsyR2eexPnsdx-RCWYef7SyuPed3r076+ZFhuBVxxPAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 23.08.24 um 15:13 schrieb Alex Deucher:
> Ping?
>
> On Tue, Aug 20, 2024 at 9:46 AM Alex Deucher <alexander.deucher@amd.com> wrote:
>> This reverts commit 0ddd2ae586d28e521d37393364d989ce118802e0.
>>
>> This patch causes sluggishness and stuttering in graphical
>> apps.
>>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3564
>> Link: https://www.spinics.net/lists/dri-devel/msg457005.html
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Zhu Lingshan <lingshan.zhu@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

>> ---
>>   include/drm/ttm/ttm_bo.h | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index ef0f52f56ebc..6ccf96c91f3a 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -39,11 +39,7 @@
>>   #include "ttm_device.h"
>>
>>   /* Default number of pre-faulted pages in the TTM fault handler */
>> -#if CONFIG_PGTABLE_LEVELS > 2
>> -#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
>> -#else
>>   #define TTM_BO_VM_NUM_PREFAULT 16
>> -#endif
>>
>>   struct iosys_map;
>>
>> --
>> 2.46.0
>>

