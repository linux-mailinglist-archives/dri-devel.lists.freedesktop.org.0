Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71905964DCB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 20:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A4410E76A;
	Thu, 29 Aug 2024 18:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHrCZCM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1814810E769;
 Thu, 29 Aug 2024 18:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724956673; x=1756492673;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=clzzPvj3fGxThoMYcayjVCLtB/1hnsi9t1c+TqRgB+g=;
 b=aHrCZCM/ASyxj7gih+fJQK7Z+x9qbSXO+RKzIun2QehZx0EixcfAmhsl
 R7q0ChXCSFE4xmOqPrSJqofcxwm9b6Yq7T3THVBrRUEHm4DColYq/KXbX
 da9Dd5VsIN7VAD+AcvI7dEhaSNuWMVcWojaun6LKrbY8Rn7Uov891MIYg
 2CctqkM8+ZNV5fec11uXUx6UzCm5inOUUnLyqeab8CSvoP1dylRGBJZVu
 pJNX7IsRYWThBx2haU0q0oOo51FnSbAAO0ScXk6WzsczZ4sxSsMPCYkAh
 Zds6E8fwqkjYTEgXTuTLp19xV6wGpagMwUgMa5cSjmg81dksYZlBKy7VU g==;
X-CSE-ConnectionGUID: J6DrQYFURS6ET7q7c6YJog==
X-CSE-MsgGUID: 1+vgy500RbOXA6CDemOM0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23717545"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23717545"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 11:37:43 -0700
X-CSE-ConnectionGUID: Yji/QOXNS4GM/OSmTxt2Ew==
X-CSE-MsgGUID: z0CDDVojSuWX0uXbvG9YHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68565385"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 11:37:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
In-Reply-To: <20240829182255.GA1468662@thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
 <87cylrwahb.fsf@intel.com> <ZtCnhXwtO-gd1fMf@smile.fi.intel.com>
 <ZtC5oXSzUuuIgLiQ@smile.fi.intel.com>
 <20240829182255.GA1468662@thelio-3990X>
Date: Thu, 29 Aug 2024 21:37:34 +0300
Message-ID: <87a5gvw4y9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 29 Aug 2024, Nathan Chancellor <nathan@kernel.org> wrote:
> On Thu, Aug 29, 2024 at 09:10:41PM +0300, Andy Shevchenko wrote:
>> On Thu, Aug 29, 2024 at 07:53:25PM +0300, Andy Shevchenko wrote:
>> > On Thu, Aug 29, 2024 at 07:38:08PM +0300, Jani Nikula wrote:
>> > > On Thu, 29 Aug 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> > > > With CONFIG_WERROR=y and `make W=1` build fails on my x86_64 machine.
>> > > > This is due to some unused functions. Hence these quick fixes.
>> > > 
>> > > Since when have we been getting the warnings for static inlines?
>
> Since commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build"). clang warns about unused static inline
> functions in .c files, unlike GCC (they both do not warn for functions
> coming from .h files). This difference is worked around for the normal
> build by adding '__maybe_unused' to the definition of 'inline' but
> Masahiro wanted to disable it for W=1 to allow this difference to find
> unused/dead code. There have not been too many complaints as far as I am
> aware but I can see how it is surprising.

Heh, I was just going to reply citing the same commit.

I occasionally build with clang myself, and we do enable most W=1 by
default in the drm subsystem, so I was wondering why I hadn't hit
this. The crucial difference is that we lack -DKBUILD_EXTRA_WARN1 which
W=1 adds.

I see there's no subdir-cppflags-y, but I don't see any harm in us
adding -Wundef and -DKBUILD_EXTRA_WARN1 to subdir-ccflags-y. After we
fix the fallout, of course. Do you?

I don't much like the __maybe_unused stuff, but I guess it's fine as a
stopgap measure, and then we can grep for that when running out of
things to do. :p

The TL;DR is,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

on the series.

BR,
Jani.

-- 
Jani Nikula, Intel
