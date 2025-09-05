Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD58B47808
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7201410E3FD;
	Sat,  6 Sep 2025 22:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="bsxj5Vc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D320A10E02B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 22:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
 s=protonmail3; t=1757111078; x=1757370278;
 bh=i93EW/8ikm2pmoxKM3tODrWihAsKH9ShDBF4UztUg8o=;
 h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=bsxj5Vc4qYCuYztxM3FSUNTnDj0zYwTc635vHh6H3in39lzl1EehiB+BHRgigoJTE
 OCvx+MN4jXAPeuE4JRWYkEBginF/WTOe1g77p3DDcaFd9HSFJln2XzGyPPAfvA5rGQ
 R9vJjTPiZv9XhIrOzz/2wQt7tu3n7xvVoR9UwdSjCdRf070I+xE1debXWQw2hUU6ge
 8uXD/7OCQ07uvwZaBDOgvkcEOC+bvaY/TdnzRPgT+GZejRbqkuyqWKkFnnbyPInwN0
 GVGirG7jQR+csRMMwZvL+7tQQM4puti2k1xMMQDlY50s66u3Il0Dgd7HYGAzCzTzAo
 t+ohpbB8+RFFw==
X-Pm-Submission-Id: 4cJW9b3x9tz2ScCs
Date: Fri, 5 Sep 2025 22:24:32 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
Message-ID: <aLtjILVe4JaDoh1A@archiso>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903215428.1296517-5-joelagnelf@nvidia.com>
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:45:39 +0000
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

On Wed, Sep 03, 2025 at 05:54:28PM -0400, Joel Fernandes wrote:
> Out of broad need for these macros in Rust, move them out. Several folks
> have shown interest (Nova, Tyr GPU drivers).
> 
> bitstruct - defines bitfields in Rust structs similar to C.
> register - support for defining hardware registers and accessors.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs               |  2 +-
>  drivers/gpu/nova-core/falcon/gsp.rs           |  3 +-
>  drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
>  drivers/gpu/nova-core/nova_core.rs            |  3 -
>  drivers/gpu/nova-core/regs.rs                 |  5 +-
>  .../nova-core => rust/kernel}/bitstruct.rs    | 31 ++++---
>  rust/kernel/lib.rs                            |  2 +
>  rust/kernel/prelude.rs                        |  2 +
>  .../regs/macros.rs => rust/kernel/register.rs | 92 ++++++++++---------
>  9 files changed, 74 insertions(+), 68 deletions(-)
>  rename {drivers/gpu/nova-core => rust/kernel}/bitstruct.rs (92%)
>  rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/register.rs (90%)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index be91aac6976a..06da6ce24482 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -7,6 +7,7 @@
>  use kernel::bindings;
>  use kernel::device;
>  use kernel::prelude::*;
> +use kernel::register::RegisterBase;
>  use kernel::sync::aref::ARef;
>  use kernel::time::Delta;
>  
> @@ -14,7 +15,6 @@
>  use crate::driver::Bar0;
>  use crate::gpu::Chipset;
>  use crate::regs;
> -use crate::regs::macros::RegisterBase;
>  use crate::util;
>  
>  pub(crate) mod gsp;
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
> index f17599cb49fa..9287ab148da8 100644
> --- a/drivers/gpu/nova-core/falcon/gsp.rs
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -3,8 +3,9 @@
>  use crate::{
>      driver::Bar0,
>      falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
> -    regs::{self, macros::RegisterBase},
> +    regs,
>  };
> +use kernel::register::RegisterBase;
>  
>  /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
>  pub(crate) struct Gsp(());
> diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
> index 815786c8480d..8f7b63b6c2b2 100644
> --- a/drivers/gpu/nova-core/falcon/sec2.rs
> +++ b/drivers/gpu/nova-core/falcon/sec2.rs
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
> -use crate::regs::macros::RegisterBase;
> +use kernel::register::RegisterBase;
>  
>  /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
>  pub(crate) struct Sec2(());
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index b218a2d42573..cb2bbb30cba1 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,9 +2,6 @@
>  
>  //! Nova Core GPU Driver
>  
> -#[macro_use]
> -mod bitstruct;
> -
>  mod dma;
>  mod driver;
>  mod falcon;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 206dab2e1335..6d2f20623259 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -4,9 +4,6 @@
>  // but are mapped to types.
>  #![allow(non_camel_case_types)]
>  
> -#[macro_use]
> -pub(crate) mod macros;
> -
>  use crate::falcon::{
>      DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
>      FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
> @@ -331,6 +328,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>  
>  pub(crate) mod gm107 {
>      // FUSE
> +    use kernel::prelude::*;
>  
>      register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
>          0:0     display_disabled as bool;
> @@ -339,6 +337,7 @@ pub(crate) mod gm107 {
>  
>  pub(crate) mod ga100 {
>      // FUSE
> +    use kernel::prelude::*;
>  
>      register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
>          0:0     display_disabled as bool;
> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/rust/kernel/bitstruct.rs
> similarity index 92%
> rename from drivers/gpu/nova-core/bitstruct.rs
> rename to rust/kernel/bitstruct.rs
> index 1047c5c17e2d..06e5435df383 100644
> --- a/drivers/gpu/nova-core/bitstruct.rs
> +++ b/rust/kernel/bitstruct.rs
> @@ -1,9 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
> -//
> -// bitstruct.rs — Bitfield library for Rust structures
> -//
> -// A library that provides support for defining bit fields in Rust
> -// structures. Also used from things that need bitfields like register macro.
> +
> +//! Bitfield library for Rust structures
> +//!
> +//! A library that provides support for defining bit fields in Rust
> +//! structures. Also used from things that need bitfields like register macro.
>  ///
>  /// # Syntax
>  ///
> @@ -32,6 +32,7 @@
>  ///   the result.
>  /// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
>  ///   and returns the result. This is useful with fields for which not all values are valid.
> +#[macro_export]
>  macro_rules! bitstruct {
>      // Main entry point - defines the bitfield struct with fields
>      ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> @@ -125,7 +126,7 @@ impl $name {
>      (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
>          #[allow(clippy::eq_op)]
>          const _: () = {
> -            ::kernel::build_assert!(
> +            build_assert!(
>                  $hi == $lo,
>                  concat!("boolean field `", stringify!($field), "` covers more than one bit")
>              );
> @@ -136,7 +137,7 @@ impl $name {
>      (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
>          #[allow(clippy::eq_op)]
>          const _: () = {
> -            ::kernel::build_assert!(
> +            build_assert!(
>                  $hi >= $lo,
>                  concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
>              );
> @@ -198,15 +199,15 @@ impl $name {
>          @leaf_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident
>              { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
>      ) => {
> -        ::kernel::macros::paste!(
> +        $crate::macros::paste!(
>          const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
>          const [<$field:upper _MASK>]: $storage = {
>              // Generate mask for shifting
>              match ::core::mem::size_of::<$storage>() {
> -                1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
> -                2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
> -                4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
> -                8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,
> +                1 => $crate::bits::genmask_u8($lo..=$hi) as $storage,
> +                2 => $crate::bits::genmask_u16($lo..=$hi) as $storage,
> +                4 => $crate::bits::genmask_u32($lo..=$hi) as $storage,
> +                8 => $crate::bits::genmask_u64($lo..=$hi) as $storage,
>                  _ => <$storage>::MAX
>              }
>          };
> @@ -219,7 +220,7 @@ impl $name {
>          )?
>          #[inline(always)]
>          $vis fn $field(self) -> $res_type {
> -            ::kernel::macros::paste!(
> +            $crate::macros::paste!(
>              const MASK: $storage = $name::[<$field:upper _MASK>];
>              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
>              );
> @@ -228,7 +229,7 @@ impl $name {
>              $process(field)
>          }
>  
> -        ::kernel::macros::paste!(
> +        $crate::macros::paste!(
>          $(
>          #[doc="Sets the value of this field:"]
>          #[doc=$comment]
> @@ -267,7 +268,7 @@ fn default() -> Self {
>                  #[allow(unused_mut)]
>                  let mut value = Self(Default::default());
>  
> -                ::kernel::macros::paste!(
> +                $crate::macros::paste!(
>                  $(
>                  value.[<set_ $field>](Default::default());
>                  )*
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index c859a8984bae..9c492fa10967 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -64,6 +64,7 @@
>  #[cfg(CONFIG_AUXILIARY_BUS)]
>  pub mod auxiliary;
>  pub mod bits;
> +pub mod bitstruct;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
>  pub mod bug;
> @@ -112,6 +113,7 @@
>  pub mod prelude;
>  pub mod print;
>  pub mod rbtree;
> +pub mod register;
>  pub mod regulator;
>  pub mod revocable;
>  pub mod security;
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index 25fe97aafd02..a98c7b7ab6af 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -39,6 +39,8 @@
>  
>  pub use super::static_assert;
>  
> +pub use super::{bitstruct, register};
> +
>  pub use super::error::{code::*, Error, Result};
>  
>  pub use super::{str::CStr, ThisModule};
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/rust/kernel/register.rs
> similarity index 90%
> rename from drivers/gpu/nova-core/regs/macros.rs
> rename to rust/kernel/register.rs
> index 22a53a73b765..1f48c5335e70 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/rust/kernel/register.rs
> @@ -16,7 +16,8 @@
>  /// The `T` generic argument is used to distinguish which base to use, in case a type provides
>  /// several bases. It is given to the `register!` macro to restrict the use of the register to
>  /// implementors of this particular variant.
> -pub(crate) trait RegisterBase<T> {
> +pub trait RegisterBase<T> {
> +    /// The base address for the register.
>      const BASE: usize;
>  }
>  
> @@ -281,6 +282,7 @@ pub(crate) trait RegisterBase<T> {
>  /// # Ok(())
>  /// # }
>  /// ```
> +#[macro_export]
>  macro_rules! register {
>      // Creates a register at a fixed offset of the MMIO space.
>      ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
> @@ -378,7 +380,7 @@ impl $name {
>              /// Read the register from its address in `io`.
>              #[inline(always)]
>              pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>              {
>                  Self(io.read32($offset))
>              }
> @@ -386,7 +388,7 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
>              /// Write the value contained in `self` to the register address in `io`.
>              #[inline(always)]
>              pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>              {
>                  io.write32(self.0, $offset)
>              }
> @@ -398,7 +400,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
>                  io: &T,
>                  f: F,
>              ) where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  let reg = f(Self::read(io));
> @@ -421,13 +423,13 @@ pub(crate) fn read<const SIZE: usize, T, B>(
>                  #[allow(unused_variables)]
>                  base: &B,
>              ) -> Self where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>              {
>                  const OFFSET: usize = $name::OFFSET;
>  
>                  let value = io.read32(
> -                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
> +                    <B as $crate::register::RegisterBase<$base>>::BASE + OFFSET
>                  );
>  
>                  Self(value)
> @@ -442,14 +444,14 @@ pub(crate) fn write<const SIZE: usize, T, B>(
>                  #[allow(unused_variables)]
>                  base: &B,
>              ) where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>              {
>                  const OFFSET: usize = $name::OFFSET;
>  
>                  io.write32(
>                      self.0,
> -                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
> +                    <B as $crate::register::RegisterBase<$base>>::BASE + OFFSET
>                  );
>              }
>  
> @@ -462,8 +464,8 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
>                  base: &B,
>                  f: F,
>              ) where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  let reg = f(Self::read(io, base));
> @@ -486,7 +488,7 @@ pub(crate) fn read<const SIZE: usize, T>(
>                  io: &T,
>                  idx: usize,
>              ) -> Self where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>              {
>                  build_assert!(idx < Self::SIZE);
>  
> @@ -503,7 +505,7 @@ pub(crate) fn write<const SIZE: usize, T>(
>                  io: &T,
>                  idx: usize
>              ) where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>              {
>                  build_assert!(idx < Self::SIZE);
>  
> @@ -520,7 +522,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
>                  idx: usize,
>                  f: F,
>              ) where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  let reg = f(Self::read(io, idx));
> @@ -535,13 +537,13 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
>              pub(crate) fn try_read<const SIZE: usize, T>(
>                  io: &T,
>                  idx: usize,
> -            ) -> ::kernel::error::Result<Self> where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +            ) -> $crate::error::Result<Self> where
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>              {
>                  if idx < Self::SIZE {
>                      Ok(Self::read(io, idx))
>                  } else {
> -                    Err(EINVAL)
> +                    Err($crate::error::code::EINVAL)
>                  }
>              }
>  
> @@ -554,13 +556,13 @@ pub(crate) fn try_write<const SIZE: usize, T>(
>                  self,
>                  io: &T,
>                  idx: usize,
> -            ) -> ::kernel::error::Result where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +            ) -> $crate::error::Result where
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>              {
>                  if idx < Self::SIZE {
>                      Ok(self.write(io, idx))
>                  } else {
> -                    Err(EINVAL)
> +                    Err($crate::error::code::EINVAL)
>                  }
>              }
>  
> @@ -574,14 +576,14 @@ pub(crate) fn try_alter<const SIZE: usize, T, F>(
>                  io: &T,
>                  idx: usize,
>                  f: F,
> -            ) -> ::kernel::error::Result where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> +            ) -> $crate::error::Result where
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  if idx < Self::SIZE {
>                      Ok(Self::alter(io, idx, f))
>                  } else {
> -                    Err(EINVAL)
> +                    Err($crate::error::code::EINVAL)
>                  }
>              }
>          }
> @@ -607,12 +609,12 @@ pub(crate) fn read<const SIZE: usize, T, B>(
>                  base: &B,
>                  idx: usize,
>              ) -> Self where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>              {
>                  build_assert!(idx < Self::SIZE);
>  
> -                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
> +                let offset = <B as $crate::register::RegisterBase<$base>>::BASE +
>                      Self::OFFSET + (idx * Self::STRIDE);
>                  let value = io.read32(offset);
>  
> @@ -629,12 +631,12 @@ pub(crate) fn write<const SIZE: usize, T, B>(
>                  base: &B,
>                  idx: usize
>              ) where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>              {
>                  build_assert!(idx < Self::SIZE);
>  
> -                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
> +                let offset = <B as $crate::register::RegisterBase<$base>>::BASE +
>                      Self::OFFSET + (idx * Self::STRIDE);
>  
>                  io.write32(self.0, offset);
> @@ -650,8 +652,8 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
>                  idx: usize,
>                  f: F,
>              ) where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  let reg = f(Self::read(io, base, idx));
> @@ -668,14 +670,14 @@ pub(crate) fn try_read<const SIZE: usize, T, B>(
>                  io: &T,
>                  base: &B,
>                  idx: usize,
> -            ) -> ::kernel::error::Result<Self> where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +            ) -> $crate::error::Result<Self> where
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>              {
>                  if idx < Self::SIZE {
>                      Ok(Self::read(io, base, idx))
>                  } else {
> -                    Err(EINVAL)
> +                    Err($crate::error::code::EINVAL)
>                  }
>              }
>  
> @@ -690,14 +692,14 @@ pub(crate) fn try_write<const SIZE: usize, T, B>(
>                  io: &T,
>                  base: &B,
>                  idx: usize,
> -            ) -> ::kernel::error::Result where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +            ) -> $crate::error::Result where
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>              {
>                  if idx < Self::SIZE {
>                      Ok(self.write(io, base, idx))
>                  } else {
> -                    Err(EINVAL)
> +                    Err($crate::error::code::EINVAL)
>                  }
>              }
>  
> @@ -713,17 +715,19 @@ pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
>                  base: &B,
>                  idx: usize,
>                  f: F,
> -            ) -> ::kernel::error::Result where
> -                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +            ) -> $crate::error::Result where
> +                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
> +                B: $crate::register::RegisterBase<$base>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  if idx < Self::SIZE {
>                      Ok(Self::alter(io, base, idx, f))
>                  } else {
> -                    Err(EINVAL)
> +                    Err($crate::error::code::EINVAL)
>                  }
>              }
>          }
>      };
>  }
> +
> +pub use register;
> -- 
> 2.34.1
> 
> 

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
