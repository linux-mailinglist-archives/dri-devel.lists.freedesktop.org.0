Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CB32D5C6B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 14:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0956E4FE;
	Thu, 10 Dec 2020 13:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC836E4FE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:55:32 +0000 (UTC)
IronPort-SDR: pgbl+TyAG/3doEwvonx2tb3b5m2uMVRERJCZRX2g7GMANyuFqT14dpeT/+mfIL+xzb6b9xg0Jm
 TwpULWl8AdAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="153489127"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="153489127"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:55:32 -0800
IronPort-SDR: do9N5KAms1qR1BOwmxto6A9gdtKSLM0DRNag1vpRcF0IUs+o5GUMiJyk2pQIUo7Qq+z5wAtONr
 3hHkpPXoLG1w==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="371650813"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:55:29 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 1BFBB20867; Thu, 10 Dec 2020 15:55:27 +0200 (EET)
Date: Thu, 10 Dec 2020 15:55:27 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201210135526.GH25763@paasikivi.fi.intel.com>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X9Hdg3lJm+TZAQGX@alley>
 <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
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

On Thu, Dec 10, 2020 at 03:05:02PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 10, 2020 at 2:16 PM Petr Mladek <pmladek@suse.com> wrote:
> > On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > so the same implementation can be used.
> > >
> > > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > Andy, Rasmus,
> >
> > the last version looks fine to me. I am going to push it.
> > Please, speak up if you are against it.
> 
> My concerns are:
> - not so standard format of representation (why not to use
> string_escape_mem() helper?) or is it?

The format string may contain spaces that are not meant to be printed.
Other unprintable chacaters should not be present (at least not in V4L2
pixelformats). The hexadecimal representation is there to convey the
numerical value and that originally came from DRM, not V4L2.

> - no compatibility with generic 4cc
>   (I would rather have an additional specifier here for v4l2 cases.

What do you mean by "generic 4cc"? There are two users of 4cc codes in the
kernel that I know of: V4L2 and DRM. Something that does not refer to
in-memory pixel formats?

> OTOH generic %p4cc to me sounds like an equivalent to %4pEh (but we
> have similar cases with MAC where %6ph is the same as %pM).
> 
> But I'm not insisting on them, consider it like just my 2 cents to the
> discussion.

Ack.

-- 
Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
