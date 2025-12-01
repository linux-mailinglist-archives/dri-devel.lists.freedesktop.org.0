Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DE6C985D1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFDC10E115;
	Mon,  1 Dec 2025 16:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="epV3uwMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CADC10E42B;
 Mon,  1 Dec 2025 16:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764607905; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=O2FLxExRltdZ308GFqeNE9is4NtIlPDhrWXRIuoqb4lKvTeNC4sdoQn//4R2UD67oSlDFqxwM4an5sKiz5rpCEOCZollckly6wEEqhSg1kYtlX4GbLKVcn6xXtuVW03Z64KE0aQR+U/qfoYxi6sID1yZaUN0Ozkb9jwtbOejuvU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764607905;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tvJUQZN8AEjscK+m0bZuqDra4rXoJ/xrQ5lwzRW/qII=; 
 b=cFe4I+YbOiUo7kty6meKQ2HG5SmyVrijvqfYWgrs1R5dXv3jfp5qJa66M3mcpXet+rGPzqL5nxiv8qGKSPOkuLJ/faGlOb6RNXDIgRBBVQPu3yIjEz2XT6v7oIUkp2GdNblVQHOG8pHhOQjBkq/DWb7xgIEVn2+4tTZAA7IeYwU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764607905; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=tvJUQZN8AEjscK+m0bZuqDra4rXoJ/xrQ5lwzRW/qII=;
 b=epV3uwMBKpD0St6TBSLqTN+Fc4l0mM463CbMFQE302esiv24R/UuyHD3fhniT/60
 uvOLQ0cT/z1EQYepd8Tjc9eOrb738u4kmqKS9Uv9wM31LwENDaJnaoatjWdJ39Jk9Kp
 rJ9HP5SBQ9Bx8l1bw56N7PhGj8M3VmVX7wOPObhc=
Received: by mx.zohomail.com with SMTPS id 176460790270219.939236032084295;
 Mon, 1 Dec 2025 08:51:42 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251129213056.4021375-1-joelagnelf@nvidia.com>
Date: Mon, 1 Dec 2025 13:51:24 -0300
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
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



> On 29 Nov 2025, at 18:30, Joel Fernandes <joelagnelf@nvidia.com> =
wrote:
>=20
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list_head nodes and high-level
> iteration over typed list items.
>=20
> Provide a `clist_create` macro to assist in creation of the `Clist` =
type.
>=20
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> Thanks to Alex, Daniel, Danilo, John, and Miguel for reviewing v1/v2!
>=20
> Changes since v2:
>  - Squashed the 3 patches into a single patch due to dependencies and =
reducing helpers.
>  - Changed Clist to Clist<'a, T> using const generic offset (Alex).
>  - Simplified C helpers to only list_add_tail (Alex, John).
>  - Added init_list_head() for INIT_LIST_HEAD functionality and dropped =
it from C helpers (Alex).
>  - Added FusedIterator impl for both ClistHeadIter and ClistIter.
>  - Added PartialEq/Eq for ClistHead (Alex)
>  - Rust style improvements, comment improvements (Daniel).
>  - Added MAINTAINERS entry (Miguel).
>=20
> Link to v2: =
https://lore.kernel.org/all/20251111171315.2196103-2-joelagnelf@nvidia.com=
/
> Link to v1 (RFC): =
https://lore.kernel.org/all/20251030190613.1224287-2-joelagnelf@nvidia.com=
/
>=20
> MAINTAINERS            |   7 +
> rust/helpers/helpers.c |   1 +
> rust/helpers/list.c    |  12 ++
> rust/kernel/clist.rs   | 349 +++++++++++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs     |   1 +
> 5 files changed, 370 insertions(+)
> create mode 100644 rust/helpers/list.c
> create mode 100644 rust/kernel/clist.rs
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f7aa6a8a9a1..fb2ff877b6d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22666,6 +22666,13 @@ F: rust/kernel/init.rs
> F: rust/pin-init/
> K: \bpin-init\b|pin_init\b|PinInit
>=20
> +RUST TO C LIST INTERFACES
> +M: Joel Fernandes <joelagnelf@nvidia.com>
> +M: Alexandre Courbot <acourbot@nvidia.com>
> +L: rust-for-linux@vger.kernel.org
> +S: Maintained
> +F: rust/kernel/clist.rs
> +
> RXRPC SOCKETS (AF_RXRPC)
> M: David Howells <dhowells@redhat.com>
> M: Marc Dionne <marc.dionne@auristor.com>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c..634fa2386bbb 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -32,6 +32,7 @@
> #include "io.c"
> #include "jump_label.c"
> #include "kunit.c"
> +#include "list.c"
> #include "maple_tree.c"
> #include "mm.c"
> #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..6044979c7a2e
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C Circular doubly linked list implementation.
> + */
> +
> +#include <linux/list.h>
> +
> +void rust_helper_list_add_tail(struct list_head *new, struct =
list_head *head)
> +{
> + list_add_tail(new, head);
> +}
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..361a6132299b
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,349 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust =
code.
> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist::init_list_head,
> +//!     clist_create,
> +//!     types::Opaque, //
> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by =
C code but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be =
allocated by C code).
> +//! # #[repr(C)]
> +//! # pub(crate) struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head =3D MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # // SAFETY: head and all the items are test objects allocated in =
this scope.
> +//! # unsafe { init_list_head(head.as_mut_ptr()) };
> +//! # // SAFETY: head is a test object allocated in this scope.
> +//! # let mut head =3D unsafe { head.assume_init() };
> +//! # let mut items =3D [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr =3D item.as_mut_ptr();
> +//! #     // SAFETY: pointers are to allocated test objects with a =
list_head field.
> +//! #     unsafe {
> +//! #         (*ptr).value =3D i as i32 * 10;
> +//! #         // addr_of_mut!() computes address of link directly as =
link is uninitialized.
> +//! #         init_list_head(core::ptr::addr_of_mut!((*ptr).link));
> +//! #         bindings::list_add_tail(&mut (*ptr).link, &mut head);
> +//! #     }
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
> +//! pub(crate) struct Item(Opaque<SampleItemC>);
> +//!
> +//! impl Item {
> +//!     pub(crate) fn value(&self) -> i32 {
> +//!         // SAFETY: `Item` has same layout as `SampleItemC`.
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create typed Clist from sentinel head.
> +//! // SAFETY: head is valid, items are `SampleItemC` with embedded =
`link` field.
> +//! let list =3D unsafe { clist_create!(&mut head, Item, SampleItemC, =
link) };
> +//!
> +//! // Iterate directly over typed items.
> +//! let mut found_0 =3D false;
> +//! let mut found_10 =3D false;
> +//! let mut found_20 =3D false;
> +//!
> +//! for item in list.iter() {
> +//!     let val =3D item.value();
> +//!     if val =3D=3D 0 { found_0 =3D true; }
> +//!     if val =3D=3D 10 { found_10 =3D true; }
> +//!     if val =3D=3D 20 { found_20 =3D true; }
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
> +/// Initialize a `list_head` object to point to itself.
> +///
> +/// # Safety
> +///
> +/// `list` must be a valid pointer to a `list_head` object.
> +#[inline]
> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
> +    // SAFETY: Caller guarantees `list` is a valid pointer to a =
`list_head`.
> +    unsafe {
> +        (*list).next =3D list;
> +        (*list).prev =3D list;
> +    }
> +}
> +
> +/// Wraps a `list_head` object for use in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - `ClistHead` represents an allocated and valid `list_head` =
structure.
> +///
> +/// # Safety
> +///
> +/// - All `list_head` nodes must not be modified by C code for the =
lifetime of `ClistHead`.
> +#[repr(transparent)]
> +pub struct ClistHead(Opaque<bindings::list_head>);

I still think we should call this CList. IMHO, it does not make sense to =
have a
Clist, and a ClistHead (notice the capitalization). CList and CListHead =
are
easier to read and reason about.

Did anyone push back on this?


> +
> +impl ClistHead {
> +    /// Create a `&ClistHead` reference from a raw `list_head` =
pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and =
initialized `list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime =
`'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a =
Self {
> +        // SAFETY:
> +        // - `ClistHead` has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next `ClistHead` in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {

> +        let raw =3D self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Get the previous `ClistHead` in the list.
> +    #[inline]
> +    pub fn prev(&self) -> &Self {

> +        let raw =3D self.as_raw();
> +        // SAFETY:
> +        // - self.as_raw() is valid per type invariants.
> +        // - The `prev` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).prev) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_linked(&self) -> bool {
> +        let raw =3D self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next !=3D raw && (*raw).prev !=3D raw }
> +    }
> +}
> +
> +// SAFETY: `ClistHead` can be sent to any thread.
> +unsafe impl Send for ClistHead {}
> +
> +// SAFETY: `ClistHead` can be shared among threads as it is not =
modified by C per type invariants.
> +unsafe impl Sync for ClistHead {}
> +
> +impl PartialEq for ClistHead {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.as_raw() =3D=3D other.as_raw()
> +    }
> +}
> +
> +impl Eq for ClistHead {}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list =
(`list_head`). Caller has to
> +/// perform conversion of returned `ClistHead` to an item (using =
`container_of` macro or similar).
> +///
> +/// # Invariants
> +///
> +/// `ClistHeadIter` is iterating over an allocated, initialized and =
valid list.
> +struct ClistHeadIter<'a> {
> +    current_head: &'a ClistHead,
> +    list_head: &'a ClistHead,
> +    exhausted: bool,
> +}
> +
> +impl<'a> Iterator for ClistHeadIter<'a> {
> +    type Item =3D &'a ClistHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.exhausted {
> +            return None;
> +        }
> +
> +        // Advance to next node.
> +        self.current_head =3D self.current_head.next();

> +
> +        // Check if we've circled back to the sentinel head.
> +        if self.current_head =3D=3D self.list_head {
> +            self.exhausted =3D true;
> +            return None;
> +        }
> +
> +        Some(self.current_head)
> +    }
> +}
> +
> +impl<'a> FusedIterator for ClistHeadIter<'a> {}
> +
> +/// A typed C linked list with a sentinel head.
> +///
> +/// A sentinel head represents the entire linked list and can be used =
for
> +/// iteration over items of type `T`, it is not associated with a =
specific item.
> +///
> +/// # Invariants
> +///
> +/// - `head` is an allocated and valid C `list_head` structure that =
is the list's sentinel.
> +/// - `offset` is the byte offset of the `list_head` field within the =
C struct that `T` wraps.
> +///
> +/// # Safety
> +///
> +/// - All the list's `list_head` nodes must be allocated and have =
valid next/prev pointers.
> +/// - The underlying `list_head` (and entire list) must not be =
modified by C for the
> +///   lifetime 'a of `Clist`.
> +pub struct Clist<'a, T> {
> +    head: &'a ClistHead,
> +    offset: usize,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T> Clist<'a, T> {
> +    /// Create a typed `Clist` from a raw sentinel `list_head` =
pointer.
> +    ///
> +    /// The const generic `OFFSET` specifies the byte offset of the =
`list_head` field within
> +    /// the C struct that `T` wraps.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and =
initialized `list_head` structure
> +    ///   representing a list sentinel.
> +    /// - `ptr` must remain valid and unmodified for the lifetime =
`'a`.
> +    /// - The list must contain items where the `list_head` field is =
at byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw_and_offset<const OFFSET: usize>(ptr: *mut =
bindings::list_head) -> Self {
> +        Self {
> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel =
`list_head` object.
> +            head: unsafe { ClistHead::from_raw(ptr) },
> +            offset: OFFSET,
> +            _phantom: PhantomData,
> +        }
> +    }
> +
> +    /// Get the raw sentinel `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.head.as_raw()
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        let raw =3D self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next =3D=3D raw }
> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub fn iter(&self) -> ClistIter<'a, T> {
> +        ClistIter {
> +            head_iter: ClistHeadIter {
> +                current_head: self.head,
> +                list_head: self.head,
> +                exhausted: false,
> +            },
> +            offset: self.offset,
> +            _phantom: PhantomData,
> +        }
> +    }
> +}
> +
> +/// High-level iterator over typed list items.
> +pub struct ClistIter<'a, T> {
> +    head_iter: ClistHeadIter<'a>,
> +    offset: usize,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T> Iterator for ClistIter<'a, T> {
> +    type Item =3D &'a T;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let head =3D self.head_iter.next()?;
> +
> +        // Convert to item using offset.
> +        // SAFETY:
> +        // - `item_ptr` calculation from `offset` (calculated using =
offset_of!)
> +        //    is valid per invariants.
> +        Some(unsafe { =
&*head.as_raw().cast::<u8>().sub(self.offset).cast::<T>() })
> +    }
> +}
> +
> +impl<'a, T> FusedIterator for ClistIter<'a, T> {}
> +
> +/// Create a C doubly-circular linked list interface `Clist` from a =
raw `list_head` pointer.
> +///
> +/// This macro creates a `Clist<T>` that can iterate over items of =
type `$rust_type` linked
> +/// via the `$field` field in the underlying C struct `$c_type`.
> +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut =
bindings::list_head`).
> +/// - `$rust_type`: Each item's rust wrapper type.
> +/// - `$c_type`: Each item's C struct type that contains the embedded =
`list_head`.
> +/// - `$field`: The name of the `list_head` field within the C =
struct.
> +///
> +/// # Safety
> +///
> +/// The caller must ensure:
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing =
to a list that remains
> +///   unmodified for the lifetime of the rust `Clist`.
> +/// - The list contains items of type `$c_type` linked via an =
embedded `$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has =
compatible layout.
> +/// - The macro is called from an unsafe block.
> +///
> +/// # Examples
> +///
> +/// Refer to the examples in the [crate::clist] module documentation.

Missing backticks?

> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) =3D> {

I think this needs a SAFETY comment, or otherwise the linter will =
complain.

> +        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
> +            { ::core::mem::offset_of!($c_type, $field) },
> +        >($head)
> +    };
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index c2eea9a2a345..b69cc5ed3b59 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -72,6 +72,7 @@
> pub mod bug;
> #[doc(hidden)]
> pub mod build_assert;
> +pub mod clist;
> pub mod clk;
> #[cfg(CONFIG_CONFIGFS_FS)]
> pub mod configfs;
> --=20
> 2.34.1
>=20


