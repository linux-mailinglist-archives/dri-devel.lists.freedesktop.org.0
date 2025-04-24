Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A04A9B8AD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 22:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5667910E861;
	Thu, 24 Apr 2025 20:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hFhgNJNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A9010E85C;
 Thu, 24 Apr 2025 20:01:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4CB6B61137;
 Thu, 24 Apr 2025 20:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FF0C4CEE4;
 Thu, 24 Apr 2025 20:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745524917;
 bh=I/5AaiyphNo34zBMZtPrQNZj2QmmzY/W/pdD16xNRKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hFhgNJNNQ7/AIdB/0axBMufc5VbeI+w2xVQZjZen3f366YV5eXVjFXaTPPIRsKOH0
 9XpZcTt1JyTYqK+fa72eCBZ3U/9sjWsMeSJ3fZ1/dXn6Urm5GahQiwvoMRWg6xEl9c
 sE3Hy1GtowGSOW/tOl0tpEw17bN6nt4JW1VP7M5wvmb8/RRwJ6iN56jWnEv/7cm8sx
 B0GVXYPOXSK2mEwXrlseH3NV6LGU9Jk3Y0Qa81aSv0sEYe+3fBDpvKpmOZXhC8fY4d
 V4u6EXlQfsJ51QTNSbKajOTRNzMN7V0MR99+BSe3Uhg+bXGuG7b/K8cNayWrSLgcCA
 mu5HU1xIkM9aQ==
Date: Thu, 24 Apr 2025 22:01:50 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aAqYrkqshxHZtz3h@pollux>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com>
 <aAjz2CYTsAhidiEU@pollux>
 <88937e2b-6950-4c9d-8f02-50f9b12c7376@nvidia.com>
 <aAkBIvfTkKVNbdnm@pollux> <20250424191900.GA174004@joelnvbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424191900.GA174004@joelnvbox>
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

On Thu, Apr 24, 2025 at 03:19:00PM -0400, Joel Fernandes wrote:
> On Wed, Apr 23, 2025 at 05:02:58PM +0200, Danilo Krummrich wrote:
> 
> [..]
> 
> > > >> +        data.extend_with(len, 0, GFP_KERNEL)?;
> > > >> +        with_bar!(?bar0, |bar0_ref| {
> > > >> +            let dst = &mut data[current_len..current_len + len];
> > > >> +            for (idx, chunk) in dst
> > > >> +                .chunks_exact_mut(core::mem::size_of::<u32>())
> > > >> +                .enumerate()
> > > >> +            {
> > > >> +                let addr = start + (idx * core::mem::size_of::<u32>());
> > > >> +                // Convert the u32 to a 4 byte array. We use the .to_ne_bytes()
> > > >> +                // method out of convenience to convert the 32-bit integer as it
> > > >> +                // is in memory into a byte array without any endianness
> > > >> +                // conversion or byte-swapping.
> > > >> +                chunk.copy_from_slice(&bar0_ref.try_read32(addr)?.to_ne_bytes());
> > > >> +            }
> > > >> +            Ok(())
> > > >> +        })?;
> > > >> +
> > > >> +        Ok(())
> > > >> +    }
> > > ..actually initially was:
> > > 
> > > +        with_bar!(self.bar0, |bar0| {
> > > +            // Get current length
> > > +            let current_len = self.data.len();
> > > +
> > > +            // Read ROM data bytes push directly to vector
> > > +            for i in 0..bytes as usize {
> > > +                // Read byte from the VBIOS ROM and push it to the data vector
> > > +                let rom_addr = ROM_OFFSET + current_len + i;
> > > +                let byte = bar0.try_readb(rom_addr)?;
> > > +                self.data.push(byte, GFP_KERNEL)?;
> > > 
> > > Where this bit could result in a lot of allocation.
> > > 
> > > There was an unsafe() way of not having to do this but we settled with
> > > extends_with().
> > > 
> > > Thoughts?
> > 
> > If I understand you correctly, you just want to make sure that subsequent push()
> > calls don't re-allocate? If so, you can just use reserve() [1] and keep the
> > subsequent push() calls.
> > 
> > [1] https://rust.docs.kernel.org/kernel/alloc/kvec/struct.Vec.html#method.reserve
> 
> 
> 
> Ok that does turn out to be cleaner! I replaced it with the following and it works.
> 
> Let me know if it looks good now? Here's a preview:
> 
> -        data.extend_with(len, 0, GFP_KERNEL)?;
> +        data.reserve(len, GFP_KERNEL)?;
> +
>          with_bar_res!(bar0, |bar0_ref| {
> -            let dst = &mut data[current_len..current_len + len];
> -            for (idx, chunk) in dst
> -                .chunks_exact_mut(core::mem::size_of::<u32>())
> -                .enumerate()
> -            {
> -                let addr = start + (idx * core::mem::size_of::<u32>());
> -                // Convert the u32 to a 4 byte array. We use the .to_ne_bytes()
> -                // method out of convenience to convert the 32-bit integer as it
> -                // is in memory into a byte array without any endianness
> -                // conversion or byte-swapping.
> -                chunk.copy_from_slice(&bar0_ref.try_read32(addr)?.to_ne_bytes());
> +            // Read ROM data bytes and push directly to vector
> +            for i in 0..len {
> +                // Read 32-bit word from the VBIOS ROM
> +                let rom_addr = start + i * core::mem::size_of::<u32>();
> +                let word = bar0_ref.try_read32(rom_addr)?;
> +
> +                // Convert the u32 to a 4 byte array and push each byte
> +                word.to_ne_bytes().iter().try_for_each(|&b| data.push(b, GFP_KERNEL))?;
>              }

Looks good to me, thanks!
