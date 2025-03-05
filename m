Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE84DA53E2C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411D610E865;
	Wed,  5 Mar 2025 23:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DDj912+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C1410E865
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kdb4EQdrLSuUidxpSbXS3jUnAf43WKr86VzPF4KnoRk=;
 b=DDj912+43UgdJ5DFcJ0bAWMBzGKjCZJmYD6T1nPcuJyyF20/ZVHCxcveEBf/oGTueGHTBA
 mNkKvJSYiiOtWcj85CQeXbFSgaTlT5af6mEpSn67jH/ZqwbFvdpI7waitNEjk6+ek2yT0G
 mfD3BDk1dA5E74pn1RF6KaF2REnvzR4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-zjSxGSNpP5mcGgpp3G7ntw-1; Wed,
 05 Mar 2025 18:09:45 -0500
X-MC-Unique: zjSxGSNpP5mcGgpp3G7ntw-1
X-Mimecast-MFC-AGG-ID: zjSxGSNpP5mcGgpp3G7ntw_1741216182
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 782CD1955BD2; Wed,  5 Mar 2025 23:09:42 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C7E29300019E; Wed,  5 Mar 2025 23:09:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 33/33] drm: Introduce RVKMS!
Date: Wed,  5 Mar 2025 17:59:49 -0500
Message-ID: <20250305230406.567126-34-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

Now that we've added all of the bits that we need for the KMS API, it's
time to introduce rvkms! This is a port of the VKMS driver to rust, with
the intent of acting as an example usecase of the KMS bindings that we've
come up with so far in preparation for writing a display driver for nova.

Currently RVKMS is an extremely bear bones driver - it only registers a
device and emulates vblanking, but it exercises a good portion of the API
that we've introduced so far! Eventually I hope to introduce CRC generation
and maybe writeback connectors like.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Replace platform device usage with faux device
* Clean up all warnings

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/rvkms/Kconfig      |   3 +
 drivers/gpu/drm/rvkms/Makefile     |   1 +
 drivers/gpu/drm/rvkms/connector.rs |  55 +++++++
 drivers/gpu/drm/rvkms/crtc.rs      | 245 +++++++++++++++++++++++++++++
 drivers/gpu/drm/rvkms/encoder.rs   |  31 ++++
 drivers/gpu/drm/rvkms/file.rs      |  19 +++
 drivers/gpu/drm/rvkms/gem.rs       |  29 ++++
 drivers/gpu/drm/rvkms/output.rs    |  36 +++++
 drivers/gpu/drm/rvkms/plane.rs     |  73 +++++++++
 drivers/gpu/drm/rvkms/rvkms.rs     | 140 +++++++++++++++++
 12 files changed, 635 insertions(+)
 create mode 100644 drivers/gpu/drm/rvkms/Kconfig
 create mode 100644 drivers/gpu/drm/rvkms/Makefile
 create mode 100644 drivers/gpu/drm/rvkms/connector.rs
 create mode 100644 drivers/gpu/drm/rvkms/crtc.rs
 create mode 100644 drivers/gpu/drm/rvkms/encoder.rs
 create mode 100644 drivers/gpu/drm/rvkms/file.rs
 create mode 100644 drivers/gpu/drm/rvkms/gem.rs
 create mode 100644 drivers/gpu/drm/rvkms/output.rs
 create mode 100644 drivers/gpu/drm/rvkms/plane.rs
 create mode 100644 drivers/gpu/drm/rvkms/rvkms.rs

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fbef3f471bd0e..18eec6f914e52 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -336,6 +336,8 @@ source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
 
+source "drivers/gpu/drm/rvkms/Kconfig"
+
 source "drivers/gpu/drm/i915/Kconfig"
 
 source "drivers/gpu/drm/xe/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 19fb370fbc567..17db3b1202d4d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
+obj-$(CONFIG_DRM_RVKMS) += rvkms/
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
 obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
diff --git a/drivers/gpu/drm/rvkms/Kconfig b/drivers/gpu/drm/rvkms/Kconfig
new file mode 100644
index 0000000000000..551422803b9a6
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/Kconfig
@@ -0,0 +1,3 @@
+config DRM_RVKMS
+        tristate "Rust VKMS PoC driver (EXPERIMENTAL)"
+        depends on RUST && DRM && DRM_GEM_SHMEM_HELPER=y
diff --git a/drivers/gpu/drm/rvkms/Makefile b/drivers/gpu/drm/rvkms/Makefile
new file mode 100644
index 0000000000000..18e06fc3343c6
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_RVKMS) += rvkms.o
diff --git a/drivers/gpu/drm/rvkms/connector.rs b/drivers/gpu/drm/rvkms/connector.rs
new file mode 100644
index 0000000000000..0c56451bf69df
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/connector.rs
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+//! RVKMS's DRM Connector implementation
+use super::{RvkmsDriver, DEFAULT_RES, MAX_RES};
+use core::marker::PhantomPinned;
+use kernel::{
+    drm::{
+        device::Device,
+        kms::{
+            connector::{self, ConnectorGuard, DriverConnectorOps},
+            ModeConfigGuard,
+        },
+    },
+    prelude::*,
+};
+
+#[pin_data]
+pub(crate) struct DriverConnector {
+    #[pin]
+    _p: PhantomPinned,
+}
+
+#[allow(unused)]
+pub(crate) type Connector = connector::Connector<DriverConnector>;
+pub(crate) type UnregisteredConnector = connector::UnregisteredConnector<DriverConnector>;
+
+#[vtable]
+impl connector::DriverConnector for DriverConnector {
+    #[unique]
+    const OPS: &'static DriverConnectorOps;
+
+    type State = ConnectorState;
+    type Driver = RvkmsDriver;
+    type Args = ();
+
+    fn new(_dev: &Device<Self::Driver>, _args: Self::Args) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+
+    fn get_modes(
+        connector: ConnectorGuard<'_, Self>,
+        _guard: &ModeConfigGuard<'_, Self::Driver>,
+    ) -> i32 {
+        let count = connector.add_modes_noedid(MAX_RES);
+
+        connector.set_preferred_mode(DEFAULT_RES);
+        count
+    }
+}
+
+#[derive(Clone, Default)]
+pub(crate) struct ConnectorState;
+
+impl connector::DriverConnectorState for ConnectorState {
+    type Connector = DriverConnector;
+}
diff --git a/drivers/gpu/drm/rvkms/crtc.rs b/drivers/gpu/drm/rvkms/crtc.rs
new file mode 100644
index 0000000000000..02e81368d9c49
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/crtc.rs
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+//! RVKMS's DRM CRTC implementation.
+use super::RvkmsDriver;
+use core::marker::*;
+use kernel::{
+    drm::{
+        device::Device,
+        kms::{
+            atomic::*,
+            crtc::{self, DriverCrtcOps, RawCrtcState},
+            vblank::*,
+            KmsRef, ModeObject,
+        },
+    },
+    impl_has_hr_timer,
+    interrupt::LocalInterruptDisabled,
+    new_spinlock_irq,
+    prelude::*,
+    sync::{Arc, SpinLockIrq},
+    time::{hrtimer::*, Ktime},
+};
+
+pub(crate) type Crtc = crtc::Crtc<RvkmsCrtc>;
+pub(crate) type UnregisteredCrtc = crtc::UnregisteredCrtc<RvkmsCrtc>;
+pub(crate) type CrtcState = crtc::CrtcState<RvkmsCrtcState>;
+
+#[derive(Default)]
+pub(crate) struct VblankState {
+    /// A reference to the current VblankTimer
+    timer: Option<Arc<VblankTimer>>,
+
+    /// A reference to a handle for the current VblankTimer
+    handle: Option<ArcHrTimerHandle<VblankTimer>>,
+
+    /// The current frame duration in ns
+    ///
+    /// Stored separately here so it can be read safely without the vblank lock
+    period_ns: i32,
+}
+
+#[pin_data]
+pub(crate) struct RvkmsCrtc {
+    /// The current vblank emulation state
+    ///
+    /// This is uninitalized when the CRTC is disabled to prevent circular references
+    #[pin]
+    vblank_state: SpinLockIrq<VblankState>,
+}
+
+#[vtable]
+impl crtc::DriverCrtc for RvkmsCrtc {
+    #[unique]
+    const OPS: &'static DriverCrtcOps;
+
+    type Args = ();
+    type State = RvkmsCrtcState;
+    type Driver = RvkmsDriver;
+    type VblankImpl = Self;
+
+    fn new(_device: &Device<Self::Driver>, _args: &Self::Args) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            vblank_state <- new_spinlock_irq!(VblankState::default(), "vblank_handle_lock")
+        })
+    }
+
+    fn atomic_check(
+        crtc: &Crtc,
+        old_state: &CrtcState,
+        mut new_state: crtc::CrtcStateMutator<'_, CrtcState>,
+        state: &AtomicStateComposer<Self::Driver>,
+    ) -> Result {
+        state.add_affected_planes(crtc)?;
+
+        // Create a vblank timer when enabling a CRTC, and destroy said timer when disabling to
+        // resolve the circular reference to CRTC it creates
+        if old_state.active() != new_state.active() {
+            new_state.vblank_timer = if new_state.active() {
+                Some(VblankTimer::new(crtc)?)
+            } else {
+                None
+            };
+        }
+
+        Ok(())
+    }
+
+    fn atomic_flush(
+        crtc: &Crtc,
+        _old_state: &CrtcState,
+        mut new_state: crtc::CrtcStateMutator<'_, CrtcState>,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        if let Some(event) = new_state.get_pending_vblank_event() {
+            if let Ok(vbl_ref) = crtc.vblank_get() {
+                event.arm(vbl_ref);
+            } else {
+                event.send();
+            }
+        }
+    }
+
+    fn atomic_enable(
+        crtc: &Crtc,
+        _old_state: &CrtcState,
+        new_state: crtc::CrtcStateMutator<'_, CrtcState>,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        // Store a reference to the newly created vblank timer for this CRTC
+        crtc.vblank_state.lock().timer = new_state.vblank_timer.clone();
+
+        crtc.vblank_on();
+    }
+
+    fn atomic_disable(
+        crtc: &Crtc,
+        _old_state: &CrtcState,
+        _new_state: crtc::CrtcStateMutator<'_, CrtcState>,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        crtc.vblank_off();
+
+        let mut vbl_state = crtc.vblank_state.lock();
+        let handles = (vbl_state.timer.take(), vbl_state.handle.take());
+
+        // Since we just explicitly disabled vblanks, destroy the vblank state to resolve circular
+        // reference to this CRTC that it holds.
+        // Note that since dropping the handle will cause us to wait for the timer to finish, we
+        // must drop the lock before we do so.
+        drop(vbl_state);
+        drop(handles);
+    }
+}
+
+impl VblankSupport for RvkmsCrtc {
+    type Crtc = Self;
+
+    fn enable_vblank(
+        crtc: &Crtc,
+        vblank: &VblankGuard<'_, Self::Crtc>,
+        irq: &LocalInterruptDisabled,
+    ) -> Result {
+        let period_ns = vblank.frame_duration();
+        let mut vbl_state = crtc.vblank_state.lock_with(irq);
+
+        if let Some(timer) = vbl_state.timer.clone() {
+            vbl_state.period_ns = period_ns;
+            vbl_state.handle = Some(timer.start(Ktime::from_raw(period_ns as _)));
+        }
+
+        Ok(())
+    }
+
+    fn disable_vblank(
+        crtc: &Crtc,
+        _vbl_guard: &VblankGuard<'_, Self::Crtc>,
+        irq: &LocalInterruptDisabled,
+    ) {
+        let handle = crtc.vblank_state.lock_with(irq).handle.take();
+
+        // Now that we're outside of the vblank lock, we can safely drop the handle
+        drop(handle);
+    }
+
+    fn get_vblank_timestamp(crtc: &Crtc, _handling_vblank_irq: bool) -> Option<VblankTimestamp> {
+        let vbl_state = crtc.vblank_state.lock();
+
+        // Return the expiration of our vblank timer if we have one (if not, vblanks are disabled)
+        let time = vbl_state.timer.as_ref().map(|t| {
+            // To prevent races, we roll the hrtimer forward before we do any interrupt
+            // processing - this is how real hw works (the interrupt is only generated after all
+            // the vblank registers are updated) and what the vblank core expects. Therefore we
+            // need to always correct the timestamps by one frame.
+            t.timer.expires() - Ktime::from_nanos(vbl_state.period_ns)
+        });
+
+        Some(VblankTimestamp {
+            // …otherwise, just use the current time
+            time: time.unwrap_or_else(|| Ktime::ktime_get()),
+            max_error: 0,
+        })
+    }
+}
+
+#[derive(Clone, Default)]
+pub(crate) struct RvkmsCrtcState {
+    /// The current hrtimer used for emulating vblank events, if there is one.
+    vblank_timer: Option<Arc<VblankTimer>>,
+}
+
+impl crtc::DriverCrtcState for RvkmsCrtcState {
+    type Crtc = RvkmsCrtc;
+}
+
+/// The main hrtimer structure for emulating vblanks.
+#[pin_data]
+pub(crate) struct VblankTimer {
+    /// The actual hrtimer used for sending out vblanks
+    #[pin]
+    timer: HrTimer<Self>,
+
+    /// An owned reference to the CRTC that this [`VblankTimer`] belongs to
+    crtc: KmsRef<Crtc>,
+}
+
+impl_has_hr_timer! {
+    impl HasHrTimer<Self> for VblankTimer { self.timer }
+}
+
+impl VblankTimer {
+    pub(crate) fn new(crtc: &Crtc) -> Result<Arc<Self>> {
+        Arc::pin_init(
+            pin_init!(Self {
+                timer <- HrTimer::<Self>::new(HrTimerMode::Relative, ClockSource::Monotonic),
+                crtc: crtc.into(),
+            }),
+            GFP_KERNEL,
+        )
+    }
+}
+
+impl HrTimerCallback for VblankTimer {
+    type Pointer<'a> = Arc<Self>;
+
+    fn run<T>(
+        this: <Self::Pointer<'_> as RawHrTimerCallback>::CallbackTarget<'_>,
+        context: HrTimerCallbackContext<'_, T>,
+    ) -> HrTimerRestart
+    where
+        Self: Sized,
+    {
+        let period_ns = this.crtc.vblank_state.lock().period_ns;
+
+        let overrun = context.forward_now(Ktime::from_nanos(period_ns));
+        if overrun != 1 {
+            dev_warn!(
+                this.crtc.drm_dev().as_ref(),
+                "vblank timer overrun (expected 1, got {overrun})\n"
+            );
+        }
+
+        this.crtc.handle_vblank();
+
+        HrTimerRestart::Restart
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/encoder.rs b/drivers/gpu/drm/rvkms/encoder.rs
new file mode 100644
index 0000000000000..2ce1635a78ff7
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/encoder.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+//! RVKMS's DRM Encoder implementation
+use crate::RvkmsDriver;
+use core::marker::PhantomPinned;
+use kernel::{
+    drm::{device::Device, kms::encoder},
+    prelude::*,
+};
+
+#[pin_data]
+pub(crate) struct DriverEncoder {
+    #[pin]
+    _p: PhantomPinned,
+}
+
+#[allow(unused)]
+pub(crate) type Encoder = encoder::Encoder<DriverEncoder>;
+pub(crate) type UnregisteredEncoder = encoder::UnregisteredEncoder<DriverEncoder>;
+
+#[vtable]
+impl encoder::DriverEncoder for DriverEncoder {
+    #[unique]
+    const OPS: &'static encoder::DriverEncoderOps;
+
+    type Driver = RvkmsDriver;
+    type Args = ();
+
+    fn new(_device: &Device<Self::Driver>, _args: Self::Args) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/file.rs b/drivers/gpu/drm/rvkms/file.rs
new file mode 100644
index 0000000000000..ea622a364659a
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/file.rs
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+//! RVKMS's DRM File implementation.
+use super::RvkmsDriver;
+
+use kernel::{
+    alloc::*,
+    drm::{self, device::Device as DrmDevice},
+    prelude::*,
+};
+
+pub(crate) struct File;
+
+impl drm::file::DriverFile for File {
+    type Driver = RvkmsDriver;
+
+    fn open(_device: &DrmDevice<Self::Driver>) -> Result<Pin<KBox<Self>>> {
+        Box::pin_init(init!(File {}), GFP_KERNEL)
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/gem.rs b/drivers/gpu/drm/rvkms/gem.rs
new file mode 100644
index 0000000000000..0aa7817d4f70b
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/gem.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+//! RVKMS's DRM GEM implementation
+use crate::{RvkmsDevice, RvkmsDriver};
+use core::sync::atomic::{AtomicU64, Ordering};
+use kernel::{drm::gem, prelude::*};
+
+static GEM_ID: AtomicU64 = AtomicU64::new(0);
+
+/// GEM Object implementation
+#[pin_data]
+pub(crate) struct DriverObject {
+    /// ID for debugging
+    id: u64,
+}
+
+pub(crate) type Object = gem::shmem::Object<DriverObject>;
+
+impl gem::BaseDriverObject<Object> for DriverObject {
+    fn new(_dev: &RvkmsDevice, _size: usize) -> impl PinInit<Self, Error> {
+        let id = GEM_ID.fetch_add(1, Ordering::Relaxed);
+
+        pr_debug!("DriverObject::new id={id}\n");
+        DriverObject { id }
+    }
+}
+
+impl gem::shmem::DriverObject for DriverObject {
+    type Driver = RvkmsDriver;
+}
diff --git a/drivers/gpu/drm/rvkms/output.rs b/drivers/gpu/drm/rvkms/output.rs
new file mode 100644
index 0000000000000..4b5601bea37f2
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/output.rs
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+//! RVKMS's display outputs.
+use crate::{
+    connector::UnregisteredConnector, crtc::UnregisteredCrtc, encoder::UnregisteredEncoder,
+    plane::UnregisteredPlane, RvkmsDriver,
+};
+use kernel::{
+    drm::{
+        fourcc::*,
+        kms::{connector, encoder, plane, UnregisteredKmsDevice},
+    },
+    prelude::*,
+};
+
+pub(crate) fn create_output(dev: &UnregisteredKmsDevice<'_, RvkmsDriver>, index: u8) -> Result {
+    let possible_crtcs = 1 << index;
+
+    let primary = UnregisteredPlane::new(
+        dev,
+        possible_crtcs,
+        &[XRGB888],
+        None,
+        plane::Type::Primary,
+        None,
+        (),
+    )?;
+
+    let _crtc = UnregisteredCrtc::new(dev, primary, Option::<&UnregisteredPlane>::None, None, ())?;
+
+    let connector = UnregisteredConnector::new(dev, connector::Type::Virtual, ())?;
+
+    let encoder =
+        UnregisteredEncoder::new(dev, encoder::Type::Virtual, possible_crtcs, 0, None, ())?;
+
+    connector.attach_encoder(encoder)
+}
diff --git a/drivers/gpu/drm/rvkms/plane.rs b/drivers/gpu/drm/rvkms/plane.rs
new file mode 100644
index 0000000000000..e58c4f12410ef
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/plane.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+//! RVKMS's DRM plane implementation
+use super::RvkmsDriver;
+use core::marker::PhantomPinned;
+use kernel::{
+    drm::{
+        device::Device,
+        kms::{
+            atomic::*,
+            plane::{self, DriverPlaneOps, DriverPlaneState, PlaneStateMutator, RawPlaneState},
+        },
+    },
+    prelude::*,
+};
+
+#[pin_data]
+pub(crate) struct RvkmsPlane {
+    #[pin]
+    _p: PhantomPinned,
+}
+
+pub(crate) type Plane = plane::Plane<RvkmsPlane>;
+pub(crate) type UnregisteredPlane = plane::UnregisteredPlane<RvkmsPlane>;
+pub(crate) type PlaneState = plane::PlaneState<RvkmsPlaneState>;
+
+#[vtable]
+impl plane::DriverPlane for RvkmsPlane {
+    #[unique]
+    const OPS: &'static DriverPlaneOps;
+
+    type State = RvkmsPlaneState;
+    type Driver = RvkmsDriver;
+    type Args = ();
+
+    fn new(_device: &Device<Self::Driver>, _args: Self::Args) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+
+    fn atomic_check(
+        _plane: &Plane,
+        mut new_state: PlaneStateMutator<'_, PlaneState>,
+        _old_state: &PlaneState,
+        state: &AtomicStateComposer<Self::Driver>,
+    ) -> Result {
+        if new_state.framebuffer().is_none() {
+            return Ok(());
+        }
+
+        if let Some(crtc) = new_state.crtc() {
+            let crtc_state = state.add_crtc_state(crtc)?;
+            new_state.atomic_helper_check(&crtc_state, true, true)
+        } else {
+            // TODO: We should be printing a warning here if we have no CRTC but do have an fb
+            return Ok(());
+        }
+    }
+
+    fn atomic_update(
+        _plane: &Plane,
+        _new_state: PlaneStateMutator<'_, PlaneState>,
+        _old_state: &PlaneState,
+        _state: &AtomicStateMutator<Self::Driver>,
+    ) {
+        // TODO, no-op for now
+    }
+}
+
+#[derive(Clone, Default)]
+pub(crate) struct RvkmsPlaneState;
+
+impl DriverPlaneState for RvkmsPlaneState {
+    type Plane = RvkmsPlane;
+}
diff --git a/drivers/gpu/drm/rvkms/rvkms.rs b/drivers/gpu/drm/rvkms/rvkms.rs
new file mode 100644
index 0000000000000..fda5ce72a2c1f
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/rvkms.rs
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+//! A port of the VKMS driver to rust.
+pub(crate) mod connector;
+pub(crate) mod crtc;
+pub(crate) mod encoder;
+pub(crate) mod file;
+pub(crate) mod gem;
+pub(crate) mod output;
+pub(crate) mod plane;
+
+use core::marker::*;
+
+use kernel::{
+    c_str, device,
+    drm::{
+        self, drv,
+        kms::{atomic::*, KmsDriver, ModeConfigInfo, UnregisteredKmsDevice},
+    },
+    faux,
+    prelude::*,
+    str::CStr,
+};
+
+/// Convienence type alias for the DRM device type for this driver
+pub(crate) type RvkmsDevice = drm::device::Device<RvkmsDriver>;
+
+/// The name of the driver
+const NAME: &'static CStr = c_str!("rvkms");
+
+/// Driver metadata
+const INFO: drv::DriverInfo = drv::DriverInfo {
+    major: 0,
+    minor: 0,
+    patchlevel: 0,
+    name: &NAME,
+    desc: c_str!("Rust VKMS PoC"),
+    date: c_str!("20240115"),
+};
+
+/// The minimum supported resolution
+const MIN_RES: (i32, i32) = (10, 10);
+
+/// The maximum supported resolution
+const MAX_RES: (i32, i32) = (8192, 8192);
+
+/// The "preferred" resolution
+const DEFAULT_RES: (i32, i32) = (1024, 768);
+
+/// DRM Driver implementation for `RvkmsDriver`
+#[vtable]
+impl drv::Driver for RvkmsDriver {
+    type Data = ();
+    type Object = gem::Object;
+    type File = file::File;
+    type Kms = Self;
+
+    const INFO: drv::DriverInfo = INFO;
+    const FEATURES: u32 = drv::FEAT_GEM | drv::FEAT_MODESET | drv::FEAT_ATOMIC;
+
+    kernel::declare_drm_ioctls! {}
+}
+
+#[vtable]
+impl KmsDriver for RvkmsDriver {
+    fn mode_config_info(
+        _dev: &device::Device,
+        _drm_data: <Self::Data as kernel::types::ForeignOwnable>::Borrowed<'_>,
+    ) -> Result<ModeConfigInfo> {
+        Ok(MODE_CONFIG_INFO)
+    }
+
+    fn create_objects(drm: &UnregisteredKmsDevice<'_, Self>) -> Result
+    where
+        Self: Sized,
+    {
+        output::create_output(drm, 0)
+    }
+
+    fn atomic_commit_tail<'a>(
+        mut state: AtomicCommitTail<'a, Self>,
+        modeset_token: ModesetsReadyToken<'_>,
+        plane_update_token: PlaneUpdatesReadyToken<'_>,
+    ) -> CommittedAtomicState<'a, Self>
+    where
+        Self: Sized,
+    {
+        let modeset_token = state.commit_modeset_disables(modeset_token);
+
+        let plane_update_token = state.commit_planes(plane_update_token, Default::default());
+
+        let modeset_token = state.commit_modeset_enables(modeset_token);
+
+        state.fake_vblank();
+
+        let state = state.commit_hw_done(modeset_token, plane_update_token);
+
+        state.wait_for_flip_done();
+
+        state
+    }
+}
+
+pub(crate) struct RvkmsDriver;
+
+const MODE_CONFIG_INFO: ModeConfigInfo = ModeConfigInfo {
+    min_resolution: MIN_RES,
+    max_resolution: MAX_RES,
+    max_cursor: (512, 512),
+    preferred_depth: 24,
+    preferred_fourcc: None,
+};
+
+pub(crate) struct RvkmsModule {
+    _dev: faux::Registration,
+    _drm: drv::Registration<RvkmsDriver>,
+}
+
+impl kernel::Module for RvkmsModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("RVKMS Loaded\n");
+
+        let dev = faux::Registration::new(NAME, None)?;
+        dev_info!(dev.as_ref(), "Setting up DRM\n");
+
+        let drm = drv::Registration::<RvkmsDriver>::new(dev.as_ref(), (), 0)?;
+
+        Ok(Self {
+            _dev: dev,
+            _drm: drm,
+        })
+    }
+}
+
+module! {
+    type: RvkmsModule,
+    name: "rvkms",
+    author: "Lyude Paul",
+    description: "Rust VKMS Proof of Concept driver",
+    license: "GPL v2",
+}
-- 
2.48.1

