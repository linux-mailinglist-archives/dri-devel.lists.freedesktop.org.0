Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5BA46D7C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 22:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D60510E2EF;
	Wed, 26 Feb 2025 21:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="faGsjtBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822E110E2EF;
 Wed, 26 Feb 2025 21:31:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DF325C68BC;
 Wed, 26 Feb 2025 21:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA086C4CED6;
 Wed, 26 Feb 2025 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740605475;
 bh=dtdm5QCuK+ylUVFnyHD+iIwr9QzhpWvNNNqtSoMMkzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=faGsjtBDdDxDB4wnFlsJ9twdJiu5JkhIWlfWJL61nByZSjpGEHolejTLnRVUNoPnL
 PcjvTW3LMvJhxR8Kb0ymOzHCMzc7aFt1G+xL77wo3v7pTthsbUvnxFULNTLFjIideR
 nh/31bjc5MHKX6VhxuBxA0QpYtMatNwtuHX/EQco1uhTDZw7UrK3pHuVQAP4li6OWb
 nNsvgKpV64GQTbAtDj6EzSCrFoETlDeFYGkCz5VEiNHwhl+IVZ+3VN33ISDhM5ja/B
 ZuwKtU4f76QKIOn0MPwZg8uKTZQJZKoxs6KJ9EqFfwaeac2UggGG3TE3/9g/Oh+Ht7
 iHyq2b/AqA81Q==
Date: Wed, 26 Feb 2025 22:31:10 +0100
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
Message-ID: <Z7-IHgcVVS8XBurW@cassiopeiae>
References: <20250224184502.GA1599486@joelnvbox> <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226172120.GD28425@nvidia.com>
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

On Wed, Feb 26, 2025 at 01:21:20PM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 26, 2025 at 02:16:58AM +0100, Danilo Krummrich wrote:
> > Again, the reason a pci::Bar needs to be revocable in Rust is that we can't have
> > the driver potentially keep the pci::Bar alive (or even access it) after the
> > device is unbound.
> 
> My impression is that nobody has yet come up with a Rust way to
> implement the normal kernel design pattern of revoke threads then free
> objects in safe rust.

I get where you're coming from (and I agree), but that is a different issue.

Let's take a step back and look again why we have Devres (and Revocable) for
e.g. pci::Bar.

The device / driver model requires that device resources are only held by a
driver, as long as the driver is bound to the device.

For instance, in C we achieve this by calling

	pci_iounmap()
	pci_release_region()

from remove().

We rely on this, we trust drivers to actually do this.

We also trust drivers that they don't access the pointer originally returned by
pci_iomap() after remove(). Typically, drivers do this by shutting down all
asynchronous execution paths, e.g. workqueues. Some other drivers might still
run code after remove() and hence needs some synchronization, like DRM.

In Rust pci_iounmap() and pci_release_region() are called when the pci::Bar
object is dropped. But we don't want to trust the driver to actually do this.
Instead, we want to ensure that the driver can *not* do something that is not
allowed by the device / driver model.

Therefore, we never hand out a raw pci::Bar to driver, but a Devres<pci::Bar>.
With this a driver can't prevent the pci::Bar being dropped once the device is
unbound.

So, the main objective here is to ensure that a driver can't keep the pci::Bar
(and hence the memory mapping) alive arbitrarily.

Now, let's get back to concurrent code that might still attempt to use the
pci::Bar. Surely, we need mechanisms to shut down all asynchronous execution
paths (e.g. workqueues) once the device is unbound. But that's not the job of
Devres<pci::Bar>. The job of Devres<pci::Bar> is to be robust against misuse.

Again, that the revocable characteristic comes in handy for drivers that still
run code after remove() intentionally, is a nice coincidence.

> 
> Yes, this is a peculiar lifetime model, but it is pretty important in
> the kernel. I'm not convinced you can just fully ignore it in Rust as
> a design pattern. We use it pretty much everywhere a function pointer
> is involved.
> 
> For instance, I'm looking at workqueue.rs and wondering why is it safe
> against Execute After Free races. I see none of the C functions I
> would expect to be used to prevent those races in the code.
> 
> Even the simple example:
> 
> //! fn print_later(val: Arc<MyStruct>) {
> //!     let _ = workqueue::system().enqueue(val);
> //! }
> 
> Seems to be missing the EAF prevention ie WorkItem::run() is in .text
> of THIS_MODULE and I see nothing is preventing THIS_MODULE from being
> unloaded.
> 
> The expectation of work queues is to follow the above revoke threads
> then free pattern. A module should do that sequence in the driver
> remove() or module __exit function.

Fully agree with that.

I guess you're referring to cancel_work_sync() and friends as well as
destroy_workqueue(), etc.

They're indeed missing, this is because the workqueue work originates from the
Rust binder efforts and binder is only used builtin, so there was no need so
far.

But yes, once people start using workqueues for other modules, we surely need to
extend the abstraction accordingly.

Other abstractions do consider this though, e.g. the upcoming hrtimer work. [1]

In terms of IOCTLs it depends on the particular subsystem, but this is (or will
be) also reflected by the corresponding abstraction. Dropping a
MiscDeviceRegistration [2] on module_exit() for instance will ensure that there
are no concurrent IOCTLs, just like the corresponding C code.

[1] https://lore.kernel.org/rust-for-linux/20250224-hrtimer-v3-v6-12-rc2-v9-0-5bd3bf0ce6cc@kernel.org/
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/miscdevice.rs#n50
