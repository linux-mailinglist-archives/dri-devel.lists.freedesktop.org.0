Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89934A365DC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 19:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5191210ED41;
	Fri, 14 Feb 2025 18:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="if2GuvBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C218D10ED35
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 18:45:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD8395C5B32;
 Fri, 14 Feb 2025 18:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E461EC4CED1;
 Fri, 14 Feb 2025 18:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739558740;
 bh=N6BYoVzWmfitLDdv/9MkK+uxLUWYXiRZDwnKdTX7GwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=if2GuvBoku00rK9l2JHbWkuloit1To2vi72c+9WHFbIV1RWBY4lhJM4W5nwCpvJ7Z
 yzR45jzbJINrLmiQ79+C6BnRrZ097Bn1tJChat7QtEsZfYju7q5RDHITLikzRv32dl
 52MexRmGKPRtyVXvLN5l92pakfgBkPFbxOayKBgrOcn5TxWidmHSDsLwdUVvbwO067
 5S47S5vrcQrwYM+0lxwgJvHezKoQR6zSiROJlbqxYxn1hENldXueU461J6aXUgFxth
 Ox7bKD9J3DwmGJPC8axgnC5JrwnvEIlxBQLriUjhMe9eUtaawNlfLlObvJ1UMMvF3F
 SKQUNToypbgLg==
Date: Fri, 14 Feb 2025 10:45:39 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Mike Lothian <mike@fireburn.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 wine-devel@winehq.org,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Wolfram Sang <wsa@kernel.org>, Arkadiusz Hiler <ahiler@codeweavers.com>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH] ntsync: Set the permissions to be 0666
Message-ID: <20250214184539.GC21799@frogsfrogsfrogs>
References: <20250214122759.2629-2-mike@fireburn.co.uk>
 <2025021456-easiness-facebook-636e@gregkh>
 <1911589.tdWV9SEqCh@camazotz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1911589.tdWV9SEqCh@camazotz>
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

On Fri, Feb 14, 2025 at 12:13:03PM -0600, Elizabeth Figura wrote:
> On Friday, 14 February 2025 07:06:20 CST Greg Kroah-Hartman wrote:
> > On Fri, Feb 14, 2025 at 12:28:00PM +0000, Mike Lothian wrote:
> > > This allows ntsync to be usuable by non-root processes out of the box
> > 
> > Are you sure you need/want that?  If so, why?  How did existing testing
> > not ever catch this?
> 
> Hi, sorry, this is of course my fault.
> 
> We do need /dev/ntsync to be openable from user space for it to be
> useful. I'm not sure what the most "correct" permissions are to have
> in this case (when we don't specifically need read or write), but I
> don't think I see a reason not to just set to 666 or 444.
> 
> I originally assumed that the right way to do this was not to set the
> mode on the kernel file but rather through udev; I believe I was using
> the code for /dev/loop-control or /dev/fuse as an example, which both
> do that. So I (and others who tested) had just manually set up udev
> rules for this, with the eventual intent of adding a default rule to
> systemd like the others. I only recently realized that doing something
> like this patch is possible and precedented.
> 
> I don't know what the best way to address this is, but this is
> certainly the simplest.

Paranoid defaults in the kernel, and then a udev rule to relax the mode
at runtime.  You could also have logind scripts to add add per-user
allow acls to the device file at user session set up time... or however
it is that /dev/sr0 has me on the allow list.  I'm not sure how that
happens exactly, but it works smoothly.

I get far less complaining about relaxing posture than tightening it
(==breaking things) after the fact.

--D
