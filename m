Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D377B96506D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAC810E1B7;
	Thu, 29 Aug 2024 20:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nkGKjMGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DFD10E147;
 Thu, 29 Aug 2024 20:03:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DCF81A4288F;
 Thu, 29 Aug 2024 20:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7867C4CEC1;
 Thu, 29 Aug 2024 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724961821;
 bh=jwuvKMrY5cTod7e2LGlDDYGRX/xeSQPNePjeIZJkTsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nkGKjMGMClK2QbKf3YBMwoOS/hzBHGZmfx+sMNajgsvFgOYgq6DuhmPgUPK5Q/LtO
 R4xzAEbTbZK30cEf/oSCus5JmAMLZcA0nRxtdc3c8d8+ZobnF1lIKkJiGHacL+tcI0
 cNbi51EvXgqdn2+k7o5326M261WIJy9ootdDMVs8wV9+yXO4mG5QmgO/0wt+38Icvg
 cVAFBtdeVhXfRyElgXYRs1KTQxZ9KjKaUYGDLSnWWBbuv4BT4A0Z008ajMreO0Jsy7
 mlF6SA12oa3p+Onm5+A1YC20wob310qOv7XkNOLa3sc4WqHn1nHJTOmgQhGkaLTa82
 CtZaBn2LrPDjQ==
Date: Thu, 29 Aug 2024 13:03:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
Message-ID: <20240829200339.GA2791510@thelio-3990X>
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
 <87cylrwahb.fsf@intel.com> <ZtCnhXwtO-gd1fMf@smile.fi.intel.com>
 <ZtC5oXSzUuuIgLiQ@smile.fi.intel.com>
 <20240829182255.GA1468662@thelio-3990X> <87a5gvw4y9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5gvw4y9.fsf@intel.com>
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

On Thu, Aug 29, 2024 at 09:37:34PM +0300, Jani Nikula wrote:
> On Thu, 29 Aug 2024, Nathan Chancellor <nathan@kernel.org> wrote:
> > Since commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > inline functions for W=1 build"). clang warns about unused static inline
> > functions in .c files, unlike GCC (they both do not warn for functions
> > coming from .h files). This difference is worked around for the normal
> > build by adding '__maybe_unused' to the definition of 'inline' but
> > Masahiro wanted to disable it for W=1 to allow this difference to find
> > unused/dead code. There have not been too many complaints as far as I am
> > aware but I can see how it is surprising.
> 
> Heh, I was just going to reply citing the same commit.
> 
> I occasionally build with clang myself, and we do enable most W=1 by
> default in the drm subsystem, so I was wondering why I hadn't hit
> this. The crucial difference is that we lack -DKBUILD_EXTRA_WARN1 which
> W=1 adds.
> 
> I see there's no subdir-cppflags-y, but I don't see any harm in us
> adding -Wundef and -DKBUILD_EXTRA_WARN1 to subdir-ccflags-y. After we
> fix the fallout, of course. Do you?

No, that seems entirely reasonable when your goal is to enable W=1 for
your subsystem.

> I don't much like the __maybe_unused stuff, but I guess it's fine as a
> stopgap measure, and then we can grep for that when running out of
> things to do. :p

Perhaps worth a TODO or something? Maybe a kernel newbie could work on
that at some point if it is not high enough priority.

Cheers,
Nathan
