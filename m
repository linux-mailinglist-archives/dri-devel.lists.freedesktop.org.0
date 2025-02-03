Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A220A255A9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 10:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9C110E034;
	Mon,  3 Feb 2025 09:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpvVqwct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064D910E034
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738574368; x=1770110368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Xgv9cXby25MnVXgPbDZH0JSH1bW2Lin3jEG1CUba0Us=;
 b=jpvVqwct8sFDkTV6voMQxXPXHIDYWtbr5MxPP0qv0TGzLdFhokeK+GhJ
 dqbTf+uN87MBE+EYk25dsjSl4DcYsi3WceR8T7bjXA/uirqdx+0vZB9ks
 Iq0cdvz9I97L+L9lzhoMpPbaVKFL84HJStmcUf5KOiJTOE27oZfqR/TXy
 Amtztr5oSD+77fyw6ieuwytJA+7GUsSiKuq2aGivXQ6Vh6NnM6JOHPy4u
 6MYYlJHrHUDlhHu6xkzaSHBG92eSAMMxUyR2e43wUDfg59jTETzhW7LHd
 NGUtSB/63inxwEKLfTZMaDrN5z3G44S9orMGC8Wr1nX1stND11oW5Crlj Q==;
X-CSE-ConnectionGUID: OXcBvTQpS1elaf4hi8D5CA==
X-CSE-MsgGUID: Zt9C5UOSQm+kk29t+jRoug==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="50448247"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="50448247"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:19:28 -0800
X-CSE-ConnectionGUID: +bqc7yNkQ06rdEd5R5s9WA==
X-CSE-MsgGUID: XE2gxrdCTdixbMGJbvgpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110806587"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:19:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tesbz-00000007maz-0agV; Mon, 03 Feb 2025 11:19:23 +0200
Date: Mon, 3 Feb 2025 11:19:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z6CKGu7URC1iGOVO@smile.fi.intel.com>
References: <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
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

On Sat, Feb 01, 2025 at 07:18:56PM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 29, 2025 at 05:07:52PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 28, 2025 at 06:43:26PM +0200, Andy Shevchenko wrote:
> > > On Tue, Jan 28, 2025 at 05:08:08PM +0100, Marek Szyprowski wrote:
> > > > On 21.01.2025 14:29, Andy Shevchenko wrote:
> > > > > On Tue, Jan 21, 2025 at 08:33:09AM +0100, Marek Szyprowski wrote:
> > > > >> On 17.01.2025 18:28, Andy Shevchenko wrote:
> > > > >>> On Fri, Jan 17, 2025 at 05:05:42PM +0100, Marek Szyprowski wrote:
> > > > >>>
> > > > >>> Does it fail in the same way?
> > > > >> Yes, the hw revision is reported as zero in this case: LT9611 revision:
> > > > >> 0x00.00.00
> > > > > Hmm... This is very interesting! It means that the page selector is a bit
> > > > > magical there. Dmitry, can you chime in and perhaps shed some light on this?
> > > > >
> > > > >>>> Does it mean that there is really a bug in the driver?
> > > > >>> Without looking at the datasheet it's hard to say. At least what I found so far
> > > > >>> is one page of the I²C traffic dump on Windows as an example how to use their
> > > > >>> evaluation board and software, but it doesn't unveil the bigger picture. At
> > > > >>> least what I think is going on here is that the programming is not so easy as
> > > > >>> just paging. Something is more complicated there.
> > > > >>>
> > > > >>> But at least (and as Mark said) the most of the regmap based drivers got
> > > > >>> the ranges wrong (so, at least there is one bug in the driver).
> > > > >> I can do more experiments if this helps. Do you need a dump of all
> > > > >> regmap accesses or i2c traffic from this driver?
> > > > > It would be helpful! Traces from the failed and non-failed cases
> > > > > till the firmware revision and chip ID reading would be enough to
> > > > > start with.
> > > > 
> > > > I'm sorry for the delay, I was a bit busy with other stuff.
> > > 
> > > No problem and thanks for sharing.
> > > 
> > > > Here are logs (all values are in hex):
> > > > 
> > > > next-20250128 (probe broken):
> > > > root@target:~# dmesg | grep regmap
> > > > [   14.817604] regmap_write reg 80ee <- 1
> > > > [   14.823036] regmap_read reg 8100 -> 0
> > > > [   14.827631] regmap_read reg 8101 -> 0
> > > > [   14.832130] regmap_read reg 8102 -> 0
> > > 
> > > 
> > > 
> > > > next-20250128 + 1fd60ed1700c reverted (probe okay):
> > > > root@target:~# dmesg | grep regmap
> > > > [   13.565920] regmap_write reg 80ee <- 1
> > > > [   13.567509] regmap_read reg 8100 -> 17
> > > > [   13.568219] regmap_read reg 8101 -> 4
> > > > [   13.568909] regmap_read reg 8102 -> 93
> > > 
> > > Something is missing here. Like we have an identical start and an immediate
> > > failure. If you did it via printk() approach, it's probably wrong as my patch
> > > uses internal regmap function. Most likely you need to enable trace events
> > > for regmap and collect those for let's say 2 seconds:
> > > 
> > > 	echo 1 > ...trace events...
> > > 	modprobe ...
> > > 	sleep 2
> > > 	echo 0 > ...trace events...
> > > 
> > > and dump the buffer to a file. It might have though more than needed
> > > as some other devices might also use regmap at the same time. I don't remember
> > > if the trace events for regmap have a device instance name field which can be
> > > used as a filter.
> > > 
> > > Alternatively you may also try to add a printk() into regmap core, but I don't
> > > think it's more practical than trace events.
> > 
> > Meanwhile, can you test this patch (on top of non-working case)?
> > 
> > diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> > index 2314744201b4..f799a7a80231 100644
> > --- a/drivers/base/regmap/regmap.c
> > +++ b/drivers/base/regmap/regmap.c
> > @@ -1553,8 +1553,19 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
> >  		 * virtual copy as well.
> >  		 */
> >  		if (page_chg &&
> > -		    in_range(range->selector_reg, range->window_start, range->window_len))
> > +		    in_range(range->selector_reg, range->window_start, range->window_len)) {
> > +			bool bypass, cache_only;
> > +
> > +			bypass = map->cache_bypass;
> > +			cache_only = map->cache_only;
> > +			map->cache_bypass = false;
> > +			map->cache_only = true;
> > +
> >  			_regmap_update_bits(map, sel_register, mask, val, NULL, false);
> > +
> > +			map->cache_bypass = bypass;
> > +			map->cache_only = cache_only;
> > +		}
> >  	}
> >  
> >  	*reg = range->window_start + win_offset;
> > 
> > If I understood the case, the affected driver doesn't use case and we actually
> > write to the selector register twice which most likely messes up the things.
> 
> Unfortunately I can not comment regarding the LT9611UXC itself, the
> datasheet that I have here is pretty cryptic, incomplete and partially
> written in Mandarin.
> 
> This patch though fixes an issue for me too, So:
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # Qualcomm RB1

Thank you, guys, for reporting an testing, but it seems the simple problem
to solve requires a lot of changes to be done without regressions
(this fix on fix makes a regression to those who have cache enabled), which
means that for now I propose to revert it (or drop) if possible, Mark,
what is your preference?

> > But this is only a theory (since we don't have the traces yet).

-- 
With Best Regards,
Andy Shevchenko


