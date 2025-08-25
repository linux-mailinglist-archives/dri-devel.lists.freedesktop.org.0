Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CDB355EB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 09:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6D410E5CB;
	Tue, 26 Aug 2025 07:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="Kw7HvHkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56AB10E5A4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
 s=protonmail3; t=1756164027; x=1756423227;
 bh=dbfxHDr+4prCVmBev/sJiog2Lc66l2bjBKk57p6NvnI=;
 h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Kw7HvHkOW/t/7aBcbbaxEWgJIAosTbK9FiF/6CDyQESX2BXBlTRAFBUsx8tZMfYAr
 db6I272BNYVLGhyhLUyUt86/sxo7RmXvwpjm8C+Jjkr6JyInW0/IQOAJVfpeF90Zzj
 5+nWo4hHFKRADJMvcZTjlkhAKamuNUw58vSUs7fVOJwNUZ+ypNoX6ybtgrOTqt75Yx
 yea2VWK69D3FhqUjpwyABmkcfz2XUDQq1VoKse3WnJus3t53cG1bvF/aEuAhTVNkiR
 BfCPH2IfwZzREM40vUa2Qc7C0DylCv6VtERKOBfbExqguu0BHpwvtB36zuKpOjPWJ6
 8cI9ZlrrjiWNA==
X-Pm-Submission-Id: 4c9mx60wYnz1DDLJ
Date: Mon, 25 Aug 2025 23:20:22 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
Message-ID: <aKzvpFf9PkTHYNet@archiso>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250824135954.2243774-1-joelagnelf@nvidia.com>
X-Mailman-Approved-At: Tue, 26 Aug 2025 07:42:42 +0000
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

On Sun, Aug 24, 2025 at 09:59:52AM -0400, Joel Fernandes wrote:
> Add a minimal bitfield library for defining in Rust structures (called
> bitstruct), similar in concept to bit fields in C structs. This will be used
> for defining page table entries and other structures in nova-core.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
> 
> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
> new file mode 100644
> index 000000000000..661a75da0a9c
> --- /dev/null
> +++ b/drivers/gpu/nova-core/bitstruct.rs
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// bitstruct.rs — C-style library for bitfield-packed Rust structures
> +//
> +// A library that provides support for defining bit fields in Rust
> +// structures to circumvent lack of native language support for this.
> +//
> +// Similar usage syntax to the register! macro.
> +
> +use kernel::prelude::*;
> +
> +/// Macro for defining bitfield-packed structures in Rust.
> +/// The size of the underlying storage type is specified with #[repr(TYPE)].
> +///
> +/// # Example (just for illustration)
> +/// ```rust
> +/// bitstruct! {
> +///     #[repr(u64)]
> +///     pub struct PageTableEntry {
> +///         0:0       present     as bool,
> +///         1:1       writable    as bool,
> +///         11:9      available   as u8,
> +///         51:12     pfn         as u64,
> +///         62:52     available2  as u16,
> +///         63:63     nx          as bool,
> +///     }
> +/// }
> +/// ```
> +///
> +/// This generates a struct with methods:
> +/// - Constructor: `default()` sets all bits to zero.
> +/// - Field accessors: `present()`, `pfn()`, etc.
> +/// - Field setters: `set_present()`, `set_pfn()`, etc.
> +/// - Builder methods: `with_present()`, `with_pfn()`, etc.
> +/// - Raw conversion: `from_raw()`, `into_raw()`
> +#[allow(unused_macros)]
> +macro_rules! bitstruct {
> +    (
> +        #[repr($storage:ty)]
> +        $vis:vis struct $name:ident {
> +            $(
> +                $hi:literal : $lo:literal $field:ident as $field_type:tt
> +            ),* $(,)?
> +        }
> +    ) => {
> +        #[repr(transparent)]
> +        #[derive(Copy, Clone, Default)]
> +        $vis struct $name($storage);
> +
> +        impl $name {
> +            /// Create from raw value
> +            #[inline(always)]
> +            $vis const fn from_raw(val: $storage) -> Self {
> +                Self(val)
> +            }
> +
> +            /// Get raw value
> +            #[inline(always)]
> +            $vis const fn into_raw(self) -> $storage {
> +                self.0
> +            }
> +        }
> +
> +        impl core::fmt::Debug for $name {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +                write!(f, "{}({:#x})", stringify!($name), self.0)
> +            }
> +        }
> +
> +        // Generate all field methods
> +        $(
> +            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, $field as $field_type);
> +        )*
> +    };
> +}
> +
> +/// Helper to calculate mask for bit fields
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_mask {
> +    ($hi:literal, $lo:literal, $storage:ty) => {{
> +        let width = ($hi - $lo + 1) as usize;
> +        let storage_bits = 8 * core::mem::size_of::<$storage>();
> +        if width >= storage_bits {
> +            <$storage>::MAX
> +        } else {
> +            ((1 as $storage) << width) - 1
> +        }
> +    }};
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_field_impl {
> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident as $field_type:tt) => {
> +        impl $struct_name {
> +            #[inline(always)]
> +            $vis const fn $field(&self) -> $field_type {
> +                let field_val = (self.0 >> $lo) & bitstruct_mask!($hi, $lo, $storage);
> +                bitstruct_cast_value!(field_val, $field_type)
> +            }
> +        }
> +        bitstruct_make_setters!($vis, $struct_name, $storage, $hi, $lo, $field, $field_type);
> +    };
> +}
> +
> +/// Helper macro to convert extracted value to target type
> +///
> +/// Special handling for bool types is required because the `as` keyword
> +/// cannot be used to convert to bool in Rust. For bool fields, we check
> +/// if the extracted value is non-zero. For all other types, we use the
> +/// standard `as` conversion.
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_cast_value {
> +    ($field_val:expr, bool) => {
> +        $field_val != 0
> +    };
> +    ($field_val:expr, $field_type:tt) => {
> +        $field_val as $field_type
> +    };
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_write_bits {
> +    ($raw:expr, $hi:literal, $lo:literal, $val:expr, $storage:ty) => {{
> +        let mask = bitstruct_mask!($hi, $lo, $storage);
> +        ($raw & !(mask << $lo)) | ((($val as $storage) & mask) << $lo)
> +    }};
> +}
> +
> +#[allow(unused_macros)]
> +macro_rules! bitstruct_make_setters {
> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident, $field_type:tt) => {
> +        ::kernel::macros::paste! {
> +            impl $struct_name {
> +                #[inline(always)]
> +                #[allow(dead_code)]
> +                $vis fn [<set_ $field>](&mut self, val: $field_type) {
> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
> +                }
> +
> +                #[inline(always)]
> +                #[allow(dead_code)]
> +                $vis const fn [<with_ $field>](mut self, val: $field_type) -> Self {
> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
> +                    self
> +                }
> +            }
> +        }
> +    };
> +}

This is awesome. Is there a place for this to live outside of
`nova-core`? I would think this would be extremely useful as a general
helper for bitfield struct definitions.

> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index cb2bbb30cba1..54505cad4a73 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,6 +2,7 @@
>  
>  //! Nova Core GPU Driver
>  
> +mod bitstruct;
>  mod dma;
>  mod driver;
>  mod falcon;
> -- 
> 2.34.1

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
