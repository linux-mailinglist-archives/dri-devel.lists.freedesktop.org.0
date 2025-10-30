Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA9C22639
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 22:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F44410EA30;
	Thu, 30 Oct 2025 21:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OwRkMg6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0EC10E9C1;
 Thu, 30 Oct 2025 21:15:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 380AD4021D;
 Thu, 30 Oct 2025 21:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF9AC4CEF8;
 Thu, 30 Oct 2025 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761858926;
 bh=bHRp7fCzHDOeTJ7ixpsWLTEPGVtsOymLINlTOXNcp7U=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=OwRkMg6Ycwcp1YxcTViX/4ZeLQuqjZb0FI3Ocprv6x8JntIqprgj3HbdNX8FWJRzG
 s9MbHyBRc3n4NkZErHGxPT468sNj5dpqjzro7x2KnggM9mkeEM1uP7t42E0NsvXEa/
 NY5AiIMYBW167CTd0e46KoT/aQAao8x800cFpKoB0ih/xif5avaojiRczP9VYFI7E1
 2WM6QcdAG22LEHVjoIBPX9KBsu7vL86cL9x0SslWFKcPRQ1boXZWnvF4LQWx2JxuG3
 gN9mVoNvxZ6XVwrIUXCyGO4mhNK49yBujy1Ua5NQA7zznIV5n+PM2eorlPjL7ic+0G
 /0eVUKSWdhENw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 22:15:19 +0100
Message-Id: <DDVYV1VT441A.11L5C11F8R7C9@kernel.org>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over
 C linked lists
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "David Airlie" <airlied@gmail.com>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
In-Reply-To: <20251030190613.1224287-2-joelagnelf@nvidia.com>
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

On Thu Oct 30, 2025 at 8:06 PM CET, Joel Fernandes wrote:
> Provides a safe interface for iterating over C's intrusive

I'm not sure we're there just yet, I count eight unsafe blocks in the subse=
quent
sample code.

Don't get me wrong, there is no way to make the API safe entirely, but "saf=
e
interface" is clearly a wrong promise. :)

Some more high level comments below.

> +//! // Rust-side struct to hold pointer to C-side struct.
> +//! struct Item {
> +//!     ptr: NonNull<bindings::c_item>,
> +//! }
> +//!
> +//! impl clist::FromListHead for Item {
> +//!     unsafe fn from_list_head(link: *const bindings::list_head) -> Se=
lf {
> +//!         let item_ptr =3D container_of!(link, bindings::c_item, link)=
 as *mut _;
> +//!         Item { ptr: NonNull::new_unchecked(item_ptr) }
> +//!     }
> +//! }

If you just embedd a pointer to the C struct in a struct Item you don't cov=
er
the lifetime relationship.

Instead this should be something like

	#[repr(transparent)]
	struct Entry<T>(Opaque<T>);

or

	struct Entry<'a, T>(NonNull<T>, PhantomData<&'a T>);

where T is the C list entry type.

You can then have a setup where an &Entry borrows from a &CListHead, which
borrows from a Clist.

I'd also provide a macro for users to generate this structure as well as th=
e
corresponding FromListHead impl.

> +//! // Rust wraps and iterates over the list.
> +//! let list =3D unsafe { clist::Clist::<Item>::new(c_list_head) };

This function has a lot of safety requirements that need to be covered.

It also should be, besides the unsafe FromListHead trait, the only unsafe
function needed.

The Clist should ideally have methods for all kinds of list iterators, e.g.
list_for_each_entry_{safe,reverse,continue}() etc.

Of course you don't need to provide all of them in an initial implementatio=
n,
but we should set the direction.
