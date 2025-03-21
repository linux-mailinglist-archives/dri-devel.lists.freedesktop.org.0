Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33209A6C2D1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 19:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5048F10E08D;
	Fri, 21 Mar 2025 18:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DdB+fJ+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF9110E08D;
 Fri, 21 Mar 2025 18:55:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 532A360008;
 Fri, 21 Mar 2025 18:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BE9C4CEE3;
 Fri, 21 Mar 2025 18:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742583307;
 bh=rMMq1uu2izef6+gd184FJdDmgM39ReEWsi5zY0wKNNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DdB+fJ+B+Tnzc3k43NwDuLYGiQQy0ujnSpNzowHog6mHXHqgVF2fc3CWaenHUWpdn
 H2qtWJU7uv5An1rxG9b7v4DbD9odAbyDlDIUYAZaj0js8BKM3QyZss1O4Qrx28GA1P
 AWx21102KI1UX0ridwsx6VEf5pKuxTNyBgkmkZjlu3uWwJBw51cBgHCKK7gkuUwMRM
 IHrJkauJ4iLknflstQIeNwCKN4EQMn8a72jhCacsGFWqLK2SneUerFqR6aPBMlC1eL
 5X+Jm6ehGJOWXiaAnddv+ZvsRZ4bHPJTVNEV0uyG/AzhELsM53bf5pUIdh67AoG9gy
 usOMOmBJzhrUg==
Date: Fri, 21 Mar 2025 19:54:55 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z921_7-I0bXDN_Si@cassiopeiae>
References: <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
 <20250307145557.GO354511@nvidia.com>
 <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
 <20250319172132.GL9311@nvidia.com>
 <Z91A_Dz-nY2iFqYb@phenom.ffwll.local>
 <20250321120416.GX206770@nvidia.com> <Z91XrltJYtJdkLUS@pollux>
 <20250321174920.GZ206770@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321174920.GZ206770@nvidia.com>
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

On Fri, Mar 21, 2025 at 02:49:20PM -0300, Jason Gunthorpe wrote:
> On Fri, Mar 21, 2025 at 01:12:30PM +0100, Danilo Krummrich wrote:
> 
> > Not all device resources are managed in the context of the subsystem, so
> > subsystem-level revokes do not apply.
> 
> They could, you could say that these rust APIs are only safe to use
> for device drivers with C code providing a fence semantic, eg through
> a subsystem.

Not sure how such an implementation would look like. How would you model such a
requirement through the type system? Or do you propose to just use unsafe {}?

> > For the DMA coherent allocations, please see my comment in [1]. Revoking the
> > device resources associated with a DMA coherent allocation should hence never
> > cause any overhead for accessing DMA memory.
> 
> > [1] https://github.com/Rust-for-Linux/linux/blob/rust-next/rust/kernel/dma.rs#L120
> 
> I don't know what to make of this. You argued so much to support
> revocable for rust ideological reasons and in the end the proposal is
> to just completely gives up on all of that?

And I still do so for certain cases, such as I/O memory.

For the CoherentAllocation though, AFAICS, there is no reason to revoke all the
memory, but just the device resources behind.

You gave me the relevant cause for thought on this. I don't see why you would be
unhappy with the idea. We still correspond with the rules of the driver core,
i.e. ensure that device resources do not out-live driver unbind, but still don't
have to deal with a revocable wrapper.

(One side note, please stop continuously accusing me of things, such as having
"rust ideological reasons", not having gone through proper review with the
driver core abstractions, etc. It won't achieve anything and does not come
across very professional.)

> 
> Not even an optional runtime check? :(

What kind of runtime check do you propose in the meantime? Maybe you can send a
patch? That'd be very much appreciated.

> 
> And I'm not sure about the comment written:
> 
> > // However, it is neither desirable nor necessary to protect the allocated memory of the DMA
> > // allocation from surviving device unbind;
> 
> There are alot of things on this path that depend on the struct
> device, there are two kinds of per-device coherent memory allocators
> and swiotlb as well.
> 
> It looks like there are cases where the actual memory must not outlive
> the driver binding.

I don't see why actual memory allocations would ever be required to be freed
immediately when the driver is unbound. It has nothing to do with the device.

Do you have an example where this would be a requirement?

> 
> So, I'd argue that it is necessary, and changing that on the C side
> looks like a big project.

I don't think that the idea is trivial to implement, but ideally the C side
should benefit as well.
