Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C91A6DF81
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FA0899B3;
	Mon, 24 Mar 2025 16:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="inZ+K/0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-68.smtpout.orange.fr [193.252.22.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A23D899B3;
 Mon, 24 Mar 2025 16:23:37 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id wkaBtZDD8cvxXwkaFtVg8z; Mon, 24 Mar 2025 17:23:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1742833414;
 bh=P9nD5PsBLzgHZd2DYjYHZ+C8TI1hL0ZPCCvHPL1SFBM=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=inZ+K/0EgTl/soIXsWxEWQb6xdeBc/Rx5cqjYRIjKiweIln1j7GhCIAOlLVAEiJee
 PUhFCb7py0OhvcDzXafVXIZPpWvSHdN5p/sD0e6oKJbTYo22HXnonZr2PacIYvdEBp
 VfQ41VxsX1xLT2ko2TJ4x1lt+j0S5NuyBUUA7Pua8LzN+x4nkFGBvJiNU6Et1xrXYB
 USm0ZcLJ9so+g0k949Zb/sgT0WBSpGBhXgQarJdd8L1takI4dBRSuvyHKPwqqdWW0v
 WOgdyB5J+GZy5ef+Vyigyc4/eUySAkhk99I3KQymFSxkdWILUPG9VDePy98WL+cXcL
 5UuNStq0YyJKQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Mar 2025 17:23:34 +0100
X-ME-IP: 124.33.176.97
Message-ID: <7e114fdb-0340-4a3c-956f-b26c9373041d@wanadoo.fr>
Date: Tue, 25 Mar 2025 01:23:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] bits: Fixed-type GENMASK_U*() and BIT_U*()
To: Yury Norov <yury.norov@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr>
 <Z-FsJPA1aq7KyTlm@thinkpad>
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
In-Reply-To: <Z-FsJPA1aq7KyTlm@thinkpad>
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

On 24/03/2025 at 23:28, Yury Norov wrote:
> On Sat, Mar 22, 2025 at 06:23:11PM +0900, Vincent Mailhol via B4 Relay wrote:
>> Introduce some fixed width variant of the GENMASK() and the BIT()
>> macros in bits.h. Note that the main goal is not to get the correct
>> type, but rather to enforce more checks at compile time. For example:
> 
> You say this, and then typecast both BIT and GENMASK. This may confuse
> readers. Maybe add few words about promotion rules in C standard, or
> just drop this note entirely? Doesn't require new submission, of
> course.

I do not want to into this level of details in the cover letter, so I
will remove. Instead, I can add below paragraph to the "bits: introduce
fixed-type GENMASK_U*()" patch:

  The result is casted to the corresponding fixed width type. For
  example, GENMASK_U8() returns an u8. Note that because of the C
  promotion rules, GENMASK_U8() and GENMASK_U16() will immediately be
  promoted to int if used in an expression. Regardless, the main goal is
  not to get the correct type, but rather to enforce more checks at
  compile time.

I staged this change in the v8 together with the other nitpicks from
Andy. If you want that v8, let me know, it is ready. If you are happy
enough with the v7 (and if it doesn't receive more comments), then go
with it!


Yours sincerely,
Vincent Mailhol

