Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471DEAB6950
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 12:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C3510E60D;
	Wed, 14 May 2025 10:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NWwo0XuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1DD89864;
 Wed, 14 May 2025 10:58:49 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-72c27166ab3so4783587a34.1; 
 Wed, 14 May 2025 03:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747220329; x=1747825129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VovI2MJA5yrsgZVuWzhEGgze0o42B0tngXC0Xns04F8=;
 b=NWwo0XuPHAau6ABCQcjeriSATP68RRyBnJP7jWxP42LYfMhWSkCxrfYYGcy/fwQUkX
 59CnobOUTtVm5PT6WE7J57vatFDL0WzMXiYH3SQOauX6ll8p1ozNd68A4OjZyeQFC39V
 4MywVzpoWGLIQtAjbm8HfKOqYlHuJBFhdocLHKpfNfwx+xNNMFcAE38GR3UVQenDILWQ
 xpUI9CqYEMqjG7v6EHugOtKtZIIeiACpn4pSPyhhU0dGuEIIDeZB77gTVCzHs2shm8w2
 UIe1NYFve/UCMQciJgLZSsEwxHxVOd5xY+RkZnnmOi7C/85GlZJnij7Qk2E2B8pNY+d9
 F6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747220329; x=1747825129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VovI2MJA5yrsgZVuWzhEGgze0o42B0tngXC0Xns04F8=;
 b=EqPCEIZQiQtUnHYlebbMjYhAA/GJ/xRcWFYMwaywjxPj7ZgUa5LcALBENmH8RMbXfC
 A8RkkrMJuOtJ7QAFRP9OoUpLcMpKxgPnMKE4ylWuZ0sYNfvTEz3GLBM2jbbMs5e9kR1a
 5rGL+LYJgDcPuExxQlIkEJnhPKkmcl0V6SvnTbD+2ZQPkfJXgB9vLfdGmkGMVKU48Sny
 PKq3Qq48cQl6kOHrVG9+1a+il3FdVXba6V77zaIuN7mmOIl0natEQG5txatmZO8RxxcV
 qfwNf+XEQKOqyX7DRF5VJjcHNLTfpHCqilSqAMp2ecQLc9OUwWnblDgRmD/E94nQIWl6
 Ksqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ10WSFTdhsJ+VNHEpfklNE/EyMx0G5Tk/GXwcEWs0/fNvdHfTwwhS2bTJfRduebRA99Em0lQI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxENWJLQ4fyBf66Ouk40rkc2ggwJltkkq8v5svSxx5McU4fcpfT
 dD2yQ3MFnPcVGXQOrPZzoXb64AsrfHFSeajuw1uNIUjdmZiTEKyK
X-Gm-Gg: ASbGncsCFq8+HBqjjdi14n9NXXmMTWjumJ5+ka8RSiTVmcb9IPxIXkIXQjvFD7XJZAX
 qk+w2dMQj5Sa5Jhcpcgu/oszI2LHM4lnNyNBhuNMh5hs5tT6eRiNuz/Wza29VlsD2up4ZTlX1+G
 mC/0PJRAp4rrJKGHuMEu7rtzjFvVo4bZldBud1thzf5ZtyipAv4omy/EG8KdutcZ+HLSnz31Qy0
 OTZ2qqkE2RdhsuzCkhPSqy1Rma8rav73jnUUnOP4pGJAICR67UjobCIXyaM3Z4egnMfSca675LS
 JkpNxvKVQI5Pt3dSDcmfXPrEZBSOJ56DRDLrrzK91fNQbzP0jzwB3khIboni7s/BFMR2WBlqts+
 +fQZhp3lEAkOLDwrmwsKLNSs=
X-Google-Smtp-Source: AGHT+IGvL6lH6ONZZTZw0JVilpcjbjUVXYPilV66tx5v9oXHgFKQIvgBVSwhNCuPOSNDrDvg0lp6Sw==
X-Received: by 2002:a05:6870:95a3:b0:2d4:c19a:94e5 with SMTP id
 586e51a60fabf-2e34885828emr1280774fac.39.1747220328945; 
 Wed, 14 May 2025 03:58:48 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-2dba060be9esm2654535fac.10.2025.05.14.03.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 03:58:48 -0700 (PDT)
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
Subject: [PATCH v2 4/6] rust: io: implement Debug for IoRaw and add some
 doctests
Date: Wed, 14 May 2025 05:57:32 -0500
Message-ID: <20250514105734.3898411-5-andrewjballance@gmail.com>
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

Implement `Debug` for `kernel::io::IoRaw` which also outputs the const
generic SIZE as a field.

Add some doctests to `IoRaw::new` and `MMIo::from_raw(_ref)`.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/io.rs | 63 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index ce044c155b16..9445451f4b02 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -226,6 +226,33 @@ pub struct IoRaw<const SIZE: usize = 0> {
 
 impl<const SIZE: usize> IoRaw<SIZE> {
     /// Returns a new `IoRaw` instance on success, an error otherwise.
+    ///
+    /// # Examples
+    ///
+    /// Const generic size 0, only allowing runtime checks:
+    /// ```
+    /// use kernel::io::IoRaw;
+    ///
+    /// let raw: IoRaw<0> = IoRaw::new(0xDEADBEEFC0DE, 8).unwrap();
+    /// # assert_eq!(raw.addr(), 0xDEADBEEFC0DE);
+    /// # assert_eq!(raw.maxsize(), 8);
+    /// ```
+    ///
+    /// Const generic size equals maxsize:
+    /// ```
+    /// use kernel::io::IoRaw;
+    ///
+    /// let raw: IoRaw<8> = IoRaw::new(0xDEADBEEFC0DE, 8).unwrap();
+    /// # assert_eq!(raw.addr(), 0xDEADBEEFC0DE);
+    /// # assert_eq!(raw.maxsize(), 8);
+    /// ```
+    ///
+    /// Const generic size bigger then maxsize:
+    /// ```
+    /// use kernel::io::IoRaw;
+    ///
+    /// IoRaw::<16>::new(0xDEADBEEFC0DE, 8).unwrap_err();
+    /// ```
     pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
         if maxsize < SIZE {
             return Err(EINVAL);
@@ -247,6 +274,16 @@ pub fn maxsize(&self) -> usize {
     }
 }
 
+impl<const SIZE: usize> core::fmt::Debug for IoRaw<SIZE> {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        f.debug_struct("IoRaw")
+            .field("SIZE", &SIZE)
+            .field("addr", &self.addr)
+            .field("maxsize", &self.maxsize)
+            .finish()
+    }
+}
+
 /// IO-mapped memory, starting at the base address [`addr`] and spanning [`maxsize`] bytes.
 ///
 /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
@@ -263,6 +300,7 @@ pub fn maxsize(&self) -> usize {
 /// [`maxsize`]: IoAccess::maxsize
 /// [`read`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
 /// [`write`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+#[derive(Debug)]
 #[repr(transparent)]
 pub struct MMIo<const SIZE: usize = 0>(IoRaw<SIZE>);
 
@@ -273,6 +311,18 @@ impl<const SIZE: usize> MMIo<SIZE> {
     ///
     /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
     /// size `maxsize`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, MMIo, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let mmio: MMIo<2> = unsafe { MMIo::from_raw(raw) };
+    /// # assert_eq!(0xDEADBEEFC0DE, mmio.addr());
+    /// # assert_eq!(2, mmio.maxsize());
+    /// ```
     #[inline]
     pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
         Self(raw)
@@ -285,6 +335,18 @@ pub unsafe fn from_raw(raw: IoRaw<SIZE>) -> Self {
     ///
     /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of
     /// size `maxsize`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::io::{IoRaw, MMIo, IoAccess};
+    ///
+    /// let raw = IoRaw::<2>::new(0xDEADBEEFC0DE, 2).unwrap();
+    /// // SAFETY: test, value is not actually written to.
+    /// let mmio: &MMIo<2> = unsafe { MMIo::from_raw_ref(&raw) };
+    /// # assert_eq!(raw.addr(), mmio.addr());
+    /// # assert_eq!(raw.maxsize(), mmio.maxsize());
+    /// ```
     #[inline]
     pub unsafe fn from_raw_ref(raw: &IoRaw<SIZE>) -> &Self {
         // SAFETY: `MMIo` is a transparent wrapper around `IoRaw`.
@@ -349,6 +411,7 @@ impl<const SIZE: usize> IoAccess64Relaxed<SIZE> for MMIo<SIZE> {
 /// [`maxsize`]: IoAccess::maxsize
 /// [`ioread`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
 /// [`iowrite`]: https://docs.kernel.org/driver-api/device-io.html#differences-between-i-o-access-functions
+#[derive(Debug)]
 #[repr(transparent)]
 pub struct Io<const SIZE: usize = 0>(IoRaw<SIZE>);
 
-- 
2.49.0

