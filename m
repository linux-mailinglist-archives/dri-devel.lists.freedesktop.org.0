Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E42284EA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 18:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFAC89D61;
	Tue, 21 Jul 2020 16:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F6C89D61
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:08:29 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53A2822BEF;
 Tue, 21 Jul 2020 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595347708;
 bh=bE63ofQYOuJCDHkwYPXWxgUsUB8i3gu/kQjGh79M6RE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xFvxtf5wi2negsmKSYII+qpSHBLTYdCnnn1E0C3PnhkIMZ5dLJpDtmr/u3sHC02tp
 5SFo/r2n+QH+plLsBmzNni4khMvB0xAz1nF4iEYpE1pkmsE3xbjCem+tGPH7LyX6Zl
 gzEPDSCll+1qsyOeLZOs4Eo1NUB9nWPMPxhDPYHA=
Date: Tue, 21 Jul 2020 18:08:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
Message-ID: <20200721160836.GA2109047@kroah.com>
References: <adff5d10-fe35-62d4-74c5-182958c5ada7@i-love.sakura.ne.jp>
 <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200715094836.GD2571@kadam>
 <9e6eac10-c5c3-f518-36cc-9ea32fb5d7fe@i-love.sakura.ne.jp>
 <b50f85c7-80e5-89c5-0aca-31d8e9892665@i-love.sakura.ne.jp>
 <20200715151220.GE2571@kadam>
 <adfa8720-c411-dfe6-6b0f-7591dd95396c@i-love.sakura.ne.jp>
 <20200716100006.GN3278063@phenom.ffwll.local>
 <b202b74b-6a7b-e2be-2350-72144331303b@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b202b74b-6a7b-e2be-2350-72144331303b@i-love.sakura.ne.jp>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>, Dmitry Vyukov <dvyukov@google.com>,
 Jiri Slaby <jslaby@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 08:27:21PM +0900, Tetsuo Handa wrote:
> On 2020/07/16 19:00, Daniel Vetter wrote:
> > On Thu, Jul 16, 2020 at 12:29:00AM +0900, Tetsuo Handa wrote:
> >> On 2020/07/16 0:12, Dan Carpenter wrote:
> >>> I've complained about integer overflows in fbdev for a long time...
> >>>
> >>> What I'd like to see is something like the following maybe.  I don't
> >>> know how to get the vc_data in fbmem.c so it doesn't include your checks
> >>> for negative.
> >>
> >> Yes. Like I said "Thus, I consider that we need more sanity/constraints checks." at
> >> https://lore.kernel.org/lkml/b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp/ ,
> >> we want basic checks. That's a task for fbdev people who should be familiar with
> >> necessary constraints.
> > 
> > I think the worldwide supply of people who understand fbdev and willing to
> > work on it is roughly 0. So if someone wants to fix this mess properly
> > (which likely means adding tons of over/underflow checks at entry points,
> > since you're never going to catch the driver bugs, there's too many and
> > not enough people who care) they need to fix this themselves.
> 
> But I think we can enforce reasonable constraint which is much stricter than Dan's basic_checks()
> (which used INT_MAX). For example, do we need to accept var->{xres,yres} >= 1048576, for
> "32768 rows or cols" * "32 pixels per character" = 1045876 and vc_do_resize() accepts only
> rows and cols < 32768 ?
> 
> > 
> > Just to avoid confusion here.
> > 
> >> Anyway, my two patches are small and low cost; can we apply these patches regardless
> >> of basic checks?
> > 
> > Which two patches where?
> 
> [PATCH v3] vt: Reject zero-sized screen buffer size.
>  from https://lkml.kernel.org/r/20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp

This is now in my tree.

> [PATCH v2] fbdev: Detect integer underflow at "struct fbcon_ops"->clear_margins.
>  from https://lkml.kernel.org/r/20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp

That should be taken by the fbdev maintainer, but I can take it too if
people want.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
