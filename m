Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77AB44215
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 18:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099E710E045;
	Thu,  4 Sep 2025 16:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="HTPG9K+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B1E10E045
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 16:03:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757001827; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gtRAk0lbJpwRajce8c3ou1oyR8B31wR2xCsncDDpk8GWWo9WMbzxgocK0I+fqceiwPeueps6+YVZjEQSWzwgFfD4RiY3Z7jOjvOLUaQc7h/Dj3uluxYi7GAJsgvPs8XhUeNIAhEgS13wLVqgXBCEdWOBHMaGf+GspJRkaDMJC/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757001827;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rJ141p4G/KKeNp34zR+PuCIzRFG2OM4Vkt+bjATVJ9Q=; 
 b=e/PMtmWWs9xF3tc/vKdNOxlK9iw0XBjhurUgH3EAbAFnUNPzUK3Y3UErrizatqg0689i8WfjCKmny0dfgGc1m4fMTe1LDFBVmkXCA13RRwwVmHfuZjbUTCI5GQTNsiVJUfSByGYPuq1ffXvTKS34K1KTFfb2UEujHG6MK3bPTY4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757001827; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=rJ141p4G/KKeNp34zR+PuCIzRFG2OM4Vkt+bjATVJ9Q=;
 b=HTPG9K+B/NXU0PsSt1T7FkCP7HHqQ2Sj0WfyN3XKqSrDE+xU1QBCqbjex4lUf1Fs
 6cImP9GEyIwkDVO7/0OhbJRvwcg/ssoVtjiosxiIy4bdBle9yt3OV3jbkRiBRm32pbV
 UExPwukgNb8A2O8TWiJThBh3BBmYYN6AJ5y+jtqU=
Received: by mx.zohomail.com with SMTPS id 1757001825245717.3281844603312;
 Thu, 4 Sep 2025 09:03:45 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 11/14] rust: drm: gem: Introduce SGTableRef
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-12-lyude@redhat.com>
Date: Thu, 4 Sep 2025 13:03:27 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F97D14AA-2ADF-4D49-9F4B-418113F79562@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-12-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
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


Hi Lyude,

> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Currently we expose the ability to retrieve an SGTable for an shmem =
gem
> object using gem::shmem::Object::<T>::sg_table(). However, this only =
gives us a
> borrowed reference. This being said - retrieving an SGTable is a =
fallible
> operation, and as such it's reasonable that a driver may want to hold
> onto an SGTable for longer then a reference would allow in order to =
avoid
> having to deal with fallibility every time they want to access the =
SGTable.
> One such driver with this usecase is the Asahi driver.
>=20
> So to support this, let's introduce SGTableRef - which both holds a
> pointer to the SGTable and a reference to its respective GEM object in
> order to keep the GEM object alive for as long as the SGTableRef. The
> type can be used identically to a normal SGTable.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Rename OwnedSGTable to SGTableRef. Since the current version of the
>  SGTable abstractions now has a `Owned` and `Borrowed` variant, I =
think
>  renaming this to SGTableRef makes things less confusing.
>  We do however, keep the name of owned_sg_table() as-is.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/gem/shmem.rs | 50 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>=20
> diff --git a/rust/kernel/drm/gem/shmem.rs =
b/rust/kernel/drm/gem/shmem.rs
> index 6a8a392c3691b..1437cda27a22c 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -178,6 +178,22 @@ pub fn sg_table(&self) -> =
Result<&scatterlist::SGTable> {
>         Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
>     }
>=20
> +    /// Creates (if necessary) and returns an owned reference to a =
scatter-gather table of DMA pages
> +    /// for this object.
> +    ///
> +    /// This is the same as [`sg_table`](Self::sg_table), except that =
it instead returns a
> +    /// [`OwnedSGTable`] which holds a reference to the associated =
gem object.

This was forgotten ^

> +    ///
> +    /// This will pin the object in memory.
> +    pub fn owned_sg_table(&self) -> Result<SGTableRef<T>> {

owned_sg_table() returns SGTableRef. I do think this is confusing.

> +        Ok(SGTableRef {

Let=E2=80=99s call this shmem::SGTable, perhaps?

> +            sgt: self.sg_table()?.into(),
> +            // INVARIANT: We take an owned refcount to `self` here, =
ensuring that `sgt` remains
> +            // valid for as long as this `OwnedSGTable`.
> +            _owner: self.into(),
> +        })
> +    }
> +
>     /// Creates and returns a virtual kernel memory mapping for this =
object.
>     pub fn vmap(&self) -> Result<VMap<T>> {
>         let mut map: MaybeUninit<bindings::iosys_map> =3D =
MaybeUninit::uninit();
> @@ -309,3 +325,37 @@ fn drop(&mut self) {
> unsafe impl<T: DriverObject> Send for VMap<T> {}
> /// SAFETY: `iosys_map` objects are safe to send across threads.
> unsafe impl<T: DriverObject> Sync for VMap<T> {}
> +
> +/// An owned reference to a scatter-gather table of DMA address spans =
for a GEM shmem object.
> +///
> +/// This object holds an owned reference to the underlying GEM shmem =
object, ensuring that the
> +/// [`SGTable`] referenced by `SGTableRef` remains valid for the =
lifetime of this object.
> +///
> +/// # Invariants
> +///
> +/// - `sgt` is kept alive by `_owner`, ensuring it remains valid for =
as long as `Self`.
> +/// - `sgt` corresponds to the owned object in `_owner`.
> +/// - This object is only exposed in situations where we know the =
underlying `SGTable` will not be
> +///   modified for the lifetime of this object.
> +///
> +/// [`SGTable`]: scatterlist::SGTable
> +pub struct SGTableRef<T: DriverObject> {
> +    sgt: NonNull<scatterlist::SGTable>,

Didn=E2=80=99t Danilo & Abdiel introduce an owned SGTable variant?

> +    _owner: ARef<Object<T>>,
> +}
> +
> +// SAFETY: This object is only exposed in situations where we know =
the underlying `SGTable` will not
> +// be modified for the lifetime of this object.

We should perhaps say why is it valid to send SGTable to another thread =
here.

> +unsafe impl<T: DriverObject> Send for SGTableRef<T> {}
> +// SAFETY: This object is only exposed in situations where we know =
the underlying `SGTable` will not
> +// be modified for the lifetime of this object.
> +unsafe impl<T: DriverObject> Sync for SGTableRef<T> {}
> +
> +impl<T: DriverObject> Deref for SGTableRef<T> {
> +    type Target =3D scatterlist::SGTable;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Creating an immutable reference to this is safe =
via our type invariants.
> +        unsafe { self.sgt.as_ref() }

The as_ref() nomenclature remains in place to convert *mut T to &T? I =
thought
that had changed to from_raw().


> +    }
> +}
> --=20
> 2.50.0
>=20
>=20

