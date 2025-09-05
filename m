Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CD4B4780D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202FD10E3FF;
	Sat,  6 Sep 2025 22:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="OoTQx7nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E22410E02B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 22:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
 s=protonmail3; t=1757110953; x=1757370153;
 bh=0krcnuYf+HRb0KjbYvjUYhVudHL1dFh9Fxl804g3Gyg=;
 h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=OoTQx7nvROXMbGTTMKr2KrB9vMeZGUs8NF/QGckVlupEa8uHVv0sdpk7svn7KU+rw
 +X+q0csk8oM2g/AjCBXU9WziWapJV9LCHcDaj3qy1OOOswBQnPvDQxNQKDvEOrKbTN
 /FOmQPgYfqFZspIdGAmQz2iJCzkAreNOnsONqq6m8/C9SRT5pocHqRj6MhHo+Pp0+7
 N+XWT4DHMXYAEZ/N82k3y6phwxDo4NJPOBM0Uzx2/MQ8j0Js8ueemRWSjPwUWUVLtu
 CzB3Kdy+lLBX/daRDnYcM7axuQqN9Cb1tJLkKAnhtqzczN5dg4RzpdP1Kv4HbLjmWY
 Vef9J0lru9SLw==
X-Pm-Submission-Id: 4cJW7B25rPz1DDYP
Date: Fri, 5 Sep 2025 22:22:27 +0000
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
Subject: Re: [PATCH v2 3/4] nova-core: bitstruct: Add support for custom
 visiblity
Message-ID: <aLtio1FbGy9Qx9rL@archiso>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-4-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903215428.1296517-4-joelagnelf@nvidia.com>
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

On Wed, Sep 03, 2025 at 05:54:27PM -0400, Joel Fernandes wrote:
> Add support for custom visiblity to allow for users to control visibility
> of the structure and helpers.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitstruct.rs   | 46 ++++++++++++++--------------
>  drivers/gpu/nova-core/regs/macros.rs | 16 +++++-----
>  2 files changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
> index 068334c86981..1047c5c17e2d 100644
> --- a/drivers/gpu/nova-core/bitstruct.rs
> +++ b/drivers/gpu/nova-core/bitstruct.rs
> @@ -9,7 +9,7 @@
>  ///
>  /// ```rust
>  /// bitstruct! {
> -///     struct ControlReg: u32 {
> +///     pub struct ControlReg: u32 {
>  ///         3:0       mode        as u8 ?=> Mode;
>  ///         7:4       state       as u8 => State;
>  ///     }
> @@ -34,21 +34,21 @@
>  ///   and returns the result. This is useful with fields for which not all values are valid.
>  macro_rules! bitstruct {
>      // Main entry point - defines the bitfield struct with fields
> -    (struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> -        bitstruct!(@core $name $storage $(, $comment)? { $($fields)* });
> +    ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> +        bitstruct!(@core $name $vis $storage $(, $comment)? { $($fields)* });
>      };
>  
>      // All rules below are helpers.
>  
>      // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
>      // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
> -    (@core $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> +    (@core $name:ident $vis:vis $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
>          $(
>          #[doc=$comment]
>          )?
>          #[repr(transparent)]
>          #[derive(Clone, Copy)]
> -        pub(crate) struct $name($storage);
> +        $vis struct $name($vis $storage);
>  
>          impl ::core::ops::BitOr for $name {
>              type Output = Self;
> @@ -64,14 +64,14 @@ fn from(val: $name) -> $storage {
>              }
>          }
>  
> -        bitstruct!(@fields_dispatcher $name $storage { $($fields)* });
> +        bitstruct!(@fields_dispatcher $name $vis $storage { $($fields)* });
>      };
>  
>      // Captures the fields and passes them to all the implementers that require field information.
>      //
>      // Used to simplify the matching rules for implementers, so they don't need to match the entire
>      // complex fields rule even though they only make use of part of it.
> -    (@fields_dispatcher $name:ident $storage:ty {
> +    (@fields_dispatcher $name:ident $vis:vis $storage:ty {
>          $($hi:tt:$lo:tt $field:ident as $type:tt
>              $(?=> $try_into_type:ty)?
>              $(=> $into_type:ty)?
> @@ -80,7 +80,7 @@ fn from(val: $name) -> $storage {
>          )*
>      }
>      ) => {
> -        bitstruct!(@field_accessors $name $storage {
> +        bitstruct!(@field_accessors $name $vis $storage {
>              $(
>                  $hi:$lo $field as $type
>                  $(?=> $try_into_type)?
> @@ -95,7 +95,7 @@ fn from(val: $name) -> $storage {
>  
>      // Defines all the field getter/setter methods for `$name`.
>      (
> -        @field_accessors $name:ident $storage:ty {
> +        @field_accessors $name:ident $vis:vis $storage:ty {
>          $($hi:tt:$lo:tt $field:ident as $type:tt
>              $(?=> $try_into_type:ty)?
>              $(=> $into_type:ty)?
> @@ -111,7 +111,7 @@ fn from(val: $name) -> $storage {
>          #[allow(dead_code)]
>          impl $name {
>              $(
> -            bitstruct!(@field_accessor $name $storage, $hi:$lo $field as $type
> +            bitstruct!(@field_accessor $name $vis $storage, $hi:$lo $field as $type
>                  $(?=> $try_into_type)?
>                  $(=> $into_type)?
>                  $(, $comment)?
> @@ -145,11 +145,11 @@ impl $name {
>  
>      // Catches fields defined as `bool` and convert them into a boolean value.
>      (
> -        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
> +        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
>              $(, $comment:literal)?;
>      ) => {
>          bitstruct!(
> -            @leaf_accessor $name $storage, $hi:$lo $field
> +            @leaf_accessor $name $vis $storage, $hi:$lo $field
>              { |f| <$into_type>::from(if f != 0 { true } else { false }) }
>              $into_type => $into_type $(, $comment)?;
>          );
> @@ -157,17 +157,17 @@ impl $name {
>  
>      // Shortcut for fields defined as `bool` without the `=>` syntax.
>      (
> -        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
> +        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
>      ) => {
> -        bitstruct!(@field_accessor $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
> +        bitstruct!(@field_accessor $name $vis $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
>      };
>  
>      // Catches the `?=>` syntax for non-boolean fields.
>      (
> -        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
> +        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
>              $(, $comment:literal)?;
>      ) => {
> -        bitstruct!(@leaf_accessor $name $storage, $hi:$lo $field
> +        bitstruct!(@leaf_accessor $name $vis $storage, $hi:$lo $field
>              { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
>              ::core::result::Result<
>                  $try_into_type,
> @@ -178,24 +178,24 @@ impl $name {
>  
>      // Catches the `=>` syntax for non-boolean fields.
>      (
> -        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
> +        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
>              $(, $comment:literal)?;
>      ) => {
> -        bitstruct!(@leaf_accessor $name $storage, $hi:$lo $field
> +        bitstruct!(@leaf_accessor $name $vis $storage, $hi:$lo $field
>              { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
>      };
>  
>      // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
>      (
> -        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
> +        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
>              $(, $comment:literal)?;
>      ) => {
> -        bitstruct!(@field_accessor $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
> +        bitstruct!(@field_accessor $name $vis $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
>      };
>  
>      // Generates the accessor methods for a single field.
>      (
> -        @leaf_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
> +        @leaf_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident
>              { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
>      ) => {
>          ::kernel::macros::paste!(
> @@ -218,7 +218,7 @@ impl $name {
>          #[doc=$comment]
>          )?
>          #[inline(always)]
> -        pub(crate) fn $field(self) -> $res_type {
> +        $vis fn $field(self) -> $res_type {
>              ::kernel::macros::paste!(
>              const MASK: $storage = $name::[<$field:upper _MASK>];
>              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> @@ -234,7 +234,7 @@ pub(crate) fn $field(self) -> $res_type {
>          #[doc=$comment]
>          )?
>          #[inline(always)]
> -        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
> +        $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
>              const MASK: $storage = $name::[<$field:upper _MASK>];
>              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
>              let value = (<$storage>::from(value) << SHIFT) & MASK;
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
> index bbfeab147c9f..22a53a73b765 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -284,25 +284,25 @@ pub(crate) trait RegisterBase<T> {
>  macro_rules! register {
>      // Creates a register at a fixed offset of the MMIO space.
>      ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
> +        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $offset);
>      };
>  
>      // Creates an alias register of fixed offset register `alias` with its own fields.
>      ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
> +        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $alias::OFFSET);
>      };
>  
>      // Creates a register at a relative offset from a base address provider.
>      ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
> -        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
> +        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $offset ]);
>      };
>  
>      // Creates an alias register of relative offset register `alias` with its own fields.
>      ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
> -        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
> +        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $alias::OFFSET ]);
>      };
>  
> @@ -313,7 +313,7 @@ macro_rules! register {
>          }
>      ) => {
>          static_assert!(::core::mem::size_of::<u32>() <= $stride);
> -        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
> +        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_array $name @ $offset [ $size ; $stride ]);
>      };
>  
> @@ -334,7 +334,7 @@ macro_rules! register {
>              $(, $comment:literal)? { $($fields:tt)* }
>      ) => {
>          static_assert!(::core::mem::size_of::<u32>() <= $stride);
> -        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
> +        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
>      };
>  
> @@ -356,7 +356,7 @@ macro_rules! register {
>          }
>      ) => {
>          static_assert!($idx < $alias::SIZE);
> -        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
> +        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
>      };
>  
> @@ -365,7 +365,7 @@ macro_rules! register {
>      // to avoid it being interpreted in place of the relative register array alias rule.
>      ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
>          static_assert!($idx < $alias::SIZE);
> -        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
> +        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
>          register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
>      };
>  
> -- 
> 2.34.1
> 
> 

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
