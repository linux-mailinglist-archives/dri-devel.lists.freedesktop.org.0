Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CEFAB1F1E
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7878D10EAFD;
	Fri,  9 May 2025 21:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="T1/40aG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D7710EAFB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746826660; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WKLU011SkivK0CNI3kcoJf+l62KFY2BaL9IORqjf32F2qaFwW2n+oZkocV/RyAwQllsqiMudkyp0+JyMd6wGRJGmF8hOSYbS0COt0fxW3I6WCPjTGxtAED+ngGBYxZMU/mbBrjA8rbLMsRV9rk8dqpvw4GXQ7dMPS2VQzd0uEjE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746826660;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8uQ/Q3BZqWs3AB74fmSdEwMz4hZv89bD/2dhgqYOFcA=; 
 b=RlRw7YotPSJCKobOTnXOogLGVeSgZdNDHjNWiaX3zvpSkwlNzgsk/jyzxVWHdM0AwbX3rSi7Z8ULF0euyiypZrK+gD22fwa3gtv1/rX5RbhOPUU9oFoNWYlRBNFTwt6bWR0mgU9J1Z5B0w6bSPU3SIcJwBsGFQVHDJS1+eQaCJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746826660; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=8uQ/Q3BZqWs3AB74fmSdEwMz4hZv89bD/2dhgqYOFcA=;
 b=T1/40aG5XAwBQa9Lngu832NkdWK/kp+55bqU87dAFsnovWg4PPz2ZO/Gki6pxCp5
 E7Tde/p9crMaG0mA577r6TCqJknvHJXibFsTnMAbNmAo9TtviIqmU6AgOBUsgU3qsAP
 dVzyB2gyy6FLHDLkIP7PRd6VCVFNn+S8b9iVSDMM=
Received: by mx.zohomail.com with SMTPS id 1746826657711256.6976409448082;
 Fri, 9 May 2025 14:37:37 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH 2/4] rust: drm: gem: Refactor
 IntoGEMObject::from_gem_obj() to as_ref()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250501183717.2058109-3-lyude@redhat.com>
Date: Fri, 9 May 2025 18:37:20 -0300
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Asahi Lina <lina@asahilina.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Transfer-Encoding: quoted-printable
Message-Id: <036A1696-C113-4C71-93AD-D5EA92EA3552@collabora.com>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-3-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
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

Hi Lyude

> On 1 May 2025, at 15:33, Lyude Paul <lyude@redhat.com> wrote:
>=20
> There's a few issues with this function, mainly:
>=20
> * This function -probably- should have been unsafe from the start. =
Pointers
>  are not always necessarily valid, but you want a function that does
>  field-projection for a pointer that can travel outside of the =
original
>  struct to be unsafe, at least if I understand properly.
> * *mut Self is not terribly useful in this context, the majority of =
uses of
>  from_gem_obj() grab a *mut Self and then immediately convert it into =
a
>  &'a Self. It also goes against the ffi conventions we've set in the =
rest
>  of the kernel thus far.
> * from_gem_obj() also doesn't follow the naming conventions in the =
rest of
>  the DRM bindings at the moment, as_ref() would be a better name.
>=20
> So, let's:
>=20
> * Make from_gem_obj() unsafe
> * Convert it to return &'a Self
> * Rename it to as_ref()
> * Update all call locations
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/gem/mod.rs | 67 ++++++++++++++++++++++++--------------
> 1 file changed, 42 insertions(+), 25 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index df8f9fdae5c22..f70531889c21f 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -45,8 +45,12 @@ pub trait IntoGEMObject: Sized + =
super::private::Sealed {
>     #[allow(clippy::wrong_self_convention)]
>     fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
>=20
> -    /// Converts a pointer to a `struct drm_gem_object` into a =
pointer to `Self`.
> -    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self;
> +    /// Converts a pointer to a `struct drm_gem_object` into a =
reference to `Self`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must be a valid pointer to `Self`.

Must also obey the reference rules. This is a bit obvious but it should
probably be mentioned regardless.

> +    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> =
&'a Self;
> }
>=20
> /// Trait which must be implemented by drivers using base GEM objects.
> @@ -63,14 +67,13 @@ extern "C" fn open_callback<T: =
BaseDriverObject<U>, U: BaseObject>(
>     let file =3D unsafe {
>         drm::File::<<<U as IntoGEMObject>::Driver as =
drm::Driver>::File>::as_ref(raw_file)
>     };
> -    let obj =3D
> -        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_gem_obj(
> -            raw_obj,
> -        );
> -
> -    // SAFETY: `from_gem_obj()` returns a valid pointer as long as =
the type is correct and the
> -    // `raw_obj` we got is valid.
> -    match T::open(unsafe { &*obj }, file) {
> +    // SAFETY: `open_callback` is specified in the AllocOps structure =
for `Object<T>`, ensuring that
> +    // `raw_obj` is indeed contained within a `Object<T>`.
> +    let obj =3D unsafe {
> +        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as =
IntoGEMObject>::as_ref(raw_obj)
> +    };

Ugh..IMHO we need to have aliases for all of these. This is, of course,
orthogonal to your patch. Just a nice-to-have for the future :)

> +
> +    match T::open(obj, file) {
>         Err(e) =3D> e.to_errno(),
>         Ok(()) =3D> 0,
>     }
> @@ -84,14 +87,13 @@ extern "C" fn close_callback<T: =
BaseDriverObject<U>, U: BaseObject>(
>     let file =3D unsafe {
>         drm::File::<<<U as IntoGEMObject>::Driver as =
drm::Driver>::File>::as_ref(raw_file)
>     };
> -    let obj =3D
> -        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_gem_obj(
> -            raw_obj,
> -        );
> -
> -    // SAFETY: `from_gem_obj()` returns a valid pointer as long as =
the type is correct and the
> -    // `raw_obj` we got is valid.
> -    T::close(unsafe { &*obj }, file);
> +    // SAFETY: `close_callback` is specified in the AllocOps =
structure for `Object<T>`, ensuring
> +    // that `raw_obj` is indeed contained within a `Object<T>`.
> +    let obj =3D unsafe {
> +        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as =
IntoGEMObject>::as_ref(raw_obj)
> +    };
> +
> +    T::close(obj, file);
> }
>=20
> impl<T: DriverObject> IntoGEMObject for Object<T> {
> @@ -101,9 +103,10 @@ fn into_gem_obj(&self) -> =
&Opaque<bindings::drm_gem_object> {
>         &self.obj
>     }
>=20
> -    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self =
{
> -        // SAFETY: All of our objects are Object<T>.
> -        unsafe { crate::container_of!(obj, Object<T>, obj).cast_mut() =
}
> +    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> =
&'a Self {
> +        // SAFETY: `obj` is guaranteed to be in an `Object<T>` via =
the safety contract of this
> +        // function
> +        unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
>     }
> }
>=20
> @@ -144,11 +147,25 @@ fn lookup_handle(
>     ) -> Result<ARef<Self>> {
>         // SAFETY: The arguments are all valid per the type =
invariants.
>         let ptr =3D unsafe { =
bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
> -        let ptr =3D <Self as IntoGEMObject>::from_gem_obj(ptr);
> -        let ptr =3D NonNull::new(ptr).ok_or(ENOENT)?;
>=20
> -        // SAFETY: We take ownership of the reference of =
`drm_gem_object_lookup()`.
> -        Ok(unsafe { ARef::from_raw(ptr) })
> +        // SAFETY:
> +        // - A `drm::Driver` can only have a single `File` =
implementation.
> +        // - `file` uses the same `drm::Driver` as `Self`.
> +        // - Therefore, we're guaranteed that `ptr` must be a gem =
object embedded within `Self`.
> +        // - And we check if the pointer is null befoe calling =
as_ref(), ensuring that `ptr` is a
> +        //   valid pointer to an initialized `Self`.
> +        // XXX: The expect lint here is to workaround
> +        // https://github.com/rust-lang/rust-clippy/issues/13024
> +        #[expect(clippy::undocumented_unsafe_blocks)]
> +        let obj =3D (!ptr.is_null())
> +            .then(|| unsafe { Self::as_ref(ptr) })
> +            .ok_or(ENOENT)?;
> +
> +        // SAFETY:
> +        // - We take ownership of the reference of =
`drm_gem_object_lookup()`.
> +        // - Our `NonNull` comes from an immutable reference, thus =
ensuring it is a valid pointer to
> +        //   `Self`.
> +        Ok(unsafe { ARef::from_raw(obj.into()) })
>     }
>=20
>     /// Creates an mmap offset to map the object from userspace.
> --=20
> 2.48.1
>=20
>=20

With the extra safety requirement,

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
