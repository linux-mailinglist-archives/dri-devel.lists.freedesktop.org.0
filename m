Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7E7529AF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 19:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E0210E71A;
	Thu, 13 Jul 2023 17:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67FE10E74C;
 Thu, 13 Jul 2023 17:19:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEDA761AEF;
 Thu, 13 Jul 2023 17:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7527AC433BA;
 Thu, 13 Jul 2023 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689268745;
 bh=wdJcuex8sDV2XaCaoqTXPhw5KK8TTTlAjvD3PXnYiu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JWhXWsPKsI6Ors7YtLspO8kD6W3b/sBfz01gZsCD3oL6NDbKLGzWXw+USjmSgcR48
 xlU0eCJ0SVI3RZZ3j2ytZVsRP53VD/2GvuXBMo4Ec19mKMRwYW/TY1jTeR9YKSDBEV
 CTSf/Y1jslgVfaudz8gA5yP1TKewg+mZwkvnDxm5NuhflhdM/Gvmp+RmA/7CMuWLgs
 ezPZzFH3IgCZ+PxnBOMWN77SBry20xQn5Be9cx+Cml7tPT2edvF0GvZ3Ch3m1+TIym
 2ZTfPWVRWFIyOGH99CZAKMwtUKusiJTh52v/d19Rn5TKVx/dKZ2IVV0P3EIxahnLYV
 KEpOSikqHm6lQ==
Date: Thu, 13 Jul 2023 10:19:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v4 18/21] compiler.h: RFC - s/__LINE__/__COUNTER__/ in
 __UNIQUE_ID fallback
Message-ID: <20230713171901.GA4036397@dev-arch.thelio-3990X>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
 <20230713163626.31338-19-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713163626.31338-19-jim.cromie@gmail.com>
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
Cc: Tom Rix <trix@redhat.com>, jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, linux-sparse@vger.kernel.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jim

On Thu, Jul 13, 2023 at 10:36:23AM -0600, Jim Cromie wrote:
> We currently have 3 defns for __UNIQUE_ID(); gcc and clang are using
> __COUNTER__ for real uniqueness, 3rd just uses __LINE__, which should
> fail on this (and harder to avoid situations):
> 
>   DECLARE_FOO(); DECLARE_FOO();
> 
> Its 2023, can we haz a no-fallback __UNIQUE_ID ?

Yeah, I fail to see how this fallback definition can actually be used
after commit 95207db8166a ("Remove Intel compiler support"); even before
that, it would be pretty unlikely since icc usage has not been visible
for a long time. The kernel only officially supports clang or GCC now,
so the definitions of __UNIQUE_ID() in include/linux/compiler-clang.h
and include/linux/compiler-gcc.h should always be used because of the
include in include/linux/compiler_types.h, right?

I think the correct clean up is to just hoist the definition of
__UNIQUE_ID() out of the individual compiler headers into the common one
here but...

> NOTE:
> 
> This also changes __UNIQUE_ID_ to _kaUID_.  Ive been getting
> lkp-reports of collisions on names which should be unique; this
> shouldnt happen on gcc & clang, but does on some older ones, on some
> platforms, on some allyes & rand-configs.  Like this:
> 
> mips64-linux-ld:
> drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_class_users+0x0):
> multiple definition of `__UNIQUE_ID_ddebug_class_user405';
> drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0):
> first defined here

This problem cannot be addressed with this patch given the above
information, no? Seems like that might mean that __COUNTER__ has issues
in earlier compilers?

Cheers,
Nathan

> Like above, the collision reports appear to always be 3-digit
> counters, which look like line-numbers.  Changing to _kaUID_ in this
> defn should make it more obvious (in *.i file) when a fallback has
> happened.  To be clear, I havent seen it yet.  Nor have I seen the
> multiple-defn problem above since adding this patch.
> 
> Lets see what lkp-robot says about this.
> 
> CC: Luc Van Oostenryck <luc.vanoostenryck@gmail.com> (maintainer:SPARSE CHECKER)
> CC: Nathan Chancellor <nathan@kernel.org> (supporter:CLANG/LLVM BUILD SUPPORT)
> CC: Nick Desaulniers <ndesaulniers@google.com> (supporter:CLANG/LLVM BUILD SUPPORT)
> CC: Tom Rix <trix@redhat.com> (reviewer:CLANG/LLVM BUILD SUPPORT)
> CC: linux-sparse@vger.kernel.org (open list:SPARSE CHECKER)
> CC: linux-kernel@vger.kernel.org (open list)
> CC: llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  include/linux/compiler.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index d7779a18b24f..677d6c47cd9e 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -177,9 +177,9 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
>  	__asm__ ("" : "=r" (var) : "0" (var))
>  #endif
>  
> -/* Not-quite-unique ID. */
> +/* JFTI: to fix Not-quite-unique ID */
>  #ifndef __UNIQUE_ID
> -# define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __LINE__)
> +# define __UNIQUE_ID(prefix) __PASTE(__PASTE(_kaUID_, prefix), __COUNTER__)
>  #endif
>  
>  /**
> -- 
> 2.41.0
> 
