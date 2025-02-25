Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94692A44F79
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 23:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0DF10E7F7;
	Tue, 25 Feb 2025 22:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cZ/hTKOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D0010E7F7;
 Tue, 25 Feb 2025 22:02:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 84C9E611F4;
 Tue, 25 Feb 2025 22:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660C0C4CEDD;
 Tue, 25 Feb 2025 22:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740520930;
 bh=eNWdkHC2n1MuEFu0t27z5mGkFhYDZuXcacDZi0gjopk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cZ/hTKOeYSq0wy69PK5r26cD5SnHdlZ2OvgzPcTRe+OyH969PMVPbEMUW06ONjBsN
 DOIGZUAebolvPtZzevORdRkmxMgffsPffJ5/dNT8uN78G2VdouOWrshxlSsKYNhbs+
 +j68wJxsJdNtY29wHxgPI1nyhue1MZ4ZmMKTxzqUeV5taJmp9lWe2/059gPUw4GLbj
 ACTSjDNZSjTRCpmwhEclu8FRTBA/hAJysSWUbJrlR94ojXcNyuPHcXQWx4lhRI5DFn
 oCiuPN1Z+DWHbO4wlNuXY9zqF3wZgLL2uR+GxI5z8h6hRm2PLwZixgCaqkE6ST4PuU
 51CCZRafHtTTQ==
Date: Tue, 25 Feb 2025 23:02:04 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7493C8_IvvYDbm8@pollux>
References: <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225210228.GA1801922@joelnvbox>
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

On Tue, Feb 25, 2025 at 04:02:28PM -0500, Joel Fernandes wrote:
> On Tue, Feb 25, 2025 at 05:09:35PM +0100, Danilo Krummrich wrote:
> > On Tue, Feb 25, 2025 at 10:52:41AM -0500, Joel Fernandes wrote:
> > > 
> > > 
> > > On 2/24/2025 6:44 PM, Danilo Krummrich wrote:
> > > > On Mon, Feb 24, 2025 at 01:45:02PM -0500, Joel Fernandes wrote:
> > > >> Hi Danilo,
> > > >>
> > > >> On Mon, Feb 24, 2025 at 01:11:17PM +0100, Danilo Krummrich wrote:
> > > >>> On Mon, Feb 24, 2025 at 01:07:19PM +0100, Danilo Krummrich wrote:
> > > >>>> CC: Gary
> > > >>>>
> > > >>>> On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> > > >>>>> This inability to sleep while we are accessing registers seems very
> > > >>>>> constraining to me, if not dangerous. It is pretty common to have
> > > >>>>> functions intermingle hardware accesses with other operations that might
> > > >>>>> sleep, and this constraint means that in such cases the caller would
> > > >>>>> need to perform guard lifetime management manually:
> > > >>>>>
> > > >>>>>   let bar_guard = bar.try_access()?;
> > > >>>>>   /* do something non-sleeping with bar_guard */
> > > >>>>>   drop(bar_guard);
> > > >>>>>
> > > >>>>>   /* do something that might sleep */
> > > >>>>>
> > > >>>>>   let bar_guard = bar.try_access()?;
> > > >>>>>   /* do something non-sleeping with bar_guard */
> > > >>>>>   drop(bar_guard);
> > > >>>>>
> > > >>>>>   ...
> > > >>>>>
> > > >>>>> Failure to drop the guard potentially introduces a race condition, which
> > > >>>>> will receive no compile-time warning and potentialy not even a runtime
> > > >>>>> one unless lockdep is enabled. This problem does not exist with the
> > > >>>>> equivalent C code AFAICT
> > > >>>
> > > >>> Without klint [1] it is exactly the same as in C, where I have to remember to
> > > >>> not call into something that might sleep from atomic context.
> > > >>>
> > > >>
> > > >> Sure, but in C, a sequence of MMIO accesses don't need to be constrained to
> > > >> not sleeping?
> > > > 
> > > > It's not that MMIO needs to be constrained to not sleeping in Rust either. It's
> > > > just that the synchronization mechanism (RCU) used for the Revocable type
> > > > implies that.
> > > > 
> > > > In C we have something that is pretty similar with drm_dev_enter() /
> > > > drm_dev_exit() even though it is using SRCU instead and is specialized to DRM.
> > > > 
> > > > In DRM this is used to prevent accesses to device resources after the device has
> > > > been unplugged.
> > > 
> > > Thanks a lot for the response. Might it make more sense to use SRCU then? The
> > > use of RCU seems overly restrictive due to the no-sleep-while-guard-held thing.
> > 
> > Allowing to hold on to the guard for too long is a bit contradictive to the goal
> > of detecting hotunplug I guess.
> > 
> > Besides that I don't really see why we can't just re-acquire it after we sleep?
> > Rust provides good options to implement it ergonimcally I think.
> > 
> > > 
> > > Another colleague told me RDMA also uses SRCU for a similar purpose as well.
> > 
> > See the reasoning against SRCU from Sima [1], what's the reasoning of RDMA?
> > 
> > [1] https://lore.kernel.org/nouveau/Z7XVfnnrRKrtQbB6@phenom.ffwll.local/
> 
> Hmm, so you're saying SRCU sections blocking indefinitely is a concern as per
> that thread. But I think SRCU GPs should not be stalled in normal operation.
> If it is, that is a bug anyway. Stalling SRCU grace periods is not really a
> good thing anyway, you could run out of memory (even though stalling RCU is
> even more dangerous).

I'm saying that extending the time of critical sections is a concern, because
it's more likely to miss the unplug event and it's just not necessary. You grab
the guard, do a few I/O ops and drop it -- simple.

If you want to sleep in between just re-acquire it when you're done sleeping.
You can easily avoid explicit drop(guard) calls by moving critical sections to
their own function or closures.

I still don't understand why you're thinking that it's crucial to sleep while
holding the RevocableGuard?

> 
> For RDMA, I will ask Jason Gunthorpe to chime in, I CC'd him. Jason, correct
> me if I'm wrong about the RDMA user but this is what I recollect discussing
> with you.
> 
> > > 
> > > >> I am fairly new to rust, could you help elaborate more about why these MMIO
> > > >> accesses need to have RevocableGuard in Rust? What problem are we trying to
> > > >> solve that C has but Rust doesn't with the aid of a RCU read-side section? I
> > > >> vaguely understand we are trying to "wait for an MMIO access" using
> > > >> synchronize here, but it is just a guest.
> > > > 
> > > > Similar to the above, in Rust it's a safety constraint to prevent MMIO accesses
> > > > to unplugged devices.
> > > > 
> > > > The exact type in Rust in this case is Devres<pci::Bar>. Within Devres, the
> > > > pci::Bar is placed in a Revocable. The Revocable is revoked when the device
> > > > is detached from the driver (for instance because it has been unplugged).
> > > 
> > > I guess the Devres concept of revoking resources on driver detach is not a rust
> > > thing (even for PCI)... but correct me if I'm wrong.
> > 
> > I'm not sure what you mean with that, can you expand a bit?
> 
> I was reading the devres documentation earlier. It mentios that one of its
> use is to clean up resources. Maybe I mixed up the meaning of "clean up" and
> "revoke" as I was reading it.
> 
> Honestly, I am still confused a bit by the difference between "revoking" and
> "cleaning up".

The Devres [1] implementation implements the devres callback that is called when the
device is unbound from the driver.

Once that happens, it revokes the underlying resource (e.g. the PCI bar mapping)
by using a Revocable [2] internally. Once the resource is revoked, try_access()
returns None and the resource (e.g. pci::Bar is dropped). By dropping the
pci::Bar the mapping is unmapped and the resource region is removed (which is
typically called cleanup).

[1] https://rust.docs.kernel.org/kernel/devres/struct.Devres.html
[2] https://rust.docs.kernel.org/kernel/revocable/struct.Revocable.html

> 
> > > 
> > > > By revoking the Revocable, the pci::Bar is dropped, which implies that it's also
> > > > unmapped; a subsequent call to try_access() would fail.
> > > > 
> > > > But yes, if the device is unplugged while holding the RCU guard, one is on their
> > > > own; that's also why keeping the critical sections short is desirable.
> > > 
> > > I have heard some concern around whether Rust is changing the driver model when
> > > it comes to driver detach / driver remove.  Can you elaborate may be a bit about
> > > how Rust changes that mechanism versus C, when it comes to that?
> > 
> > I think that one is simple, Rust does *not* change the driver model.
> > 
> > What makes you think so?
> 
> Well, the revocable concept for one is rust-only right?

Yes, but that has nothing to do with changing the driver model. It is just an
additional implementation detail to ensure safety.

IIRC there are also have been efforts for a similar mechanism in C.

> 
> It is also possibly just some paranoia based on discussions, but I'm not sure
> at the moment.

Again there is nothing different to C, except one additional step to ensure
safety. For instance, let's take devm_kzalloc(). Once the device is detached
from the driver the memory allocated with this function is freed automatically.

The additional step in Rust is, that we'd not only free the memory, but also
revoke the access to the pointer that has been returned by devm_kzalloc() for
the driver, such that it can't be used by accident anymore.

Besides that, I'd be interested to what kind of discussion you're referring to.

> 
> > > Ideally we
> > > would not want Rust drivers to have races with user space accesses when they are
> > > detached/remove. But we also don't want accesses to be non-sleepable sections
> > > where this guard is held, it seems restrictive (though to your point the
> > > sections are expected to be small).
> > 
> > In the very extreme case, nothing prevents you from implementing a wrapper like:
> > 
> > 	fn my_write32(bar: &Devres<pci::Bar>, offset: usize) -> Result<u32> {
> > 		let bar = bar.try_access()?;
> > 		bar.read32(offset);
> > 	}
> > 
> > Which limits the RCU read side critical section to my_write32().
> > 
> > Similarly you can have custom functions for short sequences of I/O ops, or use
> > closures. I don't understand the concern.
> 
> Yeah, this is certainly possible. I think one concern is similar to what you
> raised on the other thread you shared [1]:
> "Maybe we even want to replace it with SRCU entirely to ensure that drivers
> can't stall the RCU grace period for too long by accident."

Yeah, I was just thinking out loud, but I think it wasn't a good idea -- we
really do want to keep the critical sections short, so RCU is fine. Prohibit
drivers to use RCU, just because they could mess up, wasn't a good reason.

> 
> [1] https://lore.kernel.org/nouveau/Z7XVfnnrRKrtQbB6@phenom.ffwll.local/
> 
> thanks,
> 
>  - Joel
> 
> 
