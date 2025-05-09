Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0BDAB08A8
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F006410E260;
	Fri,  9 May 2025 03:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kd9x5J9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C879210E260;
 Fri,  9 May 2025 03:16:39 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-400fa6b3012so1805823b6e.1; 
 Thu, 08 May 2025 20:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760599; x=1747365399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FpcyogW9Sb9XRTvTc38KDvi+cUlELYSGH7PdgFznfY=;
 b=Kd9x5J9ZHG30Q6GFVM0xki61+ICdzK4cTUOgCsTlQcLLR6bu6HlLGjma8shwpQ93it
 sygtbVMt7LcV7ufUb9reiVMS/a7T5EPvzzBWvVbxSrxFhGtg0AHhBcrUBENsk3KJu1J2
 VSg4OCAbAYE9Ubuoh+2wMNR4/vWkU6qvGMLVuIHMx/w8t9LPhR+66Hcec1fvGCAVnMl7
 FxpItntJZrJ0Mpcu0IuPB/NQXZQhUjCqgy6rS0Y/10ICYaRQlkKu5OB/e3JkIMstXa6J
 f/ArJFSwTYYeup68rsgxZmvsQ3SOGFmC4F1smbi7WGNLEwALEvgqBapJtHApW0tDol/b
 2kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760599; x=1747365399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3FpcyogW9Sb9XRTvTc38KDvi+cUlELYSGH7PdgFznfY=;
 b=hJpC2Bg0hhWGFLMbroLJVikHDlV76dD2tQrn+ExZ0I/DU+lZgtcDuPXFIBEDADx8sG
 +dRfLX45EReI6ePHwYvq6zH3rEHZ+czj+ymkzDNsz3F5gaudedtNA4jCcXY2pGaaDJY5
 2tYl3WPBTCC9vuYQ5uEMX7Xn5MuwHoxBUklvfL6U9K3Uk5pJSF57GZ7+UBDQ2D8b0Yvr
 f0hPo1rT3LFyKc79chz6zpLrNiVwkcg9hn3Tgx/1cXNRP1zwFTmQlnXfhr0GjPGy1jnB
 leJc5kD+H+Bp7ki1SVTzD4vKDlQmBtBoRPpfF/VWgfG1rxcG5b0qiWAx2F1LAn2070sR
 7LZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm+8GF3MRuwAWb+qLGEJvCPo4jgal5LdiRFub5rKl6Efvhctsf2FxsAClBxQjrCBWQqBAaye09wM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxfxsmgy3qYTDfEbsfjrpNVc4LTot5VzvosoD9CmUfvmEcqAZzB
 lsrPnfOYNpcSof2gQnKAJ/+AkTMdxURpWlqX1BfVj81dxwcWPRbo
X-Gm-Gg: ASbGnct4veX6orQ0CJVBgMrF5vUUQyIM+H0y8O8d/EtGKmGzaYsfer8byE3tlVXjQ4c
 wb8MS45TENeZmVAJlP1/idYYTyIV24jRVMPc9LoH2q80Uxv7kBOyq5D9iZEg5mSsGJM92KFfoPK
 B0+ZE4hSirq8XR0K3gXJJ9ZnJFCaEXSQip2uvQPucvlP2bvoVIKyo7GNKcC/1nnlFJO2WjbBCgG
 3uMaikSRu5R9h38N3cvcby8+KTTU++EymAhfgKqFY+hlI0mKEl2ZTVNzotBrUF/7GLkUU7pWVw8
 p0k2IMR/6UXsbuuAlDru43E9qp+t4Pkvbh13CowKb3V3SV1DxIrtYCY0RrW3y55DkYSYoyeg3X1
 DWN2F14F+Ombl
X-Google-Smtp-Source: AGHT+IEdxh2dCg5/We4vy5v5IiaPgW7LzfgjZM2joNSLRFy6xgWXUoJM6ruSZQvFAiSMKyUdL2wbnQ==
X-Received: by 2002:a05:6808:d53:b0:3f9:176a:3958 with SMTP id
 5614622812f47-40377983b84mr3290641b6e.11.1746760598943; 
 Thu, 08 May 2025 20:16:38 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:38 -0700 (PDT)
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
Subject: [PATCH 05/11] rust: io: add new Io type
Date: Thu,  8 May 2025 22:15:18 -0500
Message-ID: <20250509031524.2604087-6-andrewjballance@gmail.com>
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

adds a new Io type that uses the C ioread/iowrite family of functions
and implements the IoAccess trait for it.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/helpers/io.c |  8 +++++
 rust/kernel/io.rs | 86 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index d439b61c672e..11c0c34f2eba 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -71,3 +71,11 @@ define_rust_pio_read_helper(inl, u32);
 define_rust_pio_write_helper(outb, u8);
 define_rust_pio_write_helper(outw, u16);
 define_rust_pio_write_helper(outl, u32);
+
+define_rust_mmio_read_helper(ioread8, u8);
+define_rust_mmio_read_helper(ioread16, u16);
+define_rust_mmio_read_helper(ioread32, u32);
+
+define_rust_mmio_write_helper(iowrite8, u8);
+define_rust_mmio_write_helper(iowrite16, u16);
+define_rust_mmio_write_helper(iowrite32, u32);
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 70621a016a87..3d8b6e731ce7 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -483,3 +483,89 @@ fn addr(&self) -> usize {
         read32_unchecked, inl, write32_unchecked, outl, u32;
     );
 }
+
+/// Io that can be either PortIo or MMIo,
+/// starting at the base address [`addr`] and spanning [`maxsize`] bytes.
+///
+/// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
+/// mapping, performing an additional region request, etc.
+///
+/// # Invariants
+///
+/// [`addr`] is the start and [`maxsize`] the length of a valid io region of size [`maxsize`].
+///
+/// [`addr`] is valid to access with the C [`ioread`]/[`iowrite`] family of functions.
+///
+/// [`addr`]: IoAccess::addr
+/// [`maxsize`]: IoAccess::maxsize
+/// [`ioread`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+/// [`iowrite`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+#[derive(Debug)]
+#[repr(transparent)]
+pub struct Io<const SIZE: usize = 0>(IoRaw<SIZE>);
+
+impl<const SIZE: usize> Io<SIZE> {
+    /// Convert a [`IoRaw`] into an [`Io`] instance, providing the accessors to the
+    /// Io mapping.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `addr` is the start of a valid I/O region of size `maxsize`.
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, Io, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let io: Io<2> = unsafe { Io::from_raw(raw) };
+    /// # assert_eq!(0xDEADBEEFC0DE, io.addr());
+    /// # assert_eq!(2, io.maxsize());
+    /// ```
+    pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
+        Self(raw)
+    }
+
+    /// Convert a ref to [`IoRaw`] into an [`Io`] instance, providing the accessors to
+    /// the Io mapping.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
+    /// size `maxsize`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, Io, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let io: &Io<2> = unsafe { Io::from_raw_ref(&raw) };
+    /// # assert_eq!(raw.addr(), io.addr());
+    /// # assert_eq!(raw.maxsize(), io.maxsize());
+    /// ```
+    #[inline]
+    pub unsafe fn from_raw_ref(raw: &IoRaw<SIZE>) -> &Self {
+        // SAFETY: `Io` is a transparent wrapper around `IoRaw`.
+        unsafe { &*core::ptr::from_ref(raw).cast() }
+    }
+}
+
+// SAFETY: as per invariant `raw` is valid
+unsafe impl<const SIZE: usize> IoAccess<SIZE> for Io<SIZE> {
+    #[inline]
+    fn addr(&self) -> usize {
+        self.0.addr()
+    }
+
+    #[inline]
+    fn maxsize(&self) -> usize {
+        self.0.maxsize()
+    }
+
+    impl_accessor_fn!(
+        read8_unchecked, ioread8, write8_unchecked, iowrite8, u8;
+        read16_unchecked, ioread16, write16_unchecked, iowrite16, u16;
+        read32_unchecked, ioread32, write32_unchecked, iowrite32, u32;
+    );
+}
-- 
2.49.0

