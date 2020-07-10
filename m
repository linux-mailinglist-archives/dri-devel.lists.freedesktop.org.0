Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E1221B43D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 13:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EFC6EBDC;
	Fri, 10 Jul 2020 11:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A1D6EBDC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 11:47:25 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6754220748;
 Fri, 10 Jul 2020 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594381645;
 bh=aUbwxnhzldFAyuc22ri8g/HTDk1iwKiwpZ+hqPfkEHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VibZTirQJPPjJ3rrQpdxKJ4MYdLx87y9kuzMC9NGruczENB+5AOjZpIgjhY3PS+/R
 Ag6paHYL9nM46UmUV26gCErmpI70+/pMalhu6hVRd0P+yrLK7U5BrpqRXxVzvjOdUD
 MVc0jTZFSJEK60uBjeFWGCrnv6HC77WEcYE0hg64=
Date: Fri, 10 Jul 2020 13:47:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200710114730.GA1349359@kroah.com>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
 <20200416102508.GA820251@kroah.com>
 <20200420082207.ui7iyg7dsnred2vv@wittgenstein>
 <CALAqxLW-txNEqW=P_9VTxvOVu_fgpjzHHDbR5BhtpYwhg1SXgw@mail.gmail.com>
 <20200421080544.GA611314@kroah.com>
 <20200703070403.GB2221524@kroah.com>
 <CALAqxLUHT=CGNxffz+3G-bUNc2FM_TawDrymFN+S=ZiPcM9pkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLUHT=CGNxffz+3G-bUNc2FM_TawDrymFN+S=ZiPcM9pkg@mail.gmail.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>, Laura Abbott <labbott@redhat.com>,
 Todd Kjos <tkjos@android.com>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Anders Pedersen <anders.pedersen@arm.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart \(VMware\)" <dvhart@infradead.org>,
 Laura Abbott <laura@labbott.name>, nd <nd@arm.com>,
 Martijn Coenen <maco@android.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 Christian Brauner <christian@brauner.io>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 08:43:30PM -0700, John Stultz wrote:
> On Fri, Jul 3, 2020 at 12:03 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Apr 21, 2020 at 10:05:44AM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Apr 20, 2020 at 01:03:39PM -0700, John Stultz wrote:
> > > > The dmabuf heaps have been in an official kernel now for all of three
> > > > weeks. So yea, we can "delete [ION] and see who even notices", but I
> > > > worry that may seem a bit like contempt for the folks doing the work
> > > > on transitioning over, which doesn't help getting them to participate
> > > > within the community.
> > >
> > > But they aren't participating in the community today as no one is
> > > touching the ion code.  So I fail to see how keeping a dead-end-version
> > > of ion in the kernel tree really affects anyone these days.
> >
> > So, any thoughts here?  What's the timeline for ion being able to be
> > removed that you are comfortable with?
> 
> Sorry for the slow reply.  So my earlier plan was to drop it after the next LTS?

Ok, fair enough, we can wait until January.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
