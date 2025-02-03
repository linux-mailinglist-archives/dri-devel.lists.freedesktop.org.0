Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D718A25444
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 09:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E1510E09B;
	Mon,  3 Feb 2025 08:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vidqG8kJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BDC10E09B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 08:21:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 076A75C6262;
 Mon,  3 Feb 2025 08:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C06C4CED2;
 Mon,  3 Feb 2025 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1738570860;
 bh=nFkN+ogxYrl/pv6K+knulEU6vn9R/gMDzZnKP4IwLFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vidqG8kJTzwpekwo4muEai4dllbBZMYFUGU5sS6pHw5rSge71FpuUXRMmBzH3lib0
 3ygrVpu8CTYqCgg6nug2S8q22sq+xYgtVIvHGs+cA2FmvrRMAGIEoNFo5Sl+hE2WTE
 CTqftHzTDg+vnKlGnIK4wNdsKaeOYbwXVeWUssEg=
Date: Mon, 3 Feb 2025 09:19:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Mark Salyzyn <salyzyn@android.com>
Cc: Dave Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, russ.weight@linux.dev
Subject: Re: question about firmware caching and relying on it
 (CONFIG_FW_CACHE)
Message-ID: <2025020347-chewy-paradox-ce71@gregkh>
References: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
 <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
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

On Sun, Feb 02, 2025 at 12:54:07PM -0800, Linus Torvalds wrote:
> On Sun, 2 Feb 2025 at 12:15, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Currently FW_CACHE is an optional feature (that distros may or may not
> > configure off), where we will cache loaded firmwares to avoid problems
> > over suspend/resume (and speed up resume).
> >
> > I've just discovered a problem in nouveau's suspend code when the
> > FW_CACHE is turned off, it tries to load a few in it's suspend path
> > for certain scenarios. Enabling FW_CACHE fixes this, but I'm unsure if
> > that is considered properly fixing it or should FW_CACHE just be
> > considered an optimisation.
> 
> Honestly, if the alternative is "driver hacks up its own caching",
> then I think it definitely should just say "select FW_CACHE".
> 
> You need to make it conditional on PM_SLEEP to make Kconfig happy, but
> arguably that acts as documentation (ie it kind of ends up being a
> "this is *why* we select FW_CACHE").
> 
> So a simple
> 
>         select FW_CACHE if PM_SLEEP
> 
> sounds like the right thing to do for nouveau.
> 
> And in fact, that was how things used to be globally (with no driver
> selection noise needed). There was no FW_CACHE option, we would just
> enable it unconditionally for PM_SLEEP, exactly so that drivers would
> *not* try to load firmware during resume when the filesystem may be
> off-limits.
> 
> HOWEVER.
> 
> We apparently have some completely cray-cray "uevent messages" thing
> going on, which caused commit 030cc787c30e ("firmware_class: make
> firmware caching configurable")
> 
> Honestly, I'm not sure what broken thing that is all about. What
> uevent messages? Firmwas caching should cause *less* uevent noise, not
> more, because now we don't need to talk to user space as much.
> 
> Is that some Android-only thing, or is it some inherent stupidity in
> the FW_CACHE code that I just don't see off-hand?
> 
> I do *not* see any real explanation for that commit, only that
> statement about netlink that appears very odd.
> 
> That commit really makes me angry. It has that pattern that I
> absolutely hate: no actual background, and a "Link:" that makes me
> follow it ("Yay! Explanation!") that then only points back to the
> patch submission ("#^&% this thing").
> 
> Useless. Annoying. I absolutely *detest* those links that give no
> actual useful backstory to what the thing is about and only point back
> to the patch that I'm wondering about. The disappointment it causes is
> intense and real.

The "Link:" there is to the original patch submission, so yes, it's
useless in that point, but it can find the original patch which is why
we add them in this case, because many times the original patch did have
discussions on it before it was accepted.

> Anyway, I would say that particularly for a driver that wants caching,
> adding that select is very much the right thing to do.
> 
> I'd rather get rid of that stupid config option entirely, but since I
> don't know what the background is for it having been added, I guess we
> can't do that.
> 
> Greg, Luis, can you explain that odd uevent message / netlink issue?

There was reports from Android devices that the uevent was causing the
system to wake up from the netlink messages that were sent when going to
sleep and so it would get caught in a loop and never actually go to
sleep.  I can't remember any more than that, maybe Mark can recall the
specifics and dig up the Android bug reports for it?

thanks,

greg k-h
