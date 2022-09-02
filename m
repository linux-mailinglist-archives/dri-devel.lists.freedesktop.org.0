Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C175AB166
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 15:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529DA10E83B;
	Fri,  2 Sep 2022 13:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7784410E83B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 13:29:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A757B82A9B;
 Fri,  2 Sep 2022 13:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388ADC433D6;
 Fri,  2 Sep 2022 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662125351;
 bh=Y4J5I0C+hO5AiefuTKxvuCBGeemyxUhAnG6wAehE8dM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NGmcRuTX+8BTaBoTls7R4tK32GXjw+sNLdzp/6ELO0oN6wERQJkAavVBT5TOV8zru
 jFIyR0g3IFTCtmEgGk3we4gRgN2IDsdkhazt+72+dOFWBntZkx/bIVy7G57sbyuqlp
 ox2Zh+Bp5VAcCcVZihM5VcK4NyF5UazFol5FyTZo=
Date: Fri, 2 Sep 2022 15:29:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] kernel/panic: Drop unblank_screen call
Message-ID: <YxIFJEz05hY9DWFO@kroah.com>
References: <20220830145004.430545-1-daniel.vetter@ffwll.ch>
 <YxCY57DmFfTuHs1q@alley>
 <CAKMK7uFwJumoLCddSxtd=tPoV1xLFw5uCWpY+WDtiRC=fiSedg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFwJumoLCddSxtd=tPoV1xLFw5uCWpY+WDtiRC=fiSedg@mail.gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>, Yangxi Xiang <xyangxi5@gmail.com>,
 Marco Elver <elver@google.com>, John Ogness <john.ogness@linutronix.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 tangmeng <tangmeng@uniontech.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 nick black <dankamongmen@gmail.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Luis Chamberlain <mcgrof@kernel.org>, David Gow <davidgow@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Jiri Slaby <jirislaby@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 09:26:27PM +0200, Daniel Vetter wrote:
> On Thu, 1 Sept 2022 at 13:35, Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Tue 2022-08-30 16:50:04, Daniel Vetter wrote:
> > > console_unblank() does this too (called in both places right after),
> > > and with a lot more confidence inspiring approach to locking.
> > >
> > > Reconstructing this story is very strange:
> > >
> > > In b61312d353da ("oops handling: ensure that any oops is flushed to
> > > the mtdoops console") it is claimed that a printk(" "); flushed out
> > > the console buffer, which was removed in e3e8a75d2acf ("[PATCH]
> > > Extract and use wake_up_klogd()"). In todays kernels this is done way
> > > earlier in console_flush_on_panic with some really nasty tricks. I
> > > didn't bother to fully reconstruct this all, least because the call to
> > > bust_spinlock(0); gets moved every few years, depending upon how the
> > > wind blows (or well, who screamed loudest about the various issue each
> > > call site caused).
> > >
> > > Before that commit the only calls to console_unblank() where in s390
> > > arch code.
> > >
> > > The other side here is the console->unblank callback, which was
> > > introduced in 2.1.31 for the vt driver. Which predates the
> > > console_unblank() function by a lot, which was added (without users)
> > > in 2.4.14.3. So pretty much impossible to guess at any motivation
> > > here. Also afaict the vt driver is the only (and always was the only)
> > > console driver implementing the unblank callback, so no idea why a
> > > call to console_unblank() was added for the mtdooops driver - the
> > > action actually flushing out the console buffers is done from
> > > console_unlock() only.
> >
> > My understanding is that mtdoops is not a real console. The commit
> > 4b23aff083649eafa141 ("[MTD] oops and panic message logging to MTD
> > device") suggests that it was just (mis)using the console
> > infrastructure.
> >
> > The commit 2e386e4bac90554887e73d ("mtd: mtdoops: refactor as a
> > kmsg_dumper") converted it to use the new kmsg_dumper API that
> > was created for this use case.
> >
> > So, I would consider all the mtdoops-related changes as a misuse
> > of the console API.
> 
> Ah, that's a good piece of information that I didn't figure out.
> 
> Greg, if you haven't baked in the patch yet, can you perhaps add the
> above information from Petr to the commit message?

It's already baked, sorry :(

