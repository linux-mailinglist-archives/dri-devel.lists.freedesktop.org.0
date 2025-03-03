Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D22A4CC0A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 20:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C93910E1BA;
	Mon,  3 Mar 2025 19:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lw+Gvtmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB75810E1BA;
 Mon,  3 Mar 2025 19:36:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 14001A44F5A;
 Mon,  3 Mar 2025 19:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9D0C4CEE6;
 Mon,  3 Mar 2025 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741030599;
 bh=Rrsi+P0TAaJlgstiL0zX1C6HHgzkHudV6w9RtYlyxZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lw+GvtmxYWZ2f2i11D7C8244EfvjE1OuRDe19aHlmeaPyExIxG6O/SzaKJ6eQpLAE
 98rvdoHLTrRxKpjrBq2F8+2wP1nza/gtUkLRxurNJUuYPGyO/UByVt0njer/WbZpvL
 6c1wGiTofN6V/gH4X/mHqvQtY+nsiUolTF6lA6eWAokTgMQhp5AXPH5W1wUZ0nri91
 5DK7u8z6dFuOdZCeGPQLvPZHG4T90UjvkvHQc7DH3/ky8aKG5KKaMdDROndmedBo9N
 r8sMF3hPMtwbS4BFX5lpr9Gii6u62R2aq3KwDGeCKjQHkd1C+ad6zWoy2joKPqQZ6I
 N1QayNH6Iq7EQ==
Date: Mon, 3 Mar 2025 20:36:34 +0100
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
Message-ID: <Z8YEwrBJyLYL6sci@cassiopeiae>
References: <20250227144618.GE39591@nvidia.com> <Z8CCKl_yA74WjpQ1@Mac.home>
 <20250227161733.GH39591@nvidia.com> <Z8CY7fqbtbO4v1jv@Mac.home>
 <Z8ChnwPC0UwM8xBe@cassiopeiae> <20250227192321.GA67615@nvidia.com>
 <Z8DYNszfONdsKZsl@boqun-archlinux>
 <20250227220013.GQ39591@nvidia.com> <Z8Dp9dM1MxhzuvmR@pollux>
 <20250228185534.GH39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228185534.GH39591@nvidia.com>
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

On Fri, Feb 28, 2025 at 02:55:34PM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 27, 2025 at 11:40:53PM +0100, Danilo Krummrich wrote:
> > On Thu, Feb 27, 2025 at 06:00:13PM -0400, Jason Gunthorpe wrote:
> > > On Thu, Feb 27, 2025 at 01:25:10PM -0800, Boqun Feng wrote:
> > > > 
> > > > Most of the cases, it should be naturally achieved, because you already
> > > > bind the objects into your module or driver, otherwise they would be
> > > > already cancelled and freed. 
> > > 
> > > I'm getting the feeling you can probably naturally achieve the
> > > required destructors, but I think Danillo is concerned that since it
> > > isn't *mandatory* it isn't safe/sound.
> > 
> > Of course you can "naturally" achieve the required destructors, I even explained
> > that in [1]. :-)
> > 
> > And yes, for *device resources* it is unsound if we do not ensure that the
> > device resource is actually dropped at device unbind.
> 
> Why not do a runtime validation then?
> 
> It would be easy to have an atomic counting how many devres objects
> are still alive.

(1) It would not be easy at all, if not impossible.

A Devres object doesn't know whether it's embedded in an Arc<Devres>, nor does
it know whether it is embedded in subsequent Arc containers, e.g.
Arc<Arc<Devres>>.

It is impossible for a Devres object to have a global view on how many
references keep it alive.

> 
> Have remove() WARN_ON to the atomic and a dumb sleep loop until it is 0.
> 
> Properly written drives never hit it. Buggy drivers will throw a
> warning and otherwise function safely.

Ignoring (1), I think that's exactly the opposite of what we want to achieve.

This would mean that the Rust abstraction does *not avoid* but *only detect* the
problem.

The formal problem: The resulting API would be unsound by definition.

The practical problem: Buggy drivers could (as you propose) stall the
corresponding task forever, never releasing the device resource. Not releasing
the device resource may stall subsequent drivers trying to probe the device, or,
if the physical memory region has been reassigned to another device, prevent
another device from probing. This is *not* what I would call "function safely".

With the current API nothing of that kind is possible at all. And that is what
we want to achieve as good as possible: Make Rust driver APIs robust enough,
such that even buggy drivers can't mess up the whole kernel. Especially for a
monolithic kernel this seems quite desirable.

- Danilo
