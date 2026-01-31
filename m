Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPnpFN9JfWlZRQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 01:16:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B2BF903
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 01:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0C410E8F1;
	Sat, 31 Jan 2026 00:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wk8hN6hE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E2710E1B1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 00:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769818587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGQccfhi4ulRrwHBcmIQIhpJ7Iv6SLwpCJtDpKvtGf0=;
 b=Wk8hN6hEY0lgEn9FvHmZSzpp56ISK6gsMtf1BwPQlhH7IfiLPVRxI6k+ZSsLrGoSyjmK27
 /Hdzmp2f992rs5hXIIznSpOuN+mxi+PP0+T87dm3rFnlSSumgVfitmeoj4s+E6Novqb7SV
 VaHeCbxFME1UMnruQIC/h4XVIRkehRA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-12VjW26BOyOo8rqcupMq3A-1; Fri,
 30 Jan 2026 19:16:23 -0500
X-MC-Unique: 12VjW26BOyOo8rqcupMq3A-1
X-Mimecast-MFC-AGG-ID: 12VjW26BOyOo8rqcupMq3A_1769818581
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8C9D9195608D; Sat, 31 Jan 2026 00:16:21 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.64])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 71FA218002A6; Sat, 31 Jan 2026 00:16:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, "Miguel Ojeda" <ojeda@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>,
 "Shankari Anand" <shankari.ak0208@gmail.com>,
 "David Airlie" <airlied@gmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v5 1/4] rust/drm: Introduce DeviceContext
Date: Fri, 30 Jan 2026 19:13:30 -0500
Message-ID: <20260131001602.2095470-2-lyude@redhat.com>
In-Reply-To: <20260131001602.2095470-1-lyude@redhat.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net,collabora.com,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lossin@kernel.org,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:lyude@redhat.com,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F10B2BF903
X-Rspamd-Action: no action

One of the tricky things about DRM bindings in Rust is the fact that
initialization of a DRM device is a multi-step process. It's quite normal
for a device driver to start making use of its DRM device for tasks like
creating GEM objects before userspace registration happens. This is an
issue in rust though, since prior to userspace registration the device is
only partly initialized. This means there's a plethora of DRM device
operations we can't yet expose without opening up the door to UB if the DRM
device in question isn't yet registered.

Additionally, this isn't something we can reliably check at runtime. And
even if we could, performing an operation which requires the device be
registered when the device isn't actually registered is a programmer bug,
meaning there's no real way to gracefully handle such a mistake at runtime.
And even if that wasn't the case, it would be horrendously annoying and
noisy to have to check if a device is registered constantly throughout a
driver.

In order to solve this, we first take inspiration from
`kernel::device::DeviceContext` and introduce `kernel::drm::DeviceContext`.
This provides us with a ZST type that we can generalize over to represent
contexts where a device is known to have been registered with userspace at
some point in time (`Registered`), along with contexts where we can't make
such a guarantee (`Uninit`).

It's important to note we intentionally do not provide a `DeviceContext`
which represents an unregistered device. This is because there's no
reasonable way to guarantee that a device with long-living references to
itself will not be registered eventually with userspace. Instead, we
provide a new-type for this: `UnregisteredDevice` which can
provide a guarantee that the `Device` has never been registered with
userspace. To ensure this, we modify `Registration` so that creating a new
`Registration` requires passing ownership of an `UnregisteredDevice`.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Make sure that `UnregisteredDevice` is not thread-safe (since DRM device
  initialization is also not thread-safe)
* Rename from AnyCtx to Uninit, I think this name actually makes a bit more
  sense.
* Change assume_registered() to assume_ctx()
  Since it looks like in some situations, we'll want to update the
  DeviceContext of a object to the latest DeviceContext we know the Device
  to be in.
* Rename Init to Uninit
  When we eventually add KMS support, we're going to have 3 different
  DeviceContexts - Uninit, Init, Registered. Additionally, aside from not
  being registered there are a number of portions of the rest of the Device
  which also aren't usable before at least the Init context - so the naming
  of Uninit makes this a little clearer.
* s/DeviceContext/DeviceContext/
  For consistency with the rest of the kernel
* Drop as_ref::<Device<T, Uninit>>() for now since I don't actually think
  we need this quite yet
V3:
* Get rid of drm_dev_ctx!, as we don't actually need to implement Send or
  Sync ourselves
* Remove mention of C function in drm::device::Registration rustdoc
* Add more documentation to the DeviceContext trait, go into detail about
  the various setup phases and such.
* Add missing period to comment in `UnregisteredDevice::new()`.
V4:
* Address some comments from Danilo I missed last round:
  * Remove leftover rebase detritus from new_foreign_owned()
    (the seemingly useless cast)
  * Remove no-op mention in Registered device context

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/driver.rs |   8 +-
 drivers/gpu/drm/tyr/driver.rs  |  10 +-
 rust/kernel/drm/device.rs      | 178 +++++++++++++++++++++++++++------
 rust/kernel/drm/driver.rs      |  35 +++++--
 rust/kernel/drm/mod.rs         |   4 +
 5 files changed, 190 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index b1af0a099551d..99d6841b69cbc 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -21,7 +21,7 @@ pub(crate) struct NovaDriver {
 }
 
 /// Convienence type alias for the DRM device type for this driver
-pub(crate) type NovaDevice = drm::Device<NovaDriver>;
+pub(crate) type NovaDevice<Ctx = drm::Registered> = drm::Device<NovaDriver, Ctx>;
 
 #[pin_data]
 pub(crate) struct NovaData {
@@ -56,10 +56,10 @@ impl auxiliary::Driver for NovaDriver {
     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
-        let drm = drm::Device::<Self>::new(adev.as_ref(), data)?;
-        drm::Registration::new_foreign_owned(&drm, adev.as_ref(), 0)?;
+        let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
+        let drm = drm::Registration::new_foreign_owned(drm, adev.as_ref(), 0)?;
 
-        Ok(Self { drm })
+        Ok(Self { drm: drm.into() })
     }
 }
 
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 568cb89aaed86..0d479b5d7bd62 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -30,7 +30,7 @@
 pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
 
 /// Convenience type alias for the DRM device type for this driver.
-pub(crate) type TyrDevice = drm::Device<TyrDriver>;
+pub(crate) type TyrDevice<Ctx = drm::Registered> = drm::Device<TyrDriver, Ctx>;
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrDriver {
@@ -133,10 +133,12 @@ fn probe(
                 gpu_info,
         });
 
-        let tdev: ARef<TyrDevice> = drm::Device::new(pdev.as_ref(), data)?;
-        drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
+        let tdev = drm::UnregisteredDevice::<Self>::new(pdev.as_ref(), data)?;
+        let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
 
-        let driver = TyrDriver { _device: tdev };
+        let driver = TyrDriver {
+            _device: tdev.into(),
+        };
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 629ef0bd1188e..8f1780b8f0196 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -10,7 +10,8 @@
     device,
     drm::{
         self,
-        driver::AllocImpl, //
+        driver::AllocImpl,
+        private::Sealed, //
     },
     error::from_err_ptr,
     prelude::*,
@@ -18,10 +19,14 @@
         ARef,
         AlwaysRefCounted, //
     },
-    types::Opaque, //
+    types::{
+        NotThreadSafe,
+        Opaque, //
+    }, //
 };
 use core::{
     alloc::Layout,
+    marker::PhantomData,
     mem,
     ops::Deref,
     ptr::{
@@ -61,26 +66,98 @@ macro_rules! drm_legacy_fields {
     }
 }
 
-/// A typed DRM device with a specific `drm::Driver` implementation.
+/// A trait implemented by all possible contexts a [`Device`] can be used in.
 ///
-/// The device is always reference-counted.
+/// Setting up a new [`Device`] is a multi-stage process. Each step of the process that a user
+/// interacts with in Rust has a respective [`DeviceContext`] typestate. For example,
+/// `Device<T, Registered>` would be a [`Device`] that reached the [`Registered`] [`DeviceContext`].
+///
+/// Each stage of this process is described below:
+///
+/// ```text
+///        1                     2                         3
+/// +--------------+   +------------------+   +-----------------------+
+/// |Device created| → |Device initialized| → |Registered w/ userspace|
+/// +--------------+   +------------------+   +-----------------------+
+///    (Uninit)                                      (Registered)
+/// ```
+///
+/// 1. The [`Device`] is in the [`Uninit`] context and is not guaranteed to be initialized or
+///    registered with userspace. Only a limited subset of DRM core functionality is available.
+/// 2. The [`Device`] is guaranteed to be fully initialized, but is not guaranteed to be registered
+///    with userspace. All DRM core functionality which doesn't interact with userspace is
+///    available. We currently don't have a context for representing this.
+/// 3. The [`Device`] is guaranteed to be fully initialized, and is guaranteed to have been
+///    registered with userspace at some point - thus putting it in the [`Registered`] context.
+///
+/// An important caveat of [`DeviceContext`] which must be kept in mind: when used as a typestate
+/// for a reference type, it can only guarantee that a [`Device`] reached a particular stage in the
+/// initialization process _at the time the reference was taken_. No guarantee is made in regards to
+/// what stage of the process the [`Device`] is currently in. This means for instance that a
+/// `&Device<T, Uninit>` may actually be registered with userspace, it just wasn't known to be
+/// registered at the time the reference was taken.
+pub trait DeviceContext: Sealed + Send + Sync {}
+
+/// The [`DeviceContext`] of a [`Device`] that was registered with userspace at some point.
+///
+/// This represents a [`Device`] which is guaranteed to have been registered with userspace at
+/// some point in time. Such a DRM device is guaranteed to have been fully-initialized.
+///
+/// Note: A device in this context is not guaranteed to remain registered with userspace for its
+/// entire lifetime, as this is impossible to guarantee at compile-time.
 ///
 /// # Invariants
 ///
-/// `self.dev` is a valid instance of a `struct device`.
-#[repr(C)]
-pub struct Device<T: drm::Driver> {
-    dev: Opaque<bindings::drm_device>,
-    data: T::Data,
+/// A [`Device`] in this [`DeviceContext`] is guaranteed to have been registered with userspace
+/// at some point in time.
+pub struct Registered;
+
+impl Sealed for Registered {}
+impl DeviceContext for Registered {}
+
+/// The [`DeviceContext`] of a [`Device`] that may be unregistered and partly uninitialized.
+///
+/// A [`Device`] in this context is only guaranteed to be partly initialized, and may or may not
+/// be registered with userspace. Thus operations which depend on the [`Device`] being fully
+/// initialized, or which depend on the [`Device`] being registered with userspace are not
+/// available through this [`DeviceContext`].
+///
+/// A [`Device`] in this context can be used to create a
+/// [`Registration`](drm::driver::Registration).
+pub struct Uninit;
+
+impl Sealed for Uninit {}
+impl DeviceContext for Uninit {}
+
+/// A [`Device`] which is known at compile-time to be unregistered with userspace.
+///
+/// This type allows performing operations which are only safe to do before userspace registration,
+/// and can be used to create a [`Registration`](drm::driver::Registration) once the driver is ready
+/// to register the device with userspace.
+///
+/// Since DRM device initialization must be single-threaded, this object is not thread-safe.
+///
+/// # Invariants
+///
+/// The device in `self.0` is guaranteed to be a newly created [`Device`] that has not yet been
+/// registered with userspace until this type is dropped.
+pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, Uninit>>, NotThreadSafe);
+
+impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
+    type Target = Device<T, Uninit>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
 }
 
-impl<T: drm::Driver> Device<T> {
+impl<T: drm::Driver> UnregisteredDevice<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
         unload: None,
-        release: Some(Self::release),
+        release: Some(Device::<T>::release),
         master_set: None,
         master_drop: None,
         debugfs_init: None,
@@ -108,8 +185,10 @@ impl<T: drm::Driver> Device<T> {
 
     const GEM_FOPS: bindings::file_operations = drm::gem::create_fops();
 
-    /// Create a new `drm::Device` for a `drm::Driver`.
-    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
+    /// Create a new `UnregisteredDevice` for a `drm::Driver`.
+    ///
+    /// This can be used to create a [`Registration`](kernel::drm::Registration).
+    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
         let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
@@ -117,12 +196,12 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
         // SAFETY:
         // - `VTABLE`, as a `const` is pinned to the read-only section of the compilation,
         // - `dev` is valid by its type invarants,
-        let raw_drm: *mut Self = unsafe {
+        let raw_drm: *mut Device<T, Uninit> = unsafe {
             bindings::__drm_dev_alloc(
                 dev.as_raw(),
                 &Self::VTABLE,
                 layout.size(),
-                mem::offset_of!(Self, dev),
+                mem::offset_of!(Device<T, Uninit>, dev),
             )
         }
         .cast();
@@ -137,7 +216,7 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
         unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
             // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `__drm_dev_alloc` was
             // successful.
-            let drm_dev = unsafe { Self::into_drm_device(raw_drm) };
+            let drm_dev = unsafe { Device::into_drm_device(raw_drm) };
 
             // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_dev` must be valid and the
             // refcount must be non-zero.
@@ -146,9 +225,39 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
 
         // SAFETY: The reference count is one, and now we take ownership of that reference as a
         // `drm::Device`.
-        Ok(unsafe { ARef::from_raw(raw_drm) })
+        // INVARIANT: We just created the device above, but have yet to call `drm_dev_register`.
+        // `Self` cannot be copied or sent to another thread - ensuring that `drm_dev_register`
+        // won't be called during its lifetime and that the device is unregistered.
+        Ok(Self(unsafe { ARef::from_raw(raw_drm) }, NotThreadSafe))
     }
+}
 
+/// A typed DRM device with a specific [`drm::Driver`] implementation and [`DeviceContext`].
+///
+/// Since DRM devices can be used before being fully initialized and registered with userspace, `C`
+/// represents the furthest [`DeviceContext`] we can guarantee that this [`Device`] has reached.
+///
+/// Keep in mind: this means that an unregistered device can still have the registration state
+/// [`Registered`] as long as it was registered with userspace once in the past, and that the
+/// behavior of such a device is still well-defined. Additionally, a device with the registration
+/// state [`Uninit`] simply does not have a guaranteed registration state at compile time, and could
+/// be either registered or unregistered. Since there is no way to guarantee a long-lived reference
+/// to an unregistered device would remain unregistered, we do not provide a [`DeviceContext`] for
+/// this.
+///
+/// # Invariants
+///
+/// * `self.dev` is a valid instance of a `struct device`.
+/// * The data layout of `Self` remains the same across all implementations of `C`.
+/// * Any invariants for `C` also apply.
+#[repr(C)]
+pub struct Device<T: drm::Driver, C: DeviceContext = Registered> {
+    dev: Opaque<bindings::drm_device>,
+    data: T::Data,
+    _ctx: PhantomData<C>,
+}
+
+impl<T: drm::Driver, C: DeviceContext> Device<T, C> {
     pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
         self.dev.get()
     }
@@ -174,13 +283,13 @@ unsafe fn into_drm_device(ptr: NonNull<Self>) -> *mut bindings::drm_device {
     ///
     /// # Safety
     ///
-    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
-    /// i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
-    /// to can't drop to zero, for the duration of this function call and the entire duration when
-    /// the returned reference exists.
-    ///
-    /// Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
-    /// embedded in `Self`.
+    /// * Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
+    ///   i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
+    ///   to can't drop to zero, for the duration of this function call and the entire duration when
+    ///   the returned reference exists.
+    /// * Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
+    ///   embedded in `Self`.
+    /// * Callers promise that any type invariants of `C` will be upheld.
     #[doc(hidden)]
     pub unsafe fn from_raw<'a>(ptr: *const bindings::drm_device) -> &'a Self {
         // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
@@ -200,9 +309,20 @@ extern "C" fn release(ptr: *mut bindings::drm_device) {
         // - `this` is valid for dropping.
         unsafe { core::ptr::drop_in_place(this) };
     }
+
+    /// Change the [`DeviceContext`] for a [`Device`].
+    ///
+    /// # Safety
+    ///
+    /// The caller promises that `self` fulfills all of the guarantees provided by the given
+    /// [`DeviceContext`].
+    pub(crate) unsafe fn assume_ctx<NewCtx: DeviceContext>(&self) -> &Device<T, NewCtx> {
+        // SAFETY: The data layout is identical via our type invariants.
+        unsafe { mem::transmute(self) }
+    }
 }
 
-impl<T: drm::Driver> Deref for Device<T> {
+impl<T: drm::Driver, C: DeviceContext> Deref for Device<T, C> {
     type Target = T::Data;
 
     fn deref(&self) -> &Self::Target {
@@ -212,7 +332,7 @@ fn deref(&self) -> &Self::Target {
 
 // SAFETY: DRM device objects are always reference counted and the get/put functions
 // satisfy the requirements.
-unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
+unsafe impl<T: drm::Driver, C: DeviceContext> AlwaysRefCounted for Device<T, C> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::drm_dev_get(self.as_raw()) };
@@ -227,7 +347,7 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
-impl<T: drm::Driver> AsRef<device::Device> for Device<T> {
+impl<T: drm::Driver, C: DeviceContext> AsRef<device::Device> for Device<T, C> {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
         // which is guaranteed by the type invariant.
@@ -236,8 +356,8 @@ fn as_ref(&self) -> &device::Device {
 }
 
 // SAFETY: A `drm::Device` can be released from any thread.
-unsafe impl<T: drm::Driver> Send for Device<T> {}
+unsafe impl<T: drm::Driver, C: DeviceContext> Send for Device<T, C> {}
 
 // SAFETY: A `drm::Device` can be shared among threads because all immutable methods are protected
 // by the synchronization in `struct drm_device`.
-unsafe impl<T: drm::Driver> Sync for Device<T> {}
+unsafe impl<T: drm::Driver, C: DeviceContext> Sync for Device<T, C> {}
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 5233bdebc9fcd..55b01ee088548 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -13,6 +13,10 @@
     prelude::*,
     sync::aref::ARef, //
 };
+use core::{
+    mem,
+    ptr::NonNull, //
+};
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
@@ -123,21 +127,31 @@ pub trait Driver {
 pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
 
 impl<T: Driver> Registration<T> {
-    fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
+    fn new(drm: drm::UnregisteredDevice<T>, flags: usize) -> Result<Self> {
         // SAFETY: `drm.as_raw()` is valid by the invariants of `drm::Device`.
         to_result(unsafe { bindings::drm_dev_register(drm.as_raw(), flags) })?;
 
-        Ok(Self(drm.into()))
+        // SAFETY: We just called `drm_dev_register` above
+        let new = NonNull::from(unsafe { drm.assume_ctx() });
+
+        // Leak the ARef from UnregisteredDevice in preparation for transferring its ownership.
+        mem::forget(drm);
+
+        // SAFETY: `drm`'s `Drop` constructor was never called, ensuring that there remains at least
+        // one reference to the device - which we take ownership over here.
+        let new = unsafe { ARef::from_raw(new) };
+
+        Ok(Self(new))
     }
 
-    /// Registers a new [`Device`](drm::Device) with userspace.
+    /// Registers a new [`UnregisteredDevice`](drm::UnregisteredDevice) with userspace.
     ///
     /// Ownership of the [`Registration`] object is passed to [`devres::register`].
-    pub fn new_foreign_owned(
-        drm: &drm::Device<T>,
-        dev: &device::Device<device::Bound>,
+    pub fn new_foreign_owned<'a>(
+        drm: drm::UnregisteredDevice<T>,
+        dev: &'a device::Device<device::Bound>,
         flags: usize,
-    ) -> Result
+    ) -> Result<&'a drm::Device<T>>
     where
         T: 'static,
     {
@@ -146,8 +160,13 @@ pub fn new_foreign_owned(
         }
 
         let reg = Registration::<T>::new(drm, flags)?;
+        let drm = NonNull::from(reg.device());
+
+        devres::register(dev, reg, GFP_KERNEL)?;
 
-        devres::register(dev, reg, GFP_KERNEL)
+        // SAFETY: Since `reg` was passed to devres::register(), the device now owns the lifetime
+        // of the DRM registration - ensuring that this references lives for at least as long as 'a.
+        Ok(unsafe { drm.as_ref() })
     }
 
     /// Returns a reference to the `Device` instance for this registration.
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf2..64a43cb0fe57c 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -9,6 +9,10 @@
 pub mod ioctl;
 
 pub use self::device::Device;
+pub use self::device::DeviceContext;
+pub use self::device::Registered;
+pub use self::device::Uninit;
+pub use self::device::UnregisteredDevice;
 pub use self::driver::Driver;
 pub use self::driver::DriverInfo;
 pub use self::driver::Registration;
-- 
2.52.0

