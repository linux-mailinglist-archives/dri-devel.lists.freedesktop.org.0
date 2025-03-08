Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF8A579C8
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 11:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EEA10E180;
	Sat,  8 Mar 2025 10:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="cAUOkt0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C2F10E20C;
 Sat,  8 Mar 2025 10:36:21 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id qrXKto1FVACDNqrXPtbz9o; Sat, 08 Mar 2025 11:36:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741430178;
 bh=3r6CNq7c1UF1VpR9t/DNQ2vWkrvLhXco71nuRKB37ek=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=cAUOkt0XhKkPVCP7sPPdl6eDa5wXICtIPMZMYju5W72dV5z2SOjwLCcfuPLWAHk9n
 2gTYHZXd0R4sI8KMvK3SXBwfJCDIS1b1K6HKf8bMbeNqk9FmIL5tMnOi1VgF9PRT3Y
 nCpkIQgcXFRAYCNVi89hpt91TV94UknqNVbC2yysaRIeyZYrBIwrFnoCKROpKJ1+Ux
 A4s6V8kF4TjX7zNe/m+EmBbeqY6E1yA7+p9nFMbg5UbUznxwaH978S2CA0bk2LuW3z
 SW1iyANPCxfEo3SlDMTXHUprAnZ7bBGfVnUTD7p1WZniJ4R7/r1qpZ9IzolDgenoHP
 8p0zl3mLtMCvQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 Mar 2025 11:36:18 +0100
X-ME-IP: 124.33.176.97
Message-ID: <b34f0fbe-43e2-41c0-b47d-4c026432272b@wanadoo.fr>
Date: Sat, 8 Mar 2025 19:36:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/i915: Convert REG_GENMASK*() to fixed-width
 GENMASK_U*()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-4-f59315e73c29@wanadoo.fr>
 <Z8syw47cN0eEW7lO@smile.fi.intel.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <Z8syw47cN0eEW7lO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
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

On 08/03/2025 at 02:54, Andy Shevchenko wrote:
> On Sat, Mar 08, 2025 at 01:48:51AM +0900, Vincent Mailhol via B4 Relay wrote:
>> From: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Now that include/linux/bits.h implements fixed-width GENMASK_U*(), use
>> them to implement the i915/xe specific macros. Converting each driver
>> to use the generic macros are left for later, when/if other
>> driver-specific macros are also generalized.
> 
> ...
> 
>> +/*
>> + * Wrappers over the generic BIT_* and GENMASK_* implementations,
> 
> BIT_U*(), GENMASK_U*() as far as I can see.
> 
> Also "...generic fixed-width...".

Ack. I will address both in next version.


Yours sincerely,
Vincent Mailhol

