Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C009B448A6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 23:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8A510EAED;
	Thu,  4 Sep 2025 21:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LoF8ywxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845D710EAED;
 Thu,  4 Sep 2025 21:35:41 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e96d65194c1so1555688276.1; 
 Thu, 04 Sep 2025 14:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757021740; x=1757626540; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IvCBV4RAVElTtuBlztSRnmNbm0dDQBJMrO8cYnccOd4=;
 b=LoF8ywxWC9uS2UXabimVoj3BT7GldhkU9K1PZnEP3Yzzx6K3KWf/HQ0xy8LbRxGJ7v
 /muTCROlMnesyY71Fo/9U+rwBpHq5sgVh37/zPC0SMCw40GpRJvMIr8nOG9TdKBaOevY
 UhryFtFk8GIxcSUaGxjRkHr1AGCuelhQbbA2PGiU4vEv16SCIl1klsxnrcaW4mvYwMTH
 9275KywuupTc66mPKOOEB95RHa2j7GK0QF9EGzN3bpA8iygxjIerRQ2TRTjk52cWf7fV
 DNKNGCuimNAcOYFCqTyLP9B2OW04toL66Wrp8Hx+Jk8D7XToFagflS8N2fhVYF9CSfiS
 TOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757021740; x=1757626540;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvCBV4RAVElTtuBlztSRnmNbm0dDQBJMrO8cYnccOd4=;
 b=GFc4LxsLbhTqLNMapvTHrpBaeRhrErjQNBd2ZA+1kCuKwu6XFDhcEW6hn6iB7paNa1
 nPtzANGGKIohBrnEbyIemk+x6UVwzbp/Zd787Bkn8toxVTWbB/MFnz6BHOscb1WD6fGg
 9cbKlazAl5SmIqm2JCzj9F8ELm2EV/c8Ul9OVZO6VinBkVi1L1Ne49LIniU9H36bwwnF
 /FgXMpopmBxPKTRodBazrFVFdvg9rlKZKlxIm4r+vmpcnl7ey+iPqcp+N0ID7+Q+1eSb
 wbR5eRE4v677tG60rTZGPxVGhagbLxpRbuoODrYGAfEyDALVx9ofwOUemjhgaXQuO7dV
 /Ecw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqqbuQGAN+2mBdOTlWoDSI7w9hgJJIBIJzRh0yG8JWgz40cllrEpVt2H4//JOGDjUdo915ytOHOQ==@lists.freedesktop.org,
 AJvYcCWrhaS/OdzMJ9OzGQwN8W8qrS2HQ001rlOkn21JDGtGvzCg1iahD4oyjIq2K/kbXkYrzScu2Fjkl4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyuIFaFMnMAalJs9Li0hftbJpwGjGrydrfPFA3NlUQ3IFL+cyu
 EFxGtemYPNx5WXuLb5sgoMLWv5FzhFiCLTvrXabrRiPRAKXSykCW2oGZ
X-Gm-Gg: ASbGncv87zdhecx0bRTb8apnZ1Z3PrrF7cD+e4edLYAg2Xw31JLTgAuymRNlkRzPNGL
 5jAVSTbgcf6S4WUeeUj9QY7CND7K0R0FyWih0L0uI7nPvtptu9+szi81ITAFZ9kROcX+8O1u8Vw
 CPhFXg2uBSsyAg0yVKcdwbSsQMj+O+od8V4DOR4WjUW5hHPZ7gChh9ewkx/mxwGd1phXMBPeVOP
 8jixGmsXzSEZxdDvMZ0XZISY2eO+p3mCAv144RZk7OvaS5mViHps8ez55YLZw0A85KY7w0PGDaQ
 nBA7bwAMEGvOWhE78bL3Xnol5JsMzPanyeIf8BCXUoKSZ/Gm/eyeFRT6V8NDjQMMz4KZGnTQhxd
 KGo/DHfDwrvoSoSSg8YGT1w==
X-Google-Smtp-Source: AGHT+IGcjNZusnsLiR6R1wgbKQBrEhDGHmeQUz60B2AGaGgy+2NRFtq0i4WitkyqZVH+hfJ5zflfxw==
X-Received: by 2002:a05:690e:424c:b0:5f3:319c:fec6 with SMTP id
 956f58d0204a3-60175b91dfcmr3275590d50.11.1757021740093; 
 Thu, 04 Sep 2025 14:35:40 -0700 (PDT)
Received: from localhost ([2601:347:100:5ea0:1218:85e4:58ab:e67f])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-5ff8ef2b4cdsm1726511d50.7.2025.09.04.14.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 14:35:39 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:35:38 -0400
From: Yury Norov <yury.norov@gmail.com>
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
Message-ID: <aLoGKilQPupPQkd2@yury>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250824135954.2243774-1-joelagnelf@nvidia.com>
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

(Thanks to John for referencing this.)

On Sun, Aug 24, 2025 at 09:59:52AM -0400, Joel Fernandes wrote:
> Add a minimal bitfield library for defining in Rust structures (called
> bitstruct), similar in concept to bit fields in C structs.

So maybe name it bitfield? 

> This will be used
> for defining page table entries and other structures in nova-core.

I think this is understatement, and this will find a broader use. :)

> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I agree with the others that this bitstruct is worth to live in core
directory. I just merged bitmap wrapper in rust/kernel/bitmap.rs, and
I think this one should go in rust/kernel/bitstruct.rs (or bitfield.rs?).

Can you please consider this change for v2, and also add the new file in
BITOPS API record in MAINTAINERS?

A couple nits inline.

Thanks,
Yury

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

Is it possible to create overlapping fields? Should we allow that?
(I guess yes.) Does your machinery handle it correctly now?

If the answer is yes, can you add a test for it?

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

Does this '8' mean BITS_PER_BYTE? If so, we've got BITS_PER_TYPE() macro. Can
you use it here?

> +        if width >= storage_bits {
> +            <$storage>::MAX

This is an attempt to make an out-of-boundary access. Maybe print a
warning or similar? 

I actually think that if user wants to make an out-of-boundary access,
the best thing we can do is to keep the memory untouched. So, maybe
return None here, or 0, and make sure that the upper code doesn't
access it?

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
> 
