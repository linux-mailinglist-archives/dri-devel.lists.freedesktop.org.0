Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9844CD2182
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 23:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E762F10F0EC;
	Fri, 19 Dec 2025 22:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BfZlARGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F4310F0EC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 22:22:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E2DC460008;
 Fri, 19 Dec 2025 22:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCD1C4CEF1;
 Fri, 19 Dec 2025 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766182918;
 bh=FsqeszlxIHiTohzZngxRkVyLF51Apt1E+JyyqMd1yFE=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=BfZlARGAHPN0qekSR8SbUYz5e5FGLDRFtWswsHunHgQUq76yZFStl0MKmmdaSBSbb
 8j226H6+xgy54SqzvUCjzQ3bc+FMExKfSsBhpulCtCH3kzm3VOSL9YNdz4lTDl9sTP
 L0sqHNN+t0KTZRZEPsTCSfmI7CGvgktbhizWhLHw1o/nENDULPNP5fvpA+rbyL9Zgf
 JA0ZyoElHuvQRTghyYXwn6c68bK4wsm/gPcNvIHfdNcKd4WV2B/gG9pARAekDvJnsi
 co7TGJx7jUtnMxenfUxYDVFTpQnqrWSwjInLioJJXDYRAPXSxmn/xlgnvarAC8m1+W
 dLOpywftaZLvQ==
Message-ID: <3ead6685-a5d4-4113-923d-84bf8aee49b3@kernel.org>
Date: Fri, 19 Dec 2025 23:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kbuild: remove gcc's -Wtype-limits
From: Vincent Mailhol <mailhol@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218-remove_wtype-limits-v1-1-735417536787@kernel.org>
 <aURXpAwm-ITVlHMl@stanley.mountain>
 <480c3c06-7b3c-4150-b347-21057678f619@kernel.org>
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
In-Reply-To: <480c3c06-7b3c-4150-b347-21057678f619@kernel.org>
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

On 18/12/2025 at 23:31, Vincent Mailhol wrote:

(...)

> Concerning clang, here are the statistics:
> 
> 	$ make -s LLVM=1 CFLAGS_KERNEL="-Wtype-limits" 2>&1 | grep -o '\[-W\S*\]' | sort | uniq -c
> 	      2 [-Wtautological-type-limit-compare]
> 	     15 [-Wtautological-unsigned-enum-zero-compare]$ make -s LLVM=1 CFLAGS_KERNEL="-Wtype-limits"
> 
> (done on a linux v6.19-rc1 defconfig with clang v20.1.8)
> 
> Not so many warnings, at least, less than what I would have thought!
> 
> -Wtautological-unsigned-char-zero-compare and
> -Wtautological-unsigned-zero-compare gave zero findings. So those two
> can be enabled, I guess? I am still surprised that
> -Wtautological-unsigned-zero-compare gives nothing. I would have
> expected some kind of false positives on that one. No sure if I missed
> something here.

I was a bit worried of that -Wtautological-unsigned-zero-compare got
zero findings so I reran a build but this time on an allyesconfig
(minus CONFIG_WERROR):

	$ make -j8 -s LLVM=1 CFLAGS_KERNEL="-Wtype-limits" 2>&1 | grep -o '\[-W\S*\]' | sort | uniq -c
	     29 [-Wtautological-type-limit-compare]
	     55 [-Wtautological-unsigned-enum-zero-compare]
	     76 [-Wtautological-unsigned-zero-compare]

This is closer than expected. And looking at the findings,
-Wtautological-unsigned-zero-compare also warns on some sane code
which is just doing some range checks.

(...)

> In conclusion, I agree that we could enable three of clang's
> -Wtype-limits sub-warning. But this is not the scope of that series. I
> would rather prefer to have this as a separate series.

With this, I want to amend my conclusion. both
-Wtautological-unsigned-enum-zero-compare and
-Wtautological-unsigned-zero-compare should be kept disabled. The only
candidates are -Wtautological-type-limit-compare and
-Wtautological-unsigned-char-zero-compare.

-Wtautological-unsigned-char-zero-compare would need another study. It
seems that this warning is only triggered on platforms where char is
unsigned which explains why I did not see it when building on x86_64.

Well, I think I will stop this clang's -Wtype-limits study for the
moment. If anyone wants to continue the work please go ahead.


Yours sincerely,
Vincent Mailhol
