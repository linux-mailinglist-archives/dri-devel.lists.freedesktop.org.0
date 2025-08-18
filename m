Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED2B298C3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 07:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9A510E34C;
	Mon, 18 Aug 2025 05:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="JXyeTlKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894E310E34C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 05:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1755493500; x=1755752700;
 bh=UjQiz3Kpr7q5iwDraf2GEwSkdsiJM+pzbU3XsyPCAkY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=JXyeTlKgUx3F69ISeKbeN4vDDBjoqGIlMmfpHeI+DGc59x9fxaIwvwZHwSljNO+rV
 V3dXDfwIUIkOxnGPZDUMEDpuBjxflys4UkcG2p6UJl3j4nbvmoCGG8T7ncGWUnvkLv
 ns2oAH3Sf0/Aj0tv+OwCBPNeqO78ANrGakiggSKgu7+f6E8V1PxYFDrw0CpJkWqAYu
 oI+c7dYEwuyZLWaNj2TZP5ykHEaKm4H0rgNLmz2n7BK+XGlINS5eEMKbAqRuSYo14q
 Ez0WhZBofen8Dn3NBZXxAtsozfc15a8wxw4HWXQVrH8iujP3q/ohEN4Nis441bZBR5
 h4wUUJ+yk6uyg==
Date: Mon, 18 Aug 2025 05:04:52 +0000
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [RFC PATCH 3/3] rust: drm: Introduce a Connector abstraction
Message-ID: <20250818050251.102399-5-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 1e0e52877b5d91260675001b225d770ecb49a434
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

This abstraction enables implementing new DRM connector APIs in Rust.
Interfaces can be exported to both C and Rust consumers. The initial
intention is to implement a new DRM connector level backlight API to handle
multiple panels with backlight controls on a single system. Ideally,
various functionalities exposed through DDC and USB Monitor Control Class
will be plumbed through a Rust DRM Connector abstraction.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Link: https://binary-eater.github.io/tags/usb-monitor-control/
---
 drivers/gpu/drm/drm_connector.c |   9 +++
 include/drm/drm_connector.h     |  20 +++++++
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/connector.rs    | 103 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   2 +
 5 files changed, 135 insertions(+)
 create mode 100644 rust/kernel/drm/connector.rs

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 272d6254ea47..8e6a89ad736f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -272,6 +272,10 @@ static int drm_connector_init_only(struct drm_device *=
dev,
 =09=09goto out_put_type_id;
 =09}
=20
+=09ret =3D drm_connector_init_rust(connector);
+=09if (ret)
+=09=09goto out_put_name;
+
 =09/* provide ddc symlink in sysfs */
 =09connector->ddc =3D ddc;
=20
@@ -317,6 +321,9 @@ static int drm_connector_init_only(struct drm_device *d=
ev,
 =09}
=20
 =09connector->debugfs_entry =3D NULL;
+out_put_name:
+=09if (ret)
+=09=09kfree(connector->name);
 out_put_type_id:
 =09if (ret)
 =09=09ida_free(connector_ida, connector->connector_type_id);
@@ -761,6 +768,8 @@ void drm_connector_cleanup(struct drm_connector *connec=
tor)
 =09=09    DRM_CONNECTOR_REGISTERED))
 =09=09drm_connector_unregister(connector);
=20
+=09drm_connector_cleanup_rust(connector);
+
 =09platform_device_unregister(connector->hdmi_audio.codec_pdev);
=20
 =09if (connector->privacy_screen) {
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..8e2a062a7151 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2305,6 +2305,11 @@ struct drm_connector {
 =09 * @cec: CEC-related data.
 =09 */
 =09struct drm_connector_cec cec;
+
+=09/**
+=09 * @rust: private data for Rust connector API.
+=09 */
+=09void *rust;
 };
=20
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
@@ -2346,6 +2351,21 @@ int drm_connector_attach_encoder(struct drm_connecto=
r *connector,
=20
 void drm_connector_cleanup(struct drm_connector *connector);
=20
+#if IS_ENABLED(CONFIG_RUST)
+int drm_connector_init_rust(struct drm_connector *connector);
+void drm_connector_cleanup_rust(struct drm_connector *connector);
+#else
+static inline int drm_connector_init_rust(struct drm_connector *connector)
+{
+=09return 0;
+}
+
+static inline void drm_connector_cleanup_rust(struct drm_connector *connec=
tor)
+{
+}
+#endif
+
+
 static inline unsigned int drm_connector_index(const struct drm_connector =
*connector)
 {
 =09return connector->index;
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 84d60635e8a9..c9d0d863c229 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
=20
 #include <linux/acpi.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/rust/kernel/drm/connector.rs b/rust/kernel/drm/connector.rs
new file mode 100644
index 000000000000..a65141478d73
--- /dev/null
+++ b/rust/kernel/drm/connector.rs
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM connector.
+//!
+//! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_conn=
ector.h)
+
+use core::marker::PhantomPinned;
+use kernel::prelude::*;
+use kernel::types::{ForeignOwnable, Opaque};
+
+/// A DRM connector representation that extends `struct drm_connector`.
+///
+/// This connector implementation enables DRM connector API development in=
 Rust
+/// and exposing said functionality to both C and Rust DRM consumers.
+///
+/// # Invariants
+///
+/// `raw_connector` is a valid pointer to a `struct drm_connector`.
+///
+/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
+#[pin_data]
+pub struct Connector {
+    #[pin]
+    raw_connector: Opaque<*mut bindings::drm_connector>,
+    rust_only_attribute: bool,
+
+    /// A connector needs to be pinned since it is referred to using a raw
+    /// pointer field `rust` in the C DRM `struct drm_connector` implement=
ation.
+    ///
+    /// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
+    #[pin]
+    _pin: PhantomPinned,
+}
+
+/// C entry point for initializing the Rust extension for a DRM connector.
+///
+/// When a DRM connector is being initialized in the core C stack, the Rus=
t
+/// `Connector` extension needs to be allocated and initialized.
+///
+/// * `raw_connector`: A pointer to `struct drm_connector`, the C DRM conn=
ector
+///   implementation.
+///
+/// # Safety
+///
+/// * `raw_connector` must point to a valid, though partially initialized,
+///   `struct drm_connector` where the `rust` field is not already initial=
ized.
+///
+/// `raw_connector` must point to a valid `struct drm_connector` for the
+/// duration of the function call.
+///
+/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
+#[export]
+pub unsafe extern "C" fn drm_connector_init_rust(
+    raw_connector: *mut bindings::drm_connector,
+) -> kernel::ffi::c_int {
+    let connector =3D match KBox::pin_init(
+        try_pin_init!(Connector{
+            raw_connector <- Opaque::new(raw_connector),
+            rust_only_attribute: true,
+            _pin: PhantomPinned,
+        }),
+        GFP_KERNEL,
+    ) {
+        Ok(kbox) =3D> kbox,
+        Err(_) =3D> return -ENOMEM.to_errno(),
+    };
+
+    // Provide the C `struct drm_connector` instance a handle to the Rust
+    // `drm::connector:Connector` implementation for Rust connector APIs a=
nd the
+    // `drm_connector_cleanup_rust` cleanup call.
+    //
+    // SAFETY: `raw_connector` is a valid pointer with a `rust` field that=
 does
+    // not already point to an initialized `drm::connector::Connector`
+    unsafe { (*raw_connector).rust =3D connector.into_foreign() };
+
+    0
+}
+
+/// C entry point for tearing down the Rust extension for a DRM connector.
+///
+/// When a DRM connector is being cleaned up from the core C stack, the Ru=
st
+/// `Connector` extension instance needs to be dropped.
+///
+/// * `raw_connector`: A pointer to `struct drm_connector`, the C DRM conn=
ector
+///   implementation.
+///
+/// # Safety
+///
+/// * `raw_connector` must be valid and have the `rust` field initialized =
by
+///   `drm_connector_init_rust()`.
+///
+/// `raw_connector` must remain valid for the duration of the function cal=
l and
+/// the `rust` field must be preserved since the `drm_connector_init_rust(=
)`
+/// invocation.
+///
+/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
+#[export]
+pub unsafe extern "C" fn drm_connector_cleanup_rust(raw_connector: *mut bi=
ndings::drm_connector) {
+    // SAFETY: By the safety requirements of this function, the `rust` fie=
ld of
+    // `raw_connector`, a valid pointer, is initialized by the `into_forei=
gn()`
+    // call made by `drm_connector_init_rust()`.
+    drop(unsafe { <Pin<KBox<Connector>>>::from_foreign((*raw_connector).ru=
st) });
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf..826fbc4da450 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,12 +2,14 @@
=20
 //! DRM subsystem abstractions.
=20
+pub mod connector;
 pub mod device;
 pub mod driver;
 pub mod file;
 pub mod gem;
 pub mod ioctl;
=20
+pub use self::connector::Connector;
 pub use self::device::Device;
 pub use self::driver::Driver;
 pub use self::driver::DriverInfo;
--=20
2.49.0


