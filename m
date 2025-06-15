Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB393ADA3C5
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4109D10E246;
	Sun, 15 Jun 2025 20:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h9wc6N6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6010E248;
 Sun, 15 Jun 2025 20:55:22 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6fac1c60e19so51741006d6.1; 
 Sun, 15 Jun 2025 13:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750020921; x=1750625721; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EzIO770K3BEzT6LTWkTmJxAe6XJ7JYWo5FVTqpGa1qI=;
 b=h9wc6N6ik7pUDqvE+tLWflZN7A4OelJfW52/Tfd3edN44rjqyy8NrP7FXmzkeaQVDY
 cc51A00XX7xU2dLHGZ1jlnkNNhIaFJTWL2gdUwdK7D0YivpVwSVra71BXJVbrMclLH7x
 m0o3q7r5Ul4M0XC81WYL3p/hbMQAfxgHg6ScxUXPqp8y52IhjxXzk6tXQT7Dc2+lSDoR
 UTFirtT1Zw06XRD7CaMNYmMb1llhh8I9LKsSHo0rpcUEc+TdfQWdWpCMSjSKpvVwVSko
 7B1DDiBiyCgIak4XLIJbk3ovyiSKzueLt2A/7Vx/x1J6H1PI7fP3Y77/Ylib02r4AR23
 hUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750020921; x=1750625721;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzIO770K3BEzT6LTWkTmJxAe6XJ7JYWo5FVTqpGa1qI=;
 b=R01VrOcAH66loGR99Hw6wvHQIqSTPAlDS59byXfjUENRfp4Wp4RxU49lg7zc+Xzizd
 BQ16SpTtG9xildMy+Nac+wvwxulhekX7CFIXinzlESHLmIBZgkZuVJEQz+XAAb/DrAL8
 +3KSvSq7wdC415FWgpMxAEFxkcLA/tTE8GeNGkcKnpmSMH0OeqX6YUZjRV5+VNxE6AoZ
 4jaAOQUO5Uied9S1VSgoWOhnMvo4rBuklWKRNP6veIx69b4Q6F5vusaPoTH20iU2vij2
 QcNxJJkJIHmfHiKrmaBG+PoZpIANjsZ+UNINvQlu2d6t4avJS65kQWruBS2Bz+ijSYHY
 Tjeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU31L2TX1b39b8Bz2Y2fH6LsYCQOTYHN5M7z6TzubdCDfm5P3RcHRf7lFhTl58F27EQTinTZOA7CJw=@lists.freedesktop.org,
 AJvYcCV0XYlBzL7/giqgBzc7J/rkZS98SatSLtXRWTaSh+DMu8k1xzbkuZq6rvEszkHLWefrJ+Kh1EUT2g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjzqR+ST6SJ5B+rf1Va+QGBOPjdgLVPkr9+HciDrpz0tYTTGYK
 3joXcE5x9IiO2E961xloH0HCoXWr4U2OI1ukK/u6uDX5kjcBuKW0eg3y
X-Gm-Gg: ASbGnct3L0yCVtnM+io74q8Et0Vc0BxqVWd2EOWO/SzZvyQzENaR3dcUjEWhgelodnG
 lMo3vORBwo2FHjwdAGgN63WHGVaNUR95TuKEMrsiV9NZPdCy11GLkWCB/AKA+brsmAVN7VE1Csd
 ZEwB5yKSgCzuu+PdRTjJCRsDrePzFElJWsd23A4oCMCNml90cQLf0dStYediStpOB8VgrQCZLAN
 vVcg/soqwwuZMk1FL4D7NtWz+7cXVbAu8NFGzZ/KdTnWuKsP2oZXSITTJHNXiW1f1+668Kl+uSi
 mahwGdFTuuQYv4mOHWeosF/wtwTNAPZhpoaXJFVx8HG1TPoz33QSCyFL2G4Sp/z+i5Q6Ww==
X-Google-Smtp-Source: AGHT+IHuJ5ATyUdQgk4pt9BONn4x9zspwvV+2Gm1qDCe2qRdxVwp1sIbazWwdq/xR0732z5MemwTXw==
X-Received: by 2002:a05:6214:2529:b0:6fa:b467:aa67 with SMTP id
 6a1803df08f44-6fb45c26e75mr137361606d6.20.1750020921472; 
 Sun, 15 Jun 2025 13:55:21 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:b0c6:92db:d807:21a6])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fb35c84148sm43468176d6.109.2025.06.15.13.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 13:55:21 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 15 Jun 2025 16:55:09 -0400
Subject: [PATCH v12 5/6] rust: enable `clippy::cast_lossless` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com>
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Tamir Duberstein <tamird@gmail.com>, Benno Lossin <lossin@kernel.org>
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
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                             | 1 +
 drivers/gpu/drm/drm_panic_qr.rs      | 4 ++--
 drivers/gpu/nova-core/regs.rs        | 2 +-
 drivers/gpu/nova-core/regs/macros.rs | 2 +-
 rust/bindings/lib.rs                 | 1 +
 rust/kernel/net/phy.rs               | 4 ++--
 rust/uapi/lib.rs                     | 1 +
 7 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 0ba22c361de8..29cf39be14de 100644
--- a/Makefile
+++ b/Makefile
@@ -481,6 +481,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::all \
 			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::as_underscore \
+			    -Wclippy::cast_lossless \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index dd55b1cb764d..6b59d19ab631 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -404,7 +404,7 @@ fn pop3(&mut self) -> Option<(u16, usize)> {
             let mut out = 0;
             let mut exp = 1;
             for i in 0..poplen {
-                out += self.decimals[self.len + i] as u16 * exp;
+                out += u16::from(self.decimals[self.len + i]) * exp;
                 exp *= 10;
             }
             Some((out, NUM_CHARS_BITS[poplen]))
@@ -425,7 +425,7 @@ fn next(&mut self) -> Option<Self::Item> {
         match self.segment {
             Segment::Binary(data) => {
                 if self.offset < data.len() {
-                    let byte = data[self.offset] as u16;
+                    let byte = u16::from(data[self.offset]);
                     self.offset += 1;
                     Some((byte, 8))
                 } else {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5a1273230306..c1cb6d4c49ee 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -32,7 +32,7 @@ pub(crate) fn architecture(self) -> Result<Architecture> {
     pub(crate) fn chipset(self) -> Result<Chipset> {
         self.architecture()
             .map(|arch| {
-                ((arch as u32) << Self::IMPLEMENTATION.len()) | self.implementation() as u32
+                ((arch as u32) << Self::IMPLEMENTATION.len()) | u32::from(self.implementation())
             })
             .and_then(Chipset::try_from)
     }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 7ecc70efb3cd..6851af8b5885 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -264,7 +264,7 @@ pub(crate) fn $field(self) -> $res_type {
         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = ((value as u32) << SHIFT) & MASK;
+            let value = (u32::from(value) << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
 
             self
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 81b6c7aa4916..7631c9f6708d 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -25,6 +25,7 @@
 )]
 
 #[allow(dead_code)]
+#[allow(clippy::cast_lossless)]
 #[allow(clippy::ptr_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 32ea43ece646..65ac4d59ad77 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -142,7 +142,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
         // SAFETY: The struct invariant ensures that we may access
         // this field without additional synchronization.
         let bit_field = unsafe { &(*self.0.get())._bitfield_1 };
-        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE as u64
+        bit_field.get(13, 1) == u64::from(bindings::AUTONEG_ENABLE)
     }
 
     /// Gets the current auto-negotiation state.
@@ -427,7 +427,7 @@ impl<T: Driver> Adapter<T> {
         // where we hold `phy_device->lock`, so the accessors on
         // `Device` are okay to call.
         let dev = unsafe { Device::from_raw(phydev) };
-        T::match_phy_device(dev) as i32
+        T::match_phy_device(dev).into()
     }
 
     /// # Safety
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index e79a1f49f055..08e68ebef606 100644
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

