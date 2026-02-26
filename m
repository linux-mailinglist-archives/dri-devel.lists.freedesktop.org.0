Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDckOi91oGmtjwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:30:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7EE1AA675
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8195910E9C4;
	Thu, 26 Feb 2026 16:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="XNfvb3gN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Thu, 26 Feb 2026 16:30:35 UTC
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA3710E9C5;
 Thu, 26 Feb 2026 16:30:35 +0000 (UTC)
Message-ID: <dbbb1a93-93fc-4ea6-bd6f-6f7fbfcc4710@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1772123046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mot2vauLG07vA2kiO70W8m+1wIvRmpWaKTQPNgejD+E=;
 b=XNfvb3gNCQYVnDPdOX4cgYnYDectI0KeFSjLMjAl64DNssi19dgYuSfMaP8KG4MPGM70wI
 /Cx/++mtEKJjl6Y2E3LIwM9cmNehjx7aaUd4aRIKFIWg07iwAv94BE11CxqyfubAdNrr99
 8/PNQg9ZeCjOyYa8jk8uPVP302WIxBA=
Date: Fri, 27 Feb 2026 00:23:34 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, Nikola Djukic
 <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260224222734.3153931-3-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[alvin.sun@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,linux.dev:mid,linux.dev:dkim,collabora.com:email,garyguo.net:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: DD7EE1AA675
X-Rspamd-Action: no action


On 2/25/26 06:27, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>   MAINTAINERS              |   8 +
>   rust/helpers/helpers.c   |   1 +
>   rust/helpers/list.c      |  17 ++
>   rust/kernel/ffi/clist.rs | 338 +++++++++++++++++++++++++++++++++++++++
>   rust/kernel/ffi/mod.rs   |   2 +
>   rust/kernel/lib.rs       |   1 +
>   6 files changed, 367 insertions(+)
>   create mode 100644 rust/helpers/list.c
>   create mode 100644 rust/kernel/ffi/clist.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc82a6bd1a61..0dc318c94c99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23181,6 +23181,14 @@ T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
>   F:	rust/kernel/alloc.rs
>   F:	rust/kernel/alloc/
>   
> +RUST [FFI HELPER]
> +M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
> +M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +T:	git https://github.com/Rust-for-Linux/linux.git ffi-next
> +F:	rust/kernel/ffi/
> +
>   RUST [NUM]
>   M:	Alexandre Courbot <acourbot@nvidia.com>
>   R:	Yury Norov <yury.norov@gmail.com>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a..724fcb8240ac 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -35,6 +35,7 @@
>   #include "io.c"
>   #include "jump_label.c"
>   #include "kunit.c"
> +#include "list.c"
>   #include "maple_tree.c"
>   #include "mm.c"
>   #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..18095a5593c5
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C circular doubly linked list implementation.
> + */
> +
> +#include <linux/list.h>
> +
> +__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
> +{
> +	INIT_LIST_HEAD(list);
> +}
> +
> +__rust_helper void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
> +{
> +	list_add_tail(new, head);
> +}
> diff --git a/rust/kernel/ffi/clist.rs b/rust/kernel/ffi/clist.rs
> new file mode 100644
> index 000000000000..a645358eee58
> --- /dev/null
> +++ b/rust/kernel/ffi/clist.rs
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! FFI interface for C doubly circular intrusive linked lists.
> +//!
> +//! This module provides Rust abstractions for iterating over C `list_head`-based
> +//! linked lists. It should only be used for cases where C and Rust code share
> +//! direct access to the same linked list through an FFI interface.
> +//!
> +//! Note: This *must not* be used by Rust components that just need a linked list
> +//! primitive. Use [`kernel::list::List`] instead.
> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist_create,
> +//!     types::Opaque,
> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
> +//! # #[repr(C)]
> +//! # pub struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # let head = head.as_mut_ptr();
> +//! # // SAFETY: head and all the items are test objects allocated in this scope.
> +//! # unsafe { bindings::INIT_LIST_HEAD(head) };
> +//! #
> +//! # let mut items = [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr = item.as_mut_ptr();
> +//! #     // SAFETY: `ptr` points to a valid `MaybeUninit<SampleItemC>`.
> +//! #     unsafe { (*ptr).value = i as i32 * 10 };
> +//! #     // SAFETY: `&raw mut` creates a pointer valid for `INIT_LIST_HEAD`.
> +//! #     unsafe { bindings::INIT_LIST_HEAD(&raw mut (*ptr).link) };
> +//! #     // SAFETY: `link` was just initialized and `head` is a valid list head.
> +//! #     unsafe { bindings::list_add_tail(&mut (*ptr).link, head) };
> +//! # }
> +//!
> +//! // Rust wrapper for the C struct.
> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //
> +//! #[repr(transparent)]
> +//! pub struct Item(Opaque<SampleItemC>);
> +//!
> +//! impl Item {
> +//!     pub fn value(&self) -> i32 {
> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: head is valid and initialized, items are `SampleItemC` with
> +//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over `SampleItemC`.
> +//! let list = clist_create!(unsafe { head, Item, SampleItemC, link });
> +//!
> +//! // Iterate directly over typed items.
> +//! let mut found_0 = false;
> +//! let mut found_10 = false;
> +//! let mut found_20 = false;
> +//!
> +//! for item in list.iter() {
> +//!     let val = item.value();
> +//!     if val == 0 { found_0 = true; }
> +//!     if val == 10 { found_10 = true; }
> +//!     if val == 20 { found_20 = true; }
> +//! }
> +//!
> +//! assert!(found_0 && found_10 && found_20);
> +//! ```
> +
> +use core::{
> +    iter::FusedIterator,
> +    marker::PhantomData, //
> +};
> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    PinInit, //
> +};
> +
> +/// FFI wrapper for a C `list_head` object used in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - The underlying `list_head` has been initialized (e.g. via `INIT_LIST_HEAD()`) and its
> +///   `next`/`prev` pointers are valid and non-NULL.
> +#[pin_data]
> +#[repr(transparent)]
> +pub struct CListHead {
> +    #[pin]
> +    inner: Opaque<bindings::list_head>,
> +}
> +
> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an initialized `list_head` (e.g. via
> +    ///   `INIT_LIST_HEAD()`), with valid non-NULL `next`/`prev` pointers.
> +    /// - `ptr` must remain valid for the lifetime `'a`.
> +    /// - The list and all linked `list_head` nodes must not be modified from
> +    ///   anywhere for the lifetime `'a`, unless done so via any [`CListHead`] APIs.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
> +        // SAFETY:
> +        // - [`CListHead`] has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a per caller guarantees.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.inner.get()
> +    }
> +
> +    /// Get the next [`CListHead`] in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        let raw = self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid and initialized per type invariants.
> +        // - The `next` pointer is valid and non-NULL per type invariants
> +        //   (initialized via `INIT_LIST_HEAD()` or equivalent).
> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_linked(&self) -> bool {
> +        let raw = self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next != raw && (*raw).prev != raw }
> +    }
> +
> +    /// Pin-initializer that initializes the list head.
> +    pub fn new() -> impl PinInit<Self> {
> +        pin_init!(Self {
> +            // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid empty list.
> +            inner <- Opaque::ffi_init(|slot| unsafe { bindings::INIT_LIST_HEAD(slot) }),
> +        })
> +    }
> +}
> +
> +// SAFETY: `list_head` contains no thread-bound state; it only holds
> +// `next`/`prev` pointers.
> +unsafe impl Send for CListHead {}
> +
> +// SAFETY: `CListHead` can be shared among threads as modifications are
> +// not allowed at the moment.
> +unsafe impl Sync for CListHead {}
> +
> +impl PartialEq for CListHead {
> +    #[inline]
> +    fn eq(&self, other: &Self) -> bool {
> +        core::ptr::eq(self, other)
> +    }
> +}
> +
> +impl Eq for CListHead {}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
> +/// perform conversion of returned [`CListHead`] to an item (using `container_of` macro or similar).
> +///
> +/// # Invariants
> +///
> +/// [`CListHeadIter`] is iterating over an initialized and valid list.
> +struct CListHeadIter<'a> {
Hi,
Joel

Thanks for the clist abstraction. The Tyr debugfs [1] I'm implementing
needs to iterate over a GpuVm's VA list, and I'd like to switch that to
a CList-based implementation.

Could you make CListHeadIter public and expose a public constructor?
Or do you have a better suggestion?

The VA list mixes two node types in one list — GpuVa (with driver-specific
data) and KernelGpuVa — so we have to filter/skip nodes and can't use
CList as-is. With a public CListHeadIter and new(), we can implement a
custom iterator (like our current GpuVaIter) on top of CListHeadIter and 
then
migrate that code to clist instead of hand-rolled list traversal.

[1] 
https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/59/diffs?commit_id=0853a7b69a42b32832c8e57da63272a8585cb76b#23581e10c8b583e85ebde61a1675ac3a70e37c14_84_148

Thanks,
Alvin Sun


> +    /// Current position in the list.
> +    current: &'a CListHead,
> +    /// The sentinel head (used to detect end of iteration).
> +    sentinel: &'a CListHead,
> +}
> +
> +impl<'a> Iterator for CListHeadIter<'a> {
> +    type Item = &'a CListHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Check if we've reached the sentinel (end of list).
> +        if self.current == self.sentinel {
> +            return None;
> +        }
> +
> +        let item = self.current;
> +        self.current = item.next();
> +        Some(item)
> +    }
> +}
> +
> +impl<'a> FusedIterator for CListHeadIter<'a> {}
> +
> +/// A typed C linked list with a sentinel head intended for FFI use-cases where
> +/// C subsystem manages a linked list that Rust code needs to read. Generally
> +/// required only for special cases.
> +///
> +/// A sentinel head [`CListHead`] represents the entire linked list and can be used
> +/// for iteration over items of type `T`, it is not associated with a specific item.
> +///
> +/// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
> +/// the struct that `T` wraps.
> +///
> +/// # Invariants
> +///
> +/// - The sentinel [`CListHead`] has been initialized (e.g. via `INIT_LIST_HEAD()`) with valid
> +///   non-NULL `next`/`prev` pointers.
> +/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
> +/// - All the list's `list_head` nodes have been initialized with valid non-NULL `next`/`prev`
> +///   pointers.
> +#[repr(transparent)]
> +pub struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
> +
> +impl<T, const OFFSET: usize> CList<T, OFFSET> {
> +    /// Create a typed [`CList`] reference from a raw sentinel `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an initialized sentinel `list_head` (e.g. via
> +    ///   `INIT_LIST_HEAD()`), with valid non-NULL `next`/`prev` pointers.
> +    /// - `ptr` must remain valid for the lifetime `'a`.
> +    /// - The list and all linked nodes must not be concurrently modified for the lifetime `'a`.
> +    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
> +        // SAFETY:
> +        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
> +        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        !self.0.is_linked()
> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub fn iter(&self) -> CListIter<'_, T, OFFSET> {
> +        let head = &self.0;
> +        CListIter {
> +            head_iter: CListHeadIter {
> +                current: head.next(),
> +                sentinel: head,
> +            },
> +            _phantom: PhantomData,
> +        }
> +    }
> +}
> +
> +/// High-level iterator over typed list items.
> +pub struct CListIter<'a, T, const OFFSET: usize> {
> +    head_iter: CListHeadIter<'a>,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
> +    type Item = &'a T;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let head = self.head_iter.next()?;
> +
> +        // Convert to item using OFFSET.
> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated using offset_of!)
> +        // is valid per invariants.
> +        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
> +    }
> +}
> +
> +impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OFFSET> {}
> +
> +/// Create a C doubly-circular linked list interface `CList` from a raw `list_head` pointer.
> +///
> +/// This macro creates a `CList<T, OFFSET>` that can iterate over items of type `$rust_type`
> +/// linked via the `$field` field in the underlying C struct `$c_type`.
> +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
> +/// - `$rust_type`: Each item's rust wrapper type.
> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
> +/// - `$field`: The name of the `list_head` field within the C struct.
> +///
> +/// # Safety
> +///
> +/// The caller must ensure:
> +///
> +/// - `$head` is a valid, initialized sentinel `list_head` (e.g. via `INIT_LIST_HEAD()`)
> +///   pointing to a list that is not concurrently modified for the lifetime of the `CList`.
> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
> +///
> +/// # Examples
> +///
> +/// Refer to the examples in this module's documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    (unsafe { $head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+ }) => {{
> +        // Compile-time check that field path is a list_head.
> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
> +            |p| unsafe { &raw const (*p).$($field).+ };
> +
> +        // Calculate offset and create `CList`.
> +        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
> +        // SAFETY: The caller of this macro is responsible for ensuring safety.
> +        unsafe { $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head) }
> +    }};
> +}
> diff --git a/rust/kernel/ffi/mod.rs b/rust/kernel/ffi/mod.rs
> index 7d844e9cb339..8c235ca0d1e3 100644
> --- a/rust/kernel/ffi/mod.rs
> +++ b/rust/kernel/ffi/mod.rs
> @@ -5,3 +5,5 @@
>   // Re-export C type definitions from the `ffi` crate so that existing
>   // `kernel::ffi::c_int` etc. paths continue to work.
>   pub use ::ffi::*;
> +
> +pub mod clist;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 0a77b4c0ffeb..58dbb02c5197 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -28,6 +28,7 @@
>   #![feature(lint_reasons)]
>   //
>   // Stable since Rust 1.82.0.
> +#![feature(offset_of_nested)]
>   #![feature(raw_ref_op)]
>   //
>   // Stable since Rust 1.83.0.
