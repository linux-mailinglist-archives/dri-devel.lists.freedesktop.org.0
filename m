Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DB4314B80
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 10:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755E06EB3D;
	Tue,  9 Feb 2021 09:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DB86EB3D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 09:20:38 +0000 (UTC)
IronPort-SDR: Nr2ykxY3pNDje7VtSrUxV3PRT31dY8V7FS6rZKC+IccUeeBpD8hQqNJQTp3MEHj/OJG1qn4qbY
 9e6QRGPEdBiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="200923383"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="200923383"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 01:20:37 -0800
IronPort-SDR: +Z/5X24YSvj/nQVhkOlB08Xo4zq6U6D4CCsGwSc7d2XzQVC+10oR8jwhB2k54f/Kjo7zZeTa+9
 UgZVBYxFb1Sw==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="360442487"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 01:20:34 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 70B12206D0; Tue,  9 Feb 2021 11:20:32 +0200 (EET)
Date: Tue, 9 Feb 2021 11:20:32 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20210209092032.GC32460@paasikivi.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> 
> Thank you for an update with the examples how current users will be
> converted. Below review is based on the users I had seen so far and
> assumptions made in this code. I see that it's tagged by maintainers,
> but I can't help to comment again on this. In any case the decision is
> up to them.
> 
> ...
> 
> > +V4L2 and DRM FourCC code (pixel format)
> > +---------------------------------------
> > +
> > +::
> > +
> > +       %p4cc
> > +
> > +Print a FourCC code used by V4L2 or DRM, including format endianness and
> > +its numerical value as hexadecimal.
> > +
> > +Passed by reference.
> > +
> > +Examples::
> > +
> > +       %p4cc   BG12 little-endian (0x32314742)
> 
> This misses examples of the (strange) escaping cases and wiped
> whitespaces to make sure everybody understands that 'D 12' will be the
> same as 'D1 2' (side note: which I disagree on, perhaps something
> should be added into documentation why).

The spaces are expected to be at the end only. I can add such example if
you like. There are no fourcc codes with spaces in the middle in neither
V4L2 nor DRM, and I don't think the expectation is to have them either.

> 
> ...
> 
> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > +                   struct printf_spec spec, const char *fmt)
> > +{
> 
> > +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> 
> Do we have any evidence / document / standard that the above format is
> what people would find good? From existing practices (I consider other
> printings elsewhere and users in this series) I find '(xx)' form for
> hex numbers is weird. The standard practice is to use \xHH (without
> parentheses).

Earlier in the review it was proposed that special handling of codes below
32 should be added, which I did. Using the parentheses is apparently an
existing practice elsewhere.

Note that neither DRM nor V4L2 currently has such fourcc codes currently.

> 
> > +       char *p = output;
> > +       unsigned int i;
> > +       u32 val;
> > +
> > +       if (fmt[1] != 'c' || fmt[2] != 'c')
> > +               return error_string(buf, end, "(%p4?)", spec);
> > +
> > +       if (check_pointer(&buf, end, fourcc, spec))
> > +               return buf;
> > +
> > +       val = *fourcc & ~BIT(31);
> > +
> > +       for (i = 0; i < sizeof(*fourcc); i++) {
> > +               unsigned char c = val >> (i * 8);
> 
> ...
> 
> > +               /* Weed out spaces */
> > +               if (c == ' ')
> > +                       continue;
> 
> None of the existing users does that. Why?

The existing instances of printing fourcc codes in V4L2 are scattered
around with priority on implementation simplicity. As we have a single
simplementation here, I'm not really worried about that.

> 
> > +               /* Print non-control ASCII characters as-is */
> > +               if (isascii(c) && isprint(c)) {
> > +                       *p++ = c;
> > +                       continue;
> > +               }
> > +
> > +               *p++ = '(';
> > +               p = hex_byte_pack(p, c);
> > +               *p++ = ')';
> > +       }
> > +
> > +       strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
> > +       p += strlen(p);
> > +
> > +       *p++ = ' ';
> > +       *p++ = '(';
> 
> > +       p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > +                              sizeof(u32));
> 
> This is perfectly one line (in this file we have even longer lines).

Sure, you can do that, and I can then review your patch and point to the
coding style documentation. :-)

> 
> > +       *p++ = ')';
> > +       *p = '\0';
> > +
> > +       return string(buf, end, output, spec);
> > +}
> 

-- 
Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
