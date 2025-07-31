Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3CB17423
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04A410E7BE;
	Thu, 31 Jul 2025 15:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rYNIg5RZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2426E10E7BE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:49:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2FE75C309E;
 Thu, 31 Jul 2025 15:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE135C4CEEF;
 Thu, 31 Jul 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753976986;
 bh=2foXzLUbcLlOFhsxqoB4OFU/K2Gw1RJLAqLvJ8zuC4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rYNIg5RZY61hQko6uvctqhWsnSpHp/10vuTOBp1HVYI9OR9oy826wUPat+pdZ0jSa
 7u6UYmFaVk8HpPIaOzSAwG/2XbWOajAg/a2ta3QBg6arjea28wY9RwSB0O6G8dpBmy
 0a01GUaKlbeqpmf5xnyuem64iykjbTd1ttOfz90+4DUDZkjBIiMqzLji3NkP9gTmNn
 NqYb6san8e5ve5bsMAGZ1MUvhHvY0IbinNvsgvK39m+kXxYGjU68T3bVnUPLTybCDA
 PSHJwtwMQfk7HJlGRiwJaMR55n50lG28R+FRz5JHLp8HtniDl6w2085N/KuDEQsbuY
 1c6GJsHbNd/hA==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/4] rust: drm: remove pin annotations from drm::Device
Date: Thu, 31 Jul 2025 17:48:08 +0200
Message-ID: <20250731154919.4132-4-dakr@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250731154919.4132-1-dakr@kernel.org>
References: <20250731154919.4132-1-dakr@kernel.org>
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

The #[pin_data] and #[pin] annotations are not necessary for
drm::Device, since we don't use any pin-init macros, but only
__pinned_init() on the impl PinInit<T::Data, Error> argument of
drm::Device::new().

Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index d19410deaf6c..d0a9528121f1 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -54,10 +54,8 @@ macro_rules! drm_legacy_fields {
 ///
 /// `self.dev` is a valid instance of a `struct device`.
 #[repr(C)]
-#[pin_data]
 pub struct Device<T: drm::Driver> {
     dev: Opaque<bindings::drm_device>,
-    #[pin]
     data: T::Data,
 }
 
-- 
2.50.0

