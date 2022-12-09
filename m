Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62706488B5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 19:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE0B10E584;
	Fri,  9 Dec 2022 18:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55EF10E584;
 Fri,  9 Dec 2022 18:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670612303; x=1702148303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GLZEjablCncQpXUOWVL33N7CySi7CSJ/kg3y/b9Oykg=;
 b=joemDmTsWby9iK5YZZGZNNLm9J6/h1x2kREEEZbk78k9LRI9ZVnDU/mV
 2olD/g8Oj1AFyebcuMnOFkQA8KmVzB65bzM4vi7QbvxJxqe4OPVN30Xzm
 FDFbslTrfNeQAIxyTNb0N3fJC6xp78P3kHPjMzqnpl4OGyUiut37oboB7
 UP/LUXEDvjiZLd0zsVRfGuc13LK7ju3vmI3SQroTfbw3TesILcu6F0Rhp
 QuYkKP5MTHrQ132OYqUmoXHek1E6GyUfBc5EWhgpo+xEQQ95c4AJJkIpu
 RF+jvgybShIDLiX/hvw8E1GkWZydbHb+ZxszYgN29TBUMwVa1qBnkk4ZP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="379742697"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; d="scan'208";a="379742697"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 10:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="736305871"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; d="scan'208";a="736305871"
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2022 10:58:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1p3iZe-00788E-1g; Fri, 09 Dec 2022 20:58:18 +0200
Date: Fri, 9 Dec 2022 20:58:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 1/5] linux/minmax.h: add non-atomic version of xchg
Message-ID: <Y5OFSvaYbv4XCxhE@smile.fi.intel.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <Y5OE3AX7DS/DfClX@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5OE3AX7DS/DfClX@smile.fi.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 09, 2022 at 08:56:28PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 09, 2022 at 04:48:39PM +0100, Andrzej Hajda wrote:

...

> > I hope there will be place for such tiny helper in kernel.
> > Quick cocci analyze shows there is probably few thousands places
> > where it could be used, of course I do not intend to do it :).
> > 
> > I was not sure where to put this macro, I hope near swap definition
> > is the most suitable place.
> 
> Ah, swap() in this context is not the same. minmax.h hosts it because
> it's often related to the swap function in the sort-type algorithms.
> 
> > Moreover sorry if to/cc is not correct - get_maintainers.pl was
> > more confused than me, to who address this patch.
> 
> ...
> 
> >  include/linux/minmax.h | 14 ++++++++++++++
> 
> Does it really suit this header? I would expect something else.

> Maybe include/linux/non-atomic/xchg.h, dunno.

It may become a candidate to host io-64 non-atomic versions and other
non-atomic generic headers...

> Btw, have you looked if Ingo's gigantic series have done anything to cmpxchg.h
> and related headers? Maybe some ideas can be taken from there?

-- 
With Best Regards,
Andy Shevchenko


