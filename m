Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CECCFE7C0
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EBC10E5F0;
	Wed,  7 Jan 2026 15:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WbxUGimf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A4410E5F0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767798608;
 bh=90di0w1PwxPIRzuSClWm8hTlTurueeQPrjHhHA1IgeE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WbxUGimfzP1F2xdrdKe/4cd+wlHBTKhKTGbIJq3+nq4YJ2hsGZfl7PcRgQ4RGiBs1
 dtSuohh7qCBvMt0aJuuvXZfkQTiaG4QDZ9nx9ak+XP+t/JRMwRc+9iCl5jI/diqDNK
 dLqasMDWtpSjOnCaPPPKpS/agyuMomX7YkrtoFWONOXCLUgvmzyl/n8cmA2SJNpkX5
 GeJSvxuSN4GhvqLeXEOdJnjSEcxCU0LxaUjx+hQSbqBzrZrppwCiz9bvJBwLCAFWiX
 w/tYrDOBR7aAWG6Ydn2+yoQJp0lXhTUYV09eF92e5fEmZ7M1Y81NwfByPFfBig9Pzy
 dv/MMlIrcuw8A==
Received: from [192.168.0.79] (unknown
 [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 75C9117E1529;
 Wed,  7 Jan 2026 16:10:04 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 07 Jan 2026 12:09:53 -0300
Subject: [PATCH v3 2/3] rust: clk: add devres-managed clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-clk-type-state-v3-2-77d3e3ee59c2@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
In-Reply-To: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3
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

The clk API allows fine-grained control, but some drivers might be
more interested in a "set and forget" API.

Expand the current API to support this. The clock will automatically be
disabled, unprepared and freed when the device is unbound from the bus
without further intervention by the driver.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/clk.rs | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 6323b40dc7ba..e840e7c20af7 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -95,6 +95,49 @@ impl Sealed for super::Prepared {}
         impl Sealed for super::Enabled {}
     }
 
+    /// Obtains and enables a [`devres`]-managed [`Clk`] for a bound device.
+    ///
+    /// [`devres`]: crate::devres::Devres
+    pub fn devm_enable(dev: &Device<Bound>, name: Option<&CStr>) -> Result {
+        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
+
+        // SAFETY: It is safe to call [`devm_clk_get_enabled`] with a valid
+        // device pointer.
+        from_err_ptr(unsafe { bindings::devm_clk_get_enabled(dev.as_raw(), name) })?;
+        Ok(())
+    }
+
+    /// Obtains and enables a [`devres`]-managed [`Clk`] for a bound device.
+    ///
+    /// This does not print any error messages if the clock is not found.
+    ///
+    /// [`devres`]: crate::devres::Devres
+    pub fn devm_enable_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result {
+        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
+
+        // SAFETY: It is safe to call [`devm_clk_get_optional_enabled`] with a
+        // valid device pointer.
+        from_err_ptr(unsafe { bindings::devm_clk_get_optional_enabled(dev.as_raw(), name) })?;
+        Ok(())
+    }
+
+    /// Same as [`devm_enable_optional`], but also sets the rate.
+    pub fn devm_enable_optional_with_rate(
+        dev: &Device,
+        name: Option<&CStr>,
+        rate: Hertz,
+    ) -> Result {
+        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
+
+        // SAFETY: It is safe to call
+        // [`devm_clk_get_optional_enabled_with_rate`] with a valid device
+        // pointer.
+        from_err_ptr(unsafe {
+            bindings::devm_clk_get_optional_enabled_with_rate(dev.as_raw(), name, rate.as_hz())
+        })?;
+        Ok(())
+    }
+
     /// A trait representing the different states that a [`Clk`] can be in.
     pub trait ClkState: private::Sealed {
         /// Whether the clock should be disabled when dropped.

-- 
2.52.0

