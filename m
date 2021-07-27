Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70FF3D817F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74F76EAC3;
	Tue, 27 Jul 2021 21:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6083C6EAC3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:19:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C5BA60FA0;
 Tue, 27 Jul 2021 21:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627420740;
 bh=WmBPx1Yv944WSgHzak0rUdbiFwHmXA9AEErppz095mw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Yhxrd8TFAkXrlR9r4ZRtp1p0sOIsB3ZuHtZ7oYU4pXZvEaqyymH79DJSjO7iRK0si
 GSkXTTyUofgJqP034jp+1ZTvpxMOzmU1ZGhjE0qTg4I6idDUP9ThURBnvBclsuNBhC
 u1tZ6C5YrfZBbxqk5ahpRO+VLSzVj3IEDOAgpOob/SggphKjlTaaTST/9JYGw9qJid
 8957SpfZCeNiETD/zLB4cNWxzBDrGN9HQH+PNdMkwgJzIdpYFU/NFrV7mI6t8oFQsi
 iwRWwF/foCBjtefKMixR8I7lM2u4IUX+zsUkg8iCrC0hdyyEJdWn/XDDKg0i/Pt6xD
 FkiBVpBB37WQw==
Subject: Re: [PATCH 31/64] fortify: Explicitly disable Clang support
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-32-keescook@chromium.org>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <da989ffc-da64-33a2-581e-6920eb7ebd2d@kernel.org>
Date: Tue, 27 Jul 2021 14:18:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727205855.411487-32-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/2021 1:58 PM, Kees Cook wrote:
> Clang has never correctly compiled the FORTIFY_SOURCE defenses due to
> a couple bugs:
> 
> 	Eliding inlines with matching __builtin_* names
> 	https://bugs.llvm.org/show_bug.cgi?id=50322
> 
> 	Incorrect __builtin_constant_p() of some globals
> 	https://bugs.llvm.org/show_bug.cgi?id=41459
> 
> In the process of making improvements to the FORTIFY_SOURCE defenses, the
> first (silent) bug (coincidentally) becomes worked around, but exposes
> the latter which breaks the build. As such, Clang must not be used with
> CONFIG_FORTIFY_SOURCE until at least latter bug is fixed (in Clang 13),
> and the fortify routines have been rearranged.
> 
> Update the Kconfig to reflect the reality of the current situation.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   security/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/security/Kconfig b/security/Kconfig
> index 0ced7fd33e4d..8f0e675e70a4 100644
> --- a/security/Kconfig
> +++ b/security/Kconfig
> @@ -191,6 +191,9 @@ config HARDENED_USERCOPY_PAGESPAN
>   config FORTIFY_SOURCE
>   	bool "Harden common str/mem functions against buffer overflows"
>   	depends on ARCH_HAS_FORTIFY_SOURCE
> +	# https://bugs.llvm.org/show_bug.cgi?id=50322
> +	# https://bugs.llvm.org/show_bug.cgi?id=41459
> +	depends on !CONFIG_CC_IS_CLANG

Should be !CC_IS_CLANG, Kconfig is hard :)

>   	help
>   	  Detect overflows of buffers in common string and memory functions
>   	  where the compiler can determine and validate the buffer sizes.
> 

Cheers,
Nathan
