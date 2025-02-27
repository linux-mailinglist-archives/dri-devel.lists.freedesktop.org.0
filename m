Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EABA485B8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F2310EB37;
	Thu, 27 Feb 2025 16:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eyymJuuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2519810EB37;
 Thu, 27 Feb 2025 16:51:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD36A615E7;
 Thu, 27 Feb 2025 16:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D42C4CEDD;
 Thu, 27 Feb 2025 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740675077;
 bh=Foef4ShNKzgr3xKniRsUqqlY2IEQP/gz/C1x5JBaGnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyymJuuTy0iFkxn57bvwlpAliGYLaP0EojiVKVw/ipss2QKxRcdEXY9LcMtx8F/zD
 osvHC/0tzn7ptCtsFp7WvVDFVJtTPxS9Pq56o61nmSTQ9wZx3SfrzafQV8Lr5oWYDW
 sTS5YHcjjcP5S42xF8IIn9qIIZrF2CWgNU7UPBOJoppaKKGPuA2D1tHxUvRPmwsy82
 5gjjU8tZUlsHImpVhpLI9t8LAc6OGZJGrz8DavlU2gV5EOXmOYWc7MfRQ2pd6HU/mS
 bJDHFmu7r2CPmHMqwakbc8zF8gTJW2J1GKV/Kdmkv/fAJNkEtblbcROqqrmUoz4ECE
 8L2IQ75hAPTiA==
Date: Thu, 27 Feb 2025 17:51:11 +0100
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
Message-ID: <Z8CX__mIlFUFEkIh@cassiopeiae>
References: <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com> <Z8BNXdf3CgqGYjPV@pollux>
 <20250227150709.GF39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227150709.GF39591@nvidia.com>
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

On Thu, Feb 27, 2025 at 11:07:09AM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 27, 2025 at 12:32:45PM +0100, Danilo Krummrich wrote:
> > On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> > > On Wed, Feb 26, 2025 at 10:31:10PM +0100, Danilo Krummrich wrote:
> > > > Let's take a step back and look again why we have Devres (and Revocable) for
> > > > e.g. pci::Bar.
> > > > 
> > > > The device / driver model requires that device resources are only held by a
> > > > driver, as long as the driver is bound to the device.
> > > > 
> > > > For instance, in C we achieve this by calling
> > > > 
> > > > 	pci_iounmap()
> > > > 	pci_release_region()
> > > > 
> > > > from remove().
> > > > 
> > > > We rely on this, we trust drivers to actually do this.
> > > 
> > > Right, exactly
> > > 
> > > But it is not just PCI bar. There are a *huge* number of kernel APIs
> > > that have built in to them the same sort of requirement - teardown
> > > MUST run with remove, and once done the resource cannot be used by
> > > another thread.
> > > 
> > > Basically most things involving function pointers has this sort of
> > > lifecycle requirement because it is a common process that prevents a
> > > EAF of module unload.
> > 
> > You're still mixing topics, the whole Devres<pci::Bar> thing as about limiting
> > object lifetime to the point where the driver is unbound.
> > 
> > Shutting down asynchronous execution of things, i.e. workqueues, timers, IOCTLs
> > to prevent unexpected access to the module .text section is a whole different
> > topic.
> 
> Again, the standard kernel design pattern is to put these things
> together so that shutdown isolates concurrency which permits free
> without UAF.
> 
> > In other words, assuming that we properly enforce that there are no async
> > execution paths after remove() or module_exit() (not necessarily the same),
> > we still need to ensure that a pci::Bar object does not outlive remove().
> 
> Yes, you just have to somehow use rust to ensure a call pci_iounmap()
> happens during remove, after the isolation.
> 
> You are already doing it with devm.  It seems to me the only problem
> you have is nobody has invented a way in rust to contract that the devm
> won't run until the threads are isolated.

You can do that, pci::Driver::probe() returns a Pin<KBox<Self>>. This object is
dropped when the device is unbound and it runs before the devres callbacks.

Using miscdevice as example, your MiscDeviceRegistration would be a member of
this object and hence dropped on remove() before the devres callbacks revoke
device resources.

> 
> I don't see this as insolvable, you can have some input argument to
> any API that creates concurrency that also pushes an ordered
> destructor to the struct device lifecycle that ensures it cancels that
> concurrency.
> 
> > Device resources are a bit special, since their lifetime must be cap'd at device
> > unbind, *independent* of the object lifetime they reside in. Hence the Devres
> > container.
> 
> I'd argue many resources should be limited to device unbind. Memory is
> perhaps the only exception.

There is a difference between should and must. A driver is fully free to bind
the lifetime of a miscdevice to either to the driver lifetime (object returned
by probe) or the module lifetime, both can be valid. That's a question of
semantics.

A device resource though is only allowed to be held by a driver as long as the
corresponding device is bound to the driver. Hence an API that does not ensure
that the pci::Bar is actually, forcefully dropped on device unbind is unsound.

So, let me ask you again, how do you ensure that a pci::Bar is dropped on device
unbind if we hand it out without the Devres container?

> 
> > > My fear, that is intensifying as we go through this discussion, is
> > > that rust binding authors have not fully comprehended what the kernel
> > > life cycle model and common design pattern actually is, and have not
> > > fully thought through issues like module unload creating a lifetime
> > > cycle for *function pointers*.
> > 
> > I do *not* see where you take the evidence from to make such a generic
> > statement.
> 
> Well, I take the basic insistance that is OK to leak stuff from driver
> scope to module scope is not well designed.
> 

Who insists on leaking stuff from driver scope to module scope is OK?
