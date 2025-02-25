Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7327BA44500
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C42510E1CE;
	Tue, 25 Feb 2025 15:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bf6sFSsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFD210E1C3;
 Tue, 25 Feb 2025 15:53:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D9B745C5951;
 Tue, 25 Feb 2025 15:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA326C4CEDD;
 Tue, 25 Feb 2025 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740498789;
 bh=gIt6lFSnlekmgXMOQcKRdaO4+FjTMF8HEhwC8rmhqR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bf6sFSsNq4SZka95OAfNC4e+Yp9GEjpkPeY7XdiR7vx5OSBhaaGL2qZyB3NpeKku/
 fzQjREt/VR4Cg+lx90wgqbliR7R45SdU0uUOCirjIPZrDPm8tx/tQoAyk6Jk73OkY1
 ypWO/MxOiV7/nEs5g70+1mmUoiSmrr4qvXrLuQyZPXucnCLASOAkCAcDm2BmDGXwiW
 r1T00+NWXfqpfIJ4tQghLWm0F+Zesrt1dJ0/yVgreDcXeDuoRONF2CB/1uQvtIEzKR
 SXBFQApcJk4+SUTd5qTQMPBBCpFvgfitObqqV33ppiIyK5kjXugmTr0MzDq1D2VNPu
 mM6JS5NPPfVUw==
Date: Tue, 25 Feb 2025 16:53:04 +0100
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
Message-ID: <Z73nYKsq14Pf6ucp@cassiopeiae>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com>
 <Z73cXGkookq5-NON@cassiopeiae>
 <D81MP8Y5ME66.3SLPVNXERH1HU@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D81MP8Y5ME66.3SLPVNXERH1HU@nvidia.com>
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

On Wed, Feb 26, 2025 at 12:23:40AM +0900, Alexandre Courbot wrote:
> On Wed Feb 26, 2025 at 12:06 AM JST, Danilo Krummrich wrote:
> > On Tue, Feb 25, 2025 at 11:11:07PM +0900, Alexandre Courbot wrote:
> >> On Mon Feb 24, 2025 at 9:07 PM JST, Danilo Krummrich wrote:
> >> > CC: Gary
> >> >
> >> > On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> >> >> This inability to sleep while we are accessing registers seems very
> >> >> constraining to me, if not dangerous. It is pretty common to have
> >> >> functions intermingle hardware accesses with other operations that might
> >> >> sleep, and this constraint means that in such cases the caller would
> >> >> need to perform guard lifetime management manually:
> >> >> 
> >> >>   let bar_guard = bar.try_access()?;
> >> >>   /* do something non-sleeping with bar_guard */
> >> >>   drop(bar_guard);
> >> >> 
> >> >>   /* do something that might sleep */
> >> >> 
> >> >>   let bar_guard = bar.try_access()?;
> >> >>   /* do something non-sleeping with bar_guard */
> >> >>   drop(bar_guard);
> >> >> 
> >> >>   ...
> >> >> 
> >> >> Failure to drop the guard potentially introduces a race condition, which
> >> >> will receive no compile-time warning and potentialy not even a runtime
> >> >> one unless lockdep is enabled. This problem does not exist with the
> >> >> equivalent C code AFAICT, which makes the Rust version actually more
> >> >> error-prone and dangerous, the opposite of what we are trying to achieve
> >> >> with Rust. Or am I missing something?
> >> >
> >> > Generally you are right, but you have to see it from a different perspective.
> >> >
> >> > What you describe is not an issue that comes from the design of the API, but is
> >> > a limitation of Rust in the kernel. People are aware of the issue and with klint
> >> > [1] there are solutions for that in the pipeline, see also [2] and [3].
> >> >
> >> > [1] https://rust-for-linux.com/klint
> >> > [2] https://github.com/Rust-for-Linux/klint/blob/trunk/doc/atomic_context.md
> >> > [3] https://www.memorysafety.org/blog/gary-guo-klint-rust-tools/
> >> 
> >> Thanks, I wasn't aware of klint and it looks indeed cool, even if not perfect by
> >> its own admission. But even if the ignore the safety issue, the other one
> >> (ergonomics) is still there.
> >> 
> >> Basically this way of accessing registers imposes quite a mental burden on its
> >> users. It requires a very different (and harsher) discipline than when writing
> >> the same code in C
> >
> > We need similar solutions in C too, see drm_dev_enter() / drm_dev_exit() and
> > drm_dev_unplug().
> 
> Granted, but the use of these is much more coarsed-grained than what is
> expected of IO resources, right?

Potentially, yes. But exactly this characteristic has been criticised [1].

[1] https://lore.kernel.org/nouveau/Z7XVfnnrRKrtQbB6@phenom.ffwll.local/

> 
> >
> >> and the correct granularity to use is unclear to me.
> >> 
> >> For instance, if I want to do the equivalent of Nouveau's nvkm_usec() to poll a
> >> particular register in a busy loop, should I call try_access() once before the
> >> loop? Or every time before accessing the register?
> >
> > I think we should re-acquire the guard in each iteration and drop it before the
> > delay. I think a simple closure would work very well for this pattern?
> >
> >> I'm afraid having to check
> >> that the resource is still alive before accessing any register is going to
> >> become tedious very quickly.
> >> 
> >> I understand that we want to protect against accessing the IO region of an
> >> unplugged device ; but still there is no guarantee that the device won't be
> >> unplugged in the middle of a critical section, however short. Thus the driver
> >> code should be able to recognize that the device has fallen off the bus when it
> >> e.g. gets a bunch of 0xff instead of a valid value. So do we really need to
> >> extra protection that AFAICT isn't used in C?
> >
> > As mentioned above, we already do similar things in C.
> >
> > Also, think about what's the alternative. If we remove the Devres wrapper of
> > pci::Bar, we lose the control over the lifetime of the bar mapping and it can
> > easily out-live the device / driver binding. This makes the API unsound.
> 
> Oh my issue is not with the Devres wrapper, I think it makes sense -
> it's more the use of RCU to control access to the resource that I find
> too constraining. And I'm pretty sure there will be more users of the
> same opinion as more drivers using it get written.

What do you suggest?

> 
> >
> > With this drivers would be able to keep resources acquired. What if after a
> > hotplug the physical address region is re-used and to be mapped by another
> > driver?
> 
> Actually - wouldn't that issue also be addressed by a PCI equivalent to
> drm_dev_enter() and friends that ensures the device (and thus its
> devres resources) stay in place?

I'm not sure I get the idea, but we can *not* have the device resources stay in
place once the device is unbound (e.g. keep the resource region acquired by the
driver).

Consequently, we have to have a way to revoke access to the corresponding
pci::Bar.

> 
> Using Rust, I can imagine (but not picture precisely yet) some method of
> the device that returns a reference to an inner structure containing its
> resources, available with immediate access. Since it would be
> coarser-grained, it could rely on something less constraining than RCU
> without a noticeable performance penalty.

We had similar attempts when we designed this API, i.e. a common Revocable in
the driver private data of a device. But it had some chicken-egg issues on
initialization in probe(). Besides that, it wouldn't get you rid of the
Revocable, since the corresponding resource are only valid while the driver is
bound to a device, not for the entire lifetime of the device.
