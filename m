Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D8C7E058
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4785010E164;
	Sun, 23 Nov 2025 11:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HDrxsLs0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAE510E0C0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:26:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2984dfae043so29918145ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763889973; x=1764494773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+x/h+SXCaTPKwxrPZvI12zlFOq5qesnIaQFOZDdW/8=;
 b=HDrxsLs0oqpggoznGcXVxnscqavMD9g4xnAKfGagqV6Zsmpnpyvudsm/ZUclcevLBU
 2EBO5DiGI4rE5HS3qxmDb0GyGIhPYclzQrsAF9JxNKCWABWLMEqbOIkw0BU8jZrfZcue
 xm0Vb073muaSwnikeHoRmH0W7CTIVnkkeU7fkgW0CmB2luYXqi/VvVX0q5kzRAfawsYc
 A2/5ZSDmcYAPV5j5xlWyRhQ4ZNTjannYmTV6Y8h3pwb7KBwugK8ZpjRCc6K5KWY00aab
 KkNOt0mZRKArZNiDavLzv0gudjnEcKWACSHOUqcVpf4O/XhM22vjzD2iq6U7fbOYo6bb
 zX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763889973; x=1764494773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c+x/h+SXCaTPKwxrPZvI12zlFOq5qesnIaQFOZDdW/8=;
 b=KErVLl1xgZDlJbuSsFJqHv1gZPV8riJErztFZ2pjxpaYJ3zdY6d9dY0HKIKiQlGR0w
 7Ic5IdM9fQnylJPemoP5oBvHhd6I+c+XAyxpBYyRj0kbql+90IzUrNA97z6xElgaU2j1
 pQChHzFP9u7mX2rFZ5YnMefTkIDjCk7lJefv3G6XFT5VC143B6MkggHGniHbEn8/2oLe
 eT0FOgLhR6FfAHTsOnKICWhcRELL/9yEPQOgh/JxLR6ySXPmS9dNdJL+abQl2IruUQZu
 cf2GiZHXaQGaof3TVQokrbPXRM29gLLuR+wtyuO73uo76Sx6bI3DMR4B2qCuQTcPN8B4
 qNiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+J6iZFT+jLEg4Ldn/NgR4fjpBgUlm4ffNn6l0cgg1KBRMw4a1LP7R9I00E4jRxXPvVrjZJpaL6fU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfZagcrsrcTkHt9jzfO+R64vLHE7cWdrOCy6521C5x8uVm/kw8
 N+39YQ6BXCmIUmRtKGg9s1LTwVuZwTZWIyiORFtb2loSyp5DN+lSle2w
X-Gm-Gg: ASbGnctyJ1zGaFlIc1Y8UC4gFhPo8jiT3QctCEweREFbZjF/tvNHUlOZAqkCvmbfum8
 CLPR++K4uFghPX4GnK/BaSMtwQ/6YPle+IMrCvuariAY/I5FXzamBSInZImLb9eHIBZUaaBOM5X
 L9f4/E5Kjn/njkj8P91trxhnUxlt8Z/myJpHIQ7YB6C+qWJN98VDBVW1ZHZJQe8Q8Qg3Erq/9lv
 QvlpZwXB1ok7B7x7Kh/mr+z6QZTPxW/shcRB62GSDKGtxXjcBNPKzDrC7sBhTgBcI2oLFw7TYrg
 bVkT6RYQuHOECmEJx3GOfFdARtZf8hUUhQu8VrzOVXUishyCHgP9n+lkSG719meF28If+aR8ft2
 EVoWbrMx7EyaPW4RBkSpayKAuHOMzjLUfLdk4NM4fOwdwuBP5Wv9w8P7W3FFAh3nkNljdbShics
 bT1Ttxrfi5rA7hWBvtaojd06Omdw==
X-Google-Smtp-Source: AGHT+IFvuN898s0PRn7IHqlJzrCusouHL8HLAX1/JMZBn/PsKfoSrrGmFHNZ/OFvx15QZ7pZgA79MQ==
X-Received: by 2002:a17:903:3c30:b0:298:8a9:766a with SMTP id
 d9443c01a7336-29b6c6b2e57mr86965995ad.53.1763889973533; 
 Sun, 23 Nov 2025 01:26:13 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:26:13 -0800 (PST)
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
Subject: [PATCH 03/10] rust: device: Update ARef and AlwaysRefCounted imports
 from sync::aref
Date: Sun, 23 Nov 2025 14:54:31 +0530
Message-Id: <20251123092438.182251-4-shankari.ak0208@gmail.com>
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

Update call sites to import `ARef` and `AlwaysRefCounted`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/device.rs          | 4 ++--
 rust/kernel/device/property.rs | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe3..21bde8d95185 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -158,7 +158,7 @@
 /// `bindings::device::release` is valid to be called from any thread, hence `ARef<Device>` can be
 /// dropped from any thread.
 ///
-/// [`AlwaysRefCounted`]: kernel::types::AlwaysRefCounted
+/// [`AlwaysRefCounted`]: kernel::sync::aref::AlwaysRefCounted
 /// [`impl_device_context_deref`]: kernel::impl_device_context_deref
 /// [`pci::Device`]: kernel::pci::Device
 /// [`platform::Device`]: kernel::platform::Device
@@ -540,7 +540,7 @@ pub trait DeviceContext: private::Sealed {}
 /// [`Device<Normal>`]. It is the only [`DeviceContext`] for which it is valid to implement
 /// [`AlwaysRefCounted`] for.
 ///
-/// [`AlwaysRefCounted`]: kernel::types::AlwaysRefCounted
+/// [`AlwaysRefCounted`]: kernel::sync::aref::AlwaysRefCounted
 pub struct Normal;
 
 /// The [`Core`] context is the context of a bus specific device when it appears as argument of
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 3a332a8c53a9..413221817ef1 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -14,7 +14,8 @@
     fmt,
     prelude::*,
     str::{CStr, CString},
-    types::{ARef, Opaque},
+    sync::aref::ARef,
+    types::Opaque,
 };
 
 /// A reference-counted fwnode_handle.
@@ -359,7 +360,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for FwNode {
+unsafe impl crate::sync::aref::AlwaysRefCounted for FwNode {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the
         // refcount is non-zero.
-- 
2.34.1

