Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28FCD5FA1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 13:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183A110E02D;
	Mon, 22 Dec 2025 12:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oeuu0RAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B768210E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 12:27:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0EB516001D;
 Mon, 22 Dec 2025 12:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70F2C4CEF1;
 Mon, 22 Dec 2025 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766406450;
 bh=Bg+e+HQ4cRkKotTSX3tjMcafuwqhVP/2UOvsWMi0MDI=;
 h=From:Date:Subject:To:Cc:From;
 b=oeuu0RAIJ14nW4aWOiI09TYcBvmUAHDsLgZzv1zM0r9VUgp4RN1XolRTUPKydE35b
 YbFoVn1f9e9i19mdY+A65dmkf6vAZPi7zCtdz+qd63ppFiaKPLGsVGo23MP+iBtuBm
 5ROg8qiSGwZSrhjZHNp9FDXC+S+1PWarrO7bpzLFFYGz5ifD3zq0iuMIoJmjqdSvgi
 v8IMrxLoSnqCf6LBvSDk+9JTpWU+EtwTYj5Q0E4IIDopez8Iv1+4+2I9IHQ8xdgVvb
 6FuvxhRFNlIqNF9DH+LCyQFyUMwIyrhmVSBSWpQhHaLeiVjy+dhZtwUs/ndRlmxFP+
 zg6tppDVhqErA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:27:24 +0100
Subject: [PATCH] rust: drm: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3eTikiLdksoiXWPz1FRLU3NLgzTTNCWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQB+io+KbAAAAA==
X-Change-ID: 20251222-cstr-tyr-37ee95790f5f
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406446; l=2827;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=9wuud1uxU6Hw+XPxPoxP1et4t5hmYtUFfAqhx+rUr34=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOnCdC34Q4v7RknJNH32e4uHOpbkVJ4wn/wDInRmCvFX6RlqzOYX/Lc02+ao8XIHVQIOfkKXMG3
 gbEy5xjxxlgM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/tyr/driver.rs | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..65405f365fec 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use kernel::c_str;
 use kernel::clk::Clk;
 use kernel::clk::OptionalClk;
 use kernel::device::Bound;
@@ -91,8 +90,8 @@ fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     MODULE_OF_TABLE,
     <TyrDriver as platform::Driver>::IdInfo,
     [
-        (of::DeviceId::new(c_str!("rockchip,rk3588-mali")), ()),
-        (of::DeviceId::new(c_str!("arm,mali-valhall-csf")), ())
+        (of::DeviceId::new(c"rockchip,rk3588-mali"), ()),
+        (of::DeviceId::new(c"arm,mali-valhall-csf"), ())
     ]
 );
 
@@ -104,16 +103,16 @@ fn probe(
         pdev: &platform::Device<Core>,
         _info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
-        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
-        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
-        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
+        let core_clk = Clk::get(pdev.as_ref(), Some(c"core"))?;
+        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c"stacks"))?;
+        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c"coregroup"))?;
 
         core_clk.prepare_enable()?;
         stacks_clk.prepare_enable()?;
         coregroup_clk.prepare_enable()?;
 
-        let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
-        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
+        let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"mali")?;
+        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
 
         let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
         let iomem = Arc::pin_init(request.iomap_sized::<SZ_2M>(), GFP_KERNEL)?;
@@ -174,8 +173,8 @@ fn drop(self: Pin<&mut Self>) {
     major: 1,
     minor: 5,
     patchlevel: 0,
-    name: c_str!("panthor"),
-    desc: c_str!("ARM Mali Tyr DRM driver"),
+    name: c"panthor",
+    desc: c"ARM Mali Tyr DRM driver",
 };
 
 #[vtable]

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-tyr-37ee95790f5f

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

