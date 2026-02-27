Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIbcH1yAoWkUtgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:30:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED2C1B693D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B40E10EB0A;
	Fri, 27 Feb 2026 11:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KA9mDr33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473AC10E16E;
 Fri, 27 Feb 2026 11:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB6CE444C6;
 Fri, 27 Feb 2026 11:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC98C116C6;
 Fri, 27 Feb 2026 11:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772191832;
 bh=q9Qw4m+ehN9G6pF4YvgGI5YvC7WtO4kLCNQbCmQ0VZ8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=KA9mDr33xS18HYhHMxjWEsKqOqRnJOYpP3JoPuGNMxpZMgBGRk6QZ30AzHVzdMVlO
 TlkKcIB9/TPLGYpNMZ08Il3YRMVl9JyYWiCdAl2pNiuWRqG72drMNfkl3tdVGfJ97c
 DpXQ9dYkomvweAHjYHDizYYP8o4V52D/mdElnHU1siJ10WDu+XllQMBZZO0xEYE09D
 o/8GjtCbz5qKoHOUipHVLPwgZNQZNkuawkxPPgJ6OBKBakBli+8GttpLRvglr/C2wh
 2jrpmrS4BRdthCoOgJ1ymMUaQ1woQSWypOu7cGqLP0i/AZequ6WqdEOC47KWg0+CDn
 IPDrai+gMi2kw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 12:30:20 +0100
Message-Id: <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Dave
 Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Andrea Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp
 Stanner" <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 <alexeyi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <joel@joelfernandes.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <arunpravin.paneerselvam@amd.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
In-Reply-To: <20260224224005.3232841-5-joelagnelf@nvidia.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.936];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2ED2C1B693D
X-Rspamd-Action: no action

(Cc: Arun)

On Tue Feb 24, 2026 at 11:40 PM CET, Joel Fernandes wrote:
> +RUST [GPU BUDDY]
> +M:	Joel Fernandes <joelagnelf@nvidia.com>
> +L:	dri-devel@lists.freedesktop.org
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/helpers/gpu.c
> +F:	rust/kernel/gpu/

What about adding this to the existing GPU BUDDY ALLOCATOR entry? Maybe you=
 can
offer Matthew and Arun your help.

Also, this wouldn't be a subentry of "RUST", but the rust version of GPU BU=
DDY,
so it would be "GPU BUDDY [RUST]".

Also, please add rust/kernel/gpu/ to the "DRM DRIVERS AND COMMON INFRASTRUC=
TURE
[RUST]" entry.

> +/// Inner structure holding the actual buddy allocator.
> +///
> +/// # Synchronization
> +///
> +/// The C `gpu_buddy` API requires synchronization (see `include/linux/g=
pu_buddy.h`).
> +/// The internal [`GpuBuddyGuard`] ensures that the lock is held for all
> +/// allocator and free operations, preventing races between concurrent a=
llocations
> +/// and the freeing that occurs when [`AllocatedBlocks`] is dropped.
> +///
> +/// # Invariants
> +///
> +/// The inner [`Opaque`] contains a valid, initialized buddy allocator.

The invariant should be justified in the constructor. Also, where is it use=
d?

> +// SAFETY: GpuBuddyInner is `Sync` because the internal GpuBuddyGuard

I think it's more precise to refer to GpuBuddyInner::lock.

> +// serializes all access to the C allocator, preventing data races.
> +unsafe impl Sync for GpuBuddyInner {}
> +
> +/// Guard that proves the lock is held, enabling access to the allocator=
.
> +///
> +/// # Invariants
> +///
> +/// The inner `_guard` holds the lock for the duration of this guard's l=
ifetime.
> +pub(crate) struct GpuBuddyGuard<'a> {
> +    inner: &'a GpuBuddyInner,
> +    _guard: MutexGuard<'a, ()>,
> +}
> +
> +impl GpuBuddyGuard<'_> {
> +    /// Get a raw pointer to the underlying C `gpu_buddy` structure.
> +    fn as_raw(&self) -> *mut bindings::gpu_buddy {
> +        self.inner.inner.get()
> +    }
> +}
> +
> +/// GPU buddy allocator instance.
> +///
> +/// This structure wraps the C `gpu_buddy` allocator using reference cou=
nting.
> +/// The allocator is automatically cleaned up when all references are dr=
opped.
> +///
> +/// # Invariants
> +///
> +/// The inner [`Arc`] points to a valid, initialized GPU buddy allocator=
.

Do we need this invariant? Isn't this implied by the GpuBuddyInner type?

> +    /// Iterate over allocated blocks.
> +    ///
> +    /// Returns an iterator yielding [`AllocatedBlock`] values. Each [`A=
llocatedBlock`]
> +    /// borrows `self` and is only valid for the duration of that borrow=
.
> +    pub fn iter(&self) -> impl Iterator<Item =3D AllocatedBlock<'_>> + '=
_ {
> +        // SAFETY: list contains gpu_buddy_block items linked via __bind=
gen_anon_1.link.
> +        let clist =3D clist_create!(unsafe {

This macro has three separate safety requirements, please justify all of th=
em.
Also, please also use markdown in safety comments. Personally, I don't care=
 too
much, but it would be good to keep things consistent.

> +            self.list.as_raw(),
> +            Block,
> +            bindings::gpu_buddy_block,
> +            __bindgen_anon_1.link
> +        });
> +
> +        clist
> +            .iter()
> +            .map(|block| AllocatedBlock { block, alloc: self })
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for AllocatedBlocks {
> +    fn drop(self: Pin<&mut Self>) {
> +        let guard =3D self.buddy.lock();
> +
> +        // SAFETY:
> +        // - list is valid per the type's invariants.
> +        // - guard provides exclusive access to the allocator.
> +        // CAST: BuddyFlags were validated to fit in u32 at construction=
.
> +        unsafe {
> +            bindings::gpu_buddy_free_list(
> +                guard.as_raw(),
> +                self.list.as_raw(),
> +                self.flags.as_raw() as u32,
> +            );
> +        }
> +    }
> +}
> +
> +/// A GPU buddy block.
> +///
> +/// Transparent wrapper over C `gpu_buddy_block` structure. This type is=
 returned
> +/// as references during iteration over [`AllocatedBlocks`].
> +///
> +/// # Invariants
> +///
> +/// The inner [`Opaque`] contains a valid, allocated `gpu_buddy_block`.
> +#[repr(transparent)]
> +pub struct Block(Opaque<bindings::gpu_buddy_block>);

Does this need to be public? I don't see it being exposed by any API.

> +
> +impl Block {
> +    /// Get a raw pointer to the underlying C block.
> +    fn as_raw(&self) -> *mut bindings::gpu_buddy_block {
> +        self.0.get()
> +    }
> +
> +    /// Get the block's offset in the address space.
> +    pub(crate) fn offset(&self) -> u64 {
> +        // SAFETY: self.as_raw() is valid per the type's invariants.
> +        unsafe { bindings::gpu_buddy_block_offset(self.as_raw()) }
> +    }
> +
> +    /// Get the block order.
> +    pub(crate) fn order(&self) -> u32 {
> +        // SAFETY: self.as_raw() is valid per the type's invariants.
> +        unsafe { bindings::gpu_buddy_block_order(self.as_raw()) }
> +    }
> +}
> +
> +// SAFETY: `Block` is not modified after allocation for the lifetime
> +// of `AllocatedBlock`.
> +unsafe impl Send for Block {}
> +
> +// SAFETY: `Block` is not modified after allocation for the lifetime
> +// of `AllocatedBlock`.
> +unsafe impl Sync for Block {}
> +
> +/// An allocated block with access to the GPU buddy allocator.

This needs a better description, i.e. what makes an `AllocatedBlock differe=
nt
compared to a "normal" Block.

> +///
> +/// It is returned by [`AllocatedBlocks::iter()`] and provides access to=
 the
> +/// GPU buddy allocator required for some accessors.
> +///
> +/// # Invariants
> +///
> +/// - `block` is a valid reference to an allocated [`Block`].
> +/// - `alloc` is a valid reference to the [`AllocatedBlocks`] that owns =
this block.

References should always be valid, no need to mention that.

> +pub struct AllocatedBlock<'a> {
> +    block: &'a Block,

NIT: What about just naming it "this" and

> +    alloc: &'a AllocatedBlocks,

"blocks"?

> +}
> +
> +impl AllocatedBlock<'_> {
> +    /// Get the block's offset in the address space.
> +    ///
> +    /// Returns the absolute offset including the allocator's base offse=
t.
> +    /// This is the actual address to use for accessing the allocated me=
mory.
> +    pub fn offset(&self) -> u64 {
> +        self.alloc.buddy.base_offset + self.block.offset()
> +    }
> +
> +    /// Get the block order (size =3D chunk_size << order).
> +    pub fn order(&self) -> u32 {
> +        self.block.order()
> +    }
> +
> +    /// Get the block's size in bytes.
> +    pub fn size(&self) -> u64 {
> +        self.alloc.buddy.chunk_size << self.block.order()
> +    }
> +}
