Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA8BFDE51
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 20:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D513D10E831;
	Wed, 22 Oct 2025 18:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75ACF10E831;
 Wed, 22 Oct 2025 18:41:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AF611655;
 Wed, 22 Oct 2025 11:41:03 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 401E13F66E;
 Wed, 22 Oct 2025 11:41:04 -0700 (PDT)
Date: Wed, 22 Oct 2025 20:40:55 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
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
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
Message-ID: <aPklNydcTdOeXtdU@arm.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003154748.1687160-5-joelagnelf@nvidia.com>
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

Hi Joel,

I know I'm chiming in a bit late, so apologies for that.

The register! macro does seem to be a solid foundation for MMIO register
definitions, thought there are few points that could be potentially
[re]considered.

The current design assumes a fixed, compile-time-known MMIO region size.
It does not cover cases when the region size is known only at runtime.
I do appreciate that in cases like that, we are loosing all the deliberate
compile-time checks but it might be necessary to provide support for those as
well (at some point at least).

On the (potential) improvement side:

Allowing offsets to be expressions rather than literals would make the macro
easier to use for regions defined at a fixed base offset, where subsequent
offsets are derived from that base, i.e:

REG_1_BASE 	-> 0x100
REG_1_STATUS 	-> REG_1_BASE + 0x0
REG_1_CONTROL	-> REG_1_BASE + 0x04
...

The alias mechanism is a nice touch. It might be worth allowing arrays of
registers with explicit aliases to be defined in a single macro invocation,
instead of repeating similar definitions, smth along the lines of:

  register!(
      REG_STATUS @ 0x300[8; STRIDE] {
          0:0 enabled as bool;
          3:1 mode as u8;
          7:4 flags as u8;
      }
      aliases {
          REG_STATUS_ENABLED[0] {
              0:0 enabled as bool;
          }
          REG_STATUS_MODE[0] {
              3:1 mode as u8;
          }
          REG_STATUS_FLAGS[4] {
              7:4 flags as u8;
          }
      }
  );


Finally, for runtime values such as indexes, it could be useful to verify once
and then allow infallible reads/writes through some kind access token.
That might make runtime-safe access patterns simpler and more efficient.
I'm still pondering on how that could look like though (implementation-wise)

---
BR
Beata

On Fri, Oct 03, 2025 at 11:47:47AM -0400, Joel Fernandes wrote:
> Out of broad need for the register and bitfield macros in Rust, move
> them out of nova into the kernel crate. Several usecases need them (Nova
> is already using these and Tyr developers said they need them).
> 
> bitfield moved into kernel crate - defines bitfields in Rust.
> register moved into io module - defines hardware registers and accessors.
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs               |  2 +-
>  drivers/gpu/nova-core/falcon/gsp.rs           |  4 +-
>  drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
>  drivers/gpu/nova-core/nova_core.rs            |  3 -
>  drivers/gpu/nova-core/regs.rs                 |  6 +-
>  .../gpu/nova-core => rust/kernel}/bitfield.rs | 27 ++++-----
>  rust/kernel/io.rs                             |  1 +
>  .../macros.rs => rust/kernel/io/register.rs   | 58 ++++++++++---------
>  rust/kernel/lib.rs                            |  1 +
>  9 files changed, 54 insertions(+), 50 deletions(-)
>  rename {drivers/gpu/nova-core => rust/kernel}/bitfield.rs (91%)
>  rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (93%)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 37e6298195e4..a15fa98c8614 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -6,6 +6,7 @@
>  use hal::FalconHal;
>  use kernel::device;
>  use kernel::dma::DmaAddress;
> +use kernel::io::register::RegisterBase;
>  use kernel::prelude::*;
>  use kernel::sync::aref::ARef;
>  use kernel::time::Delta;
> @@ -14,7 +15,6 @@
>  use crate::driver::Bar0;
>  use crate::gpu::Chipset;
>  use crate::regs;
> -use crate::regs::macros::RegisterBase;
>  use crate::util;
>  
>  pub(crate) mod gsp;
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
> index f17599cb49fa..cd4960e997c8 100644
> --- a/drivers/gpu/nova-core/falcon/gsp.rs
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -1,9 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +use kernel::io::register::RegisterBase;
> +
>  use crate::{
>      driver::Bar0,
>      falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
> -    regs::{self, macros::RegisterBase},
> +    regs::self,
>  };
>  
>  /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
> diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
> index 815786c8480d..81717868a8a8 100644
> --- a/drivers/gpu/nova-core/falcon/sec2.rs
> +++ b/drivers/gpu/nova-core/falcon/sec2.rs
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
> -use crate::regs::macros::RegisterBase;
> +use kernel::io::register::RegisterBase;
>  
>  /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
>  pub(crate) struct Sec2(());
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 112277c7921e..fffcaee2249f 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,9 +2,6 @@
>  
>  //! Nova Core GPU Driver
>  
> -#[macro_use]
> -mod bitfield;
> -
>  mod dma;
>  mod driver;
>  mod falcon;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 206dab2e1335..1f08e6d4045a 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -4,15 +4,13 @@
>  // but are mapped to types.
>  #![allow(non_camel_case_types)]
>  
> -#[macro_use]
> -pub(crate) mod macros;
> -
>  use crate::falcon::{
>      DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
>      FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
>  };
>  use crate::gpu::{Architecture, Chipset};
>  use kernel::prelude::*;
> +use kernel::register;
>  
>  // PMC
>  
> @@ -331,6 +329,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>  
>  pub(crate) mod gm107 {
>      // FUSE
> +    use kernel::register;
>  
>      register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
>          0:0     display_disabled as bool;
> @@ -339,6 +338,7 @@ pub(crate) mod gm107 {
>  
>  pub(crate) mod ga100 {
>      // FUSE
> +    use kernel::register;
>  
>      register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
>          0:0     display_disabled as bool;
> diff --git a/drivers/gpu/nova-core/bitfield.rs b/rust/kernel/bitfield.rs
> similarity index 91%
> rename from drivers/gpu/nova-core/bitfield.rs
> rename to rust/kernel/bitfield.rs
> index cbedbb0078f6..09cd5741598c 100644
> --- a/drivers/gpu/nova-core/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -9,7 +9,7 @@
>  /// # Syntax
>  ///
>  /// ```rust
> -/// use nova_core::bitfield;
> +/// use kernel::bitfield;
>  ///
>  /// #[derive(Debug, Clone, Copy, Default)]
>  /// enum Mode {
> @@ -82,10 +82,11 @@
>  ///   the result.
>  /// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
>  ///   and returns the result. This is useful with fields for which not all values are valid.
> +#[macro_export]
>  macro_rules! bitfield {
>      // Main entry point - defines the bitfield struct with fields
>      ($vis:vis struct $name:ident($storage:ty) $(, $comment:literal)? { $($fields:tt)* }) => {
> -        bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
> +        ::kernel::bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
>      };
>  
>      // All rules below are helpers.
> @@ -114,7 +115,7 @@ fn from(val: $name) -> $storage {
>              }
>          }
>  
> -        bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
> +        ::kernel::bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
>      };
>  
>      // Captures the fields and passes them to all the implementers that require field information.
> @@ -130,7 +131,7 @@ fn from(val: $name) -> $storage {
>          )*
>      }
>      ) => {
> -        bitfield!(@field_accessors $vis $name $storage {
> +        ::kernel::bitfield!(@field_accessors $vis $name $storage {
>              $(
>                  $hi:$lo $field as $type
>                  $(?=> $try_into_type)?
> @@ -139,8 +140,8 @@ fn from(val: $name) -> $storage {
>              ;
>              )*
>          });
> -        bitfield!(@debug $name { $($field;)* });
> -        bitfield!(@default $name { $($field;)* });
> +        ::kernel::bitfield!(@debug $name { $($field;)* });
> +        ::kernel::bitfield!(@default $name { $($field;)* });
>      };
>  
>      // Defines all the field getter/setter methods for `$name`.
> @@ -155,13 +156,13 @@ fn from(val: $name) -> $storage {
>          }
>      ) => {
>          $(
> -            bitfield!(@check_field_bounds $hi:$lo $field as $type);
> +            ::kernel::bitfield!(@check_field_bounds $hi:$lo $field as $type);
>          )*
>  
>          #[allow(dead_code)]
>          impl $name {
>              $(
> -            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
> +            ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
>                  $(?=> $try_into_type)?
>                  $(=> $into_type)?
>                  $(, $comment)?
> @@ -198,7 +199,7 @@ impl $name {
>          @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
>              $(, $comment:literal)?;
>      ) => {
> -        bitfield!(
> +        ::kernel::bitfield!(
>              @leaf_accessor $vis $name $storage, $hi:$lo $field
>              { |f| <$into_type>::from(if f != 0 { true } else { false }) }
>              $into_type => $into_type $(, $comment)?;
> @@ -209,7 +210,7 @@ impl $name {
>      (
>          @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
>      ) => {
> -        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
> +        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
>      };
>  
>      // Catches the `?=>` syntax for non-boolean fields.
> @@ -217,7 +218,7 @@ impl $name {
>          @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
>              $(, $comment:literal)?;
>      ) => {
> -        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
> +        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
>              { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
>              ::core::result::Result<
>                  $try_into_type,
> @@ -231,7 +232,7 @@ impl $name {
>          @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
>              $(, $comment:literal)?;
>      ) => {
> -        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
> +        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
>              { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
>      };
>  
> @@ -240,7 +241,7 @@ impl $name {
>          @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
>              $(, $comment:literal)?;
>      ) => {
> -        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
> +        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
>      };
>  
>      // Generates the accessor methods for a single field.
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 03b467722b86..a79b603604b1 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -8,6 +8,7 @@
>  use crate::{bindings, build_assert, ffi::c_void};
>  
>  pub mod mem;
> +pub mod register;
>  pub mod resource;
>  
>  pub use resource::Resource;
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/rust/kernel/io/register.rs
> similarity index 93%
> rename from drivers/gpu/nova-core/regs/macros.rs
> rename to rust/kernel/io/register.rs
> index c0a5194e8d97..c24d956f122f 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/rust/kernel/io/register.rs
> @@ -17,7 +17,8 @@
>  /// The `T` generic argument is used to distinguish which base to use, in case a type provides
>  /// several bases. It is given to the `register!` macro to restrict the use of the register to
>  /// implementors of this particular variant.
> -pub(crate) trait RegisterBase<T> {
> +pub trait RegisterBase<T> {
> +    /// The base address for the register.
>      const BASE: usize;
>  }
>  
> @@ -26,7 +27,7 @@ pub(crate) trait RegisterBase<T> {
>  ///
>  /// Example:
>  ///
> -/// ```no_run
> +/// ```ignore
>  /// register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
>  ///    3:0     minor_revision as u8, "Minor revision of the chip";
>  ///    7:4     major_revision as u8, "Major revision of the chip";
> @@ -39,7 +40,7 @@ pub(crate) trait RegisterBase<T> {
>  /// significant bits of the register. Each field can be accessed and modified using accessor
>  /// methods:
>  ///
> -/// ```no_run
> +/// ```ignore
>  /// // Read from the register's defined offset (0x100).
>  /// let boot0 = BOOT_0::read(&bar);
>  /// pr_info!("chip revision: {}.{}", boot0.major_revision(), boot0.minor_revision());
> @@ -61,7 +62,7 @@ pub(crate) trait RegisterBase<T> {
>  /// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
>  /// for cases where a register's interpretation depends on the context:
>  ///
> -/// ```no_run
> +/// ```ignore
>  /// register!(SCRATCH @ 0x00000200, "Scratch register" {
>  ///    31:0     value as u32, "Raw value";
>  /// });
> @@ -111,7 +112,7 @@ pub(crate) trait RegisterBase<T> {
>  /// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
>  /// into code:
>  ///
> -/// ```no_run
> +/// ```ignore
>  /// // Type used to identify the base.
>  /// pub(crate) struct CpuCtlBase;
>  ///
> @@ -162,7 +163,7 @@ pub(crate) trait RegisterBase<T> {
>  /// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
>  /// an `idx` parameter to their `read`, `write` and `alter` methods:
>  ///
> -/// ```no_run
> +/// ```ignore
>  /// # fn no_run() -> Result<(), Error> {
>  /// # fn get_scratch_idx() -> usize {
>  /// #   0x15
> @@ -211,7 +212,7 @@ pub(crate) trait RegisterBase<T> {
>  /// Combining the two features described in the sections above, arrays of registers accessible from
>  /// a base can also be defined:
>  ///
> -/// ```no_run
> +/// ```ignore
>  /// # fn no_run() -> Result<(), Error> {
>  /// # fn get_scratch_idx() -> usize {
>  /// #   0x15
> @@ -273,28 +274,29 @@ pub(crate) trait RegisterBase<T> {
>  /// # Ok(())
>  /// # }
>  /// ```
> +#[macro_export]
>  macro_rules! register {
>      // Creates a register at a fixed offset of the MMIO space.
>      ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $offset);
>      };
>  
>      // Creates an alias register of fixed offset register `alias` with its own fields.
>      ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $alias::OFFSET);
>      };
>  
>      // Creates a register at a relative offset from a base address provider.
>      ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $offset ]);
>      };
>  
>      // Creates an alias register of relative offset register `alias` with its own fields.
>      ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $alias::OFFSET ]);
>      };
>  
> @@ -305,7 +307,7 @@ macro_rules! register {
>          }
>      ) => {
>          static_assert!(::core::mem::size_of::<u32>() <= $stride);
> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
>          register!(@io_array $name @ $offset [ $size ; $stride ]);
>      };
>  
> @@ -326,7 +328,7 @@ macro_rules! register {
>              $(, $comment:literal)? { $($fields:tt)* }
>      ) => {
>          static_assert!(::core::mem::size_of::<u32>() <= $stride);
> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
>          register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
>      };
>  
> @@ -348,7 +350,7 @@ macro_rules! register {
>          }
>      ) => {
>          static_assert!($idx < $alias::SIZE);
> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
>      };
>  
> @@ -357,7 +359,7 @@ macro_rules! register {
>      // to avoid it being interpreted in place of the relative register array alias rule.
>      ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
>          static_assert!($idx < $alias::SIZE);
> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
>      };
>  
> @@ -414,12 +416,12 @@ pub(crate) fn read<const SIZE: usize, T, B>(
>                  base: &B,
>              ) -> Self where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>              {
>                  const OFFSET: usize = $name::OFFSET;
>  
>                  let value = io.read32(
> -                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
> +                    <B as ::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
>                  );
>  
>                  Self(value)
> @@ -435,13 +437,13 @@ pub(crate) fn write<const SIZE: usize, T, B>(
>                  base: &B,
>              ) where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>              {
>                  const OFFSET: usize = $name::OFFSET;
>  
>                  io.write32(
>                      self.0,
> -                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
> +                    <B as ::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
>                  );
>              }
>  
> @@ -455,7 +457,7 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
>                  f: F,
>              ) where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  let reg = f(Self::read(io, base));
> @@ -600,11 +602,11 @@ pub(crate) fn read<const SIZE: usize, T, B>(
>                  idx: usize,
>              ) -> Self where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>              {
>                  build_assert!(idx < Self::SIZE);
>  
> -                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
> +                let offset = <B as ::kernel::io::register::RegisterBase<$base>>::BASE +
>                      Self::OFFSET + (idx * Self::STRIDE);
>                  let value = io.read32(offset);
>  
> @@ -622,11 +624,11 @@ pub(crate) fn write<const SIZE: usize, T, B>(
>                  idx: usize
>              ) where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>              {
>                  build_assert!(idx < Self::SIZE);
>  
> -                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
> +                let offset = <B as ::kernel::io::register::RegisterBase<$base>>::BASE +
>                      Self::OFFSET + (idx * Self::STRIDE);
>  
>                  io.write32(self.0, offset);
> @@ -643,7 +645,7 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
>                  f: F,
>              ) where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  let reg = f(Self::read(io, base, idx));
> @@ -662,7 +664,7 @@ pub(crate) fn try_read<const SIZE: usize, T, B>(
>                  idx: usize,
>              ) -> ::kernel::error::Result<Self> where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>              {
>                  if idx < Self::SIZE {
>                      Ok(Self::read(io, base, idx))
> @@ -684,7 +686,7 @@ pub(crate) fn try_write<const SIZE: usize, T, B>(
>                  idx: usize,
>              ) -> ::kernel::error::Result where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>              {
>                  if idx < Self::SIZE {
>                      Ok(self.write(io, base, idx))
> @@ -707,7 +709,7 @@ pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
>                  f: F,
>              ) -> ::kernel::error::Result where
>                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
> -                B: crate::regs::macros::RegisterBase<$base>,
> +                B: ::kernel::io::register::RegisterBase<$base>,
>                  F: ::core::ops::FnOnce(Self) -> Self,
>              {
>                  if idx < Self::SIZE {
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index fcffc3988a90..8f8260090c02 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -63,6 +63,7 @@
>  pub mod alloc;
>  #[cfg(CONFIG_AUXILIARY_BUS)]
>  pub mod auxiliary;
> +pub mod bitfield;
>  pub mod bits;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
> -- 
> 2.34.1
> 
> 
