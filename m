Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500EBB99BDD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 14:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258DC10E714;
	Wed, 24 Sep 2025 12:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QjMXdBQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE7610E714;
 Wed, 24 Sep 2025 12:04:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AE6A660007;
 Wed, 24 Sep 2025 12:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DF9C4CEE7;
 Wed, 24 Sep 2025 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758715458;
 bh=WkKWSTKQK3ER2Y4tGyeGlKZjke1YkCrFXEV5CaatahE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QjMXdBQgx/x1h/za5phJQCEeSYjcj+UkrV7fK0KhNTuOix7QnyxRgr/dbnha9vSd9
 zdsd6ZvlYBePWju+YtvQKlxSAwrg12fLt0mCCh0F/Ue4NMqcRTXbuCih7Hd1u2XqYI
 zqZCxjtSSyjfAVIL0y7H+sT9mHMOZ771oEjotlPU=
Date: Wed, 24 Sep 2025 14:04:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Message-ID: <2025092433-bakeshop-derail-28a7@gregkh>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
 <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh>
 <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
 <2025092432-entrust-citizen-0232@gregkh>
 <DD0ZTZM8S84H.1YDWSY7DF14LM@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD0ZTZM8S84H.1YDWSY7DF14LM@kernel.org>
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

On Wed, Sep 24, 2025 at 01:28:18PM +0200, Danilo Krummrich wrote:
> On Wed Sep 24, 2025 at 12:52 PM CEST, Greg KH wrote:
> > Ok, great, but right now it's not doing that from what I am seeing when
> > reading the code.  Shouldn't IoMem::new() take that as an argument?
> 
> That's correct, neither IoMem nor pci::Bar do consider it yet; it's on the list
> of things that still need to be done.
> 
> > But, that feels odd as our current iomem api in C doesn't care about
> > endian issues at all because it "assumes" that the caller has already
> > handle this properly and all that the caller "wants" is to write/read to
> > some memory chunk and not twiddle bits.
> 
> Yet it seems to be the correct place to deal with it. As mentioned below, regmap
> could just become part of an I/O backend implementation to do exactly that.
> 
> >> (Actually, we could even implement an I/O backend that uses regmap.)
> >
> > That would probably be best to do eventually as most platform drivers
> > use regmap today as it's the sanest api we have at the moment.
> 
> I agree it's what we should do eventually.
> 
> >> So, I think the register!() stuff is rather orthogonal.
> >
> > I think it's very relevant as people seem to just be "assuming" that all
> > the world (hardware and cpus) are little-endian, while in reality, they
> > are anything but.  As proof, the code that uses this register!() logic
> > today totally ignores endian issues and just assumes that it is both
> > running on a little-endian system, AND the hardware is little-endian.
> >
> > As a crazy example, look at the USB host controllers that at runtime,
> > have to be queried to determine what endian they are running on and the
> > kernel drivers have to handle this "on the fly".  Yes, one can argue
> > that the hardware developers who came up with that should be forced to
> > write the drivers as penance for such sins, but in the end, it's us that
> > has to deal with it...
> >
> > So ignoring it will get us quite a ways forward with controlling sane
> > hardware on sane systems, but when s390 finally realizes they can be
> > writing their drivers in rust, we are going to have to have these
> > conversations again :)
> 
> I think it's not really that anyone is ignoring it (intentionally). It's two
> different things that should be addressed here; yet they are related:
> 
>   (1) Implementation of an abstract representation of a register that drivers
>       can interact with.
> 
>   (2) The I/O layer that lays out the raw data on the physcial bus.
> 
> The register!() macro intends to provide an abstract representation of a
> register for drivers to interact with. Think of it as an abstract box, where the
> memory layout does not matter at all -- could be anything.
> 
> Theoretically, this abstraction could even store every single field of a
> register in its own u32 or u64, etc. Of course, that's a waste of memory, which
> is why we're using this bitfield thing instead.
> 
> The only thing that matters is that there is a contract between the struct
> representing a register (generated by the register!() macro) and the I/O backend
> layer that lays out the raw value on the bus.
> 
> This works attempts to address (1), whereas you are (rightfully) asking for (2).
> And I think the answer for (2) simply is, we still have to address it.

Ok, fair enough, you've convinced me, I'll let you all argue which side
the "0" should be on (left or right) :)

Let's wait for the first platform drivers to start showing up that want
to use regmap, hopefully that will be soon as almost all of the pieces
are there to do so.

thanks,

greg k-h
