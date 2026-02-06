Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L5ZJ84phmm1KAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:50:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB7C10170B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3E810E89D;
	Fri,  6 Feb 2026 17:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="P383PlC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EB910E87E;
 Fri,  6 Feb 2026 17:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770400196; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PPFnk9iC0mi3ySuY65jHVOGkas7xITXj5j0TXC0WiZe14RObD31SAlRLtAJbCX5+SDHnu95VLqcr0MnUf8RxLxqb/f/+yqjHrjOmvLgOMZdM5LJKkCO8lK/bO81RpWuMJ2LL3ceHcS2zIULICr+DDhrxcC/knoSsNc9xyln3PbY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770400196;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GfLekabmRXth4qz2KuW77WOFt1A3/2EOeqveH8O/zPI=; 
 b=X52iPeXjW31MEhtP2sjrzPIEiSCveSpPSVGTFVhM542ful56k9ZP2WdUPAU6ghOSlT5PkdYTdFdYHq/rPU+Xo3uHREgiW4cftiGXQjsjgR9dXDtgZVmGnM9oUO2VPcALoR3hiCKOr/DQCWLL3YJekQdeBvQPgFQbzDRLjrm0KI0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770400196; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=GfLekabmRXth4qz2KuW77WOFt1A3/2EOeqveH8O/zPI=;
 b=P383PlC4Gb2f3Xh4s0Y1ksbPZF8sEE6c9DqvdpAAO0SUMqyWaQaUNHQSfW6W7Y4H
 CTxaBhGa2FD0+I/4q5Ie6LPL3ffsrBKdEppBACVCIDrJAFYNSlamHMof2L+E6WCdv+Q
 85qo27im2I9qZfFfZnuoFWWAT6qF02o0WVYEwGfA=
Received: by mx.zohomail.com with SMTPS id 1770400193868370.7925643447186;
 Fri, 6 Feb 2026 09:49:53 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260206004110.1914814-2-joelagnelf@nvidia.com>
Date: Fri, 6 Feb 2026 14:49:31 -0300
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <73B64D35-6574-4776-962D-865465C40226@collabora.com>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3DB7C10170B
X-Rspamd-Action: no action

Hi Joel,

> On 5 Feb 2026, at 21:41, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>=20
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>=20
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>=20
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> MAINTAINERS            |   7 +
> drivers/gpu/Kconfig    |   7 +
> rust/helpers/helpers.c |   1 +
> rust/helpers/list.c    |  21 +++
> rust/kernel/clist.rs   | 315 +++++++++++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs     |   2 +
> 6 files changed, 353 insertions(+)
> create mode 100644 rust/helpers/list.c
> create mode 100644 rust/kernel/clist.rs
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 900fc00b73e6..310bb479260c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23204,6 +23204,13 @@ S: Maintained
> T: git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
> F: scripts/generate_rust_analyzer.py
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
> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
> index 22dd29cd50b5..2c3dec070645 100644
> --- a/drivers/gpu/Kconfig
> +++ b/drivers/gpu/Kconfig
> @@ -1,7 +1,14 @@
> # SPDX-License-Identifier: GPL-2.0
>=20
> +config RUST_CLIST
> + bool
> + depends on RUST
> + help
> +  Rust abstraction for interfacing with C linked lists.
> +
> config GPU_BUDDY
> bool
> + select RUST_CLIST if RUST
> help
>  A page based buddy allocator for GPU memory.
>=20
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a..724fcb8240ac 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -35,6 +35,7 @@
> #include "io.c"
> #include "jump_label.c"
> #include "kunit.c"
> +#include "list.c"
> #include "maple_tree.c"
> #include "mm.c"
> #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..3390b154fa36
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C Circular doubly linked list implementation.
> + */
> +
> +#include <linux/list.h>
> +
> +#ifndef __rust_helper
> +#define __rust_helper
> +#endif
> +
> +__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
> +{
> + INIT_LIST_HEAD(list);
> +}
> +
> +__rust_helper void rust_helper_list_add_tail(struct list_head *new, =
struct list_head *head)
> +{
> + list_add_tail(new, head);
> +}
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..1f6d4db13c1d
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,315 @@
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
> +//! # let head =3D head.as_mut_ptr();
> +//! # // SAFETY: head and all the items are test objects allocated in =
this scope.
> +//! # unsafe { bindings::INIT_LIST_HEAD(head) };
> +//! #
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
> +//! #         =
bindings::INIT_LIST_HEAD(core::ptr::addr_of_mut!((*ptr).link));

Shoudn=E2=80=99t this be &raw mut?

> +//! #         bindings::list_add_tail(&mut (*ptr).link, head);
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
> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded =
`link` field.
> +//! let list =3D unsafe { clist_create!(head, Item, SampleItemC, =
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
> +use pin_init::PinInit;
> +
> +/// Wraps a `list_head` object for use in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - [`CListHead`] represents an allocated and valid `list_head` =
structure.
> +/// - Once a [`CListHead`] is created in Rust, it will not be =
modified by non-Rust code.

> +/// - All `list_head` for individual items are not modified for the =
lifetime of [`CListHead`].

Can you expand on the two points above?

> +#[repr(transparent)]
> +pub(crate) struct CListHead(Opaque<bindings::list_head>);
> +
> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` =
pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and =
initialized `list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime =
`'a`.
> +    #[inline]
> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) =
-> &'a Self {
> +        // SAFETY:
> +        // - [`CListHead`] has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub(crate) fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next [`CListHead`] in the list.
> +    #[inline]
> +    pub(crate) fn next(&self) -> &Self {
> +        let raw =3D self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub(crate) fn is_linked(&self) -> bool {
> +        let raw =3D self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next !=3D raw && (*raw).prev !=3D raw }

I wonder if this is duplicating some C helper?

> +    }
> +
> +    /// Pin-initializer that initializes the list head.
> +    pub(crate) fn new() -> impl PinInit<Self> {
> +        // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid =
empty list.
> +        unsafe {
> +            pin_init::pin_init_from_closure(move |slot: *mut Self| {
> +                bindings::INIT_LIST_HEAD(slot.cast());
> +                Ok(())
> +            })
> +        }
> +    }
> +}
> +
> +// SAFETY: [`CListHead`] can be sent to any thread.
> +unsafe impl Send for CListHead {}
> +
> +// SAFETY: [`CListHead`] can be shared among threads as it is not =
modified
> +// by non-Rust code per type invariants.
> +unsafe impl Sync for CListHead {}
> +
> +impl PartialEq for CListHead {
> +    fn eq(&self, other: &Self) -> bool {
> +        core::ptr::eq(self, other)
> +    }
> +}
> +
> +impl Eq for CListHead {}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list =
(`list_head`). Caller has to
> +/// perform conversion of returned [`CListHead`] to an item (using =
`container_of` macro or similar).
> +///
> +/// # Invariants
> +///
> +/// [`CListHeadIter`] is iterating over an allocated, initialized and =
valid list.
> +struct CListHeadIter<'a> {
> +    /// Current position in the list.
> +    current: &'a CListHead,
> +    /// The sentinel head (used to detect end of iteration).
> +    sentinel: &'a CListHead,
> +}
> +
> +impl<'a> Iterator for CListHeadIter<'a> {
> +    type Item =3D &'a CListHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Check if we've reached the sentinel (end of list).
> +        if core::ptr::eq(self.current, self.sentinel) {
> +            return None;
> +        }

I was under the impression that CListHeads implemented PartialEq/Eq?

> +
> +        let item =3D self.current;
> +        self.current =3D item.next();
> +        Some(item)
> +    }
> +}
> +
> +impl<'a> FusedIterator for CListHeadIter<'a> {}
> +
> +/// A typed C linked list with a sentinel head.
> +///
> +/// A sentinel head represents the entire linked list and can be used =
for
> +/// iteration over items of type `T`, it is not associated with a =
specific item.
> +///
> +/// The const generic `OFFSET` specifies the byte offset of the =
`list_head` field within
> +/// the struct that `T` wraps.
> +///
> +/// # Invariants
> +///
> +/// - The [`CListHead`] is an allocated and valid sentinel C =
`list_head` structure.
> +/// - `OFFSET` is the byte offset of the `list_head` field within the =
struct that `T` wraps.
> +/// - All the list's `list_head` nodes are allocated and have valid =
next/prev pointers.
> +#[repr(transparent)]
> +pub(crate) struct CList<T, const OFFSET: usize>(CListHead, =
PhantomData<T>);
> +
> +impl<T, const OFFSET: usize> CList<T, OFFSET> {
> +    /// Create a typed [`CList`] reference from a raw sentinel =
`list_head` pointer.
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
> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) =
-> &'a Self {
> +        // SAFETY:
> +        // - [`CList`] has same layout as [`CListHead`] due to =
repr(transparent).
> +        // - Caller guarantees `ptr` is a valid, sentinel `list_head` =
object.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    #[expect(dead_code)]
> +    pub(crate) fn is_empty(&self) -> bool {

Why can=E2=80=99t this be pub?

> +        !self.0.is_linked()
> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub(crate) fn iter(&self) -> CListIter<'_, T, OFFSET> {
> +        let head =3D &self.0;
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
> +pub(crate) struct CListIter<'a, T, const OFFSET: usize> {
> +    head_iter: CListHeadIter<'a>,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, =
OFFSET> {
> +    type Item =3D &'a T;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let head =3D self.head_iter.next()?;
> +
> +        // Convert to item using OFFSET.
> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated =
using offset_of!)
> +        // is valid per invariants.
> +        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
> +    }
> +}
> +
> +impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, =
OFFSET> {}
> +
> +/// Create a C doubly-circular linked list interface `CList` from a =
raw `list_head` pointer.
> +///
> +/// This macro creates a `CList<T, OFFSET>` that can iterate over =
items of type `$rust_type`
> +/// linked via the `$field` field in the underlying C struct =
`$c_type`.
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
> +/// This is an unsafe macro. The caller must ensure:
> +///
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing =
to a list that remains
> +///   unmodified for the lifetime of the rust `CList`.
> +/// - The list contains items of type `$c_type` linked via an =
embedded `$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has =
compatible layout.
> +///
> +/// # Examples
> +///
> +/// Refer to the examples in this module's documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
> +        // Compile-time check that field path is a list_head.
> +        let _: fn(*const $c_type) -> *const =
$crate::bindings::list_head =3D
> +            |p| &raw const (*p).$($field).+;
> +
> +        // Calculate offset and create `CList`.
> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, =
$($field).+);
> +        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
> +    }};
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3da92f18f4ee..8439c30f40b5 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -75,6 +75,8 @@
> pub mod bug;
> #[doc(hidden)]
> pub mod build_assert;
> +#[cfg(CONFIG_RUST_CLIST)]
> +pub(crate) mod clist;
> pub mod clk;
> #[cfg(CONFIG_CONFIGFS_FS)]
> pub mod configfs;
> --=20
> 2.34.1
>=20
>=20

