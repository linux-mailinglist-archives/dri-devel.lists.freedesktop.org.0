Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6694FA450E9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 00:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7A910E81C;
	Tue, 25 Feb 2025 23:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fdofdHDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B17510E811;
 Tue, 25 Feb 2025 23:27:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D4E85C6394;
 Tue, 25 Feb 2025 23:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A7FC4CEDD;
 Tue, 25 Feb 2025 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740526018;
 bh=ibAdGeayJwCauyp3OQL2DUFoUDuFf6aXjCY4OlFfh/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fdofdHDYJmVgwd5SbpoRfwuuUiVWfm0Mgv0L+/ovSo49vnfbP77ctkJCr3rjOC8wq
 f4O9pk67EBlKjzGrXfKrxCnoBl6vwIfb4urPebINmvWq9Jr6J23B6rURn62m/KklNn
 3jV9WoJrUSsmYRz2SfRPpQoKwvST+JpVIJRumiylC0+s1SM7awNyhYsHm9t3bjqRKP
 nyk88IOM+/N70YLZolcMCrlsY1Kobw8VUv6/qscKjBQx4+MkszIs/5MWi+2nY5VN64
 BAIsj5uw4cVz5Yx1FwPIa+dL8/OxUrd+uKG/Ayiz5LxqQbjWQD3vDoqWTw0hXaNYtr
 rby230WMJ2n+g==
Date: Wed, 26 Feb 2025 00:26:53 +0100
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
Message-ID: <Z75RvU-Yb70iFyor@cassiopeiae>
References: <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225225756.GA4959@nvidia.com>
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

On Tue, Feb 25, 2025 at 06:57:56PM -0400, Jason Gunthorpe wrote:
> I think this resource-revoke idea is deviating from the normal
> expected driver model by allowing driver code to continue to run in
> other threads once remove completes. That is definitely abnormal at
> least.

No, it simply guarantees that once remove() completed the pointer to the
resource can't be accessed anymore and the resource can't be kept alive
(which includes the actual memory mapping as well as the allocated resource
region).

It also solves the unplug problem, where ioctls can't access the resource
anymore after remove(). This is indeed a problem that does not affect all
subsystems.

> 
> It is not necessarily *wrong*, but it sure is weird and as I explained
> above it has bad system level properties.
> 
> Further, it seems to me there is a very unique DRM specific issue at
> work "time unbounded driver callbacks". A weird solution to this
> should not be baked into the common core kernel rust bindings and
> break the working model of all other subsystems that don't have that
> problem.
> 
> > > Similarly you can have custom functions for short sequences of I/O ops, or use
> > > closures. I don't understand the concern.
> > 
> > Yeah, this is certainly possible. I think one concern is similar to what you
> > raised on the other thread you shared [1]:
> > "Maybe we even want to replace it with SRCU entirely to ensure that drivers
> > can't stall the RCU grace period for too long by accident."
> 
> I'd be worried about introducing a whole bunch more untestable failure
> paths in drivers. Especially in areas like work queue submit that are
> designed not to fail [2]. Non-failing work queues is a critical property
> that I've relied on countless times. I'm not sure you even *can* recover
> from this correctly in all cases.
> 
> Then in the other email did you say that even some memory allocations
> go into this scheme? Yikes!

"For instance, let's take devm_kzalloc(). Once the device is detached
from the driver the memory allocated with this function is freed automatically.

The additional step in Rust is, that we'd not only free the memory, but also
revoke the access to the pointer that has been returned by devm_kzalloc() for
the driver, such that it can't be used by accident anymore."

This was just an analogy to explain what we're doing here. Obviously, memory
allocations can be managed by Rust's object lifetime management.

The reason we have Devres for device resources is that the lifetime of a
pci::Bar is *not* bound to the object lifetime directly, but to the lifetime of
the binding between a device and a driver. That's why it needs to be revoked
(which forcefully drops the object) when the device is unbound *not* when the
pci::Bar object is dropped regularly.

That's all the magic we're doing here. And again, this is not a change to the
device / driver model. It is making use of the device / driver model to ensure
safety.

> 
> Further, hiding a synchronize_rcu in a devm destructor [3], once per
> revocable object is awful. If you imagine having a rcu around each of
> your revocable objects, how many synchronize_rcu()s is devm going to
> call post-remove()?

As many as you have MMIO mappings in your driver. But we can probably optimize
this to just a single synchronize_rcu().
