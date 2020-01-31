Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E0B150248
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25AF6EB37;
	Mon,  3 Feb 2020 08:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701F16E9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 19:45:18 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 11:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,386,1574150400"; d="scan'208";a="223702393"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2020 11:45:17 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ixcE9-0004nZ-Fl; Fri, 31 Jan 2020 21:45:17 +0200
Date: Fri, 31 Jan 2020 21:45:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/4] drm/tiny/repaper: Make driver OF-independent
Message-ID: <20200131194517.GP32742@smile.fi.intel.com>
References: <20200122105403.30035-1-andriy.shevchenko@linux.intel.com>
 <20200124164233.GA6043@ravnborg.org>
 <20200124173134.GJ32742@smile.fi.intel.com>
 <20200124181812.GA7883@ravnborg.org>
 <20200127093939.GR32742@smile.fi.intel.com>
 <20200129202914.GE29646@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202914.GE29646@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 09:29:14PM +0100, Sam Ravnborg wrote:
> On Mon, Jan 27, 2020 at 11:39:39AM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 24, 2020 at 07:18:12PM +0100, Sam Ravnborg wrote:
> > > On Fri, Jan 24, 2020 at 07:31:34PM +0200, Andy Shevchenko wrote:
> > > > On Fri, Jan 24, 2020 at 05:42:33PM +0100, Sam Ravnborg wrote:
> > > > > On Wed, Jan 22, 2020 at 12:54:00PM +0200, Andy Shevchenko wrote:
> > > > > > There is one OF call in the driver that limits its area of use.
> > > > > > Replace it to generic device_get_match_data() and get rid of OF dependency.
> > > > > > 
> > > > > > While here, cast SPI driver data to certain enumerator type.
> > > > 
> > > > > >  enum repaper_model {
> > > > > > +	EXXXXCSXXX = 0,
> > > > > >  	E1144CS021 = 1,
> > > > > >  	E1190CS021,
> > > > > >  	E2200CS021,
> > > > > The new enum value is not used in the following - is it necessary?
> > > > 
> > > > Yes. It explicitly prevents to use 0 for real device.
> > > > 
> > > > This is due to device_get_match_data() returns content of data pointer and thus
> > > > we may not distinguish 0 from NULL pointer.
> > > A name that told this was not a valid name would be descriptive.
> > > As it is now it looks like a wildcard that matches everythign else.
> > 
> > Can you be more precise what you would like to see?
> > Perhaps simple comment will help?
> 
> Maybe just add something like:
> /* 0 is reserved to avoid clashing with NULL */
> 
> And then skip the, at least to my eyes, cryptic EXXXXCSXXX.
> Up to you.

Fine with me, I'll update accordingly.
Thanks!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
