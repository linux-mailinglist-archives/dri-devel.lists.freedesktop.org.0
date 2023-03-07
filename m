Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08316AE25F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC78510E4B5;
	Tue,  7 Mar 2023 14:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0660C10E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:28:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 5EAB44261B;
 Tue,  7 Mar 2023 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199290;
 bh=doeN3VcfbBkHfCBMFKL0Le01kutm2Kr1LQUm5Ywem7w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=GYqT9JNT3L6LU++v+IEfjknM+AZUbhwj4/2tCosIWi63HlcrPjIkHAsYVH4O+HRoh
 /MK1Fz+pXAA8W6r/40fGfpVTaTKKc7Jo6IXfnzkk3SbGW1DPwKrmU7Bd4s/hQINSYD
 p/V4RdECpng1NGRC7Gsa8n1UBVwiSfagqcvn87ZDyAlrxPxXWA8m2WZD7c4YJPxvJs
 pBgJzqOZ63Fjk0pzr9F7uPMoz/At2X9VopIDHRyYgPG1W0B2AnWOSUuPyGjroFd94S
 SiWiTJPQ7imIUx0glBwHPZD1xbXzx17vvXwhGCsW/2YoBRuSvMgjiYMlhW9ISpQB/L
 S0pQ4/m2/oTEw==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:37 +0900
Subject: [PATCH RFC 12/18] rust: drm: sched: Add GPU scheduler abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-12-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=14900;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=doeN3VcfbBkHfCBMFKL0Le01kutm2Kr1LQUm5Ywem7w=;
 b=v3jijRtVxCOMOLquRKYMJ9SpdkHB/Pr+MGkxG/X/94rpF3w8oSPPtB6SFTvw8sm6mScbBbVDZ
 G3PGDIj1/m4BKQgENwxSO1WUOpji5kpOOvLfL2+9gKEtTcQLwlr5OE8
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU scheduler manages scheduling GPU jobs and dependencies between
them. This Rust abstraction allows Rust DRM drivers to use this
functionality.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/Kconfig         |   5 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |   6 +
 rust/kernel/drm/mod.rs          |   2 +
 rust/kernel/drm/sched.rs        | 358 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 372 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 70a983a17ac2..8b5ad6aee126 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -39,6 +39,11 @@ config RUST_DRM_GEM_SHMEM_HELPER
 	depends on RUST_DRM
 	select DRM_GEM_SHMEM_HELPER
 
+config RUST_DRM_SCHED
+	bool
+	depends on RUST_DRM
+	select DRM_SCHED
+
 config DRM_MIPI_DBI
 	tristate
 	depends on DRM
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b6696011f3a4..dc01be08676e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_syncobj.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-fence.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 11965b1e2f4e..1b33ed602090 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -408,6 +408,12 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 }
 EXPORT_SYMBOL_GPL(rust_helper___spin_lock_init);
 
+unsigned long rust_helper_msecs_to_jiffies(const unsigned int m)
+{
+	return msecs_to_jiffies(m);
+}
+EXPORT_SYMBOL_GPL(rust_helper_msecs_to_jiffies);
+
 #ifdef CONFIG_DMA_SHARED_BUFFER
 
 void rust_helper_dma_fence_get(struct dma_fence *fence)
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index dae98826edfd..3ddf7712aab3 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -8,4 +8,6 @@ pub mod file;
 pub mod gem;
 pub mod ioctl;
 pub mod mm;
+#[cfg(CONFIG_RUST_DRM_SCHED)]
+pub mod sched;
 pub mod syncobj;
diff --git a/rust/kernel/drm/sched.rs b/rust/kernel/drm/sched.rs
new file mode 100644
index 000000000000..a5275cc16179
--- /dev/null
+++ b/rust/kernel/drm/sched.rs
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM Scheduler
+//!
+//! C header: [`include/linux/drm/gpu_scheduler.h`](../../../../include/linux/drm/gpu_scheduler.h)
+
+use crate::{
+    bindings, device,
+    dma_fence::*,
+    error::{to_result, Result},
+    prelude::*,
+    sync::{Arc, UniqueArc},
+};
+use alloc::boxed::Box;
+use core::marker::PhantomData;
+use core::mem::MaybeUninit;
+use core::ops::{Deref, DerefMut};
+use core::ptr::addr_of_mut;
+
+/// Scheduler status after timeout recovery
+#[repr(u32)]
+pub enum Status {
+    /// Device recovered from the timeout and can execute jobs again
+    Nominal = bindings::drm_gpu_sched_stat_DRM_GPU_SCHED_STAT_NOMINAL,
+    /// Device is no longer available
+    NoDevice = bindings::drm_gpu_sched_stat_DRM_GPU_SCHED_STAT_ENODEV,
+}
+
+/// Scheduler priorities
+#[repr(i32)]
+pub enum Priority {
+    /// Low userspace priority
+    Min = bindings::drm_sched_priority_DRM_SCHED_PRIORITY_MIN,
+    /// Normal userspace priority
+    Normal = bindings::drm_sched_priority_DRM_SCHED_PRIORITY_NORMAL,
+    /// High userspace priority
+    High = bindings::drm_sched_priority_DRM_SCHED_PRIORITY_HIGH,
+    /// Kernel priority (highest)
+    Kernel = bindings::drm_sched_priority_DRM_SCHED_PRIORITY_KERNEL,
+}
+
+/// Trait to be implemented by driver job objects.
+pub trait JobImpl: Sized {
+    /// Called when the scheduler is considering scheduling this job next, to get another Fence
+    /// for this job to block on. Once it returns None, run() may be called.
+    fn prepare(_job: &mut Job<Self>) -> Option<Fence> {
+        None // Equivalent to NULL function pointer
+    }
+
+    /// Called before job execution to check whether the hardware is free enough to run the job.
+    /// This can be used to implement more complex hardware resource policies than the hw_submission
+    /// limit.
+    fn can_run(_job: &mut Job<Self>) -> bool {
+        true
+    }
+
+    /// Called to execute the job once all of the dependencies have been resolved. This may be
+    /// called multiple times, if timed_out() has happened and drm_sched_job_recovery() decides
+    /// to try it again.
+    fn run(job: &mut Job<Self>) -> Result<Option<Fence>>;
+
+    /// Called when a job has taken too long to execute, to trigger GPU recovery.
+    ///
+    /// This method is called in a workqueue context.
+    fn timed_out(job: &mut Job<Self>) -> Status;
+}
+
+unsafe extern "C" fn prepare_job_cb<T: JobImpl>(
+    sched_job: *mut bindings::drm_sched_job,
+    _s_entity: *mut bindings::drm_sched_entity,
+) -> *mut bindings::dma_fence {
+    // SAFETY: All of our jobs are Job<T>.
+    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
+
+    match T::prepare(unsafe { &mut *p }) {
+        None => core::ptr::null_mut(),
+        Some(fence) => fence.into_raw(),
+    }
+}
+
+unsafe extern "C" fn run_job_cb<T: JobImpl>(
+    sched_job: *mut bindings::drm_sched_job,
+) -> *mut bindings::dma_fence {
+    // SAFETY: All of our jobs are Job<T>.
+    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
+
+    match T::run(unsafe { &mut *p }) {
+        Err(e) => e.to_ptr(),
+        Ok(None) => core::ptr::null_mut(),
+        Ok(Some(fence)) => fence.into_raw(),
+    }
+}
+
+unsafe extern "C" fn can_run_job_cb<T: JobImpl>(sched_job: *mut bindings::drm_sched_job) -> bool {
+    // SAFETY: All of our jobs are Job<T>.
+    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
+
+    T::can_run(unsafe { &mut *p })
+}
+
+unsafe extern "C" fn timedout_job_cb<T: JobImpl>(
+    sched_job: *mut bindings::drm_sched_job,
+) -> bindings::drm_gpu_sched_stat {
+    // SAFETY: All of our jobs are Job<T>.
+    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
+
+    T::timed_out(unsafe { &mut *p }) as bindings::drm_gpu_sched_stat
+}
+
+unsafe extern "C" fn free_job_cb<T: JobImpl>(sched_job: *mut bindings::drm_sched_job) {
+    // SAFETY: All of our jobs are Job<T>.
+    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
+
+    // Convert the job back to a Box and drop it
+    // SAFETY: All of our Job<T>s are created inside a box.
+    unsafe { Box::from_raw(p) };
+}
+
+/// A DRM scheduler job.
+pub struct Job<T: JobImpl> {
+    job: bindings::drm_sched_job,
+    inner: T,
+}
+
+impl<T: JobImpl> Deref for Job<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: JobImpl> DerefMut for Job<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.inner
+    }
+}
+
+impl<T: JobImpl> Drop for Job<T> {
+    fn drop(&mut self) {
+        // SAFETY: At this point the job has either been submitted and this is being called from
+        // `free_job_cb` above, or it hasn't and it is safe to call `drm_sched_job_cleanup`.
+        unsafe { bindings::drm_sched_job_cleanup(&mut self.job) };
+    }
+}
+
+/// A pending DRM scheduler job (not yet armed)
+pub struct PendingJob<'a, T: JobImpl>(Box<Job<T>>, PhantomData<&'a T>);
+
+impl<'a, T: JobImpl> PendingJob<'a, T> {
+    /// Add a fence as a dependency to the job
+    pub fn add_dependency(&mut self, fence: Fence) -> Result {
+        to_result(unsafe {
+            bindings::drm_sched_job_add_dependency(&mut self.0.job, fence.into_raw())
+        })
+    }
+
+    /// Arm the job to make it ready for execution
+    pub fn arm(mut self) -> ArmedJob<'a, T> {
+        unsafe { bindings::drm_sched_job_arm(&mut self.0.job) };
+        ArmedJob(self.0, PhantomData)
+    }
+}
+
+impl<'a, T: JobImpl> Deref for PendingJob<'a, T> {
+    type Target = Job<T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl<'a, T: JobImpl> DerefMut for PendingJob<'a, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.0
+    }
+}
+
+/// An armed DRM scheduler job (not yet submitted)
+pub struct ArmedJob<'a, T: JobImpl>(Box<Job<T>>, PhantomData<&'a T>);
+
+impl<'a, T: JobImpl> ArmedJob<'a, T> {
+    /// Returns the job fences
+    pub fn fences(&self) -> JobFences<'_> {
+        JobFences(unsafe { &mut *self.0.job.s_fence })
+    }
+
+    /// Push the job for execution into the scheduler
+    pub fn push(self) {
+        // After this point, the job is submitted and owned by the scheduler
+        let ptr = match self {
+            ArmedJob(job, _) => Box::<Job<T>>::into_raw(job),
+        };
+
+        // SAFETY: We are passing in ownership of a valid Box raw pointer.
+        unsafe { bindings::drm_sched_entity_push_job(addr_of_mut!((*ptr).job)) };
+    }
+}
+impl<'a, T: JobImpl> Deref for ArmedJob<'a, T> {
+    type Target = Job<T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl<'a, T: JobImpl> DerefMut for ArmedJob<'a, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.0
+    }
+}
+
+/// Reference to the bundle of fences attached to a DRM scheduler job
+pub struct JobFences<'a>(&'a mut bindings::drm_sched_fence);
+
+impl<'a> JobFences<'a> {
+    /// Returns a new reference to the job scheduled fence.
+    pub fn scheduled(&mut self) -> Fence {
+        unsafe { Fence::get_raw(&mut self.0.scheduled) }
+    }
+
+    /// Returns a new reference to the job finished fence.
+    pub fn finished(&mut self) -> Fence {
+        unsafe { Fence::get_raw(&mut self.0.finished) }
+    }
+}
+
+struct EntityInner<T: JobImpl> {
+    entity: bindings::drm_sched_entity,
+    // TODO: Allow users to share guilty flag between entities
+    sched: Arc<SchedulerInner<T>>,
+    guilty: bindings::atomic_t,
+    _p: PhantomData<T>,
+}
+
+impl<T: JobImpl> Drop for EntityInner<T> {
+    fn drop(&mut self) {
+        // SAFETY: The EntityInner is initialized. This will cancel/free all jobs.
+        unsafe { bindings::drm_sched_entity_destroy(&mut self.entity) };
+    }
+}
+
+// SAFETY: TODO
+unsafe impl<T: JobImpl> Sync for EntityInner<T> {}
+unsafe impl<T: JobImpl> Send for EntityInner<T> {}
+
+/// A DRM scheduler entity.
+pub struct Entity<T: JobImpl>(Pin<Box<EntityInner<T>>>);
+
+impl<T: JobImpl> Entity<T> {
+    /// Create a new scheduler entity.
+    pub fn new(sched: &Scheduler<T>, priority: Priority) -> Result<Self> {
+        let mut entity: Box<MaybeUninit<EntityInner<T>>> = Box::try_new_zeroed()?;
+
+        let mut sched_ptr = &sched.0.sched as *const _ as *mut _;
+
+        // SAFETY: The Box is allocated above and valid.
+        unsafe {
+            bindings::drm_sched_entity_init(
+                addr_of_mut!((*entity.as_mut_ptr()).entity),
+                priority as _,
+                &mut sched_ptr,
+                1,
+                addr_of_mut!((*entity.as_mut_ptr()).guilty),
+            )
+        };
+
+        // SAFETY: The Box is allocated above and valid.
+        unsafe { addr_of_mut!((*entity.as_mut_ptr()).sched).write(sched.0.clone()) };
+
+        // SAFETY: entity is now initialized.
+        Ok(Self(Pin::from(unsafe { entity.assume_init() })))
+    }
+
+    /// Create a new job on this entity.
+    ///
+    /// The entity must outlive the pending job until it transitions into the submitted state,
+    /// after which the scheduler owns it.
+    pub fn new_job(&self, inner: T) -> Result<PendingJob<'_, T>> {
+        let mut job: Box<MaybeUninit<Job<T>>> = Box::try_new_zeroed()?;
+
+        // SAFETY: We hold a reference to the entity (which is a valid pointer),
+        // and the job object was just allocated above.
+        to_result(unsafe {
+            bindings::drm_sched_job_init(
+                addr_of_mut!((*job.as_mut_ptr()).job),
+                &self.0.as_ref().get_ref().entity as *const _ as *mut _,
+                core::ptr::null_mut(),
+            )
+        })?;
+
+        // SAFETY: The Box pointer is valid, and this initializes the inner member.
+        unsafe { addr_of_mut!((*job.as_mut_ptr()).inner).write(inner) };
+
+        // SAFETY: All fields of the Job<T> are now initialized.
+        Ok(PendingJob(unsafe { job.assume_init() }, PhantomData))
+    }
+}
+
+/// DRM scheduler inner data
+pub struct SchedulerInner<T: JobImpl> {
+    sched: bindings::drm_gpu_scheduler,
+    _p: PhantomData<T>,
+}
+
+impl<T: JobImpl> Drop for SchedulerInner<T> {
+    fn drop(&mut self) {
+        // SAFETY: The scheduler is valid. This assumes drm_sched_fini() will take care of
+        // freeing all in-progress jobs.
+        unsafe { bindings::drm_sched_fini(&mut self.sched) };
+    }
+}
+
+// SAFETY: TODO
+unsafe impl<T: JobImpl> Sync for SchedulerInner<T> {}
+unsafe impl<T: JobImpl> Send for SchedulerInner<T> {}
+
+/// A DRM Scheduler
+pub struct Scheduler<T: JobImpl>(Arc<SchedulerInner<T>>);
+
+impl<T: JobImpl> Scheduler<T> {
+    const OPS: bindings::drm_sched_backend_ops = bindings::drm_sched_backend_ops {
+        prepare_job: Some(prepare_job_cb::<T>),
+        can_run_job: Some(can_run_job_cb::<T>),
+        run_job: Some(run_job_cb::<T>),
+        timedout_job: Some(timedout_job_cb::<T>),
+        free_job: Some(free_job_cb::<T>),
+    };
+    /// Creates a new DRM Scheduler object
+    // TODO: Shared timeout workqueues & scores
+    pub fn new(
+        device: &impl device::RawDevice,
+        hw_submission: u32,
+        hang_limit: u32,
+        timeout_ms: usize,
+        name: &'static CStr,
+    ) -> Result<Scheduler<T>> {
+        let mut sched: UniqueArc<MaybeUninit<SchedulerInner<T>>> = UniqueArc::try_new_uninit()?;
+
+        // SAFETY: The drm_sched pointer is valid and pinned as it was just allocated above.
+        to_result(unsafe {
+            bindings::drm_sched_init(
+                addr_of_mut!((*sched.as_mut_ptr()).sched),
+                &Self::OPS,
+                hw_submission,
+                hang_limit,
+                bindings::msecs_to_jiffies(timeout_ms.try_into()?).try_into()?,
+                core::ptr::null_mut(),
+                core::ptr::null_mut(),
+                name.as_char_ptr(),
+                device.raw_device(),
+            )
+        })?;
+
+        // SAFETY: All fields of SchedulerInner are now initialized.
+        Ok(Scheduler(unsafe { sched.assume_init() }.into()))
+    }
+}

-- 
2.35.1

