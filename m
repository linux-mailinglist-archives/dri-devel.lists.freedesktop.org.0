Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBBDAE2CE1
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jun 2025 01:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4499710E080;
	Sat, 21 Jun 2025 23:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EY3FHOG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23F610E080
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 23:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750547186; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nZifPvM/iI/4Ml54g3Ubw8NQy7R4491M7+cDxJorNsIWnaqjYVtfLoH/3LKeNiOE4wT09pR8/hKY3Y1/lGVfuzzjoiDZQynywrAg0TbQVWZdN105kpiev9N66TDftmDPVxpP+X7oYnRwfa1pSzX3ww7A6b/0e0jKoOh48zNIFnY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750547186;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6j/Hr+zTNripT3aaDE3KgdPnuwyPM9K6+mdusp2w2hQ=; 
 b=ZqJPfT/zDy53aYXCulib12jMPVdOvZ5LWusDGmcWmsK1y5IqjWB4K7sZKrWr8/9ZeqqeDAu2kOch0IN6tXA9BTw9yMaGTuUvTYSntZm1lYMhjdMQduu1xrcl6OvbDpMeCDx9P+ss7yD9mSjfLP0r0udMg95KJClfnY/Zk6u9arc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750547186; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=6j/Hr+zTNripT3aaDE3KgdPnuwyPM9K6+mdusp2w2hQ=;
 b=EY3FHOG9LYNniZh7609ojYln+g4TF/yfWIj3rwhVdRP293w4teUC+mrEYMRcZBRg
 sqD8Geydgz7DCZsG5qrT3d3unRlLixrl8HfKWEcqFUBQuiHfTnEyI9DbK3Yc0AlSmxa
 82EUyqx6NLtVBOrvs9E9CKESRD2PFngAChGgjfo4=
Received: by mx.zohomail.com with SMTPS id 1750547185059777.4268976029674;
 Sat, 21 Jun 2025 16:06:25 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Sat, 21 Jun 2025 20:05:51 -0300
Subject: [PATCH v3] rust: drm: Add GPUVM abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-gpuvm-v3-1-10203da06867@collabora.com>
X-B4-Tracking: v=1; b=H4sIAM46V2gC/y3MQQ6CMBCF4auQWVtTpoNGV9zDsKjtAE2AklYbD
 endrejyf3n5NogcHEe4VhsETi46v5RQhwrMqJeBhbOlASU2UqEUw/pMs8CLVSzPeOoVQfmugXv
 32p1bV3p08eHDe2cTftefQIh/IaGQgshSb7BhquvW+GnSdx/00fgZupzzB51X5t+eAAAA
X-Change-ID: 20250320-gpuvm-29d3e0726f34
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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

From: Asahi Lina <lina@asahilina.net>

Add a GPUVM abstraction to be used by Rust GPU drivers.

GPUVM keeps track of a GPU's virtual address (VA) space and manages the
corresponding virtual mappings represented by "GPU VA" objects. It also
keeps track of the gem::Object<T> used to back the mappings through
GpuVmBo<T>.

The DriverGpuVm trait should be implemented by drivers, as they should
provide the hardware-specific implementation of the mapping/unmapping
and remapping steps. The steps themselves are computed by the GPUVM C
code.

This abstraction for drivers looking to support bind and unbind
operations (known as the VM_BIND API) commonly used to implement Vulkan
'sparse resources', which includes all upcoming Rust GPU drivers so far.

We require &mut self for any operations that modify the interval tree
used to keep track of the current bindings in a VM. In this sense, Rust
drivers are expected to provide some kind of interior mutability in
order to use any operation that would otherwise race to access the tree.

Locking the BO va list is still todo, although it should be
implementable in a future iteration of this patch, as soon as the
pre-requisite patches land. Asynchronous VM_BINDS should also be
possible.

This patch notably misses any other type of locking helpers, like any
drm_exec or prepare_vm helpers. That's because it is not clear how these
should look like so far, such that it is safer to proceed with the
current subset of operations, which are deemed both somewhat sufficient
and required for upcoming drivers.

Note that all operations provided were tested on a real driver and on a
real device. Specifically, all operations so far are required.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
Hi all,

I'm sending v3 while we wait for the patches that rework the locking of
the per-BO VA list. It should be a small delta to acquire the list lock
then.

Async VM_BINDS should be possible using the current version, as far as I
can tell.

I have rebased on top of Lyude's gem-shmem branch [0], to pickup the new
changes to gem::Object<T> which we will invariably have to account for
anyways. Besides, that branch introduces IntoGEMObject::as_ref(), which
is very convenient.

In order to be useful, this patch needs a few changes to ARef.

In particular, we should make ARef::into_inner_mut(), which was
introduced in "rust: types: Add ARef::as_inner_mut()". I looked around a
little bit and it appears like this patch hasn't landed yet.

We need that patch itself, but also we need to change the signature to
pub instead of pub(crate), because if drivers can prove that it's sound
to derive a &mut T from an ARef<T>, they should be able to do it.

This is notably the case for Tyr, and should also be the case for other
drivers, because Tyr keeps a single instance of ARef<GpuVm<T>> inside
a driver-specific Arc<Mutex<Vm>> instance. This means that at all
points, it is safe to get a &mut GpuVm<T> if we have a &mut tyr::Vm.

Also, we need to account for !Unpin types, as Lyude's version doesn't:
i.e.: if T: !Unpin, a safety requirement of as_inner_mut() should be not
using the returned &mut T to move T.

By the way, the docs might be shot in this version of the patch. I did
not manage to run rustdoc for whatever reason:

```
error: couldn't generate documentation: invalid template: last line expected to start with a comment
  |
  = note: failed to create or modify "./Documentation/output/rust/rustdoc/src-files.js"

error: aborting due to 1 previous error
```

As the current version is still a bit far from the one that will be
picked, I deferred this to a future iteration.

Lastly, I want to mention that I tested this on my 6.16-rc2 branch of
Tyr and it works. Like other drivers, booting the MCU is a bit tricky
for us because it expects things to be mapped at their exact spots. The
fact that it still works makes me confident in the current approach.

I can share this branch if any of you want to see how this looks like in
a real driver.

[0]: https://gitlab.freedesktop.org/lyudess/linux/-/tree/rust/gem-shmem?ref_type=heads
---
Changes in v3:

- Removed LockedGpuVm and UpdatingGpuVm. If we have a &mut GpuVm<T> we
  are guaranteed by the type system to be the only ones capable of
  mutating the interval tree.
- Split insert and link, as well as remove and unlink. These are now
  separate functions.
- Speaking of which, I took the liberty of changing the nomenclature a
  little bit for some functions. For example, I think "map" and "unmap"
  are both more expressive than "sm_map" and "sm_unmap".
- Added more features needed by Tyr. Specifically, we definitely need to
  get the drm_gem_object backing a given GpuVa<T>. For this reason, I've
  introduced find_va() and find_first_va(). They take a closure because
  we can only guarantee that the VA is in fact resident while these
  functions are running. I.e.: further operations may modify the state
  of the VM, thereby invalidating a given ResidentGpuVa<T>. With a
  closure, this is not possible.
- Wrapped all bindgen types in Opaque as appropriate.
- Tried to use cast()/&raw and etc as much as possible.
- Reworked some of the SAFETY comments.
- Removed the previous patch (the one adding dma_resv_lock/unlock), as
  we've decided to not go that way anymore.

- Link to v2: https://lore.kernel.org/r/20250422-gpuvm-v2-0-44d4fc25e411@collabora.com

Changes from v1:
- Added more people to cc.
- Used Benno's suggestion to remove the #[allow] (thanks, Benno, that is
  indeed better!)
- Added markdown as applicable in the docs/comments (please let me know
  whether I missed any)
- Changed the order between docs and attributes to match the rest of the
  code in the Rust crate.
- Did *not* remove the # Arguments section from a few functions yet, let's
  push this dicussion down the line, Miguel.
- Changed the placement of OpRemap, i.e.: it was not next to its impl block by
  mistake.
- Misc doc fixes, i.e. missing periods, missing ///, lines that would
  not render properly on the browser, etc (thanks, Miguel)
- Removed spurious clang-format change from patch 1.
- Added a return statement for find_bo/obtain_bo (thanks, Charalampos!)

Changes from v0:
  This version changes how `LockedGpuVm` operates. The previous code assumed
that the interval tree would be protected if all the associated GEM's resvs
were locked, but this is completely unrelated. In fact, this initial version
only aims to support the core VA range management feature of GPUVM, and not any
of the "convenience" functions like "exec_lock()" and friends, so this function
was removed accordingly.
  
  LockedGpuVm is now produced by a call to GpuVm::lock(). This takes a generic
guard type to signal that the driver-specific locks have been acquired in order
to protect the VMs tree, and hence its view of the address space. This approach
is somewhat similar to CondVar, but also incurs in the same pitfall: it is up
to the caller to give meaning to the guard by ensuring that it actually
protects against concurrent access to the VM. Maybe this is a good candidate to
the upcoming "Pitfall" docs section?

  Note that LockedGpuVm::obj was removed. I'm not really sure why this field
was there in the first place, but callers should indicate the object through
the sm_map() and sm_unmap() APIs instead.

  I am not sure why GpuVm::inner uses UnsafeCell, though. I did not touch this
so that we can first discuss whether UnsafeCell is really needed.

  The docs were also updated. Care was taken to reuse the C documentation as
much as possible.

  Itemized changes: 

- Rebased on top of nova-drm
  - Use `srctree` in the docs
  - Add docs as appropriate and remove #[allow(missing_docs)]
  - Remove `impl DriverGpuVa for ()`. Drivers can to that themselves, if they want.
  - Added #[inline] to getters, as Rust cannot inline across crates otherwise (unless this changed recently?)
  - Exposed `drm_gpuva_op_unmap::keep`.
  - Removed `pub(super)` from unsafe fns meant to be called from the C code. 
  - Added "# Safety" blocks to the above.
  - Removed `exec_lock_gem_object()`.
  - Removed `exec_lock()`
  - Removed `LockedGpuVm::vm_exec`. This initial version does not support `exec` calls at all.
  - By the same token, removed `LockedGpuVm::drop()`
  - Removed `LockedGpuVm::obj`. This object has to be passed explicitly.
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/drm_gpuvm.c        |  18 +
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/gpuvm.rs        | 951 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   2 +
 5 files changed, 973 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3974cb1a252d3c07b204445edaa1bb3c79cc1873..cd85e4ca7f8a211402875e7ea038904e89d4c00c 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,6 +11,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
new file mode 100644
index 0000000000000000000000000000000000000000..6b0d0a6601faaba188cceaabded94f10221dee3e
--- /dev/null
+++ b/rust/helpers/drm_gpuvm.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#include <drm/drm_gpuvm.h>
+
+struct drm_gpuvm *rust_helper_drm_gpuvm_get(struct drm_gpuvm *obj)
+{
+	return drm_gpuvm_get(obj);
+}
+
+void rust_helper_drm_gpuva_init_from_op(struct drm_gpuva *va, struct drm_gpuva_op_map *op)
+{
+	drm_gpuva_init_from_op(va, op);
+}
+
+struct drm_gpuvm_bo *rust_helper_drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
+{
+	return drm_gpuvm_bo_get(vm_bo);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 3ba1652899c2b1278c2a61be9101952b00d312fc..be80e0ac1c7778f6fd02cb244b1228910332a675 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -17,6 +17,7 @@
 #include "device.c"
 #include "dma-resv.c"
 #include "drm.c"
+#include "drm_gpuvm.c"
 #include "err.c"
 #include "fs.c"
 #include "io.c"
diff --git a/rust/kernel/drm/gpuvm.rs b/rust/kernel/drm/gpuvm.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d7b1f2394b4b41cb0969da62e624cec9e7831567
--- /dev/null
+++ b/rust/kernel/drm/gpuvm.rs
@@ -0,0 +1,951 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM GPU VA Manager abstractions.
+//!
+//! This can be used to manage GPU virtual address spaces, which in turn makes
+//! it easier to implement `bind` and `unbind` operations. Notably, using
+//! `GpuVm` makes it easier to support Vulkan
+//! [Sparse Resources](https://docs.vulkan.org/spec/latest/chapters/sparsemem.html).
+//!
+//! See [GPUVM](https://docs.kernel.org/gpu/drm-mm.html#gpuvm) for more information.
+//!
+//! C header: [`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.h)
+
+use core::marker::PhantomData;
+use core::marker::PhantomPinned;
+use core::ops::Deref;
+use core::ops::DerefMut;
+use core::ops::Range;
+use core::ptr::NonNull;
+
+use pin_init::pin_init_from_closure;
+
+use crate::bindings;
+use crate::drm::device;
+use crate::drm::driver;
+use crate::drm::gem;
+use crate::drm::gem::IntoGEMObject;
+use crate::error::code::ENOMEM;
+use crate::error::from_result;
+use crate::error::to_result;
+use crate::error::Result;
+use crate::prelude::*;
+use crate::types::ARef;
+use crate::types::AlwaysRefCounted;
+use crate::types::Opaque;
+
+/// A convenience type for the driver's GEM object.
+type Object<T> =
+    <<<T as DriverGpuVm>::Driver as driver::Driver>::Object as gem::BaseDriverObject>::Object;
+
+/// Trait that must be implemented by DRM drivers to represent a DRM [`GpuVm`],
+/// i.e. a GPU address space.
+///
+/// The driver has to provide the hardware-specific implementations to map,
+/// unmap and remap GPU virtual addresses as needed.
+pub trait DriverGpuVm: Sized {
+    /// The parent [`driver::Driver`] implementation for this [`DriverGpuVm`].
+    type Driver: driver::Driver;
+
+    /// The driver-specific GpuVa type, repesenting a single VA range within the
+    /// GPU.
+    type GpuVa: DriverGpuVa;
+
+    /// The driver-specific GpuVmBo type, representing the connection between a
+    /// GEM object and [`GpuVm`].
+    type GpuVmBo: DriverGpuVmBo;
+
+    /// The driver-specific context that is kept through the map, unmap and
+    /// remap steps.
+    type StepContext;
+
+    /// Implements the map step for the driver.
+    fn step_map(
+        gpuvm: &mut GpuVm<Self>,
+        op: &mut OpMap<Self>,
+        ctx: &mut Self::StepContext,
+    ) -> Result;
+
+    /// Implements the unmap step for the driver.
+    fn step_unmap(
+        gpuvm: &mut GpuVm<Self>,
+        op: &mut OpUnMap<Self>,
+        ctx: &mut Self::StepContext,
+    ) -> Result;
+
+    /// Implements the remap step for the driver.
+    fn step_remap(
+        gpuvm: &mut GpuVm<Self>,
+        op: &mut OpReMap<Self>,
+        vm_bo: &GpuVmBo<Self>,
+        ctx: &mut Self::StepContext,
+    ) -> Result;
+}
+
+/// The driver-specific context that is passed through the map, unmap and remap
+/// steps.
+struct StepContext<'a, T: DriverGpuVm> {
+    gpuvm: &'a mut GpuVm<T>,
+    ctx: &'a mut T::StepContext,
+}
+
+/// Trait that must be implemented by DRM drivers to represent a DRM [`GpuVa`],
+/// i.e.: a mapping in GPU address space.
+pub trait DriverGpuVa: Sized {}
+
+/// Trait that must be implemented by DRM drivers to represent a DRM
+/// [`GpuVmBo`], i.e.: a connection between a BO and a VM.
+pub trait DriverGpuVmBo: Sized {
+    /// Initializes the GpuVmBo object.
+    fn new() -> impl PinInit<Self>;
+}
+
+/// Provides a default implementation for trivial types
+impl<T: Default> DriverGpuVmBo for T {
+    fn new() -> impl PinInit<Self> {
+        // SAFETY:
+        // - `Ok(())` is always returned.
+        // - The slot is never moved.
+        unsafe {
+            pin_init_from_closure(|slot| {
+                *slot = Self::default();
+                Ok(())
+            })
+        }
+    }
+}
+
+/// A transparent wrapper over
+/// [`bindings::drm_gpuva_op_map`](https://docs.kernel.org/gpu/drm-mm.html#c.drm_gpuva_op_map)
+///
+/// Represents the map operation to be carried out by the driver.
+#[repr(transparent)]
+pub struct OpMap<T: DriverGpuVm>(Opaque<bindings::drm_gpuva_op_map>, PhantomData<T>);
+
+impl<T: DriverGpuVm> OpMap<T> {
+    /// Returns the base address of the new mapping.
+    #[inline]
+    pub fn addr(&self) -> u64 {
+        let ptr = self.0.get();
+
+        // SAFETY: `self.0` is a valid pointer to a `drm_gpuva_op_map` structure,
+        unsafe { *ptr }.va.addr
+    }
+
+    /// Returns the length of the new mapping.
+    #[inline]
+    pub fn length(&self) -> u64 {
+        let ptr = self.0.get();
+
+        // SAFETY: `self.0` is a valid pointer to a `drm_gpuva_op_map` structure,
+        unsafe { *ptr }.va.range
+    }
+
+    /// Returns the range of the new mapping.
+    #[inline]
+    pub fn range(&self) -> Range<u64> {
+        let start = self.addr();
+        let end = start + self.length();
+        Range { start, end }
+    }
+
+    /// Returns the offset within the GEM object.
+    #[inline]
+    pub fn gem_offset(&self) -> u64 {
+        let ptr = self.0.get();
+
+        // SAFETY: `self.0` is a valid pointer to a `drm_gpuva_op_map` structure,
+        unsafe { *ptr }.gem.offset
+    }
+
+    /// Returns the GEM object to map.
+    #[inline]
+    pub fn object(&self) -> &Object<T> {
+        // SAFETY: Safe as per the invariants of `self`.
+        let gem = unsafe { *self.0.get() }.gem.obj;
+
+        // SAFETY: The GEM object has an active reference for the lifetime of this op.
+        unsafe { <Object<T> as IntoGEMObject>::as_ref(gem) }
+    }
+}
+
+/// A transparent wrapper over
+/// [`bindings::drm_gpuva_op_remap`](https://docs.kernel.org/gpu/drm-mm.html#c.drm_gpuva_op_remap).
+///
+/// Represents a single remap operation generated by [`GpuVm`].
+///
+/// A remap operation is generated when an existing [`GpuVa`] mapping is split
+/// by inserting a new one or by partially unmapping existing mappings. Hence,
+/// it consists of a maximum of two maps and one unmap operation,
+///
+/// The unmap operation takes care of removing the original existing mapping.
+/// The `prev` field is used to remap the preceding part and `next` is used to
+/// remap the subsequent part.
+///
+/// If the start address of the new mapping aligns with the start address of the
+/// old mapping, `prev` will be `None`. Similarly, if the end address of the new
+/// mapping aligns with the end address of the old mapping, `next` will be
+/// `None`.
+///
+/// Note: the reason for a dedicated remap operation, rather than arbitrary
+/// unmap and map operations, is to give drivers the chance of extracting driver
+/// specific data for creating the new mappings from the unmap operations's
+/// [`GpuVa`] structure which typically is embedded in larger driver specific
+/// structures.
+#[repr(transparent)]
+pub struct OpReMap<T: DriverGpuVm>(bindings::drm_gpuva_op_remap, PhantomData<T>);
+
+/// A transparent wrapper over
+/// [`bindings::drm_gpuva_op_unmap`](https://docs.kernel.org/gpu/drm-mm.html#c.drm_gpuva_op_unmap).
+///
+/// Represents a single unmap operation generated by [`GpuVm`].
+#[repr(transparent)]
+pub struct OpUnMap<T: DriverGpuVm>(bindings::drm_gpuva_op_unmap, PhantomData<T>);
+
+impl<T: DriverGpuVm> OpUnMap<T> {
+    /// Returns the GPU VA to unmap.
+    #[inline]
+    pub fn va(&self) -> Option<&GpuVa<T>> {
+        if self.0.va.is_null() {
+            return None;
+        }
+        // SAFETY: Container invariant is guaranteed for ops structs created for our types.
+        let p = unsafe { crate::container_of!(self.0.va, GpuVa<T>, gpuva) as *mut GpuVa<T> };
+        // SAFETY: The GpuVa object reference is valid per the op_unmap contract
+        Some(unsafe { &*p })
+    }
+
+    /// Indicates whether this [`GpuVa`] is physically contiguous with the
+    /// original mapping request.
+    ///
+    /// Optionally, if `keep` is set, drivers may keep the actual page table
+    /// mappings for this [`GpuVa`], adding the missing page table entries only and
+    /// subsequently updating the VM accordingly.
+    #[inline]
+    pub fn keep(&self) -> bool {
+        self.0.keep
+    }
+}
+
+impl<T: DriverGpuVm> OpReMap<T> {
+    /// Returns the preceding part of a split mapping, if any.
+    #[inline]
+    pub fn prev_map(&mut self) -> Option<&mut OpMap<T>> {
+        // SAFETY: The prev pointer must be valid if not-NULL per the op_remap contract
+        unsafe { (self.0.prev as *mut OpMap<T>).as_mut() }
+    }
+
+    /// Returns the subsequent part of a split mapping, if any.
+    #[inline]
+    pub fn next_map(&mut self) -> Option<&mut OpMap<T>> {
+        // SAFETY: The next pointer must be valid if not-NULL per the op_remap contract
+        unsafe { (self.0.next as *mut OpMap<T>).as_mut() }
+    }
+
+    /// Returns the unmap operation for the original existing mapping.
+    #[inline]
+    pub fn unmap(&mut self) -> &mut OpUnMap<T> {
+        // SAFETY: The unmap pointer is always valid per the op_remap contract
+        unsafe { (self.0.unmap as *mut OpUnMap<T>).as_mut().unwrap() }
+    }
+}
+
+/// A GPU VA range.
+///
+/// Drivers can use `inner` to store additional data.
+///
+/// # Invariants
+///
+/// At all times, `gpuva` is safe to dereference, as it's either zeroed or
+/// otherwise initialized from an operation.
+#[repr(C)]
+#[pin_data]
+pub struct GpuVa<T: DriverGpuVm> {
+    #[pin]
+    gpuva: Opaque<bindings::drm_gpuva>,
+    #[pin]
+    inner: T::GpuVa,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+impl<T: DriverGpuVm> GpuVa<T> {
+    /// Creates a new GPU VA.
+    pub fn new<E>(inner: impl PinInit<T::GpuVa, E>) -> Result<Pin<KBox<GpuVa<T>>>>
+    where
+        Error: From<E>,
+    {
+        KBox::try_pin_init(
+            try_pin_init!(Self {
+                gpuva <- Opaque::zeroed(),
+                inner <- inner,
+                _p: PhantomPinned
+            }),
+            GFP_KERNEL,
+        )
+    }
+
+    /// Returns the start address of the GPU VA range.
+    #[inline]
+    pub fn addr(&self) -> u64 {
+        // SAFETY: Safe as per the invariants of self.
+        unsafe { *self.gpuva.get() }.va.addr
+    }
+
+    /// Returns the length of the GPU VA.
+    #[inline]
+    pub fn length(&self) -> u64 {
+        // SAFETY: Safe as per the invariants of self.
+        unsafe { *self.gpuva.get() }.va.range
+    }
+
+    /// Returns the length of the GPU VA.
+    #[inline]
+    pub fn range(&self) -> Range<u64> {
+        let start = self.addr();
+        let end = start + self.length();
+        Range { start, end }
+    }
+
+    /// Returns the offset within the GEM object.
+    #[inline]
+    pub fn gem_offset(&self) -> u64 {
+        // SAFETY: Safe as per the invariants of self.
+        unsafe { *self.gpuva.get() }.gem.offset
+    }
+
+    /// Returns the underlying [`GpuVmBo`] object that backs this [`GpuVa`].
+    pub fn vm_bo(&self) -> Option<ARef<GpuVmBo<T>>> {
+        // SAFETY: Safe by the type invariant of `GpuVa<T>`.
+        let vm_bo = unsafe { *self.gpuva.get() }.vm_bo;
+
+        if vm_bo.is_null() {
+            return None;
+        }
+
+        // SAFETY: Safe by the type invariant of `GpuVmBo<T>`.
+        unsafe { bindings::drm_gpuvm_bo_get(vm_bo) };
+
+        // SAFETY: Container invariant is guaranteed for GpuVmBo<T> objects.
+        let vm_bo = unsafe { crate::container_of!(vm_bo, GpuVmBo<T>, bo) as *mut GpuVmBo<T> };
+
+        // SAFETY: We just incremented the reference count above.
+        Some(unsafe { ARef::from_raw(NonNull::new_unchecked(vm_bo)) })
+    }
+}
+
+/// The connection between a GEM object and a VM.
+///
+/// # Invariants
+///
+/// At all times, `bo` is safe to dereference, as it's initialized by the C code
+/// on a call to [`GpuVm::obtain_bo`].
+#[repr(C)]
+#[pin_data]
+pub struct GpuVmBo<T: DriverGpuVm> {
+    #[pin]
+    bo: Opaque<bindings::drm_gpuvm_bo>,
+    #[pin]
+    inner: T::GpuVmBo,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+impl<T: DriverGpuVm> GpuVmBo<T> {
+    /// Returns the underlying GEM object that this [`GpuVmBo`] is connected to.
+    pub fn gem(&self) -> &Object<T> {
+        // SAFETY: safe as per the invariants of self.
+        let bo = unsafe { *self.bo.get() }.obj;
+
+        // SAFETY: The GEM object has an active reference for the lifetime of
+        // this GpuVmBo and `obj` was set to a pointer to `BaseObject` in
+        // `obtain_bo()`.
+        unsafe { <Object<T> as IntoGEMObject>::as_ref(bo) }
+    }
+}
+
+// SAFETY: DRM GpuVmBo objects are always reference counted and the get/put functions
+// satisfy the requirements.
+unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
+    fn inc_ref(&self) {
+        // SAFETY: The drm_gpuvm_get function satisfies the requirements for inc_ref().
+        unsafe { bindings::drm_gpuvm_bo_get(&self.bo as *const _ as *mut _) };
+    }
+
+    unsafe fn dec_ref(mut obj: NonNull<Self>) {
+        // SAFETY:
+        // - The drm_gpuvm_put function satisfies the requirements for dec_ref().
+        // - The `bo` field is valid to dereference for the lifetime of self.
+        // - Given the above, and the fact that the reference rules are
+        //   respected, it is ok to create a reference from `obj` here
+        unsafe {
+            // TODO: switch to the locked version of this function once available.
+            bindings::drm_gpuvm_bo_put(obj.as_mut().bo.get());
+        }
+    }
+}
+
+impl<T: DriverGpuVm> Deref for GpuVmBo<T> {
+    type Target = T::GpuVmBo;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+/// The DRM GPU VA Manager.
+///
+/// It keeps track of a GPU's virtual address space by using maple tree
+/// structures.
+///
+/// Typically, an instance of [`GpuVm`] is embedded bigger, driver-specific
+/// structures.
+///
+/// Drivers can pass addresses and ranges in arbitrary units, e.g.: bytes or
+/// pages.
+///
+/// There should be one manager instance per GPU virtual address space.
+#[repr(C)]
+#[pin_data]
+pub struct GpuVm<T: DriverGpuVm> {
+    #[pin]
+    gpuvm: Opaque<bindings::drm_gpuvm>,
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+impl<T: DriverGpuVm> GpuVm<T> {
+    const OPS: bindings::drm_gpuvm_ops = bindings::drm_gpuvm_ops {
+        vm_free: Some(vm_free_callback::<T>),
+        op_alloc: None,
+        op_free: None,
+        vm_bo_alloc: Some(vm_bo_alloc_callback::<T>),
+        vm_bo_free: Some(vm_bo_free_callback::<T>),
+        vm_bo_validate: None,
+        sm_step_map: Some(step_map_callback::<T>),
+        sm_step_remap: Some(step_remap_callback::<T>),
+        sm_step_unmap: Some(step_unmap_callback::<T>),
+    };
+
+    /// Creates a GPUVM instance.
+    pub fn new<E>(
+        name: &'static CStr,
+        dev: &device::Device<T::Driver>,
+        r_obj: &Object<T>,
+        range: Range<u64>,
+        reserve_range: Range<u64>,
+        inner: impl PinInit<T, E>,
+    ) -> Result<ARef<GpuVm<T>>>
+    where
+        Error: From<E>,
+    {
+        let obj: Pin<KBox<Self>> = KBox::try_pin_init(
+            try_pin_init!(Self {
+                // SAFETY: drm_gpuvm_init cannot fail and always initializes the member.
+                gpuvm <- unsafe {
+                    pin_init::pin_init_from_closure(move |slot: *mut Opaque<bindings::drm_gpuvm> | {
+                        // Zero-init required by drm_gpuvm_init.
+                        *slot = core::mem::zeroed();
+                        bindings::drm_gpuvm_init(
+                            Opaque::raw_get(slot),
+                            name.as_char_ptr(),
+                            0,
+                            dev.as_raw(),
+                            r_obj.as_raw(),
+                            range.start,
+                            range.end - range.start,
+                            reserve_range.start,
+                            reserve_range.end - reserve_range.start,
+                            &Self::OPS
+                        );
+                        Ok(())
+                    })
+                },
+                inner <- inner,
+                _p: PhantomPinned
+            }),
+            GFP_KERNEL,
+        )?;
+
+        // SAFETY: We never move out of the object.
+        let vm_ref = unsafe {
+            ARef::from_raw(NonNull::new_unchecked(KBox::leak(
+                Pin::into_inner_unchecked(obj),
+            )))
+        };
+
+        Ok(vm_ref)
+    }
+
+    /// A helper function to insert a [`GpuVa`] into the the [`GpuVm`].
+    ///
+    /// This will internally add the [`GpuVa`] to the interval tree.
+    pub fn insert_va(
+        &mut self,
+        op_map: &mut OpMap<T>,
+        gpuva: Pin<KBox<GpuVa<T>>>,
+    ) -> Result<(), Pin<KBox<GpuVa<T>>>> {
+        // SAFETY: It is always safe to initialize a GpuVa from an op.
+        unsafe {
+            bindings::drm_gpuva_init_from_op(gpuva.gpuva.get(), op_map.0.get());
+        }
+
+        // SAFETY:
+        // - `gpuvm` is valid by our type invariant.
+        // - `gpuva` was initialized above.
+        if unsafe { bindings::drm_gpuva_insert(self.gpuvm.get(), gpuva.gpuva.get()) } != 0 {
+            // EEXIST, return the GpuVa to the caller as an error
+            return Err(gpuva);
+        };
+
+        // SAFETY: We are handing off the GpuVa ownership and it will not be moved.
+        KBox::leak(unsafe { Pin::into_inner_unchecked(gpuva) });
+
+        Ok(())
+    }
+
+    /// Links the given [`MappedGpuVa`] in the given [`GpuVmBo`].
+    pub fn link_va(&self, gpuva: ResidentGpuVa<'_, T>, gpuvmbo: &ARef<GpuVmBo<T>>) -> Result {
+        // SAFETY:
+        // - We make sure that the gpuva has been previously mapped, so it's
+        // been initialized from an op.
+        // - This takes a new reference to the gpuvmbo.
+        // - The gpuvmbo is guaranteed to be valid through ARef.
+        unsafe { bindings::drm_gpuva_link(gpuva.gpuva.get(), gpuvmbo.bo.get()) }
+        Ok(())
+    }
+
+    /// Removes the given [`GpuVa`] from the [`GpuVm`] instance.
+    ///
+    /// This removes the [`GpuVa`] from the interval tree and returns a special
+    /// type that can be used to unlink the [`GpuVa`] later.
+    pub fn remove_va(&mut self, gpuva: ResidentGpuVa<'_, T>) -> Result<RemovedGpuVa<T>> {
+        // SAFETY: The gpuva is guaranteed to be valid through the type invariant.
+        unsafe { bindings::drm_gpuva_remove(gpuva.gpuva.get()) };
+
+        // SAFETY: We are handing off the GpuVa ownership from a previous call
+        // to [`KBox::leak`] that was made in [`GpuVm::insert_va`].
+        let gpuva = unsafe { KBox::from_raw(gpuva.0) };
+
+        // SAFETY: The `gpuva` instance was pinned when [`GpuVm::insert_va`] was
+        // called. It remained pinned by the C GPUVM code.
+        Ok(RemovedGpuVa(unsafe { Pin::new_unchecked(gpuva) }))
+    }
+
+    /// Unlinks a previously linked [`GpuVa`] from the [`GpuVmBo`].
+    pub fn unlink_va(&self, gpuva: &RemovedGpuVa<T>) {
+        // SAFETY: Safe as per the type invariant of `GpuVa<T>`.
+        unsafe { bindings::drm_gpuva_unlink(gpuva.0.gpuva.get()) };
+    }
+
+    /// Finds the [`GpuVmBo`] object that connects `obj` to this VM.
+    ///
+    /// If found, increases the reference count of the GpuVmBo object
+    /// accordingly.
+    pub fn find_bo(&mut self, obj: &Object<T>) -> Option<ARef<GpuVmBo<T>>> {
+        // SAFETY: LockedGpuVm implies the right locks are held.
+        let p = unsafe { bindings::drm_gpuvm_bo_find(self.gpuvm.get(), obj.as_raw()) };
+
+        if p.is_null() {
+            return None;
+        }
+
+        // SAFETY: All the drm_gpuvm_bo objects in this GpuVm are always
+        // allocated by us as GpuVmBo<T>.
+        let p = unsafe { crate::container_of!(p, GpuVmBo<T>, bo) as *mut GpuVmBo<T> };
+        // SAFETY: We checked for NULL above, and the types ensure that
+        // this object was created by vm_bo_alloc_callback<T>.
+        Some(unsafe { ARef::from_raw(NonNull::new_unchecked(p)) })
+    }
+
+    /// Obtains the [`GpuVmBo`] object that connects `obj` to this VM.
+    ///
+    /// This connection is unique, so an instane of [`GpuVmBo`] will be
+    /// allocated for `obj` once, and that instance will be returned from that
+    /// point forward.
+    pub fn obtain_bo(&self, obj: &Object<T>) -> Result<ARef<GpuVmBo<T>>> {
+        // SAFETY: LockedGpuVm implies the right locks are held.
+        let p = unsafe { bindings::drm_gpuvm_bo_obtain(self.gpuvm.get(), obj.as_raw()) };
+
+        if p.is_null() {
+            return Err(ENOMEM);
+        }
+
+        // SAFETY: Container invariant is guaranteed for GpuVmBo objects for this GpuVm.
+        let p = unsafe { crate::container_of!(p, GpuVmBo<T>, bo) as *mut GpuVmBo<T> };
+        // SAFETY: We checked for NULL above, and the types ensure that
+        // this object was created by vm_bo_alloc_callback<T>.
+        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(p)) })
+    }
+
+    /// Instructs the [`GpuVm`] instance to build the necessary operations in
+    /// order to map a given range.
+    ///
+    /// This utilizes [`DriverGpuVm`] to call back into the driver providing the
+    /// split and merge steps.
+    ///
+    /// A sequence of callbacks can contain map, unmap and remap operations, but
+    /// the sequence of callbacks might also be empty if no operation is
+    /// required, e.g. if the requested mapping already exists in the exact same
+    /// way.
+    ///
+    /// There can be an arbitrary amount of unmap operations, a maximum of two
+    /// remap operations and a single map operation. The latter one represents
+    /// the original map operation requested by the caller.
+    pub fn map(
+        &mut self,
+        ctx: &mut T::StepContext,
+        req_obj: &Object<T>,
+        range: Range<u64>,
+        gem_offset: u64,
+    ) -> Result {
+        let gpuvm = self.gpuvm.get();
+        let mut ctx = StepContext { ctx, gpuvm: self };
+        let req_addr = range.start;
+        let req_range = range.end - range.start;
+
+        // SAFETY:
+        // - `gpuvm` is guaranteed to be valid by the type invariant of `GpuVm<T>`.
+        // - `req_obj` is guaranteed to be a valid GEM object by the type invariant of `Object<T>`.
+        to_result(unsafe {
+            bindings::drm_gpuvm_sm_map(
+                gpuvm,
+                &mut ctx as *mut _ as *mut _,
+                req_addr,
+                req_range,
+                req_obj.as_raw(),
+                gem_offset,
+            )
+        })
+    }
+
+    /// Instructs the [`GpuVm`] instance to build the necessary operations in
+    /// order to unmap a given range.
+    ///
+    /// This utilizes [`DriverGpuVm`] to call back into the driver providing the
+    /// operations to unmap and, if required, split existent mappings.
+    ///
+    /// A sequence of callbacks can contain unmap and remap operations,
+    /// depending on whether there are actual overlapping mappings to split.
+    ///
+    /// There can be an arbitrary amount of unmap operations and a maximum of
+    /// two remap operations.
+    pub fn unmap(&mut self, ctx: &mut T::StepContext, range: Range<u64>) -> Result {
+        let gpuvm = self.gpuvm.get();
+        let mut ctx = StepContext { ctx, gpuvm: self };
+        let req_addr = range.start;
+        let req_range = range.end - range.start;
+
+        // SAFETY:
+        // - `gpuvm` is guaranteed to be valid by the type invariant of `GpuVm<T>`.
+        // - `req_obj` is guaranteed to be a valid GEM object by the type invariant of `Object<T>`.
+        to_result(unsafe {
+            bindings::drm_gpuvm_sm_unmap(gpuvm, &mut ctx as *mut _ as *mut _, req_addr, req_range)
+        })
+    }
+
+    /// Finds the [`GpuVa`] that covers exactly the given range in this
+    /// [`GpuVm`], if any.
+    pub fn find_va<R, F>(&mut self, range: Range<u64>, f: F) -> Result<R>
+    where
+        for<'a> F: FnOnce(&mut GpuVm<T>, Option<ResidentGpuVa<'a, T>>) -> Result<R>,
+    {
+        // SAFETY: The drm_gpuva_find function is safe to call with a valid
+        // gpuvm and range.
+        let gpuva = unsafe {
+            bindings::drm_gpuva_find(self.gpuvm.get(), range.start, range.end - range.start)
+        };
+
+        let resident_va = if gpuva.is_null() {
+            None
+        } else {
+            // SAFETY: Container invariant is guaranteed for GpuVa<T> objects.
+            let gpuva = unsafe { crate::container_of!(gpuva, GpuVa<T>, gpuva) as *mut GpuVa<T> };
+            // SAFETY: Safe as per the type invariant of `GpuVa<T>`. Also it is OK
+            // to convert to a reference here.
+            Some(ResidentGpuVa(unsafe { &mut *gpuva }))
+        };
+
+        f(self, resident_va)
+    }
+
+    /// Finds the first [`GpuVa`] that covers the given range in this [`GpuVm`],
+    /// if any.
+    pub fn find_first_va<R, F>(&mut self, range: Range<u64>, f: F) -> Result<R>
+    where
+        for<'a> F: FnOnce(&mut GpuVm<T>, Option<ResidentGpuVa<'a, T>>) -> Result<R>,
+    {
+        // SAFETY: `gpuvm` is known to be valid as per the type invariants of
+        // `self` and drm_gpuva_find_first is safe to call with a valid gpuvm
+        // and range.
+        let gpuva = unsafe {
+            bindings::drm_gpuva_find_first(self.gpuvm.get(), range.start, range.end - range.start)
+        };
+
+        let resident_va = if gpuva.is_null() {
+            None
+        } else {
+            // SAFETY: Container invariant is guaranteed for GpuVa<T> objects.
+            let gpuva = unsafe { crate::container_of!(gpuva, GpuVa<T>, gpuva) as *mut GpuVa<T> };
+            // SAFETY: Safe as per the type invariant of `GpuVa<T>`. Also it is OK
+            // to convert to a reference here.
+            Some(ResidentGpuVa(unsafe { &mut *gpuva }))
+        };
+
+        f(self, resident_va)
+    }
+
+    /// The start of the VA space.
+    #[inline]
+    pub fn va_start(&self) -> u64 {
+        // SAFETY: Safe by the type invariant of `GpuVm<T>`.
+        unsafe { *self.gpuvm.get() }.mm_start
+    }
+
+    /// The length of the address space
+    #[inline]
+    pub fn va_length(&self) -> u64 {
+        // SAFETY: Safe by the type invariant of `GpuVm<T>`.
+        unsafe { *self.gpuvm.get() }.mm_range
+    }
+
+    /// Returns the range of the GPU virtual address space.
+    #[inline]
+    pub fn va_range(&self) -> Range<u64> {
+        let start = self.va_start();
+        let end = start + self.va_length();
+        Range { start, end }
+    }
+}
+
+impl<T: DriverGpuVm> Deref for GpuVm<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverGpuVm> DerefMut for GpuVm<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.inner
+    }
+}
+
+// SAFETY: DRM GpuVm objects are always reference counted and the get/put functions
+// satisfy the requirements.
+unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
+    fn inc_ref(&self) {
+        // SAFETY: The drm_gpuvm_get function satisfies the requirements for inc_ref().
+        unsafe { bindings::drm_gpuvm_get(self.gpuvm.get()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The drm_gpuvm_put function satisfies the requirements for dec_ref().
+        unsafe { bindings::drm_gpuvm_put(Opaque::raw_get(&(*obj.as_ptr()).gpuvm)) };
+    }
+}
+
+/// A referenfe to a [`GpuVa`] that is guaranteed to be resident in the
+/// [`GpuVm`] instance. This means that it was previously inserted with
+/// `[`GpuVm::insert_va`].
+pub struct ResidentGpuVa<'a, T: DriverGpuVm>(&'a mut GpuVa<T>);
+
+impl<'a, T: DriverGpuVm> Deref for ResidentGpuVa<'a, T> {
+    type Target = GpuVa<T>;
+
+    fn deref(&self) -> &Self::Target {
+        self.0
+    }
+}
+
+impl<'a, T: DriverGpuVm> DerefMut for ResidentGpuVa<'a, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        self.0
+    }
+}
+
+/// A [`GpuVa`] that has been removed from the [`GpuVm`] instance.
+pub struct RemovedGpuVa<T: DriverGpuVm>(Pin<KBox<GpuVa<T>>>);
+
+impl<T: DriverGpuVm> Deref for RemovedGpuVa<T> {
+    type Target = Pin<KBox<GpuVa<T>>>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl<T: DriverGpuVm> DerefMut for RemovedGpuVa<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.0
+    }
+}
+
+// SAFETY: All operations that manipulate the interval tree take `&mut self`. In
+// other words, there is no interior mutability allowing mutation from a shared
+// reference to GpuVm<T>, so it's OK to send a &GpuVm<T> to another thread.
+//
+// By definition, this implies that it is safe to implement Sync.
+unsafe impl<T: DriverGpuVm> Sync for GpuVm<T> {}
+
+// SAFETY: It is OK to send a GpuVm<T> to another thread.
+unsafe impl<T: DriverGpuVm> Send for GpuVm<T> {}
+
+// SAFETY: By the same token, there is no way that a GpuVmBo<T> can be mutated
+// from a shared reference. For the cases where the underlying
+// [`kernel::gem::Object`] is modified through a [`GpuVmBo`], its VA lock is
+// taken. This ensures that it is still thread-safe to modify the underlying BO
+// even when it is shared among multiple VMs.
+//
+// (NOTE: this will be implemented in v4)
+unsafe impl<T: DriverGpuVm> Sync for GpuVmBo<T> {}
+
+// SAFETY: It is OK to send a GpuVmBo<T> to another thread.
+unsafe impl<T: DriverGpuVm> Send for GpuVmBo<T> {}
+
+/// # Safety
+///
+/// This function is only safe to be called from the GPUVM C code.
+unsafe extern "C" fn vm_bo_free_callback<T: DriverGpuVm>(raw_vm_bo: *mut bindings::drm_gpuvm_bo) {
+    // SAFETY: Container invariant is guaranteed for objects using this callback.
+    let p = unsafe { crate::container_of!(raw_vm_bo, GpuVmBo<T>, bo) as *mut GpuVmBo<T> };
+
+    // SAFETY: p is guaranteed to be valid for drm_gpuvm_bo objects using this callback.
+    unsafe { drop(KBox::from_raw(p)) };
+}
+
+/// # Safety
+///
+/// This function is only safe to be called from the GPUVM C code.
+unsafe extern "C" fn step_map_callback<T: DriverGpuVm>(
+    op: *mut bindings::drm_gpuva_op,
+    _priv: *mut core::ffi::c_void,
+) -> core::ffi::c_int {
+    // SAFETY: We know this is a map op, and OpMap is a transparent wrapper.
+    let map = unsafe { (&raw mut (*op).__bindgen_anon_1.map) }.cast(); //as *mut _ as *mut OpMap<T>;
+
+    // SAFETY: It is ok to reborrow the pointer as a mutable reference here.
+    let map = unsafe { &mut *map };
+
+    // SAFETY: This is a pointer to a StepContext created inline in sm_map(), which is
+    // guaranteed to outlive this function.
+    let ctx = unsafe { &mut *(_priv as *mut StepContext<'_, T>) };
+
+    from_result(|| {
+        T::step_map(ctx.gpuvm, map, ctx.ctx)?;
+        Ok(0)
+    })
+}
+
+/// # Safety
+///
+/// This function is only safe to be called from the GPUVM C code.
+unsafe extern "C" fn step_remap_callback<T: DriverGpuVm>(
+    op: *mut bindings::drm_gpuva_op,
+    _priv: *mut core::ffi::c_void,
+) -> core::ffi::c_int {
+    // SAFETY: We know this is a map op, and OpReMap is a transparent wrapper.
+    let remap: *mut OpReMap<T> = unsafe { (&raw mut (*op).__bindgen_anon_1.remap) }.cast(); //as *mut _ as *mut OpMap<T>;
+
+    // SAFETY: It is ok to reborrow the pointer as a mutable reference here.
+    let remap = unsafe { &mut *remap };
+
+    // SAFETY: This is a pointer to a StepContext created inline in sm_map(), which is
+    // guaranteed to outlive this function.
+    let ctx = unsafe { &mut *(_priv as *mut StepContext<'_, T>) };
+
+    // SAFETY: Safe by the type invariants of `GpuVa<T>`
+    let p_vm_bo = unsafe { *remap.unmap().va().unwrap().gpuva.get() }.vm_bo;
+
+    let res = {
+        // SAFETY: vm_bo pointer must be valid and non-null by the step_remap
+        // invariants.
+        //
+        // Since we , this reference's lifetime is until
+        // [`AlwaysRefCounted::dec_ref`] is called.
+        let vm_bo_ref = unsafe {
+            bindings::drm_gpuvm_bo_get(p_vm_bo);
+            &*(crate::container_of!(p_vm_bo, GpuVmBo<T>, bo) as *mut GpuVmBo<T>)
+        };
+
+        from_result(|| {
+            T::step_remap(ctx.gpuvm, remap, vm_bo_ref, ctx.ctx)?;
+            Ok(0)
+        })
+    };
+
+    // SAFETY: We incremented the refcount above, and the Rust reference we took is
+    // no longer in scope.
+    unsafe { bindings::drm_gpuvm_bo_put(p_vm_bo) };
+
+    res
+}
+
+/// # Safety
+///
+/// This function is only safe to be called from the GPUVM C code.
+unsafe extern "C" fn step_unmap_callback<T: DriverGpuVm>(
+    op: *mut bindings::drm_gpuva_op,
+    _priv: *mut core::ffi::c_void,
+) -> core::ffi::c_int {
+    // SAFETY: We know this is a map op, and OpReMap is a transparent wrapper.
+    let unmap = unsafe { (&raw mut (*op).__bindgen_anon_1.unmap) }.cast(); //as *mut _ as *mut OpMap<T>;
+
+    // SAFETY: It is ok to reborrow the pointer as a mutable reference here.
+    let unmap = unsafe { &mut *unmap };
+
+    // SAFETY: This is a pointer to a StepContext created inline in sm_map(), which is
+    // guaranteed to outlive this function.
+    let ctx = unsafe { &mut *(_priv as *mut StepContext<'_, T>) };
+
+    from_result(|| {
+        T::step_unmap(ctx.gpuvm, unmap, ctx.ctx)?;
+        Ok(0)
+    })
+}
+
+/// # Safety
+///
+/// This function is only safe to be called from the GPUVM C code.
+unsafe extern "C" fn vm_free_callback<T: DriverGpuVm>(raw_gpuvm: *mut bindings::drm_gpuvm) {
+    // SAFETY: `raw_gpuvm` points inside the allocation for `GpuVm<T>`, see [`GpuVm::new`].
+    let p = unsafe {
+        crate::container_of!(
+            raw_gpuvm as *mut Opaque<bindings::drm_gpuvm>,
+            GpuVm<T>,
+            gpuvm
+        ) as *mut GpuVm<T>
+    };
+
+    // SAFETY: `p` is guaranteed to be valid for [`bindings::drm_gpuvm`] objects
+    // using this callback. It was leaked in [`GpuVm::new`].
+    unsafe { drop(KBox::from_raw(p)) };
+}
+
+/// # Safety
+///
+/// This function is only safe to be called from the GPUVM C code.
+unsafe extern "C" fn vm_bo_alloc_callback<T: DriverGpuVm>() -> *mut bindings::drm_gpuvm_bo {
+    let obj: Result<Pin<KBox<GpuVmBo<T>>>, Error> = KBox::pin_init(
+        pin_init!(GpuVmBo::<T> {
+            bo: Opaque::zeroed(),
+            inner <- T::GpuVmBo::new(),
+            _p: PhantomPinned
+        }),
+        GFP_KERNEL,
+    );
+
+    match obj {
+        Ok(obj) => {
+            // SAFETY: The DRM core will keep this object pinned.
+            let inner = unsafe { Pin::into_inner_unchecked(obj) };
+            let p: &mut GpuVmBo<T> = KBox::leak(inner);
+            p.bo.get()
+        }
+
+        Err(_) => core::ptr::null_mut(),
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf25b947afc08300e211bd97150d6b..4d758e6650da9ca360be30e07f27b255ff5e2d2e 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -6,6 +6,8 @@
 pub mod driver;
 pub mod file;
 pub mod gem;
+#[cfg(CONFIG_DRM_GPUVM = "y")]
+pub mod gpuvm;
 pub mod ioctl;
 
 pub use self::device::Device;

---
base-commit: 2ab157cabbbcd3ae64320078c64bcac88056ba46
change-id: 20250320-gpuvm-29d3e0726f34

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

