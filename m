Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6937BF3A3C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CB310E514;
	Mon, 20 Oct 2025 21:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fb/F1dHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7210E514
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 21:06:44 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b404a8be3f1so109955466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760994403; x=1761599203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OhY4ES2p36Sez9d7ccqmI9W2N8u8/97h46vN/q1eK6M=;
 b=Fb/F1dHDceUqMh4J+Hbh5lxeuiwYKUHzg1uRmfa6gW2cTRfV7MH3yipE2uCC2n4oRL
 aBtRsX39XUbLv60roSmp660pMcH5IkriMDJ1FPM0QfAlXMKirTemAYzdzQt/PabUPwcp
 aR7bo97lv/dAcjpHXIGQH6F9EUszYHNKCftN4Kyra0yosK/Ww/iD/cgVi0o9+MBzs0Id
 f/HqlqjOQ87jb7gkMjsWxoFUzvFGQdjNkiQsgMm6zG0X05Lt6DkK3+Y8+ZXXwFJMOYfg
 bArAflPyQIW3Wk0X5N1fRDGHQDQGGIfApkLlFNuoMJcbP6PYqzLmIj9zoVlnJKmhPo5n
 tyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760994403; x=1761599203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OhY4ES2p36Sez9d7ccqmI9W2N8u8/97h46vN/q1eK6M=;
 b=kjDQGn3v4iuJb8PADCMw1voJaFLWk+MpvzzvRQ+d5EmgrJYpbzvlAtKs1K70CFVC/j
 xpO1Hs4XwtJYozlrYzKL1CsReuhARwtyfX7ibUDvOK40p510Nr4EsR9aXXuyLBrWmq1j
 UjUxDyO71OEOSmB7uARnTEu3Gh3chIIKyIAfnP1Zuu6hQE625YkG8mHi13ZLs+2egmDv
 Zv0PbcWrlkppGHxw9gR5V+SByTShDaq3pVRXw5Xe1D/m/PPHay1TpBXnaGykPoesjbPm
 Uu30phatX8/9ZSnISoC7368+FqjX7ThvBzbjimXVZUDQj/dAb2tP8Qzx1yKLIgqnlaFM
 e3fg==
X-Gm-Message-State: AOJu0YxKvZ769DkAdmsZnDIbk14zrCS0dY+/NaNNaUqspfIYjGg4qsQj
 Pp5tDkO1o+KotggKxRnc8HJoe7Wp2oJRuC+WxTpzeVGZHtYJnlLDDNL+dhfy8g==
X-Gm-Gg: ASbGncsI/EtyAcZL+Cn9igosQZHBE5LS0PYhQsR4Y+RewQaYXFPdEVPAi0TfujnTg2b
 1KgMzLGTpAbP61YByUiLTYvxuYUo3qTz8z0tbXx6VvYZMshNLQRtwyOTQEtQsq1UqgL0B3iSQOY
 i6cPcz9bV5EeX7VvNSFfM7aHiifmJ7/tzvbq5zRVWL1gxKARTqCgHoSdfcAJhd143yV+oPfSiPI
 JPFveCFN34LplrxNppvqz4GEKssf/KiDOheeOVVaJE7PzF1cRKImZPHsu2mjZHjmJuC6z2GSiO3
 O7VzavXr+eyBLSdYo3PuOB7T9VkeGqUVEDmNIdNDed8vIMqWY6zPZegarGGPRkroRANi1gHQc3d
 XIj+3Y4cwSi14yLH37uFfT1B7ENtpiSNJlklC0IpV6wiqQ4mjZ2bxQME235fFBFqnSmPyP25FSp
 IM4nb9rMaq2Brw/NokTG88XqcUrcaB
X-Google-Smtp-Source: AGHT+IHZVqYKS2iFYtOE/tSHz7RN3sZh1WOSb+4OP97fjXIur8QI9sPPBXL8/BZMXg3DfJFX6AmixQ==
X-Received: by 2002:a17:907:94c9:b0:b04:53be:7652 with SMTP id
 a640c23a62f3a-b6475706f75mr883556366b.8.1760994403086; 
 Mon, 20 Oct 2025 14:06:43 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb526175sm894178166b.56.2025.10.20.14.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 14:06:42 -0700 (PDT)
Message-ID: <8dc12a18-58ee-4df6-a9f3-12d8c05a0954@gmail.com>
Date: Mon, 20 Oct 2025 23:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Shuah Khan <skhan@linuxfoundation.org>, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
 <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
 <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/20/25 9:56 PM, Shuah Khan wrote:
> On 10/20/25 15:38, Mehdi Ben Hadj Khelifa wrote:
>> On 10/20/25 9:08 PM, Shuah Khan wrote:
>>> On 10/19/25 08:58, Mehdi Ben Hadj Khelifa wrote:
>>>> Replace kmalloc() with kmalloc_array() in several places to correctly
>>>> handle array allocations and benefit from built-in overflow checking.
>>>> This prevents potential integer overflows[1] when computing allocation
>>>> sizes from width, height, pitch, or page values.
>>>>
>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>
>>> Mu understanding is that this document lists deprecates APIs so people
>>> don't keep adding new ones.
>>>
>>> I didn't get the impression that we are supposed to go delete them from
>>> the kernel and cause a churn.
>>>
>> the document[1] specifically quotes the following:"
>> Dynamic size calculations (especially multiplication) should not be 
>> performed in memory allocator (or similar) function arguments due to 
>> the risk of them overflowing. This could lead to values wrapping 
>> around and a smaller allocation being made than the caller was 
>> expecting. Using those allocations could lead to linear overflows of 
>> heap memory and other misbehaviors. (One exception to this is literal 
>> values where the compiler can warn if they might overflow. However, 
>> the preferred way in these cases is to refactor the code as suggested 
>> below to avoid the open-coded arithmetic.)"
>> Specifically mentionned the refactor of the code base in such cases 
>> which is why i'm doing the patches in the first place.Also i'm trying 
>> the best to send patches related to the issue where such issues of 
>> overflow are present or to be consistent with the same API used within 
>> the same subsystem.
>> [1]:https://docs.kernel.org/process/deprecated.html> How are you 
>> testing these changes - do you have this hardware?
>>>
>>>>
>> I have a raspberrypi zero 2 wh that i'm using in combination with the 
>> ssd1306 OLED panel via I2C to test it's rendering and it's working 
>> properly by using modetest and seeing no regressions or warnings in 
>> dmesg.
>>
> 
> Send v2 with all these details and why this change is needed
> in the first place.
> 
Okay, I will do that as soon as possible.> When and how does this 
potential problem trigger? Is this a
> theoretical or does this happen in this code path and how?
> Next time include all of these details people understand the
> problem better.
> 
We'll do in the next iteration.Thanks

BR,
Mehdi> thanks,
> -- Shuah
> 

