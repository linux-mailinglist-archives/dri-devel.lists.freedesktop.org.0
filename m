Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35571AB6951
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 12:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9622510E60E;
	Wed, 14 May 2025 10:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OzdN5ODU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8217910E60D;
 Wed, 14 May 2025 10:58:51 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-72c13802133so1952477a34.3; 
 Wed, 14 May 2025 03:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747220331; x=1747825131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1MHzNKHnQubokyBvFDPePXlfvpf87qUBVJo47Tv4gY=;
 b=OzdN5ODU1B2PW3c0CJq0E+VJNGgmCiGZqZsbuKdWx86dkak5cFq3FlXH8hFSwdEsQJ
 ukDjkeW4MYvr7nF8gohe4W1AASrcV1nmQPACGSHIfxJyRFgKXp4imKD/xR7uNCYS+/Ei
 O4wBfrBe1ZjkClGlwzwgRbs9bV0EVrF5+NanH3GQZhynN9nrYSxcDPeeJ5cQGSy2MLcB
 eezz9hpRpypmwwgJV02oWl7tmuodVoicgOIupYDxa/prGUNCdM3NIWbeDiAJoy+RXMk8
 /nptYDSHn8efHZPVG+aQG9Q3GT/qnsnors8J7FpmDOI4MhJd6JKmAJF0q5iyVxHsb0Ut
 IdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747220331; x=1747825131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1MHzNKHnQubokyBvFDPePXlfvpf87qUBVJo47Tv4gY=;
 b=WbA7iaYzztmcXIXpe1W66NaG+BflskXq+/p3SmPh5EDTNGfuAB+TrkT+5wg6H9/Ahr
 ZOJVPtuG79AKrKzZvAxEiTi0KwiJ9+YCKAUJo0kRi2s5enh2egcz/9PpQFoP9esTjjPJ
 jaJ8hnDRSlfNbhJYb5SUifAUV8+wAiPIF84vZPKy+RXlAGAwxrVbVv7jaE9LjzxQs3Bb
 sRKdb4DaCPwmyAoO9meiMbgI2pKc0NkM3wMppmUuIVhw7y5F+++jDRIga7JTkNUbZysx
 dDe3e5hwSBYMd0dkiOPAcFHjj5m8jIcXAD/ypzajGR4mwktUl/1gZnmwgd3plZNXaNmf
 t1+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm0578VbhG1xEJnd2Tc9XmINhV9dfzJrRJa0l0Zi386DNbER3Aj4QR4Bhc5CVi4MhX5Vdf/LAv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4Q3CrbntSXFKkWHueGGJC6QBbgPE5bs9s981xQcGMkfz/LOJR
 +Xx6Cxb3+7VgceI2KXk2tFOwtHNW1Am0ei0QJX6osEG1iaX8DQ+v
X-Gm-Gg: ASbGnctsHjAhYhTfnPjHbS8RlxW5DNH+qe/6OhCvnV0aqp1OvjzqUn/03fg7QYXNgyx
 LeaaMxYl7MbnAkm3BE1lkJ6fg1ZDRxI97k5bguHA1nDFfcRJuXvPl7kkbXpXDH7aaCmtibTAzdL
 koJtF6xUta9ci1+VqnDdbOdwQFMa4DkWabFmDHMwF6SRVQ6nmeoIgyUiObyhMwAYC+iK2lNmSMB
 SwFtwEgaFdbDQCYxfPmSmDUUrUIu9KtC45W6H1lGm3OeyNStA5Eli0cMzrll5QRmBrTJIXVRCJu
 L9z2gaPufYqDit5cSGvJBupATbv3jN2en2bioieZh1jGKyebxqrpI/+yeu7aljzCFBT0dZlR1wN
 7pGEvlXvy0wo+wX42Q8DtUeM=
X-Google-Smtp-Source: AGHT+IEvmuwiWZKjw7O4HiUgZ9VtQ/B2bT9Vp8sHqWzneblXp8y9RdB4sfskbtrUucD6vPheSQTSNw==
X-Received: by 2002:a05:6870:5251:b0:2c2:4e19:1cdf with SMTP id
 586e51a60fabf-2e3488110b8mr1366100fac.25.1747220330682; 
 Wed, 14 May 2025 03:58:50 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-2dba060be9esm2654535fac.10.2025.05.14.03.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 03:58:50 -0700 (PDT)
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
Subject: [PATCH v2 5/6] rust: io: add from_raw_cookie functions
Date: Wed, 14 May 2025 05:57:33 -0500
Message-ID: <20250514105734.3898411-6-andrewjballance@gmail.com>
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

adds a `from_raw_cookie` function to the IoAccess trait.

`from_raw_cookie` attempts to convert a iomem address that can be
accessed by the ioread/iowrite family of C functions into either
a `Io` or `MMIo`.

This is done so that devices that know what type of Io they are at
compile time can give a hint about their type.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/io.rs | 73 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 9445451f4b02..81b26602d3bc 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -6,6 +6,47 @@
 
 use crate::error::{code::EINVAL, Result};
 use crate::{bindings, build_assert};
+use io_backend::*;
+
+/// `io_backend` is private and implements the config specific logic for
+/// `IoAccess::from_raw_cookie`.
+#[cfg(all(CONFIG_X86, CONFIG_GENERIC_IOMAP))]
+mod io_backend {
+    // if on x86, generic_iomap is enabled so copy the logic
+    // from IO_COND in `lib/iomap.c`
+
+    // values copied from `lib/iomap.c`
+    const PIO_OFFSET: usize = 0x10000;
+    const PIO_RESERVED: usize = 0x40000;
+
+    #[inline]
+    pub(super) fn is_mmio(addr: usize) -> bool {
+        addr >= PIO_RESERVED
+    }
+
+    #[inline]
+    pub(super) fn is_portio(addr: usize) -> bool {
+        !is_mmio(addr) && addr > PIO_OFFSET
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
+}
 
 /// Private macro to define the [`IoAccess`] functions.
 macro_rules! define_io_access_function {
@@ -162,6 +203,14 @@ pub unsafe trait IoAccess<const SIZE: usize = 0> {
     /// Returns the base address of the accessed IO area.
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
@@ -366,6 +415,18 @@ fn addr(&self) -> usize {
         self.0.addr()
     }
 
+    unsafe fn from_raw_cookie(raw: IoRaw<SIZE>) -> Result<Self>
+    where
+        Self: Sized,
+    {
+        if is_mmio(raw.addr()) {
+            // INVARIANT: `addr` is checked so it should be ok to access with read/write
+            Ok(Self(raw))
+        } else {
+            Err(EINVAL)
+        }
+    }
+
     impl_accessor_fn!(
         read8_unchecked, readb, write8_unchecked, writeb, u8;
         read16_unchecked, readw, write16_unchecked, writew, u16;
@@ -474,6 +535,18 @@ fn maxsize(&self) -> usize {
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

