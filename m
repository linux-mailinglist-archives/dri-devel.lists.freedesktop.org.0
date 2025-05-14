Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82522AB694E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 12:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2A910E0AB;
	Wed, 14 May 2025 10:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tljjtd1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D1610E0AB;
 Wed, 14 May 2025 10:58:40 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7302a769534so4412735a34.1; 
 Wed, 14 May 2025 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747220319; x=1747825119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2YGwKqeTKSa1sCOAsRfi0xawxji0Kb2n2VWufPyqvc=;
 b=Tljjtd1xdcWkumcclnfytVeUIn33ptZOXeM2X9xv3SSmDLtuIQHXJEbnpty+nHPI2J
 UjyuwH1enlBofeNkNOl8LJFdhRJ9hKwqixBU9gn6qPebOmil9clNfWWZeD6KtRPdd1cY
 1WMQGu7vXdgr6Ire626FhIZMUPKOVMY2+/blNK4zzwt62tKz1VWufpMa+/xrpMpjJ0Y/
 gaL/pjA54YGlriYng0Z1J6wad8z9+na9Ep4J8C76RP4jT36UrvS2n0xpqtnNTzTWV4qx
 3CxfvWeJYvP/oLo5+UHC4F2NuG8iCMrvY8jOn4T9ICzrAMVDirAiu/Rw7GwNdhxg/Akv
 P2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747220319; x=1747825119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L2YGwKqeTKSa1sCOAsRfi0xawxji0Kb2n2VWufPyqvc=;
 b=NcWQyb9xteO4x+GV+j1ILZdh85DK6R9hMhyTRjymxWB2He+1Ei1UHdMqPaF4d5KIeo
 xsSeDQ1b8+YdbqCXNx7PoLW/zaq2k94ZVqCUAQlxbeMux6DvnO/OPXvjFJze/pEchbEl
 RTSfMNisAd60lpMYVou2AeX8cWod+xJIKoYuL4GoFt1LuawHUrGXNhdfS9KuRdBdVgE/
 1E5idmasXnNPSDRd5feXB7LOEXSvnYb5U52RSE4LlnYN3pC+5rDOefpKk+mRlVGGQKNr
 0/ZWK5CEcwokyO3nCaszKfejzzcHVAytYF5tsJ26ZVRTNpuYMwT7fJrYkxSBYgMEobmi
 L96w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXVxAaH26+9RSnPwLf9JNj71qx9XLMhcq6qtkVZovNlayf3FyAy9fuqMFijCIKIl5tiEcoMIvM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzItJ1TRvSENx8V02HLdBFAKQlnY29DBNrYtoVpzg+MIrWYq9Nm
 n8ksPCyXsYGOwbmHeeMahL8W/UrsaXWhvAsTb8WX2ia8dnwYfWd2PoZv8PNr
X-Gm-Gg: ASbGncsUiQzZFPbBtksvBX/GQ3hZ+6/rmA0HF58nwswnMhkUuMnyV4M1dhpkUDPoFRb
 6sf4Bo01hw+AaxxONVsVmY3CMNUo/4GTsFbwfFIAUFqD46qIzis9WMBdJ2Y6IDSg1fEKlCWYk98
 JiL6Itjdh/Gpd7StFFs9ucn3UEztSxkm0uTWhLibyKrRR9UjNQufN9oM+g3DoZWPJZWfWtCqFe8
 Wn0QwXPfQQa0wfLUZly6Tx85WmrcKHi+enKXhKz+3wZUYDxtc57LN9WgPJnmPD94Q/nlMtuB3QR
 W7E5gQuh0cQXfxoVtZmjpgQRJul/2l/fz68+Cln2/aHnipmoejOPBrFuWH36V3ICOe8v9Mi+7qV
 ir4NbSsp3/O0ExSfc4SGY8oc=
X-Google-Smtp-Source: AGHT+IFIDv/Mb+Rtohkq/d/uAhGwS+ySqBGkomUOW9Wg//NzmgduJyMW2cnWhHvDAA3xrhuoO0IgrA==
X-Received: by 2002:a05:6870:96a6:b0:29d:c832:7ef6 with SMTP id
 586e51a60fabf-2e3488725c5mr1367585fac.39.1747220318966; 
 Wed, 14 May 2025 03:58:38 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-2dba060be9esm2654535fac.10.2025.05.14.03.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 03:58:38 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, a.hindborg@kernel.org, airlied@gmail.com,
 akpm@linux-foundation.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 andrewjballance@gmail.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, benno.lossin@proton.me, bhelgaas@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, kwilczynski@kernel.org, me@kloenk.dev,
 ojeda@kernel.org, raag.jadav@intel.com, rafael@kernel.org, simona@ffwll.ch,
 tmgross@umich.edu
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/6] rust: io: make Io use IoAccess trait
Date: Wed, 14 May 2025 05:57:30 -0500
Message-ID: <20250514105734.3898411-3-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514105734.3898411-1-andrewjballance@gmail.com>
References: <20250514105734.3898411-1-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Fiona Behrens <me@kloenk.dev>

makes the Io struct use the new traits (`IoAccess`, `IoAccess64`,
 `IoAccessRelaxed` and `IoAccess64Relaxed)` to perform io.

This allows to later implement a generic Io framework.

update pci,rust_driver_pci.rs, nova-core and a devres doc test to use
the new io api.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Co-developed-by: Andrew Ballance <andrewjballance@gmail.com>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 drivers/gpu/nova-core/regs.rs   |   1 +
 rust/kernel/devres.rs           |   4 +-
 rust/kernel/io.rs               | 438 +++++++++++++++++++-------------
 rust/kernel/pci.rs              |   2 +-
 samples/rust/rust_driver_pci.rs |   4 +-
 5 files changed, 263 insertions(+), 186 deletions(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b1a25b86ef17..079c3d275a47 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use crate::driver::Bar0;
+use kernel::io::IoAccess;
 
 // TODO
 //
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index ddb1ce4a78d9..88d145821ca8 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -45,7 +45,7 @@ struct DevresInner<T> {
 /// # Example
 ///
 /// ```no_run
-/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw}};
+/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw, IoAccess}};
 /// # use core::ops::Deref;
 ///
 /// // See also [`pci::Bar`] for a real example.
@@ -80,7 +80,7 @@ struct DevresInner<T> {
 ///
 ///    fn deref(&self) -> &Self::Target {
 ///         // SAFETY: The memory range stored in `self` has been properly mapped in `Self::new`.
-///         unsafe { Io::from_raw(&self.0) }
+///         unsafe { Io::from_raw_ref(&self.0) }
 ///    }
 /// }
 /// # fn no_run() -> Result<(), Error> {
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 72d80a6f131e..368167d57863 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -7,6 +7,210 @@
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
 
+/// Private macro to define the [`IoAccess`] functions.
+macro_rules! define_io_access_function {
+    (@read_derived $(#[$attr:meta])* $name_unchecked:ident, $vis:vis $name:ident, $try_vis:vis $try_name:ident, $type_name:ty) => {
+    /// Read data from a given offset known at compile time.
+    ///
+    /// Bound checks are perfomed on compile time, hence if the offset is not known at compile
+    /// time, the build will fail.
+    $(#[$attr])*
+    #[inline]
+    $vis fn $name(&self, offset: usize) -> $type_name {
+        build_assert!(offset_valid::<$type_name>(offset, SIZE));
+
+        // SAFETY: offset checked to be valid above.
+        unsafe { self.$name_unchecked(offset) }
+    }
+
+    /// Read data from a given offset.
+    ///
+    /// Bound checks are performed at runtime, it fails if the offset (plus type size) is
+    /// out of bounds.
+    $(#[$attr])*
+    #[inline]
+    $try_vis fn $try_name(&self, offset: usize) -> Result<$type_name> {
+        if !(offset_valid::<$type_name>(offset, self.maxsize())) {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: offset checked to be valid above.
+        Ok(unsafe { self.$name_unchecked(offset) })
+    }
+    };
+    (@read $(#[$attr:meta])* $name_unchecked:ident, $name:ident, $try_name:ident, $type_name:ty) => {
+    /// Read data from a given offset without doing any bound checks.
+    /// The offset is relative to the base address of Self.
+    ///
+    /// # Safety
+    ///
+    /// The offset has to be valid for self.
+    $(#[$attr])*
+    unsafe fn $name_unchecked(&self, offset: usize) -> $type_name;
+
+    define_io_access_function!(@read_derived $(#[$attr])* $name_unchecked, $name, $try_name, $type_name);
+    };
+    (@read $($(#[$attr:meta])* $name_unchecked:ident, $name:ident, $try_name:ident, $type_name:ty;)+) => {
+    $(
+        define_io_access_function!(@read $(#[$attr])* $name_unchecked, $name, $try_name, $type_name);
+    )*
+    };
+    (@write_derived $(#[$attr:meta])* $name_unchecked:ident, $vis:vis $name:ident, $try_vis:vis $try_name:ident, $type_name:ty) => {
+    /// Write data to a given offset known at compile time.
+    /// Bound checks are performed at compile time, hence if the offset is not known at compile
+    /// time, the build will fail.
+    $(#[$attr])*
+    #[inline]
+    $vis fn $name(&self, value: $type_name, offset: usize) {
+        build_assert!(offset_valid::<$type_name>(offset, SIZE));
+
+        // SAFETY: offset checked to be valid above.
+        unsafe { self.$name_unchecked(value, offset) }
+    }
+
+    /// Write data to a given offset.
+    ///
+    /// Bound checks are performed at runtime, it fails if the offset (plus the type size) is
+    /// out of bounds.
+    $(#[$attr])*
+        #[inline]
+    $try_vis fn $try_name(&self, value: $type_name, offset: usize) -> Result {
+        if !(offset_valid::<$type_name>(offset, self.maxsize())) {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: offset checked to be valid above.
+        Ok(unsafe { self.$name_unchecked(value, offset) })
+    }
+    };
+    (@write $(#[$attr:meta])* $name_unchecked:ident, $name:ident, $try_name:ident, $type_name:ty) => {
+    /// Write data to a given offset without doing any bound checks.
+    /// The offset is relative to the base address of self.
+    ///
+    /// # Safety
+    ///
+    /// The offset has to be valid for Self.
+    $(#[$attr])*
+    unsafe fn $name_unchecked(&self, value: $type_name, offset: usize);
+
+    define_io_access_function!(@write_derived $(#[$attr])* $name_unchecked, $name, $try_name, $type_name);
+    };
+    (@write $($(#[$attr:meta])* $name_unchecked:ident, $name:ident, $try_name:ident, $type_name:ty;)+) => {
+    $(
+        define_io_access_function!(@write $(#[$attr])* $name_unchecked, $name, $try_name, $type_name);
+    )*
+    };
+}
+
+/// Private macro to generate accessor functions that call the correct C functions given as `fn_c`.
+///
+/// This takes either `@read` or `@write` to generate a single read or write accessor function.
+///
+/// This also can take a list of read write pairs to generate both at the same time.
+macro_rules! impl_accessor_fn {
+    (@read $(#[$attr:meta])* $vis:vis $fn_rust:ident, $fn_c:ident, $type_name:ty) => {
+    $(#[$attr])*
+    $vis unsafe fn $fn_rust(&self, offset: usize) -> $type_name {
+        // SAFETY: by the safety requirement of the function `self.addr() + offset` is valid to read
+        // TODO: once MSRV is >= 1.79.0 replace `+` with `unchecked_add`
+        unsafe { bindings::$fn_c((self.addr() + offset) as _) as _ }
+    }
+    };
+    (@write $(#[$attr:meta])* $vis:vis $fn_rust:ident, $fn_c:ident, $type_name:ty) => {
+    $(#[$attr])*
+    $vis unsafe fn $fn_rust(&self, value: $type_name, offset: usize) {
+        // SAFETY:
+        // by the safety requirement of the function `self.addr() + offset` is valid to write
+        // TODO: once MSRV is >= 1.79.0 replace `+` with `unchecked_add`
+        unsafe { bindings::$fn_c(value, (self.addr() + offset) as _) as _ }
+    }
+    };
+    (
+    $(
+        $(#[$attr:meta])*
+        $vis_read:vis $fn_rust_read:ident, $fn_c_read:ident,
+        $vis_write:vis $fn_rust_write:ident, $fn_c_write:ident,
+        $type_name:ty $(;)?
+    )+
+    ) => {
+    $(
+        impl_accessor_fn!(@read $(#[$attr])* $vis_read $fn_rust_read, $fn_c_read, $type_name);
+        impl_accessor_fn!(@write $(#[$attr])* $vis_write $fn_rust_write, $fn_c_write, $type_name);
+    )+
+    };
+}
+
+/// Check if the offset is valid to still support the type U in the given size
+const fn offset_valid<U>(offset: usize, size: usize) -> bool {
+    let type_size = core::mem::size_of::<U>();
+    if let Some(end) = offset.checked_add(type_size) {
+        end <= size && offset % type_size == 0
+    } else {
+        false
+    }
+}
+
+/// Io Access functions.
+///
+/// # Safety
+///
+/// `SIZE` and `maxsize()` has to always be valid to add to the base address.
+pub unsafe trait IoAccess<const SIZE: usize = 0> {
+    /// Returns the maximum size of the accessed IO area.
+    fn maxsize(&self) -> usize;
+
+    /// Returns the base address of the accessed IO area.
+    fn addr(&self) -> usize;
+
+    define_io_access_function!(@read
+        read8_unchecked, read8, try_read8, u8;
+        read16_unchecked, read16, try_read16, u16;
+        read32_unchecked, read32, try_read32, u32;
+    );
+
+    define_io_access_function!(@write
+        write8_unchecked, write8, try_write8, u8;
+        write16_unchecked, write16, try_write16, u16;
+        write32_unchecked, write32, try_write32, u32;
+    );
+}
+
+/// Extending trait of [`IoAccess`] offering 64 bit functions.
+#[cfg(CONFIG_64BIT)]
+pub trait IoAccess64<const SIZE: usize = 0>: IoAccess<SIZE> {
+    define_io_access_function!(@read read64_unchecked, read64, try_read64, u64);
+    define_io_access_function!(@write write64_unchecked, write64, try_write64, u64);
+}
+
+/// Io Relaxed Access functions.
+///
+/// Similar to [`IoAccess`] but using relaxed memory boundries.
+pub trait IoAccessRelaxed<const SIZE: usize = 0>: IoAccess<SIZE> {
+    define_io_access_function!(@read
+        read8_relaxed_unchecked, read8_relaxed, try_read8_relaxed, u8;
+        read16_relaxed_unchecked, read16_relaxed, try_read16_relaxed, u16;
+        read32_relaxed_unchecked, read32_relaxed, try_read32_relaxed, u32;
+    );
+
+    define_io_access_function!(@write
+        write8_relaxed_unchecked, write8_relaxed, try_write8_relaxed, u8;
+        write16_relaxed_unchecked, write16_relaxed, try_write16_relaxed, u16;
+        write32_relaxed_unchecked, write32_relaxed, try_write32_relaxed, u32;
+    );
+}
+
+/// Extending trait of [`IoAccessRelaxed`] offering 64 bit functions.
+#[cfg(CONFIG_64BIT)]
+pub trait IoAccess64Relaxed<const SIZE: usize = 0>: IoAccess<SIZE> {
+    define_io_access_function!(@read
+        read64_relaxed_unchecked, read64_relaxed, try_read64_relaxed, u64;
+    );
+
+    define_io_access_function!(@write
+        write64_relaxed_unchecked, write64_relaxed, try_write64_relaxed, u64;
+    );
+}
+
 /// Raw representation of an MMIO region.
 ///
 /// By itself, the existence of an instance of this structure does not provide any guarantees that
@@ -43,218 +247,88 @@ pub fn maxsize(&self) -> usize {
     }
 }
 
-/// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
+/// IO-mapped memory, starting at the base address [`addr`] and spanning [`maxsize`] bytes.
 ///
 /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
-/// mapping, performing an additional region request etc.
-///
-/// # Invariant
-///
-/// `addr` is the start and `maxsize` the length of valid I/O mapped memory region of size
-/// `maxsize`.
-///
-/// # Examples
-///
-/// ```no_run
-/// # use kernel::{bindings, io::{Io, IoRaw}};
-/// # use core::ops::Deref;
+/// mapping, performing an additional region request, etc.
 ///
-/// // See also [`pci::Bar`] for a real example.
-/// struct IoMem<const SIZE: usize>(IoRaw<SIZE>);
+/// # Invariants
 ///
-/// impl<const SIZE: usize> IoMem<SIZE> {
-///     /// # Safety
-///     ///
-///     /// [`paddr`, `paddr` + `SIZE`) must be a valid MMIO region that is mappable into the CPUs
-///     /// virtual address space.
-///     unsafe fn new(paddr: usize) -> Result<Self>{
-///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
-///         // valid for `ioremap`.
-///         let addr = unsafe { bindings::ioremap(paddr as _, SIZE as _) };
-///         if addr.is_null() {
-///             return Err(ENOMEM);
-///         }
+/// [`addr`] is the start and [`maxsize`] the length of valid I/O mapped memory region of
+/// size [`maxsize`].
 ///
-///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
-///     }
-/// }
+/// [`addr`] is valid to access with the C [`read`]/[`write`] family of functions.
 ///
-/// impl<const SIZE: usize> Drop for IoMem<SIZE> {
-///     fn drop(&mut self) {
-///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
-///         unsafe { bindings::iounmap(self.0.addr() as _); };
-///     }
-/// }
-///
-/// impl<const SIZE: usize> Deref for IoMem<SIZE> {
-///    type Target = Io<SIZE>;
-///
-///    fn deref(&self) -> &Self::Target {
-///         // SAFETY: The memory range stored in `self` has been properly mapped in `Self::new`.
-///         unsafe { Io::from_raw(&self.0) }
-///    }
-/// }
-///
-///# fn no_run() -> Result<(), Error> {
-/// // SAFETY: Invalid usage for example purposes.
-/// let iomem = unsafe { IoMem::<{ core::mem::size_of::<u32>() }>::new(0xBAAAAAAD)? };
-/// iomem.write32(0x42, 0x0);
-/// assert!(iomem.try_write32(0x42, 0x0).is_ok());
-/// assert!(iomem.try_write32(0x42, 0x4).is_err());
-/// # Ok(())
-/// # }
-/// ```
+/// [`addr`]: IoAccess::addr
+/// [`maxsize`]: IoAccess::maxsize
+/// [`read`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+/// [`write`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
 #[repr(transparent)]
 pub struct Io<const SIZE: usize = 0>(IoRaw<SIZE>);
 
-macro_rules! define_read {
-    ($(#[$attr:meta])* $name:ident, $try_name:ident, $c_fn:ident -> $type_name:ty) => {
-        /// Read IO data from a given offset known at compile time.
-        ///
-        /// Bound checks are performed on compile time, hence if the offset is not known at compile
-        /// time, the build will fail.
-        $(#[$attr])*
-        #[inline]
-        pub fn $name(&self, offset: usize) -> $type_name {
-            let addr = self.io_addr_assert::<$type_name>(offset);
-
-            // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
-            unsafe { bindings::$c_fn(addr as _) }
-        }
-
-        /// Read IO data from a given offset.
-        ///
-        /// Bound checks are performed on runtime, it fails if the offset (plus the type size) is
-        /// out of bounds.
-        $(#[$attr])*
-        pub fn $try_name(&self, offset: usize) -> Result<$type_name> {
-            let addr = self.io_addr::<$type_name>(offset)?;
-
-            // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
-            Ok(unsafe { bindings::$c_fn(addr as _) })
-        }
-    };
-}
-
-macro_rules! define_write {
-    ($(#[$attr:meta])* $name:ident, $try_name:ident, $c_fn:ident <- $type_name:ty) => {
-        /// Write IO data from a given offset known at compile time.
-        ///
-        /// Bound checks are performed on compile time, hence if the offset is not known at compile
-        /// time, the build will fail.
-        $(#[$attr])*
-        #[inline]
-        pub fn $name(&self, value: $type_name, offset: usize) {
-            let addr = self.io_addr_assert::<$type_name>(offset);
-
-            // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
-            unsafe { bindings::$c_fn(value, addr as _, ) }
-        }
-
-        /// Write IO data from a given offset.
-        ///
-        /// Bound checks are performed on runtime, it fails if the offset (plus the type size) is
-        /// out of bounds.
-        $(#[$attr])*
-        pub fn $try_name(&self, value: $type_name, offset: usize) -> Result {
-            let addr = self.io_addr::<$type_name>(offset)?;
-
-            // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
-            unsafe { bindings::$c_fn(value, addr as _) }
-            Ok(())
-        }
-    };
-}
-
 impl<const SIZE: usize> Io<SIZE> {
-    /// Converts an `IoRaw` into an `Io` instance, providing the accessors to the MMIO mapping.
+    /// Convert a [`IoRaw`] into an [`MMIo`] instance, providing the accessors to the MMIO mapping.
     ///
     /// # Safety
     ///
-    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of size
-    /// `maxsize`.
-    pub unsafe fn from_raw(raw: &IoRaw<SIZE>) -> &Self {
-        // SAFETY: `Io` is a transparent wrapper around `IoRaw`.
-        unsafe { &*core::ptr::from_ref(raw).cast() }
-    }
-
-    /// Returns the base address of this mapping.
+    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
+    /// size `maxsize`.
     #[inline]
-    pub fn addr(&self) -> usize {
-        self.0.addr()
-    }
-
-    /// Returns the maximum size of this mapping.
-    #[inline]
-    pub fn maxsize(&self) -> usize {
-        self.0.maxsize()
+    pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
+        Self(raw)
     }
 
+    /// Convert a ref to [`IoRaw`] into an [`MMIo`] instance, providing the accessors to the
+    /// MMIo mapping.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
+    /// size `maxsize`.
     #[inline]
-    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
-        let type_size = core::mem::size_of::<U>();
-        if let Some(end) = offset.checked_add(type_size) {
-            end <= size && offset % type_size == 0
-        } else {
-            false
-        }
+    pub unsafe fn from_raw_ref(raw: &IoRaw<SIZE>) -> &Self {
+        // SAFETY: `MMIo` is a transparent wrapper around `IoRaw`.
+        unsafe { &*core::ptr::from_ref(raw).cast() }
     }
+}
 
+// SAFETY: as per invariant `raw` is valid
+unsafe impl<const SIZE: usize> IoAccess<SIZE> for Io<SIZE> {
     #[inline]
-    fn io_addr<U>(&self, offset: usize) -> Result<usize> {
-        if !Self::offset_valid::<U>(offset, self.maxsize()) {
-            return Err(EINVAL);
-        }
-
-        // Probably no need to check, since the safety requirements of `Self::new` guarantee that
-        // this can't overflow.
-        self.addr().checked_add(offset).ok_or(EINVAL)
+    fn maxsize(&self) -> usize {
+        self.0.maxsize()
     }
 
     #[inline]
-    fn io_addr_assert<U>(&self, offset: usize) -> usize {
-        build_assert!(Self::offset_valid::<U>(offset, SIZE));
-
-        self.addr() + offset
+    fn addr(&self) -> usize {
+        self.0.addr()
     }
 
-    define_read!(read8, try_read8, readb -> u8);
-    define_read!(read16, try_read16, readw -> u16);
-    define_read!(read32, try_read32, readl -> u32);
-    define_read!(
-        #[cfg(CONFIG_64BIT)]
-        read64,
-        try_read64,
-        readq -> u64
+    impl_accessor_fn!(
+        read8_unchecked, readb, write8_unchecked, writeb, u8;
+        read16_unchecked, readw, write16_unchecked, writew, u16;
+        read32_unchecked, readl, write32_unchecked, writel, u32;
     );
+}
 
-    define_read!(read8_relaxed, try_read8_relaxed, readb_relaxed -> u8);
-    define_read!(read16_relaxed, try_read16_relaxed, readw_relaxed -> u16);
-    define_read!(read32_relaxed, try_read32_relaxed, readl_relaxed -> u32);
-    define_read!(
-        #[cfg(CONFIG_64BIT)]
-        read64_relaxed,
-        try_read64_relaxed,
-        readq_relaxed -> u64
+#[cfg(CONFIG_64BIT)]
+impl<const SIZE: usize> IoAccess64<SIZE> for Io<SIZE> {
+    impl_accessor_fn!(
+        read64_unchecked, readq, write64_unchecked, writeq, u64;
     );
+}
 
-    define_write!(write8, try_write8, writeb <- u8);
-    define_write!(write16, try_write16, writew <- u16);
-    define_write!(write32, try_write32, writel <- u32);
-    define_write!(
-        #[cfg(CONFIG_64BIT)]
-        write64,
-        try_write64,
-        writeq <- u64
+impl<const SIZE: usize> IoAccessRelaxed<SIZE> for Io<SIZE> {
+    impl_accessor_fn!(
+        read8_relaxed_unchecked, readb_relaxed, write8_relaxed_unchecked, writeb_relaxed, u8;
+        read16_relaxed_unchecked, readw_relaxed, write16_relaxed_unchecked, writew_relaxed, u16;
+        read32_relaxed_unchecked, readl_relaxed, write32_relaxed_unchecked, writel_relaxed, u32;
     );
+}
 
-    define_write!(write8_relaxed, try_write8_relaxed, writeb_relaxed <- u8);
-    define_write!(write16_relaxed, try_write16_relaxed, writew_relaxed <- u16);
-    define_write!(write32_relaxed, try_write32_relaxed, writel_relaxed <- u32);
-    define_write!(
-        #[cfg(CONFIG_64BIT)]
-        write64_relaxed,
-        try_write64_relaxed,
-        writeq_relaxed <- u64
+#[cfg(CONFIG_64BIT)]
+impl<const SIZE: usize> IoAccess64Relaxed<SIZE> for Io<SIZE> {
+    impl_accessor_fn!(
+        read64_relaxed_unchecked, readq_relaxed, write64_relaxed_unchecked, writeq_relaxed, u64;
     );
 }
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index c97d6d470b28..9f5ca22d327a 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -356,7 +356,7 @@ impl<const SIZE: usize> Deref for Bar<SIZE> {
 
     fn deref(&self) -> &Self::Target {
         // SAFETY: By the type invariant of `Self`, the MMIO range in `self.io` is properly mapped.
-        unsafe { Io::from_raw(&self.io) }
+        unsafe { Io::from_raw_ref(&self.io) }
     }
 }
 
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 2bb260aebc9e..a8d292f4c1b3 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -4,7 +4,9 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, c_str, device::Core, devres::Devres, pci, prelude::*, types::ARef};
+use kernel::{
+    bindings, c_str, device::Core, devres::Devres, io::IoAccess, pci, prelude::*, types::ARef,
+};
 
 struct Regs;
 
-- 
2.49.0

