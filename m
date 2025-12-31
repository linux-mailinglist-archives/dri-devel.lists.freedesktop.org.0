Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121CCCEB654
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 07:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC42410E97D;
	Wed, 31 Dec 2025 06:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ntXMmUJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B264010E97D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 06:46:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A2EB60008;
 Wed, 31 Dec 2025 06:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3916C113D0;
 Wed, 31 Dec 2025 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767163605;
 bh=QpQpiIjMgAqmAOmtydj8BNOPhOz9nWYymZ8gOyeJv+s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ntXMmUJAxO5H8srGF4tNdHgo0lFMwkrc1fuFBV00J5Tb+WM/T7R4u9JOqctNUZQJ9
 XYxl5+6LClFAMnewT84dKC1wdD+L79lms4e7jJI4B4VRIxvVk2wh2RzN/kfoBQ9zvQ
 vrajgYUrYswv2oj5VfBfcCLGHqZVOUHJM9Bs/2yQIXICCypPBdj14NXNB4lM76yYbj
 3WP6S9UtMNNFKDrShzihHTivi5+OaTM8HRj6TmoWmoIqcaiL8YXJS2olROD3vsiwPM
 wq+5LcGZxXeY3d9OSMaJQUJCY2ZOsqjtPZsDyuyJA7RN+y8l5QIgTHuscvyfK+PDFN
 /r6pVdO9HecjA==
Message-ID: <0949ad6f-d703-47c9-8681-c64f17da07ac@kernel.org>
Date: Wed, 31 Dec 2025 07:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] video/logo: allow custom boot logo and simplify logic
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
 <12a2ee5ca1a085fe0bd0c1b2d6e08589445cbf66.camel@physik.fu-berlin.de>
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
In-Reply-To: <12a2ee5ca1a085fe0bd0c1b2d6e08589445cbf66.camel@physik.fu-berlin.de>
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

On 31/12/2025 at 00:19, John Paul Adrian Glaubitz wrote:
> Hi Vincent,
> 
> On Tue, 2025-12-30 at 23:19 +0100, Vincent Mailhol wrote:
>> This series allows the user to replace the default kernel boot logo by
>> a custom one directly in the kernel configuration. This makes it
>> easier to customise the boot logo without the need to modify the
>> sources and allows such customisation to remain persistent after
>> applying the configuration to another version of the kernel.
> 
> Wouldn't it make more sense to make the boot logo to be configurable
> at runtime so that users don't have to rebuild their kernel at all
> to change their boot logo?

I thought about that. The problem is that the logo is loaded really
early in the boot process. To be able to modify the logo without
rebuilding the full kernel, the logo would basically need to become a
kernel module that would be stored in either an initrd or on the filesystem.

The above is not impossible, but would require delaying the logo.

If we go in that direction, I think that my series as it is right now
would be a prerequisite anyway. Personally, I am happy with the logo
just being configurable when compiling the kernel, so I do not intend to
put more effort into this afterward. However, that would have prepared
the ground if anyone wants to implement in the future what you just
suggested.


Yours sincerely,
Vincent Mailhol

