Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A8B9AC5E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7E810E245;
	Wed, 24 Sep 2025 15:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tZoCn+M1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFF710E245;
 Wed, 24 Sep 2025 15:53:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A084160097;
 Wed, 24 Sep 2025 15:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480A0C4CEE7;
 Wed, 24 Sep 2025 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758729227;
 bh=H0LzwzgZoZdJZXsbobQBWIXxDAEPRUzEukhvOfTHsTU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=tZoCn+M1nDTPC4DtPmwe/lKdjF8Woieav5sRVNGyZTM2JrGjxVqN618SrmB4JTl49
 g99lo+52UHv9MnBSgQB+bDJgIaZ+KYGvV6SWJe/HaEaow514yxY76/DN8mFlHNiw04
 hukCM2xZ89278hrbRZn1Bbc8RpYazFxqS3KoDH6/uvVjrov9I7WatFowRR/tkrqQq8
 yDZ/yF8I6GYjSRdMzZFuzTIwBczC4wqE6C74NrOpSa/mKRrlVOyIQA474nDlmrvFZz
 bS5mD9rzTO01BqdDsa61m3zUluT2CK5QI9E15j51yu+bWkY0qmLvhG4yC+FtMto05T
 gy9kfKmahym5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Sep 2025 17:53:40 +0200
Message-Id: <DD15H63RK1KJ.1J584C1QC4L28@kernel.org>
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Cc: "Greg KH" <gregkh@linuxfoundation.org>, "Benno Lossin"
 <lossin@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
To: "Yury Norov" <yury.norov@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
 <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh>
 <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
 <2025092432-entrust-citizen-0232@gregkh> <aNQCVslEIHHSm8f5@yury>
In-Reply-To: <aNQCVslEIHHSm8f5@yury>
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

On Wed Sep 24, 2025 at 4:38 PM CEST, Yury Norov wrote:
> I didn't ask explicitly, and maybe it's a good time to ask now: Joel,
> Danilo and everyone, have you considered adopting this project in
> kernel?
>
> The bitfield_struct builds everything into the structure:
>
>         use bitfield_struct::bitfield;
>        =20
>         #[bitfield(u8, order =3D Msb)]
>         struct MyMsbByte {
>             /// The first field occupies the *most* significant bits
>             #[bits(4)]
>             kind: usize,
>             system: bool,
>             #[bits(2)]
>             level: usize,
>             present: bool
>         }
>         let my_byte_msb =3D MyMsbByte::new()
>             .with_kind(10)
>             .with_system(false)
>             .with_level(2)
>             .with_present(true);
>        =20
>         //                          .- kind
>         //                          |    .- system
>         //                          |    | .- level
>         //                          |    | |  .- present
>         assert_eq!(my_byte_msb.0, 0b1010_0_10_1);
>
> Here MSB is not BE. For BE you'd specify:
>
>         #[bitfield(u16, repr =3D be16, from =3D be16::from_ne, into =3D b=
e16::to_ne)]
>         struct MyBeBitfield {
>             #[bits(4)]
>             first_nibble: u8,
>             #[bits(12)]
>             other: u16,
>         }
>
> The "from =3D be16::from_ne",  is seemingly the same as cpu_to_be32() her=
e.
>
> It looks like bitfield_struct tries to resolve hw access problems
> by outsourcing them to 'from' and 'to' callbacks, and that looks
> similar to what regmap API does (is that correct?).
>
> Greg, Is that what you're asking about?
>
> This is another bitfield crate with the similar approach=20
>
> https://crates.io/crates/bitfield
>
> So we're not the first, and we need to discuss what is already done.
>
> As far as I understand, Joel decided to go in the other direction:
> bitfields are always native in terms of endianess and not designed to
> be mapped on registers directly. Which means they don't specify order
> of accesses, number of accesses, access timing, atomicity, alignment,
> cacheability and whatever else I/O related.
>
> I discussed with Joel about the hw register access and he confirmed
> that the idea of his bitfields is to be a simple wrapper around logical
> ops, while the I/O is a matter of 'backbone', which is entirely different
> thing:

When I was working on initial Rust driver support about a year ago, I also
thought about how Rust drivers can deal with registers and added the TODO i=
n
[1]. This was picked up by Alex, who came up with a great implementation fo=
r the
register!() macro, which Joel splitted up into separate register!() and bit=
field
parts in the context of moving it from a nova internal implementation into =
a
core kernel API.

As also described in [2], the idea is to have a macro, register!(), that cr=
eates
an abstract representation of a register, in order to remove the need for
drivers to manually construct values through shift operations, masks, etc.

At the same time the idea also is to get proper documentation of the hardwa=
re
registers in the kernel; the register!() macro encourages that, by its
definition trying to come close to how registers are typically documented i=
n
datasheets, i.e. get rid of thousands of lines of auto-generated #defines f=
or
base addresses, shift and masks with cryptic names and provide something li=
ke

	register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about th=
e GPU" {
	    28:24   architecture_0 as u8, "Lower bits of the architecture";
	    23:20   implementation as u8, "Implementation version of the architect=
ure";
	    8:8     architecture_1 as u8, "MSB of the architecture";
	    7:4     major_revision as u8, "Major revision of the chip";
	    3:0     minor_revision as u8, "Minor revision of the chip";
	});

instead.

(It has quite some more features that also allow you to directly derive com=
plex
types from primitives and define arrays of registers, such as in

	register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
	    1:0     target as u8 ?=3D> FalconFbifTarget;
	    2:2     mem_type as bool =3D> FalconFbifMemType;
	});

which makes dealing with such registers in drivers way less error prone.

Here's one example of how it looks like to alter a single field within a
register:

	// `bar` is the `pci::Bar` I/O backend.
	regs::NV_PFALCON_FALCON_ENGINE::alter(bar, |v| v.set_reset(true));

Of course you could also alter multiple fields at once by doing more change=
s
within the closure.)

It intentionally avoids encoding hardware bus specific endianness, because
otherwise we'd need to define this for every single register definition, wh=
ich
also falls apart when the device can sit on top of multiple different busse=
s.

Instead, the only thing that matters is that there is a contract between th=
e
abstract register representation and the I/O backends, such that the data c=
an be
correctly layed out by the I/O backend, which has to be aware of the actual
hardware bus instead.

As mentioned in another thread, one option for that is to use regmap within=
 the
I/O backends, but that still needs to be addressed.

So, for the register!() macro, I think we should keep it an abstract
representation and deal with endianness in the I/O backend.

However, that's or course orthogonal to the actual feature set of the bitfi=
eld
macro itself.

- Danilo

[1] https://docs.kernel.org/gpu/nova/core/todo.html#generic-register-abstra=
ction-rega
[2] https://lore.kernel.org/lkml/DD0ZTZM8S84H.1YDWSY7DF14LM@kernel.org/
