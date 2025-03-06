Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA73A5527E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29DD10E8E1;
	Thu,  6 Mar 2025 17:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Z6FfQSYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765BD10EA30;
 Thu,  6 Mar 2025 17:10:43 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id qEjstfRGtQBhYqEjytwcmv; Thu, 06 Mar 2025 18:10:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741281042;
 bh=AcXvdcwkshwhiYBYbISTdU+fXgHvnVIWLoGFLaK/LSY=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Z6FfQSYHH1Ol08L7ET9tSXK7Mo2lZdrbvwMt4TCu04RDpe1dOq/w+TOzlQRT7/MZa
 bC5IUve/j4baW3dFxfr0gWJqCFLqGmfwkgN9roksYbWqz2h67lDcu9IZeO4xJuTRdG
 uSybdgWW2hHmJT1j81A7IgRe4RwP9liz+KGUTrTDv73eDTpLwfUfGW8Q1Y7aFCFcRV
 kU5a9EsxhrKDlTeS+NZHwHvqM9Rh+YoYUHo32P9bEO0T2URNiYraQF0lrRoFRq/Nay
 CPSDCe4uJfBJbyCMtcEj+8oljeFN/nhj2uWepsE/uM+WDp9FC/wBiOsfbUUXLgzgGj
 Wo4Pmh8fVkxSw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Mar 2025 18:10:42 +0100
X-ME-IP: 124.33.176.97
Message-ID: <f15eac8c-567c-4ae5-bf9b-bb3964c83846@wanadoo.fr>
Date: Fri, 7 Mar 2025 02:10:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>,
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
 <fao7tp2y66f7nuep4nl6kz5zenfpzswp3hwqiw325uitgu6u6u@7dipwr3vjui7>
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
In-Reply-To: <fao7tp2y66f7nuep4nl6kz5zenfpzswp3hwqiw325uitgu6u6u@7dipwr3vjui7>
Content-Type: text/plain; charset=UTF-8
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

On 06/03/2025 at 23:34, Lucas De Marchi wrote:
> On Thu, Mar 06, 2025 at 08:29:52PM +0900, Vincent Mailhol via B4 Relay
> wrote:

(...)

> it seems we now have 1 inconsistency that we comment why
> GENMASK_U128() is not available in asm, but we don't comment why
> GENMASK_INPUT_CHECK() is not available there. Maybe move this comment on
> top of GENMASK_INPUT_CHECK().

I will restore the comment in v6 and put it next to the asm definition,
c.f. my reply to Andy.

> Anyway,
> 
>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Is this only valid for the first patch or for the full series? If this
is for the full series, would you mind replying to the cover letter with
your review tag?

> thanks for picking up this series.

You are welcome!

> Lucas De Marchi

(...)

Yours sincerely,
Vincent Mailhol

