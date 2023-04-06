Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0DD6D9950
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D4410EBCF;
	Thu,  6 Apr 2023 14:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B76910EBCF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 14:15:24 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-93abb185e13so16601166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680790522; x=1683382522;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gUOzXpvbqkBTPvEq29bi5UEXn+lSYh1aCGbwW1ujfg=;
 b=OS5wJj+iePq2BSMN+rP4D+kVR6a3XuxxakMa+YW5JrUrkY2ZxpHA4EEPRWgF6D52D/
 IvJBJ0DPMm1mINA4He+EpIBSDB3MFCQAcLhiNTGRL+pY09JOZYg35M5NCE6pNYme9GOW
 pzuFuf5n0Zf4qI+A06V9wx77kCMr4KZIMJ384=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680790522; x=1683382522;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9gUOzXpvbqkBTPvEq29bi5UEXn+lSYh1aCGbwW1ujfg=;
 b=KFRmE73KP61hR4QZDSq30SINXFGpEvYHImKsfrtayHBKIKrXd2JpoU20T6BK+Qyc97
 UuinkSduTPP1XggPr5YXoG7dgzKOALgkWEQ/P27Yz9ewjvR9L36Fi1U5gEFnQz7cbFCW
 vmAtvWH1gMXKLbWMoXllfNZ5cuVR2OWZdkyquwH9goTRPagAjtN+B7ixSxYwaX72mzr+
 Gghxs+nJ8qeVMde5PPXTgGbQHjibfG55+pGIDVl4GfJ5ST1Jb5Cc8OY1lKeKUAsqAjI9
 lCEkRm4xOOIOQbLLVF/Je9SutLwgjyhZXOucyB0PvbGQuoypLJOkGIxvHoLAicghX7UZ
 2gPg==
X-Gm-Message-State: AAQBX9dkn7YZcf7tCFgukvymT4iuFw7gAMfrB6IyD0ofH8FdtQO1aSv0
 WeUveOZYa2sBiE5nh6RufdE7qw==
X-Google-Smtp-Source: AKy350ZTHRZsrKlVcRMLXYYBq7XW32LPfEB461PDGrrSj0ir1getkI4aPU6HRwaRZS99zrUJYHeWFg==
X-Received: by 2002:a17:906:51cd:b0:931:5145:c51f with SMTP id
 v13-20020a17090651cd00b009315145c51fmr4793748ejk.4.1680790522200; 
 Thu, 06 Apr 2023 07:15:22 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 i19-20020a170906091300b00923f05b2931sm865012ejd.118.2023.04.06.07.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 07:15:21 -0700 (PDT)
Date: Thu, 6 Apr 2023 16:15:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH RFC 07/18] rust: drm: mm: Add DRM MM Range Allocator
 abstraction
Message-ID: <ZC7T92F7K9XTZPZ1@phenom.ffwll.local>
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
 <20230307-rust-drm-v1-7-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-7-917ff5bc80a8@asahilina.net>
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

On Tue, Mar 07, 2023 at 11:25:32PM +0900, Asahi Lina wrote:
> drm_mm provides a simple range allocator, useful for managing virtual
> address ranges. Add a Rust abstraction to expose this module to Rust
> drivers.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

In the cover letter you mentioned the design open about embedded the lock
into the rust wrappers.

I think for a first step that's perfectly fine.

Longer term we might want to ramp up some "proof of locking"
infrastructure in Rust, where callers can supply a lock guard and ideally
rust validates at compile time that it's for the right type, and at
runtime (like lockdep) that it's consistent and the callers don't mix up
locks (like using different locks for the same drm_mm allocator).

There's a lot of libraries in the kernel that have this "caller ensures
locking" pattern. drm/sched also has these requirements.

There's two other things I'd like to bring up on this patch though, just
because it's a good example. But they're both really general points that
apply for all the rust wrappers.

Documentation:

In drm we try to document all the interfaces that drivers use with formal
docs. Yes there's some areas that are not great for historical reasons,
but for new stuff and new wrappers we're really trying:

- This helps in telling internal (even across .c files or in rust across
  modules within a crate) from stuff drivers access. Sure you have static
  in C or pub in rust, but that doesn't tell you whether it's public all
  the way to drivers.

- ideally docs have a short intro section that explains the main concepts
  and links to the main data structures and functions. Just to give
  readers a good starting point to explore.

- Linking all the things, so that readers can connect the different parts.
  This is really important in C where e.g. get/put() or any such function
  pairs all needed to be linked together. With rust I'm hoping that
  rustdoc liberally sprinkles links already and we don't have to do this
  as much.

- Short explainers for parameters. For rust this also means type
  parameters, for those even simplified examples of how drivers are
  supposed to use them would help a lot in reading docs & understanding
  concepts.

- Ideally links from the rust to the sphinx side to linke relevant
  chapters together. Often the bigger explanations are in .rst files with
  DOT graphs (kms has a bunch I've added) or similar, and it doesn't make
  that much sense to duplicate all that on the rust side I guess. But it
  needs to be discoverable.

This might be more a discussion topic for the rust people than you
directly. Still needed for the merge-ready patches eventually.

Refcounting vs borrowing:

This is honestly much more the eyebrow raising one than the locking. Very
often on the C side these datastructures all work with borrow semantics,
and you need to explicitly upgrade to a full reference (kref_get or
kref_get_unless_zero, depending whether it's a strong or weak reference)
if you need the object outside of the mutex/lock guard section.

Again I think for now it's ok, but the sales pitch of rust is that it
enables borrow lifetime checking with no runtime cost. Plus viz the vm
cleanup example, if you have too many strong backreferences the cleanup
flow gets complicated. And it would suck if rust drivers have to add
complexity like the openrefcount for the vm example simply because we
can't model the borrow semantics well enough to be safe.

So not something that's really bad here, but if we need to resort to full
refcounting already for simple datastructures then I'm getting a bit
worried about how well rust will cope with the really nasty borrowed
reference tricks we're playing in other areas.

Again more a topic for the rust folks I think than specifically here about
drm_mm wrapping. Just to get things going I think this is fine.

Cheers, Daniel


> ---
>  rust/kernel/drm/mm.rs  | 309 +++++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/drm/mod.rs |   1 +
>  2 files changed, 310 insertions(+)
> 
> diff --git a/rust/kernel/drm/mm.rs b/rust/kernel/drm/mm.rs
> new file mode 100644
> index 000000000000..83e27a7dcc7e
> --- /dev/null
> +++ b/rust/kernel/drm/mm.rs
> @@ -0,0 +1,309 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM MM range allocator
> +//!
> +//! C header: [`include/linux/drm/drm_mm.h`](../../../../include/linux/drm/drm_mm.h)
> +
> +use crate::{
> +    bindings,
> +    error::{to_result, Result},
> +    str::CStr,
> +    sync::{Arc, LockClassKey, LockIniter, Mutex, UniqueArc},
> +    types::Opaque,
> +};
> +
> +use alloc::boxed::Box;
> +
> +use core::{
> +    marker::{PhantomData, PhantomPinned},
> +    ops::Deref,
> +    pin::Pin,
> +};
> +
> +/// Type alias representing a DRM MM node.
> +pub type Node<A, T> = Pin<Box<NodeData<A, T>>>;
> +
> +/// Trait which must be implemented by the inner allocator state type provided by the user.
> +pub trait AllocInner<T> {
> +    /// Notification that a node was dropped from the allocator.
> +    fn drop_object(&mut self, _start: u64, _size: u64, _color: usize, _object: &mut T) {}
> +}
> +
> +impl<T> AllocInner<T> for () {}
> +
> +/// Wrapper type for a `struct drm_mm` plus user AllocInner object.
> +///
> +/// # Invariants
> +/// The `drm_mm` struct is valid and initialized.
> +struct MmInner<A: AllocInner<T>, T>(Opaque<bindings::drm_mm>, A, PhantomData<T>);
> +
> +/// Represents a single allocated node in the MM allocator
> +pub struct NodeData<A: AllocInner<T>, T> {
> +    node: bindings::drm_mm_node,
> +    mm: Arc<Mutex<MmInner<A, T>>>,
> +    valid: bool,
> +    /// A drm_mm_node needs to be pinned because nodes reference each other in a linked list.
> +    _pin: PhantomPinned,
> +    inner: T,
> +}
> +
> +// SAFETY: Allocator ops take the mutex, and there are no mutable actions on the node.
> +unsafe impl<A: Send + AllocInner<T>, T: Send> Send for NodeData<A, T> {}
> +unsafe impl<A: Send + AllocInner<T>, T: Sync> Sync for NodeData<A, T> {}
> +
> +/// Available MM node insertion modes
> +#[repr(u32)]
> +pub enum InsertMode {
> +    /// Search for the smallest hole (within the search range) that fits the desired node.
> +    ///
> +    /// Allocates the node from the bottom of the found hole.
> +    Best = bindings::drm_mm_insert_mode_DRM_MM_INSERT_BEST,
> +
> +    /// Search for the lowest hole (address closest to 0, within the search range) that fits the
> +    /// desired node.
> +    ///
> +    /// Allocates the node from the bottom of the found hole.
> +    Low = bindings::drm_mm_insert_mode_DRM_MM_INSERT_LOW,
> +
> +    /// Search for the highest hole (address closest to U64_MAX, within the search range) that fits
> +    /// the desired node.
> +    ///
> +    /// Allocates the node from the top of the found hole. The specified alignment for the node is
> +    /// applied to the base of the node (`Node.start()`).
> +    High = bindings::drm_mm_insert_mode_DRM_MM_INSERT_HIGH,
> +
> +    /// Search for the most recently evicted hole (within the search range) that fits the desired
> +    /// node. This is appropriate for use immediately after performing an eviction scan and removing
> +    /// the selected nodes to form a hole.
> +    ///
> +    /// Allocates the node from the bottom of the found hole.
> +    Evict = bindings::drm_mm_insert_mode_DRM_MM_INSERT_EVICT,
> +}
> +
> +/// A clonable, interlocked reference to the allocator state.
> +///
> +/// This is useful to perform actions on the user-supplied `AllocInner<T>` type given just a Node,
> +/// without immediately taking the lock.
> +#[derive(Clone)]
> +pub struct InnerRef<A: AllocInner<T>, T>(Arc<Mutex<MmInner<A, T>>>);
> +
> +impl<A: AllocInner<T>, T> InnerRef<A, T> {
> +    /// Operate on the user `AllocInner<T>` implementation, taking the lock.
> +    pub fn with<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
> +        let mut l = self.0.lock();
> +        cb(&mut l.1)
> +    }
> +}
> +
> +impl<A: AllocInner<T>, T> NodeData<A, T> {
> +    /// Returns the color of the node (an opaque value)
> +    pub fn color(&self) -> usize {
> +        self.node.color as usize
> +    }
> +
> +    /// Returns the start address of the node
> +    pub fn start(&self) -> u64 {
> +        self.node.start
> +    }
> +
> +    /// Returns the size of the node in bytes
> +    pub fn size(&self) -> u64 {
> +        self.node.size
> +    }
> +
> +    /// Operate on the user `AllocInner<T>` implementation associated with this node's allocator.
> +    pub fn with_inner<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
> +        let mut l = self.mm.lock();
> +        cb(&mut l.1)
> +    }
> +
> +    /// Return a clonable, detached reference to the allocator inner data.
> +    pub fn alloc_ref(&self) -> InnerRef<A, T> {
> +        InnerRef(self.mm.clone())
> +    }
> +
> +    /// Return a mutable reference to the inner data.
> +    pub fn inner_mut(self: Pin<&mut Self>) -> &mut T {
> +        // SAFETY: This is okay because inner is not structural
> +        unsafe { &mut self.get_unchecked_mut().inner }
> +    }
> +}
> +
> +impl<A: AllocInner<T>, T> Deref for NodeData<A, T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<A: AllocInner<T>, T> Drop for NodeData<A, T> {
> +    fn drop(&mut self) {
> +        if self.valid {
> +            let mut guard = self.mm.lock();
> +
> +            // Inform the user allocator that a node is being dropped.
> +            guard
> +                .1
> +                .drop_object(self.start(), self.size(), self.color(), &mut self.inner);
> +            // SAFETY: The MM lock is still taken, so we can safely remove the node.
> +            unsafe { bindings::drm_mm_remove_node(&mut self.node) };
> +        }
> +    }
> +}
> +
> +/// An instance of a DRM MM range allocator.
> +pub struct Allocator<A: AllocInner<T>, T> {
> +    mm: Arc<Mutex<MmInner<A, T>>>,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<A: AllocInner<T>, T> Allocator<A, T> {
> +    /// Create a new range allocator for the given start and size range of addresses.
> +    ///
> +    /// The user may optionally provide an inner object representing allocator state, which will
> +    /// be protected by the same lock. If not required, `()` can be used.
> +    pub fn new(
> +        start: u64,
> +        size: u64,
> +        inner: A,
> +        name: &'static CStr,
> +        lock_key: &'static LockClassKey,
> +    ) -> Result<Allocator<A, T>> {
> +        // SAFETY: We call `Mutex::init_lock` below.
> +        let mut mm: Pin<UniqueArc<Mutex<MmInner<A, T>>>> = UniqueArc::try_new(unsafe {
> +            Mutex::new(MmInner(Opaque::uninit(), inner, PhantomData))
> +        })?
> +        .into();
> +
> +        mm.as_mut().init_lock(name, lock_key);
> +
> +        unsafe {
> +            // SAFETY: The Opaque instance provides a valid pointer, and it is initialized after
> +            // this call.
> +            bindings::drm_mm_init(mm.lock().0.get(), start, size);
> +        }
> +
> +        Ok(Allocator {
> +            mm: mm.into(),
> +            _p: PhantomData,
> +        })
> +    }
> +
> +    /// Insert a new node into the allocator of a given size.
> +    ///
> +    /// `node` is the user `T` type data to store into the node.
> +    pub fn insert_node(&mut self, node: T, size: u64) -> Result<Node<A, T>> {
> +        self.insert_node_generic(node, size, 0, 0, InsertMode::Best)
> +    }
> +
> +    /// Insert a new node into the allocator of a given size, with configurable alignment,
> +    /// color, and insertion mode.
> +    ///
> +    /// `node` is the user `T` type data to store into the node.
> +    pub fn insert_node_generic(
> +        &mut self,
> +        node: T,
> +        size: u64,
> +        alignment: u64,
> +        color: usize,
> +        mode: InsertMode,
> +    ) -> Result<Node<A, T>> {
> +        self.insert_node_in_range(node, size, alignment, color, 0, u64::MAX, mode)
> +    }
> +
> +    /// Insert a new node into the allocator of a given size, with configurable alignment,
> +    /// color, insertion mode, and sub-range to allocate from.
> +    ///
> +    /// `node` is the user `T` type data to store into the node.
> +    #[allow(clippy::too_many_arguments)]
> +    pub fn insert_node_in_range(
> +        &mut self,
> +        node: T,
> +        size: u64,
> +        alignment: u64,
> +        color: usize,
> +        start: u64,
> +        end: u64,
> +        mode: InsertMode,
> +    ) -> Result<Node<A, T>> {
> +        let mut mm_node = Box::try_new(NodeData {
> +            // SAFETY: This C struct should be zero-initialized.
> +            node: unsafe { core::mem::zeroed() },
> +            valid: false,
> +            inner: node,
> +            mm: self.mm.clone(),
> +            _pin: PhantomPinned,
> +        })?;
> +
> +        let guard = self.mm.lock();
> +        // SAFETY: We hold the lock and all pointers are valid.
> +        to_result(unsafe {
> +            bindings::drm_mm_insert_node_in_range(
> +                guard.0.get(),
> +                &mut mm_node.node,
> +                size,
> +                alignment,
> +                color as core::ffi::c_ulong,
> +                start,
> +                end,
> +                mode as u32,
> +            )
> +        })?;
> +
> +        mm_node.valid = true;
> +
> +        Ok(Pin::from(mm_node))
> +    }
> +
> +    /// Insert a node into the allocator at a fixed start address.
> +    ///
> +    /// `node` is the user `T` type data to store into the node.
> +    pub fn reserve_node(
> +        &mut self,
> +        node: T,
> +        start: u64,
> +        size: u64,
> +        color: usize,
> +    ) -> Result<Node<A, T>> {
> +        let mut mm_node = Box::try_new(NodeData {
> +            // SAFETY: This C struct should be zero-initialized.
> +            node: unsafe { core::mem::zeroed() },
> +            valid: false,
> +            inner: node,
> +            mm: self.mm.clone(),
> +            _pin: PhantomPinned,
> +        })?;
> +
> +        mm_node.node.start = start;
> +        mm_node.node.size = size;
> +        mm_node.node.color = color as core::ffi::c_ulong;
> +
> +        let guard = self.mm.lock();
> +        // SAFETY: We hold the lock and all pointers are valid.
> +        to_result(unsafe { bindings::drm_mm_reserve_node(guard.0.get(), &mut mm_node.node) })?;
> +
> +        mm_node.valid = true;
> +
> +        Ok(Pin::from(mm_node))
> +    }
> +
> +    /// Operate on the inner user type `A`, taking the allocator lock
> +    pub fn with_inner<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
> +        let mut guard = self.mm.lock();
> +        cb(&mut guard.1)
> +    }
> +}
> +
> +impl<A: AllocInner<T>, T> Drop for MmInner<A, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: If the MmInner is dropped then all nodes are gone (since they hold references),
> +        // so it is safe to tear down the allocator.
> +        unsafe {
> +            bindings::drm_mm_takedown(self.0.get());
> +        }
> +    }
> +}
> +
> +// MmInner is safely Send if the AllocInner user type is Send.
> +unsafe impl<A: Send + AllocInner<T>, T> Send for MmInner<A, T> {}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index c44760a1332f..73fab2dee3af 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -7,3 +7,4 @@ pub mod drv;
>  pub mod file;
>  pub mod gem;
>  pub mod ioctl;
> +pub mod mm;
> 
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
