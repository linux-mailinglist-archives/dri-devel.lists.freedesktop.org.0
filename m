Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB66D8247
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9240710EA01;
	Wed,  5 Apr 2023 15:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178B10EA01
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:43:06 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-947a47eb908so56699066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680709385;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evQ2yt2QmFRI6ww4FTLAtNNICgBtWk0wPp/MFca+oo4=;
 b=d6ElVG1P0SdrkQdNgcvG2N6daZAsB0SEIM1nYmVJD3/ZgWqd8eO+UDha65uvLpKDx3
 //DYLSgCcndYT+S5nitB9hdezoBhSPy2v2ugdYCDFrFd60xSVys0uUXJYD4hiFpRSuFB
 U2hv8yP6KSohzY8Si6LKNgrnv2/Olld1kNvck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680709385;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=evQ2yt2QmFRI6ww4FTLAtNNICgBtWk0wPp/MFca+oo4=;
 b=a2MD5LHnVD8jgZAf+y6OCQ3aKD6qKT7vG5+KL4zO+sldZFS6izRU43pS5UvuT2XjNG
 NeU4z3Os49HtxVMCSQZ93XJ562JtCmBQhC3AP0d5Qb9hofMQWa52J04XNDxKaGx1KtuW
 LKLkD3hHoQf82tX4quBGKpia5cR7LAC5gZ+gwnKjnj4x5mdQfTTXCUdIOT+XOHEpeBXm
 ShFT4f6h/0Lds37ZnRt6RYhI/5KB0jj5cHdqHh7vC7mBqFTzL+3lb/gy6E+nfvku2NoB
 8X55ruCfgr3XyQe9VVD0OUP67uR9Kj9JU+iV68c0jWeXvqOlIm5W4yIB+4HSq5o5BQPp
 QoaQ==
X-Gm-Message-State: AAQBX9dSK5uB5Aol6dO6vDWd2k6ZrLCCC12yPeTfGLGIgqRB2L6RD1jg
 8i+4ZXBZw/C7L2aZl7bKgmUg9w==
X-Google-Smtp-Source: AKy350YDEEUMqgbUE9rf7HmvKkCImjgAbHnXINZlBloS8ybCPK8XeweKhbseZPLcMMxRyaxh6iFQxw==
X-Received: by 2002:a17:906:13:b0:8f0:ba09:4abe with SMTP id
 19-20020a170906001300b008f0ba094abemr3333657eja.2.1680709384604; 
 Wed, 05 Apr 2023 08:43:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 z9-20020a17090665c900b0093fa8c2e877sm7432869ejn.80.2023.04.05.08.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:43:03 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:43:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH RFC 12/18] rust: drm: sched: Add GPU scheduler abstraction
Message-ID: <ZC2XBfJGAdNMQjpZ@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-12-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-12-917ff5bc80a8@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:25:37PM +0900, Asahi Lina wrote:
> The GPU scheduler manages scheduling GPU jobs and dependencies between
> them. This Rust abstraction allows Rust DRM drivers to use this
> functionality.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Overall (with my limited rust knowledge) I really like this, it nicely
encodes the state transitions of jobs and anything else I looked into.
Some thoughts/questions below.

> ---
>  drivers/gpu/drm/Kconfig         |   5 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers.c                  |   6 +
>  rust/kernel/drm/mod.rs          |   2 +
>  rust/kernel/drm/sched.rs        | 358 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 372 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 70a983a17ac2..8b5ad6aee126 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -39,6 +39,11 @@ config RUST_DRM_GEM_SHMEM_HELPER
>  	depends on RUST_DRM
>  	select DRM_GEM_SHMEM_HELPER
>  
> +config RUST_DRM_SCHED
> +	bool
> +	depends on RUST_DRM
> +	select DRM_SCHED
> +
>  config DRM_MIPI_DBI
>  	tristate
>  	depends on DRM
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index b6696011f3a4..dc01be08676e 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -13,6 +13,7 @@
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_syncobj.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-fence.h>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 11965b1e2f4e..1b33ed602090 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -408,6 +408,12 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
>  }
>  EXPORT_SYMBOL_GPL(rust_helper___spin_lock_init);
>  
> +unsigned long rust_helper_msecs_to_jiffies(const unsigned int m)
> +{
> +	return msecs_to_jiffies(m);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_msecs_to_jiffies);
> +
>  #ifdef CONFIG_DMA_SHARED_BUFFER
>  
>  void rust_helper_dma_fence_get(struct dma_fence *fence)
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index dae98826edfd..3ddf7712aab3 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -8,4 +8,6 @@ pub mod file;
>  pub mod gem;
>  pub mod ioctl;
>  pub mod mm;
> +#[cfg(CONFIG_RUST_DRM_SCHED)]
> +pub mod sched;
>  pub mod syncobj;
> diff --git a/rust/kernel/drm/sched.rs b/rust/kernel/drm/sched.rs
> new file mode 100644
> index 000000000000..a5275cc16179
> --- /dev/null
> +++ b/rust/kernel/drm/sched.rs
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM Scheduler
> +//!
> +//! C header: [`include/linux/drm/gpu_scheduler.h`](../../../../include/linux/drm/gpu_scheduler.h)
> +
> +use crate::{
> +    bindings, device,
> +    dma_fence::*,
> +    error::{to_result, Result},
> +    prelude::*,
> +    sync::{Arc, UniqueArc},
> +};
> +use alloc::boxed::Box;
> +use core::marker::PhantomData;
> +use core::mem::MaybeUninit;
> +use core::ops::{Deref, DerefMut};
> +use core::ptr::addr_of_mut;
> +
> +/// Scheduler status after timeout recovery
> +#[repr(u32)]
> +pub enum Status {
> +    /// Device recovered from the timeout and can execute jobs again
> +    Nominal = bindings::drm_gpu_sched_stat_DRM_GPU_SCHED_STAT_NOMINAL,
> +    /// Device is no longer available
> +    NoDevice = bindings::drm_gpu_sched_stat_DRM_GPU_SCHED_STAT_ENODEV,
> +}
> +
> +/// Scheduler priorities
> +#[repr(i32)]
> +pub enum Priority {
> +    /// Low userspace priority
> +    Min = bindings::drm_sched_priority_DRM_SCHED_PRIORITY_MIN,
> +    /// Normal userspace priority
> +    Normal = bindings::drm_sched_priority_DRM_SCHED_PRIORITY_NORMAL,
> +    /// High userspace priority
> +    High = bindings::drm_sched_priority_DRM_SCHED_PRIORITY_HIGH,
> +    /// Kernel priority (highest)
> +    Kernel = bindings::drm_sched_priority_DRM_SCHED_PRIORITY_KERNEL,
> +}
> +
> +/// Trait to be implemented by driver job objects.
> +pub trait JobImpl: Sized {
> +    /// Called when the scheduler is considering scheduling this job next, to get another Fence
> +    /// for this job to block on. Once it returns None, run() may be called.
> +    fn prepare(_job: &mut Job<Self>) -> Option<Fence> {

So if I get this all right then Job<T> allows us to nicely parametrize the
job with the driver structure itself, but not really anything else. I do
wonder whether this needs a bit more with a type both for the job and
entity and the drm/sched code + rust wrapper guaranteeing that the
lifetimes of these make sense. With just the job parametrized drivers need
to make sure they refcount anything else hanging of that properly which
means if they get some detail wrong there might be an unintentional leak.

If we instead also give a parametrized entity where the driver can stuff
anything necessary and sched code guarantees that it'll clean up the any
mess on teardown and guarantee that the entity survives, I think a lot of
drivers could benefit from that and it would be easier for them to have
the right lifetimes for everything and no leaks.


> +        None // Equivalent to NULL function pointer
> +    }
> +
> +    /// Called before job execution to check whether the hardware is free enough to run the job.
> +    /// This can be used to implement more complex hardware resource policies than the hw_submission
> +    /// limit.
> +    fn can_run(_job: &mut Job<Self>) -> bool {
> +        true
> +    }
> +
> +    /// Called to execute the job once all of the dependencies have been resolved. This may be
> +    /// called multiple times, if timed_out() has happened and drm_sched_job_recovery() decides
> +    /// to try it again.
> +    fn run(job: &mut Job<Self>) -> Result<Option<Fence>>;
> +
> +    /// Called when a job has taken too long to execute, to trigger GPU recovery.
> +    ///
> +    /// This method is called in a workqueue context.
> +    fn timed_out(job: &mut Job<Self>) -> Status;
> +}
> +
> +unsafe extern "C" fn prepare_job_cb<T: JobImpl>(
> +    sched_job: *mut bindings::drm_sched_job,
> +    _s_entity: *mut bindings::drm_sched_entity,
> +) -> *mut bindings::dma_fence {
> +    // SAFETY: All of our jobs are Job<T>.
> +    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
> +
> +    match T::prepare(unsafe { &mut *p }) {
> +        None => core::ptr::null_mut(),
> +        Some(fence) => fence.into_raw(),
> +    }
> +}
> +
> +unsafe extern "C" fn run_job_cb<T: JobImpl>(
> +    sched_job: *mut bindings::drm_sched_job,
> +) -> *mut bindings::dma_fence {
> +    // SAFETY: All of our jobs are Job<T>.
> +    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
> +
> +    match T::run(unsafe { &mut *p }) {
> +        Err(e) => e.to_ptr(),
> +        Ok(None) => core::ptr::null_mut(),
> +        Ok(Some(fence)) => fence.into_raw(),
> +    }
> +}
> +
> +unsafe extern "C" fn can_run_job_cb<T: JobImpl>(sched_job: *mut bindings::drm_sched_job) -> bool {
> +    // SAFETY: All of our jobs are Job<T>.
> +    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
> +
> +    T::can_run(unsafe { &mut *p })
> +}
> +
> +unsafe extern "C" fn timedout_job_cb<T: JobImpl>(
> +    sched_job: *mut bindings::drm_sched_job,
> +) -> bindings::drm_gpu_sched_stat {
> +    // SAFETY: All of our jobs are Job<T>.
> +    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
> +
> +    T::timed_out(unsafe { &mut *p }) as bindings::drm_gpu_sched_stat
> +}
> +
> +unsafe extern "C" fn free_job_cb<T: JobImpl>(sched_job: *mut bindings::drm_sched_job) {
> +    // SAFETY: All of our jobs are Job<T>.
> +    let p = crate::container_of!(sched_job, Job<T>, job) as *mut Job<T>;
> +
> +    // Convert the job back to a Box and drop it
> +    // SAFETY: All of our Job<T>s are created inside a box.
> +    unsafe { Box::from_raw(p) };
> +}
> +
> +/// A DRM scheduler job.
> +pub struct Job<T: JobImpl> {
> +    job: bindings::drm_sched_job,
> +    inner: T,
> +}
> +
> +impl<T: JobImpl> Deref for Job<T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: JobImpl> DerefMut for Job<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.inner
> +    }
> +}
> +
> +impl<T: JobImpl> Drop for Job<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: At this point the job has either been submitted and this is being called from
> +        // `free_job_cb` above, or it hasn't and it is safe to call `drm_sched_job_cleanup`.
> +        unsafe { bindings::drm_sched_job_cleanup(&mut self.job) };
> +    }
> +}
> +
> +/// A pending DRM scheduler job (not yet armed)
> +pub struct PendingJob<'a, T: JobImpl>(Box<Job<T>>, PhantomData<&'a T>);
> +
> +impl<'a, T: JobImpl> PendingJob<'a, T> {
> +    /// Add a fence as a dependency to the job
> +    pub fn add_dependency(&mut self, fence: Fence) -> Result {
> +        to_result(unsafe {
> +            bindings::drm_sched_job_add_dependency(&mut self.0.job, fence.into_raw())
> +        })
> +    }
> +
> +    /// Arm the job to make it ready for execution
> +    pub fn arm(mut self) -> ArmedJob<'a, T> {
> +        unsafe { bindings::drm_sched_job_arm(&mut self.0.job) };
> +        ArmedJob(self.0, PhantomData)
> +    }
> +}
> +
> +impl<'a, T: JobImpl> Deref for PendingJob<'a, T> {
> +    type Target = Job<T>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<'a, T: JobImpl> DerefMut for PendingJob<'a, T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.0
> +    }
> +}
> +
> +/// An armed DRM scheduler job (not yet submitted)
> +pub struct ArmedJob<'a, T: JobImpl>(Box<Job<T>>, PhantomData<&'a T>);
> +
> +impl<'a, T: JobImpl> ArmedJob<'a, T> {
> +    /// Returns the job fences
> +    pub fn fences(&self) -> JobFences<'_> {
> +        JobFences(unsafe { &mut *self.0.job.s_fence })
> +    }
> +
> +    /// Push the job for execution into the scheduler
> +    pub fn push(self) {
> +        // After this point, the job is submitted and owned by the scheduler
> +        let ptr = match self {
> +            ArmedJob(job, _) => Box::<Job<T>>::into_raw(job),
> +        };

If I get this all right then this all makes sure that drivers can't use
the job after push and they don't forgot to call arm.

What I'm not seeing is how we force drivers to call push once they've
called arm? I haven't check what the code does, but from the docs it
sounds like if you don't call push then drop will get called. Which wreaks
the book-keeping on an armed job. Or is there someting that prevents
ArmedJob<T> from having the Drop trait and so the only way to not go boom
is by pushing it?

Googling for "rust undroppable" seems to indicate that this isn't a thing
rust can do?

> +
> +        // SAFETY: We are passing in ownership of a valid Box raw pointer.
> +        unsafe { bindings::drm_sched_entity_push_job(addr_of_mut!((*ptr).job)) };
> +    }
> +}
> +impl<'a, T: JobImpl> Deref for ArmedJob<'a, T> {
> +    type Target = Job<T>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<'a, T: JobImpl> DerefMut for ArmedJob<'a, T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.0
> +    }
> +}
> +
> +/// Reference to the bundle of fences attached to a DRM scheduler job
> +pub struct JobFences<'a>(&'a mut bindings::drm_sched_fence);
> +
> +impl<'a> JobFences<'a> {
> +    /// Returns a new reference to the job scheduled fence.
> +    pub fn scheduled(&mut self) -> Fence {
> +        unsafe { Fence::get_raw(&mut self.0.scheduled) }

This feels a bit murky, because the safety of this relies on the safety of
the ArmedJob and the guarantee (promise?) that the driver will push it.
I'd just have two functions scheduled_fence and finished_fence in the
ArmedJob impl and one safety note explaining why we can wrap it in the
refcounted Fence.

> +    }
> +
> +    /// Returns a new reference to the job finished fence.
> +    pub fn finished(&mut self) -> Fence {
> +        unsafe { Fence::get_raw(&mut self.0.finished) }
> +    }
> +}
> +
> +struct EntityInner<T: JobImpl> {
> +    entity: bindings::drm_sched_entity,
> +    // TODO: Allow users to share guilty flag between entities
> +    sched: Arc<SchedulerInner<T>>,
> +    guilty: bindings::atomic_t,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: JobImpl> Drop for EntityInner<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: The EntityInner is initialized. This will cancel/free all jobs.
> +        unsafe { bindings::drm_sched_entity_destroy(&mut self.entity) };
> +    }
> +}
> +
> +// SAFETY: TODO
> +unsafe impl<T: JobImpl> Sync for EntityInner<T> {}
> +unsafe impl<T: JobImpl> Send for EntityInner<T> {}
> +
> +/// A DRM scheduler entity.
> +pub struct Entity<T: JobImpl>(Pin<Box<EntityInner<T>>>);
> +
> +impl<T: JobImpl> Entity<T> {
> +    /// Create a new scheduler entity.
> +    pub fn new(sched: &Scheduler<T>, priority: Priority) -> Result<Self> {
> +        let mut entity: Box<MaybeUninit<EntityInner<T>>> = Box::try_new_zeroed()?;
> +
> +        let mut sched_ptr = &sched.0.sched as *const _ as *mut _;
> +
> +        // SAFETY: The Box is allocated above and valid.
> +        unsafe {
> +            bindings::drm_sched_entity_init(
> +                addr_of_mut!((*entity.as_mut_ptr()).entity),
> +                priority as _,
> +                &mut sched_ptr,
> +                1,
> +                addr_of_mut!((*entity.as_mut_ptr()).guilty),
> +            )
> +        };
> +
> +        // SAFETY: The Box is allocated above and valid.
> +        unsafe { addr_of_mut!((*entity.as_mut_ptr()).sched).write(sched.0.clone()) };
> +
> +        // SAFETY: entity is now initialized.
> +        Ok(Self(Pin::from(unsafe { entity.assume_init() })))
> +    }
> +
> +    /// Create a new job on this entity.
> +    ///
> +    /// The entity must outlive the pending job until it transitions into the submitted state,
> +    /// after which the scheduler owns it.
> +    pub fn new_job(&self, inner: T) -> Result<PendingJob<'_, T>> {
> +        let mut job: Box<MaybeUninit<Job<T>>> = Box::try_new_zeroed()?;
> +
> +        // SAFETY: We hold a reference to the entity (which is a valid pointer),
> +        // and the job object was just allocated above.
> +        to_result(unsafe {
> +            bindings::drm_sched_job_init(
> +                addr_of_mut!((*job.as_mut_ptr()).job),
> +                &self.0.as_ref().get_ref().entity as *const _ as *mut _,
> +                core::ptr::null_mut(),
> +            )
> +        })?;
> +
> +        // SAFETY: The Box pointer is valid, and this initializes the inner member.
> +        unsafe { addr_of_mut!((*job.as_mut_ptr()).inner).write(inner) };
> +
> +        // SAFETY: All fields of the Job<T> are now initialized.
> +        Ok(PendingJob(unsafe { job.assume_init() }, PhantomData))
> +    }
> +}
> +
> +/// DRM scheduler inner data
> +pub struct SchedulerInner<T: JobImpl> {
> +    sched: bindings::drm_gpu_scheduler,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: JobImpl> Drop for SchedulerInner<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: The scheduler is valid. This assumes drm_sched_fini() will take care of
> +        // freeing all in-progress jobs.
> +        unsafe { bindings::drm_sched_fini(&mut self.sched) };
> +    }
> +}
> +
> +// SAFETY: TODO
> +unsafe impl<T: JobImpl> Sync for SchedulerInner<T> {}
> +unsafe impl<T: JobImpl> Send for SchedulerInner<T> {}
> +
> +/// A DRM Scheduler
> +pub struct Scheduler<T: JobImpl>(Arc<SchedulerInner<T>>);
> +
> +impl<T: JobImpl> Scheduler<T> {
> +    const OPS: bindings::drm_sched_backend_ops = bindings::drm_sched_backend_ops {
> +        prepare_job: Some(prepare_job_cb::<T>),
> +        can_run_job: Some(can_run_job_cb::<T>),
> +        run_job: Some(run_job_cb::<T>),
> +        timedout_job: Some(timedout_job_cb::<T>),
> +        free_job: Some(free_job_cb::<T>),

Two general questions with no relevance here really, just about vtable
best practices:

So the trait has default impls for exactly the functions that are optional
here, but either way we always end up with non-NULL function pointers. I
guess there's no way to avoid that when you have a nice wrapping with
traits and all that like here?

Another unrelated thing: How const is const? The C code side generally
uses ops pointers for runtime time casting, so if the const is less const
that a naive C hacker would expect, it might result in some fun.

Cheers, Daniel

> +    };
> +    /// Creates a new DRM Scheduler object
> +    // TODO: Shared timeout workqueues & scores
> +    pub fn new(
> +        device: &impl device::RawDevice,
> +        hw_submission: u32,
> +        hang_limit: u32,
> +        timeout_ms: usize,
> +        name: &'static CStr,
> +    ) -> Result<Scheduler<T>> {
> +        let mut sched: UniqueArc<MaybeUninit<SchedulerInner<T>>> = UniqueArc::try_new_uninit()?;
> +
> +        // SAFETY: The drm_sched pointer is valid and pinned as it was just allocated above.
> +        to_result(unsafe {
> +            bindings::drm_sched_init(
> +                addr_of_mut!((*sched.as_mut_ptr()).sched),
> +                &Self::OPS,
> +                hw_submission,
> +                hang_limit,
> +                bindings::msecs_to_jiffies(timeout_ms.try_into()?).try_into()?,
> +                core::ptr::null_mut(),
> +                core::ptr::null_mut(),
> +                name.as_char_ptr(),
> +                device.raw_device(),
> +            )
> +        })?;
> +
> +        // SAFETY: All fields of SchedulerInner are now initialized.
> +        Ok(Scheduler(unsafe { sched.assume_init() }.into()))
> +    }
> +}
> 
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
