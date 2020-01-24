Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFBB149665
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 16:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68DA6E886;
	Sat, 25 Jan 2020 15:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8995A6E416
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 17:31:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 09:31:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="228370602"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 24 Jan 2020 09:31:33 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iv2nu-0002oh-Om; Fri, 24 Jan 2020 19:31:34 +0200
Date: Fri, 24 Jan 2020 19:31:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/4] drm/tiny/repaper: Make driver OF-independent
Message-ID: <20200124173134.GJ32742@smile.fi.intel.com>
References: <20200122105403.30035-1-andriy.shevchenko@linux.intel.com>
 <20200124164233.GA6043@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124164233.GA6043@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 25 Jan 2020 15:47:14 +0000
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

On Fri, Jan 24, 2020 at 05:42:33PM +0100, Sam Ravnborg wrote:
> On Wed, Jan 22, 2020 at 12:54:00PM +0200, Andy Shevchenko wrote:
> > There is one OF call in the driver that limits its area of use.
> > Replace it to generic device_get_match_data() and get rid of OF dependency.
> > 
> > While here, cast SPI driver data to certain enumerator type.

> >  enum repaper_model {
> > +	EXXXXCSXXX = 0,
> >  	E1144CS021 = 1,
> >  	E1190CS021,
> >  	E2200CS021,
> The new enum value is not used in the following - is it necessary?

Yes. It explicitly prevents to use 0 for real device.

This is due to device_get_match_data() returns content of data pointer and thus
we may not distinguish 0 from NULL pointer.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
