Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114BF4B3CE3
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 19:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D30E10E16F;
	Sun, 13 Feb 2022 18:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B865410E16F;
 Sun, 13 Feb 2022 18:39:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC77A6120F;
 Sun, 13 Feb 2022 18:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C04C004E1;
 Sun, 13 Feb 2022 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644777568;
 bh=vs/QifduZDoY/ETojuivPkDFpDkaCbp+mFAiQ9QKXeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=falLgcQBvsXbqD+5YLjI1r1ZMPrtOBpatRB1KWnuNJZdPpvjG+1glNvUecuPgKshv
 R0IeB2ewTJ5vBosdW21LO200CjQ0+kPkyfe+PBnE8gkyuD7YQPqrB1QLL6CBQfm1u+
 xdPlfnqACnviL311DuyenWWRaR5MYxaxx+bT8Pmlzy7sfsg15OlovsPIm1uBL4Mh4a
 +DqneNWYyE62qrT9xIzLdD5gEQoWkf/BfY6MTPQjyNcu9gRs/zgqO6J7BkBgxjSe/T
 q3lghfTp0GqoRrUzjNic75qgfEwCSMo6hzSznuEBYvjXt+RvYHlQd/dHwXMVp26zfV
 7l2HwQheFoJQA==
Date: Sun, 13 Feb 2022 11:39:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tong Zhang <ztong0001@gmail.com>
Subject: Re: [PATCH] drm/i915: fix build issue when using clang
Message-ID: <YglQW7gVNoRJ7QpQ@dev-arch.archlinux-ax161>
References: <20220213065106.48062-1-ztong0001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220213065106.48062-1-ztong0001@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 12, 2022 at 10:51:06PM -0800, Tong Zhang wrote:
> drm/i915 target adds some extra cflags, especially it does re-apply -Wall.
> In clang this will override -Wno-format-security and cause the build to
> fail when CONFIG_DRM_I915_WERROR=y. While with GCC this does not happen.
> We reapply -Wno-format-security here to get around this issue.

For what it's worth, GCC would warn in the exact same way if
-Wformat-security was included within -Wall like it is for clang:

drivers/gpu/drm/i915/gt/intel_gt.c: In function ‘intel_gt_invalidate_tlbs’:
drivers/gpu/drm/i915/gt/intel_gt.c:988:9: error: format not a string literal and no format arguments [-Werror=format-security]
  988 |         GEM_TRACE("\n");
      |         ^~~~~~~~~
cc1: all warnings being treated as errors

drivers/gpu/drm/i915/gt/selftest_execlists.c: In function ‘live_sanitycheck’:
drivers/gpu/drm/i915/gt/selftest_execlists.c:142:25: error: format not a string literal and no format arguments [-Werror=format-security]
  142 |                         GEM_TRACE("spinner failed to start\n");
      |                         ^~~~~~~~~
drivers/gpu/drm/i915/gt/selftest_execlists.c: In function ‘live_preempt’:
drivers/gpu/drm/i915/gt/selftest_execlists.c:1775:25: error: format not a string literal and no format arguments [-Werror=format-security]
 1775 |                         GEM_TRACE("lo spinner failed to start\n");
      |                         ^~~~~~~~~
drivers/gpu/drm/i915/gt/selftest_execlists.c:1792:25: error: format not a string literal and no format arguments [-Werror=format-security]
 1792 |                         GEM_TRACE("hi spinner failed to start\n");
      |                         ^~~~~~~~~
cc1: all warnings being treated as errors

If fixing these warnings instead of just disabling the warning is
undesirable (since I feel like the entire point of the i195 cflags
situation is to enable more warnings than the main Makefile), I think
the commit message should be rewritten to something along the lines of:

"drm/i915 adds some extra cflags, namely -Wall, which causes
instances of -Wformat-security to appear when building with clang, even
though this warning is turned off kernel-wide in the main Makefile:"

> drivers/gpu/drm/i915/gt/intel_gt.c:983:2: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>         GEM_TRACE("ERROR\n");
>         ^~~~~~~~~~~~~~~~~~~~
> ./drivers/gpu/drm/i915/i915_gem.h:76:24: note: expanded from macro 'GEM_TRACE'
>  #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:369:3: note: expanded from macro 'trace_printk'
>                 do_trace_printk(fmt, ##__VA_ARGS__);    \
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:383:30: note: expanded from macro 'do_trace_printk'
>                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
>                                            ^~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gt/intel_gt.c:983:2: note: treat the string as an argument to avoid this

"This does not happen with GCC because it does not enable
-Wformat-security with -Wall. Disable -Wformat-security within the i915
Makefile so that these warnings do not show up with clang."

The actual diff itself looks fine to me.

Cheers,
Nathan

> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
>  drivers/gpu/drm/i915/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 1b62b9f65196..c04e05a3d39f 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -13,6 +13,7 @@
>  # will most likely get a sudden build breakage... Hopefully we will fix
>  # new warnings before CI updates!
>  subdir-ccflags-y := -Wall -Wextra
> +subdir-ccflags-y += -Wno-format-security
>  subdir-ccflags-y += -Wno-unused-parameter
>  subdir-ccflags-y += -Wno-type-limits
>  subdir-ccflags-y += -Wno-missing-field-initializers
> -- 
> 2.25.1
> 
