Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D061AB08A5
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B7E10E256;
	Fri,  9 May 2025 03:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxV5PPVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0356610E256;
 Fri,  9 May 2025 03:16:32 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-400fa6b3012so1805773b6e.1; 
 Thu, 08 May 2025 20:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760592; x=1747365392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEeMgcY7CYzVQOcJ2HEG+ye7cxvF4gydVYotaASGE1A=;
 b=bxV5PPVXaZpp4Ia1UKhkVVtJCIZqx2dQ7c2K/dJYZk6u31Yg65q+e9jclE5xyyhxh1
 iL6SYIIKcsvLLfaxjFZjl79YeTgaAkU9vwBbIWj7T0t7Ao5w0Devuj6QYIbN2d4ks7kO
 ciFDBTQHPDBUWk0Zg9tiHf3Rupx3WpXD87K0leGwDd3YZk/a652gDNjT0LUN67ytG84T
 FjUgvuxmkcZ5MHXG9z2a9ylbweGdYDAoC9WvreSLKOFBymaV+lGPZwIcunxZdHs54zMr
 Hw7jABR823xHtP5Hu7yPc4JUXV3V4UZEENf0tz7VUmnwGc19e5wRARGDSxTa5fRpFSsr
 zUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760592; x=1747365392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mEeMgcY7CYzVQOcJ2HEG+ye7cxvF4gydVYotaASGE1A=;
 b=hHp9Sgo75vMTi29d4ZYSYH5vApsjhzy5Gm+q81QW4egu/sDkCnolbzRBGvciVuEB3i
 38QXxBz/sLLWGiRaGxzMzjnTsoL2Pm/5zwxJza5kaN24xNWck7+/l/Sh4y60Jf49jIqO
 qnNnvOp44aJY50GI1mVCTaSLHpVVuibArqXjjA9VvzHIDz2vH3dDIliIhbQL6I4wUoBS
 WnGu+wIc2nqBauEf/ux8PcZv1YHTaCluDo6cKCqWRvUfhtvKCzqFjKfBoAyqMoqy+W+Q
 QCrklzQ/q7Pb28YOLDQxSEDYJRmwCsJkRSSIitrxqPJ/FN8gR5W0XXPOnYKqL1z2rQCS
 Lnsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxWn5wG2TODLKpDEHf9+LpKDBf6h6qHukv6UJkvsTsz15w7IabDdtKmHeVBlAZfKJh55Za3s3u4H0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKFRmhETEzqMCx1vZ3NET1vfMc3hsLwSJQZw1v+mWoFfXAFq67
 RtrXibthMabiKIOhAB4bt3Te7zDWRS1mZRPYIFU0JHa8cP3Hr6O2
X-Gm-Gg: ASbGncvKvrjHRpgIiJEEkc7pv4/8kpuLYa9ld/J9BNrgvIBP/0sRu5inOMznMvtA06r
 q5ptM4TIV+bsdJhe/FQzRpogKUToB+MFsPhf3dgKq50ScAetBKjULfddQWBqEKs1ldOSTX2XgJn
 gxHvLISu21ovOCxaywJzIWB/CznbB3m0cjLY1pq2I1O/+Im29ONDVdfudD7yNNqqbqxSPFMy28Q
 0exbcrEoxcTYulOlF0yKfUFkW2H/egEPU3YydUJMj+nT/miJf08ZjjiMKn4/cepeHQQJFnzEYSb
 fWuxi8rQ8J3zBnDl09oi+hvLH8JtcYUVNCvhfmvNh1DPMM3ePoGASST2X793+IvkDHwrPwU8v6C
 iWNiWwWMsc/IS
X-Google-Smtp-Source: AGHT+IG8QbL+NPZYYdJCHgbrLTq9vuR0ixK0ZuhhY5hEZoDmBaManE/qEIbt3DqDYTrXPyiE44aSCA==
X-Received: by 2002:a05:6808:309f:b0:400:d71c:ca26 with SMTP id
 5614622812f47-40377957cf1mr3404635b6e.7.1746760592041; 
 Thu, 08 May 2025 20:16:32 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:31 -0700 (PDT)
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
Subject: [PATCH 04/11] rust: io: add PortIo
Date: Thu,  8 May 2025 22:15:17 -0500
Message-ID: <20250509031524.2604087-5-andrewjballance@gmail.com>
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

From: Fiona Behrens <me@kloenk.dev>

Add `rust::io::PortIo` implementing the `IoAccess` trait.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/helpers/io.c | 20 +++++++++++
 rust/kernel/io.rs | 88 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 525af02f209e..d439b61c672e 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -51,3 +51,23 @@ define_rust_mmio_write_helper(writel_relaxed, u32);
 #ifdef CONFIG_64BIT
 define_rust_mmio_write_helper(writeq_relaxed, u64);
 #endif
+
+#define define_rust_pio_read_helper(name, type)     \
+	type rust_helper_##name(unsigned long port) \
+	{                                           \
+		return name(port);                  \
+	}
+
+#define define_rust_pio_write_helper(name, type)                \
+	void rust_helper_##name(type value, unsigned long port) \
+	{                                                       \
+		name(value, port);                              \
+	}
+
+define_rust_pio_read_helper(inb, u8);
+define_rust_pio_read_helper(inw, u16);
+define_rust_pio_read_helper(inl, u32);
+
+define_rust_pio_write_helper(outb, u8);
+define_rust_pio_write_helper(outw, u16);
+define_rust_pio_write_helper(outl, u32);
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 09440dd3e73b..70621a016a87 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -395,3 +395,91 @@ impl<const SIZE: usize> IoAccess64Relaxed<SIZE> for MMIo<SIZE> {
         read64_relaxed_unchecked, readq_relaxed, write64_relaxed_unchecked, writeq_relaxed, u64;
     );
 }
+
+/// Port-IO, starting at the base address [`addr`] and spanning [`maxsize`] bytes.
+///
+/// The creator is responsible for performing an additional region request, etc.
+///
+/// # Invariants
+///
+/// [`addr`] is the start and [`maxsize`] the length of a valid port io region of size [`maxsize`].
+///
+/// [`addr`] is valid to access with the C [`in`]/[`out`] family of functions.
+///
+/// [`addr`]: IoAccess::addr
+/// [`maxsize`]: IoAccess::maxsize
+/// [`in`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+/// [`out`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+#[derive(Debug)]
+#[repr(transparent)]
+pub struct PortIo<const SIZE: usize = 0>(IoRaw<SIZE>);
+
+impl<const SIZE: usize> PortIo<SIZE> {
+    /// Convert a [`IoRaw`] into an [`PortIo`] instance, providing the accessors to the
+    /// PortIo mapping.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `addr` is the start of a valid Port I/O region of size `maxsize`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, PortIo, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let pio: PortIo<2> = unsafe { PortIo::from_raw(raw) };
+    /// # assert_eq!(0xDEADBEEFC0DE, pio.addr());
+    /// # assert_eq!(2, pio.maxsize());
+    /// ```
+    #[inline]
+    pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
+        Self(raw)
+    }
+
+    /// Convert a ref to [`IoRaw`] into an [`PortIo`] instance, providing the accessors to
+    /// the PortIo mapping.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
+    /// size `maxsize`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, PortIo, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let pio: &PortIo<2> = unsafe { PortIo::from_raw_ref(&raw) };
+    /// # assert_eq!(raw.addr(), pio.addr());
+    /// # assert_eq!(raw.maxsize(), pio.maxsize());
+    /// ```
+    #[inline]
+    pub unsafe fn from_raw_ref(raw: &IoRaw<SIZE>) -> &Self {
+        // SAFETY: `PortIo` is a transparent wrapper around `IoRaw`.
+        unsafe { &*core::ptr::from_ref(raw).cast() }
+    }
+}
+
+// SAFETY: as per invariant `raw` is valid
+unsafe impl<const SIZE: usize> IoAccess<SIZE> for PortIo<SIZE> {
+    #[inline]
+    fn maxsize(&self) -> usize {
+        self.0.maxsize()
+    }
+
+    #[inline]
+    fn addr(&self) -> usize {
+        self.0.addr()
+    }
+
+    #[rustfmt::skip]
+    impl_accessor_fn!(
+        read8_unchecked, inb, write8_unchecked, outb, u8;
+        read16_unchecked, inw, write16_unchecked, outw, u16;
+        read32_unchecked, inl, write32_unchecked, outl, u32;
+    );
+}
-- 
2.49.0

