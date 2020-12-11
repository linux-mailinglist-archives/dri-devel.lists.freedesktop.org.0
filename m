Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551882D7585
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 13:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2648A6EDD3;
	Fri, 11 Dec 2020 12:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3216EDCA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 12:20:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1607689206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ry4k1Jsdm3vlFU20HrZ+MYAC/2X5vwpO1rLuDGEhhFQ=;
 b=SXHKcrSaYtjWWuxEEvh32Gc10GeTx1hiV4s4YLBfKcAK/jJJ/VeiTAxPeDC/7iZ9yHTCqV
 jOnadeJiApbfTaWjEIP5SPZadIJCoR4nHugjRvUpeV/LPDnCUa4Aw+P0pikfvftdcKf8RP
 BrXy8SEoNOqrxsNWCPF7hTByiqSz7is=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE63CAC10;
 Fri, 11 Dec 2020 12:20:06 +0000 (UTC)
Date: Fri, 11 Dec 2020 13:20:05 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <X9Nj9U5Vjq/0sN6M@alley>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X9Hdg3lJm+TZAQGX@alley>
 <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
 <20201210135526.GH25763@paasikivi.fi.intel.com>
 <20201210140805.GI4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210140805.GI4077@smile.fi.intel.com>
X-Mailman-Approved-At: Fri, 11 Dec 2020 12:26:42 +0000
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
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Joe Perches <joe@perches.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 2020-12-10 16:08:05, Andy Shevchenko wrote:
> On Thu, Dec 10, 2020 at 03:55:27PM +0200, Sakari Ailus wrote:
> > On Thu, Dec 10, 2020 at 03:05:02PM +0200, Andy Shevchenko wrote:
> > > My concerns are:
> > > - not so standard format of representation (why not to use
> > > string_escape_mem() helper?) or is it?
> > 
> > The format string may contain spaces that are not meant to be printed.
> > Other unprintable chacaters should not be present (at least not in V4L2
> > pixelformats). The hexadecimal representation is there to convey the
> > numerical value and that originally came from DRM, not V4L2.
> 
> Yes, but I mean that we usually anticipate the escaped characters in a form of
> '\xNN' (hex) or '\NNN' (octal). The format '(NN)' is quite unusual to me.

It is true that I have been a bit confused when I saw it.


> > > - no compatibility with generic 4cc
> > >   (I would rather have an additional specifier here for v4l2 cases.
> > 
> > What do you mean by "generic 4cc"? There are two users of 4cc codes in the
> > kernel that I know of: V4L2 and DRM. Something that does not refer to
> > in-memory pixel formats?
> 
> Of course. Everything else. 4cc is a generic term to describe something which
> is of 4 characters long [1]. It's not limited by media file formats. And
> moreover some (chip) vendors are using it as well (Synopsys).
> Microsoft uses 4cc in CSRT ACPI table for vendor field and so on...

Honestly, I do not even know where exactly it is going to be used.

I did not have strong opinion. So I just followed the long discussions
about previous revisions. Some people loved it from the beginning.
Some people were concerned. Anyway, there were discussed only
implementation details in the last two revisions, so I assumed that
the idea was more or less accepted.

Would it help to send another revision with some existing DRM and
V4L2 code converted to use it?

It would help me/us to see how much different it is from the current
output. Also it will require ack from the affected subsystem
maintainers and developers.

Best Regqrds,
Petr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
