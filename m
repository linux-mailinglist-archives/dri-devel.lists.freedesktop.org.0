Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALs2GDp3gGmo8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:06:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F9CA7C7
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8FD10E3DC;
	Mon,  2 Feb 2026 10:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dgZfY3Xo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29C310E3DC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:06:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D48B3429EF;
 Mon,  2 Feb 2026 10:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F14C116C6;
 Mon,  2 Feb 2026 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770026806;
 bh=w3FSTDzx7E8mraZaaDGyuP+0xN6GQpY+/GPOVYPPtfQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dgZfY3XoeXPfAlHYEFs2WdJH02wkLpOU1HKLIukQyXEEdGbPAdTtJNfOwFnpCb2jW
 8zNtZArjMtIikbuiITY22wYZkNa3GjvOQB2eLX52+HjVBRcBv2KbjGxaWmBJJRds00
 3Pdtavxjnj31/iZPiS8lkO8/7wHECWw7fSTee6ht+WWhC1jthkeMxWNdMOcADPE1F3
 ctiM49lKA4RbPh0boINSS9Wa5Fy7RWX4TuBBMuHEgTDDFw7RSgRsmNtVL+axBZIdRc
 KtSh02iXMz4dIwQqDWPOdFauOXFivQKx6vbJWiiyFPwzgWdMEWrOIK/cgiDe9OzoKi
 DJvNbLzeSLZNg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno Lossin
 <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman
 <david.m.ertman@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Paul
 Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Asahi Lina
 <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-security-module@vger.kernel.org
Subject: Re: [PATCH v13 1/4] rust: types: Add Ownable/Owned types
In-Reply-To: <20251201155135.2b9c4084.gary@garyguo.net>
References: <20251117-unique-ref-v13-0-b5b243df1250@pm.me>
 <20251117-unique-ref-v13-1-b5b243df1250@pm.me>
 <20251201155135.2b9c4084.gary@garyguo.net>
Date: Mon, 02 Feb 2026 10:37:55 +0100
Message-ID: <87343jqydo.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:oliver.mangold@pm.me,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:aliceryhl@google.com,m:tmgross@umich.edu,m:lossin@kernel.org,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:rafael@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:lina+kernel@asahilina.net,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-security-module@vger.kernel.
 org,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,linux.intel.com,suse.de,ffwll.ch,zeniv.linux.org.uk,suse.cz,oracle.com,ti.com,paul-moore.com,asahilina.net,vger.kernel.org,lists.freedesktop.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[t14s.mail-host-address-is-not-set:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C35F9CA7C7
X-Rspamd-Action: no action

Gary Guo <gary@garyguo.net> writes:

> On Mon, 17 Nov 2025 10:07:40 +0000
> Oliver Mangold <oliver.mangold@pm.me> wrote:
>
>> From: Asahi Lina <lina+kernel@asahilina.net>
>> 
>> By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
>> (typically C FFI) type that *may* be owned by Rust, but need not be. Unlike
>> `AlwaysRefCounted`, this mechanism expects the reference to be unique
>> within Rust, and does not allow cloning.
>> 
>> Conceptually, this is similar to a `KBox<T>`, except that it delegates
>> resource management to the `T` instead of using a generic allocator.
>> 
>> [ om:
>>   - Split code into separate file and `pub use` it from types.rs.
>>   - Make from_raw() and into_raw() public.
>>   - Remove OwnableMut, and make DerefMut dependent on Unpin instead.
>>   - Usage example/doctest for Ownable/Owned.
>>   - Fixes to documentation and commit message.
>> ]
>> 
>> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
>> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
>> Co-developed-by: Oliver Mangold <oliver.mangold@pm.me>
>> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
>> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>> ---
>>  rust/kernel/lib.rs       |   1 +
>>  rust/kernel/owned.rs     | 195 +++++++++++++++++++++++++++++++++++++++++++++++
>>  rust/kernel/sync/aref.rs |   5 ++
>>  rust/kernel/types.rs     |   2 +
>>  4 files changed, 203 insertions(+)
>> 
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 3dd7bebe7888..e0ee04330dd0 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -112,6 +112,7 @@
>>  pub mod of;
>>  #[cfg(CONFIG_PM_OPP)]
>>  pub mod opp;
>> +pub mod owned;
>>  pub mod page;
>>  #[cfg(CONFIG_PCI)]
>>  pub mod pci;
>> diff --git a/rust/kernel/owned.rs b/rust/kernel/owned.rs
>> new file mode 100644
>> index 000000000000..a2cdd2cb8a10
>> --- /dev/null
>> +++ b/rust/kernel/owned.rs
>> @@ -0,0 +1,195 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Unique owned pointer types for objects with custom drop logic.
>> +//!
>> +//! These pointer types are useful for C-allocated objects which by API-contract
>> +//! are owned by Rust, but need to be freed through the C API.
>> +
>> +use core::{
>> +    mem::ManuallyDrop,
>> +    ops::{Deref, DerefMut},
>> +    pin::Pin,
>> +    ptr::NonNull,
>> +};
>> +
>> +/// Type allocated and destroyed on the C side, but owned by Rust.
>
> The example given in the documentation below shows a valid way of
> defining a type that's handled on the Rust side, so I think this
> message is somewhat inaccurate.
>
> Perhaps something like
>
> 	Types that specify their own way of performing allocation and
> 	destruction. Typically, this trait is implemented on types from
> 	the C side.

Thanks, I'll use this.

>
> ?
>
>> +///
>> +/// Implementing this trait allows types to be referenced via the [`Owned<Self>`] pointer type. This
>> +/// is useful when it is desirable to tie the lifetime of the reference to an owned object, rather
>> +/// than pass around a bare reference. [`Ownable`] types can define custom drop logic that is
>> +/// executed when the owned reference [`Owned<Self>`] pointing to the object is dropped.
>> +///
>> +/// Note: The underlying object is not required to provide internal reference counting, because it
>> +/// represents a unique, owned reference. If reference counting (on the Rust side) is required,
>> +/// [`AlwaysRefCounted`](crate::types::AlwaysRefCounted) should be implemented.
>> +///
>> +/// # Safety
>> +///
>> +/// Implementers must ensure that the [`release()`](Self::release) function frees the underlying
>> +/// object in the correct way for a valid, owned object of this type.
>> +///
>> +/// # Examples
>> +///
>> +/// A minimal example implementation of [`Ownable`] and its usage with [`Owned`] looks like this:
>> +///
>> +/// ```
>> +/// # #![expect(clippy::disallowed_names)]
>> +/// # use core::cell::Cell;
>> +/// # use core::ptr::NonNull;
>> +/// # use kernel::sync::global_lock;
>> +/// # use kernel::alloc::{flags, kbox::KBox, AllocError};
>> +/// # use kernel::types::{Owned, Ownable};
>> +///
>> +/// // Let's count the allocations to see if freeing works.
>> +/// kernel::sync::global_lock! {
>> +///     // SAFETY: we call `init()` right below, before doing anything else.
>> +///     unsafe(uninit) static FOO_ALLOC_COUNT: Mutex<usize> = 0;
>> +/// }
>> +/// // SAFETY: We call `init()` only once, here.
>> +/// unsafe { FOO_ALLOC_COUNT.init() };
>> +///
>> +/// struct Foo {
>> +/// }
>> +///
>> +/// impl Foo {
>> +///     fn new() -> Result<Owned<Self>, AllocError> {
>> +///         // We are just using a `KBox` here to handle the actual allocation, as our `Foo` is
>> +///         // not actually a C-allocated object.
>> +///         let result = KBox::new(
>> +///             Foo {},
>> +///             flags::GFP_KERNEL,
>> +///         )?;
>> +///         let result = NonNull::new(KBox::into_raw(result))
>> +///             .expect("Raw pointer to newly allocation KBox is null, this should never happen.");
>> +///         // Count new allocation
>> +///         *FOO_ALLOC_COUNT.lock() += 1;
>> +///         // SAFETY: We just allocated the `Self`, thus it is valid and there cannot be any other
>> +///         // Rust references. Calling `into_raw()` makes us responsible for ownership and we won't
>> +///         // use the raw pointer anymore. Thus we can transfer ownership to the `Owned`.
>> +///         Ok(unsafe { Owned::from_raw(result) })
>> +///     }
>> +/// }
>> +///
>> +/// // SAFETY: What out `release()` function does is safe of any valid `Self`.
>
> I can't parse this sentence. Is "out" supposed to be a different word?

I think it should be "our".

>
>> +/// unsafe impl Ownable for Foo {
>> +///     unsafe fn release(this: NonNull<Self>) {
>> +///         // The `Foo` will be dropped when `KBox` goes out of scope.
>
> I would just write `drop(unsafe { ... })` to make drop explicit instead
> of commenting about the implicit drop.

Agree, that is easier to read.

>
>> +///         // SAFETY: The [`KBox<Self>`] is still alive. We can pass ownership to the [`KBox`], as
>> +///         // by requirement on calling this function, the `Self` will no longer be used by the
>> +///         // caller.
>> +///         unsafe { KBox::from_raw(this.as_ptr()) };
>> +///         // Count released allocation
>> +///         *FOO_ALLOC_COUNT.lock() -= 1;
>> +///     }
>> +/// }
>> +///
>> +/// {
>> +///    let foo = Foo::new().expect("Failed to allocate a Foo. This shouldn't happen");
>> +///    assert!(*FOO_ALLOC_COUNT.lock() == 1);
>> +/// }
>> +/// // `foo` is out of scope now, so we expect no live allocations.
>> +/// assert!(*FOO_ALLOC_COUNT.lock() == 0);
>> +/// ```
>> +pub unsafe trait Ownable {
>> +    /// Releases the object.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must ensure that:
>> +    /// - `this` points to a valid `Self`.
>> +    /// - `*this` is no longer used after this call.
>> +    unsafe fn release(this: NonNull<Self>);
>> +}
>> +
>> +/// An owned reference to an owned `T`.
>> +///
>> +/// The [`Ownable`] is automatically freed or released when an instance of [`Owned`] is
>> +/// dropped.
>> +///
>> +/// # Invariants
>> +///
>> +/// - The [`Owned<T>`] has exclusive access to the instance of `T`.
>> +/// - The instance of `T` will stay alive at least as long as the [`Owned<T>`] is alive.
>> +pub struct Owned<T: Ownable> {
>> +    ptr: NonNull<T>,
>> +}
>> +
>> +// SAFETY: It is safe to send an [`Owned<T>`] to another thread when the underlying `T` is [`Send`],
>> +// because of the ownership invariant. Sending an [`Owned<T>`] is equivalent to sending the `T`.
>> +unsafe impl<T: Ownable + Send> Send for Owned<T> {}
>> +
>> +// SAFETY: It is safe to send [`&Owned<T>`] to another thread when the underlying `T` is [`Sync`],
>> +// because of the ownership invariant. Sending an [`&Owned<T>`] is equivalent to sending the `&T`.
>> +unsafe impl<T: Ownable + Sync> Sync for Owned<T> {}
>> +
>> +impl<T: Ownable> Owned<T> {
>> +    /// Creates a new instance of [`Owned`].
>> +    ///
>> +    /// It takes over ownership of the underlying object.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must ensure that:
>> +    /// - `ptr` points to a valid instance of `T`.
>> +    /// - Ownership of the underlying `T` can be transferred to the `Self<T>` (i.e. operations
>> +    ///   which require ownership will be safe).
>> +    /// - No other Rust references to the underlying object exist. This implies that the underlying
>> +    ///   object is not accessed through `ptr` anymore after the function call (at least until the
>> +    ///   the `Self<T>` is dropped.
>
> Is this correct? If `Self<T>` is dropped then `T::release` is called so
> the pointer should also not be accessed further?

I can't follow you point here. Are you saying that the requirement is
wrong because `T::release` will access the object by reference? If so,
that is part of `Owned<_>::drop`, which is explicitly mentioned in the
comment (until .. dropped).

>
>> +    /// - The C code follows the usual shared reference requirements. That is, the kernel will never
>> +    ///   mutate or free the underlying object (excluding interior mutability that follows the usual
>> +    ///   rules) while Rust owns it.
>
> The concept "interior mutability" doesn't really exist on the C side.
> Also, use of interior mutability (by UnsafeCell) would be incorrect if
> the type is implemented in the rust side (as this requires a
> UnsafePinned).
>
> Interior mutability means things can be mutated behind a shared
> reference -- however in this case, we have a mutable reference (either
> `Pin<&mut Self>` or `&mut Self`)!
>
> Perhaps together with the next line, they could be just phrased like
> this?
>
> - The underlying object must not be accessed (read or mutated) through
>   any pointer other than the created `Owned<T>`.
>   Opt-out is still possbile similar to a mutable reference (e.g. by
>   using p`Opaque`]). 
>
> I think we should just tell the user "this is just a unique reference
> similar to &mut". They should be able to deduce that all the `!Unpin`
> that opts out from uniqueness of mutable reference applies here too.

I agree. I would suggest updating the struct documentation:

    @@ -108,7 +108,7 @@ pub unsafe trait Ownable {
        unsafe fn release(this: NonNull<Self>);
    }

    -/// An owned reference to an owned `T`.
    +/// An mutable reference to an owned `T`.
    ///
    /// The [`Ownable`] is automatically freed or released when an instance of [`Owned`] is
    /// dropped.

And then the safety requirement as

 An `Owned<T>` is a mutable reference to the underlying object. As such,
 the object must not be accessed (read or mutated) through any pointer
 other than the created `Owned<T>`. Opt-out is still possbile similar to
 a mutable reference (e.g. by using [`Opaque`]).


>> +    /// - In case `T` implements [`Unpin`] the previous requirement is extended from shared to
>> +    ///   mutable reference requirements. That is, the kernel will not mutate or free the underlying
>> +    ///   object and is okay with it being modified by Rust code.
>
> - If `T` implements [`Unpin`], the structure must not be mutated for
>   the entire lifetime of `Owned<T>`.

Would it be OK to just write "If `T: Unpin`, the ..."?

Again, opt out is possible, right?

>
>> +    pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>
> This needs a (rather trivial) INVARIANT comment.

OK.

>
>> +        Self {
>> +            ptr,
>> +        }
>> +    }
>> +
>> +    /// Consumes the [`Owned`], returning a raw pointer.
>> +    ///
>> +    /// This function does not actually relinquish ownership of the object. After calling this
>
> Perhaps "relinquish" isn't the best word here? In my mental model
> this function is pretty much relinquishing ownership as `Owned<T>` no
> longer exists. It just doesn't release the object.

How about this:


    /// Consumes the [`Owned`], returning a raw pointer.
    ///
    /// This function does not drop the underlying `T`. When this function returns, ownership of the
    /// underlying `T` is with the caller.


Thanks for the comments!


Best regards,
Andreas Hindborg



