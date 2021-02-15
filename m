Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F2831BFBF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 17:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B6E6E8FD;
	Mon, 15 Feb 2021 16:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80206E8FD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 16:51:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613407901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ONeikQRqvI8vO+u2stRNdyN0o/niRr+9mGXHQZCXCpw=;
 b=tdKGa5VF4nYtqpU6FUa8Wn78eOmIAtepFjkmtjM7/ybo1cxrmUcZwE3D9pBP/3bV0tKjZb
 KEuBsR3lHjqJsxE+uW/D+Dt4yFvQRaPhdbJ1laV43+G40MiH5LB+mTSLXGWdAG9SJNkqXo
 z1QulDqYZiDoZtOgbs0MBvp+v0s1QLg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43FE5AD19;
 Mon, 15 Feb 2021 16:51:41 +0000 (UTC)
Date: Mon, 15 Feb 2021 17:51:40 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCqmnG9r2gogFPsH@alley>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-2-sakari.ailus@linux.intel.com>
 <YCp3sdZoalFSUS7u@smile.fi.intel.com>
 <20210215135650.GI3@paasikivi.fi.intel.com>
 <YCqZR5N6ktABHXNf@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCqZR5N6ktABHXNf@smile.fi.intel.com>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Joe Perches <joe@perches.com>,
 mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 2021-02-15 17:54:47, Andy Shevchenko wrote:
> On Mon, Feb 15, 2021 at 03:56:50PM +0200, Sakari Ailus wrote:
> > On Mon, Feb 15, 2021 at 03:31:29PM +0200, Andy Shevchenko wrote:
> > > On Mon, Feb 15, 2021 at 01:40:28PM +0200, Sakari Ailus wrote:
> > > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > > so the same implementation can be used.
> > > 
> > > This version I almost like, feel free to add
> > > Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > after considering addressing below nit-picks.
> 
> > > > +Examples::
> > > > +
> > > > +	%p4cc	BG12 little-endian (0x32314742)
> > > 
> > > No examples with spaces / non-printable / non-ascii characters
> > 
> > I can sure add an example that has a space. But do you think I really
> > should add an example where invalid information is being printed?
> 
> I think you have to provide better coverage of what user can get out of this.
> Perhaps one example with space and non-printable character is enough.
> 
> > > > +	char output[sizeof("1234 little-endian (0x01234567)")];
> > > 
> > > 1234 -> ABCD ? (Or XY12 to be closer to the reality)
> > 
> > I count in numbers... albeit the hexadecimal number there starts from zero.
> > 
> > I guess both would work though.
> > 
> > 0123 would be consistent.
> 
> Since letters can be printed the above is confusing a bit. I think XY12 is
> closer to the reality than 0123.

Ailus, are you going to send v8 with the two small changes? I mean a
selftest with the space and the above sample code.

Anyway, feel free to add:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
