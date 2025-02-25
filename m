Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E6DA443DD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6F010E722;
	Tue, 25 Feb 2025 15:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I80wjH0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1F710E71B;
 Tue, 25 Feb 2025 15:06:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F33FD5C05BB;
 Tue, 25 Feb 2025 15:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17319C4CEE6;
 Tue, 25 Feb 2025 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740495969;
 bh=kIzpWgLCcE7L4I8PudX2xwqeT82m7xGRh8clcilUdQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I80wjH0yESR6jSXjrLsl16Zz2CVyrakKYFjoS+OiKY7LVRV4bmBSXzXqasQtY+YjW
 Ug1zX4Cf2rQWxBozwEozVIlYRfwUpTCN35TyAUDr2VJvpVmgTIDiHy3yvvf/4HosPu
 DcA0SAyOpgOciaUazuiQ8V+CaFBU+nCsLbZb9Usz7vGMIjcki2xwSdQ9HYf7NFf5N/
 UPERGOs0JR8LLRimKkDavjt+rNJ6PQ8RMU+dIRKqGTyx+QJmLiandXCMub+OkWseqt
 0qlE1nuimyCp+zJZlc4f/3uxY9Mc6nejmh6nURuO09f6piveosX2kDmM9vVO33ImWU
 rt/NtQ3ByELhw==
Date: Tue, 25 Feb 2025 16:06:04 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z73cXGkookq5-NON@cassiopeiae>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com>
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

On Tue, Feb 25, 2025 at 11:11:07PM +0900, Alexandre Courbot wrote:
> On Mon Feb 24, 2025 at 9:07 PM JST, Danilo Krummrich wrote:
> > CC: Gary
> >
> > On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> >> This inability to sleep while we are accessing registers seems very
> >> constraining to me, if not dangerous. It is pretty common to have
> >> functions intermingle hardware accesses with other operations that might
> >> sleep, and this constraint means that in such cases the caller would
> >> need to perform guard lifetime management manually:
> >> 
> >>   let bar_guard = bar.try_access()?;
> >>   /* do something non-sleeping with bar_guard */
> >>   drop(bar_guard);
> >> 
> >>   /* do something that might sleep */
> >> 
> >>   let bar_guard = bar.try_access()?;
> >>   /* do something non-sleeping with bar_guard */
> >>   drop(bar_guard);
> >> 
> >>   ...
> >> 
> >> Failure to drop the guard potentially introduces a race condition, which
> >> will receive no compile-time warning and potentialy not even a runtime
> >> one unless lockdep is enabled. This problem does not exist with the
> >> equivalent C code AFAICT, which makes the Rust version actually more
> >> error-prone and dangerous, the opposite of what we are trying to achieve
> >> with Rust. Or am I missing something?
> >
> > Generally you are right, but you have to see it from a different perspective.
> >
> > What you describe is not an issue that comes from the design of the API, but is
> > a limitation of Rust in the kernel. People are aware of the issue and with klint
> > [1] there are solutions for that in the pipeline, see also [2] and [3].
> >
> > [1] https://rust-for-linux.com/klint
> > [2] https://github.com/Rust-for-Linux/klint/blob/trunk/doc/atomic_context.md
> > [3] https://www.memorysafety.org/blog/gary-guo-klint-rust-tools/
> 
> Thanks, I wasn't aware of klint and it looks indeed cool, even if not perfect by
> its own admission. But even if the ignore the safety issue, the other one
> (ergonomics) is still there.
> 
> Basically this way of accessing registers imposes quite a mental burden on its
> users. It requires a very different (and harsher) discipline than when writing
> the same code in C

We need similar solutions in C too, see drm_dev_enter() / drm_dev_exit() and
drm_dev_unplug().

> and the correct granularity to use is unclear to me.
> 
> For instance, if I want to do the equivalent of Nouveau's nvkm_usec() to poll a
> particular register in a busy loop, should I call try_access() once before the
> loop? Or every time before accessing the register?

I think we should re-acquire the guard in each iteration and drop it before the
delay. I think a simple closure would work very well for this pattern?

> I'm afraid having to check
> that the resource is still alive before accessing any register is going to
> become tedious very quickly.
> 
> I understand that we want to protect against accessing the IO region of an
> unplugged device ; but still there is no guarantee that the device won't be
> unplugged in the middle of a critical section, however short. Thus the driver
> code should be able to recognize that the device has fallen off the bus when it
> e.g. gets a bunch of 0xff instead of a valid value. So do we really need to
> extra protection that AFAICT isn't used in C?

As mentioned above, we already do similar things in C.

Also, think about what's the alternative. If we remove the Devres wrapper of
pci::Bar, we lose the control over the lifetime of the bar mapping and it can
easily out-live the device / driver binding. This makes the API unsound.

With this drivers would be able to keep resources acquired. What if after a
hotplug the physical address region is re-used and to be mapped by another
driver?
