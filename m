Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E453A68D73
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 14:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E0210E4FB;
	Wed, 19 Mar 2025 13:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RWhqGVmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AEE10E4FB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 13:11:31 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-225b5448519so129846235ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742389891; x=1742994691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=/CKiUxIsp+RiAjt+4CW+mXa9kqAZnMY4uY5XJZebADk=;
 b=RWhqGVmCCH3I97kyNcgbGsKLgyFp4SjKTm4zJ25Ci6MlfWW6BJxP8Cctt1zHPKpN7+
 Rza5UCNlWxv1MiHjbktdN/OW0pE2Xvj5E8CxmJocabRV3QGJYzSz8fnULAbw4eXTUQ/z
 hgklurTo/a8o4lZYBjmWVO2v8/0VpBSne9FFFk5FOVJ2Mw0VJxbLEGginXGdy+Gd2uvg
 IJIYWCugC8cupp3wzKliKNHwVyzVcKRJuZkIvbrbwrRzfV0kKJajhMwkbmrGsTl+7BE8
 qwugRd5BNyz2aErnkCQjHK8XMv89AHTG9TkboH7ZbPxK2qbiKyEWAbwO//2zMy6LbHrk
 HEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742389891; x=1742994691;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/CKiUxIsp+RiAjt+4CW+mXa9kqAZnMY4uY5XJZebADk=;
 b=eNwWgJ7Ir5TVOwCy8lcI0KSepYHB5hyIoLgrlwg3o+xOvtBNPZE5s7GrGU0D5qpg6g
 sijoa17baSuHhkikGsCRu82QRLcaYSQ8CFgB5aNPBedgCQsToV4wp6EPemhSmTHIu/tB
 kWVmwWx2kcrUrN4CRs9ICARkkIFFPSEbapwXWf6y3TVS+tRcdBe6ztor2wRllYwv4bRz
 gsTGzSdTMaXZpUTqUHvCBRZrlZvyYbl4PI9dq1j5XrVAodjfFRsaRl6af2w8elJfZbd6
 w8XQtY53pNn+jb6uhh2vRmd/NDjXgwKNZHmSvPldkvwmUJ//PBeg9Q6mcrcC9Nq+Vjlr
 EzHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlGBcTAxWDtqdmVUNsAJ4I2a+a9d9eI9tLZ+xbLlv1VfMcgnk48xWvRt/gWda3YoENArew9GeL1LQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOtTc3wfdnKDSZ6uvkfIbc+semRACoAe46niStKa0eCsUyaKP4
 Q5UA6QDppldRicmcwDvFX709cocmceNa/PwbwKKjtqM8jPP5Dj2L
X-Gm-Gg: ASbGnct65AJkSj4wKEzKm7dSInPxXmb5FZNdbHUDOcpICdTvrMpxzQ50WKV53t/4ivj
 LmwvKEOb4Oe7qieTNxw1YKXHvDjEMjmh9cp4JH7sXCWhJXeG3elgUdpd93mGUvPK7pwuf70bsEC
 TqGvKB311JklF4RMPnBIonlHUY7C6KVDxGytMZrLPGbYeM7UWsektS6YMiA9SzNW8O8gOuqS7tw
 ND2J5Lul2ELSsQ4mXTt8gHJIAsU3r+CskuzPTVoD4ZRv13zJIsnvTK5WbfdwXJUByhLY6DXXAeY
 FGfR2pEqNpjBXxtu+zXBFUJ53VJGK6J+Kkekl4kkC3yg46hWbPSImqAZTBJM9FMPmIMOVYVkFWC
 92HypQBLkV6AjP+2y3g==
X-Google-Smtp-Source: AGHT+IEioVgtuSEfAYuAE8IAAYiDjsUn61PAgb/S9UQkSNM/19B6DRuSeEADVUHZxIm2XFZUlNalCg==
X-Received: by 2002:a05:6a21:6e48:b0:1f5:839e:ece8 with SMTP id
 adf61e73a8af0-1fbeb1854bcmr4348609637.2.1742389891204; 
 Wed, 19 Mar 2025 06:11:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371157369bsm11469895b3a.75.2025.03.19.06.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 06:11:30 -0700 (PDT)
Message-ID: <9030a298-fcb6-48ea-a941-ad6916bf9fa7@roeck-us.net>
Date: Wed, 19 Mar 2025 06:11:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Will Deacon <will@kernel.org>, Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
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

On 3/19/25 01:05, Christophe Leroy wrote:
> 
> 
> Le 18/03/2025 à 16:59, Will Deacon a écrit :
>> On Thu, Mar 13, 2025 at 05:40:59PM +0100, Alessandro Carminati wrote:
>>> On Thu, Mar 13, 2025 at 1:25 PM Will Deacon <will@kernel.org> wrote:
>>>>
>>>> On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
>>>>> diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
>>>>> index 28be048db3f6..044c5e24a17d 100644
>>>>> --- a/arch/arm64/include/asm/bug.h
>>>>> +++ b/arch/arm64/include/asm/bug.h
>>>>> @@ -11,8 +11,14 @@
>>>>>
>>>>>   #include <asm/asm-bug.h>
>>>>>
>>>>> +#ifdef HAVE_BUG_FUNCTION
>>>>> +# define __BUG_FUNC  __func__
>>>>> +#else
>>>>> +# define __BUG_FUNC  NULL
>>>>> +#endif
>>>>> +
>>>>>   #define __BUG_FLAGS(flags)                           \
>>>>> -     asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
>>>>> +     asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
>>>>
>>>> Why is 'i' the right asm constraint to use here? It seems a bit odd to
>>>> use that for a pointer.
>>>
>>> I received this code as legacy from a previous version.
>>> In my review, I considered the case when HAVE_BUG_FUNCTION is defined:
>>> Here, __BUG_FUNC is defined as __func__, which is the name of the
>>> current function as a string literal.
>>> Using the constraint "i" seems appropriate to me in this case.
>>>
>>> However, when HAVE_BUG_FUNCTION is not defined:
>>> __BUG_FUNC is defined as NULL. Initially, I considered it literal 0,
>>> but after investigating your concern, I found:
>>>
>>> ```
>>> $ echo -E "#include <stdio.h>\n#include <stddef.h>\nint main()
>>> {\nreturn 0;\n}" | aarch64-linux-gnu-gcc -E -dM - | grep NULL
>>> #define NULL ((void *)0)
>>> ```
>>>
>>> I realized that NULL is actually a pointer that is not a link time
>>> symbol, and using the "i" constraint with NULL may result in undefined
>>> behavior.
>>>
>>> Would the following alternative definition for __BUG_FUNC be more convincing?
>>>
>>> ```
>>> #ifdef HAVE_BUG_FUNCTION
>>>      #define __BUG_FUNC __func__
>>> #else
>>>      #define __BUG_FUNC (uintptr_t)0
>>> #endif
>>> ```
>>> Let me know your thoughts.
>>
>> Thanks for the analysis; I hadn't noticed this specific issue, it just
>> smelled a bit fishy. Anyway, the diff above looks better, thanks.
> 
> That propably deserves a comment.
> 
> Doesn't sparse and/or checkpatch complain about 0 being used in lieu of NULL ?
> 

__BUG_FUNC is only used as parameter to asm code, not as pointer.

 From the diff:

-                    : : "i" (__FILE__), "i" (__LINE__),                \
+                    : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\

The use is quite similar to __FILE__ and __LINE__. It might even be possible
and appropriate to just define __BUG_FUNC as 0 if HAVE_BUG_FUNCTION is not defined.

Guenter

