Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05FCCEFE66
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 12:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C528F10E33C;
	Sat,  3 Jan 2026 11:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gtpV5Lwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312D610E33D
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 11:10:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B791744024;
 Sat,  3 Jan 2026 11:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06867C113D0;
 Sat,  3 Jan 2026 11:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767438654;
 bh=jp68MVC+P0p1UuoNYPzbcHr6LPN+K8JU4atA5jieR/w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gtpV5LwhGhrXdfl38aFrNPwsxttqYVKBjkVzJbHCFG01awWWliOKdheB+Hf4xt7fP
 CqOlafebvGWjoA6tZDI08FKuuXkfL+AyvO7futZye0fOTuv88/W9b/Cjf9m9PeBjnE
 0Y5UyRQJNX/BfkOSgBEtvfZdc7kcW8KtvxFeHomIcF/41xQ6Is24RoP0H5cpmmXjLg
 tCnqWUmp8NCwGom++XAcTH3W+7E7cpPBpwR0QSWn6Pmmz4+idRPaJfAZZc4RCc4/Vn
 FGfbl0KZ8k5SS7AUR0TgRmWtB0cXQOT+nVv4HzV7mEPLv4qCBc4PMVk8qUy2CO9Rtk
 C51zVShkrX+QA==
Message-ID: <c84557e6-aa92-42e9-8768-e246676ec1e9@kernel.org>
Date: Sat, 3 Jan 2026 12:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] overflow: Update is_non_negative() and is_negative()
 comment
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
 <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
 <b549e430-5623-4c60-acb1-4b5e095ae870@kernel.org>
 <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
 <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
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

On 03/01/2026 at 11:02, Dan Carpenter wrote:
> Thanks Randy, for sending this to me.  I'm on the sparse list, but
> I've been on vacation and haven't caught up with my email. 

Welcome back, hope you enjoyed your holidays!

>I can easily silence this in Smatch.

Thanks. I ran this locally, I can confirm that this silences the
warning. So:

Tested-by: Vincent Mailhol <mailhol@kernel.org>

> diff --git a/check_unsigned_lt_zero.c b/check_unsigned_lt_zero.c
> index bfeb3261f91d..ac3e650704ce 100644
> --- a/check_unsigned_lt_zero.c
> +++ b/check_unsigned_lt_zero.c
> @@ -105,7 +105,8 @@ static bool is_allowed_zero(struct expression *expr)
>  	    strcmp(macro, "STRTO_H") == 0 ||
>  	    strcmp(macro, "SUB_EXTEND_USTAT") == 0 ||
>  	    strcmp(macro, "TEST_CASTABLE_TO_TYPE_VAR") == 0 ||
> -	    strcmp(macro, "TEST_ONE_SHIFT") == 0)
> +	    strcmp(macro, "TEST_ONE_SHIFT") == 0 ||
> +	    strcmp(macro, "check_shl_overflow") == 0)

But, for the long term, wouldn't it better to just ignore all the code
coming from macro extensions instead of maintaining this allow-list?

>  		return true;
>  	return false;
>  }


Yours sincerely,
Vincent Mailhol

