Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACABC8B9B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189B710E10B;
	Thu,  9 Oct 2025 11:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FHiXdRUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E75010E10B;
 Thu,  9 Oct 2025 11:16:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4CD862285;
 Thu,  9 Oct 2025 11:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B916C4CEE7;
 Thu,  9 Oct 2025 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760008606;
 bh=NvnFH5fFMQlfkVMuPWti/OYzM0/+PyGHmbs5QNfgrNI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=FHiXdRUB//Rz1OI/dzkHif7nW0zmpkYr0fQ8K87690DYj2qDidMcGlWTajyGVus5n
 53NHp8MmzaP51UjX0UKF4GBs8O4vCb3IT1pp/9jYFmHfeiHHcEv14Vk9SCB4D00QqE
 FHEhyFcvBOdhzjN5gOdLEyElZ9gZCcLCefEXhX2GpUPq/iceSKw/LWrkXsYhuF/bzp
 OIXFpXITbZ/1bcr+ZOEXIdPE5w8hyRx9LMDWCxMaRi9L+QWvAY0swMHtuZ/r4tH+Bh
 /REu+bue1A5QNeyg/MV2+MJCBdDqL6R4nhqLqLdT4GsKpXpYfZe/NEM/Z0b/Da14r5
 1MXW8zJk7JOlg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 13:16:39 +0200
Message-Id: <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
In-Reply-To: <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
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

On Thu Oct 9, 2025 at 8:59 AM CEST, Dirk Behme wrote:
> Assuming that register.rs is supposed to become the "generic" way to=20
> access hardware registers I started to have a look to it. Some weeks=20
> back testing interrupts I used some quite simple timer with 4 registers=
=20
> [1]. Now, thinking about converting it to register!() I have three=20
> understanding / usage questions:
>
> * At the moment register!() is for 32-bit registers, only? So it can't=20
> be used for my example having 8-bit and 16-bit registers as well?

Yes, currently the register!() macro always generates a 32-bit register typ=
e
(mainly because nova-core did not need anything else). However, this will o=
f
course be generalized (which should be pretty straight forward).

Having a brief look at the TMU datasheet it looks like you should be able t=
o
treat TSTR and TCR as 32-bit registers without any issues for testing the
register!() macro today. I.e. you can just define it as:

	register!(TSTR @ 0x04, "Timer Start Register" {
	    2:2    str2 as bool, "Specifies whether TCNT2 is operated or stopped."=
;
	    1:1    str1 as bool, "Specifies whether TCNT1 is operated or stopped."=
;
	    0:0    str0 as bool, "Specifies whether TCNT0 is operated or stopped."=
;
	});

Same for TCR.

> * In my example I used io.try_write*() and io.try_read*() for the=20
> register access. What is the relationship between these and the=20
> register!() accessors (e.g. from the examples BOOT_0::read(&bar);)? Will=
=20
> both stay? When to use which?

The try_*() variants should only be used of the offset of the register is n=
ot
known at compile time.

If it is known at compile time (such as in your case) you should use the
infallible variants that perform a range check at compile time.

For this to work you need to specify the minimum MMIO range your driver exp=
ects,
i.e. instead of

	let iomem =3D Arc::pin_init(request.iomap()?, GFP_KERNEL)?;

you call

	let iomem =3D Arc::pin_init(request.iomap_sized::<TMU_MMIO_SIZE>()?, GFP_K=
ERNEL)?;

where TMU_MMIO_SIZE is the minimum MMIO region size your driver is able to
operate on. In your case this would be 0x12, given that TCR has a width of
16-bit. However, if you treat it as 32-bit register it would be 0x14.

Even without the register!() macro this would be a huge improvement. For
instance, your IRQ handler from [1] can do

	let tcr =3D io.read16_relaxed(TCR);
	if tcr & (0x1 << 8) !=3D 0 {
	    io.write16_relaxed(tcr & !(0x1 << 8), TCR);
	}

instead of

	let tcr =3D io.try_read16_relaxed(TCR).unwrap_or(0);
	if tcr & (0x1 << 8) !=3D 0 {
	    io.try_write16_relaxed(tcr & !(0x1 << 8), TCR).unwrap_or(());
	}

And with the register macro it becomes

	let tcr =3D TCR::read(io);
	if tcr.underflow() {
		tcr.set_underflow(false);
		tcr.write(io);
	}

Note that you can also extend the generated TCR type accordingly, for insta=
nce:

	impl TCR {
	    fn handle_underflow<const SIZE: usize, T>(io: &T)
	    where
	        T: Deref<Target =3D Io<SIZE>>,
	    {
	        let this =3D Self::read(io);
	        if this.underflow() {
	            this.set_underflow(false);
	            this.write(io);
	        }
	    }
	}

and then from your IRQ handler you can just call

	TCR::handle_underflow();

> Note: Due to the file move obviously not the full content of the "new"=20
> file register.rs is shown in this patch. Therefore, let me try it this=20
> way, citing from register.rs:
>
> -- cut --
> ...
> /// This defines a `BOOT_0` type which can be read or written from=20
> offset `0x100` of an `Io`
> /// region
> ....
> /// ```ignore
> /// // Read from the register's defined offset (0x100).
> /// let boot0 =3D BOOT_0::read(&bar);
> -- cut --
>
> * What is "&bar" in this example? Is it the `Io` region the explanation=
=20
> talks about?

Yes, it's the I/O backend (a pci::Bar in this case). However, we should pro=
bably
use a more generic name in the examples.

> [1]=20
> https://lore.kernel.org/rust-for-linux/dd34e5f4-5027-4096-9f32-129c8a067d=
0a@de.bosch.com/
>
> The registers:
>
> const TSTR: usize =3D  0x4; //  8 Bit register
> const TCOR: usize =3D  0x8; // 32 Bit register
> const TCNT: usize =3D  0xC; // 32 Bit register
> const TCR:  usize =3D 0x10; // 16 Bit register
