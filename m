Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96EC31BDA2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 16:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBED6E067;
	Mon, 15 Feb 2021 15:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3586E067
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 15:54:55 +0000 (UTC)
IronPort-SDR: i991wOqzmMGCEvwmd5Bklx0tl58nLuL4l7J+vQ7TImluI3EU4NMKUIAJXYT4iX4FDV+jUyATR/
 VWRBxB5tB69A==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162461988"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; d="scan'208";a="162461988"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 07:54:55 -0800
IronPort-SDR: 8ShrDZEX1xRfNPtXowVlgGEsUgQdW6OsYFrW5szNG2KuWQ5PSEcOxw8GcckjNBocJqT6yMSutm
 bzCD86KeOoDg==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="580212299"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 07:54:51 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lBgD1-005GGC-W7; Mon, 15 Feb 2021 17:54:47 +0200
Date: Mon, 15 Feb 2021 17:54:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCqZR5N6ktABHXNf@smile.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-2-sakari.ailus@linux.intel.com>
 <YCp3sdZoalFSUS7u@smile.fi.intel.com>
 <20210215135650.GI3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210215135650.GI3@paasikivi.fi.intel.com>
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

On Mon, Feb 15, 2021 at 03:56:50PM +0200, Sakari Ailus wrote:
> On Mon, Feb 15, 2021 at 03:31:29PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 15, 2021 at 01:40:28PM +0200, Sakari Ailus wrote:
> > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > so the same implementation can be used.
> > 
> > This version I almost like, feel free to add
> > Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > after considering addressing below nit-picks.

> > > +Examples::
> > > +
> > > +	%p4cc	BG12 little-endian (0x32314742)
> > 
> > No examples with spaces / non-printable / non-ascii characters
> 
> I can sure add an example that has a space. But do you think I really
> should add an example where invalid information is being printed?

I think you have to provide better coverage of what user can get out of this.
Perhaps one example with space and non-printable character is enough.

> > > +	char output[sizeof("1234 little-endian (0x01234567)")];
> > 
> > 1234 -> ABCD ? (Or XY12 to be closer to the reality)
> 
> I count in numbers... albeit the hexadecimal number there starts from zero.
> 
> I guess both would work though.
> 
> 0123 would be consistent.

Since letters can be printed the above is confusing a bit. I think XY12 is
closer to the reality than 0123.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
