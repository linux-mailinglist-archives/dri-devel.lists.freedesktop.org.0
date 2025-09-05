Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A956EB47807
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66DE10E3FB;
	Sat,  6 Sep 2025 22:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="B7Gsa8XV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E2A10E02B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 22:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
 s=protonmail3; t=1757110901; x=1757370101;
 bh=FxWk3Q5v/enJfxs9GXwFtW0/oFYzvPIA0skhSYzwXbg=;
 h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=B7Gsa8XVYseX6grgfKcs+LdINZU+8d6PWMf3ecYhgRno/uPhG+Vw9vH0ZkhDMDtE8
 baYrITuMPk9WR7piE9YVKanRuK4A0bLLT+61WaU9E1xb/Q+7B13DyeN/dxMO9/5CY/
 LNXkFeiMnzC9rG45HXeCZXm5OqVIYtPEc3y+xAKaLSkmFFwecnpHMk8JolXFBPz2EY
 OCnx+DFb0JHl2udF08Ijfe3u25udKKvRK6kmMX/+aBHd/DeJlY/SsYLKNlCEX5iA+9
 s3DzSHeHPekIOrFu4RaZTyBbtY7vX9rBwb8xQ4msGisZeY+7Gr3K+SKL8KT/x0ptfr
 sR/ZAj7PQ2PRA==
X-Pm-Submission-Id: 4cJW6941gnz1DDLC
Date: Fri, 5 Sep 2025 22:21:34 +0000
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
Subject: Re: [PATCH v2 2/4] nova-core: bitstruct: Add support for different
 storage widths
Message-ID: <aLtiN9B8ckCF4hSa@archiso>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-3-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903215428.1296517-3-joelagnelf@nvidia.com>
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

On Wed, Sep 03, 2025 at 05:54:26PM -0400, Joel Fernandes wrote:
> Previously, bitstructs were hardcoded to use u32 as the underlying
> storage type.  Add support for different storage types (u8, u16, u32,
> u64) to the bitstruct macro.
> 
> New syntax is: struct Name: <type ex., u32> { ... }
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitstruct.rs   | 71 ++++++++++++++++------------
>  drivers/gpu/nova-core/regs/macros.rs | 16 +++----
>  2 files changed, 48 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
> index 1dd9edab7d07..068334c86981 100644
> --- a/drivers/gpu/nova-core/bitstruct.rs
> +++ b/drivers/gpu/nova-core/bitstruct.rs
> @@ -9,7 +9,7 @@
>  ///
>  /// ```rust
>  /// bitstruct! {
> -///     struct ControlReg {
> +///     struct ControlReg: u32 {
>  ///         3:0       mode        as u8 ?=> Mode;
>  ///         7:4       state       as u8 => State;
>  ///     }
> @@ -34,21 +34,21 @@
>  ///   and returns the result. This is useful with fields for which not all values are valid.
>  macro_rules! bitstruct {
>      // Main entry point - defines the bitfield struct with fields
> -    (struct $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
> -        bitstruct!(@core $name $(, $comment)? { $($fields)* });
> +    (struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> +        bitstruct!(@core $name $storage $(, $comment)? { $($fields)* });
>      };
>  
>      // All rules below are helpers.
>  
>      // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
>      // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
> -    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
> +    (@core $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
>          $(
>          #[doc=$comment]
>          )?
>          #[repr(transparent)]
>          #[derive(Clone, Copy)]
> -        pub(crate) struct $name(u32);
> +        pub(crate) struct $name($storage);
>  
>          impl ::core::ops::BitOr for $name {
>              type Output = Self;
> @@ -58,20 +58,20 @@ fn bitor(self, rhs: Self) -> Self::Output {
>              }
>          }
>  
> -        impl ::core::convert::From<$name> for u32 {
> -            fn from(val: $name) -> u32 {
> +        impl ::core::convert::From<$name> for $storage {
> +            fn from(val: $name) -> $storage {
>                  val.0
>              }
>          }
>  
> -        bitstruct!(@fields_dispatcher $name { $($fields)* });
> +        bitstruct!(@fields_dispatcher $name $storage { $($fields)* });
>      };
>  
>      // Captures the fields and passes them to all the implementers that require field information.
>      //
>      // Used to simplify the matching rules for implementers, so they don't need to match the entire
>      // complex fields rule even though they only make use of part of it.
> -    (@fields_dispatcher $name:ident {
> +    (@fields_dispatcher $name:ident $storage:ty {
>          $($hi:tt:$lo:tt $field:ident as $type:tt
>              $(?=> $try_into_type:ty)?
>              $(=> $into_type:ty)?
> @@ -80,7 +80,7 @@ fn from(val: $name) -> u32 {
>          )*
>      }
>      ) => {
> -        bitstruct!(@field_accessors $name {
> +        bitstruct!(@field_accessors $name $storage {
>              $(
>                  $hi:$lo $field as $type
>                  $(?=> $try_into_type)?
> @@ -89,13 +89,13 @@ fn from(val: $name) -> u32 {
>              ;
>              )*
>          });
> -        bitstruct!(@debug $name { $($field;)* });
> -        bitstruct!(@default $name { $($field;)* });
> +        bitstruct!(@debug $name $storage { $($field;)* });
> +        bitstruct!(@default $name $storage { $($field;)* });
>      };
>  
>      // Defines all the field getter/setter methods for `$name`.
>      (
> -        @field_accessors $name:ident {
> +        @field_accessors $name:ident $storage:ty {
>          $($hi:tt:$lo:tt $field:ident as $type:tt
>              $(?=> $try_into_type:ty)?
>              $(=> $into_type:ty)?
> @@ -111,7 +111,7 @@ fn from(val: $name) -> u32 {
>          #[allow(dead_code)]
>          impl $name {
>              $(
> -            bitstruct!(@field_accessor $name $hi:$lo $field as $type
> +            bitstruct!(@field_accessor $name $storage, $hi:$lo $field as $type
>                  $(?=> $try_into_type)?
>                  $(=> $into_type)?
>                  $(, $comment)?
> @@ -145,11 +145,11 @@ impl $name {
>  
>      // Catches fields defined as `bool` and convert them into a boolean value.
>      (
> -        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
> +        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
>              $(, $comment:literal)?;
>      ) => {
>          bitstruct!(
> -            @leaf_accessor $name $hi:$lo $field
> +            @leaf_accessor $name $storage, $hi:$lo $field
>              { |f| <$into_type>::from(if f != 0 { true } else { false }) }
>              $into_type => $into_type $(, $comment)?;
>          );
> @@ -157,17 +157,17 @@ impl $name {
>  
>      // Shortcut for fields defined as `bool` without the `=>` syntax.
>      (
> -        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
> +        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
>      ) => {
> -        bitstruct!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
> +        bitstruct!(@field_accessor $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
>      };
>  
>      // Catches the `?=>` syntax for non-boolean fields.
>      (
> -        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
> +        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
>              $(, $comment:literal)?;
>      ) => {
> -        bitstruct!(@leaf_accessor $name $hi:$lo $field
> +        bitstruct!(@leaf_accessor $name $storage, $hi:$lo $field
>              { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
>              ::core::result::Result<
>                  $try_into_type,
> @@ -178,29 +178,38 @@ impl $name {
>  
>      // Catches the `=>` syntax for non-boolean fields.
>      (
> -        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
> +        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
>              $(, $comment:literal)?;
>      ) => {
> -        bitstruct!(@leaf_accessor $name $hi:$lo $field
> +        bitstruct!(@leaf_accessor $name $storage, $hi:$lo $field
>              { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
>      };
>  
>      // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
>      (
> -        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
> +        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
>              $(, $comment:literal)?;
>      ) => {
> -        bitstruct!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
> +        bitstruct!(@field_accessor $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
>      };
>  
>      // Generates the accessor methods for a single field.
>      (
> -        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
> +        @leaf_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
>              { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
>      ) => {
>          ::kernel::macros::paste!(
>          const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
> -        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> +        const [<$field:upper _MASK>]: $storage = {
> +            // Generate mask for shifting
> +            match ::core::mem::size_of::<$storage>() {
> +                1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
> +                2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
> +                4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
> +                8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,

Not really important for current users, but something to think about for
the future is fields that are represented using byte arrays (e.g. a
`u24` represented as `[u8; 3]`).

I think your approach here could be fairly easily modified to handle
those use-cases, just something to think about.

For the byte array storage types, you would also need to think about
endianness (MSB v. LSB).

> +                _ => <$storage>::MAX
> +            }
> +        };
>          const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
>          );
>  
> @@ -211,7 +220,7 @@ impl $name {
>          #[inline(always)]
>          pub(crate) fn $field(self) -> $res_type {
>              ::kernel::macros::paste!(
> -            const MASK: u32 = $name::[<$field:upper _MASK>];
> +            const MASK: $storage = $name::[<$field:upper _MASK>];
>              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
>              );
>              let field = ((self.0 & MASK) >> SHIFT);
> @@ -226,9 +235,9 @@ pub(crate) fn $field(self) -> $res_type {
>          )?
>          #[inline(always)]
>          pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
> -            const MASK: u32 = $name::[<$field:upper _MASK>];
> +            const MASK: $storage = $name::[<$field:upper _MASK>];
>              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> -            let value = (u32::from(value) << SHIFT) & MASK;
> +            let value = (<$storage>::from(value) << SHIFT) & MASK;
>              self.0 = (self.0 & !MASK) | value;
>  
>              self
> @@ -237,7 +246,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
>      };
>  
>      // Generates the `Debug` implementation for `$name`.
> -    (@debug $name:ident { $($field:ident;)* }) => {
> +    (@debug $name:ident $storage:ty { $($field:ident;)* }) => {
>          impl ::core::fmt::Debug for $name {
>              fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
>                  f.debug_struct(stringify!($name))
> @@ -251,7 +260,7 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
>      };
>  
>      // Generates the `Default` implementation for `$name`.
> -    (@default $name:ident { $($field:ident;)* }) => {
> +    (@default $name:ident $storage:ty { $($field:ident;)* }) => {
>          /// Returns a value for the bitstruct where all fields are set to their default value.
>          impl ::core::default::Default for $name {
>              fn default() -> Self {
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
> index 3fb6852dff04..bbfeab147c9f 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -284,25 +284,25 @@ pub(crate) trait RegisterBase<T> {
>  macro_rules! register {
>      // Creates a register at a fixed offset of the MMIO space.
>      ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
> +        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $offset);
>      };
>  
>      // Creates an alias register of fixed offset register `alias` with its own fields.
>      ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
> +        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $alias::OFFSET);
>      };
>  
>      // Creates a register at a relative offset from a base address provider.
>      ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
> +        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $offset ]);
>      };
>  
>      // Creates an alias register of relative offset register `alias` with its own fields.
>      ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
> -        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
> +        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $alias::OFFSET ]);
>      };
>  
> @@ -313,7 +313,7 @@ macro_rules! register {
>          }
>      ) => {
>          static_assert!(::core::mem::size_of::<u32>() <= $stride);
> -        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
> +        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_array $name @ $offset [ $size ; $stride ]);
>      };
>  
> @@ -334,7 +334,7 @@ macro_rules! register {
>              $(, $comment:literal)? { $($fields:tt)* }
>      ) => {
>          static_assert!(::core::mem::size_of::<u32>() <= $stride);
> -        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
> +        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
>      };
>  
> @@ -356,7 +356,7 @@ macro_rules! register {
>          }
>      ) => {
>          static_assert!($idx < $alias::SIZE);
> -        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
> +        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
>      };
>  
> @@ -365,7 +365,7 @@ macro_rules! register {
>      // to avoid it being interpreted in place of the relative register array alias rule.
>      ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
>          static_assert!($idx < $alias::SIZE);
> -        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
> +        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
>      };
>  
> -- 
> 2.34.1
> 
> 

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
