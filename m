Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712EE768CE8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 09:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F5210E1AB;
	Mon, 31 Jul 2023 07:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E3D10E1AB
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:03:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A18646607105;
 Mon, 31 Jul 2023 08:03:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690787036;
 bh=h4ff7dyElXSiU2HCDoxKH52aXgTKwtgpwzSppL9MAQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ToZDxR0VoZrKARAAT6OtEg2+o0PKqpM4P/MdnvE1nIwbEjClxWpG0jU0CykqRR/iy
 jlM8+aWm2CMSwB4P9MMq25pLeqH4LlXBBPbXif5CILxiHgulF8L8Is7Pb30ZJjjWbn
 vuR7DDI92//oUkeZ1ekBC9fTGRbG4zKjQCDZOiIHurB8t4/ckcXl6/gMlZREFYhtK8
 in2UkQ9XbEcjirbXuQwbkaMkeWYOnbGcC7+T8TDgBsp/PdibU53Qz/V5F1/YANiwMe
 d+9vO/Xw/Qp27WldVizqu/MtgBK6G/0YRdqeEPlZ93uTGedw9W8/Nm9p4tvWpviYo5
 mOXwZz1opz+zQ==
Date: Mon, 31 Jul 2023 09:03:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] drm: fix indirect goto into statement expression UB
Message-ID: <20230731090353.1cd5e2d5@collabora.com>
In-Reply-To: <20230728171757.GA433645@dev-arch.thelio-3990X>
References: <20230727-amdgpu-v2-1-7fc66bc52bf6@google.com>
 <20230728171757.GA433645@dev-arch.thelio-3990X>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, ndesaulniers@google.com,
 Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 10:17:57 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> + people from trailers of 09593216bff1
> 
> On Thu, Jul 27, 2023 at 03:50:58PM -0700, ndesaulniers@google.com wrote:
> > A new diagnostic in clang-17 now produces the following build error:
> > 
> > drivers/gpu/drm/tests/drm_exec_test.c:41:3: error: cannot jump from this
> > indirect goto statement to one of its possible targets
> >    41 |                 drm_exec_retry_on_contention(&exec);
> >       |                 ^
> > include/drm/drm_exec.h:96:4: note: expanded from macro
> > 'drm_exec_retry_on_contention'
> >    96 |                         goto *__drm_exec_retry_ptr;
> >       |                         ^
> > drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: possible target of
> > indirect goto statement
> >    39 |         drm_exec_until_all_locked(&exec) {
> >       |         ^
> > include/drm/drm_exec.h:79:33: note: expanded from macro
> > 'drm_exec_until_all_locked'
> >    79 |                 __label__ __drm_exec_retry;
> > drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: jump enters a
> > statement expression
> > 
> > The GCC manually currently states that:  
> 
>           ^ manual
> 
> > >> Jumping into a statement expression with a computed goto (see Labels
> > >> as Values) has undefined behavior.  
> > 
> > So the diagnostic appears correct, even if codegen happened to produce
> > working code.
> > 
> > Looking closer at this code, while the original combination of statement
> > expression, local label, and computed/indirect goto GNU C expressions
> > were clever, a simple while loop and continue block might have sufficed.
> > 
> > This approach might not work as expected if drm_exec_until_all_locked
> > "loops" can be nested, but that doesn't appear to be an existing use
> > case in the codebase.

Hm, that's exactly the sort of things we were trying to be robust
against with the original approach. With this version, we're back to a
situation where

	drm_exec_until_all_locked(exec) {
		for (...) {
			drm_exec_retry_on_contention(exec);
		}
	}

doesn't do what we expect it to do, and that's a use case we want to
support.

> > 
> > Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1890
> > Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d096eb3aed7b712f5067
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>  
> 
> Thanks for the patch!
> 
> Tested-by: Nathan Chancellor <nathan@kernel.org> # build
> 
> > ---
> > Changes in v2:
> > Fix the continue to be outside of the do while
> > - Link to v1: https://lore.kernel.org/r/20230727-amdgpu-v1-1-a95690e75388@google.com
> > ---
> >  include/drm/drm_exec.h | 21 +++++----------------
> >  1 file changed, 5 insertions(+), 16 deletions(-)
> > 
> > diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> > index 73205afec162..fa1cc5c3d021 100644
> > --- a/include/drm/drm_exec.h
> > +++ b/include/drm/drm_exec.h
> > @@ -70,18 +70,8 @@ struct drm_exec {
> >   * Core functionality of the drm_exec object. Loops until all GEM objects are
> >   * locked and no more contention exists. At the beginning of the loop it is
> >   * guaranteed that no GEM object is locked.
> > - *
> > - * Since labels can't be defined local to the loops body we use a jump pointer
> > - * to make sure that the retry is only used from within the loops body.
> >   */
> > -#define drm_exec_until_all_locked(exec)				\
> > -	for (void *__drm_exec_retry_ptr; ({			\
> > -		__label__ __drm_exec_retry;			\
> > -__drm_exec_retry:						\
> > -		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
> > -		(void)__drm_exec_retry_ptr;			\
> > -		drm_exec_cleanup(exec);				\
> > -	});)
> > +#define drm_exec_until_all_locked(exec)	while(drm_exec_cleanup(exec))
> >  
> >  /**
> >   * drm_exec_retry_on_contention - restart the loop to grap all locks
> > @@ -90,11 +80,10 @@ __drm_exec_retry:						\
> >   * Control flow helper to continue when a contention was detected and we need to
> >   * clean up and re-start the loop to prepare all GEM objects.
> >   */
> > -#define drm_exec_retry_on_contention(exec)			\
> > -	do {							\
> > -		if (unlikely(drm_exec_is_contended(exec)))	\
> > -			goto *__drm_exec_retry_ptr;		\
> > -	} while (0)
> > +#define drm_exec_retry_on_contention(exec)		\
> > +	if (unlikely(drm_exec_is_contended(exec)))	\
> > +		continue;				\
> > +	do {} while (0)
> >  
> >  /**
> >   * drm_exec_is_contended - check for contention
> > 
> > ---
> > base-commit: 451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
> > change-id: 20230727-amdgpu-93c0e5302951
> > 
> > Best regards,
> > -- 
> > Nick Desaulniers <ndesaulniers@google.com>
> >   

