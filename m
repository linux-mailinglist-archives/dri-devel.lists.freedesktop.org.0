Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F960CA2150
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 02:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7D010E835;
	Thu,  4 Dec 2025 01:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mO3QnOkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B3910E835
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 01:06:04 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-29ba9249e9dso5076305ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 17:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764810364; x=1765415164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=EzOSSiV7Yhz1VLoL1bmBqMJ2ioy7YsHedLMDwqYhF2o=;
 b=mO3QnOkCtsDC5wwrUGDn/l55DWYZM4xo8vduqKyR4lFIXvFoVMl7EorhvXd2j+4Eth
 9KXMvUEGeC+0XV5wGxFX/5VbB8lxHGb7MnxuYRw1/750RjqH9S1vvRruMnMLCJqb2LhF
 hutHxXPxYQZRI/aQiZeIpAd0KLTvKgZezBRoabwoMTY66xAB/LdXubOUirTuB9qkT1uG
 oDuGmopfll0SJc7VXCWTCmQ9P+QpJC7keTxQ9Oqda20N2Xgi5oAOlIC1Z1Bnym0pm0gE
 34QJaMIsZZtdno4Uhd0NrGpVin5yBRkfqsxA7MAysm3GymRHuNrICCaEbXaih3sId98h
 3PEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764810364; x=1765415164;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzOSSiV7Yhz1VLoL1bmBqMJ2ioy7YsHedLMDwqYhF2o=;
 b=WmaFCnMidHCFWtzLHGaOSu70L4C34tDYY7PZC/ANQNQ7yapoJdmMHUV6onMTnVkUbw
 9x0pmOSh86B1T0vTR991AGh/N3hea9O8+BBg75cv+hM3eWttJKnkhEYJ2GMoykvBNF8B
 wwuBWj5wfSKzQYFBjRvy7kAfTNn13LpWHjSHNsYn39KLtcXJqVYv7gyAxqauksk+RpLk
 KuItdnBS9UMO5kuOWFR0lf3TNec4+01TScVIYh1JbfEUVktqCq4L26JZD8jnd0u45iRB
 uu6OPUGhvXPhUEJx3Ymlp/HiV+3QUkkG+cDkvTl0QcaIbctvTI//eATUzVd80r7xTfeE
 W8aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8+wnIeTcqm5/eOf/9t4fKEhhtSpmX9Bf/hXHkQvAiokVXGjqh3cPz8+YHMIh1L08FN4Eq0+bYm2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnjlTAKcvdCcvfJx6TJaRyJ3uvFgsAjcooU6VngXPnKw7EZH35
 TKl5dkvdCH+uVuWFQPWrhgsQxZlqct5wA7KVWINnVJ7WtV2VeAB3pTQB
X-Gm-Gg: ASbGncvxFxHbnjVfUMIdRQRR95jecHBcMtB0tXEYZBOAOyZzSugotW9ABqe5NpliZLn
 1DoKmLoVcRruoBG1kRxJMEqU+JcYFwdr/XY1YC2KNSLEJfqvHcCaGuohR98hQy53MPwH7Rqpa0y
 1E6ZIzFFnR2gb4kJl0dhviHlYLXZqoTykEm9oSF6qXjhUqrXhzOS20l6D2X7pNJpFOAYbsohv2w
 VU04E1QF+1xuGOYlR0wwKvnZ7kaO0loOtRTb4TSETltVVB4XFXeK4/vF82OX/NDgDH+AEH3kA71
 JAgPXb3qprAtGs7sjlktpYTReN8o0b5AehF5nVZr0Eq4CZtQTpHHQpWE0XF89BxVe6/dRe0Qt+S
 jOXH2GeUN9rdm8A1X//ytIRbMjQ2przXIqofvMUwR0LOx5ycMOrFQiMrY8jhrz1lnOaYkMmkPDp
 Y4bc1Auanv8JxfFiy1G44hM7ThdtgszH887Q6gnW309Vi9qj76gtX9/D3pzLg=
X-Google-Smtp-Source: AGHT+IHSLEKliRLDcG08Wx24wMpg/IgQMzcEAuyIzxMAj6TBUuLi78Ba74L4p53Yn4HCEUGN4LqqHA==
X-Received: by 2002:a17:903:24f:b0:298:3e3a:ae6 with SMTP id
 d9443c01a7336-29d68430be8mr49557205ad.48.1764810363982; 
 Wed, 03 Dec 2025 17:06:03 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae99f1cfsm1096235ad.55.2025.12.03.17.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 17:06:03 -0800 (PST)
Message-ID: <1f31b86d-283c-4878-92d0-ab90aed0c58d@roeck-us.net>
Date: Wed, 3 Dec 2025 17:06:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.18 amdgpu build error
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
 <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
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

On 12/3/25 14:16, Shuah Khan wrote:
> On 12/2/25 14:23, Guenter Roeck wrote:
>> On 12/2/25 13:01, Shuah Khan wrote:
>>> On 12/1/25 19:31, Guenter Roeck wrote:
>>>> On Mon, Dec 01, 2025 at 03:17:49PM -0700, Shuah Khan wrote:
>>>>> Hi Alex,
>>>>>
>>>>> I am seeing the following make error on Linux 6.18.
>>>>> I started seeing build failures since rc7 and rc6
>>>>> build was just fine on the same config file.
>>>>>
>>>>> LD [M]  drivers/gpu/drm/amd/amdgpu/amdgpu.o
>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool: elf_init_reloc: .rela.orc_unwind_ip: reloc 39935 already initialized!
>>>>> make[6]: *** [scripts/Makefile.build:503: drivers/gpu/drm/amd/amdgpu/amdgpu.o] Error 255
>>>>> make[6]: *** Deleting file 'drivers/gpu/drm/amd/amdgpu/amdgpu.o'
>>>>> make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/amd/amdgpu] Error 2
>>>>> make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
>>>>> make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
>>>>> make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
>>>>> make[1]: *** [/linux/linux_6.18/Makefile:2010: .] Error 2
>>>>> make: *** [Makefile:248: __sub-make] Error 2
>>>>>
>>>>> I tried "make clean" and "make distclean" just in case, still see
>>>>> the same error.
>>>>>
>>>>
>>>> My test system does not report any problems. What is the configuration
>>>> and compiler ?
>>>>
>>>
>>> My one test system didn't report any problems. The other one did.
>>> I am using gcc and the config is the same as the one used to build
>>> 6.18-rc6 with no issues.
>>>
>>> I will keep digging to find what's wrong on my system.
>>>
>>> gcc version 14.2.0 (Debian 14.2.0-19)
>>>
>>
>> Interesting. That reminds me ... I used to have that kind of machine specific
>> problems when building with CONFIG_RANDSTRUCT enabled. I worked around it
>> by using gcc builds with plugin support disabled. In my case, there was
>> nothing wrong with the system, just that each system has a slightly different
>> hardware configuration which somehow influenced structure randomization, even
>> across "make clean/distclean".
>>
> 
> CONFIG_RANDSTRUCT is disabled and so are the GCC_PLUGINS in my config.

I guess that would have been too easy...

> I am also seeing issues with cloning kernel.org repos on my system after
> a recent update:
> 
> remote: Enumerating objects: 11177736, done.
> remote: Counting objects: 100% (1231/1231), done.
> remote: Compressing objects: 100% (624/624), done.
> remote: Total 11177736 (delta 855), reused 781 (delta 606), pack-reused 11176505 (from 1)
> Receiving objects: 100% (11177736/11177736), 3.01 GiB | 7.10 MiB/s, done.
> Resolving deltas: 100% (9198323/9198323), done.
> fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
> fatal: fetch-pack: invalid index-pack output
> 

Outch, that hurts. Hope your file system isn't corrupted.

Guenter

