Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6A6D9CC7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4664910E10B;
	Thu,  6 Apr 2023 15:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DB110E105
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:53:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id D921642529;
 Thu,  6 Apr 2023 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680796436;
 bh=u/0wcm36nXuVm02z3BKP1S61gAbmdYMqyw/tOYXHGbg=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=VGPkywpELPrOy5WERRqLKqfXnUFWiyXfd71Z81jN0DPy6tH/JsyHIpymO1c6+ZhN/
 wj8XGnA9i2tWyHN4ayd5wTh/CXmSDk5aV7gZhmRplM7utDTkCSqyNgBKtTHjx9sM61
 2fgTxpiCrbOZkGYSaVxAEkR5tnShBmV8aGJAfxMOvDehTuw/aZxuFvwadAlkOLdFuO
 CYXoafc6kkIgWFDJYkK6y9siZPGDTvGI8ETsKJ1WRWpUxVjMV5BIU9eYc0+cpBB7f/
 yeKt0vRxQLpC9keXqLG3eeHamhEymrjHecYNq8oYnkT8qLYgMyl1NFaEQcZwwi9kDC
 xH8CLjK1n9dWA==
Message-ID: <2a419eff-3566-0aa3-7185-951edde22abb@asahilina.net>
Date: Fri, 7 Apr 2023 00:53:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 07/18] rust: drm: mm: Add DRM MM Range Allocator
 abstraction
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Mary <mary@mary.zone>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org,
 asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-7-917ff5bc80a8@asahilina.net>
 <ZC7T92F7K9XTZPZ1@phenom.ffwll.local>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <ZC7T92F7K9XTZPZ1@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 06/04/2023 23.15, Daniel Vetter wrote:
> On Tue, Mar 07, 2023 at 11:25:32PM +0900, Asahi Lina wrote:
>> drm_mm provides a simple range allocator, useful for managing virtual
>> address ranges. Add a Rust abstraction to expose this module to Rust
>> drivers.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
> 
> In the cover letter you mentioned the design open about embedded the lock
> into the rust wrappers.
> 
> I think for a first step that's perfectly fine.
> 
> Longer term we might want to ramp up some "proof of locking"
> infrastructure in Rust, where callers can supply a lock guard and ideally
> rust validates at compile time that it's for the right type, and at
> runtime (like lockdep) that it's consistent and the callers don't mix up
> locks (like using different locks for the same drm_mm allocator).

That proof-of-lock tuff works in Rust too as far as I know.

But the general thread safety story in Rust is much simpler, you just 
use methods that take &mut self when locking is the caller's 
responsibility. That effectively implies that there can only be one 
reference that can call those methods at any given time, thanks to the 
borrow checker. Shared references only give you &self, a locked Mutex 
upgrades that to &mut self, and that's how you get proof of locking at 
compile time, through and through, not just for the type but for the 
specific object.

> There's a lot of libraries in the kernel that have this "caller ensures
> locking" pattern. drm/sched also has these requirements.

Yup, that all usually maps nicely to &mut self in Rust... except for the 
issue below.

> There's two other things I'd like to bring up on this patch though, just
> because it's a good example. But they're both really general points that
> apply for all the rust wrappers.
> 
> Documentation:
> 
> In drm we try to document all the interfaces that drivers use with formal
> docs. Yes there's some areas that are not great for historical reasons,
> but for new stuff and new wrappers we're really trying:
> 
> - This helps in telling internal (even across .c files or in rust across
>    modules within a crate) from stuff drivers access. Sure you have static
>    in C or pub in rust, but that doesn't tell you whether it's public all
>    the way to drivers.
> 
> - ideally docs have a short intro section that explains the main concepts
>    and links to the main data structures and functions. Just to give
>    readers a good starting point to explore.
> 
> - Linking all the things, so that readers can connect the different parts.
>    This is really important in C where e.g. get/put() or any such function
>    pairs all needed to be linked together. With rust I'm hoping that
>    rustdoc liberally sprinkles links already and we don't have to do this
>    as much.
> 
> - Short explainers for parameters. For rust this also means type
>    parameters, for those even simplified examples of how drivers are
>    supposed to use them would help a lot in reading docs & understanding
>    concepts.
> 
> - Ideally links from the rust to the sphinx side to linke relevant
>    chapters together. Often the bigger explanations are in .rst files with
>    DOT graphs (kms has a bunch I've added) or similar, and it doesn't make
>    that much sense to duplicate all that on the rust side I guess. But it
>    needs to be discoverable.
> 
> This might be more a discussion topic for the rust people than you
> directly. Still needed for the merge-ready patches eventually.

I don't know much about the doc gen stuff on the Rust side so yeah, this 
is something I need to look into to make it pretty and complete...

> Refcounting vs borrowing:
> 
> This is honestly much more the eyebrow raising one than the locking. Very
> often on the C side these datastructures all work with borrow semantics,
> and you need to explicitly upgrade to a full reference (kref_get or
> kref_get_unless_zero, depending whether it's a strong or weak reference)
> if you need the object outside of the mutex/lock guard section.
> 
> Again I think for now it's ok, but the sales pitch of rust is that it
> enables borrow lifetime checking with no runtime cost. Plus viz the vm
> cleanup example, if you have too many strong backreferences the cleanup
> flow gets complicated. And it would suck if rust drivers have to add
> complexity like the openrefcount for the vm example simply because we
> can't model the borrow semantics well enough to be safe.
> 
> So not something that's really bad here, but if we need to resort to full
> refcounting already for simple datastructures then I'm getting a bit
> worried about how well rust will cope with the really nasty borrowed
> reference tricks we're playing in other areas.
> 
> Again more a topic for the rust folks I think than specifically here about
> drm_mm wrapping. Just to get things going I think this is fine.

Yeeeeah... this is a *specific* problem. Drop.

The Allocator<T> itself is perfectly safe to implement without any 
locking, refcounting, or anything. You just make the methods take &mut 
self (as they already do), the caller can use it with a single reference 
or wrap it in an Arc<Mutex<T>> and share it, or whatever.

The problem is the Node<A, T>. When you Drop that, it has to go back to 
the Allocator. But now you're a different object, so no thread safety 
guarantees. And you need to keep the Allocator alive. So now to make a 
safe abstraction, you need refcounting and a mutex.

Lifetimes just don't work here, sadly. Not for a useful abstraction.

I'd love to hear from the other Rust folks whether they have any better 
ideas...

One thing that *can* be done is making the Drop illegal (Rust can't do 
this "natively" but Linux already has hacks for that, we can make it 
fail to link if the Drop is ever called). Then you'd have to actively 
return the Node to the Allocator with a free function. Since Drop is 
forbidden, and Node is pinned, you'd always have to either return Node 
objects to the Allocator or leak them. You could drop the Allocator 
before its nodes, but as far as I know drm_mm can safely handle that 
(though it will complain), and then due to the previous guarantees the 
*only* thing you could do with orphan nodes is leak their memory, which 
is safe.

It would work... but it breaks the whole Rust automagic Drop stuff.

Thinking about this a bit, I think I want the current mutex/arc 
semantics for something like a memory allocator (which is one of my 
primary use cases for drm_mm), since I definitely don't want to be 
manually returning objects to their allocator all over the place, nor 
have overarching lifetime requirements that the allocator outlive its 
objects for safety (that sounds like a can of worms I don't want to 
open, I'd much rather use a refcount even if I "think" I can prove the 
lifetime bounds ad-hoc). But for something like a drm_mm that is 
tracking VA ranges within a VM with all Nodes held internally, maybe I 
could manage it all internally and have all node destruction be handled 
via an explicit call into the Allocator.

Maybe the mm abstraction should offer both options? The extra locking 
can be implemented in terms of the base unlocked version I think 
(perhaps with some Deref abuse for ergonomics)... I definitely want to 
hear more opinions about this from other Rust folks, since there are 
probably other options I haven't considered...

Aside: This, and all the other DRM abstractions, were written before the 
pin_init stuff from y86 that is in review right now was ready. That may 
open up more interesting/ergonomic/efficient APIs for some cases, 
especially where Pin and embedding C types into user objects in some way 
are involved. So maybe there's room for improvement here. Just a sidenote.

> 
> Cheers, Daniel
> 
> 
>> ---
>>   rust/kernel/drm/mm.rs  | 309 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   rust/kernel/drm/mod.rs |   1 +
>>   2 files changed, 310 insertions(+)
>>
>> diff --git a/rust/kernel/drm/mm.rs b/rust/kernel/drm/mm.rs
>> new file mode 100644
>> index 000000000000..83e27a7dcc7e
>> --- /dev/null
>> +++ b/rust/kernel/drm/mm.rs
>> @@ -0,0 +1,309 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +
>> +//! DRM MM range allocator
>> +//!
>> +//! C header: [`include/linux/drm/drm_mm.h`](../../../../include/linux/drm/drm_mm.h)
>> +
>> +use crate::{
>> +    bindings,
>> +    error::{to_result, Result},
>> +    str::CStr,
>> +    sync::{Arc, LockClassKey, LockIniter, Mutex, UniqueArc},
>> +    types::Opaque,
>> +};
>> +
>> +use alloc::boxed::Box;
>> +
>> +use core::{
>> +    marker::{PhantomData, PhantomPinned},
>> +    ops::Deref,
>> +    pin::Pin,
>> +};
>> +
>> +/// Type alias representing a DRM MM node.
>> +pub type Node<A, T> = Pin<Box<NodeData<A, T>>>;
>> +
>> +/// Trait which must be implemented by the inner allocator state type provided by the user.
>> +pub trait AllocInner<T> {
>> +    /// Notification that a node was dropped from the allocator.
>> +    fn drop_object(&mut self, _start: u64, _size: u64, _color: usize, _object: &mut T) {}
>> +}
>> +
>> +impl<T> AllocInner<T> for () {}
>> +
>> +/// Wrapper type for a `struct drm_mm` plus user AllocInner object.
>> +///
>> +/// # Invariants
>> +/// The `drm_mm` struct is valid and initialized.
>> +struct MmInner<A: AllocInner<T>, T>(Opaque<bindings::drm_mm>, A, PhantomData<T>);
>> +
>> +/// Represents a single allocated node in the MM allocator
>> +pub struct NodeData<A: AllocInner<T>, T> {
>> +    node: bindings::drm_mm_node,
>> +    mm: Arc<Mutex<MmInner<A, T>>>,
>> +    valid: bool,
>> +    /// A drm_mm_node needs to be pinned because nodes reference each other in a linked list.
>> +    _pin: PhantomPinned,
>> +    inner: T,
>> +}
>> +
>> +// SAFETY: Allocator ops take the mutex, and there are no mutable actions on the node.
>> +unsafe impl<A: Send + AllocInner<T>, T: Send> Send for NodeData<A, T> {}
>> +unsafe impl<A: Send + AllocInner<T>, T: Sync> Sync for NodeData<A, T> {}
>> +
>> +/// Available MM node insertion modes
>> +#[repr(u32)]
>> +pub enum InsertMode {
>> +    /// Search for the smallest hole (within the search range) that fits the desired node.
>> +    ///
>> +    /// Allocates the node from the bottom of the found hole.
>> +    Best = bindings::drm_mm_insert_mode_DRM_MM_INSERT_BEST,
>> +
>> +    /// Search for the lowest hole (address closest to 0, within the search range) that fits the
>> +    /// desired node.
>> +    ///
>> +    /// Allocates the node from the bottom of the found hole.
>> +    Low = bindings::drm_mm_insert_mode_DRM_MM_INSERT_LOW,
>> +
>> +    /// Search for the highest hole (address closest to U64_MAX, within the search range) that fits
>> +    /// the desired node.
>> +    ///
>> +    /// Allocates the node from the top of the found hole. The specified alignment for the node is
>> +    /// applied to the base of the node (`Node.start()`).
>> +    High = bindings::drm_mm_insert_mode_DRM_MM_INSERT_HIGH,
>> +
>> +    /// Search for the most recently evicted hole (within the search range) that fits the desired
>> +    /// node. This is appropriate for use immediately after performing an eviction scan and removing
>> +    /// the selected nodes to form a hole.
>> +    ///
>> +    /// Allocates the node from the bottom of the found hole.
>> +    Evict = bindings::drm_mm_insert_mode_DRM_MM_INSERT_EVICT,
>> +}
>> +
>> +/// A clonable, interlocked reference to the allocator state.
>> +///
>> +/// This is useful to perform actions on the user-supplied `AllocInner<T>` type given just a Node,
>> +/// without immediately taking the lock.
>> +#[derive(Clone)]
>> +pub struct InnerRef<A: AllocInner<T>, T>(Arc<Mutex<MmInner<A, T>>>);
>> +
>> +impl<A: AllocInner<T>, T> InnerRef<A, T> {
>> +    /// Operate on the user `AllocInner<T>` implementation, taking the lock.
>> +    pub fn with<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
>> +        let mut l = self.0.lock();
>> +        cb(&mut l.1)
>> +    }
>> +}
>> +
>> +impl<A: AllocInner<T>, T> NodeData<A, T> {
>> +    /// Returns the color of the node (an opaque value)
>> +    pub fn color(&self) -> usize {
>> +        self.node.color as usize
>> +    }
>> +
>> +    /// Returns the start address of the node
>> +    pub fn start(&self) -> u64 {
>> +        self.node.start
>> +    }
>> +
>> +    /// Returns the size of the node in bytes
>> +    pub fn size(&self) -> u64 {
>> +        self.node.size
>> +    }
>> +
>> +    /// Operate on the user `AllocInner<T>` implementation associated with this node's allocator.
>> +    pub fn with_inner<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
>> +        let mut l = self.mm.lock();
>> +        cb(&mut l.1)
>> +    }
>> +
>> +    /// Return a clonable, detached reference to the allocator inner data.
>> +    pub fn alloc_ref(&self) -> InnerRef<A, T> {
>> +        InnerRef(self.mm.clone())
>> +    }
>> +
>> +    /// Return a mutable reference to the inner data.
>> +    pub fn inner_mut(self: Pin<&mut Self>) -> &mut T {
>> +        // SAFETY: This is okay because inner is not structural
>> +        unsafe { &mut self.get_unchecked_mut().inner }
>> +    }
>> +}
>> +
>> +impl<A: AllocInner<T>, T> Deref for NodeData<A, T> {
>> +    type Target = T;
>> +
>> +    fn deref(&self) -> &Self::Target {
>> +        &self.inner
>> +    }
>> +}
>> +
>> +impl<A: AllocInner<T>, T> Drop for NodeData<A, T> {
>> +    fn drop(&mut self) {
>> +        if self.valid {
>> +            let mut guard = self.mm.lock();
>> +
>> +            // Inform the user allocator that a node is being dropped.
>> +            guard
>> +                .1
>> +                .drop_object(self.start(), self.size(), self.color(), &mut self.inner);
>> +            // SAFETY: The MM lock is still taken, so we can safely remove the node.
>> +            unsafe { bindings::drm_mm_remove_node(&mut self.node) };
>> +        }
>> +    }
>> +}
>> +
>> +/// An instance of a DRM MM range allocator.
>> +pub struct Allocator<A: AllocInner<T>, T> {
>> +    mm: Arc<Mutex<MmInner<A, T>>>,
>> +    _p: PhantomData<T>,
>> +}
>> +
>> +impl<A: AllocInner<T>, T> Allocator<A, T> {
>> +    /// Create a new range allocator for the given start and size range of addresses.
>> +    ///
>> +    /// The user may optionally provide an inner object representing allocator state, which will
>> +    /// be protected by the same lock. If not required, `()` can be used.
>> +    pub fn new(
>> +        start: u64,
>> +        size: u64,
>> +        inner: A,
>> +        name: &'static CStr,
>> +        lock_key: &'static LockClassKey,
>> +    ) -> Result<Allocator<A, T>> {
>> +        // SAFETY: We call `Mutex::init_lock` below.
>> +        let mut mm: Pin<UniqueArc<Mutex<MmInner<A, T>>>> = UniqueArc::try_new(unsafe {
>> +            Mutex::new(MmInner(Opaque::uninit(), inner, PhantomData))
>> +        })?
>> +        .into();
>> +
>> +        mm.as_mut().init_lock(name, lock_key);
>> +
>> +        unsafe {
>> +            // SAFETY: The Opaque instance provides a valid pointer, and it is initialized after
>> +            // this call.
>> +            bindings::drm_mm_init(mm.lock().0.get(), start, size);
>> +        }
>> +
>> +        Ok(Allocator {
>> +            mm: mm.into(),
>> +            _p: PhantomData,
>> +        })
>> +    }
>> +
>> +    /// Insert a new node into the allocator of a given size.
>> +    ///
>> +    /// `node` is the user `T` type data to store into the node.
>> +    pub fn insert_node(&mut self, node: T, size: u64) -> Result<Node<A, T>> {
>> +        self.insert_node_generic(node, size, 0, 0, InsertMode::Best)
>> +    }
>> +
>> +    /// Insert a new node into the allocator of a given size, with configurable alignment,
>> +    /// color, and insertion mode.
>> +    ///
>> +    /// `node` is the user `T` type data to store into the node.
>> +    pub fn insert_node_generic(
>> +        &mut self,
>> +        node: T,
>> +        size: u64,
>> +        alignment: u64,
>> +        color: usize,
>> +        mode: InsertMode,
>> +    ) -> Result<Node<A, T>> {
>> +        self.insert_node_in_range(node, size, alignment, color, 0, u64::MAX, mode)
>> +    }
>> +
>> +    /// Insert a new node into the allocator of a given size, with configurable alignment,
>> +    /// color, insertion mode, and sub-range to allocate from.
>> +    ///
>> +    /// `node` is the user `T` type data to store into the node.
>> +    #[allow(clippy::too_many_arguments)]
>> +    pub fn insert_node_in_range(
>> +        &mut self,
>> +        node: T,
>> +        size: u64,
>> +        alignment: u64,
>> +        color: usize,
>> +        start: u64,
>> +        end: u64,
>> +        mode: InsertMode,
>> +    ) -> Result<Node<A, T>> {
>> +        let mut mm_node = Box::try_new(NodeData {
>> +            // SAFETY: This C struct should be zero-initialized.
>> +            node: unsafe { core::mem::zeroed() },
>> +            valid: false,
>> +            inner: node,
>> +            mm: self.mm.clone(),
>> +            _pin: PhantomPinned,
>> +        })?;
>> +
>> +        let guard = self.mm.lock();
>> +        // SAFETY: We hold the lock and all pointers are valid.
>> +        to_result(unsafe {
>> +            bindings::drm_mm_insert_node_in_range(
>> +                guard.0.get(),
>> +                &mut mm_node.node,
>> +                size,
>> +                alignment,
>> +                color as core::ffi::c_ulong,
>> +                start,
>> +                end,
>> +                mode as u32,
>> +            )
>> +        })?;
>> +
>> +        mm_node.valid = true;
>> +
>> +        Ok(Pin::from(mm_node))
>> +    }
>> +
>> +    /// Insert a node into the allocator at a fixed start address.
>> +    ///
>> +    /// `node` is the user `T` type data to store into the node.
>> +    pub fn reserve_node(
>> +        &mut self,
>> +        node: T,
>> +        start: u64,
>> +        size: u64,
>> +        color: usize,
>> +    ) -> Result<Node<A, T>> {
>> +        let mut mm_node = Box::try_new(NodeData {
>> +            // SAFETY: This C struct should be zero-initialized.
>> +            node: unsafe { core::mem::zeroed() },
>> +            valid: false,
>> +            inner: node,
>> +            mm: self.mm.clone(),
>> +            _pin: PhantomPinned,
>> +        })?;
>> +
>> +        mm_node.node.start = start;
>> +        mm_node.node.size = size;
>> +        mm_node.node.color = color as core::ffi::c_ulong;
>> +
>> +        let guard = self.mm.lock();
>> +        // SAFETY: We hold the lock and all pointers are valid.
>> +        to_result(unsafe { bindings::drm_mm_reserve_node(guard.0.get(), &mut mm_node.node) })?;
>> +
>> +        mm_node.valid = true;
>> +
>> +        Ok(Pin::from(mm_node))
>> +    }
>> +
>> +    /// Operate on the inner user type `A`, taking the allocator lock
>> +    pub fn with_inner<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
>> +        let mut guard = self.mm.lock();
>> +        cb(&mut guard.1)
>> +    }
>> +}
>> +
>> +impl<A: AllocInner<T>, T> Drop for MmInner<A, T> {
>> +    fn drop(&mut self) {
>> +        // SAFETY: If the MmInner is dropped then all nodes are gone (since they hold references),
>> +        // so it is safe to tear down the allocator.
>> +        unsafe {
>> +            bindings::drm_mm_takedown(self.0.get());
>> +        }
>> +    }
>> +}
>> +
>> +// MmInner is safely Send if the AllocInner user type is Send.
>> +unsafe impl<A: Send + AllocInner<T>, T> Send for MmInner<A, T> {}
>> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
>> index c44760a1332f..73fab2dee3af 100644
>> --- a/rust/kernel/drm/mod.rs
>> +++ b/rust/kernel/drm/mod.rs
>> @@ -7,3 +7,4 @@ pub mod drv;
>>   pub mod file;
>>   pub mod gem;
>>   pub mod ioctl;
>> +pub mod mm;
>>
>> -- 
>> 2.35.1
>>
> 

~~ Lina

