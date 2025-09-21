Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7026B8DC9F
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 15:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A951110E08B;
	Sun, 21 Sep 2025 13:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lSPYZM7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FD710E08B;
 Sun, 21 Sep 2025 13:48:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 986A9601D2;
 Sun, 21 Sep 2025 13:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B4BC4CEE7;
 Sun, 21 Sep 2025 13:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758462482;
 bh=WaSzBYYm7PaYd/6yU5zaiRxWjqVCre7xn6qFahF6TT0=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=lSPYZM7YBjQ02SeKD+OEOEKo/Iw/EV2PBWqmOPS/DK1hpYy3gByOSgccuVuYAHY9h
 AijapyhOCr4JHrKzuEbm+x2Kg36L+oHphcpQLvrx63sFCYUHfXX5wNaRdjEcUKQ/54
 vQAe4OCC0pXfVUBHQ6f8Q5DTMUlQJhDDxF3Ek9MfF3jtq56pV1TNm6eP0h16eqxXYG
 0FuMDmLzjOeMdYncyof1bhdYzdGnGJLzvp9ZyPUGrD3tgiEzgwaGh/4PrBbgNZBoch
 4dj2iHfkZc3YhyX4qaEcIMuCo9t4qTGX4+9ADvlZbyGEYOZT0KXZNliyDx1MO/Db1f
 ZBh0w1GO1swkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Sep 2025 15:47:55 +0200
Message-Id: <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Cc: "Benno Lossin" <lossin@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
 <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh>
In-Reply-To: <2025092125-urban-muppet-1c2f@gregkh>
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

On Sun Sep 21, 2025 at 2:45 PM CEST, Greg KH wrote:
> Again, regmap handles this all just fine, why not just make bindings to
> that api here instead?

The idea is to use this for the register!() macro, e.g.

	register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about th=
e GPU" {
	    28:24   architecture_0 as u8, "Lower bits of the architecture";
	    23:20   implementation as u8, "Implementation version of the architect=
ure";
	    8:8     architecture_1 as u8, "MSB of the architecture";
	    7:4     major_revision as u8, "Major revision of the chip";
	    3:0     minor_revision as u8, "Minor revision of the chip";
	});

(More examples in [1].)

This generates a structure with the relevant accessors; we can also impleme=
nt
additional logic, such as:

	impl NV_PMC_BOOT_0 {
	    /// Combines `architecture_0` and `architecture_1` to obtain the archi=
tecture of the chip.
	    pub(crate) fn architecture(self) -> Result<Architecture> {
	        Architecture::try_from(
	            self.architecture_0() | (self.architecture_1() << Self::ARCHIT=
ECTURE_0_RANGE.len()),
	        )
	    }
=09
	    /// Combines `architecture` and `implementation` to obtain a code uniq=
ue to the chipset.
	    pub(crate) fn chipset(self) -> Result<Chipset> {
	        self.architecture()
	            .map(|arch| {
	                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
	                    | u32::from(self.implementation())
	            })
	            .and_then(Chipset::try_from)
	    }
	}

This conviniently allows us to read the register with

	let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);

and obtain an instance of the entire Chipset structure with

	let chipset =3D boot0.chipset()?;

or pass it to a constructor that creates a Revision instance

	let rev =3D Revision::from_boot0(boot0);

Analogously it allows us to modify and write registers without having to me=
ss
with error prone shifts, masks and casts, because that code is generated by=
 the
register!() macro. (Of course, unless we have more complicated cases where
multiple fields have to be combined as illustrated above.)

Note that bar is of type pci::Bar<BAR0_SIZE> where BAR0_SIZE in our case is
SZ_16M.

However, the type required by read() as generated by the register!() macro
actually only requires something that implements an I/O backend, i.e
kernel::io::Io<SIZE>.

pci::Bar is a specific implementation of kernel::io::Io.

With this we can let the actual I/O backend handle the endianness of the bu=
s.

(Actually, we could even implement an I/O backend that uses regmap.)

So, I think the register!() stuff is rather orthogonal.

- Danilo

[1] https://gitlab.freedesktop.org/drm/rust/kernel/-/blob/drm-rust-next/dri=
vers/gpu/nova-core/regs.rs
