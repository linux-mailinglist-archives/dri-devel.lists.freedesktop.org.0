Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C6A43127
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 00:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA1810E4A2;
	Mon, 24 Feb 2025 23:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lS0PoM1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D422610E4A2;
 Mon, 24 Feb 2025 23:44:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5CC815C419A;
 Mon, 24 Feb 2025 23:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A2BC4CED6;
 Mon, 24 Feb 2025 23:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740440697;
 bh=Kr1rcS4ZMViPxe+TilfErx2vNbgRGnGen+c0co0S3HY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lS0PoM1gPsYGz6CL0m4sV/UNKhyh3NDOUWFZhOk7k7RwVpFFDHNFkY2wK1ZsdBZV3
 AeGefMf/BsacH6jQUEnHnR9do9P3j0e/Oinz9iaDMGyE3V92sg8owwWr86Lvi5wnA5
 0YxPtdGUCUd25EJOEeAaBjvmMV8tzTJymm6m9gqwQxZ4f0POdPahMHcNoOSbYnnvgs
 yPZSuiKL1vUjYo4trTbcO4w5TUnCP9sF+kattMFoYYXAkaDhKtx1+ckS4/+IAju1dr
 rwRO6A8Y6kG5IsxN3ZTVD2wAJgrFFluekHJMa+sauLd/0X08PCafLFWTulb01DlcI5
 mlKMhPlZ/rByg==
Date: Tue, 25 Feb 2025 00:44:51 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z70EcwNIX0KtWy36@cassiopeiae>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224184502.GA1599486@joelnvbox>
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

On Mon, Feb 24, 2025 at 01:45:02PM -0500, Joel Fernandes wrote:
> Hi Danilo,
> 
> On Mon, Feb 24, 2025 at 01:11:17PM +0100, Danilo Krummrich wrote:
> > On Mon, Feb 24, 2025 at 01:07:19PM +0100, Danilo Krummrich wrote:
> > > CC: Gary
> > > 
> > > On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> > > > This inability to sleep while we are accessing registers seems very
> > > > constraining to me, if not dangerous. It is pretty common to have
> > > > functions intermingle hardware accesses with other operations that might
> > > > sleep, and this constraint means that in such cases the caller would
> > > > need to perform guard lifetime management manually:
> > > > 
> > > >   let bar_guard = bar.try_access()?;
> > > >   /* do something non-sleeping with bar_guard */
> > > >   drop(bar_guard);
> > > > 
> > > >   /* do something that might sleep */
> > > > 
> > > >   let bar_guard = bar.try_access()?;
> > > >   /* do something non-sleeping with bar_guard */
> > > >   drop(bar_guard);
> > > > 
> > > >   ...
> > > > 
> > > > Failure to drop the guard potentially introduces a race condition, which
> > > > will receive no compile-time warning and potentialy not even a runtime
> > > > one unless lockdep is enabled. This problem does not exist with the
> > > > equivalent C code AFAICT
> > 
> > Without klint [1] it is exactly the same as in C, where I have to remember to
> > not call into something that might sleep from atomic context.
> >
> 
> Sure, but in C, a sequence of MMIO accesses don't need to be constrained to
> not sleeping?

It's not that MMIO needs to be constrained to not sleeping in Rust either. It's
just that the synchronization mechanism (RCU) used for the Revocable type
implies that.

In C we have something that is pretty similar with drm_dev_enter() /
drm_dev_exit() even though it is using SRCU instead and is specialized to DRM.

In DRM this is used to prevent accesses to device resources after the device has
been unplugged.

> 
> I am fairly new to rust, could you help elaborate more about why these MMIO
> accesses need to have RevocableGuard in Rust? What problem are we trying to
> solve that C has but Rust doesn't with the aid of a RCU read-side section? I
> vaguely understand we are trying to "wait for an MMIO access" using
> synchronize here, but it is just a guest.

Similar to the above, in Rust it's a safety constraint to prevent MMIO accesses
to unplugged devices.

The exact type in Rust in this case is Devres<pci::Bar>. Within Devres, the
pci::Bar is placed in a Revocable. The Revocable is revoked when the device
is detached from the driver (for instance because it has been unplugged).

By revoking the Revocable, the pci::Bar is dropped, which implies that it's also
unmapped; a subsequent call to try_access() would fail.

But yes, if the device is unplugged while holding the RCU guard, one is on their
own; that's also why keeping the critical sections short is desirable.
