Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E4B8DB13
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 14:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCCC10E1A3;
	Sun, 21 Sep 2025 12:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lUCEtW9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C68710E098;
 Sun, 21 Sep 2025 12:34:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A33794495A;
 Sun, 21 Sep 2025 12:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE53AC116D0;
 Sun, 21 Sep 2025 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758458043;
 bh=VxmthJPNENbIGHLIKYatBSWAADCcIL/mFRxggTyg46E=;
 h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
 b=lUCEtW9sAiXF2PpPs9Dae4vbu6pomlNbS76GGz1KR0zz0aTiQpFgPAs0qp1WO792Y
 9EVffICjQQREcHxnxaJ/5E3jscWb/+G2aYMI8j/qfgFAQnRE4c7e8JJKwiorITs0YD
 D22Uxyo36ePCho63HL7mhhDgAtx0mQYlJdCALIuBFNXe/7KuquS0ZZ0Xc2qwskMkhG
 cfwi7WjGK9NMnQ+c+fe6HNfyEJ5cMDzup9muuGXvrtm0spfr/BkGm0Lb/q8E31QNd8
 EVRN75dKr9UQeRzu3LEDaz7yN2UiPTAm7H2FtBQ4desmemMPSrPnitc1AsQGbFRNvg
 olsHlyGyHV4QQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Sep 2025 14:33:56 +0200
Message-Id: <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>,
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
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
In-Reply-To: <2025092157-pauper-snap-aad1@gregkh>
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

On Sun Sep 21, 2025 at 11:36 AM CEST, Greg KH wrote:
> On Sat, Sep 20, 2025 at 02:22:27PM -0400, Joel Fernandes wrote:
>> The bitfield-specific into new macro. This will be used to define
>> structs with bitfields, similar to C language.
>>=20
>> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/bitfield.rs    | 314 +++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>>  drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
>>  3 files changed, 327 insertions(+), 249 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/bitfield.rs
>>=20
>> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/b=
itfield.rs
>> new file mode 100644
>> index 000000000000..ba6b7caa05d9
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/bitfield.rs
>> @@ -0,0 +1,314 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Bitfield library for Rust structures
>> +//!
>> +//! Support for defining bitfields in Rust structures. Also used by the=
 [`register!`] macro.
>> +//!
>> +//! # Syntax
>> +//!
>> +//! ```rust
>> +//! #[derive(Debug, Clone, Copy)]
>> +//! enum Mode {
>> +//!     Low =3D 0,
>> +//!     High =3D 1,
>> +//!     Auto =3D 2,
>> +//! }
>> +//!
>> +//! impl TryFrom<u8> for Mode {
>> +//!     type Error =3D u8;
>> +//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
>> +//!         match value {
>> +//!             0 =3D> Ok(Mode::Low),
>> +//!             1 =3D> Ok(Mode::High),
>> +//!             2 =3D> Ok(Mode::Auto),
>> +//!             _ =3D> Err(value),
>> +//!         }
>> +//!     }
>> +//! }
>> +//!
>> +//! impl From<Mode> for u32 {
>> +//!     fn from(mode: Mode) -> u32 {
>> +//!         mode as u32
>> +//!     }
>> +//! }
>> +//!
>> +//! #[derive(Debug, Clone, Copy)]
>> +//! enum State {
>> +//!     Inactive =3D 0,
>> +//!     Active =3D 1,
>> +//! }
>> +//!
>> +//! impl From<bool> for State {
>> +//!     fn from(value: bool) -> Self {
>> +//!         if value { State::Active } else { State::Inactive }
>> +//!     }
>> +//! }
>> +//!
>> +//! impl From<State> for u32 {
>> +//!     fn from(state: State) -> u32 {
>> +//!         state as u32
>> +//!     }
>> +//! }
>> +//!
>> +//! bitfield! {
>> +//!     struct ControlReg {
>> +//!         3:0       mode        as u8 ?=3D> Mode;
>> +//!         7         state       as bool =3D> State;
>> +//!     }
>> +//! }
>
> As discussed at the conference this week, I do object to this as it
> will allow the same mistakes to happen that we used to do in the kernel
> for a long time before the regmap() api happened, along with GENMASK().

Have you read the following macro arm of the implementation?

    // Generates the accessor methods for a single field.
    (
        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
            { $process:expr } $to_type:ty =3D> $res_type:ty $(, $comment:li=
teral)?;
    ) =3D> {
        ::kernel::macros::paste!(
        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> =3D =
$lo..=3D$hi;
        const [<$field:upper _MASK>]: u32 =3D ((((1 << $hi) - 1) << 1) + 1)=
 - ((1 << $lo) - 1);
        const [<$field:upper _SHIFT>]: u32 =3D Self::[<$field:upper _MASK>]=
.trailing_zeros();
        );
   =20
        $(
        #[doc=3D"Returns the value of this field:"]
        #[doc=3D$comment]
        )?
        #[inline(always)]
        pub(crate) fn $field(self) -> $res_type {
            ::kernel::macros::paste!(
            const MASK: u32 =3D $name::[<$field:upper _MASK>];
            const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
            );
            let field =3D ((self.0 & MASK) >> SHIFT);

Here you can see that it's just a mask + shift operation internally to
access the field.
   =20
            $process(field)
        }
   =20
        ::kernel::macros::paste!(
        $(
        #[doc=3D"Sets the value of this field:"]
        #[doc=3D$comment]
        )?
        #[inline(always)]
        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
            const MASK: u32 =3D $name::[<$field:upper _MASK>];
            const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
            let value =3D (u32::from(value) << SHIFT) & MASK;
            self.0 =3D (self.0 & !MASK) | value;
   =20
            self
        }
        );
    };

Now I too would like to see how exactly this will be used to read data
from hardware. But at least in theory if the conversion from hardware
endianness to native endianness is done correctly, this will do the
right thing :)

> The issue is that you are going to want to take these bitfields as part
> of a larger structure, and attempt to "lay it over" a chunk of memory
> that came from, or is going to, hardware.  When that happens, all of the
> endian issues of mis-matches between hardware and cpus come into play,
> which is not able to be properly expressed here at all, unless you
> attempt to either resolve it all later on in something like the regmap
> api, or you have #ifdef stuff to attempt to capture all of the possible
> combinations and deal with it at build time (which is strongly never
> recommended, but is what we used to do in previous decades.)

The "laying over part" requires a cast or transmute in Rust which is
`unsafe`, so I'd say we will definitely notice it in the code if a user
would be trying to do it.

---
Cheers,
Benno
