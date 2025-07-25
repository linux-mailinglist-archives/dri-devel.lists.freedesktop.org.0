Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F6DB124A3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 21:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356F210E11D;
	Fri, 25 Jul 2025 19:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fP1xgZjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FA810EA09;
 Fri, 25 Jul 2025 19:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753470764; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M9s+XJhLm8l1HdhbjRVscC2FdmfNgDKaHh/9aUu0+wKR0Z1THwsdQzibJnJO0zTLLHgb4lCKOz6tCtxtYAND+LTbgw2O3dFMwDU/HRwg3fyib8wJuxTf0TL4FkOy56vBsAStmkNtp+OEoKyqc3J0kxkqQX5WxxLvQzwfdRrWMnM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753470764;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=m22KG+X/O5hh2kyJ99La7fVjdSugOC1q3OjwAeZLFc4=; 
 b=LzYg18BYPQfniLFxigPFts5wXrFWLKK2jX2Jh67TKqcjJBo/h9qmPFtNEjsMY6CEyTBJNdhcLM+YTa59Iw/d3NfYh7UbELewi0th3d+avvAHoAUUZcRFS0648+747QhlQBPJqa3mQgl3UvuSCs7iRFPgdtE1wuxZZv35ZPQ64Io=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753470764; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=m22KG+X/O5hh2kyJ99La7fVjdSugOC1q3OjwAeZLFc4=;
 b=fP1xgZjI4cbIIYLhnJW30Il2R3tYtjSH/S9iT8J/eI/fyGC3i5UjCtkiFCVWEMUX
 usiT8yYllts3uQbdj7x9800OvEeQ3rzZZwBxFnZOnf3hCwFWnhgMRa93fGXU0qusXyQ
 FkUwJSzOb6ceSlnzQEmbqniJv0w4Lx0exbvFHqHI=
Received: by mx.zohomail.com with SMTPS id 1753470761484508.6718281688985;
 Fri, 25 Jul 2025 12:12:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 17/19] gpu: nova-core: register: add support for
 register arrays
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-17-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 16:12:27 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0DDB132-68E8-43D0-B7EB-AA607C9BB72F@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-17-7b6a762aa1cd@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
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

Hi Alex,

> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Having registers that can be interpreted identically in a contiguous =
I/O
> area (or at least, following a given stride) is a common way to =
organize
> registers, and is used by NVIDIA hardware. Thus, add a way to simply =
and
> safely declare such a layout using the register!() macro.
>=20
> Build-time bound-checking is effective for array accesses performed =
with
> a constant. For cases where the index cannot be known at compile time,
> `try_` variants of the accessors are also made available that return
> `EINVAL` if the access is out-of-bounds.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/gpu.rs         |   2 +-
> drivers/gpu/nova-core/regs.rs        |  15 +--
> drivers/gpu/nova-core/regs/macros.rs | 195 =
+++++++++++++++++++++++++++++++++++
> 3 files changed, 204 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gpu.rs =
b/drivers/gpu/nova-core/gpu.rs
> index =
72d40b0124f0c1a2a381484172c289af523511df..325484ecdaf03d4dcdc4ac2aecc10ca7=
63f442db 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -221,7 +221,7 @@ fn run_fwsec_frts(
>         fwsec_frts.run(dev, falcon, bar)?;
>=20
>         // SCRATCH_E contains the error code for FWSEC-FRTS.
> -        let frts_status =3D =
regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
> +        let frts_status =3D =
regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
>         if frts_status !=3D 0 {
>             dev_err!(
>                 dev,
> diff --git a/drivers/gpu/nova-core/regs.rs =
b/drivers/gpu/nova-core/regs.rs
> index =
35d796b744e933ad70245b50e6eff861b429c519..0c857842b31f9ca5d842ee5b1e5841de=
480d1f1f 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -44,8 +44,10 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>=20
> // PBUS
>=20
> -// TODO[REGA]: this is an array of registers.
> -register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
> +register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
> +
> +register!(NV_PBUS_SW_SCRATCH_0E_FRTS_ERR =3D> =
NV_PBUS_SW_SCRATCH[0xe],
> +    "scratch register 0xe used as FRTS firmware error code" {
>     31:16   frts_err_code as u16;
> });
>=20
> @@ -123,13 +125,12 @@ pub(crate) fn higher_bound(self) -> u64 {
>     0:0     read_protection_level0 as bool, "Set after FWSEC lowers =
its protection level";
> });
>=20
> -// TODO[REGA]: This is an array of registers.
> -register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
> -    31:0    value as u32;
> -});
> +// OpenRM defines this as a register array, but doesn't specify its =
size and only uses its first
> +// element. Be conservative until we know the actual size or need to =
use more registers.
> +register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234[1] {});
>=20
> register!(
> -    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT =3D> =
NV_PGC6_AON_SECURE_SCRATCH_GROUP_05,
> +    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT =3D> =
NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0],
>     "Scratch group 05 register 0 used as GFW boot progress indicator" =
{
>         7:0    progress as u8, "Progress of GFW boot (0xff means =
completed)";
>     }
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
3465fb302ce921ca995ecbb71b83efe1c9a62a1d..0b5ccc50967b1deb02cf927142d5f422=
141e780d 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -162,6 +162,57 @@ pub(crate) trait RegisterBase<T> {
> /// // Start the aliased `CPU0`.
> /// CPU_CTL_ALIAS::alter(bar, &CPU0, |r| r.set_alias_start(true));
> /// ```
> +///
> +/// ## Arrays of registers
> +///
> +/// Some I/O areas contain consecutive values that can be interpreted =
in the same way. These areas
> +/// can be defined as an array of identical registers, allowing them =
to be accessed by index with
> +/// compile-time or runtime bound checking. Simply define their =
address as `Address[Size]`, and add
> +/// an `idx` parameter to their `read`, `write` and `alter` methods:
> +///
> +/// ```no_run
> +/// # fn no_run() -> Result<(), Error> {
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +/// // Array of 64 consecutive registers with the same layout =
starting at offset `0x80`.
> +/// register!(SCRATCH @ 0x00000080[64], "Scratch registers" {
> +///     31:0    value as u32;
> +/// });
> +///
> +/// // Read scratch register 0, i.e. I/O address `0x80`.
> +/// let scratch_0 =3D SCRATCH::read(bar, 0).value();
> +/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
> +/// let scratch_15 =3D SCRATCH::read(bar, 15).value();

Ahhhhh, maybe this is what I have been looking for all along.

Alright, this is great! :)

> +///
> +/// // This is out of bounds and won't build.
> +/// // let scratch_128 =3D SCRATCH::read(bar, 128).value();
> +///
> +/// // Runtime-obtained array index.
> +/// let scratch_idx =3D get_scratch_idx();
> +/// // Access on a runtime index returns an error if it is =
out-of-bounds.
> +/// let some_scratch =3D SCRATCH::try_read(bar, =
scratch_idx)?.value();

Awesome.

> +///
> +/// // Alias to a particular register in an array.
> +/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
> +/// register!(FIRMWARE_STATUS =3D> SCRATCH[8], "Firmware exit status =
code" {
> +///     7:0     status as u8;
> +/// });
> +///
> +/// let status =3D FIRMWARE_STATUS::read(bar).status();
> +///
> +/// // Non-contiguous register arrays can be defined by adding a =
stride parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 =
bytes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register!(SCRATCH_INTERLEAVED_0 @ 0x000000c0[16 ; 8], "Scratch =
registers bank 0" {
> +///     31:0    value as u32;
> +/// });
> +/// register!(SCRATCH_INTERLEAVED_1 @ 0x000000c4[16 ; 8], "Scratch =
registers bank 1" {
> +///     31:0    value as u32;
> +/// });
> +/// # Ok(())
> +/// # }
> +/// ```
> macro_rules! register {
>     // Creates a register at a fixed offset of the MMIO space.
>     ($name:ident @ $offset:literal $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
> @@ -187,6 +238,35 @@ macro_rules! register {
>         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
>     };
>=20
> +    // Creates an array of registers at a fixed offset of the MMIO =
space.
> +    (
> +        $name:ident @ $offset:literal [ $size:expr ; $stride:expr ] =
$(, $comment:literal)? {
> +            $($fields:tt)*
> +        }
> +    ) =3D> {
> +        static_assert!(::core::mem::size_of::<u32>() <=3D $stride);

Perhaps a TODO here would be nice, since you=E2=80=99ll want to change =
it when/if
this macros get to support non-u32 types (which is apparently on the =
roadmap
IIUC).

> +        register!(@core $name $(, $comment)? { $($fields)* } );
> +        register!(@io_array $name @ $offset [ $size ; $stride ]);
> +    };
> +
> +    // Shortcut for contiguous array of registers (stride =3D=3D size =
of element).
> +    (
> +        $name:ident @ $offset:literal [ $size:expr ] $(, =
$comment:literal)? {
> +            $($fields:tt)*
> +        }
> +    ) =3D> {
> +        register!($name @ $offset [ $size ; =
::core::mem::size_of::<u32>() ] $(, $comment)? {

Same here.

> +            $($fields)*
> +        } );
> +    };
> +
> +    // Creates an alias of register `idx` of array of registers =
`alias` with its own fields.
> +    ($name:ident =3D> $alias:ident [ $idx:expr ] $(, =
$comment:literal)? { $($fields:tt)* }) =3D> {
> +        static_assert!($idx < $alias::SIZE);
> +        register!(@core $name $(, $comment)? { $($fields)* } );
> +        register!(@io_fixed $name @ $alias::OFFSET + $idx * =
$alias::STRIDE );

Why is this @io_fixed?

> +    };
> +
>     // All rules below are helpers.
>=20
>     // Defines the wrapper `$name` type, as well as its relevant =
implementations (`Debug`,
> @@ -520,4 +600,119 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
>             }
>         }
>     };
> +
> +    // Generates the IO accessors for an array of registers.
> +    (@io_array $name:ident @ $offset:literal [ $size:expr ; =
$stride:expr ]) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            pub(crate) const OFFSET: usize =3D $offset;
> +            pub(crate) const SIZE: usize =3D $size;
> +            pub(crate) const STRIDE: usize =3D $stride;
> +
> +            /// Read the array register at index `idx` from its =
address in `io`.
> +            #[inline(always)]
> +            pub(crate) fn read<const SIZE: usize, T>(
> +                io: &T,
> +                idx: usize,
> +            ) -> Self where
> +                T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
> +                let value =3D io.read32(offset);
> +
> +                Self(value)
> +            }
> +
> +            /// Write the value contained in `self` to the array =
register with index `idx` in `io`.
> +            #[inline(always)]
> +            pub(crate) fn write<const SIZE: usize, T>(
> +                self,
> +                io: &T,
> +                idx: usize
> +            ) where
> +                T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
> +
> +                io.write32(self.0, offset);
> +            }
> +
> +            /// Read the array register at index `idx` in `io` and =
run `f` on its value to obtain a
> +            /// new value to write back.
> +            #[inline(always)]
> +            pub(crate) fn alter<const SIZE: usize, T, F>(
> +                io: &T,
> +                idx: usize,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io, idx));
> +                reg.write(io, idx);
> +            }
> +
> +            /// Read the array register at index `idx` from its =
address in `io`.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned is the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub(crate) fn try_read<const SIZE: usize, T>(
> +                io: &T,
> +                idx: usize,
> +            ) -> ::kernel::error::Result<Self> where
> +                T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::read(io, idx))
> +                } else {
> +                    Err(EINVAL)
> +                }
> +            }
> +
> +            /// Write the value contained in `self` to the array =
register with index `idx` in `io`.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned is the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub(crate) fn try_write<const SIZE: usize, T>(
> +                self,
> +                io: &T,
> +                idx: usize,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(self.write(io, idx))
> +                } else {
> +                    Err(EINVAL)
> +                }
> +            }
> +
> +            /// Read the array register at index `idx` in `io` and =
run `f` on its value to obtain a
> +            /// new value to write back.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned is the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub(crate) fn try_alter<const SIZE: usize, T, F>(
> +                io: &T,
> +                idx: usize,
> +                f: F,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D =
::kernel::io::Io<SIZE>>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::alter(io, idx, f))
> +                } else {
> +                    Err(EINVAL)
> +                }
> +            }
> +        }
> +    };
> }
>=20
> --=20
> 2.50.1
>=20

Assuming that the @io_fixed stuff is correct:

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

=E2=80=94 Daniel

