Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B9CFE7BA
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD2F10E5FB;
	Wed,  7 Jan 2026 15:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fbISWVLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882E10E5F0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767798604;
 bh=BPMa7EyGU4omU0N14YW7w2FFy9qgNG4FJNETsw3M0jY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fbISWVLZYpmoBQfjjmeOfvUBlCKoFBcpaih/89f0uxxHdwkpROypQH1xhG8mG8ZaF
 ij3Xp09LGxB/riP1qMUH8Hlmstg3U21uDaZjiAxEFigyXkLnVEfsCIBwqR8o6PGTvH
 qQO+EWUmnyGhTgwFLih4z5eqQ35hDMBleLOn7QuDg0yfRdWFDHnbl0JNAPgbpYfa+p
 ECSbi5+lpjmBKUhpr/wN63uyQv3v6iAL3CfcYylivGSthcGGJFp5saVNQu+7DP4M2k
 zaz175k/we5k3DfqoUMLadRfbJNSZWcLqhp0wUciL4F/LN4gX66/Zl/V8Tq+n8y3K1
 qEgyqs4Run5Rg==
Received: from [192.168.0.79] (unknown
 [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A486D17E13F6;
 Wed,  7 Jan 2026 16:09:59 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 07 Jan 2026 12:09:52 -0300
Subject: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
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

The current Clk abstraction can still be improved on the following issues:

a) It only keeps track of a count to clk_get(), which means that users have
to manually call disable() and unprepare(), or a variation of those, like
disable_unprepare().

b) It allows repeated calls to prepare() or enable(), but it keeps no track
of how often these were called, i.e., it's currently legal to write the
following:

clk.prepare();
clk.prepare();
clk.enable();
clk.enable();

And nothing gets undone on drop().

c) It adds a OptionalClk type that is probably not needed. There is no
"struct optional_clk" in C and we should probably not add one.

d) It does not let a user express the state of the clk through the
type system. For example, there is currently no way to encode that a Clk is
enabled via the type system alone.

In light of the Regulator abstraction that was recently merged, switch this
abstraction to use the type-state pattern instead. It solves both a) and b)
by establishing a number of states and the valid ways to transition between
them. It also automatically undoes any call to clk_get(), clk_prepare() and
clk_enable() as applicable on drop(), so users do not have to do anything
special before Clk goes out of scope.

It solves c) by removing the OptionalClk type, which is now simply encoded
as a Clk whose inner pointer is NULL.

It solves d) by directly encoding the state of the Clk into the type, e.g.:
Clk<Enabled> is now known to be a Clk that is enabled.

The INVARIANTS section for Clk is expanded to highlight the relationship
between the states and the respective reference counts that are owned by
each of them.

The examples are expanded to highlight how a user can transition between
states, as well as highlight some of the shortcuts built into the API.

The current implementation is also more flexible, in the sense that it
allows for more states to be added in the future. This lets us implement
different strategies for handling clocks, including one that mimics the
current API, allowing for multiple calls to prepare() and enable().

The users (cpufreq.rs/ rcpufreq_dt.rs) were updated by this patch (and not
a separate one) to reflect the new changes. This is needed, because
otherwise this patch would break the build.

Link: https://crates.io/crates/sealed [1]
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/cpufreq/rcpufreq_dt.rs |   2 +-
 drivers/gpu/drm/tyr/driver.rs  |  31 +---
 drivers/pwm/pwm_th1520.rs      |  17 +-
 rust/kernel/clk.rs             | 399 +++++++++++++++++++++++++++--------------
 rust/kernel/cpufreq.rs         |   8 +-
 5 files changed, 281 insertions(+), 176 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 31e07f0279db..f1bd7d71ed54 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -41,7 +41,7 @@ struct CPUFreqDTDevice {
     freq_table: opp::FreqTable,
     _mask: CpumaskVar,
     _token: Option<opp::ConfigToken>,
-    _clk: Clk,
+    _clk: Clk<kernel::clk::Unprepared>,
 }
 
 #[derive(Default)]
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 09711fb7fe0b..5692def25621 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -2,7 +2,7 @@
 
 use kernel::c_str;
 use kernel::clk::Clk;
-use kernel::clk::OptionalClk;
+use kernel::clk::Enabled;
 use kernel::device::Bound;
 use kernel::device::Core;
 use kernel::device::Device;
@@ -37,7 +37,7 @@ pub(crate) struct TyrDriver {
     device: ARef<TyrDevice>,
 }
 
-#[pin_data(PinnedDrop)]
+#[pin_data]
 pub(crate) struct TyrData {
     pub(crate) pdev: ARef<platform::Device>,
 
@@ -92,13 +92,9 @@ fn probe(
         pdev: &platform::Device<Core>,
         _info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
-        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
-        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
-        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
-
-        core_clk.prepare_enable()?;
-        stacks_clk.prepare_enable()?;
-        coregroup_clk.prepare_enable()?;
+        let core_clk = Clk::<Enabled>::get(pdev.as_ref(), Some(c_str!("core")))?;
+        let stacks_clk = Clk::<Enabled>::get_optional(pdev.as_ref(), Some(c_str!("stacks")))?;
+        let coregroup_clk = Clk::<Enabled>::get_optional(pdev.as_ref(), Some(c_str!("coregroup")))?;
 
         let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
         let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
@@ -145,17 +141,6 @@ impl PinnedDrop for TyrDriver {
     fn drop(self: Pin<&mut Self>) {}
 }
 
-#[pinned_drop]
-impl PinnedDrop for TyrData {
-    fn drop(self: Pin<&mut Self>) {
-        // TODO: the type-state pattern for Clks will fix this.
-        let clks = self.clks.lock();
-        clks.core.disable_unprepare();
-        clks.stacks.disable_unprepare();
-        clks.coregroup.disable_unprepare();
-    }
-}
-
 // We need to retain the name "panthor" to achieve drop-in compatibility with
 // the C driver in the userspace stack.
 const INFO: drm::DriverInfo = drm::DriverInfo {
@@ -181,9 +166,9 @@ impl drm::Driver for TyrDriver {
 
 #[pin_data]
 struct Clocks {
-    core: Clk,
-    stacks: OptionalClk,
-    coregroup: OptionalClk,
+    core: Clk<Enabled>,
+    stacks: Clk<Enabled>,
+    coregroup: Clk<Enabled>,
 }
 
 #[pin_data]
diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 043dc4dbc623..f4d03b988533 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -23,7 +23,7 @@
 use core::ops::Deref;
 use kernel::{
     c_str,
-    clk::Clk,
+    clk::{Clk, Enabled},
     device::{Bound, Core, Device},
     devres,
     io::mem::IoMem,
@@ -90,11 +90,11 @@ struct Th1520WfHw {
 }
 
 /// The driver's private data struct. It holds all necessary devres managed resources.
-#[pin_data(PinnedDrop)]
+#[pin_data]
 struct Th1520PwmDriverData {
     #[pin]
     iomem: devres::Devres<IoMem<TH1520_PWM_REG_SIZE>>,
-    clk: Clk,
+    clk: Clk<Enabled>,
 }
 
 impl pwm::PwmOps for Th1520PwmDriverData {
@@ -299,13 +299,6 @@ fn write_waveform(
     }
 }
 
-#[pinned_drop]
-impl PinnedDrop for Th1520PwmDriverData {
-    fn drop(self: Pin<&mut Self>) {
-        self.clk.disable_unprepare();
-    }
-}
-
 struct Th1520PwmPlatformDriver;
 
 kernel::of_device_table!(
@@ -326,9 +319,7 @@ fn probe(
         let dev = pdev.as_ref();
         let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
 
-        let clk = Clk::get(dev, None)?;
-
-        clk.prepare_enable()?;
+        let clk = Clk::<Enabled>::get(dev, None)?;
 
         // TODO: Get exclusive ownership of the clock to prevent rate changes.
         // The Rust equivalent of `clk_rate_exclusive_get()` is not yet available.
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index d192fbd97861..6323b40dc7ba 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -80,17 +80,78 @@ fn from(freq: Hertz) -> Self {
 mod common_clk {
     use super::Hertz;
     use crate::{
-        device::Device,
+        device::{Bound, Device},
         error::{from_err_ptr, to_result, Result},
         prelude::*,
     };
 
-    use core::{ops::Deref, ptr};
+    use core::{marker::PhantomData, mem::ManuallyDrop, ptr};
+
+    mod private {
+        pub trait Sealed {}
+
+        impl Sealed for super::Unprepared {}
+        impl Sealed for super::Prepared {}
+        impl Sealed for super::Enabled {}
+    }
+
+    /// A trait representing the different states that a [`Clk`] can be in.
+    pub trait ClkState: private::Sealed {
+        /// Whether the clock should be disabled when dropped.
+        const DISABLE_ON_DROP: bool;
+
+        /// Whether the clock should be unprepared when dropped.
+        const UNPREPARE_ON_DROP: bool;
+    }
+
+    /// A state where the [`Clk`] is not prepared and not enabled.
+    pub struct Unprepared;
+
+    /// A state where the [`Clk`] is prepared but not enabled.
+    pub struct Prepared;
+
+    /// A state where the [`Clk`] is both prepared and enabled.
+    pub struct Enabled;
+
+    impl ClkState for Unprepared {
+        const DISABLE_ON_DROP: bool = false;
+        const UNPREPARE_ON_DROP: bool = false;
+    }
+
+    impl ClkState for Prepared {
+        const DISABLE_ON_DROP: bool = false;
+        const UNPREPARE_ON_DROP: bool = true;
+    }
+
+    impl ClkState for Enabled {
+        const DISABLE_ON_DROP: bool = true;
+        const UNPREPARE_ON_DROP: bool = true;
+    }
+
+    /// An error that can occur when trying to convert a [`Clk`] between states.
+    pub struct Error<State: ClkState> {
+        /// The error that occurred.
+        pub error: kernel::error::Error,
+
+        /// The [`Clk`] that caused the error, so that the operation may be
+        /// retried.
+        pub clk: Clk<State>,
+    }
 
     /// A reference-counted clock.
     ///
     /// Rust abstraction for the C [`struct clk`].
     ///
+    /// A [`Clk`] instance represents a clock that can be in one of several
+    /// states: [`Unprepared`], [`Prepared`], or [`Enabled`].
+    ///
+    /// No action needs to be taken when a [`Clk`] is dropped. The calls to
+    /// `clk_unprepare()` and `clk_disable()` will be placed as applicable.
+    ///
+    /// An optional [`Clk`] is treated just like a regular [`Clk`], but its
+    /// inner `struct clk` pointer is `NULL`. This interfaces correctly with the
+    /// C API and also exposes all the methods of a regular [`Clk`] to users.
+    ///
     /// # Invariants
     ///
     /// A [`Clk`] instance holds either a pointer to a valid [`struct clk`] created by the C
@@ -99,20 +160,39 @@ mod common_clk {
     /// Instances of this type are reference-counted. Calling [`Clk::get`] ensures that the
     /// allocation remains valid for the lifetime of the [`Clk`].
     ///
+    /// The [`Prepared`] state is associated with a single count of
+    /// `clk_prepare()`, and the [`Enabled`] state is associated with a single
+    /// count of `clk_enable()`, and the [`Prepared`] state is associated with a
+    /// single count of `clk_prepare()` and `clk_enable()`.
+    ///
+    /// All states are associated with a single count of `clk_get()`.
+    ///
     /// # Examples
     ///
     /// The following example demonstrates how to obtain and configure a clock for a device.
     ///
     /// ```
     /// use kernel::c_str;
-    /// use kernel::clk::{Clk, Hertz};
-    /// use kernel::device::Device;
+    /// use kernel::clk::{Clk, Enabled, Hertz, Unprepared, Prepared};
+    /// use kernel::device::{Bound, Device};
     /// use kernel::error::Result;
     ///
-    /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = Clk::get(dev, Some(c_str!("apb_clk")))?;
+    /// fn configure_clk(dev: &Device<Bound>) -> Result {
+    ///     // The fastest way is to use a version of `Clk::get` for the desired
+    ///     // state, i.e.:
+    ///     let clk: Clk<Enabled> = Clk::<Enabled>::get(dev, Some(c_str!("apb_clk")))?;
     ///
-    ///     clk.prepare_enable()?;
+    ///     // Any other state is also possible, e.g.:
+    ///     let clk: Clk<Prepared> = Clk::<Prepared>::get(dev, Some(c_str!("apb_clk")))?;
+    ///
+    ///     // Later:
+    ///     let clk: Clk<Enabled> = clk.enable().map_err(|error| {
+    ///         error.error
+    ///     })?;
+    ///
+    ///     // Note that error.clk is the original `clk` if the operation
+    ///     // failed. It is provided as a convenience so that the operation may be
+    ///     // retried in case of errors.
     ///
     ///     let expected_rate = Hertz::from_ghz(1);
     ///
@@ -120,111 +200,208 @@ mod common_clk {
     ///         clk.set_rate(expected_rate)?;
     ///     }
     ///
-    ///     clk.disable_unprepare();
+    ///     // Nothing is needed here. The drop implementation will undo any
+    ///     // operations as appropriate.
+    ///     Ok(())
+    /// }
+    ///
+    /// fn shutdown(clk: Clk<Enabled>) -> Result {
+    ///     // The states can be traversed "in the reverse order" as well:
+    ///     let clk: Clk<Prepared> = clk.disable().map_err(|error| {
+    ///         error.error
+    ///     })?;
+    ///
+    ///     // This is of type `Clk<Unprepared>`.
+    ///     let clk = clk.unprepare();
+    ///
     ///     Ok(())
     /// }
     /// ```
     ///
     /// [`struct clk`]: https://docs.kernel.org/driver-api/clk.html
     #[repr(transparent)]
-    pub struct Clk(*mut bindings::clk);
+    pub struct Clk<T: ClkState> {
+        inner: *mut bindings::clk,
+        _phantom: core::marker::PhantomData<T>,
+    }
 
     // SAFETY: It is safe to call `clk_put` on another thread than where `clk_get` was called.
-    unsafe impl Send for Clk {}
+    unsafe impl<T: ClkState> Send for Clk<T> {}
 
     // SAFETY: It is safe to call any combination of the `&self` methods in parallel, as the
     // methods are synchronized internally.
-    unsafe impl Sync for Clk {}
+    unsafe impl<T: ClkState> Sync for Clk<T> {}
 
-    impl Clk {
-        /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
+    impl Clk<Unprepared> {
+        /// Gets [`Clk`] corresponding to a bound [`Device`] and a connection
+        /// id.
         ///
         /// Equivalent to the kernel's [`clk_get`] API.
         ///
         /// [`clk_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get
-        pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        #[inline]
+        pub fn get(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Unprepared>> {
             let con_id = name.map_or(ptr::null(), |n| n.as_char_ptr());
 
-            // SAFETY: It is safe to call [`clk_get`] for a valid device pointer.
-            //
+            // SAFETY: It is safe to call [`clk_get`] for a valid device pointer
+            // and any `con_id`, including NULL.
+            let inner = from_err_ptr(unsafe { bindings::clk_get(dev.as_raw(), con_id) })?;
+
             // INVARIANT: The reference-count is decremented when [`Clk`] goes out of scope.
-            Ok(Self(from_err_ptr(unsafe {
-                bindings::clk_get(dev.as_raw(), con_id)
-            })?))
+            Ok(Self {
+                inner,
+                _phantom: PhantomData,
+            })
         }
 
-        /// Obtain the raw [`struct clk`] pointer.
+        /// Behaves the same as [`Self::get`], except when there is no clock
+        /// producer. In this case, instead of returning [`ENOENT`], it returns
+        /// a dummy [`Clk`].
         #[inline]
-        pub fn as_raw(&self) -> *mut bindings::clk {
-            self.0
+        pub fn get_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Unprepared>> {
+            let con_id = name.map_or(ptr::null(), |n| n.as_char_ptr());
+
+            // SAFETY: It is safe to call [`clk_get`] for a valid device pointer
+            // and any `con_id`, including NULL.
+            let inner = from_err_ptr(unsafe { bindings::clk_get_optional(dev.as_raw(), con_id) })?;
+
+            // INVARIANT: The reference-count is decremented when [`Clk`] goes out of scope.
+            Ok(Self {
+                inner,
+                _phantom: PhantomData,
+            })
         }
 
-        /// Enable the clock.
+        /// Attempts to convert the [`Clk`] to a [`Prepared`] state.
         ///
-        /// Equivalent to the kernel's [`clk_enable`] API.
+        /// Equivalent to the kernel's [`clk_prepare`] API.
         ///
-        /// [`clk_enable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_enable
+        /// [`clk_prepare`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_prepare
         #[inline]
-        pub fn enable(&self) -> Result {
-            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
-            // [`clk_enable`].
-            to_result(unsafe { bindings::clk_enable(self.as_raw()) })
+        pub fn prepare(self) -> Result<Clk<Prepared>, Error<Unprepared>> {
+            // We will be transferring the ownership of our `clk_get()` count to
+            // `Clk<Prepared>`.
+            let clk = ManuallyDrop::new(self);
+
+            // SAFETY: By the type invariants, `self.0` is a valid argument for
+            // [`clk_prepare`].
+            to_result(unsafe { bindings::clk_prepare(clk.as_raw()) })
+                .map(|()| Clk {
+                    inner: clk.inner,
+                    _phantom: PhantomData,
+                })
+                .map_err(|error| Error {
+                    error,
+                    clk: ManuallyDrop::into_inner(clk),
+                })
         }
+    }
 
-        /// Disable the clock.
-        ///
-        /// Equivalent to the kernel's [`clk_disable`] API.
+    impl Clk<Prepared> {
+        /// Obtains a [`Clk`] from a bound [`Device`] and a connection id and
+        /// prepares it.
         ///
-        /// [`clk_disable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_disable
+        /// Equivalent to calling [`Clk::get`], followed by [`Clk::prepare`],
         #[inline]
-        pub fn disable(&self) {
-            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
-            // [`clk_disable`].
-            unsafe { bindings::clk_disable(self.as_raw()) };
+        pub fn get(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Prepared>> {
+            Clk::<Unprepared>::get(dev, name)?
+                .prepare()
+                .map_err(|error| error.error)
         }
 
-        /// Prepare the clock.
-        ///
-        /// Equivalent to the kernel's [`clk_prepare`] API.
-        ///
-        /// [`clk_prepare`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_prepare
+        /// Behaves the same as [`Self::get`], except when there is no clock
+        /// producer. In this case, instead of returning [`ENOENT`], it returns
+        /// a dummy [`Clk`].
         #[inline]
-        pub fn prepare(&self) -> Result {
-            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
-            // [`clk_prepare`].
-            to_result(unsafe { bindings::clk_prepare(self.as_raw()) })
+        pub fn get_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Prepared>> {
+            Clk::<Unprepared>::get_optional(dev, name)?
+                .prepare()
+                .map_err(|error| error.error)
         }
 
-        /// Unprepare the clock.
+        /// Attempts to convert the [`Clk`] to an [`Unprepared`] state.
         ///
         /// Equivalent to the kernel's [`clk_unprepare`] API.
-        ///
-        /// [`clk_unprepare`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_unprepare
         #[inline]
-        pub fn unprepare(&self) {
-            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+        pub fn unprepare(self) -> Clk<Unprepared> {
+            // We will be transferring the ownership of our `clk_get()` count to
+            // `Clk<Unprepared>`.
+            let clk = ManuallyDrop::new(self);
+
+            // SAFETY: By the type invariants, `self.0` is a valid argument for
             // [`clk_unprepare`].
-            unsafe { bindings::clk_unprepare(self.as_raw()) };
+            unsafe { bindings::clk_unprepare(clk.as_raw()) }
+
+            Clk {
+                inner: clk.inner,
+                _phantom: PhantomData,
+            }
         }
 
-        /// Prepare and enable the clock.
+        /// Attempts to convert the [`Clk`] to an [`Enabled`] state.
+        ///
+        /// Equivalent to the kernel's [`clk_enable`] API.
         ///
-        /// Equivalent to calling [`Clk::prepare`] followed by [`Clk::enable`].
+        /// [`clk_enable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_enable
         #[inline]
-        pub fn prepare_enable(&self) -> Result {
-            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
-            // [`clk_prepare_enable`].
-            to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) })
+        pub fn enable(self) -> Result<Clk<Enabled>, Error<Prepared>> {
+            // We will be transferring the ownership of our `clk_get()` and
+            // `clk_prepare()` counts to `Clk<Enabled>`.
+            let clk = ManuallyDrop::new(self);
+
+            // SAFETY: By the type invariants, `self.0` is a valid argument for
+            // [`clk_enable`].
+            to_result(unsafe { bindings::clk_enable(clk.as_raw()) })
+                .map(|()| Clk {
+                    inner: clk.inner,
+                    _phantom: PhantomData,
+                })
+                .map_err(|error| Error {
+                    error,
+                    clk: ManuallyDrop::into_inner(clk),
+                })
         }
+    }
 
-        /// Disable and unprepare the clock.
+    impl Clk<Enabled> {
+        /// Gets [`Clk`] corresponding to a bound [`Device`] and a connection id
+        /// and then prepares and enables it.
         ///
-        /// Equivalent to calling [`Clk::disable`] followed by [`Clk::unprepare`].
+        /// Equivalent to calling [`Clk::get`], followed by [`Clk::prepare`],
+        /// followed by [`Clk::enable`].
         #[inline]
-        pub fn disable_unprepare(&self) {
-            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
-            // [`clk_disable_unprepare`].
-            unsafe { bindings::clk_disable_unprepare(self.as_raw()) };
+        pub fn get(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Enabled>> {
+            Clk::<Prepared>::get(dev, name)?
+                .enable()
+                .map_err(|error| error.error)
+        }
+
+        /// Behaves the same as [`Self::get`], except when there is no clock
+        /// producer. In this case, instead of returning [`ENOENT`], it returns
+        /// a dummy [`Clk`].
+        #[inline]
+        pub fn get_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Enabled>> {
+            Clk::<Prepared>::get_optional(dev, name)?
+                .enable()
+                .map_err(|error| error.error)
+        }
+
+        /// Attempts to disable the [`Clk`] and convert it to the [`Prepared`]
+        /// state.
+        #[inline]
+        pub fn disable(self) -> Result<Clk<Prepared>, Error<Enabled>> {
+            // We will be transferring the ownership of our `clk_get()` and
+            // `clk_enable()` counts to `Clk<Prepared>`.
+            let clk = ManuallyDrop::new(self);
+
+            // SAFETY: By the type invariants, `self.0` is a valid argument for
+            // [`clk_disable`].
+            unsafe { bindings::clk_disable(clk.as_raw()) };
+
+            Ok(Clk {
+                inner: clk.inner,
+                _phantom: PhantomData,
+            })
         }
 
         /// Get clock's rate.
@@ -252,83 +429,31 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
         }
     }
 
-    impl Drop for Clk {
-        fn drop(&mut self) {
-            // SAFETY: By the type invariants, self.as_raw() is a valid argument for [`clk_put`].
-            unsafe { bindings::clk_put(self.as_raw()) };
-        }
-    }
-
-    /// A reference-counted optional clock.
-    ///
-    /// A lightweight wrapper around an optional [`Clk`]. An [`OptionalClk`] represents a [`Clk`]
-    /// that a driver can function without but may improve performance or enable additional
-    /// features when available.
-    ///
-    /// # Invariants
-    ///
-    /// An [`OptionalClk`] instance encapsulates a [`Clk`] with either a valid [`struct clk`] or
-    /// `NULL` pointer.
-    ///
-    /// Instances of this type are reference-counted. Calling [`OptionalClk::get`] ensures that the
-    /// allocation remains valid for the lifetime of the [`OptionalClk`].
-    ///
-    /// # Examples
-    ///
-    /// The following example demonstrates how to obtain and configure an optional clock for a
-    /// device. The code functions correctly whether or not the clock is available.
-    ///
-    /// ```
-    /// use kernel::c_str;
-    /// use kernel::clk::{OptionalClk, Hertz};
-    /// use kernel::device::Device;
-    /// use kernel::error::Result;
-    ///
-    /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
-    ///
-    ///     clk.prepare_enable()?;
-    ///
-    ///     let expected_rate = Hertz::from_ghz(1);
-    ///
-    ///     if clk.rate() != expected_rate {
-    ///         clk.set_rate(expected_rate)?;
-    ///     }
-    ///
-    ///     clk.disable_unprepare();
-    ///     Ok(())
-    /// }
-    /// ```
-    ///
-    /// [`struct clk`]: https://docs.kernel.org/driver-api/clk.html
-    pub struct OptionalClk(Clk);
-
-    impl OptionalClk {
-        /// Gets [`OptionalClk`] corresponding to a [`Device`] and a connection id.
-        ///
-        /// Equivalent to the kernel's [`clk_get_optional`] API.
-        ///
-        /// [`clk_get_optional`]:
-        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_optional
-        pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
-            let con_id = name.map_or(ptr::null(), |n| n.as_char_ptr());
-
-            // SAFETY: It is safe to call [`clk_get_optional`] for a valid device pointer.
-            //
-            // INVARIANT: The reference-count is decremented when [`OptionalClk`] goes out of
-            // scope.
-            Ok(Self(Clk(from_err_ptr(unsafe {
-                bindings::clk_get_optional(dev.as_raw(), con_id)
-            })?)))
+    impl<T: ClkState> Clk<T> {
+        /// Obtain the raw [`struct clk`] pointer.
+        #[inline]
+        pub fn as_raw(&self) -> *mut bindings::clk {
+            self.inner
         }
     }
 
-    // Make [`OptionalClk`] behave like [`Clk`].
-    impl Deref for OptionalClk {
-        type Target = Clk;
+    impl<T: ClkState> Drop for Clk<T> {
+        fn drop(&mut self) {
+            if T::DISABLE_ON_DROP {
+                // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+                // [`clk_disable`].
+                unsafe { bindings::clk_disable(self.as_raw()) };
+            }
+
+            if T::UNPREPARE_ON_DROP {
+                // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+                // [`clk_unprepare`].
+                unsafe { bindings::clk_unprepare(self.as_raw()) };
+            }
 
-        fn deref(&self) -> &Clk {
-            &self.0
+            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+            // [`clk_put`].
+            unsafe { bindings::clk_put(self.as_raw()) };
         }
     }
 }
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index f968fbd22890..d51c697cad9e 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -552,8 +552,12 @@ pub fn cpus(&mut self) -> &mut cpumask::Cpumask {
     /// The caller must guarantee that the returned [`Clk`] is not dropped while it is getting used
     /// by the C code.
     #[cfg(CONFIG_COMMON_CLK)]
-    pub unsafe fn set_clk(&mut self, dev: &Device, name: Option<&CStr>) -> Result<Clk> {
-        let clk = Clk::get(dev, name)?;
+    pub unsafe fn set_clk(
+        &mut self,
+        dev: &Device<Bound>,
+        name: Option<&CStr>,
+    ) -> Result<Clk<crate::clk::Unprepared>> {
+        let clk = Clk::<crate::clk::Unprepared>::get(dev, name)?;
         self.as_mut_ref().clk = clk.as_raw();
         Ok(clk)
     }

-- 
2.52.0

