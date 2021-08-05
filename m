Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBB73E13FD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9128D6E107;
	Thu,  5 Aug 2021 11:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF556E107
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 11:38:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBDD960C51;
 Thu,  5 Aug 2021 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628163488;
 bh=ugZWR/yfSjuppoNeY9Xc2waupdhAYEJVcwZWQy5UVz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jSxJyvEDQq7T5RXxWwCfec8wKcUrnEsXVl0F8bbzoQOPMTzfxNygKG6Z2GxA1ZtOi
 I0R1FQDy8bchr8WX0iVDP/0ZUOfavf/29fRyRCn8K7r5Vsy5oKA2wl5ayitsYgk8VW
 YZSKECv4rjzH4gnbyJ8lUYB7jlyFwyFTOCqOfctk=
Date: Thu, 5 Aug 2021 13:38:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
Message-ID: <YQvNnf0o9w4fdVjr@kroah.com>
References: <20210801085155.3170-1-len.baker@gmx.com>
 <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
 <YQvJB5s1zY2yO87D@kroah.com>
 <CAHp75VeUH3+dZ6scREA-sZz8-7AF_MLobde+2-eZJz=MsxaW0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeUH3+dZ6scREA-sZz8-7AF_MLobde+2-eZJz=MsxaW0Q@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 05, 2021 at 02:30:35PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 5, 2021 at 2:18 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Sun, Aug 01, 2021 at 02:40:40PM +0300, Andy Shevchenko wrote:
> > > On Sun, Aug 1, 2021 at 11:53 AM Len Baker <len.baker@gmx.com> wrote:
> > > >
> > > > strcpy() performs no bounds checking on the destination buffer. This
> > > > could result in linear overflows beyond the end of the buffer, leading
> > > > to all kinds of misbehaviors. So, this serie removes all strcpy uses
> > > > from the "staging/fbtft" subsystem.
> > > >
> > > > Also, refactor the code a bit to follow the kernel coding-style and
> > > > avoid unnecessary variable initialization.
> > >
> > > I don't see patch 3 (even on lore.kernel.org).
> > >
> > > Greg, Geert, does it make sense to move this driver outside of staging?
> >
> > If you clean up everything that needs to be done, yes, please do.
> 
> Do we have a clear TODO for that?
> 
> The current one has the item which is not feasible to achieve in
> reasonable time. Some of those drivers won't be converted to tiny DRM.
> So the idea is to keep this out of staging in the maintenance phase
> (as it currently states, i.e. no new drivers accepted).  For the rest
> I'm not sure what else can be done (checkpatch? coccinelle?).
> Actually the first sentence in this paragraph is a motivation for
> moving out of staging.

Take it up with the DRM developers/maintainers.  If they approve for
this to move out of staging without being converted over to use tiny
DRM, then I am fine to move it out.

thnks,

greg k-h
