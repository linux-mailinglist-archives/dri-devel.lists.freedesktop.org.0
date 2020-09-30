Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29327E7E5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 13:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A4889A34;
	Wed, 30 Sep 2020 11:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8CD89A34
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 11:52:08 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A6792076B;
 Wed, 30 Sep 2020 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601466728;
 bh=b+UUVp7yg/Xy88+VOq3PGwKPj4epsjdj1Z7Ta82NEkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vF4SjmHOBXqabfycdXzWm4C5m3BiGd2oGtgLyc76At7qPSFh6lYLXhUwN1xgce5T0
 5+4s2yzN27qBOozldoEUetZB7qM1KvhQNEe6b/rt3rT7BSPum33G70uCA/itg2PGvP
 e5j61fytT/nHLPoqDjwMte8LL9iRjJUILyBvWbfM=
Date: Wed, 30 Sep 2020 13:52:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200930115211.GC1603625@kroah.com>
References: <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
 <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
 <20200930071151.GA1152145@PWN>
 <20200930095317.GX438822@phenom.ffwll.local>
 <20200930105553.GA1154238@PWN>
 <CAKMK7uFzWZgs4rvqSXqn_ifr8utG_rNw54+y6CWjdV=Epak-iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFzWZgs4rvqSXqn_ifr8utG_rNw54+y6CWjdV=Epak-iQ@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 01:25:14PM +0200, Daniel Vetter wrote:
> On Wed, Sep 30, 2020 at 12:56 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > On Wed, Sep 30, 2020 at 11:53:17AM +0200, Daniel Vetter wrote:
> > > On Wed, Sep 30, 2020 at 03:11:51AM -0400, Peilin Ye wrote:
> > > > On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> > > > > On Tue, Sep 29, 2020 at 2:34 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > > > > Ah, and speaking of built-in fonts, see fbcon_startup():
> > > > > >
> > > > > >         /* Setup default font */
> > > > > >                 [...]
> > > > > >                 vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
> > > > > >                             ^^^^^^^^^^^^^^^
> > > > > >
> > > > > > This is because find_font() and get_default_font() return a `struct
> > > > > > font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
> > > > > > think we also need to add a `charcount` field to `struct font_desc`.
> > > > >
> > > > > Hm yeah ... I guess maybe struct font_desc should be the starting
> > > > > point for the kernel internal font structure. It's at least there
> > > > > already ...
> > > >
> > > > I see, that will also make handling built-in fonts much easier!
> > >
> > > I think the only downside with starting with font_desc as the internal
> > > font represenation is that there's a few fields we don't need/have for
> > > userspace fonts (like the id/name stuff). So any helpers to e.g. print out
> > > font information need to make sure they don't trip over that
> > >
> > > But otherwise I don't see a problem with this, I think.
> >
> > Yes, and built-in fonts don't use refcount. Or maybe we can let
> > find_font() and get_default_font() kmalloc() a copy of built-in font
> > data, then keep track of refcount for both user and built-in fonts, but
> > that will waste a few K of memory for each built-in font we use...
> 
> A possible trick for this would be to make sure built-in fonts start
> out with a refcount of 1. So never get freed. Plus maybe a check that
> if the name is set, then it's a built-in font and if we ever underflow
> the refcount we just WARN, but don't free anything.
> 
> Another trick would be kern_font_get/put wrappers (we'd want those
> anyway if the userspace fonts are refcounted) and if kern_font->name
> != NULL (i.e. built-in font with name) then we simply don't call
> kref_get/put.

Ick, don't do that, the first trick of having them start out with an
increased reference count is the best way here.  Makes the code simpler
and no special cases for the tear-down path.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
