Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0387C315561
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 18:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF766EB0E;
	Tue,  9 Feb 2021 17:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001336EB0E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 17:48:02 +0000 (UTC)
IronPort-SDR: MSRfPIUvMXDPNvSujExAPOJG4mHvvmM6vMfieJx7RLxr9/YUHo6TZi7wf8M70gELBDSq12r1Q7
 EM6bTtJQqj+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="266760812"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="266760812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 09:48:01 -0800
IronPort-SDR: HPhu5z9yJh72sOfRkpkjg9hixdDE/CUxkO+VD0EDwuENlRnGe0Kf3BBJG5zYOxKI0UzYuHEK1g
 SrmgntlQAWGg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="359251282"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 09:47:58 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id EDB7A206D0; Tue,  9 Feb 2021 19:47:55 +0200 (EET)
Date: Tue, 9 Feb 2021 19:47:55 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20210209174755.GH32460@paasikivi.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
 <20210209092032.GC32460@paasikivi.fi.intel.com>
 <YCJc0LWBiQLwdmkN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCJc0LWBiQLwdmkN@smile.fi.intel.com>
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Tue, Feb 09, 2021 at 11:58:40AM +0200, Andy Shevchenko wrote:
> On Tue, Feb 09, 2021 at 11:20:32AM +0200, Sakari Ailus wrote:
> > On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> > > On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> =

> ...
> =

> > > > +       %p4cc   BG12 little-endian (0x32314742)
> > > =

> > > This misses examples of the (strange) escaping cases and wiped
> > > whitespaces to make sure everybody understands that 'D 12' will be the
> > > same as 'D1 2' (side note: which I disagree on, perhaps something
> > > should be added into documentation why).
> > =

> > The spaces are expected to be at the end only. I can add such example if
> > you like. There are no fourcc codes with spaces in the middle in neither
> > V4L2 nor DRM, and I don't think the expectation is to have them either.
> =

> But then the code suggests otherwise. Perhaps we need to extract
> skip_trailing_spaces() from strim() and use it here.

But this wouldn't affect the result in this case, would it?

> =

> ...
> =

> > > > +static noinline_for_stack
> > > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > > +                   struct printf_spec spec, const char *fmt)
> > > > +{
> > > =

> > > > +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234=
567)")];
> > > =

> > > Do we have any evidence / document / standard that the above format is
> > > what people would find good? From existing practices (I consider other
> > > printings elsewhere and users in this series) I find '(xx)' form for
> > > hex numbers is weird. The standard practice is to use \xHH (without
> > > parentheses).
> > =

> > Earlier in the review it was proposed that special handling of codes be=
low
> > 32 should be added, which I did. Using the parentheses is apparently an
> > existing practice elsewhere.
> =

> Where? \xHH is quite well established format for escaping. Never heard ab=
out
> '(xx)' variant before this very series.

Mauro referred to FourCC codes while reviewing an earlier version of this,
such as RGB(15).

Does \=D7 imply only the next two characters are hexadecimal? I have to adm=
it
I don't remember seeting that, nor \x notation is common.

> =

> > Note that neither DRM nor V4L2 currently has such fourcc codes currentl=
y.
> =

> ...
> =

> > > > +       p =3D special_hex_number(p, output + sizeof(output) - 2, *f=
ourcc,
> > > > +                              sizeof(u32));
> > > =

> > > This is perfectly one line (in this file we have even longer lines).
> > =

> > Sure, you can do that, and I can then review your patch and point to the
> > coding style documentation. :-)
> =

> Yes, you can. The problem is that we agreed with others to improve readab=
ility
> by letting some lines to be longer, so the code can lie on one line rathe=
r be
> broken on two or more.

Making the end of the line invisible without scrolling vertically doesn't
improve readability for me. It does depend on window width though. I'd
simply only use that if 80 isn't enough.

-- =

Regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
