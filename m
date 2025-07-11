Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B9B024A6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691AB10E3C5;
	Fri, 11 Jul 2025 19:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VWCcRa0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E6B10E3C5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 19:34:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C41061425;
 Fri, 11 Jul 2025 19:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BE1C4CEF0;
 Fri, 11 Jul 2025 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752262485;
 bh=v6iG3EMkiGieJSsdeDjHrneCcUNBwgtcJC/HKqppA5Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VWCcRa0znuPZ7lhEAISJu8y+kGUzvx/Kx3f0P38Q2v7dStY35WQUftUFj7xw1AQvN
 mJVpg4Wy3ESF3rSxYHqz9Qujw21I75rB7zVmlKIqoeG24iiX5QM1iSkZKpC31H1HUu
 wUPuCcYtnyDmJ6aZzqShgjZcZiYptmGPwqGPa8Iwn2xS5cTsZ3JB7l9cJMDWGaQMgi
 SxmLttUaQaXsjj4SUW/80Jb3xi7go14c9c0OjuYLuXMB2TaBaLvb0A+Y0n1VLNBALN
 0CTDkptIvRFs8Me5uJhZJautl0GmIsUn/DzPmisl3HWFvNoBujRqpfnfRvX+8QU48x
 ppXE0CNYfbUBg==
Date: Fri, 11 Jul 2025 12:34:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter
 <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
Message-ID: <20250711123444.71747051@kernel.org>
In-Reply-To: <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
 <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 11 Jul 2025 12:30:28 -0700 Linus Torvalds wrote:
> > I spent several hours yesterday chasing all the wrong things (because
> > I thought it was in drm), and often thought "Oh, that fixed it". Only
> > to then realize that nope, the problem still happens.
> >
> > I will test the reverts. Several times.  
> 
> Well, the first boot with those three commits reverted shows no problem at all.
> 
> But as mentioned, I've now had "Oh, that fixed it" about ten times.
> 
> So that "Oh, it worked this time" has been tainted by past experience.
> Will do several more boots now in the hope that it's gone for good.

Fingers crossed. FWIW /proc/net/netlink should show the socket
drop counters. But my laptop running 6.15 has a number of 
GNOME apps which never read their sockets so it's not going to
be as immediately obvious whether we regressed or its a bad app 
as I hoped.
