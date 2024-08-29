Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED60C964D9A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 20:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8C810E763;
	Thu, 29 Aug 2024 18:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ErWDrzmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E1A10E763;
 Thu, 29 Aug 2024 18:23:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BAD83CE1C41;
 Thu, 29 Aug 2024 18:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F13C4CEC1;
 Thu, 29 Aug 2024 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724955778;
 bh=DizBn8xXw/cFycbQBGfmHDYKfIcRsOuw62ZWsiuen5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ErWDrzmCll09v4heo4OXNd0OPzQ1zKlBPXNQOWd36LjiuN4nhCGBoxt/G7eoM37fZ
 eJtv589/yK+9jpQRcPWcr0nUiYV2XJcEWVhjchmFWNsp/W3GKEwLq3BaZw15KvP8fB
 mXAKeYRSvxTC8enrhVzN62UYXagHY8yx8bEZZg+NqBuyrAS/V5G8trGVOGcUcicw+p
 m0AtxKTQH0+v4M0yAfNH+rEk9/wddxwy4T4nubEZooq+NoPKAExiy72tb0NW/qzTol
 ML8oFj6UptVG0FBx+bMxYEuPfc3fqUIGPTAIkuqLpq+Yff4QGS0A0nlryYgZ7TN4zi
 YApqmvhgnha4w==
Date: Thu, 29 Aug 2024 11:22:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
Message-ID: <20240829182255.GA1468662@thelio-3990X>
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
 <87cylrwahb.fsf@intel.com> <ZtCnhXwtO-gd1fMf@smile.fi.intel.com>
 <ZtC5oXSzUuuIgLiQ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtC5oXSzUuuIgLiQ@smile.fi.intel.com>
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

On Thu, Aug 29, 2024 at 09:10:41PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 29, 2024 at 07:53:25PM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 29, 2024 at 07:38:08PM +0300, Jani Nikula wrote:
> > > On Thu, 29 Aug 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > With CONFIG_WERROR=y and `make W=1` build fails on my x86_64 machine.
> > > > This is due to some unused functions. Hence these quick fixes.
> > > 
> > > Since when have we been getting the warnings for static inlines?

Since commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build"). clang warns about unused static inline
functions in .c files, unlike GCC (they both do not warn for functions
coming from .h files). This difference is worked around for the normal
build by adding '__maybe_unused' to the definition of 'inline' but
Masahiro wanted to disable it for W=1 to allow this difference to find
unused/dead code. There have not been too many complaints as far as I am
aware but I can see how it is surprising.

Cheers,
Nathan
