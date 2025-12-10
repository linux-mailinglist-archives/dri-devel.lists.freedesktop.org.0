Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF17CB1E69
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 05:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A02210E249;
	Wed, 10 Dec 2025 04:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IzdTfuzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E0E10E249
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 04:24:49 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-29812589890so88401365ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765340689; x=1765945489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZHURbWUQgIv6rDE4plYGzDdoLRCquvnAG2DekAVeb8k=;
 b=IzdTfuzEaRyU0jX0tRs8sBp2/LxuUV89eY7XRnQByvFhLzhdL3Wrw/iDSyKJQHs0oD
 N5An5cWker0HU70Th/hgZXeIqE06Q8NA/igrUPUUdhA9IgCjDFBSXltQA6GDQdIlMF3b
 HMidHq1DwxuWXOIQZ2dAWEQlbygxzHQILZc0P9sofm1gFpVo24fmDAQC8ulbsYGsKar8
 kPxFGQBwmNTLfL54UNpEwZMfTCxkUkLyKw9p+WIQbZRHtbg1yJfm6ubciAsry/EXhByC
 2LX6rPpx7FvgPVNNFpksmuUUA5UZmodhXiKi/oAg5PO+k61yf1pClnZXPvaeVD4y8Caw
 +xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765340689; x=1765945489;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZHURbWUQgIv6rDE4plYGzDdoLRCquvnAG2DekAVeb8k=;
 b=MZfWvVERH/Y/MEx7VFgmwHnUJYzTvpqODrm4esqy6EHhS/Lqw2hRHIRxoWRb32hBtY
 4+0lfcuav12M9AzMfcWZfXas4Zc3fPyG3tt4YbNe4+yn2/EeEGKCcYRi91EbMbgkLEAu
 0CmkZQmyf6KhixYiHFwo0fA5toVcpd6ThGMKX7AH5OmFs9LDueV8EUa7nTo192s+ovD8
 IfgXg4jQ3uybRcJOLLXurCX+0S0oGsYa7ekMkjDKRK90T8U9/AL1JL2Q3hBBNnsNClQu
 ong5ht3Iqa/dAmZKI9ylTRbHXbN1tNyGRj96sxzNVmO73vJkPrDJA1yh2PMJScHQbeRt
 e0tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdDE4OPpdTsKlJbkyl3gDUy1Cjp4E75ZGtUcXiN6RsZ84KU3JeEfNrZRvOtLI62rLgu+VJ62BaGL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3xUFYavsx/RAoK07y+SXFdL3RmWW2EekCzxO3rsl5v9/CGQo9
 nJPsbwOCkOeGSci3cPVe4Jj0eWgbZz3kxm7R46wjUAJ18zY2n7ypmZvm
X-Gm-Gg: AY/fxX7KRs6zQow56IzN4CfjjcszyRgIpqGf3p1CVXCTcfOjE+pJBBA1d6SJeuFIrvr
 xt3+ZIEozL4z3XhPJS6NAzsOB4+s6831J5PCZ5E3HwLgugQu6AIeDSh3EYkuDOPC9edvmEKl2Re
 5KFRKKz/liYBdlaiHpduszLsqj7tsIqyLoQeZnHnVEBh+Lf4stG6p+QyAEGDLeK1ZLzMJ8HR/W5
 n60nLDyUcg6D3AVilsHvpdASc07o4/5GVbymfR3ILJdftdu3jeVjRiXe0fkoZw9b0EwsA+BtNS6
 J6vNG/wUERigE7CHjpc9QAS1jl4UYQCjMgjQcvurhV4ocDJJcoh01SKTYtBPbLxKy22YmSjkla7
 35iCO+JIsWGfs2VD40ylYvPSzmPxki9XDXTditrexoCOo79IuoZheweJ9P1Y4KDSj4szqfM4fHh
 4Nt0WvKw1PZ4O0cMV7hthJaqszQSX7AxR3G0sMNM+KU3G2bP1hoQMLHv9siLRW
X-Google-Smtp-Source: AGHT+IFLjbHqKm1TeTHwPWHgM/dVq6lAyHbS/510gkTwuZ9bXQQa6783zsMnS6eOgTYVIMZq9D1MPA==
X-Received: by 2002:a17:903:198d:b0:298:1422:510d with SMTP id
 d9443c01a7336-29ec2d8b9f2mr11445495ad.48.1765340689155; 
 Tue, 09 Dec 2025 20:24:49 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:b90d:2938:bd7a:289f?
 ([2601:1c0:5780:9200:b90d:2938:bd7a:289f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae4cf97fsm167022355ad.25.2025.12.09.20.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 20:24:48 -0800 (PST)
Message-ID: <89b08d9a-9f96-40f0-9ae6-e54b16b65879@gmail.com>
Date: Tue, 9 Dec 2025 20:24:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbtft: Make sysfs and dev_*() logging conditional on
 FB_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <20251209042744.7875-2-chintanlike@gmail.com>
 <329423e8-d778-4f30-904a-825b1be72ce2@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <329423e8-d778-4f30-904a-825b1be72ce2@suse.de>
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

Hi Thomas,

On 12/8/25 23:25, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.12.25 um 05:27 schrieb Chintan Patel:
>> The fbtft core and sysfs implementation unconditionally dereference
>> fb_info->dev and register sysfs attributes. When FB_DEVICE=n, these
>> fields are unavailable, leading to build failures.
>>
>> This patch wraps all sysfs attribute creation/removal and dev_dbg/ 
>> dev_info
>> logging in #ifdef CONFIG_FB_DEVICE, with pr_*() fallbacks for the
>> non-FB_DEVICE case. This makes fbtft fully buildable when FB_DEVICE is
>> disabled.
>>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>>   drivers/staging/fbtft/fbtft-core.c  | 20 ++++++++++++++++++--
>>   drivers/staging/fbtft/fbtft-sysfs.c |  8 ++++++++
>>   2 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/ 
>> fbtft/fbtft-core.c
>> index 9e7b84071174..dc967bdeabe8 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -365,9 +365,14 @@ static int fbtft_fb_setcolreg(unsigned int regno, 
>> unsigned int red,
>>       unsigned int val;
>>       int ret = 1;
>> +#ifdef CONFIG_FB_DEVICE
>>       dev_dbg(info->dev,
> 
> Rather use fb_dbg() [1] and similar helpers for logging. They only need 
> the info pointer and do the correct output by themselves.
> 
> [1] https://elixir.bootlin.com/linux/v6.18/source/include/linux/fb.h#L895

Thank you for this pointer - I actually didnt now this existed. Will do v2.
