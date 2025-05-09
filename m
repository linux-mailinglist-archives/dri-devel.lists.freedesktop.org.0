Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC4AB08AB
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066E010E259;
	Fri,  9 May 2025 03:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ExtqgSu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B3010E259;
 Fri,  9 May 2025 03:16:49 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-6066c02cd92so854141eaf.2; 
 Thu, 08 May 2025 20:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760609; x=1747365409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbkkJzcTB85B47ipbpD9VdSKYv1GM7nCZHJmyoTnoXo=;
 b=ExtqgSu6Bu19z9RTIaFkqMmlXAL+D8sK9z17KtcQhH19cGjkooGKueE8wEDZPRYm3p
 6yZnnUpOHB1sBDGPZ9VubWs1cyBUwMG6OPnHGdQrH8YIlc4dWVgcn8SAXPgoNrIPz7Kh
 +tNIUx5pzQFXGWPVzaIc3PU/35DpLWyq6jUJwB0ZYVcey3bEuUSHGJGREv3dYQ1lUdvR
 JoOoYXr2eTIXte2R3FyodcUdHEwudr6se2hkPUmYLtHxCMV6prGYazAqcTxE6Y6zq9sG
 1tdCz5vZM57OjLi/KGEQvJxA0XrIjCSpJ5O/7B+9O1+d+LWBcTWGtf5JBz+DeeRpv6Pl
 7qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760609; x=1747365409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbkkJzcTB85B47ipbpD9VdSKYv1GM7nCZHJmyoTnoXo=;
 b=d+7daVfH9Ly8gjjlrRYn31WEna2RzkfoSwf9ndpfporOsBfHSHKgHW98Sc9aExC5rv
 T7SlYnD6KtCJrxV59TKsMFTloB5YYYREbgLq8Suxu8SGoik109vPCmaX2HYusSbqGja6
 oD3yDw9U/AMHBsTzQlWmOuHRQ3vl+n8U86EjN3IHOhle5b7hYcyYNOUNeZ7hAqIqw8T9
 euSSUUjswvdpT4YRPbBhC9O+FjI5+AIyFFR0OzrHT165NZGP0AqvHLG329duxr+NTjwc
 nwSfy3nZRANqvr2dgYSrrXM05Gy4UwK+Qcg2WkMRDvr1Ax14bw10nHRU3mUWP884J8wQ
 TKsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL+6Nfa2En5vyFArAyZVOj8l4/vG/8vXMWJCCALjg7FhiKMdUxFltIVnHWlAGp83oN9KjLk1R1DB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOlPS8QAW1Ov0o4xjK12vJiz/BAuruDR2o5GzG5kKLhPPzK01T
 EcKNvpwCkiiy6qumLfXVSMfMKdFFn6bQghMhUaSgROHTo9eV8299
X-Gm-Gg: ASbGnctL4P89nXzddqIXMm52VqZPANhkcdz6ir7zRC7XAZvR1cFcLhgE7B2jthOcGqr
 BHPewSdwOlqPTIkT2a3y6TDyX5JGReCAa1PwjSJ3Y2mHkJJ89KYLT7yanVwRVlHEbW2RAaQTxhN
 boHzyDeY/duUuvhK+7JI1zalSu6aN6oPBIUifYUATUWZaOuoTOBObDKiMY0gUuYtG6LmTI/IhbN
 9TgDOqVsZ0SAENmo55vwNObwqXjaq5ZaYgJ8phxOuLrsK7lCx14lEY5dcpA5pWVuQEIPV7GghFG
 qKku+w/X2Bg0aEQ1B9spFh7BIKAN+5ZzWbZV+jeBF5SfD2GiWIQeBawaosCWpjO7LQvtiNNbodK
 fRSbHZM93IG1h
X-Google-Smtp-Source: AGHT+IGNqzdeadesIZwP1nYllqucukQIsSdIN+MQ3j6qsOcvk9hRsdNngAFQNCc+hQwb1HZg7HwUpQ==
X-Received: by 2002:a05:6820:983:b0:604:ae66:1e9b with SMTP id
 006d021491bc7-6084c118041mr1122514eaf.8.1746760609172; 
 Thu, 08 May 2025 20:16:49 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:48 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 andrewjballance@gmail.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 07/11] rust: io: add from_raw_cookie functions
Date: Thu,  8 May 2025 22:15:20 -0500
Message-ID: <20250509031524.2604087-8-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509031524.2604087-1-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
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

adds a `from_raw_cookie` function to the IoAccess trait.

`from_raw_cookie` attempts to convert a iomem address that can be
accessed by the ioread/iowrite family of C functions into either
a `Io`, `PortIo` or `MMIo`.

This is done so that devices that know what type of Io they are at
compile time can give a hint about their type.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/io.rs | 104 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 3d8b6e731ce7..30892f2909a6 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -6,6 +6,62 @@
 
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
+use io_backend::*;
+
+/// `io_backend` is private and implements the config specific logic for
+/// `IoAccess::from_raw_cookie`.
+#[cfg(CONFIG_GENERIC_IOMAP)]
+mod io_backend {
+    // if generic_iomap is enabled copy the logic from IO_COND in `lib/iomap.c`
+
+    #[inline]
+    pub(super) fn is_mmio(addr: usize) -> bool {
+        addr >= bindings::PIO_RESERVED as usize
+    }
+
+    #[inline]
+    pub(super) fn is_portio(addr: usize) -> bool {
+        !is_mmio(addr) && addr > bindings::PIO_OFFSET as usize
+    }
+
+    #[inline]
+    pub(super) fn cookie_to_pio(addr: usize) -> usize {
+        addr & bindings::PIO_MASK as usize
+    }
+
+    #[inline]
+    pub(super) fn cookie_to_mmio(cookie: usize) -> usize {
+        cookie
+    }
+}
+#[cfg(not(CONFIG_GENERIC_IOMAP))]
+mod io_backend {
+    // for everyone who does not use generic iomap
+    // except for alpha and parisc, neither of which has a rust compiler,
+    // ioread/iowrite is defined in `include/asm-generic/io.h`.
+    //
+    // for these ioread/iowrite, maps to read/write.
+    // so allow any io to be converted  because they use the same backend
+    #[inline]
+    pub(super) fn is_mmio(_addr: usize) -> bool {
+        true
+    }
+
+    #[inline]
+    pub(super) fn is_portio(_addr: usize) -> bool {
+        false
+    }
+
+    #[inline]
+    pub(super) fn cookie_to_pio(cookie: usize) -> usize {
+        cookie
+    }
+
+    #[inline]
+    pub(super) fn cookie_to_mmio(cookie: usize) -> usize {
+        cookie
+    }
+}
 
 /// Private macro to define the [`IoAccess`] functions.
 macro_rules! define_io_access_function {
@@ -160,8 +216,18 @@ pub unsafe trait IoAccess<const SIZE: usize = 0> {
     fn maxsize(&self) -> usize;
 
     /// Returns the base address of the accessed IO area.
+    /// if `self` was created by ['from_raw_cookie'], `addr` might not be equal to the original
+    /// address.
     fn addr(&self) -> usize;
 
+    /// Attempts to create a `Self` from a [`IoRaw`].
+    ///
+    /// # Safety
+    /// `raw` should be a io cookie that can be accessed by the C `ioread`/`iowrite` functions
+    unsafe fn from_raw_cookie(raw: IoRaw<SIZE>) -> Result<Self>
+    where
+        Self: Sized;
+
     define_io_access_function!(@read
         read8_unchecked, read8, try_read8, u8;
         read16_unchecked, read16, try_read16, u16;
@@ -367,6 +433,19 @@ fn addr(&self) -> usize {
         self.0.addr()
     }
 
+    unsafe fn from_raw_cookie(mut raw: IoRaw<SIZE>) -> Result<Self>
+    where
+        Self: Sized,
+    {
+        if is_mmio(raw.addr()) {
+            // INVARIANT: `addr` is decoded so it should be ok to access with read/write
+            raw.addr = cookie_to_mmio(raw.addr());
+            Ok(Self(raw))
+        } else {
+            Err(EINVAL)
+        }
+    }
+
     impl_accessor_fn!(
         read8_unchecked, readb, write8_unchecked, writeb, u8;
         read16_unchecked, readw, write16_unchecked, writew, u16;
@@ -476,6 +555,19 @@ fn addr(&self) -> usize {
         self.0.addr()
     }
 
+    unsafe fn from_raw_cookie(mut raw: IoRaw<SIZE>) -> Result<Self>
+    where
+        Self: Sized,
+    {
+        if is_portio(raw.addr()) {
+            // INVARIANT: `addr` is decoded so it should be ok to access with in/out
+            raw.addr = cookie_to_pio(raw.addr());
+            Ok(Self(raw))
+        } else {
+            Err(EINVAL)
+        }
+    }
+
     #[rustfmt::skip]
     impl_accessor_fn!(
         read8_unchecked, inb, write8_unchecked, outb, u8;
@@ -563,6 +655,18 @@ fn maxsize(&self) -> usize {
         self.0.maxsize()
     }
 
+    unsafe fn from_raw_cookie(raw: IoRaw<SIZE>) -> Result<Self>
+    where
+        Self: Sized,
+    {
+        if is_mmio(raw.addr()) || is_portio(raw.addr()) {
+            // INVARIANT: `addr` is not touched so it should be able to be read with ioread/iowrite
+            Ok(Self(raw))
+        } else {
+            Err(EINVAL)
+        }
+    }
+
     impl_accessor_fn!(
         read8_unchecked, ioread8, write8_unchecked, iowrite8, u8;
         read16_unchecked, ioread16, write16_unchecked, iowrite16, u16;
-- 
2.49.0

