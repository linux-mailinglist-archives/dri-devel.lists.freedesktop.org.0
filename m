Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52547767319
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 19:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B4910E1B3;
	Fri, 28 Jul 2023 17:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FBB10E1C7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 17:18:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4FE86218D;
 Fri, 28 Jul 2023 17:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF95BC433C8;
 Fri, 28 Jul 2023 17:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690564680;
 bh=cv/PDocAmxbGFwdA+baufqPji8T3ipwDf7Jyfbvf32c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rp68SqAMtcXPF33g9ZwvZAV27WFZERhO6B6y8qniOYuaCg78BnEezs/Fp3U/T3Rfd
 YXjXtdwMDdxkzdDV9gSqO/9S1Lj0YO4rcdeGNFts0ufq3VI3FWktGgEXT/d9InCSzI
 88U3X9u5x1BBrA0Bu2ofG03x8UVE12IAo6OOQ116oQUqnYexC+osAAknRUP2dHnYPg
 Y05se9EQDxWD2VPrf593NRT+NGlLOyUdFWia/gpVnphCe9bDoCuvLFZcGQjLh5SA65
 /8OLqYZtuA7YVSJwJY2BSPdSnTcZn55r3FTvFcHJUDRZNj/K7alTvd1mnzbiiDJtRJ
 LJYlUO+Ela+FA==
Date: Fri, 28 Jul 2023 10:17:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ndesaulniers@google.com
Subject: Re: [PATCH v2] drm: fix indirect goto into statement expression UB
Message-ID: <20230728171757.GA433645@dev-arch.thelio-3990X>
References: <20230727-amdgpu-v2-1-7fc66bc52bf6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727-amdgpu-v2-1-7fc66bc52bf6@google.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Tom Rix <trix@redhat.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 boris.brezillon@collabora.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ people from trailers of 09593216bff1

On Thu, Jul 27, 2023 at 03:50:58PM -0700, ndesaulniers@google.com wrote:
> A new diagnostic in clang-17 now produces the following build error:
> 
> drivers/gpu/drm/tests/drm_exec_test.c:41:3: error: cannot jump from this
> indirect goto statement to one of its possible targets
>    41 |                 drm_exec_retry_on_contention(&exec);
>       |                 ^
> include/drm/drm_exec.h:96:4: note: expanded from macro
> 'drm_exec_retry_on_contention'
>    96 |                         goto *__drm_exec_retry_ptr;
>       |                         ^
> drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: possible target of
> indirect goto statement
>    39 |         drm_exec_until_all_locked(&exec) {
>       |         ^
> include/drm/drm_exec.h:79:33: note: expanded from macro
> 'drm_exec_until_all_locked'
>    79 |                 __label__ __drm_exec_retry;
> drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: jump enters a
> statement expression
> 
> The GCC manually currently states that:

          ^ manual

> >> Jumping into a statement expression with a computed goto (see Labels
> >> as Values) has undefined behavior.
> 
> So the diagnostic appears correct, even if codegen happened to produce
> working code.
> 
> Looking closer at this code, while the original combination of statement
> expression, local label, and computed/indirect goto GNU C expressions
> were clever, a simple while loop and continue block might have sufficed.
> 
> This approach might not work as expected if drm_exec_until_all_locked
> "loops" can be nested, but that doesn't appear to be an existing use
> case in the codebase.
> 
> Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
> Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> Link: https://github.com/ClangBuiltLinux/linux/issues/1890
> Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d096eb3aed7b712f5067
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch!

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

> ---
> Changes in v2:
> Fix the continue to be outside of the do while
> - Link to v1: https://lore.kernel.org/r/20230727-amdgpu-v1-1-a95690e75388@google.com
> ---
>  include/drm/drm_exec.h | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 73205afec162..fa1cc5c3d021 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -70,18 +70,8 @@ struct drm_exec {
>   * Core functionality of the drm_exec object. Loops until all GEM objects are
>   * locked and no more contention exists. At the beginning of the loop it is
>   * guaranteed that no GEM object is locked.
> - *
> - * Since labels can't be defined local to the loops body we use a jump pointer
> - * to make sure that the retry is only used from within the loops body.
>   */
> -#define drm_exec_until_all_locked(exec)				\
> -	for (void *__drm_exec_retry_ptr; ({			\
> -		__label__ __drm_exec_retry;			\
> -__drm_exec_retry:						\
> -		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
> -		(void)__drm_exec_retry_ptr;			\
> -		drm_exec_cleanup(exec);				\
> -	});)
> +#define drm_exec_until_all_locked(exec)	while(drm_exec_cleanup(exec))
>  
>  /**
>   * drm_exec_retry_on_contention - restart the loop to grap all locks
> @@ -90,11 +80,10 @@ __drm_exec_retry:						\
>   * Control flow helper to continue when a contention was detected and we need to
>   * clean up and re-start the loop to prepare all GEM objects.
>   */
> -#define drm_exec_retry_on_contention(exec)			\
> -	do {							\
> -		if (unlikely(drm_exec_is_contended(exec)))	\
> -			goto *__drm_exec_retry_ptr;		\
> -	} while (0)
> +#define drm_exec_retry_on_contention(exec)		\
> +	if (unlikely(drm_exec_is_contended(exec)))	\
> +		continue;				\
> +	do {} while (0)
>  
>  /**
>   * drm_exec_is_contended - check for contention
> 
> ---
> base-commit: 451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
> change-id: 20230727-amdgpu-93c0e5302951
> 
> Best regards,
> -- 
> Nick Desaulniers <ndesaulniers@google.com>
> 
