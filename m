Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D01A96591
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 12:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65D210E192;
	Tue, 22 Apr 2025 10:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCYI1D+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D359C10E192
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745316767; x=1776852767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2byMCT2UXAQEqRdRAb3OfR+0lpTtdVkjJBC2mX8NiIU=;
 b=aCYI1D+2NFIlsPBPY5Rec4GxBn7qrue3vd/UE4YMrXZD4vge6CuZaT4p
 q4wf2c19DddcWA2lzRyHrFKRMGCOeaCISPKNgpPAiBi36FFCj02oIqB1G
 /AAo8WHAvs2r/qyzZq+24bN/yYDC9+Yplt6OLRkE+j0QW+s20JV/+K3Eb
 Jx+5+wrEOMBVdbq/ij5lL4L474IVZzUplfaoDJHHSVYtr1IbDU41Nspz3
 1Rsz5ldrbwqC//4kv5jj8dU2l01fw/svpaBgQtGqDrV3DYqCGjjdRIf9C
 VJy9tOR+bnXCROSKgHLodISxngI7QVXSkhR0AW3T7WrzST9TDGOqm3mW6 A==;
X-CSE-ConnectionGUID: Y9zUntqyR9CjfXIiha8wOg==
X-CSE-MsgGUID: N0r5T6UJQ/qB4Y4egqbFYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58235929"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="58235929"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:12:46 -0700
X-CSE-ConnectionGUID: h/zCbvGBTniHa9U1JGfM6g==
X-CSE-MsgGUID: PkmUI5iaQnKd3WFy8LqqTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131721202"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:12:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u7AcG-0000000EhFh-0niq; Tue, 22 Apr 2025 13:12:36 +0300
Date: Tue, 22 Apr 2025 13:12:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>,
 alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
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
 Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <aAdrkxhHaEpdl05d@smile.fi.intel.com>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
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

On Tue, Apr 22, 2025 at 10:07:33AM +0200, Geert Uytterhoeven wrote:
> On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:

...

> > +Generic FourCC code
> > +-------------------
> > +
> > +::
> > +       %p4c[hnlb]      gP00 (0x67503030)
> > +
> > +Print a generic FourCC code, as both ASCII characters and its numerical
> > +value as hexadecimal.
> > +
> > +The generic FourCC code is always printed in the big-endian format,
> > +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> > +
> > +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> > +endianness is used to load the stored bytes. The data might be interpreted
> > +using the host byte order, network byte order, little-endian, or big-endian.
> > +
> > +Passed by reference.
> > +
> > +Examples for a little-endian machine, given &(u32)0x67503030::
> > +
> > +       %p4ch   gP00 (0x67503030)
> > +       %p4cn   00Pg (0x30305067)
> > +       %p4cl   gP00 (0x67503030)
> > +       %p4cb   00Pg (0x30305067)
> > +
> > +Examples for a big-endian machine, given &(u32)0x67503030::
> > +
> > +       %p4ch   gP00 (0x67503030)
> > +       %p4cn   00Pg (0x30305067)
> 
> This doesn't look right to me, as network byte order is big endian?
> Note that I didn't check the code.

Yes, network is big endian and this seems right to me. What is the confusion?

> > +       %p4cl   00Pg (0x30305067)
> > +       %p4cb   gP00 (0x67503030)

-- 
With Best Regards,
Andy Shevchenko


