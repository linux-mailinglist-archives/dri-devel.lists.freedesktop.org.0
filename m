Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84489C7E03A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF4D10E143;
	Sun, 23 Nov 2025 11:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZOKeQWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6E010E126
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:26:40 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-297ef378069so30256755ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890000; x=1764494800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HepyoJQ30V+nS3WwhUyswnLGOzdzEO2vo/wcuCFozBE=;
 b=BZOKeQWcsWH11eONe6ZMqf9RE3O47mR6s5vW86ZTrBRcnFNezbr8glK80+6/SsFYR8
 0CgH64W8e4hfJFknuUz4yv6yDi0t8AEJfG8qqXXFhPJSOwNErSkf1iho3QHViQRejXRw
 kCpSpDSz4mWvbcWWkNYNTyT19su+oTehXD2IXAKVwGZE4LZFEKQCULZXXJSN5XKiK4V1
 KUvB7wZC4asv/OiU82qaF3TObovS3C6epq3XjMlNiuWqIVbHxW9S48ohjqAuhzCwsKNd
 zbpbgHt9zrqVZvoUS66vFFqi3/ENCV8rr2Nd1a0NDcmguODOqaApJrXCEaoY2DFLXlDT
 ScHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890000; x=1764494800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HepyoJQ30V+nS3WwhUyswnLGOzdzEO2vo/wcuCFozBE=;
 b=YX2rslNxRhOLl5wwAaer9RmB/Pun95yRAiW63DRTYk/AwXoWDKQjdPLjMS+e5lmeNh
 IHN3MFjgAYoJ8+ytCWC9tolDyacz92i5PiElrUGXebagvMTbQOtIcE6kr2O4PcGy20HH
 YIVA8UXwm+aRHHX/Y4Pj/MH+3PZfbwuqg2lwIa21juSMYry8ze0NLVpwQsNYfkLbi4W2
 WldQd3bLM7fl/+UKCkWsoWhDf4KXT0jpU9cTaXDxKrq9sTR88m9lR0r1Bsk3C2Qk6r43
 oNPrEDC4opNLM0Om8wk2uAwYdnuhASYchF/29UzB66v8qm+XEyvknOfTvQipLebmbOEY
 oJtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfxO6leIatDHnqEhjIcX+7OjtxE3P6D2Sv0v7mkVsvzzi5cAiNZ7tPexYIiWwn7tlm8bgLRRxAk+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRZBNeTb7CvkXqzTu2Xu+0GIuquT8Y7j4DRKkgEqDqkqj6+akn
 VAZwPo0RmGLANG2o7mnQv3CWj5Vl4tys6EjoAoF+ySC/i4K7BlA22Iyh
X-Gm-Gg: ASbGncuLvx/0yF2yyhFxEI0F7F/8y0ohTgNZ3LKk5KUAyFjQqpudeUwD/0px0GH/2yo
 8OD7eQ8NrISaxhS/hGfEiUiJjS2xJ0cg6jJzl8KZxmfnls4XRDa83rpEPHWRPw3w6OiM3kNhw4f
 uGZmLC47iEz9Da5p8aFGlX3EiFkfwqBgbSeSj1psYSsBaFHWJo0SRiOJuTR3dVQOHi7cImXLLY5
 fl3sp8QbwTDu7swd3JmFdjK69FWzbSlW8hsWh5tBTNx4GLSEsqHQbx80Dk8GWSd+6PeEozsG+wz
 sC22C/ML9zoTKZTJjFC/wRXYi8JV6A06xIWSFcGXezYtEIT6k5YfSfpqYxMfkAo00zDbaxi2rDa
 LnY7oB/d6ak92/vd4vIrXwZSjeuN/YPWEPOCm0kPJkTzADTeB679FkZUDp3zB/ynme7ef6NdQEe
 OKAZKHnkd3hSaOdpHQjQsju+AHMg==
X-Google-Smtp-Source: AGHT+IHnc+TnFjT4Ewq3NCmcVSOlFxFcCR7lWrTNRkJuldxiSn0BMR95iGNmXPyBh157L0RjhglO7g==
X-Received: by 2002:a17:903:2c06:b0:295:6427:87d4 with SMTP id
 d9443c01a7336-29b6bf77fedmr93037125ad.50.1763890000307; 
 Sun, 23 Nov 2025 01:26:40 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:26:39 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted imports
 to use sync::aref
Date: Sun, 23 Nov 2025 14:54:33 +0530
Message-Id: <20251123092438.182251-6-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 23 Nov 2025 11:28:20 +0000
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

Update call sites in `i2c.rs` to import `ARef` and
`AlwaysRefCounted` from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/i2c.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 1aee46f59460..c50ca464d87c 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -17,10 +17,8 @@
     of,
     prelude::*,
     str::CStrExt as _,
-    types::{
-        AlwaysRefCounted,
-        Opaque, //
-    }, //
+    sync::aref::AlwaysRefCounted,
+    types::Opaque, //
 };
 
 use core::{
@@ -32,7 +30,7 @@
     }, //
 };
 
-use kernel::types::ARef;
+use kernel::sync::aref::ARef;
 
 /// An I2C device id table.
 #[repr(transparent)]
@@ -408,7 +406,7 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 kernel::impl_device_context_into_aref!(I2cAdapter);
 
 // SAFETY: Instances of `I2cAdapter` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
+unsafe impl crate::sync::aref::AlwaysRefCounted for I2cAdapter {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::i2c_get_adapter(self.index()) };
-- 
2.34.1

