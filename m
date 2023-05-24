Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1203770FDF3
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 20:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF02010E098;
	Wed, 24 May 2023 18:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E449910E098;
 Wed, 24 May 2023 18:41:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42A48633FC;
 Wed, 24 May 2023 18:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA07EC4339B;
 Wed, 24 May 2023 18:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684953665;
 bh=FmGkwZMPkp9Ewk2jaeXxKPCPjKt0tR96kOgGWXg7RXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EXw3owPgdikqpJB5N8dlMjllarZ06z+cF/k3AcN7nK3y9fjpG1tQYDxmnz8ECoaOB
 bpJtMXo4W6TwzfETCpw8kexOlVV01PdnhyWc+O9Q6mplqRLFxMvOLzDWsPncT77zzg
 cA+k1nYkF8yE9EeQU6xxzZ0eTCcX9GgURojqJ2cH03CytJkpiENKHNZ/SVIcVYrFDn
 nyoe1YWlJN1DXwg2p7L8RQjbmjQ7faWdVG9oUTr8fx/SVK2rLzg5m30MdX3onfQdNq
 8TItq6R+Tmq4WbR/GzNTa80w0qyJ2lPgJb+3unePzBV30UcaP1NIhoSoNdQp+Zi9qf
 DlS7R/Qi61riw==
Date: Wed, 24 May 2023 11:41:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] drm/i915: Fix clang -Wimplicit-fallthrough in
 intel_async_flip_check_hw()
Message-ID: <20230524184103.GA324296@dev-arch.thelio-3990X>
References: <20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org>
 <CAKwvOd=jZJouuNMd3Rvc--goA0EXPHcf6cHXUA6W1kXJg2ay2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=jZJouuNMd3Rvc--goA0EXPHcf6cHXUA6W1kXJg2ay2w@mail.gmail.com>
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
Cc: tvrtko.ursulin@linux.intel.com, llvm@lists.linux.dev,
 kernel test robot <lkp@intel.com>, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 11:32:32AM -0700, Nick Desaulniers wrote:
> On Wed, May 24, 2023 at 8:38 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Clang warns:
> >
> >   drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
> >                   case I915_FORMAT_MOD_X_TILED:
> >                   ^
> >   drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert 'break;' to avoid fall-through
> >                   case I915_FORMAT_MOD_X_TILED:
> >                   ^
> >                   break;
> >   1 error generated.
> >
> > Clang is a little more pedantic than GCC, which does not warn when
> > falling through to a case that is just break or return. Clang's version
> > is more in line with the kernel's own stance in deprecated.rst, which
> > states that all switch/case blocks must end in either break,
> > fallthrough, continue, goto, or return. Add the missing break to silence
> > the warning.
> >
> > Fixes: 937859485aef ("drm/i915: Support Async Flip on Linear buffers")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/202305241902.UvHtMoxa-lkp@intel.com/
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Closes: https://lore.kernel.org/CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com/
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for the patch! I've never seen the closes tag before, that's
> new to me. Can you tell me more about it?

It is new to me (at least in the context of the kernel) as well. I only
used it over Link: because checkpatch.pl told me to:

WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
#26:
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
#27:
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>

It was Link: for a bit but commit 44c31888098a ("checkpatch: allow
Closes tags with links") changed it to Closes:. Looks odd to me but
whatever the linter says I suppose.

Thanks for the review!

Cheers,
Nathan

> A few more tags
> 
> Reported-by: Tom Rix <trix@redhat.com>
> Link: https://lore.kernel.org/all/20230523125116.1669057-1-trix@redhat.com/
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> 
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index 0490c6412ab5..6d49e0ab3e85 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -6008,6 +6008,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
> >                                             plane->base.base.id, plane->base.name);
> >                                 return -EINVAL;
> >                         }
> > +                       break;
> >
> >                 case I915_FORMAT_MOD_X_TILED:
> >                 case I915_FORMAT_MOD_Y_TILED:
> >
> > ---
> > base-commit: 9a2cb1b31c040e2f1b313e2f7921f0f5e6b66d82
> > change-id: 20230524-intel_async_flip_check_hw-implicit-fallthrough-c4c40b03802f
> >
> > Best regards,
> > --
> > Nathan Chancellor <nathan@kernel.org>
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
