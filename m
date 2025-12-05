Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7A8CA7537
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE7410EAC0;
	Fri,  5 Dec 2025 11:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="jf6QAS6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90C010EAC0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 11:13:17 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso10109885e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 03:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1764933196; x=1765537996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S+WodKuxsAcIaiFl8vrv/vlH2xW1X4fsVn0hYeqa028=;
 b=jf6QAS6itudHOH6tiwkXVVNSvMr4bvf4MDV/WqIEUiUiJDOVL2GD8HIny/T1auGZ4W
 wj6mIBBGmudTDGQGRj4NvHN+4kXJqE/jmh9azIfaiUkYVeGbVx0qWE1zcnslElc/z/sM
 vFqbTWQsBmWZ5Pxpg6NLY4RQmJolUIv/qCaa27iRt9R1kVaTr77SAkhXxpEvqfUl/DNq
 3VDX+UyD2FUoL/RhV3Wd5lMshZRT22i6NLiCNT8w/3O2GrJeuJwBRqUUNZxIGm6qhPfz
 yBY6DoPxEKbfAq8aWgbqh9b16MvKYn6SeDoKdNv8JIWVF2XiHXdSXmDzrAuS2lMixcy+
 PMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764933196; x=1765537996;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S+WodKuxsAcIaiFl8vrv/vlH2xW1X4fsVn0hYeqa028=;
 b=lEmloODzGwBtBNagZ5JoPykkTt+6S8cebaNml+WKR/NZxXn6ZqgfG9VZsSFO4v5MwT
 rJujKVGJm1ggltR7HV/1tdr4rnxu02za0GtF56TXkEZLHX0QYWzCCGPbVy6kvuwDO3g4
 rto2XxVfKEsrLThWkQzbfGZehn4dMw/e1nUgDM9TAhjL/jUdIk9XfLSvuhbKjMTmqp4d
 Kvoo6HA7+FzZUN/BBmGWuuWLfv00ISFK1NHFN6FscBqN8jJTkdyvl6miirMniH3Zi2P4
 cDTzzin6gTXx6iUvupXf9XhjxEVNKG23jmMqxTV2xphgEvgRaMc9UtOhLD/NfhPBzR1q
 W+IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw+AWSO3y6nJDHf4UHOgliQnzymF541LzXDGVK5LWQBuiCrjKGU0KEAbEB0ZMpa6kIOl6FFQ0KovE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpUw6lNuiInATohkG2iMqIoWm7pQ5sKs5p9TevAihpNl26duSy
 V7OPHqyvu1WLSTos568ITCxxiALB9YmCDYN8GUpbDVH2EHe5eKWS+GvwiWM1C5PPQrM=
X-Gm-Gg: ASbGncu2XjstXDdsMCFRVTT6NwMe/hdM/j80GJiaWYdbOl5zXsxs6VzO2iFmEwnk/wk
 AflDuP83s2Dmvp4JfA7aiTMrf7Va2v3XI42a6/VQ3HgAvBSvpcsMzP0ZKHdFB7nabCSSdjrZoR9
 PDxhnjJZTW4ARWMKodpmRtID+vtCf36M/Sxy1jupvNWlO1uM3uggzrRVtNPT6AxX8xmsYAxCQt4
 D0DvRqIkulrI2q09DPUjVOIaiFDokXHiA50I0iMNQBrDt53pTLVd2aykJyiSurFS8C2VesnmDvi
 1/F8HYc7CJ1wSNBK/W9zw4SpPipXL1bt4TZGuUxmFzZq/XGDauWRsruAuy0cbgKrAa4ZxKriRV3
 9t3sPPUtKhKu5+071wSMGBFkZl0JU3CkeofHFF70KnsZKNDe4Kvrtwn5sZO1C+2D5z0kZEg5QRo
 2dMkWqQfOrT+xtdjFOmEc0BFvlYns+Te2J
X-Google-Smtp-Source: AGHT+IHWFWMng59b4w4U1rlU2HcWmiW9XpOp5yfe1/AglWE2uY9Sbb4A7lkyow1PeMTpYULiYugI0A==
X-Received: by 2002:a05:600c:458d:b0:479:2a09:9262 with SMTP id
 5b1f17b1804b1-4792aeea47amr82087805e9.9.1764933196049; 
 Fri, 05 Dec 2025 03:13:16 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d2226c5sm8398656f8f.23.2025.12.05.03.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 03:13:15 -0800 (PST)
Message-ID: <f33b29bb-72bd-4925-adb6-e8cd5267c142@ursulin.net>
Date: Fri, 5 Dec 2025 11:13:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i195: Fix format string truncation warning
To: Ard Biesheuvel <ardb@kernel.org>
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAMj1kXFLaOZMXsUsvrshkwhvJSWm3V_iZB3n1rga=Q6zwrVY_g@mail.gmail.com>
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


On 05/12/2025 10:48, Ard Biesheuvel wrote:
> On Sun, 9 Nov 2025 at 19:00, Ard Biesheuvel <ardb@kernel.org> wrote:
>>
>> On Sat, 8 Nov 2025 at 01:27, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>>
>>>
>>> On 07/11/2025 16:42, Ard Biesheuvel wrote:
>>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>>
>>>> GCC notices that the 16-byte uabi_name field could theoretically be too
>>>> small for the formatted string if the instance number exceeds 100.
>>>>
>>>> Given that there are apparently ABI concerns here, this is the minimal
>>>> fix that shuts up the compiler without changing the output or the
>>>> maximum length for existing values < 100.
>>>
>>> What would be those ABI concerns? I don't immediately see any.
>>>> drivers/gpu/drm/i915/intel_memory_region.c: In function ‘intel_memory_region_create’:
>>>> drivers/gpu/drm/i915/intel_memory_region.c:273:61: error: ‘%u’ directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Werror=format-truncation=]
>>>>     273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>>>>         |                                                             ^~
>>>> drivers/gpu/drm/i915/intel_memory_region.c:273:58: note: directive argument in the range [0, 65535]
>>>>     273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>>>>         |                                                          ^~~~~~
>>>> drivers/gpu/drm/i915/intel_memory_region.c:273:9: note: ‘snprintf’ output between 7 and 19 bytes into a destination of size 16
>>>>     273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>>>>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>     274 |                  intel_memory_type_str(type), instance);
>>>>         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>> ---
>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: intel-gfx@lists.freedesktop.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>>
>>>> This is unlikely to be the right fix, but sending a wrong patch is
>>>> usually a better way to elicit a response than just sending a bug
>>>> report.
>>>>
>>>>    drivers/gpu/drm/i915/intel_memory_region.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
>>>> index 59bd603e6deb..ad4afcf0c58a 100644
>>>> --- a/drivers/gpu/drm/i915/intel_memory_region.c
>>>> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
>>>> @@ -271,7 +271,7 @@ intel_memory_region_create(struct drm_i915_private *i915,
>>>>        mem->instance = instance;
>>>>
>>>>        snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
>>>> -              intel_memory_type_str(type), instance);
>>>> +              intel_memory_type_str(type), instance % 100);
>>> It's a theoretical issue only since there is no hardware with a double
>>> digit number of instances.
>>>
>>> But I guess much prettier fix would be to simply grow the buffer.
>>>
>>
> 
> OK, so something like
> 
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -72,7 +72,7 @@ struct intel_memory_region {
>          u16 instance;
>          enum intel_region_id id;
>          char name[16];
> -       char uabi_name[16];
> +       char uabi_name[20];
>          bool private; /* not for userspace */
> 
>          struct {

Yes please. There is only two of those objects at majority of systems, 
and 3-4 on a few discrete cards supported by i915, so no big deal to 
grow them a tiny bit.

>>> Also, hm, how come gcc does not find the mem->name vsnprintf from
>>> intel_memory_region_set_name?
>>>
>>
> 
> AFAICT, intel_memory_region_set_name() is never called with a format
> string that could produce more than 15/16 bytes of output.

Right, I reminded myself that the non-uabi visible name does not have 
the instance number in it.

Regards,

Tvrtko

