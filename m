Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNGcH+dJfWlZRQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 01:16:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DBEBF913
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 01:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEBE10E1B1;
	Sat, 31 Jan 2026 00:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fL9h94c3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B32210E1A4
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 00:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769818594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4xaYhUpLXOBwZoEHLADcBcWiGEAuhBq9dyW2GYPd4M=;
 b=fL9h94c3hGvHEJYZbM8FptgMq4ptj3zHjV4v/Ep31uL4KMGmp1pP4OsXK6K8I19FKy4Xp9
 3DWf6HZSVR4Shf6YAOPMGlIYrvXmiUVaY5iLPYxh5ZQl5dyOkGoC8IbyzOthzXJwJ0hwfE
 KdnvjNkzWGaJpuK31+IeQa3IEYw0AKM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-SPkFFwgKPVKNflvsfufnaA-1; Fri,
 30 Jan 2026 19:16:31 -0500
X-MC-Unique: SPkFFwgKPVKNflvsfufnaA-1
X-Mimecast-MFC-AGG-ID: SPkFFwgKPVKNflvsfufnaA_1769818589
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C4AA41954B06; Sat, 31 Jan 2026 00:16:28 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.64])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CA693180097D; Sat, 31 Jan 2026 00:16:26 +0000 (UTC)
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
Subject: [PATCH v5 2/4] rust/drm: Don't setup private driver data until
 registration
Date: Fri, 30 Jan 2026 19:13:31 -0500
Message-ID: <20260131001602.2095470-3-lyude@redhat.com>
In-Reply-To: <20260131001602.2095470-1-lyude@redhat.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net,collabora.com,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lossin@kernel.org,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:lyude@redhat.com,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 16DBEBF913
X-Rspamd-Action: no action

Now that we have a DeviceContext that we can use to represent whether a
Device is known to have been registered, we can make it so that drivers can
create their Devices but wait until the registration phase to assign their
private data to the Device. This is desirable as some drivers need to make
use of the DRM device early on before finalizing their private driver data.

As such, this change makes it so that the driver's private data can
currently only be accessed through Device<T, Registered> types and not
Device<T, Uninit>.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
V4:
* Remove accidental double-aliasing &mut in Device::release()
---
 drivers/gpu/drm/nova/driver.rs |  4 +--
 drivers/gpu/drm/tyr/driver.rs  |  4 +--
 rust/kernel/drm/device.rs      | 64 +++++++++++++++++++++-------------
 rust/kernel/drm/driver.rs      | 19 ++++++++--
 4 files changed, 59 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 99d6841b69cbc..8cea5f68c3b04 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -56,8 +56,8 @@ impl auxiliary::Driver for NovaDriver {
     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
-        let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
-        let drm = drm::Registration::new_foreign_owned(drm, adev.as_ref(), 0)?;
+        let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref())?;
+        let drm = drm::Registration::new_foreign_owned(drm, adev.as_ref(), data, 0)?;
 
         Ok(Self { drm: drm.into() })
     }
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0d479b5d7bd62..b574ee1c24587 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -133,8 +133,8 @@ fn probe(
                 gpu_info,
         });
 
-        let tdev = drm::UnregisteredDevice::<Self>::new(pdev.as_ref(), data)?;
-        let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
+        let tdev = drm::UnregisteredDevice::<Self>::new(pdev.as_ref())?;
+        let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), data, 0)?;
 
         let driver = TyrDriver {
             _device: tdev.into(),
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 8f1780b8f0196..a1d9b0e92f3fd 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -26,13 +26,15 @@
 };
 use core::{
     alloc::Layout,
+    cell::UnsafeCell,
     marker::PhantomData,
-    mem,
-    ops::Deref,
-    ptr::{
+    mem::{
         self,
-        NonNull, //
+        MaybeUninit, //
     },
+    ops::Deref,
+    ptr::NonNull,
+    sync::atomic::*,
 };
 
 #[cfg(CONFIG_DRM_LEGACY)]
@@ -141,7 +143,7 @@ impl DeviceContext for Uninit {}
 ///
 /// The device in `self.0` is guaranteed to be a newly created [`Device`] that has not yet been
 /// registered with userspace until this type is dropped.
-pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, Uninit>>, NotThreadSafe);
+pub struct UnregisteredDevice<T: drm::Driver>(pub(crate) ARef<Device<T, Uninit>>, NotThreadSafe);
 
 impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
     type Target = Device<T, Uninit>;
@@ -188,7 +190,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
     ///
     /// This can be used to create a [`Registration`](kernel::drm::Registration).
-    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<Self> {
+    pub fn new(dev: &device::Device) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
         let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
@@ -207,22 +209,6 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<S
         .cast();
         let raw_drm = NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
 
-        // SAFETY: `raw_drm` is a valid pointer to `Self`.
-        let raw_data = unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
-
-        // SAFETY:
-        // - `raw_data` is a valid pointer to uninitialized memory.
-        // - `raw_data` will not move until it is dropped.
-        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
-            // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `__drm_dev_alloc` was
-            // successful.
-            let drm_dev = unsafe { Device::into_drm_device(raw_drm) };
-
-            // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_dev` must be valid and the
-            // refcount must be non-zero.
-            unsafe { bindings::drm_dev_put(drm_dev) };
-        })?;
-
         // SAFETY: The reference count is one, and now we take ownership of that reference as a
         // `drm::Device`.
         // INVARIANT: We just created the device above, but have yet to call `drm_dev_register`.
@@ -253,7 +239,15 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<S
 #[repr(C)]
 pub struct Device<T: drm::Driver, C: DeviceContext = Registered> {
     dev: Opaque<bindings::drm_device>,
-    data: T::Data,
+
+    /// Keeps track of whether we've initialized the device data yet.
+    pub(crate) data_is_init: AtomicBool,
+
+    /// The Driver's private data.
+    ///
+    /// This must only be written to from [`drm::Registration::new`].
+    pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,
+
     _ctx: PhantomData<C>,
 }
 
@@ -304,6 +298,22 @@ extern "C" fn release(ptr: *mut bindings::drm_device) {
         // SAFETY: `ptr` is a valid pointer to a `struct drm_device` and embedded in `Self`.
         let this = unsafe { Self::from_drm_device(ptr) };
 
+        // SAFETY:
+        // - Since we are in release(), we are guaranteed that no one else has access to `this`.
+        // - We confirmed above that `this` is a valid pointer to an initialized `Self`.
+        let is_init = unsafe { &*this }.data_is_init.load(Ordering::Relaxed);
+        if is_init {
+            // SAFETY:
+            // - We confirmed we have unique access to this above.
+            // - We confirmed that `data` is initialized above.
+            let data_ptr = unsafe { &mut (*this).data };
+
+            // SAFETY:
+            // - We checked that the data is initialized above.
+            // - We do not use `data` any point after calling this function.
+            unsafe { data_ptr.get_mut().assume_init_drop() };
+        }
+
         // SAFETY:
         // - When `release` runs it is guaranteed that there is no further access to `this`.
         // - `this` is valid for dropping.
@@ -322,11 +332,15 @@ pub(crate) unsafe fn assume_ctx<NewCtx: DeviceContext>(&self) -> &Device<T, NewC
     }
 }
 
-impl<T: drm::Driver, C: DeviceContext> Deref for Device<T, C> {
+impl<T: drm::Driver> Deref for Device<T, Registered> {
     type Target = T::Data;
 
     fn deref(&self) -> &Self::Target {
-        &self.data
+        // SAFETY:
+        // - `data` is initialized before any `Device`s with the `Registered` context are available
+        //   to the user.
+        // - `data` is only written to once in `Registration::new()`, so this read will never race.
+        unsafe { (&*self.data.get()).assume_init_ref() }
     }
 }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 55b01ee088548..cfb8884ece700 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -15,7 +15,8 @@
 };
 use core::{
     mem,
-    ptr::NonNull, //
+    ptr::NonNull,
+    sync::atomic::*, //
 };
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
@@ -127,7 +128,18 @@ pub trait Driver {
 pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
 
 impl<T: Driver> Registration<T> {
-    fn new(drm: drm::UnregisteredDevice<T>, flags: usize) -> Result<Self> {
+    fn new(
+        drm: drm::UnregisteredDevice<T>,
+        data: impl PinInit<T::Data, Error>,
+        flags: usize,
+    ) -> Result<Self> {
+        // SAFETY:
+        // - `raw_data` is a valid pointer to uninitialized memory.
+        // - `raw_data` will not move until it is dropped.
+        unsafe { data.__pinned_init(drm.0.data.get().cast()) }?;
+
+        drm.data_is_init.store(true, Ordering::Relaxed);
+
         // SAFETY: `drm.as_raw()` is valid by the invariants of `drm::Device`.
         to_result(unsafe { bindings::drm_dev_register(drm.as_raw(), flags) })?;
 
@@ -150,6 +162,7 @@ fn new(drm: drm::UnregisteredDevice<T>, flags: usize) -> Result<Self> {
     pub fn new_foreign_owned<'a>(
         drm: drm::UnregisteredDevice<T>,
         dev: &'a device::Device<device::Bound>,
+        data: impl PinInit<T::Data, Error>,
         flags: usize,
     ) -> Result<&'a drm::Device<T>>
     where
@@ -159,7 +172,7 @@ pub fn new_foreign_owned<'a>(
             return Err(EINVAL);
         }
 
-        let reg = Registration::<T>::new(drm, flags)?;
+        let reg = Registration::<T>::new(drm, data, flags)?;
         let drm = NonNull::from(reg.device());
 
         devres::register(dev, reg, GFP_KERNEL)?;
-- 
2.52.0

