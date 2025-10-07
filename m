Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9A8BC08CA
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66C210E597;
	Tue,  7 Oct 2025 08:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TPzvzC15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E1110E597
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 08:06:49 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e2cfbf764so7271635e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759824408; x=1760429208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+DemagZ3lwdnPbdAD7J+Cx+hPerc6FDpVY4UH1BSMao=;
 b=TPzvzC15HOzLznMP3vA6/u9iTfZPvCFnaQ20n8R5VYRj2td0GMFT7KRnlzgAEu1y66
 M+DGVV2bzY8S1ZKKqi6wGybVQLWnOz3yMfzvpWuCdqzlw3Y1Yi/n5MqUKCoW593wyZWF
 yzX5eD72i1ozfDEacQEsnyKUJJ7C2aZV2O73RA7jQvMsYZTLJjY/IyY+Vz/E203uaZEo
 94hDOZSotAxhGs7fYWQE9dVb3ljJW5+oHLsrk1wNTQvFjvC/KWomI0agV5uCqrXTQvbb
 QViGKcFuaGfEqfGn4BtXks6DUIUcsrnosPPgk+Gjr+6TrgtJE0lWApxSGESgi4JAhTD9
 Vsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759824408; x=1760429208;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+DemagZ3lwdnPbdAD7J+Cx+hPerc6FDpVY4UH1BSMao=;
 b=J2gUiNKaDdQkE/nDg14Smkx7tTySfP6D5BvC+eCEIdFk0Nke/EueRR7zMiuADdg3Sw
 f1yp349cDLsJBAN0I86eY7cBygAhNjsrtFbEWrg+EXqpIl1xpIC5zWiiZQ4HUsrlfrzh
 JE6h9lJeTXGQyiDAnwbsWY8S3guJsT2HK+yNZfgRwDsV18EO9UEBR14CHcV8k6f3NSkt
 9StnG2ql3PADUXEiLG+Z3+6WfaRXe4GC7SSExWNcYeDJcJR5OZU6z2IfiLbsv8jL8qdX
 xTFMK9u6j4dKMQSK9rUvX1/brk6PUK/oZ6qWTaLcQpQn5eX8t0ixGFXDW8w2TtKBH5J2
 ujnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjXaBX3MmKYpIBm55f5N0L9QjgECvvgkruhL3sOmZVHC/hHF9Ptl5ZP1GydPIKGWHxZUFuXrGXnIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4HTHbmMH4+4GPE5WOFDbq1J+IEx4dgykWc1KB8Dp5uEFkF356
 3i3SEwdssJ0WSxR9bFaWmoeKVGmLgDg2qP8MtiPmkfBCDHLTX1fEap9o
X-Gm-Gg: ASbGnctvgYF9kWCbj+Ylo04NYgxwE4lq1bek3sUcv6ufA4dEuAel3z8DnjOR1r+P1o4
 6A4Lu4DX2+vcckEMuAHpt7ArzkTfYSF0binm6z6dUSSts00kENik7/wkuWtsfdI76R9eM6Yybe8
 68GaegJTe7hX8JywnQr6gcuDOO5TvklZel1XJvWl8UuJsX3vJ+jI5dSG/x2TAvWMMNvZxN+dV+T
 NcjqwV3J+Rml9PGQFow7GXGV9SWjBc8l8Sesau/70RYeyvpm7rIKk6NXUCgIFchTHl1YKQI/rLt
 mbtU8QO5OtBZdot/3tCxaEt7OoriNsB0RfwyC2cnRIrYyO6O6//BTo6PZ168qc7rGyY7GISZ896
 Nss1HVPTJZRvcYVHGM+HMqquGDG9GS3qqeL+S6ZVh/QO1LwjbqItEUPVqR6fAN285o8c+/rMTxi
 M=
X-Google-Smtp-Source: AGHT+IG7W8TdSh7hajTVSLVxdSS/RLt63cBB9lWB3+Jv1QSy+dF+pbB9sKZOf60r/31B0nPg2XLA7Q==
X-Received: by 2002:a05:600c:3510:b0:45d:f7df:270b with SMTP id
 5b1f17b1804b1-46e710b22c1mr53224255e9.0.1759824407277; 
 Tue, 07 Oct 2025 01:06:47 -0700 (PDT)
Received: from [192.168.174.116] ([102.155.185.183])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9780sm24118374f8f.29.2025.10.07.01.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 01:06:46 -0700 (PDT)
Message-ID: <20f049cc-41f4-4b23-b4a7-5d41dca7c7e5@gmail.com>
Date: Tue, 7 Oct 2025 09:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gud: Use kmalloc_array() instead of kmalloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, rubenru09@aol.com
References: <20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com>
 <26036ff3-2374-40a9-8597-271b93130a7e@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <26036ff3-2374-40a9-8597-271b93130a7e@suse.de>
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

On 10/7/25 8:45 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.09.25 um 10:51 schrieb Mehdi Ben Hadj Khelifa:
>> Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
>> calculation inside kmalloc is dynamic 'width * height' to avoid
>> overflow.
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>> Changelog:
>>
>> Changes since v1:
>> - Use of width as element count and height as size of element to
>> eliminate the mentionned calculation and overflow issues.
>>
>>   drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/ 
>> gud_pipe.c
>> index 8d548d08f127..8898dc9393fb 100644
>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>> @@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const 
>> struct drm_format_info *format
>>       height = drm_rect_height(rect);
>>       len = drm_format_info_min_pitch(format, 0, width) * height;
>> -    buf = kmalloc(width * height, GFP_KERNEL);
>> +    buf = kmalloc_array(width, height, GFP_KERNEL);
> 
> One nitpick here: the first parameter is the number of elements and the 
> second parameter is the size of an individual element. [1] So the 
> arguments 'width' and 'height' should be reversed.  Please resubmit.
> 
Understood,I will be sending v3 shortly.

> Best regards
> Thomas
> 

Best Regards,
Mehdi

> [1] https://elixir.bootlin.com/linux/v6.17.1/source/tools/include/linux/ 
> slab.h#L15
> 
>>       if (!buf)
>>           return 0;
> 

