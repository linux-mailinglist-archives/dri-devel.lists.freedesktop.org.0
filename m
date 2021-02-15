Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D231C0B5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 18:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC776E0EE;
	Mon, 15 Feb 2021 17:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF086E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 17:36:21 +0000 (UTC)
IronPort-SDR: M2AoNnJgJEW0v74LUzWht/CoQlLDZdXfzeEE4FEamtErHMkVRfOWv5C3csqucmhEqlw2oLI3ZL
 TqDPB4rGOIgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="161865162"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="161865162"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 09:36:20 -0800
IronPort-SDR: HZkYD9uJOUAnACWzxIm2MliZ5P0Ipj1zDYQXW4WQHugCDmw3twAdYGKZRMCVepphS80ut/iYdr
 m/997U/z7r3w==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="424332046"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 09:36:17 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lBhnC-005HSI-JK; Mon, 15 Feb 2021 19:36:14 +0200
Date: Mon, 15 Feb 2021 19:36:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <YCqxDsCpjODcLhbp@smile.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
 <YCp5+okZ2M0SLTY9@smile.fi.intel.com>
 <20210215172655.GL3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210215172655.GL3@paasikivi.fi.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>, mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 07:26:55PM +0200, Sakari Ailus wrote:
> On Mon, Feb 15, 2021 at 03:41:14PM +0200, Andy Shevchenko wrote:
> ...
> > > +	seq_printf(m, "\t\tuapi: [FB:%d] ", fb ? fb->base.id : 0);
> > > +	if (fb)
> > > +		seq_printf(m, "%p4cc", &fb->format->format);
> > > +	else
> > > +		seq_puts(m, "n/a");
> > 
> > > +	seq_printf(m, ",0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
> > 
> > Why not to keep two seq_printf() calls?
> > 
> > if (fb) {
> > 	seq_printf();
> > } else {
> > 	seq_printf();
> > }
> > 
> > ?
> 
> I could, but it'd repeat a lot of the same format string that is very
> complicated right now. Therefore I thought it's better to split.

It's fine, why not?

> Or do you mean seq_printf() vs. seq_puts()? checkpatch.pl (rightly) warns
> about it.

If it doesn't take run-time parameters, then definitely
if (fb)
	seq_printf();
else
	seq_puts();

> > >  		   fb ? fb->modifier : 0,
> > >  		   fb ? fb->width : 0, fb ? fb->height : 0,
> > >  		   plane_visibility(plane_state),

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
