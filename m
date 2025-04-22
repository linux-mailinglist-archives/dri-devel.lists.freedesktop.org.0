Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51EA9706D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F41410E0F7;
	Tue, 22 Apr 2025 15:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUKAPbeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF11010E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745335366; x=1776871366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D3haV5NBdLifarUSGD9OaJjieXNkf4E0uuG46CLCXYk=;
 b=ZUKAPbeVn0OQAEmADHiIU1neYydVcO+RgN9PxeZ9ldvM9Q/h3Qu5T9NL
 SXihsaYou3wqLD1wq93QlCt8bQRhKmuvKi8pczA/GVz1hsxNCXXrAsOF8
 4RKl/AjZk+CpqBMHXVSPgu0mPTasIjqmY29BuRgOOrRJ7jlvkyz5l3Qpw
 emi41Knt64BhTQV/Mt5fahLZLZp3L96c0V7b2Wnln6lbUnbr43I2saVXn
 PRTcItSYT7W+WmXDjtzUAsp20kT4rapcoKeQRW8D/K0JQxUgofrAwPwPa
 7RdmFDwLHydz4fW0Bg3p9/Vkhonom8NY/WGW+0ShjhIXSicTpanRZYy1L A==;
X-CSE-ConnectionGUID: IkjCLKZRQL6ePY62qE85uw==
X-CSE-MsgGUID: anIctLj/S0Sa7FwqkRroTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64430395"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="64430395"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:22:45 -0700
X-CSE-ConnectionGUID: Ot0pmeBpRVyqVU4jCjCR2A==
X-CSE-MsgGUID: 1oTGdjgCQQqOTvp8lcwjWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="132590029"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:22:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u7FSF-0000000ElPn-0z2h; Tue, 22 Apr 2025 18:22:35 +0300
Date: Tue, 22 Apr 2025 18:22:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io,
 Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <aAe0O50RmUw3k0o9@smile.fi.intel.com>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAdsbgx53ZbdvB6p@smile.fi.intel.com>
 <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
 <PN3PR01MB9597D8AE22D48C7A5D351ABBB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597D8AE22D48C7A5D351ABBB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Apr 22, 2025 at 08:45:31PM +0530, Aditya Garg wrote:
> On 22-04-2025 04:02 pm, Geert Uytterhoeven wrote:
> > On Tue, 22 Apr 2025 at 12:16, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> > I am not against h/n in se, but I am against bad/confusing naming.
> > The big question is: should it print
> >   (A) the value in network byte order, or
> >   (B) the reverse of host byte order?
> > 
> > If the answer is (A), I see no real reason to have %p4n, as %p4b prints
> > the exact same thing.  Moreover, it leaves us without a portable
> > way to print values in reverse without the caller doing an explicit
> > __swab32() (which is not compatible with the %p pass-by-pointer
> > calling convention).
> > 
> > If the answer is (B), "%p4n using network byte order" is bad/confusing
> > naming.
> 
> The answer is definitely (B). As far as bad/confusing naming is concerned,
> I'll let vsprintf maintainers decide. As far as usage is concerned, %p4cl
> is used in appletbdrm and %p4ch is used in to be upstreamed soon smc driver
> by Asahi Linux.

Can it use %p4cb? Or in another word,
why does it require "host" representation?

-- 
With Best Regards,
Andy Shevchenko


