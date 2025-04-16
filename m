Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C3A90A11
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3258E10E985;
	Wed, 16 Apr 2025 17:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lg06QeMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D78410E985
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:36:31 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6ecf99dd567so88334296d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744824991; x=1745429791; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s7TG+vcDltz8CEBipYAMc1RYMUDRIBQnjPX3T3cax8U=;
 b=Lg06QeMa2GNeopKKLerDgmC/gbzfIqiOIAvRQHan8XOADgqeGGaoNyPVNzP8q0n9gd
 KXkY7JGbhn2PDA//tR7GKm9T0oWv5ak6uCNbHZr5VLjeSOwrPqUbYTJJ5EKU8nW1KW/Q
 RqPGwrCzhIp2j3VKI/cTckioPBS9fNvLtrtW45j449+gelLRijH7WIuux5/gdJvocw0y
 le45Z/oBazDbIKEatq406mwGSxmOiBYZ0ismHWX0DmhIONTdyPy3nDleE59WlZAunByO
 rl2RN7mOrWcsXoqqn/CX1n6BjipaQy4G52M3e4MifIFEv43J6AeohXLePFinpq4F9zQS
 9bdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744824991; x=1745429791;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7TG+vcDltz8CEBipYAMc1RYMUDRIBQnjPX3T3cax8U=;
 b=K8wsAShJdcrBBu+TpLkQhDDaerXFH4TwgojIQDCaqCg4UUuLpqFK2+hb0SQG7/+FL+
 66++mG2b+uhqa/y1w/8exuGyawNIdOhfdcTAcFeVRTeqBYGVyuTSsCcDqckk9UTMWUEw
 hdV/CiSAbTnCrV3iWXQLwmR365QOQN9q6O16hBiikJP6zwnyONtyb+W69f6ZG+Hd/xmQ
 2YQTSCSlbQRCHIo3JKF6U6TQVIbVMMWFYsm26lKgSmliU4KOiwnvTcBCJhjMvBetQZmF
 0Tpy3Vhp7HeCAyFdnDeBTLVUnQwOSNB36ST6cmb9UJ87pYpgxhAN0b3ZukqrgO6pxNZz
 QkTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0Miw3PxRhq/6wU9QXxiW5Ki51pBOC+eJe0eAmDts/O9zmOlX4vfdkX76fgfH0L6gJpoS++l+0awU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF3b/oGhKg0dDpJWV2TB6MvVtCy9fJJ7jFPIlSgtEfPR5BvZ5x
 mfrFn9obg/XYmB3+8xRcGf1sClPmL8Yl2h4eyz4pB86Mknlj3K4J
X-Gm-Gg: ASbGncvXMdDZEP/FYvsw958nI0vGwbxoebOubUXgtfkmz/H6Xqi1ExDJw4HsCsoLLFa
 oFzHm3i+r7rpfzpLXN6ejNQYY1Q/xlKMymQf1GLP8FzASmUqbHuECPQlR6uzZZzgRalSDdjwcS5
 AKnTZ6QIpAckHWMXC9UJ7yyvnyN3goTA2M2ZnR7boh6E2ZLJOk1yF06eiJrPBruPEA1M+7tpFst
 lvbFchE68tOQuQc0UTHGxvEdD+nJ4xqfq/HAhwE2/zZv5W1rcvXt/Cc+eoryhgSU/eZ5w7/6d0C
 26WUEyl1KDgoGqnzgC+x/fpSB+f8zyKtSx4yYEqb6ZHgWHjYUunFf2ys9B5g2tz73mQaQgO0wj7
 vmfe9PTne3RzzDFGYjiuJq82PTOSS3iNUUnRc+0aUf/Pj
X-Google-Smtp-Source: AGHT+IH+8prI3dnFdzQpvutGIEPNlRoSRgzV8L97yizn7cZYwB5PUjJ/dUipbXxo0463QbPVMzCyTQ==
X-Received: by 2002:ad4:5b83:0:b0:6ed:122c:7da7 with SMTP id
 6a1803df08f44-6f2b2f22f49mr31627676d6.5.1744824990638; 
 Wed, 16 Apr 2025 10:36:30 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:a61d]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f0dea07c50sm118289886d6.77.2025.04.16.10.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 10:36:30 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:36:09 -0400
Subject: [PATCH v9 5/6] rust: enable `clippy::cast_lossless` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-ptr-as-ptr-v9-5-18ec29b1b1f3@gmail.com>
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
In-Reply-To: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
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

