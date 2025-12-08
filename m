Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC739CAC5E2
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D61C10E3A5;
	Mon,  8 Dec 2025 07:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="aX9gIkOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785110E3A5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:37:08 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so6458017a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Dec 2025 23:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765179427; x=1765784227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Q5CIH407b9hhYPAgKjmh9mfVcRk5620MqBEl99rtlQ=;
 b=aX9gIkOR54Vs1gIJsfRu/Ch63LFB2Hz8J/gVoX9KJRrgqdv3v1s+7JagFT7ep/oVLF
 bvSA2R/g/P2od6yoZxaM7+JG92WEfxUAgAmqhnjz0ymKIBJv7qiOmBPvQB6LtEF/tMnd
 Teg+WKJWyTGUCLeKW+Pl/oNOC4EYbucducQQvvaPC8eZlNkMMt6eLKc8OLAbnGunSQxD
 uU+u9qCHdxDtvHm+OPboOQf/YKhQTjQOuXJhpi/YhkRFg7ngyJigMPCFtg9+ulgkdjrg
 moXsimmt11SZ8gjlFHnj6f0GVGmGKytyH6ZBXGlpkYBGn747oh/mbgKR5W5eaw/JmChK
 iL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765179427; x=1765784227;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Q5CIH407b9hhYPAgKjmh9mfVcRk5620MqBEl99rtlQ=;
 b=Bntbiwq9pGfGzm8ShSHmzcutjH1VkUpsU0K+U/DL6vEvIYWH48nabGP0y+2Iho4X9c
 pY5GZVSoBQaZFrTyqdBiYZiB+D1wKL+xUNqxuw8i0NJq2vckvE7WrCuXa7/s2yghIRf8
 YR7zA4Phub58BQTNwAqScrfCZ/t9GgRzo+0oaHcJPOe9b4neuBNHiiXOMTjt+IZUrb/V
 36U8woBsRB+n9O14DrFJsQOMBsU+d8aXLD0gcWoMW60tmyboHbJRTjiVA0163epPbOUw
 5z/UJG52n7t9rsr3iM0RZRPOUf0sDnJ4pB+/0GVN1gOO2d6XPqrvEHcAE2BxAiUsljxX
 bZrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn8cJRzVMaukMRJcd3WF4fuyaCwQUU8nuxiBn1BhHSNCeHJhwA7irxWV2Kyu+jQOnjjX28hgH9m7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbQt3IhnsU8j8IGPO0x3Z8zuYJ1K44G81uHBbuqELvbb+GiQAI
 pyY5Lp5C9pmIpw9xnwushN9E1vZkDVGCpE1njxsWIDAd1NmfLpG90bUE5SF2rTOJA5I=
X-Gm-Gg: ASbGnctGry8ecAuMjIge7mG29HG1sqD2Z7fxBFUcyRFmKVCt9h+nHS7S6JQZrF+H6LA
 BaU5OBw9uTVEPzG1qr/Fw03ESmBUwIen2rh9ggK/5aYVS3IUKTW44qTudnuaBk5APVgXer8Xzht
 TJ1DBjAKIsqW0BPH6g/tgTJ/C1Mbnfs12kKYL7Q3Fb+x4CXjQZD4esZBGtVmALsN4ME0OQkA5iG
 tMLVLd8qGXgrrIoqOuehisey1uZ38265xCTPBTglDXjvOZLZK0zijwCGzFvbOp/Buc9thgKlFE3
 x5lJ7VLrJ1uVAzlHwPMKI9ugEGXkhD9I31d4srjpQrneSmuivHTXVWIR1t3ojT59Gfnoq5095y/
 ZJKfJi5PecrpcDpa6A53LgDlKkh49F3vNfG/zyW5S8MSdq2ocfyCIpBvjcF4WQfQjJNYzI8VuAs
 hYW5g0fcL9ly98gJVNcoIluFIa1mvm
X-Google-Smtp-Source: AGHT+IGgcjQuFSKb6f4GTBGTvfr4Ss06IGmhWYromnefd+hR7FHbKzN9XJ2Jn9Fo5F7LexDqN/z8SA==
X-Received: by 2002:a17:907:7f9e:b0:b73:6998:7bcd with SMTP id
 a640c23a62f3a-b7a2430479fmr681434866b.23.1765179426989; 
 Sun, 07 Dec 2025 23:37:06 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f449ba82sm1043117766b.22.2025.12.07.23.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Dec 2025 23:37:06 -0800 (PST)
Message-ID: <602813bb-096b-44b4-af1d-95681769c943@ursulin.net>
Date: Mon, 8 Dec 2025 08:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i195: Fix format string truncation warning
To: David Laight <david.laight.linux@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251107164240.2023366-2-ardb+git@google.com>
 <14ca1b28-df1d-4065-ad7a-97a3ff81a5a4@ursulin.net>
 <CAMj1kXEgfykaf9oB4_tuAQqwXDN+NLy_Hb_+RnQmeicVgKt0bA@mail.gmail.com>
 <CAMj1kXFLaOZMXsUsvrshkwhvJSWm3V_iZB3n1rga=Q6zwrVY_g@mail.gmail.com>
 <20251205182813.09231c45@pumpkin>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251205182813.09231c45@pumpkin>
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


On 05/12/2025 19:28, David Laight wrote:
> On Fri, 5 Dec 2025 11:48:08 +0100
> Ard Biesheuvel <ardb@kernel.org> wrote:
>
>> On Sun, 9 Nov 2025 at 19:00, Ard Biesheuvel <ardb@kernel.org> wrote:
> ...
>>>> But I guess much prettier fix would be to simply grow the buffer.
>>>>   
>>>   
>> OK, so something like
>>
>> --- a/drivers/gpu/drm/i915/intel_memory_region.h
>> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
>> @@ -72,7 +72,7 @@ struct intel_memory_region {
>>          u16 instance;
>>          enum intel_region_id id;
>>          char name[16];
>> -       char uabi_name[16];
>> +       char uabi_name[20];
> The observant will notice the 7 bytes of padding following 'private',
> and another 7 a little later on.
> (I' pretty sure 'bool' is u8).

Oh well, them holes love to be added over time.

Anyway, I have pushed this patch to drm-intel-gt-next so it will appear 
in 6.20. Only now I realised I could have suggested to add some  Fixes: 
tag to it, so it would get automatically picked for 6.19.

My colleagues who are handling drm-intel-next-fixes for 6.19 could 
perhaps manually pick it up.

Tvrtko

>
> So extending the buffer doesn't even grow the structure.
> The string is only used when printing some stats.
> I got lost in a list of #defines and function pointers trying to find
> the actual function that did the 'printf'.
>
> 	David
>
>>          bool private; /* not for userspace */
>>
>>          struct {
>>
>>
>>
>>>> Also, hm, how come gcc does not find the mem->name vsnprintf from
>>>> intel_memory_region_set_name?
>>>>   
>>>   
>> AFAICT, intel_memory_region_set_name() is never called with a format
>> string that could produce more than 15/16 bytes of output.
>>

