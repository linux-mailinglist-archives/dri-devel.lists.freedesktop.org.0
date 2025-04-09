Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC5FA8287A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAB210E921;
	Wed,  9 Apr 2025 14:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mTmpW/a9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C0210E921
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 14:47:35 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4769f3e19a9so46342971cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744210055; x=1744814855; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s7TG+vcDltz8CEBipYAMc1RYMUDRIBQnjPX3T3cax8U=;
 b=mTmpW/a9zxZWPmO2khI8PucggRI11vQ0WJl6hKNMXD+m8X6yoxlg8Wn0HvDmZnNfEU
 FEOS4fc2+7Y2ydeYrLw7J6fSZfgI4DqrE9bXhhuAvWFhRPdlgkECHpok5Xb/cbAEiewS
 JVQDin+YYOLyOkS5+yopN5yBqKmDW0WdtargZPS3KpbWHuQMzocxxz+Dlo9iUOLibuaz
 QgrZthMDe0AXg67jCGpE9NQrAX32lzCP6C4nrjXsFCxuBiHjl0rFuYGw/HhXUZnLr25C
 HJCXc9cy4ArlmqJK058WaWNqQZmCF1kkAWiJwX/lpwxmw/p/s2cBHjl4x9OzeaAoN4CP
 R9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744210055; x=1744814855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7TG+vcDltz8CEBipYAMc1RYMUDRIBQnjPX3T3cax8U=;
 b=wJ3Y4iSP3dnTg6/hF3JpZs1QgPLw+BbAJtVjb/ZTZ2LcbeAhAm2QqjBZS6NX65kFZm
 Wnzyi3Zw+DbPfzV8eZelRhcV//ljB8iHSp3027oue4Kvpt9mFULR9RWC08ZCZsthB+mr
 L6x4yIejaO1LznthTRLhAH7P4ZkW/DAcyiDnUjEN52x8lzvwOP5Fbk3O6XPSUmV1UdgZ
 v3mWKrmMV+qA92G36ZinL+h76xG9YZZmu4ZKT1Ga1lS8n0V9J5mpCk3BR6Ryt6vD44w/
 xPnWmumvo0FTzp7sX9dqsveN8m6wC4GsADVGHvdVLP4OFNksfvM+XMJWKEGlDN5Myo1Z
 YsGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV14Des4t7BK50iZlj8xSdwHC2kyBwQlNPFHFJwk/Xe/maLFDKPLtUNDnaASH09nKV/oK22nYdBkkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZtmcSX1uObFKF6E8oD58OUpGk6Tv7cgUKmNHuWrAqXDTicM5n
 09TwgijuwrCPemfx2UDuXzaxcCBkRAaRCRn9TQjB+6z5vk6WRin6
X-Gm-Gg: ASbGncteyxQ5uy74VZI5YD1IPJRPJUkZe3UjxBteVXA7GeTE3t/pKN4HDbWY0uYSF6m
 Lp7WRjmx1mmWMS8WqrZ3XuVzcJgpxadTRx6n53dv1sHa9agsmdNeE7Hqhcwh3Vy2VT6xO0GWbWz
 4Y32wX0d7Nu4cHEzCD9vd7OD9uj3g92cROeq6UVyuhJ2imjwN58hVeaJJdBNNKGfsyQwqaAz40g
 b0P6eo9WtTb4WjlLEviTlhW9WtyOr0Ff7m/HA7Ll7yURnhgwvyAuSyLPnQ2qVIksXQwqff3IQQU
 JoM8B0WvHPdGivCBKM55x8ludtkqWgRFcXQLNzp5xPiz2TTPFFgrxohuAQu51Gg8c4mZ55zA6IT
 GM5tfIyp66nuwa26tuuqkQkxLQoO/94Ak8x4oQv+SP6pn
X-Google-Smtp-Source: AGHT+IFjhdP44pb3CStlgR2qF4sOpfTRrfshVqxXF0+mnIO0RFcA4QHnh6zvrwC0E40Xwzs6eqjRtQ==
X-Received: by 2002:ac8:7f10:0:b0:477:6e6a:7cfe with SMTP id
 d75a77b69052e-4795f1e2b9emr40301301cf.0.1744210054669; 
 Wed, 09 Apr 2025 07:47:34 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:3298]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47964eb9a8fsm8024461cf.49.2025.04.09.07.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 07:47:33 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Apr 2025 10:47:22 -0400
Subject: [PATCH v8 5/6] rust: enable `clippy::cast_lossless` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-ptr-as-ptr-v8-5-3738061534ef@gmail.com>
References: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
In-Reply-To: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:

> Rust’s `as` keyword will perform many kinds of conversions, including
> silently lossy conversions. Conversion functions such as `i32::from`
> will only perform lossless conversions. Using the conversion functions
> prevents conversions from becoming silently lossy if the input types
> ever change, and makes it clear for people reading the code that the
> conversion is lossless.

While this doesn't eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize.  It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless [1]
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://lore.kernel.org/all/D8ORTXSUTKGL.1KOJAGBM8F8TN@proton.me/
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        | 1 +
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 rust/bindings/lib.rs            | 1 +
 rust/kernel/net/phy.rs          | 4 ++--
 rust/uapi/lib.rs                | 1 +
 5 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 57080a64913f..eb5a942241a2 100644
--- a/Makefile
+++ b/Makefile
@@ -476,6 +476,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::all \
 			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::as_underscore \
+			    -Wclippy::cast_lossless \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index f2a99681b998..d28e8f199d11 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -386,7 +386,7 @@ fn next(&mut self) -> Option<Self::Item> {
         match self.segment {
             Segment::Binary(data) => {
                 if self.offset < data.len() {
-                    let byte = data[self.offset] as u16;
+                    let byte = data[self.offset].into();
                     self.offset += 1;
                     Some((byte, 8))
                 } else {
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 0486a32ed314..b105a0d899cc 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -25,6 +25,7 @@
 )]
 
 #[allow(dead_code)]
+#[allow(clippy::cast_lossless)]
 #[allow(clippy::ptr_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 mod bindings_raw {
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index a59469c785e3..abc58b4d1bf4 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -142,7 +142,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
         // SAFETY: The struct invariant ensures that we may access
         // this field without additional synchronization.
         let bit_field = unsafe { &(*self.0.get())._bitfield_1 };
-        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE as u64
+        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE.into()
     }
 
     /// Gets the current auto-negotiation state.
@@ -426,7 +426,7 @@ impl<T: Driver> Adapter<T> {
         // where we hold `phy_device->lock`, so the accessors on
         // `Device` are okay to call.
         let dev = unsafe { Device::from_raw(phydev) };
-        T::match_phy_device(dev) as i32
+        T::match_phy_device(dev).into()
     }
 
     /// # Safety
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index f03b7aead35a..d5dab4dfabec 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -14,6 +14,7 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     clippy::all,
+    clippy::cast_lossless,
     clippy::ptr_as_ptr,
     clippy::undocumented_unsafe_blocks,
     dead_code,

-- 
2.49.0

