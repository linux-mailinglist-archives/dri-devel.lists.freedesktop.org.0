Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889EAA48BC6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 23:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868FD10E0D5;
	Thu, 27 Feb 2025 22:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DmfKIOC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A630810E0D5;
 Thu, 27 Feb 2025 22:41:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE3525C4360;
 Thu, 27 Feb 2025 22:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA23C4CEDD;
 Thu, 27 Feb 2025 22:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740696059;
 bh=LaGdAUd/RllEkxWfeRFsyYdY2vwu+WCIEmuoB0PLBOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DmfKIOC7yMzI1djFJKofbZgE/fmbeUKNGGsDEVl3q6ViaHXGl30u2+2oXYoyhO5vJ
 ON9Fq8ghpAyrhI/ebpTLV5PSFWqmYGKnRULuR2Ns6FC4UUN4bIIbOJqyagQbol0PUT
 VFWKQlVR+wZ6e8oswZQS0lVa64ckn5FouAMJp4e4WJOmLcYbbRxgYQWVQNvhSWA0Vs
 O42DCyNMyy0sL0AyIsAwgTk7cBgz2H17ifAWz3hThWIpVc1oDbza12ZBlhhYpUfWtL
 lzDcqUvwz88KbhJO3WDl7Pggoga3AmaiSYOHBKj//I9L6kxma9UzuQDxQurEvoBUtD
 rCZSdQLbsru7Q==
Date: Thu, 27 Feb 2025 23:40:53 +0100
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
Message-ID: <Z8Dp9dM1MxhzuvmR@pollux>
References: <20250226234730.GC39591@nvidia.com>
 <Z7-0pOmWO6r_KeQI@boqun-archlinux>
 <20250227144618.GE39591@nvidia.com> <Z8CCKl_yA74WjpQ1@Mac.home>
 <20250227161733.GH39591@nvidia.com> <Z8CY7fqbtbO4v1jv@Mac.home>
 <Z8ChnwPC0UwM8xBe@cassiopeiae> <20250227192321.GA67615@nvidia.com>
 <Z8DYNszfONdsKZsl@boqun-archlinux>
 <20250227220013.GQ39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227220013.GQ39591@nvidia.com>
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

On Thu, Feb 27, 2025 at 06:00:13PM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 27, 2025 at 01:25:10PM -0800, Boqun Feng wrote:
> > 
> > Most of the cases, it should be naturally achieved, because you already
> > bind the objects into your module or driver, otherwise they would be
> > already cancelled and freed. 
> 
> I'm getting the feeling you can probably naturally achieve the
> required destructors, but I think Danillo is concerned that since it
> isn't *mandatory* it isn't safe/sound.

Of course you can "naturally" achieve the required destructors, I even explained
that in [1]. :-)

And yes, for *device resources* it is unsound if we do not ensure that the
device resource is actually dropped at device unbind.

Maybe some example code does help. Look at this example where we assume that
pci::Device::iomap_region() does return a pci::Bar instead of a
Devres<pci::Bar>, which it actually does. (The example won't compile, since,
for readability, it's heavily simplified.)

    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
        let bar: pci::Bar = pdev.iomap_region()?;

        let drvdata = Arc::new(bar, GFP_KERNEL)?;

        let drm = drm::device::Device::new(pdev.as_ref(), drvdata)?;
        let reg = drm::drv::Registration::new(drm)?;

        // Everything in `Self` is dropped on remove(), hence the DRM driver is
        // unregistered on remove().
        Ok(KBox::new(Self(reg), GFP_KERNEL)?)
    }

This is already broken, because now the lifetime of the pci::Bar is bound to the
DRM device and the DRM device is allowed to outlive remove().

Subsequently, pci_iounmap() and pci_release_region() are not called in remove(),
but whenever the DRM device is dropped.

The fact that this is possible with safe code, makes this API unsound.

Now let's assume iomap_region() would return a Devres<pci::Device>. That fixes
the problem, because even if the DRM device keeps the Devres<pci::Device> object
alive, it is still dropped when the driver is unbound, and subsequently
pci_iounmap() and pci_release_region() are called when they're supposed to be
called.

Note that this would not be a problem if pci::Device would not be a device
resource. Other stuff may be perfectly fine to bind to the lifetime of the DRM
device.

[1] https://lore.kernel.org/rust-for-linux/Z8CX__mIlFUFEkIh@cassiopeiae/
