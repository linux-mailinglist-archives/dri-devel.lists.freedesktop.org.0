Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B0ECCDD08
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F7A10E3E0;
	Thu, 18 Dec 2025 22:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LQ4S7jWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1039610E3E0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 22:31:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C80DB43F04;
 Thu, 18 Dec 2025 22:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB013C4CEFB;
 Thu, 18 Dec 2025 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766097107;
 bh=own/YW+jwQswxII/qxW2HPNWs6Q2EnHJVVXWsC138hA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=LQ4S7jWA2JU3Q4ZOvQsY6EzobdghyZAR6fbE374ejTiDLOvaHBM2/aHcHBBUFgPtH
 L4zOEXINKTQ9UokTKcZeyVj1LADNAMaXKgCqOjHqznsTS3f0mpDvTHZDvS+sXUlqAX
 A3t1u6iYasV0sB/8JtOaNsSzOQC8U8St1JIkTddw8MdylBhDK2yOntlFn4CvTcM9Kz
 JbW/TB1rf6C9rOU1bSaSk9wkxHtsbBk/LuiQn7PS+fkAuGkcqtz1qDDQ8+QzkAbHOC
 SSNP7W+3k1qz75yrbWB8PK1+CXIJY9S30KOBO5qpr8H+Crboe/KyLq+amVdWHTRrZS
 1QfN7svbNc6wA==
Message-ID: <480c3c06-7b3c-4150-b347-21057678f619@kernel.org>
Date: Thu, 18 Dec 2025 23:31:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vincent Mailhol <mailhol@kernel.org>
Subject: Re: [PATCH 1/2] kbuild: remove gcc's -Wtype-limits
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
In-Reply-To: <aURXpAwm-ITVlHMl@stanley.mountain>
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

Hi Dan,

On 18/12/2025 at 20:36, Dan Carpenter wrote:
> On Thu, Dec 18, 2025 at 07:50:01PM +0100, Vincent Mailhol wrote:

(...)

>> With this, remove gcc's -Wtype-limits. People who still want to catch
>> incorrect comparisons between unsigned integers and zero can now use
>> sparse instead.
>>
>> On a side note, clang also has a -Wtype-limits warning but:
>>
>>   * it is not enabled in the kernel at the moment because, contrary to
>>     gcc, clang did not include it under -Wextra.
>>
>>   * it does not warn if the code results from a macro expansion. So,
>>     if activated, it would not cause as much spam as gcc does.
>>
>>   * -Wtype-limits is split into four sub-warnings [3] meaning that if
>>     it were to be activated, we could select which one to keep.
>>
> 
> Sounds good.  I like your Sparse check.

Does it mean I have your Reviewed-by?

> Maybe we should enable the Sparse checking as well because it sounds
> like they are doing a lot of things right.

I am not sure to understand what do you mean by "enable the Sparse checking"?
The new sparse check I introduced is on by default.

> I think Smatch catches the
> same bugs that Clang would but it would be good to have multiple
> implementations.  The -Wtautological-unsigned-enum-zero-compare trips
> people up because they aren't necessarily expecting enums to be
> unsigned.

I do not know enough about Smatch, I will let you judge on that one.


Concerning clang, here are the statistics:

	$ make -s LLVM=1 CFLAGS_KERNEL="-Wtype-limits" 2>&1 | grep -o '\[-W\S*\]' | sort | uniq -c
	      2 [-Wtautological-type-limit-compare]
	     15 [-Wtautological-unsigned-enum-zero-compare]$ make -s LLVM=1 CFLAGS_KERNEL="-Wtype-limits"

(done on a linux v6.19-rc1 defconfig with clang v20.1.8)

Not so many warnings, at least, less than what I would have thought!

-Wtautological-unsigned-char-zero-compare and
-Wtautological-unsigned-zero-compare gave zero findings. So those two
can be enabled, I guess? I am still surprised that
-Wtautological-unsigned-zero-compare gives nothing. I would have
expected some kind of false positives on that one. No sure if I missed
something here.


The two -Wtautological-type-limit-compare are:

	fs/libfs.c:1640:20: warning: result of comparison 'u64' (aka 'unsigned long long') > 18446744073709551615 is always false [-Wtautological-type-limit-compare]
	 1640 |             (last_fs_page > (pgoff_t)(~0ULL))) {
	      |              ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
	1 warning generated.
	block/ioctl.c:765:29: warning: result of comparison 'sector_t' (aka 'unsigned long long') > 18446744073709551615 is always false [-Wtautological-type-limit-compare]
	  765 |                 if (bdev_nr_sectors(bdev) > ~0UL)
	      |                     ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~
	1 warning generated.

If I got it correctly, those checks are just meant for the case where
unsigned long are 32 bits.

Because clang does not warn when the code comes from a macro
expansion, a way to silent these would be to use:

	(last_fs_page > type_max(pgoff_t))

in fs/libfs.c and:

	if (bdev_nr_sectors(bdev) > ULONG_MAX)

in block/ioctl.c.

Well, none of those findings were incorrect to begin with, but
arguably, the code readability can be improved.

So, I would say why not for -Wtautological-type-limit-compare.


Concerning the -Wtautological-unsigned-enum-zero-compare, here is a
representative finding:

	drivers/video/hdmi.c:1099:20: warning: result of comparison of unsigned enum expression < 0 is always false [-Wtautological-unsigned-enum-zero-compare]
	 1099 |         if (active_aspect < 0 || active_aspect > 0xf)
	      |             ~~~~~~~~~~~~~ ^ ~

(all the other 14 findings follow the same pattern).

Here, the code just want to check that a value is in range. This is
the same logic as gcc's -Wtype-limits: something we do *not* want.

So -Wtautological-unsigned-enum-zero-compare will stay disabled.

In conclusion, I agree that we could enable three of clang's
-Wtype-limits sub-warning. But this is not the scope of that series. I
would rather prefer to have this as a separate series.


Yours sincerely,
Vincent Mailhol
