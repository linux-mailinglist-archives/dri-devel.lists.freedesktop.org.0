Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AD5F8686
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 20:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5433A10E328;
	Sat,  8 Oct 2022 18:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E02210E328
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665252991; x=1696788991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q7YlJwn22ePcF+UsrTEOpg8IcVNJxX9fgtN3uSim9/E=;
 b=Cy4RrU9t92ztTMzry6jaPaWlZaLIB+yMDteFQq7drWgDpR+tajmRMi64
 ykD3t070bB43GQAQqvKyud+dBzKSeDr8V9s1IEBmkV0dAcLzqehFOyr7D
 un7mKVNaVlaMrC5a6GwPw82JHRxcdMaLG+ubeZmMsq+l6ls5ltIZoYNjZ
 53DwZoCUDNZvtTqD+V3ypiLvmlGZwi67J28TZLHt2ZD7uotZLAc3Az7tf
 yDSD16lHUMpqwIRCGkVQz2qnC+0rEx1ZaMbO71IBwW04LXG1zegKMQoHN
 5nZHsTBnhmJHREjKkJp2rp/DM/3J4jmEGia2mk3bRlY0E6RcO+5EIrz0B Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10494"; a="301571701"
X-IronPort-AV: E=Sophos;i="5.95,170,1661842800"; d="scan'208";a="301571701"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2022 11:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10494"; a="750899918"
X-IronPort-AV: E=Sophos;i="5.95,170,1661842800"; d="scan'208";a="750899918"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP; 08 Oct 2022 11:16:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ohEN3-0048ft-0Q; Sat, 08 Oct 2022 21:16:21 +0300
Date: Sat, 8 Oct 2022 21:16:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Message-ID: <Y0G+dP9uGaYHSa9y@smile.fi.intel.com>
References: <53DD0148-ED15-4294-8496-9E4B4C7AD061@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53DD0148-ED15-4294-8496-9E4B4C7AD061@chromium.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jan Kara <jack@suse.cz>,
 linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, linux-media@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-crypto@vger.kernel.org,
 patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 08:50:43PM -0700, Kees Cook wrote:
> On October 7, 2022 7:21:28 PM PDT, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> >On Fri, Oct 07, 2022 at 03:47:44PM -0700, Kees Cook wrote:
> >> On Fri, Oct 07, 2022 at 12:01:03PM -0600, Jason A. Donenfeld wrote:

...

> >> These are more fun, but Coccinelle can still do them with a little
> >> Pythonic help:
> >> 
> >> // Find a potential literal
> >> @literal_mask@
> >> expression LITERAL;
> >> identifier randfunc =~ "get_random_int|prandom_u32|get_random_u32";
> >> position p;
> >> @@
> >> 
> >>         (randfunc()@p & (LITERAL))
> >> 
> >> // Add one to the literal.
> >> @script:python add_one@
> >> literal << literal_mask.LITERAL;
> >> RESULT;
> >> @@
> >> 
> >> if literal.startswith('0x'):
> >>         value = int(literal, 16) + 1
> >>         coccinelle.RESULT = cocci.make_expr("0x%x" % (value))
> >> elif literal[0] in '123456789':
> >>         value = int(literal, 10) + 1
> >>         coccinelle.RESULT = cocci.make_expr("%d" % (value))
> >> else:
> >>         print("I don't know how to handle: %s" % (literal))

Wouldn't Python take care about (known) prefixes itself?

	try:
		x = int(literal)
	except ValueError as ex:
		print(..., ex.error)

> >> // Replace the literal mask with the calculated result.
> >> @plus_one@
> >> expression literal_mask.LITERAL;
> >> position literal_mask.p;
> >> expression add_one.RESULT;
> >> identifier FUNC;
> >> @@
> >> 
> >> -       (FUNC()@p & (LITERAL))
> >> +       prandom_u32_max(RESULT)
> >
> >Oh that's pretty cool. I can do the saturation check in python, since
> >`value` holds the parsed result. Neat.
> 
> It is (at least how I have it here) just the string, so YMMV.

...

> >Thanks a bunch for the guidance.
> 
> Sure thing! I was pleased to figure out how to do the python bit.

I believe it can be optimized

-- 
With Best Regards,
Andy Shevchenko


