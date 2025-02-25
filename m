Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B6EA44582
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717AE10E73F;
	Tue, 25 Feb 2025 16:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aQepiuiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2B510E73F;
 Tue, 25 Feb 2025 16:09:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A14A761278;
 Tue, 25 Feb 2025 16:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7965AC4CEDD;
 Tue, 25 Feb 2025 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740499781;
 bh=I20S5zLsI09uH923+Gw4yF8I4LEHCIvUKO/1coMGedA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aQepiuiJ+Omgulrzo81kfMVxOpMfNzcQRfXL1T88akjWoX6V1Kk1ZRyRtuZC6NVwt
 DB1PJJTchvpYWXsgmmtQkmPPKI56uOYi73bkWk1YP1HZd6pELL8s1MuZ9H8WGBW4SH
 iCTROOx4YTc8KqwLhIfZeNrQfQRGbHLaENXXDx+a5yg41ct2f/t841Y29XmZ32qBwa
 OyzEpRPCP3tBnQUjP3/OeAoU9iwb2b53bTht7xD72BqPKU26dOqL5OTgsnh+Ddq4Qz
 R9KmyqvyE9OFY0kCHmtNOp5Y+1UwcrUimbENPzYdmvbxoe/Tej9g2j8JQoTZtQfjrs
 iiNv/1Ga057cA==
Date: Tue, 25 Feb 2025 17:09:35 +0100
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
Message-ID: <Z73rP4secPlUMIoS@cassiopeiae>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
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

On Tue, Feb 25, 2025 at 10:52:41AM -0500, Joel Fernandes wrote:
> 
> 
> On 2/24/2025 6:44 PM, Danilo Krummrich wrote:
> > On Mon, Feb 24, 2025 at 01:45:02PM -0500, Joel Fernandes wrote:
> >> Hi Danilo,
> >>
> >> On Mon, Feb 24, 2025 at 01:11:17PM +0100, Danilo Krummrich wrote:
> >>> On Mon, Feb 24, 2025 at 01:07:19PM +0100, Danilo Krummrich wrote:
> >>>> CC: Gary
> >>>>
> >>>> On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> >>>>> This inability to sleep while we are accessing registers seems very
> >>>>> constraining to me, if not dangerous. It is pretty common to have
> >>>>> functions intermingle hardware accesses with other operations that might
> >>>>> sleep, and this constraint means that in such cases the caller would
> >>>>> need to perform guard lifetime management manually:
> >>>>>
> >>>>>   let bar_guard = bar.try_access()?;
> >>>>>   /* do something non-sleeping with bar_guard */
> >>>>>   drop(bar_guard);
> >>>>>
> >>>>>   /* do something that might sleep */
> >>>>>
> >>>>>   let bar_guard = bar.try_access()?;
> >>>>>   /* do something non-sleeping with bar_guard */
> >>>>>   drop(bar_guard);
> >>>>>
> >>>>>   ...
> >>>>>
> >>>>> Failure to drop the guard potentially introduces a race condition, which
> >>>>> will receive no compile-time warning and potentialy not even a runtime
> >>>>> one unless lockdep is enabled. This problem does not exist with the
> >>>>> equivalent C code AFAICT
> >>>
> >>> Without klint [1] it is exactly the same as in C, where I have to remember to
> >>> not call into something that might sleep from atomic context.
> >>>
> >>
> >> Sure, but in C, a sequence of MMIO accesses don't need to be constrained to
> >> not sleeping?
> > 
> > It's not that MMIO needs to be constrained to not sleeping in Rust either. It's
> > just that the synchronization mechanism (RCU) used for the Revocable type
> > implies that.
> > 
> > In C we have something that is pretty similar with drm_dev_enter() /
> > drm_dev_exit() even though it is using SRCU instead and is specialized to DRM.
> > 
> > In DRM this is used to prevent accesses to device resources after the device has
> > been unplugged.
> 
> Thanks a lot for the response. Might it make more sense to use SRCU then? The
> use of RCU seems overly restrictive due to the no-sleep-while-guard-held thing.

Allowing to hold on to the guard for too long is a bit contradictive to the goal
of detecting hotunplug I guess.

Besides that I don't really see why we can't just re-acquire it after we sleep?
Rust provides good options to implement it ergonimcally I think.

> 
> Another colleague told me RDMA also uses SRCU for a similar purpose as well.

See the reasoning against SRCU from Sima [1], what's the reasoning of RDMA?

[1] https://lore.kernel.org/nouveau/Z7XVfnnrRKrtQbB6@phenom.ffwll.local/

> 
> >> I am fairly new to rust, could you help elaborate more about why these MMIO
> >> accesses need to have RevocableGuard in Rust? What problem are we trying to
> >> solve that C has but Rust doesn't with the aid of a RCU read-side section? I
> >> vaguely understand we are trying to "wait for an MMIO access" using
> >> synchronize here, but it is just a guest.
> > 
> > Similar to the above, in Rust it's a safety constraint to prevent MMIO accesses
> > to unplugged devices.
> > 
> > The exact type in Rust in this case is Devres<pci::Bar>. Within Devres, the
> > pci::Bar is placed in a Revocable. The Revocable is revoked when the device
> > is detached from the driver (for instance because it has been unplugged).
> 
> I guess the Devres concept of revoking resources on driver detach is not a rust
> thing (even for PCI)... but correct me if I'm wrong.

I'm not sure what you mean with that, can you expand a bit?

> 
> > By revoking the Revocable, the pci::Bar is dropped, which implies that it's also
> > unmapped; a subsequent call to try_access() would fail.
> > 
> > But yes, if the device is unplugged while holding the RCU guard, one is on their
> > own; that's also why keeping the critical sections short is desirable.
> 
> I have heard some concern around whether Rust is changing the driver model when
> it comes to driver detach / driver remove.  Can you elaborate may be a bit about
> how Rust changes that mechanism versus C, when it comes to that?

I think that one is simple, Rust does *not* change the driver model.

What makes you think so?

> Ideally we
> would not want Rust drivers to have races with user space accesses when they are
> detached/remove. But we also don't want accesses to be non-sleepable sections
> where this guard is held, it seems restrictive (though to your point the
> sections are expected to be small).

In the very extreme case, nothing prevents you from implementing a wrapper like:

	fn my_write32(bar: &Devres<pci::Bar>, offset: usize) -> Result<u32> {
		let bar = bar.try_access()?;
		bar.read32(offset);
	}

Which limits the RCU read side critical section to my_write32().

Similarly you can have custom functions for short sequences of I/O ops, or use
closures. I don't understand the concern.
