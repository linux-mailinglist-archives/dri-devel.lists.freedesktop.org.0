Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B96A9704D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5253610E5FD;
	Tue, 22 Apr 2025 15:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUSoshsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB4110E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745335078; x=1776871078;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ok4CuGEN5avjbfT8yc/6etSUGAJCYt8kJpHiLOxLja0=;
 b=gUSoshsRs1pnEotu1bjqlhSdsXraZ9YjDHrYYW61fOzGquAEbvkc5pH8
 ARxmXsSP3lgknMfTYwjErIrQP/OVNMLEfx+E59lkab2LklVvbeUY9hRIv
 OHqrYV0lpVNsLPLQKUbYVBnegGp1x3xrgTOhNBbRPQBSzp62ePBBhBOFc
 t6vHbuo50sEusNiKSAo9LarBVHGMnMvYv151YqNq13m+Db7+eNU0qf8Qn
 wSqJicb15Icjir3zvQbJMjaz2L5HPdKUD4HEgXBthX1qqbYDnKINSD/iV
 Idkf3mM0oAf+qnzQC4WTFgU/bx2xUTV7IpNOIBladsSOANgW2Seyh7BcS g==;
X-CSE-ConnectionGUID: z0xwPgZsTEas830UHLbjIQ==
X-CSE-MsgGUID: 6viTZyUmTZmvus5YfuVNVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57551297"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57551297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:17:57 -0700
X-CSE-ConnectionGUID: BiulG9g2TcSzWSoEyERUoA==
X-CSE-MsgGUID: QC0jAJQRSyiQHEULyn93yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="137198029"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:17:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u7FNa-0000000ElLU-1GAZ; Tue, 22 Apr 2025 18:17:46 +0300
Date: Tue, 22 Apr 2025 18:17:46 +0300
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
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <aAezGqdN9weTxv8_@smile.fi.intel.com>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAdsbgx53ZbdvB6p@smile.fi.intel.com>
 <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
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

On Tue, Apr 22, 2025 at 12:32:42PM +0200, Geert Uytterhoeven wrote:
> On Tue, 22 Apr 2025 at 12:16, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 22, 2025 at 10:43:59AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
> > > > On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> > > > > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:

...

> > > > Originally, it was %p4cr (reverse-endian), but on the request of the
> > > > maintainers, it was changed to %p4cn.
> > >
> > > Ah, I found it[1]:
> > >
> > > | so, it needs more information that this mimics htonl() / ntohl() for
> > > networking.
> > >
> > > IMHO this does not mimic htonl(), as htonl() is a no-op on big-endian.
> > > while %p4ch and %p4cl yield different results on big-endian.
> > >
> > > > So here network means reverse of host, not strictly big-endian.
> > >
> > > Please don't call it "network byte order" if that does not have the same
> > > meaning as in the network subsystem.
> > >
> > > Personally, I like "%p4r" (reverse) more...
> > > (and "%p4ch" might mean human-readable ;-)
> >
> > It will confuse the reader. h/r is not very established pair. If you really
> > wont see h/n, better to drop them completely for now then. Because I'm against
> > h/r pair.
> 
> I am not against h/n in se, but I am against bad/confusing naming.
> The big question is: should it print
>   (A) the value in network byte order, or
>   (B) the reverse of host byte order?
> 
> If the answer is (A), I see no real reason to have %p4n, as %p4b prints
> the exact same thing.  Moreover, it leaves us without a portable
> way to print values in reverse without the caller doing an explicit
> __swab32() (which is not compatible with the %p pass-by-pointer
> calling convention).
> 
> If the answer is (B), "%p4n using network byte order" is bad/confusing
> naming.

Other %p extensions that have R/r for "reversed" do not have any H/h part for
"host". That's why if we want reversed, than don't use the host, it should be
default. As I said, I think the best is to remove these for now,

-- 
With Best Regards,
Andy Shevchenko


