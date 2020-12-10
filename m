Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE142D5CDE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6656E53C;
	Thu, 10 Dec 2020 14:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0E6E53C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:07:09 +0000 (UTC)
IronPort-SDR: 7eY4mSd2SlT2QcPfSvvH65C56fcP0Qee19RVwcRAzJeRws5j/wZr2XdQC3ZQ/QlL4+hofRNUVy
 dwh/Vt3Xtj3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="154067881"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="154067881"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 06:07:08 -0800
IronPort-SDR: EoDdnLpI+SqnpnRvYnVV7QWUxkweGYOsEBD78Q4+q9L3qi7LLueBvmqYxBZEz3AzFl+ps4cJza
 lVT8w83o2SFA==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="348822288"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 06:07:04 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1knMc1-00DR1Y-Ma; Thu, 10 Dec 2020 16:08:05 +0200
Date: Thu, 10 Dec 2020 16:08:05 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201210140805.GI4077@smile.fi.intel.com>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X9Hdg3lJm+TZAQGX@alley>
 <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
 <20201210135526.GH25763@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210135526.GH25763@paasikivi.fi.intel.com>
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 03:55:27PM +0200, Sakari Ailus wrote:
> On Thu, Dec 10, 2020 at 03:05:02PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 10, 2020 at 2:16 PM Petr Mladek <pmladek@suse.com> wrote:
> > > On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> > > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > > so the same implementation can be used.
> > > >
> > > > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >
> > > Andy, Rasmus,
> > >
> > > the last version looks fine to me. I am going to push it.
> > > Please, speak up if you are against it.
> > 
> > My concerns are:
> > - not so standard format of representation (why not to use
> > string_escape_mem() helper?) or is it?
> 
> The format string may contain spaces that are not meant to be printed.
> Other unprintable chacaters should not be present (at least not in V4L2
> pixelformats). The hexadecimal representation is there to convey the
> numerical value and that originally came from DRM, not V4L2.

Yes, but I mean that we usually anticipate the escaped characters in a form of
'\xNN' (hex) or '\NNN' (octal). The format '(NN)' is quite unusual to me.

> > - no compatibility with generic 4cc
> >   (I would rather have an additional specifier here for v4l2 cases.
> 
> What do you mean by "generic 4cc"? There are two users of 4cc codes in the
> kernel that I know of: V4L2 and DRM. Something that does not refer to
> in-memory pixel formats?

Of course. Everything else. 4cc is a generic term to describe something which
is of 4 characters long [1]. It's not limited by media file formats. And
moreover some (chip) vendors are using it as well (Synopsys).
Microsoft uses 4cc in CSRT ACPI table for vendor field and so on...

[1]: https://en.wikipedia.org/wiki/FourCC

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
