Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E074FCD6E6A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 19:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308610E0B6;
	Mon, 22 Dec 2025 18:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oqOlyYFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C44810E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 18:39:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 350A06014C;
 Mon, 22 Dec 2025 18:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A205C4CEF1;
 Mon, 22 Dec 2025 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766428759;
 bh=LkRq9kuAyuxgNdzcszCitFOsSMy7gibIDiS0A45NiQQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oqOlyYFft6Wzt4wVJf4CDio7jFWhzYs8F8zDe+9CBb8s3RCxhgI6PmW3kHvQ71bQV
 43WGiakXUGUL0wHaCv5l7RH49JKgfi7uqX22oJ43aelEyB8it6OFfs6ypfg6ayd9Dz
 u7Uwamylo0DaqrM3acuyq3V/QDPbuqf6d3ek0OcYd6abh625xFAPKitkNqcYsRfwVU
 AqNZkNHNAEKWrhxDjm3TzJ8RH/YhqH7uG3MNddMRbVAzIemILAJzzH1vrxeb6Psiji
 2ES1Au69Qb6s/AAf4gXwEH3GPKfmvqzoXUatQAPleETTbB+tQLTABK6HSXLQrs7e9f
 Z62wUQXT7lxSA==
Message-ID: <efa713c6-36f5-4475-ad75-ce51cdc6819d@kernel.org>
Date: Mon, 22 Dec 2025 19:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] overflow: Remove is_non_negative() and
 is_negative()
To: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <chris.mason@fusionio.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <202512221735.mRV4BZqB-lkp@intel.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol@kernel.org>
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <202512221735.mRV4BZqB-lkp@intel.com>
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

On 22/12/2025 at 11:03, kernel test robot wrote:
> Hi Vincent,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 3e7f562e20ee87a25e104ef4fce557d39d62fa85]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/kbuild-remove-gcc-s-Wtype-limits/20251220-190509
> base:   3e7f562e20ee87a25e104ef4fce557d39d62fa85
> patch link:    https://lore.kernel.org/r/20251220-remove_wtype-limits-v3-3-24b170af700e%40kernel.org
> patch subject: [PATCH v3 3/3] overflow: Remove is_non_negative() and is_negative()
> config: x86_64-randconfig-161-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221735.mRV4BZqB-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512221735.mRV4BZqB-lkp@intel.com/
> 
> smatch warnings:
> fs/libfs.c:1628 generic_check_addressable() warn: unsigned '*_d' is never less than zero.
> fs/libfs.c:1628 generic_check_addressable() warn: unsigned '_a' is never less than zero.
> mm/vmalloc.c:4708 remap_vmalloc_range_partial() warn: unsigned '*_d' is never less than zero.
> mm/vmalloc.c:4708 remap_vmalloc_range_partial() warn: unsigned '_a' is never less than zero.

So smatch is not able to distinguish when the comparison comes from
a macro expansion.

Can this warning be ignored? Or should I remove this 3rd patch from
the series (and go back to v1)?  My choice would be to ignore this
warning.


Yours sincerely,
Vincent Mailhol
