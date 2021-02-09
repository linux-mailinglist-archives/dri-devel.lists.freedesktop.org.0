Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C12314C45
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 10:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059176EAAB;
	Tue,  9 Feb 2021 09:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1BA6EAAB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 09:58:47 +0000 (UTC)
IronPort-SDR: ognXsWFLBRTwrKIbZtKd7PiDufqfL0q0bWzWShenIq5DbQNc3oO1fwUWDrPGR+EDVvp7APpfI/
 mCzcUkD6lokQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="161606294"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="161606294"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 01:58:47 -0800
IronPort-SDR: T0qTs/2i2PqBJXc5IrRTpS6kpOrU/SRzXxopGHG1/kUrdforSp9RRZLCJI15PCgXsR6DLCOQT6
 lslQrLAfLUyQ==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="374903061"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 01:58:43 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1l9Pn6-003Bop-Ba; Tue, 09 Feb 2021 11:58:40 +0200
Date: Tue, 9 Feb 2021 11:58:40 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCJc0LWBiQLwdmkN@smile.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
 <20210209092032.GC32460@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209092032.GC32460@paasikivi.fi.intel.com>
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

On Tue, Feb 09, 2021 at 11:20:32AM +0200, Sakari Ailus wrote:
> On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:

...

> > > +       %p4cc   BG12 little-endian (0x32314742)
> > 
> > This misses examples of the (strange) escaping cases and wiped
> > whitespaces to make sure everybody understands that 'D 12' will be the
> > same as 'D1 2' (side note: which I disagree on, perhaps something
> > should be added into documentation why).
> 
> The spaces are expected to be at the end only. I can add such example if
> you like. There are no fourcc codes with spaces in the middle in neither
> V4L2 nor DRM, and I don't think the expectation is to have them either.

But then the code suggests otherwise. Perhaps we need to extract
skip_trailing_spaces() from strim() and use it here.

...

> > > +static noinline_for_stack
> > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > +                   struct printf_spec spec, const char *fmt)
> > > +{
> > 
> > > +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > 
> > Do we have any evidence / document / standard that the above format is
> > what people would find good? From existing practices (I consider other
> > printings elsewhere and users in this series) I find '(xx)' form for
> > hex numbers is weird. The standard practice is to use \xHH (without
> > parentheses).
> 
> Earlier in the review it was proposed that special handling of codes below
> 32 should be added, which I did. Using the parentheses is apparently an
> existing practice elsewhere.

Where? \xHH is quite well established format for escaping. Never heard about
'(xx)' variant before this very series.

> Note that neither DRM nor V4L2 currently has such fourcc codes currently.

...

> > > +       p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > > +                              sizeof(u32));
> > 
> > This is perfectly one line (in this file we have even longer lines).
> 
> Sure, you can do that, and I can then review your patch and point to the
> coding style documentation. :-)

Yes, you can. The problem is that we agreed with others to improve readability
by letting some lines to be longer, so the code can lie on one line rather be
broken on two or more.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
