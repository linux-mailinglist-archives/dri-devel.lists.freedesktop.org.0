Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E95314118
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA24F6E9FC;
	Mon,  8 Feb 2021 20:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E9B6E9FC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:59:07 +0000 (UTC)
IronPort-SDR: r/d3ViLLVAz9yTjv9N128XoHfXPi5t0Clxw2kIpUdtJNw9+PagZsNENZyF8pDgVJSEP4OUVTTP
 czn3BqavJTeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="181924470"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="181924470"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 12:59:03 -0800
IronPort-SDR: xI+wR9shPytXsExmurvrnFJimgsZjNsYASJNJlJ/tIqUMmIipi+s6krvnVr/PH3Y6ShSXi12HR
 LkMo27ukJxJw==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="418346627"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 12:58:58 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1l9DcV-0033nx-B3; Mon, 08 Feb 2021 22:58:55 +0200
Date: Mon, 8 Feb 2021 22:58:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCGmD1d1Zn+EhrDH@smile.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
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

On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:

...

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


To be on constructive side, I would propose to replace above with something
like:

__le32 val;

val = cpu_to_le32(*fourcc & ~BIT(31));

p += string_escape_mem(&val, sizeof(*fourcc), output, sizeof(output), ESCAPE_NP | ESCAPE_HEX, NULL);


-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
