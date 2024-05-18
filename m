Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14908C91DB
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 20:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D94510E19B;
	Sat, 18 May 2024 18:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AmqhwFQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E8510E168;
 Sat, 18 May 2024 18:23:47 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f2f566a7c7so7842445ad.1; 
 Sat, 18 May 2024 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716056627; x=1716661427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=+VKrQ8v4nDq2FqFQMeX2RIFuDjUMEcY8fFPfS8T9+S0=;
 b=AmqhwFQ1N6nX9vJVaQtCfh+e2ibzVN/wsn5suj1Z7R+boEp/Ks5xQ4Uv87mJPfcXEq
 Ur2CGp6zxAW99KftIDDvhZWtw1mrVG5hhxVOsFZAlo3CE9tPPc6knsAFSFq6CNxmfsdj
 KU+uQzg/8PqpD8V1a5F7/UgIR6NWsxM8vcXfhWS6qtqcPp5/XCmEl36bedPxd2VnK3+6
 t13O7YIyv+554gEA7QavsYDk3x3i5gufOlVFfQyxYKlAO0C6kxmgxWJnPBMcu3Y1OcfZ
 S1lhH2VXLlf59a5VJBfCyafxcu2DjUbh38NHc6AbSqL3urZDZGnP8AP9t/84JWByw6ys
 ueCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716056627; x=1716661427;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VKrQ8v4nDq2FqFQMeX2RIFuDjUMEcY8fFPfS8T9+S0=;
 b=h2iQ+sXQ0uosZhlGRAB07bHbyc9LFdXB5BaaJ13xS/n6hmNQX76yZYre4WR+QBSonJ
 7jOhR1n2D8xzdoBVZyAvGdOEUCNi/lTny00A5GHUmG7t+enTZi6+JDfIuoq6mhiGXuJG
 1MxXT4buYLf/XBZTfOEeImmBtwIwiGUBlgtMbWFKfozCMOoiIAeuCLUIo7MFWEbqn/tm
 2JWmArsH6G17DAGIbwivcuUILKPxFn/w6XuDwfwpsSj8/4Gi4w4KDjI8yGNcn+n3bLJJ
 TfgGwLeKim0XKmOkJZ2oifq+D70C1UVVusjvvXhQMLjNsXAGMypRd5iviONG3HVktECf
 5iow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUECKBRzzWJUbkiZI5uJ9hpqT8CqSZU7C7s5puYXazieZMW7SzmNoutbnPLoJu1qcxOn1fTib9+6x3CHNLpm/EN3azsAFc2d6fREZ/njOvQFGLPQJD6bSIkNfyGapc1Z07e+th/V1MzcfLzqvlEgg==
X-Gm-Message-State: AOJu0YwsUXXlWRvM3qCoyboM8yDI63m+pDm9vBeUlCm5ntX5AHGqf544
 R3Ph0cr62W6O49E+ky6vJ1x1nMJYX0q/bHxg6F2oD1IBzZ4tY4Jz
X-Google-Smtp-Source: AGHT+IGFoyvR173RLXMYz/kWqFXSqO0ZrkvJCjCfM1G80I87V1MgLiaknxpq7LVa8lcRa1SPgeYZbA==
X-Received: by 2002:a17:90b:3ecd:b0:2bd:7264:ed8d with SMTP id
 98e67ed59e1d1-2bd7264f164mr152105a91.17.1716056627196; 
 Sat, 18 May 2024 11:23:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2bd72b74a49sm70162a91.17.2024.05.18.11.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 May 2024 11:23:46 -0700 (PDT)
Message-ID: <a912c2d1-9008-410a-92cc-912e17c63695@roeck-us.net>
Date: Sat, 18 May 2024 11:23:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
To: Kees Cook <keescook@chromium.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@gmail.com, dakr@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, javierm@redhat.com,
 kherbst@redhat.com, linux-kernel@vger.kernel.org, lyude@redhat.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, tzimmermann@suse.de,
 linux-hardening@vger.kernel.org
References: <20240518143743.313872-1-linux@roeck-us.net>
 <34a6d812-b4ed-4465-b0ec-e641d185b9b1@wanadoo.fr>
 <202405181020.2D0A364F@keescook>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <202405181020.2D0A364F@keescook>
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

On 5/18/24 10:32, Kees Cook wrote:
> On Sat, May 18, 2024 at 06:54:36PM +0200, Christophe JAILLET wrote:
>> (adding linux-hardening@vger.kernel.org)
>>
>>
>> Le 18/05/2024 à 16:37, Guenter Roeck a écrit :
>>> Trying to build parisc:allmodconfig with gcc 12.x or later results
>>> in the following build error.
>>>
>>> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
>>> drivers/gpu/drm/nouveau/nvif/object.c:161:9: error:
>>> 	'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
>>>     161 |         memcpy(data, args->mthd.data, size);
>>>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
>>> drivers/gpu/drm/nouveau/nvif/object.c:298:17: error:
>>> 	'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
>>>     298 |                 memcpy(data, args->new.data, size);
>>>
>>> gcc assumes that 'sizeof(*args) + size' can overflow, which would result
>>> in the problem.
>>>
>>> The problem is not new, only it is now no longer a warning but an error since W=1
>>> has been enabled for the drm subsystem and since Werror is enabled for test builds.
>>>
>>> Rearrange arithmetic and add extra size checks to avoid the overflow.
>>>
>>> Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
>>> Cc: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> Cc: Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>> Cc: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>>> Cc: Danilo Krummrich <dakr-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> Cc: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>> ---
>>> checkpatch complains about the line length in the description and the (pre-existing)
>>> assignlemts in if conditions, but I did not want to split lines in the description
>>> or rearrange the code further.
>>>
>>> I don't know why I only see the problem with parisc builds (at least so far).
>>>
>>>    drivers/gpu/drm/nouveau/nvif/object.c | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
>>> index 4d1aaee8fe15..baf623a48874 100644
>>> --- a/drivers/gpu/drm/nouveau/nvif/object.c
>>> +++ b/drivers/gpu/drm/nouveau/nvif/object.c
>>> @@ -145,8 +145,9 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
>>>    	u8 stack[128];
>>>    	int ret;
>>> -	if (sizeof(*args) + size > sizeof(stack)) {
>>> -		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
>>> +	if (size > sizeof(stack) - sizeof(*args)) {
>>> +		if (size > INT_MAX ||
>>> +		    !(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
>>
>> Hi,
>>
>> Would it be cleaner or better to use size_add(sizeof(*args), size)?
> 
> I think the INT_MAX test is actually better in this case because
> nvif_object_ioctl()'s size argument is u32:
> 
> ret = nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
>                                        ^^^^^^^^^^^^^^^^^^^^
> 
> So that could wrap around, even though the allocation may not.
> 
> Better yet, since "sizeof(*args) + size" is repeated 3 times in the
> function, I'd recommend:
> 
> 	...
> 	u32 args_size;
> 
> 	if (check_add_overflow(sizeof(*args), size, &args_size))
> 		return -ENOMEM;
> 	if (args_size > sizeof(stack)) {
> 		if (!(args = kmalloc(args_size, GFP_KERNEL)))
> 			return -ENOMEM;
>          } else {
>                  args = (void *)stack;
>          }
> 	...
>          ret = nvif_object_ioctl(object, args, args_size, NULL);
> 
> This will catch the u32 overflow to nvif_object_ioctl(), catch an
> allocation underflow on 32-bits systems, and make the code more
> readable. :)
> 

Makes sense. I'll change that and send v2.

Thanks,
Guenter


