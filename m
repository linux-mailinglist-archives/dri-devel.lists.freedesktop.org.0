Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C284319DD6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 13:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42D789CF2;
	Fri, 12 Feb 2021 12:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B3D8997E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 12:07:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613131619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EowUVygo2zWBdYrKdInlBnVZElDG6W1BRBMq1KZA4PQ=;
 b=VTNBckwI8AjjwpldT/Cw6nYYZkAJXHBsQuKpKnappgkHfBohpi1dV883BSuClkE1ERXoYd
 CeOwxX5M1cEtQt4k1RppQq/lbhyfLREHEI3PAaZ+QSGRlcegRvS0uU88MnEzl1thCTgRR/
 j6O7xaWR5wVlFGaE8xjuG5Zmw57fFbY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95D77AC90;
 Fri, 12 Feb 2021 12:06:59 +0000 (UTC)
Date: Fri, 12 Feb 2021 13:06:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCZvY7tc2xCmtrZ6@alley>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
 <20210209092032.GC32460@paasikivi.fi.intel.com>
 <YCJc0LWBiQLwdmkN@smile.fi.intel.com>
 <20210209174755.GH32460@paasikivi.fi.intel.com>
 <YCVl9BWZQn1TgT2Q@alley>
 <20210212112856.GE3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212112856.GE3@paasikivi.fi.intel.com>
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 2021-02-12 13:28:56, Sakari Ailus wrote:
> On Thu, Feb 11, 2021 at 06:14:28PM +0100, Petr Mladek wrote:
> > On Tue 2021-02-09 19:47:55, Sakari Ailus wrote:
> > > Hi Andy,
> > > 
> > > On Tue, Feb 09, 2021 at 11:58:40AM +0200, Andy Shevchenko wrote:
> > > > On Tue, Feb 09, 2021 at 11:20:32AM +0200, Sakari Ailus wrote:
> > > > > On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> > > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > 
> > > > > > > +       %p4cc   BG12 little-endian (0x32314742)
> > > > > > 
> > > > > > This misses examples of the (strange) escaping cases and wiped
> > > > > > whitespaces to make sure everybody understands that 'D 12' will be the
> > > > > > same as 'D1 2' (side note: which I disagree on, perhaps something
> > > > > > should be added into documentation why).
> 
> I discussed this with Hans and we concluded spaces shouldn't be dropped.
> 
> Spaces can be present in the codes themselves in any case.

Great!

> > 
> > > > 
> > > > ...
> > > > 
> > > > > > > +static noinline_for_stack
> > > > > > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > > > > > +                   struct printf_spec spec, const char *fmt)
> > > > > > > +{
> > > > > > 
> > > > > > > +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > > > > > 
> > > > > > Do we have any evidence / document / standard that the above format is
> > > > > > what people would find good? From existing practices (I consider other
> > > > > > printings elsewhere and users in this series) I find '(xx)' form for
> > > > > > hex numbers is weird. The standard practice is to use \xHH (without
> > > > > > parentheses).
> > > > > 
> > > > > Earlier in the review it was proposed that special handling of codes below
> > > > > 32 should be added, which I did. Using the parentheses is apparently an
> > > > > existing practice elsewhere.
> > > > 
> > > > Where? \xHH is quite well established format for escaping. Never heard about
> > > > '(xx)' variant before this very series.
> > 
> > What about using the same approach as drm_get_format_name()?
> > I mean printing '?' when the character is not printable.
> > The exact value is printed later anyway.
> > 
> > The advantage is that it will always printk 4 characters.
> 
> "?" can be expanded by the shell. We (me and Hans) both though a dot (".")
> would be good. These aren't going to be present in valid fourcc codes in
> any case.

The dot (".") looks fine to me.

Best Regards,
Petr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
