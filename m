Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94719975501
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 16:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3EC10E07B;
	Wed, 11 Sep 2024 14:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uGihqmsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7C610E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 14:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BAEB55C03EF;
 Wed, 11 Sep 2024 14:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717FDC4CEC0;
 Wed, 11 Sep 2024 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1726063796;
 bh=XKPZ/peEL1TLH2b5AECHqx60LXvW06CWF8w2WZ63omo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uGihqmsSmJsnaQX9yi1HbXA9wpXAROfgywrSvlZIzOW4PwPbeNGGKrkKoYF/LIx/p
 tk6ZTZCoRKxpFYEA532HqYAYNxNXREWX2LqfSLzzeMUwpPKBVJoq+QawIAvMiHiOVp
 N9pkEwE0C4KBveclL+mU6h1lGy76jSkrYXCwxXAk=
Date: Wed, 11 Sep 2024 16:09:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
Cc: rafael@kernel.org, dri-devel@lists.freedesktop.org,
 l.stach@pengutronix.de, trivial@kernel.org,
 linux-amarula@amarulasolutions.com
Subject: Re: [RESEND PATCH v4] devres: Refactor using guards
Message-ID: <2024091122-batboy-grumpily-520f@gregkh>
References: <20240910131520.150610-2-andrea.calabrese@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910131520.150610-2-andrea.calabrese@amarulasolutions.com>
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

On Tue, Sep 10, 2024 at 03:15:21PM +0200, Andrea Calabrese wrote:
> Code refactoring using the recent guard and scoped_guard macros
> for automatic cleanup of the spinlocks. This does not change the
> effective behaviour of the kernel, but guarantees a cleaned-up exit from
> each lock, automatically avoiding potential deadlocks.

The "guarantee" is there today, right?  So this isn't really anything
other than a "convert to use new apis", right?

If so, I need to see a LOT of verification that the output is the same,
and that it has been properly tested.  Converting working code for no
real reason other than "let's change this!" isn't always a good idea.

For new code going forward, or if you are touching the same area, sure,
that makes sense, but be careful about stuff like this.

> Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
> 
> ---
> Diff from V3: as Greg KH and Lucas Stach noticed, there was a
> behavioural change between the two versions: I used guard(spinlock),
> while the expected behaviour should have come from a spinlock_irqsave
> guard. This has been fixed.

No diffstat?

thanks,

greg k-h
