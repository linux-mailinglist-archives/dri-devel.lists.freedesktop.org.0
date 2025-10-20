Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED9BF3787
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40EA10E50F;
	Mon, 20 Oct 2025 20:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gt9QJ8VT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB1010E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 20:39:05 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b3c76f3703cso83392066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760992744; x=1761597544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I13zc6oy6n5wEThdTlFRQKlOHJB6pi47H7uQVP12yGs=;
 b=Gt9QJ8VTLfkwMSVoJTCmWJtPiFxr0PHt6liIO6A84fpHSy7WarZ+WUTYLKLBAO8nmk
 VmhSbp3Dwkg2id/s9Jo7y5ohGZV6hoJgaegYfPvcaO2MQ4m3HMKTUzUKbNOpKIE0AQh9
 dRU2Ug+1oJd9v7ncDSUpE3NrI4q52OMqFxd/9R6DHLdr+H+oLWKc3X31JnUBqtveTkIV
 HtUtfZVm4e6rrWaRuC8QSxFS9d28n+zbsHMEkQBnDQJngWH8EFtXArjUPQr4kPxDpTqH
 6PJ/CkydJbAi61uzoN5LrkBbOchH5zuRUdrKnj1gHa7aRVegPUCxnZYcB/9SKVIiEpzq
 zvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760992744; x=1761597544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I13zc6oy6n5wEThdTlFRQKlOHJB6pi47H7uQVP12yGs=;
 b=APEfYtsLF0VQ8ZTRc2pgsrJHA/ks7mg6VKwIdaNc9QNt/uhTCgrJf3xWMWHGpIEIW0
 Ybg+4SU16K+dK1GzTFSl1pJBugv3HI6XaIrYhiBJPFgERvKE3fc4EspQ5t5Tg92CIWkJ
 frkMpKbm6wl+CJIsCCQS0odFDJiHtNMRps94GILHnhsPUqPG/2oOsNcyqd5XEUn0G3SR
 9KHpYlTz46tu9It1AuQ32PKB7a/hqHC53spseQaA3dspS+xHwfTbt+t7xULu1CiZvsFl
 KT+U27WQIrsK6HYqQx1M70aB4StuffAWRLAHRG4Xge/J+FrSVkNUAH2wJaiDXv05W0F8
 /FOQ==
X-Gm-Message-State: AOJu0YybsMm+fpit/KEuUVBqL2tzwcSQMnjrVzO3VmDii4hgh4VYRThM
 Ycpf5qbMEwy/PtBVRCY786ikIans0xJBtP2KzE98g0+2SzadHHtkeD8x
X-Gm-Gg: ASbGncvPqaQ5lI42Ef5n/RGCeqPXFVRRIDPRaArfUF7snJw3v9FpywxxFToqF2+xmNR
 SOEbCa6p36savkmJileGUIxhU/uFhXMnynkr4AkFRfldA+bS0F/z0dERda4Tyj/W4N7kOuKMKtf
 2oLZH07b1Rz4tnXlWqXL4QqQ3m8MGH843igGV4PdGTBKOwbLHYxeQGfV/YOVFo/dWE57cvXxSQb
 kry+VEPFr9/gLsylYYl0nGrPu7MZrbD+aqHa8yzPMu4/ZeKPEVmpt+RxEzFyjI3gtJQqsuSwyGP
 kacucxDOtJQB4XSN8XUGePHMZs97j6uS/vUS8UkCIJf3E/D+2Hi8Zej8Z56c598uvbRhQcIfPi0
 x/2u/FoV+/RbjO0O26CyfrQB/S5yLCEyz6jPx5KWlm70Kqj0jxbWEvOqvb4gjcOa/tOHQT9t32B
 Z/X/wmBn7+9IWskPhUTXSnJ5kpALlw
X-Google-Smtp-Source: AGHT+IHzlmKFJ8QvxM6XXCi3yDGc0o5ave5OzIak2mYRhAtf9x4ZklR2v8SH+Ts3J9IOPDUqUfvRMA==
X-Received: by 2002:a17:907:9805:b0:b29:8743:81ef with SMTP id
 a640c23a62f3a-b6c744b500bmr72625166b.0.1760992744003; 
 Mon, 20 Oct 2025 13:39:04 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb035d5fsm891116266b.44.2025.10.20.13.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:39:03 -0700 (PDT)
Message-ID: <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
Date: Mon, 20 Oct 2025 22:38:55 +0100
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
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
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

On 10/20/25 9:08 PM, Shuah Khan wrote:
> On 10/19/25 08:58, Mehdi Ben Hadj Khelifa wrote:
>> Replace kmalloc() with kmalloc_array() in several places to correctly
>> handle array allocations and benefit from built-in overflow checking.
>> This prevents potential integer overflows[1] when computing allocation
>> sizes from width, height, pitch, or page values.
>>
>> [1]:https://docs.kernel.org/process/deprecated.html
> 
> Mu understanding is that this document lists deprecates APIs so people
> don't keep adding new ones.
> 
> I didn't get the impression that we are supposed to go delete them from
> the kernel and cause a churn.
> 
the document[1] specifically quotes the following:"
Dynamic size calculations (especially multiplication) should not be 
performed in memory allocator (or similar) function arguments due to the 
risk of them overflowing. This could lead to values wrapping around and 
a smaller allocation being made than the caller was expecting. Using 
those allocations could lead to linear overflows of heap memory and 
other misbehaviors. (One exception to this is literal values where the 
compiler can warn if they might overflow. However, the preferred way in 
these cases is to refactor the code as suggested below to avoid the 
open-coded arithmetic.)"
Specifically mentionned the refactor of the code base in such cases 
which is why i'm doing the patches in the first place.Also i'm trying 
the best to send patches related to the issue where such issues of 
overflow are present or to be consistent with the same API used within 
the same subsystem.
[1]:https://docs.kernel.org/process/deprecated.html> How are you testing 
these changes - do you have this hardware?
> 
>>
I have a raspberrypi zero 2 wh that i'm using in combination with the 
ssd1306 OLED panel via I2C to test it's rendering and it's working 
properly by using modetest and seeing no regressions or warnings in dmesg.

Best Regards,
Mehdi Ben Hadj Khelifa

>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>>   drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
> 
> thanks,
> -- Shuah

