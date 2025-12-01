Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765BBC969F4
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 11:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2025C10E36F;
	Mon,  1 Dec 2025 10:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="RpHDpQZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084FF10E36D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1764584606; x=1764843806;
 bh=QnPScfECMfGXASlBfNyIG7Imc1U13Cp1f8LkX6qmIUk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RpHDpQZzYuktwGoF6ihhp2LS52OTDz4RVT/GsNzw44D9RYrEC1d0h/X3FKZUNWqPq
 C/3rllP/4P22OrASzib/QAqi2dIGjis2zjL5mY7IIcUEAcL83/qda8oBG4rRQYE1+/
 kQfmdU2sN54teUEA3Qy+r6rCZdCytGsRdsQdv2yax5W/NEyYn8WumNdFtVs8q3XZBX
 JssZh5RD7Mv63jptrzfwaQaE+KTnySpGQ86wrEoxHZPpPQxzf0D7qSwEYj0RrWvDaN
 yJPVjChTQiiMSStQ6r5/HBN8EE64sr0hoQ9jOrXBjmhPw1E/49oN7sFYSsdfwwpWJm
 vcxWADWzG0sTQ==
Date: Mon, 01 Dec 2025 10:23:20 +0000
To: Daniel Almeida <daniel.almeida@collabora.com>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-security-module@vger.kernel.org
Subject: Re: [PATCH v13 4/4] rust: Add `OwnableRefCounted`
Message-ID: <aS1slBD1t-Y_K-aC@mango>
In-Reply-To: <A5A7C4C9-1504-439C-B4FF-C28482AF7444@collabora.com>
References: <20251117-unique-ref-v13-0-b5b243df1250@pm.me>
 <20251117-unique-ref-v13-4-b5b243df1250@pm.me>
 <A5A7C4C9-1504-439C-B4FF-C28482AF7444@collabora.com>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 4625f7cc3b95621c135f74a512f54cf7f5392afa
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On 251128 1506, Daniel Almeida wrote:

> > /// Type allocated and destroyed on the C side, but owned by Rust.
> > ///
> > -/// Implementing this trait allows types to be referenced via the [`Ow=
ned<Self>`] pointer type. This
> > -/// is useful when it is desirable to tie the lifetime of the referenc=
e to an owned object, rather
> > -/// than pass around a bare reference. [`Ownable`] types can define cu=
stom drop logic that is
> > -/// executed when the owned reference [`Owned<Self>`] pointing to the =
object is dropped.
> > +/// Implementing this trait allows types to be referenced via the [`Ow=
ned<Self>`] pointer type.
> > +///  - This is useful when it is desirable to tie the lifetime of an o=
bject reference to an owned
> > +///    object, rather than pass around a bare reference.
> > +///  - [`Ownable`] types can define custom drop logic that is executed=
 when the owned reference
> > +///    of type [`Owned<_>`] pointing to the object is dropped.
> > ///
> > /// Note: The underlying object is not required to provide internal ref=
erence counting, because it
> > /// represents a unique, owned reference. If reference counting (on the=
 Rust side) is required,
> > -/// [`RefCounted`](crate::types::RefCounted) should be implemented.
> > +/// [`RefCounted`] should be implemented. [`OwnableRefCounted`] should=
 be implemented if conversion
> > +/// between unique and shared (reference counted) ownership is needed.
> > ///
> > /// # Safety
> > ///
> > @@ -143,9 +146,7 @@ impl<T: Ownable> Owned<T> {
> >     ///   mutable reference requirements. That is, the kernel will not =
mutate or free the underlying
> >     ///   object and is okay with it being modified by Rust code.
> >     pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> > -        Self {
> > -            ptr,
> > -        }
> > +        Self { ptr }
> >     }
>=20
> Unrelated change?

Ah, yes, rustfmt must I done that, and I missed it. Will fix.

> > +///
> > +/// impl OwnableRefCounted for Foo {
> > +///     fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, AR=
ef<Self>> {
> > +///         if this.refcount.get() =3D=3D 1 {
> > +///             // SAFETY: The `Foo` is still alive and has no other R=
ust references as the refcount
> > +///             // is 1.
> > +///             Ok(unsafe { Owned::from_raw(ARef::into_raw(this)) })
> > +///         } else {
> > +///             Err(this)
> > +///         }
> > +///     }
> > +/// }
> > +///
>=20
> We wouldn=E2=80=99t need this implementation if we added a =E2=80=9Crefco=
unt()=E2=80=9D
> member to this trait. This lets you abstract away this logic for all
> implementors, which has the massive upside of making sure we hardcode (an=
d thus
> enforce) the refcount =3D=3D 1 check.

This wouldn't work for the block `Request` use case. There a reference can
be acquired "out of thin air" using a `TagSet`. Thus "check for unique
refcount" + "create an owned reference" needs to be one atomic operation.

Also I think it might be generally problematic to require a refcount()
function. The API of the underlying kernel object we want to wrap might not
offer that, so we would need to access internal data.


> > +/// // SAFETY: This implementation of `release()` is safe for any vali=
d `Self`.
> > +/// unsafe impl Ownable for Foo {
> > +///     unsafe fn release(this: NonNull<Self>) {
> > +///         // SAFETY: Using `dec_ref()` from [`RefCounted`] to releas=
e is okay, as the refcount is
> > +///         // always 1 for an [`Owned<Foo>`].
> > +///         unsafe{ Foo::dec_ref(this) };
> > +///     }
> > +/// }
> > +///
> > +/// let foo =3D Foo::new().expect("Failed to allocate a Foo. This shou=
ldn't happen");
>=20
> All these =E2=80=9Cexpects()=E2=80=9D and custom error strings would go a=
way if you
> place this behind a fictional function that returns Result.

Not sure what you mean by fictional function. Do you mean a non-existent
function? We want to compile this code as a unit test.

The rest of your suggested changes make sense, I guess. I will implement
them.

Thanks,

Oliver

