Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6373E31BAA1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 14:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE396E283;
	Mon, 15 Feb 2021 13:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AF66E283
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 13:56:56 +0000 (UTC)
IronPort-SDR: 07HmCY2E5X0HohDVCTYJMKcNCUXMbpp8RyUu2VZ7Xt19+Mc2fkV27oRulMlrH49HiFEmiZOWGu
 k2mYxs13Q4yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="170344222"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; d="scan'208";a="170344222"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 05:56:55 -0800
IronPort-SDR: MCMVenlFtazkKpfPbx4Daz53OkltSvdknM8NTJ5obPb3zrvw6toEcdwjMcEZssL6gBW0lDrEWA
 NQJeQrFvrZiA==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; d="scan'208";a="512208434"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 05:56:52 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 5AA8D20345;
 Mon, 15 Feb 2021 15:56:50 +0200 (EET)
Date: Mon, 15 Feb 2021 15:56:50 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20210215135650.GI3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-2-sakari.ailus@linux.intel.com>
 <YCp3sdZoalFSUS7u@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCp3sdZoalFSUS7u@smile.fi.intel.com>
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

Hi Andy,

On Mon, Feb 15, 2021 at 03:31:29PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 15, 2021 at 01:40:28PM +0200, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> 
> This version I almost like, feel free to add
> Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> after considering addressing below nit-picks.
> 
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > ---
> >  Documentation/core-api/printk-formats.rst | 16 ++++++++++
> >  lib/test_printf.c                         | 17 ++++++++++
> >  lib/vsprintf.c                            | 39 +++++++++++++++++++++++
> >  scripts/checkpatch.pl                     |  6 ++--
> >  4 files changed, 76 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > index 160e710d992f..da2aa065dc42 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -567,6 +567,22 @@ For printing netdev_features_t.
> >  
> >  Passed by reference.
> >  
> > +V4L2 and DRM FourCC code (pixel format)
> > +---------------------------------------
> > +
> > +::
> > +
> > +	%p4cc
> > +
> > +Print a FourCC code used by V4L2 or DRM, including format endianness and
> > +its numerical value as hexadecimal.
> > +
> > +Passed by reference.
> > +
> > +Examples::
> > +
> > +	%p4cc	BG12 little-endian (0x32314742)
> 
> No examples with spaces / non-printable / non-ascii characters

I can sure add an example that has a space. But do you think I really
should add an example where invalid information is being printed?

> 
> > +
> >  Thanks
> >  ======
> >  
> > diff --git a/lib/test_printf.c b/lib/test_printf.c
> > index 7d60f24240a4..9848510a2786 100644
> > --- a/lib/test_printf.c
> > +++ b/lib/test_printf.c
> > @@ -647,6 +647,22 @@ static void __init fwnode_pointer(void)
> >  	software_node_unregister_nodes(softnodes);
> >  }
> >  
> > +static void __init fourcc_pointer(void)
> > +{
> > +	struct {
> > +		u32 code;
> > +		char *str;
> > +	} const try[] = {
> > +		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
> > +		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
> > +		{ 0x10111213, ".... little-endian (0x10111213)", },
> > +	};
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(try); i++)
> > +		test(try[i].str, "%p4cc", &try[i].code);
> > +}
> > +
> >  static void __init
> >  errptr(void)
> >  {
> > @@ -692,6 +708,7 @@ test_pointer(void)
> >  	flags();
> >  	errptr();
> >  	fwnode_pointer();
> > +	fourcc_pointer();
> >  }
> >  
> >  static void __init selftest(void)
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 3b53c73580c5..432b5a2d1e90 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1733,6 +1733,42 @@ char *netdev_bits(char *buf, char *end, const void *addr,
> >  	return special_hex_number(buf, end, num, size);
> >  }
> >  
> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > +		    struct printf_spec spec, const char *fmt)
> > +{
> > +	char output[sizeof("1234 little-endian (0x01234567)")];
> 
> 1234 -> ABCD ? (Or XY12 to be closer to the reality)

I count in numbers... albeit the hexadecimal number there starts from zero.

I guess both would work though.

0123 would be consistent.

-- 
Regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
