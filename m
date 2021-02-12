Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A95319C40
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 11:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BFE6E56A;
	Fri, 12 Feb 2021 10:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288276E56A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 10:01:47 +0000 (UTC)
IronPort-SDR: Du89/rXxpF2PoKrhE/AlVIoAsxk2leXpdISuMHFiB+N1bQw9JWu3RVEOVOF2Mwv/EVH3UyRnqr
 xCyuLPlk5F7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="161532620"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="161532620"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 02:01:46 -0800
IronPort-SDR: ehlZTpGZ5wEitMMPpLCdIWlxBduBTxxBfLgyWANj1C32rvXqbw/7Ut+u7zm3dz8zioBr4Iy+ev
 lVydzinX/niA==
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="363665377"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 02:01:42 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id E29C820345;
 Fri, 12 Feb 2021 12:01:40 +0200 (EET)
Date: Fri, 12 Feb 2021 12:01:40 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v6 2/3] v4l: ioctl: Use %p4cc printk modifier to print
 FourCC codes
Message-ID: <20210212100140.GC3@paasikivi.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-3-sakari.ailus@linux.intel.com>
 <YCVb8hxawwd2l2yx@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCVb8hxawwd2l2yx@alley>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mchehab@kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Petr,

On Thu, Feb 11, 2021 at 05:31:46PM +0100, Petr Mladek wrote:
> On Mon 2021-02-08 22:09:02, Sakari Ailus wrote:
> > Now that we can print FourCC codes directly using printk, make use of the
> > feature in V4L2 core.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 85 +++++++---------------------
> >  1 file changed, 21 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 31d1342e61e8..31662c3a8c9e 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -265,13 +265,9 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
> >  {
> >  	const struct v4l2_fmtdesc *p = arg;
> >  
> > -	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
> > +	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%p4cc, mbus_code=0x%04x, description='%.*s'\n",
> 
> Is %p4cc really acceptable here?
> 
> The original code printed only the 4 characters. The original code
> would print something like:
> 
>   index=21, type=bla, flags=0x0, pixelformat=BG12, mbus_code=0x0a9f, descrition="bla bla bla"
> 
> while the new code will do:
> 
>   index=21, type=bla, flags=0x0, pixelformat=BG12 little-endian (0x32314742), mbus_code=0x0a9f, descrition="bla bla bla"
> 
> This is much harder to parse because there are spaces also inside
> pixel_format=<value>

Note that also the fourcc code itself could contains spaces so that's not
new.

The fourcc (debug) form is now one and the same for V4L2 and DRM, but I
guess nothing would prevent adding a shorter form if needed. This is not
continuously happening during streaming so this is also not performance
critical in any way. The fourcc code was used to be printed this way here
mainly because it was, well, easy to do for "just" debugging purposes.

Hans, any opinion?

-- 
Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
