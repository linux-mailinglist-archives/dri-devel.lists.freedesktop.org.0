Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A56D98B115
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED7C10E5AE;
	Mon, 30 Sep 2024 23:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h8AWc+6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6D510E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RNAHaATLEjnd+TmtggNdwyEYacgXK5CVqJ+rc7+KF8=;
 b=h8AWc+6Cq95vH58t1BQVJufVk5XWDhQvDCHEw03P70EsA1sXvZSPpoEEuEE18a2NMk+71I
 eypyLJivBaTyBLjzH15kqPxdVG8gpNcYCqW/ytEdEhLnk3BUJqLFDrV38opxDlyMQw+Nbb
 2OF0bASWHbcx5gtdhFHqmMPx4seUNv8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-7PQZjkj7OLaZ95TSrO84_A-1; Mon,
 30 Sep 2024 19:42:12 -0400
X-MC-Unique: 7PQZjkj7OLaZ95TSrO84_A-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AD179196C429; Mon, 30 Sep 2024 23:42:09 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 96C673003DEC; Mon, 30 Sep 2024 23:42:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 35/35] WIP: drm: Introduce RVKMS!
Date: Mon, 30 Sep 2024 19:10:18 -0400
Message-ID: <20240930233257.1189730-36-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
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
 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/rvkms/Kconfig      |   3 +
 drivers/gpu/drm/rvkms/Makefile     |   1 +
 drivers/gpu/drm/rvkms/connector.rs |  53 ++++++
 drivers/gpu/drm/rvkms/crtc.rs      | 253 +++++++++++++++++++++++++++++
 drivers/gpu/drm/rvkms/encoder.rs   |  33 ++++
 drivers/gpu/drm/rvkms/file.rs      |  22 +++
 drivers/gpu/drm/rvkms/gem.rs       |  30 ++++
 drivers/gpu/drm/rvkms/output.rs    |  55 +++++++
 drivers/gpu/drm/rvkms/plane.rs     |  81 +++++++++
 drivers/gpu/drm/rvkms/rvkms.rs     | 168 +++++++++++++++++++
 12 files changed, 702 insertions(+)
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
index 6b2c6b91f9625..525e2e1615ca2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -323,6 +323,8 @@ source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
 
+source "drivers/gpu/drm/rvkms/Kconfig"
+
 source "drivers/gpu/drm/i915/Kconfig"
 
 source "drivers/gpu/drm/xe/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 68cc9258ffc4b..ebedcab4dece0 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -172,6 +172,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
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
index 0000000000000..97b94054fbe1f
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/connector.rs
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+use super::{Rvkms, RvkmsDevice, MAX_RES, DEFAULT_RES};
+use kernel::{
+    prelude::*,
+    drm::{
+        device::Device,
+        kms::{
+            connector::{self, ConnectorGuard, DriverConnectorOps},
+            ModeConfigGuard
+        }
+    },
+    prelude::*
+};
+use core::marker::PhantomPinned;
+
+#[pin_data]
+pub(crate) struct DriverConnector {
+    #[pin]
+    _p: PhantomPinned
+}
+
+pub(crate) type Connector = connector::Connector<DriverConnector>;
+
+#[vtable]
+impl connector::DriverConnector for DriverConnector {
+    #[unique]
+    const OPS: &'static DriverConnectorOps;
+
+    type State = ConnectorState;
+    type Driver = Rvkms;
+    type Args = ();
+
+    fn new(dev: &Device<Self::Driver>, args: Self::Args) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+
+    fn get_modes(
+        connector: ConnectorGuard<'_, Self>,
+        _guard: &ModeConfigGuard<'_, Self::Driver>
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
index 0000000000000..c3a90c76e4a5e
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/crtc.rs
@@ -0,0 +1,253 @@
+// TODO: License and stuff
+// Contain's rvkms's drm_crtc implementation
+use core::marker::*;
+use super::{Rvkms, plane::*};
+use kernel::{
+    prelude::*,
+    drm::{
+        device::Device,
+        kms::{
+            atomic::*,
+            crtc::{self, RawCrtcState, DriverCrtcOps},
+            ModeObject,
+            KmsRef,
+            vblank::*,
+        }
+    },
+    sync::{
+        lock::Guard,
+        SpinLockIrq,
+        LockedBy,
+    },
+    hrtimer::*,
+    time::*,
+    irq::*,
+    sync::Arc,
+    new_spinlock_irq,
+    impl_has_timer
+};
+
+pub(crate) type Crtc = crtc::Crtc<RvkmsCrtc>;
+pub(crate) type CrtcState = crtc::CrtcState<RvkmsCrtcState>;
+
+#[derive(Default)]
+pub(crate) struct VblankState {
+    /// A reference to the current VblankTimer
+    timer: Option<Arc<VblankTimer>>,
+
+    /// A reference to a handle for the current VblankTimer
+    handle: Option<ArcTimerHandle<VblankTimer>>,
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
+    vblank_state: SpinLockIrq<VblankState>
+}
+
+#[vtable]
+impl crtc::DriverCrtc for RvkmsCrtc {
+    #[unique]
+    const OPS: &'static DriverCrtcOps;
+
+    type Args = ();
+    type State = RvkmsCrtcState;
+    type Driver = Rvkms;
+    type VblankImpl = Self;
+
+    fn new(device: &Device<Self::Driver>, args: &Self::Args) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            vblank_state <- new_spinlock_irq!(VblankState::default(), "vblank_handle_lock")
+        })
+    }
+
+    fn atomic_check(
+        crtc: &Crtc,
+        old_state: &CrtcState,
+        mut new_state: crtc::BorrowedCrtcState<'_, CrtcState>,
+        state: &AtomicStateComposer<Self::Driver>
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
+        mut new_state: crtc::BorrowedCrtcState<'_, CrtcState>,
+        _state: &AtomicStateMutator<Self::Driver>
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
+        old_state: &CrtcState,
+        new_state: crtc::BorrowedCrtcState<'_, CrtcState>,
+        _state: &AtomicStateMutator<Self::Driver>
+    ) {
+        with_irqs_disabled(|irq| {
+            // Store a reference to the newly created vblank timer for this CRTC
+            crtc.vblank_state.lock_with(irq).timer = new_state.vblank_timer.clone()
+        });
+
+        crtc.vblank_on();
+    }
+
+    fn atomic_disable(
+        crtc: &Crtc,
+        _old_state: &CrtcState,
+        _new_state: crtc::BorrowedCrtcState<'_, CrtcState>,
+        _state: &AtomicStateMutator<Self::Driver>
+    ) {
+        crtc.vblank_off();
+
+        // Since we just explicitly disabled vblanks, destroy the vblank state to resolve circular
+        // reference to this CRTC that it holds. Note that dropping the handle will cause us to wait
+        // for the timer to finish, so we return it from with_irqs_disabled so that it is only
+        // dropped once the vblank_state lock has been released
+        drop(with_irqs_disabled(|irq| {
+            let mut state = crtc.vblank_state.lock_with(irq);
+
+            (state.timer.take(), state.handle.take())
+        }));
+    }
+}
+
+impl VblankSupport for RvkmsCrtc {
+    type Crtc = Self;
+
+    fn enable_vblank(
+        crtc: &Crtc,
+        vblank: &VblankGuard<'_, Self::Crtc>,
+        irq: IrqDisabled<'_>,
+    ) -> Result {
+        let period_ns = vblank.frame_duration();
+        let mut vbl_state = crtc.vblank_state.lock_with(irq);
+
+        if let Some(timer) = vbl_state.timer.clone() {
+            vbl_state.period_ns = period_ns;
+            vbl_state.handle = Some(timer.schedule(period_ns as _));
+        }
+
+        Ok(())
+    }
+
+    fn disable_vblank(crtc: &Crtc, _vbl_guard: &VblankGuard<'_, Self::Crtc>, irq: IrqDisabled<'_>) {
+        let handle = crtc.vblank_state.lock_with(irq).handle.take();
+
+        // Now that we're outside of the vblank lock, we can safely drop the handle
+        drop(handle);
+    }
+
+    fn get_vblank_timestamp(crtc: &Crtc, _handling_vblank_irq: bool) -> Option<VblankTimestamp> {
+        let time = with_irqs_disabled(|irq| {
+            let vbl_state = crtc.vblank_state.lock_with(irq);
+
+            // Return the expiration of our vblank timer if we have one (if not, vblanks are
+            // disabled)
+            vbl_state.timer.as_ref().map(|t| {
+                // To prevent races, we roll the hrtimer forward before we do any interrupt
+                // processing - this is how real hw works (the interrupt is only generated after all
+                // the vblank registers are updated) and what the vblank core expects. Therefore we
+                // need to always correct the timestamps by one frame.
+                t.timer.expires() - Ktime::from_ns(vbl_state.period_ns)
+            })
+        });
+
+        Some(VblankTimestamp {
+            // …otherwise, just use the current time
+            time: time.unwrap_or_else(|| Ktime::ktime_get()),
+            max_error: 0
+        })
+    }
+}
+
+#[derive(Clone, Default)]
+pub(crate) struct RvkmsCrtcState {
+    vblank_timer: Option<Arc<VblankTimer>>
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
+    timer: Timer<Self>,
+
+    /// An owned reference to the CRTC that this [`VblankTimer`] belongs to
+    crtc: KmsRef<Crtc>,
+}
+
+impl_has_timer! {
+    impl HasTimer<Self> for VblankTimer { self.timer }
+}
+
+impl VblankTimer {
+    pub(crate) fn new(crtc: &Crtc) -> Result<Arc<Self>> {
+        Arc::pin_init(
+            pin_init!(Self {
+                timer <- Timer::<Self>::new::<Arc<Self>>(),
+                crtc: crtc.into(),
+            }),
+            GFP_KERNEL
+        )
+    }
+}
+
+impl TimerCallback for VblankTimer {
+    type CallbackTarget<'a> = Arc<Self>;
+
+    fn run(
+        this: Self::CallbackTarget<'_>,
+        context: TimerCallbackContext<'_, Self>
+    ) -> TimerRestart
+    where
+        Self: Sized
+    {
+        with_irqs_disabled(|irq| {
+            let period_ns = this.crtc.vblank_state.lock_with(irq).period_ns;
+
+            let overrun = context.forward_now(Ktime::from_ns(period_ns));
+            if overrun != 1 {
+                dev_warn!(
+                    this.crtc.drm_dev().as_ref(),
+                    "vblank timer overrun (expected 1, got {overrun})\n"
+                );
+            }
+
+            this.crtc.handle_vblank();
+        });
+
+        TimerRestart::Restart
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/encoder.rs b/drivers/gpu/drm/rvkms/encoder.rs
new file mode 100644
index 0000000000000..f426ef10bcd7e
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/encoder.rs
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+use core::marker::PhantomPinned;
+use kernel::{
+    drm::{device::Device, kms::encoder},
+    prelude::*,
+    types::ARef,
+};
+use crate::{Rvkms, connector::Connector};
+
+#[pin_data]
+pub(crate) struct DriverEncoder {
+    connector: ARef<Connector>,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+pub(crate) type Encoder = encoder::Encoder<DriverEncoder>;
+
+#[vtable]
+impl encoder::DriverEncoder for DriverEncoder {
+    #[unique]
+    const OPS: &'static encoder::DriverEncoderOps;
+
+    type Driver = Rvkms;
+    type Args = ARef<Connector>;
+
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            connector: args,
+            _p: PhantomPinned
+        })
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/file.rs b/drivers/gpu/drm/rvkms/file.rs
new file mode 100644
index 0000000000000..baa9297673ecc
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/file.rs
@@ -0,0 +1,22 @@
+use super::Rvkms;
+
+use kernel::{
+    drm::{
+        self,
+        device::Device as DrmDevice
+    },
+    prelude::*,
+};
+use core::option::*;
+
+pub(crate) struct File;
+
+impl drm::file::DriverFile for File {
+    type Driver = Rvkms;
+
+    fn open(device: &DrmDevice<Self::Driver>) -> Result<Pin<Box<Self>>> {
+        pr_info!("Someone opened a file! But I do not yet know which one...\n");
+
+        Box::pin_init(init!(File { }), GFP_KERNEL)
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/gem.rs b/drivers/gpu/drm/rvkms/gem.rs
new file mode 100644
index 0000000000000..950ef33758657
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/gem.rs
@@ -0,0 +1,30 @@
+use crate::{Rvkms, RvkmsDevice};
+use core::sync::atomic::{AtomicU64, Ordering};
+use kernel::{
+    drm::{self, gem},
+    prelude::*,
+};
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
+    fn new(dev: &RvkmsDevice, size: usize) -> impl PinInit<Self, Error> {
+        let id = GEM_ID.fetch_add(1, Ordering::Relaxed);
+
+        pr_debug!("DriverObject::new id={id}\n");
+        DriverObject { id }
+    }
+}
+
+impl gem::shmem::DriverObject for DriverObject {
+    type Driver = Rvkms;
+}
diff --git a/drivers/gpu/drm/rvkms/output.rs b/drivers/gpu/drm/rvkms/output.rs
new file mode 100644
index 0000000000000..b110e2d5d8a8b
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/output.rs
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+use crate::{
+    crtc::Crtc,
+    plane::Plane,
+    connector::Connector,
+    encoder::Encoder,
+    RvkmsDevice,
+    Rvkms
+};
+use kernel::{
+    drm::{
+        fourcc::*,
+        kms::{
+            connector::DRM_MODE_CONNECTOR_VIRTUAL,
+            encoder::DRM_MODE_ENCODER_VIRTUAL,
+            plane::{self, PlaneType},
+            framebuffer::*,
+            UnregisteredKmsDevice,
+        },
+    },
+    sync::Arc,
+    prelude::*,
+    types::ARef,
+};
+
+const FORMATS: FormatList<1> = FormatList::new([XRGB888]);
+
+pub(crate) fn create_output(dev: &UnregisteredKmsDevice<'_, Rvkms>, index: u8) -> Result {
+    let possible_crtcs = 1 << index;
+
+    let primary = Plane::new(
+        dev,
+        possible_crtcs,
+        &FORMATS,
+        Option::<&ModifierList<0>>::None,
+        PlaneType::PRIMARY,
+        None,
+        ()
+    )?;
+
+    let crtc = Crtc::new(dev, primary, Option::<&Plane>::None, None, ())?;
+
+    let connector = Connector::new(dev, DRM_MODE_CONNECTOR_VIRTUAL, ())?;
+
+    let encoder = Encoder::new(
+        dev,
+        DRM_MODE_ENCODER_VIRTUAL,
+        possible_crtcs,
+        0,
+        None,
+        connector.clone()
+    )?;
+
+    connector.attach_encoder(encoder)
+}
diff --git a/drivers/gpu/drm/rvkms/plane.rs b/drivers/gpu/drm/rvkms/plane.rs
new file mode 100644
index 0000000000000..2722845a32e9a
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/plane.rs
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+use core::marker::PhantomPinned;
+use super::{Rvkms, crtc::{RvkmsCrtc, Crtc}};
+use kernel::{
+    prelude::*,
+    drm::{
+        device::Device,
+        kms::{
+            atomic::*,
+            plane::{
+                self,
+                AsRawPlaneState,
+                FromRawPlaneState,
+                DriverPlaneState,
+                RawPlane,
+                RawPlaneState,
+                BorrowedPlaneState,
+                DriverPlaneOps,
+            },
+            ModeObject
+        }
+    },
+};
+
+#[pin_data]
+pub(crate) struct RvkmsPlane {
+    #[pin]
+    _p: PhantomPinned,
+}
+
+pub(crate) type Plane = plane::Plane<RvkmsPlane>;
+pub(crate) type PlaneState = plane::PlaneState<RvkmsPlaneState>;
+
+#[vtable]
+impl plane::DriverPlane for RvkmsPlane {
+    #[unique]
+    const OPS: &'static DriverPlaneOps;
+
+    type State = RvkmsPlaneState;
+    type Driver = Rvkms;
+    type Args = ();
+
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+
+    fn atomic_check(
+        plane: &Plane,
+        mut new_state: BorrowedPlaneState<'_, PlaneState>,
+        _old_state: &PlaneState,
+        state: &AtomicStateComposer<Self::Driver>
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
+        _new_state: BorrowedPlaneState<'_, PlaneState>,
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
index 0000000000000..2c72c0ec6989d
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/rvkms.rs
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+mod connector;
+mod crtc;
+mod file;
+mod gem;
+mod plane;
+mod output;
+mod encoder;
+
+use alloc::boxed::Box;
+
+use core::{option::*, marker::*};
+
+use kernel::{
+    c_str,
+    str::CStr,
+    device,
+    driver,
+    drm::{
+        self,
+        drv,
+        kms::{
+            Kms,
+            ModeConfigInfo,
+            UnregisteredKmsDevice,
+            atomic::*,
+            fbdev::*,
+        },
+    },
+    platform,
+    prelude::*,
+    sync::Arc,
+};
+
+/// Convienence type alias for the DRM device type for this driver
+pub(crate) type RvkmsDevice = drm::device::Device<Rvkms>;
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
+pub(crate) struct Data {
+}
+
+/// DRM Driver implementation for `RvkmsDriver`
+#[vtable]
+impl drv::Driver for Rvkms {
+    type Data = Arc<Data>;
+    type Object = gem::Object;
+    type File = file::File;
+    type Kms = Self;
+
+    const INFO: drv::DriverInfo = INFO;
+    const FEATURES:u32 = drv::FEAT_GEM | drv::FEAT_MODESET | drv::FEAT_ATOMIC;
+
+    kernel::declare_drm_ioctls! {}
+}
+
+#[vtable]
+impl Kms for Rvkms {
+    type Driver = Self;
+    type Fbdev = FbdevShmem<Self>;
+
+    fn mode_config_info(
+        _dev: &device::Device,
+        _drm_data: <<Self::Driver as drv::Driver>::Data as kernel::types::ForeignOwnable>::Borrowed<'_>,
+    ) -> Result<ModeConfigInfo> {
+        Ok(MODE_CONFIG_INFO)
+    }
+
+    fn create_objects(drm: &UnregisteredKmsDevice<'_, Self::Driver>) -> Result {
+        output::create_output(drm, 0)
+    }
+
+    fn atomic_commit_tail<'a>(
+        mut state: AtomicCommitTail<'a, Self::Driver>,
+        modeset_token: ModesetsReadyToken<'_>,
+        plane_update_token: PlaneUpdatesReadyToken<'_>,
+    ) -> CommittedAtomicState<'a, Self::Driver> {
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
+impl platform::Driver for Rvkms {
+    type Data = Arc<Data>;
+    type IdInfo = ();
+
+    fn probe(pdev: &mut platform::Device, id_info: Option<&Self::IdInfo>) -> Result<Self::Data> {
+        // XXX: do not fret, the mutable reference here is temporary (poke dakr if it isn't)
+        let dev: &device::Device = pdev.as_ref();
+        dev.pr_info(format_args!("RVKMS probing\n"));
+
+        let data = Arc::new(Data { }, GFP_KERNEL)?;
+        let drm = drv::Registration::<Rvkms>::new_foreign_owned(dev, data.clone(), 0)?;
+
+        Ok(data)
+    }
+}
+
+pub(crate) struct Rvkms {
+    drv_reg: Pin<Box<platform::Registration<Self>>>,
+    pdev: platform::Device,
+}
+
+const MODE_CONFIG_INFO: ModeConfigInfo = ModeConfigInfo {
+    min_resolution: MIN_RES,
+    max_resolution: MAX_RES,
+    max_cursor: (512, 512),
+    preferred_depth: 0,
+};
+
+impl kernel::Module for Rvkms {
+    fn init(name: &'static CStr, module: &'static ThisModule) -> kernel::error::Result<Self> {
+        pr_info!("RVKMS module loaded\n");
+
+        // Register the driver (FIXME: this should be static
+        let drv_reg = Box::try_pin_init(
+            platform::Registration::<Self>::new(name, module),
+            GFP_KERNEL
+        )?;
+
+        let pdev = platform::Device::create_simple(&NAME, 0)?;
+        let dev: &device::Device = pdev.as_ref();
+
+        Ok(Self {
+            drv_reg,
+            pdev,
+        })
+    }
+}
+
+module! {
+    type: Rvkms,
+    name: "rvkms",
+    author: "Lyude Paul",
+    description: "Rust VKMS Proof of Concept driver",
+    license: "GPL v2",
+}
-- 
2.46.1

