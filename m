Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED77386A388
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 00:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050DC10E9AE;
	Tue, 27 Feb 2024 23:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bi1OtN8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E4E10E752
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 23:25:01 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3651ee59db4so1083185ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709076300; x=1709681100;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wvIY3k15tE0HcJm4Yzmaclwism7ZYGDgLaZ5F1IOoes=;
 b=Bi1OtN8INlkdVTSjEjQdkc8psGelgn6Zmfr+wfYMQTn5zA99aVdfFv03Tqu05U/5Qc
 TuAES6c+svcNPVUfvlWDuzsQntnCaq9NkqNq9/9GET1WYhtSKQy7WLhveeWmJWugxqsI
 o5tMW8VEsbv05uoA6e4NSOw7AcHZhfl6EvtzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709076300; x=1709681100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wvIY3k15tE0HcJm4Yzmaclwism7ZYGDgLaZ5F1IOoes=;
 b=uKVZm+5eLJSu9+OhA2Ub8fsxAjw03wMbwiwlKM7SSrTaFrhecK/sgHJ6E+kSQXzCC9
 XG9TMyoBXXoczEDvUpTrbc3oB6MzKylc7Lp8paG9jTzSWM9q5QpbxKVynB7d6mN4QtpU
 cHeSbUOOoZGw05ljpN9BTXQRxzWYDgwnjWX4awMjyVEo47Lc6bJNq2Pq2bXMkmPiCa/v
 gcdWGTkuN4OjtVFqTvs/T6KxtiCnrsZGRk+b2k7JQy/yXjueD9Pt+JWjBhxfJM8ojFFM
 C97LkPuUy7RzsoplX907nXYaqQ1LI5eEI2CD2G1fYprklC8Ij+Xq2y9Z/o+XAufEY/bt
 RMgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8QumgYJ6bKmV8+T79XEnNUfkodrJBRvmOYbUsc9z3pejWoY7RWI9UOxqFuY9T5PLYS1i1nyqCL2kbRUnRETxR6/364XPQdxyXNQTUZK9N
X-Gm-Message-State: AOJu0YwgoRAQCproJegtiA1QIlJuYu4tvPOhphGlTD0Xzv1lCaJy/Esw
 QXPsKQOtR80TpAa1oWKeA4NU65rzH+akIvyn/3eo2ORnsKcM9Dft9t/V64FBGKg=
X-Google-Smtp-Source: AGHT+IH7h7vSS9kJq/Hsu1hvzmsVL1Hoh2ZLb1ktpG8OlizpzOEJEClNfjMsljDl+J9cw2Cp6ZyxBA==
X-Received: by 2002:a05:6602:38d:b0:7c7:8933:2fec with SMTP id
 f13-20020a056602038d00b007c789332fecmr10945119iov.2.1709076300126; 
 Tue, 27 Feb 2024 15:25:00 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a02cf0a000000b004743021012asm1964451jar.2.2024.02.27.15.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 15:24:59 -0800 (PST)
Message-ID: <ba023321-dd6e-4163-8924-092c87aa17fc@linuxfoundation.org>
Date: Tue, 27 Feb 2024 16:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in
 KUnit tests
Content-Language: en-US
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Justin Stitt <justinstitt@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-8-davidgow@google.com>
 <20240221212952.bqw4rdz2i2yf3now@google.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240221212952.bqw4rdz2i2yf3now@google.com>
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

On 2/21/24 14:29, Justin Stitt wrote:
> Hi,
> 
> On Wed, Feb 21, 2024 at 05:27:20PM +0800, David Gow wrote:
>> The drm_buddy_test's alloc_contiguous test used a u64 for the page size,
>> which was then updated to be an 'unsigned long' to avoid 64-bit
>> multiplication division helpers.
>>
>> However, the variable is logged by some KUNIT_ASSERT_EQ_MSG() using the
>> '%d' or '%llu' format specifiers, the former of which is always wrong,
>> and the latter is no longer correct now that ps is no longer a u64. Fix
>> these to all use '%lu'.
>>
>> Also, drm_mm_test calls KUNIT_FAIL() with an empty string as the
>> message. gcc warns if a printf format string is empty (apparently), so
> 
> clang does too; under -Wformat-zero-length
> 
>> give these some more detailed error messages, which should be more
>> useful anyway.
>>
>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
>> Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
>> Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
>> Signed-off-by: David Gow <davidgow@google.com>
> 
> Reviewed-by: Justin Stitt <justinstitt@google.com>

David,

Please send this on top of Linux 6.9-rc6 - this one doesn't
apply as is due to conflict between this one and fca7526b7d89

I think if we can fix this here - we won't problems during pull
request merge.

thanks,
-- Shuah


