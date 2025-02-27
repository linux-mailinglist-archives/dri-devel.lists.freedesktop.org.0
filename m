Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C6A47C45
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 12:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A9C10EAB7;
	Thu, 27 Feb 2025 11:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fQ4h6bzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B672410EAB7;
 Thu, 27 Feb 2025 11:32:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0EFE45C4885;
 Thu, 27 Feb 2025 11:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67C4C4CEE4;
 Thu, 27 Feb 2025 11:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740655970;
 bh=Zty7kMcpbAjyKYQmB6FvAoqZJmoDUlOF8/pOq0j6RP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fQ4h6bzHi6GSUpTap9SRozMpoyIeIGwusAlV23uF3LBmRLYmGfMl1d3TMotaw1Zip
 1oBMrYWqBf5P3ArtGBIO2CRYWmXy/Axtg1Zc4YV0I+S+JhzmiP8uBbrIvJCg5xyIUW
 LQ0MYOOa4ig2nmI3JgSwp9YqRgQ/N5O3PAhy2rklq/rs8rmtIs+T3I4nTpx0ViWf3z
 e2k4TlA8zM05eQtOfbq6nvUYhtB6SrcDTHYJy8CqWafVxViyeOzRYNR/Zh3+URk4n6
 DQs6GaWwO5ZeMvKALQpue7GqmSkCrTpef9lUhkuax1KyPqdxTmJqHtp8sPnizihkk7
 /41zvLWBq99yA==
Date: Thu, 27 Feb 2025 12:32:45 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8BNXdf3CgqGYjPV@pollux>
References: <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226234730.GC39591@nvidia.com>
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

On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 26, 2025 at 10:31:10PM +0100, Danilo Krummrich wrote:
> > Let's take a step back and look again why we have Devres (and Revocable) for
> > e.g. pci::Bar.
> > 
> > The device / driver model requires that device resources are only held by a
> > driver, as long as the driver is bound to the device.
> > 
> > For instance, in C we achieve this by calling
> > 
> > 	pci_iounmap()
> > 	pci_release_region()
> > 
> > from remove().
> > 
> > We rely on this, we trust drivers to actually do this.
> 
> Right, exactly
> 
> But it is not just PCI bar. There are a *huge* number of kernel APIs
> that have built in to them the same sort of requirement - teardown
> MUST run with remove, and once done the resource cannot be used by
> another thread.
> 
> Basically most things involving function pointers has this sort of
> lifecycle requirement because it is a common process that prevents a
> EAF of module unload.

You're still mixing topics, the whole Devres<pci::Bar> thing as about limiting
object lifetime to the point where the driver is unbound.

Shutting down asynchronous execution of things, i.e. workqueues, timers, IOCTLs
to prevent unexpected access to the module .text section is a whole different
topic.

You seem to imply that if we ensure the latter, we don't need to enforce the
former, but that isn't true.

In other words, assuming that we properly enforce that there are no async
execution paths after remove() or module_exit() (not necessarily the same),
we still need to ensure that a pci::Bar object does not outlive remove().

Device resources are a bit special, since their lifetime must be cap'd at device
unbind, *independent* of the object lifetime they reside in. Hence the Devres
container.

For a memory allocation for instance (e.g. KBox<T>), this is different. If it
outlives remove(), e.g. because it's part of the Module structure, that's fine.
It's only important that it's dropped eventually.

> 
> This is all incredibly subtle and driver writers never seem to
> understand it properly.. See below for my thoughts on hrtimer bindings
> having the same EAF issue.

I don't think it has, see Boqun's reply [1].

> 
> My fear, that is intensifying as we go through this discussion, is
> that rust binding authors have not fully comprehended what the kernel
> life cycle model and common design pattern actually is, and have not
> fully thought through issues like module unload creating a lifetime
> cycle for *function pointers*.

I do *not* see where you take the evidence from to make such a generic
statement.

Especially because there aren't a lot of abstractions upstream yet that fall
under this category.

If you think that a particular abstraction has a design issue, you're very
welcome to chime in on the particular mail thread and help improve things.

But implying that no one considers this is not representing reality.

> 
> This stuff is really hard. C programers rarely understand it. Existing
> drivers tend to frequenly have these bug classes. Without an obvious
> easy to use Rust framework to, effectively, revoke function pointers
> and synchronously destroy objects during remove, I think this will be
> a recurring problem going forward.
> 
> I assume that Rust philsophy should be quite concerned if it does not
> protect against function pointers becoming asynchronously invalid due
> to module unload races. That sounds like a safety problem to me??

Yes, it would be a safety problem. That's why HrTimer for instance implements
the corresponding synchronization when dropped.

> 
> > We also trust drivers that they don't access the pointer originally
> > returned by pci_iomap() after remove().
> 
> Yes, I get it, you are trying to use a reference tracking type design
> pattern when the C API is giving you a fencing design pattern, they
> are not compatible and it is hard to interwork them.
> 
> > Now, let's get back to concurrent code that might still attempt to use the
> > pci::Bar. Surely, we need mechanisms to shut down all asynchronous execution
> > paths (e.g. workqueues) once the device is unbound. But that's not the job of
> > Devres<pci::Bar>. The job of Devres<pci::Bar> is to be robust against misuse.
> 
> The thing is once you have a mechanism to shutdown all the stuff you
> don't need the overhead of this revocable checking on the normal
> paths. What you need is a way to bring your pci::Bar into a safety
> contract that remove will shootdown concurrency and that directly
> denies references to pci::Bar, and the same contract will guarentee it
> frees pci::Bar memory.

This contract needs to be technically enforced, not by convention as we do in C.

And with embedding the pci::Bar in Devres, such that it is automatically revoked
when the device is unbound, we do exactly that.

(Again, we don't do it primarily to protect against some concurrent access, we do
it to forcefully ensure that a pci::Bar object can not outlive the device /
driver binding.)

If we don't do that, how else do we do it? How do we prevent a driver from
keeping the pci::Bar (and hence the memory mapping and memory region reservation
alive after the device has been unbound?

> > But yes, once people start using workqueues for other modules, we
> > surely need to extend the abstraction accordingly.
> 
> You say that like it will be easy, but it is exactly the same type of
> lifetime issue as pci_iomap, and that seems to be quite a challenge
> here???

No, the workqueue implementation can so something similar to what Boqun
explained for HrTimer [1].

A workqueue lifetime also does not need a hard cap at device unbind, like device
resources. If it is bound to the module lifetime for instance, that is fine too.

Data that is accessed from a work item can't be freed under the workqueue by
design in Rust.

[1] https://lore.kernel.org/rust-for-linux/Z7-0pOmWO6r_KeQI@boqun-archlinux/
