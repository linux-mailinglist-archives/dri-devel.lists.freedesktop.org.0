Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6CA64B33B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5862E10E2F3;
	Tue, 13 Dec 2022 10:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBD510E2F3;
 Tue, 13 Dec 2022 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670927238; x=1702463238;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xo4cPD17Q8E85pIFLX7I4jQUoYar/XftlntIfv8FRww=;
 b=bMRrOSDyZOVNKTZmW9THUUeNV/QOEEIR/rJYuoTGATq6VRbN/lO8NV2B
 pVFenEAzsuOWY80HvsuZ7m4LwiHbEojp83vQA48dDS8hP759NCcSXwBwv
 0f1cuMbM29Z+C/eU5/2ERvW/2BIMbxiDRbMab6CRtKaGpSrHG8nxOEm2N
 nQCplyLQ7XHL7I/dbANieFVLEXq6UQX0CSES9EW9Wa+vPpcPLZwE8Uls+
 Pkfll3nWKal4SwIl3s6QUf0mxAaMrvgjveipFHZZEykRp60UtqTeriqs6
 eYpP9AIbP4Thzl3ckFFupvpxAWPMH3ONeybglw9+hTGQTvYJNGTHAqIwO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="404354278"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="404354278"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 02:27:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="598782174"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="598782174"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP; 13 Dec 2022 02:27:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1p52VA-009ALu-2B; Tue, 13 Dec 2022 12:27:08 +0200
Date: Tue, 13 Dec 2022 12:27:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] linux/minmax.h: add non-atomic version
 of xchg
Message-ID: <Y5hTfB+oc1/tWdWQ@smile.fi.intel.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <Y5OE3AX7DS/DfClX@smile.fi.intel.com>
 <398d55d0-3256-238e-132a-195baaf7f4a6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <398d55d0-3256-238e-132a-195baaf7f4a6@intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 11:09:12AM +0100, Andrzej Hajda wrote:
> On 09.12.2022 19:56, Andy Shevchenko wrote:
> > On Fri, Dec 09, 2022 at 04:48:39PM +0100, Andrzej Hajda wrote:

...

> > > I hope there will be place for such tiny helper in kernel.
> > > Quick cocci analyze shows there is probably few thousands places
> > > where it could be used, of course I do not intend to do it :).
> > > 
> > > I was not sure where to put this macro, I hope near swap definition
> > > is the most suitable place.
> > 
> > Ah, swap() in this context is not the same. minmax.h hosts it because
> > it's often related to the swap function in the sort-type algorithms.

> >> Moreover sorry if to/cc is not correct - get_maintainers.pl was
> > > more confused than me, to who address this patch.

...

> > >   include/linux/minmax.h | 14 ++++++++++++++
> > 
> > Does it really suit this header? I would expect something else.
> > Maybe include/linux/non-atomic/xchg.h, dunno.
> 
> non-atomic seems quite strange for me, I would assume everything not in
> atomic is non-atomic, unless explicitly specified.
> 
> > 
> > Btw, have you looked if Ingo's gigantic series have done anything to cmpxchg.h
> > and related headers? Maybe some ideas can be taken from there?
> 
> Grepping it didn't give any clue.
> 
> Looking at 'near' languages just to get an idea (they name the function
> differently):
> 
> C++ [1]: exchange and swap are in utility header
> Rust[2]: replace and swap are in std::mem module
> 
> This is some argument to put them together.

Again, I left the above part on top of this message, the swap() in Linux kernel
is not related to __xchg() or similar. That said, minmax.h is not a good place
for the latter.

> [1]: https://en.cppreference.com/w/cpp/header/utility
> [2]: https://doc.rust-lang.org/std/mem/index.html

-- 
With Best Regards,
Andy Shevchenko


