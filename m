Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F2A4D96D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C55E10E557;
	Tue,  4 Mar 2025 09:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wfela3jy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D9B10E311;
 Tue,  4 Mar 2025 09:57:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC7E45C5406;
 Tue,  4 Mar 2025 09:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5728AC4CEE5;
 Tue,  4 Mar 2025 09:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741082260;
 bh=JCpnB2cwQ/OfOpNm6zKEPewB/fS1/cePt/IPMtfsJtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wfela3jyONID+2sSXqcrsgf1EK+GswngYsCeHlO2XlmUJro+A7BAEnJ6pdhnqGT4m
 lJRzGCET/OrxSe8xULTxQvA9ewV/Oa/v4KnzYlRbCzQyV8fDMS9HvnWb+2RCQK40/T
 QHYIlKE03ReQ5t+WPYK6+F1owUq9aA3SYuGI9wDFyoL6TMfdaMW4DkvpocuajTKgeG
 euEwCTMot9rvCsgaDJ1bwSmRwNqDjplkI294FkRUI1Tge8CBzCvnvgw8pleHNeOKwQ
 /+U+d9NzETIVIZ8Ih9v5GLOMBY0okjj1/UZXSgMGOvS+V2ThcNAzP9urv07kTcbMba
 rwaepzBp2GfQQ==
Date: Tue, 4 Mar 2025 10:57:34 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8bOjiQ3KXw-CkPo@pollux>
References: <20250227161733.GH39591@nvidia.com> <Z8CY7fqbtbO4v1jv@Mac.home>
 <Z8ChnwPC0UwM8xBe@cassiopeiae> <20250227192321.GA67615@nvidia.com>
 <Z8DYNszfONdsKZsl@boqun-archlinux>
 <20250227220013.GQ39591@nvidia.com> <Z8Dp9dM1MxhzuvmR@pollux>
 <20250228185534.GH39591@nvidia.com> <Z8YEwrBJyLYL6sci@cassiopeiae>
 <20250303215002.GF133783@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303215002.GF133783@nvidia.com>
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

On Mon, Mar 03, 2025 at 05:50:02PM -0400, Jason Gunthorpe wrote:
> On Mon, Mar 03, 2025 at 08:36:34PM +0100, Danilo Krummrich wrote:
> > > > And yes, for *device resources* it is unsound if we do not ensure that the
> > > > device resource is actually dropped at device unbind.
> > > 
> > > Why not do a runtime validation then?
> > > 
> > > It would be easy to have an atomic counting how many devres objects
> > > are still alive.
> > 
> > (1) It would not be easy at all, if not impossible.
> > 
> > A Devres object doesn't know whether it's embedded in an Arc<Devres>, nor does
> > it know whether it is embedded in subsequent Arc containers, e.g.
> > Arc<Arc<Devres>>.
> 
> You aren't tracking that. If Rust has a problem, implement it in C:

Rust does not have a problem here. Arc is implemented as:

	pub struct Arc<T: ?Sized> {
	    ptr: NonNull<ArcInner<T>>,
	    _p: PhantomData<ArcInner<T>>,
	}

	#[repr(C)]
	struct ArcInner<T: ?Sized> {
	    refcount: Opaque<bindings::refcount_t>,
	    data: T,
	}

Which simply means that 'data' can't access its reference count.

You did identify this as a problem, since you think the correct solution is to
WARN() if an object is held alive across a certain boundary by previously taken
references. Where the actual solution (in Rust) would be to design things in a
way that this isn't possible in the first place.

Let me also point out that the current solution in Rust is perfectly aligned
with what you typically do in C conceptually.

In C you would call

	devm_request_region()
	devm_ioremap()

and you would store the resulting pointer in some driver private structure.

This structure may be reference counted and may outlive remove(). However, if
that's the case it doesn't prevent that the memory region is freed and the
memory mapping is unmapped by the corresponding devres callbacks.

We're following the exact same semantics in Rust, except that we don't leave the
driver private structure with an invalid pointer.

In contrast you keep proposing to turn that into some kind of busy loop in
remove(). If you think that's better, why don't you try to introduce this design
in C first?

> 
>   devm_rsgc_start(struct device *)
>   devm_rsgc_pci_iomap(struct device *,..)
>   devm_rsgc_pci_iounmap(struct device *,..)
>   devm_rsgc_fence(struct device *)
> 
> Surely that isn't a problem for bindings?

Wrapping those functions? Yes, that's not a problem in general.

But obviously I don't know what they're doing, i.e. how is devm_rsgc_pci_iomap()
different from pcim_iomap()?

I also don't know how you would encode them into an abstraction and how this
abstraction fits into the device / driver lifecycle.

Neither can I guess that from four function names, nor can I tell you whether
that results in a safe, sound and reasonable API.

And given that you don't seem to know about at least some Rust fundamentals
(i.e. how Arc works), I highly doubt that you can predict that either without
coding it up entirely, can you?

I explained the reasons for going with the current upstream design in detail,
and I'm happy to explain further if there are more questions.

But, if you just want to change the existing design, this isn't the place.
Instead, please follow the usual process, i.e. write up some patches, explain
how they improve the existing code and then we can discuss them.

> > The practical problem: Buggy drivers could (as you propose) stall the
> > corresponding task forever, never releasing the device resource. 
> 
> Should't be never. Rust never leaks memory? It will eventually be
> unstuck when Rust frees the memory in the concurrent context that is
> holding it.

We're passing Arc objects as ForeignOwnable to C code. If the C code leaks
memory, the corresponding memory allocated in Rust leaks too.

For the definition of "safe" in Rust we assume that C code used underneath is
never buggy, but the reality is different.

> 
> > Not releasing the device resource may stall subsequent drivers
> > trying to probe the device, or, if the physical memory region has
> > been reassigned to another device, prevent another device from
> > probing. This is *not* what I would call "function safely".
> 
> It didn't create a security problem.
> 
> The driver could also write 
> 
>  while (true)
>     sleep(1)

Seriously? Are you really arguing "My potentially infinite loop is not a problem
because a driver could also write the above"?

> In the remove function and achieve all of the above bad things, should
> you try to statically prevent that too?

Absolutely.
