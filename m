Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FCDC81682
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 16:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E195710E246;
	Mon, 24 Nov 2025 15:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="RaVtnid6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287BD10E246
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 15:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763998989; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eFmxcoIMxnmeVY5DbhoRsZVhavz51fEOUjrKp6iqCJTQPVCNz+fqBL5LT2yH1jQiJ/xx4bbIIjhMRETBYC73VaMWmAxn/99iQqf/LIpHzuc5uYAVVoxPJdMcjV91ysMJXZ58qHA+DtbLQm6XYMYSMBde2MeLm9jHmfALpvqIsBg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763998989;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GugiLL3/rtrH8HTV3+2ct9rwL7Gy7JIiT78O4d3h9ho=; 
 b=TiQVB7RkisNUkGrwUgEWuLA6/tbleSZY48e3ChY17EV7I0H15RU+S/Np/DPD7h8+qFgpqVRnYrGIOrpYU85Sf7ug1YVr7/Zd0RSAwCCpC0ZcELdX+k+hVKtVlPKzkStViiEo5dAr9nyr2gVNRjYTGZcaa2pays4jT4MwgRbkOXQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763998989; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=GugiLL3/rtrH8HTV3+2ct9rwL7Gy7JIiT78O4d3h9ho=;
 b=RaVtnid6oxmG72uhwNHv7Zof6O9j4whb+6tzMvFioXTsTB9FY5JIiWTcyKmncmZn
 9ON0DHNiyOls/Bn4DFQQc9ru2vdoR0uiPIrd1QPeWRKFZYJNpzw4WvfaNnP8YJk1VBc
 53N8Nux2H6wNE5qw26p96LIobJsZB7kuyI20zsWw=
Received: by mx.zohomail.com with SMTPS id 1763998987629172.66116131321337;
 Mon, 24 Nov 2025 07:43:07 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 6/8] rust: drm: gem: Introduce shmem::SGTable
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251023212540.1141999-7-lyude@redhat.com>
Date: Mon, 24 Nov 2025 12:42:55 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2D03EE4-B93F-4C68-B3D0-35C77429E694@collabora.com>
References: <20251023212540.1141999-1-lyude@redhat.com>
 <20251023212540.1141999-7-lyude@redhat.com>
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



> On 23 Oct 2025, at 18:22, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Currently we expose the ability to retrieve an SGTable for an shmem =
gem
> object using gem::shmem::Object::<T>::sg_table(). However, this only =
gives
> us a borrowed reference. This being said - retrieving an SGTable is a
> fallible operation, and as such it's reasonable that a driver may want =
to
> hold onto an SGTable for longer then a reference would allow in order =
to
> avoid having to deal with fallibility every time they want to access =
the
> SGTable. One such driver with this usecase is the Asahi driver.
>=20
> So to support this, let's introduce shmem::SGTable - which both holds =
a
> pointer to the SGTable and a reference to its respective GEM object in
> order to keep the GEM object alive for as long as the shmem::SGTable. =
The
> type can be used identically to a normal SGTable.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Rename OwnedSGTable to shmem::SGTable. Since the current version of =
the
>  SGTable abstractions now has a `Owned` and `Borrowed` variant, I =
think
>  renaming this to shmem::SGTable makes things less confusing.
>  We do however, keep the name of owned_sg_table() as-is.
> V4:
> * Clarify safety comments for SGTable to explain why the object is
>  thread-safe.
> * Rename from SGTableRef to SGTable
>=20
> rust/kernel/drm/gem/shmem.rs | 50 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>=20
> diff --git a/rust/kernel/drm/gem/shmem.rs =
b/rust/kernel/drm/gem/shmem.rs
> index 45b95d60a3ec7..21ccb6c1824be 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -173,6 +173,25 @@ pub fn sg_table(&self) -> =
Result<&scatterlist::SGTable> {
>         // pointer to a scatterlist
>         Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
>     }
> +
> +    /// Creates (if necessary) and returns an owned reference to a =
scatter-gather table of DMA pages
> +    /// for this object.
> +    ///
> +    /// This is the same as [`sg_table`](Self::sg_table), except that =
it instead returns an
> +    /// [`shmem::SGTable`] which holds a reference to the associated =
gem object, instead of a
> +    /// reference to an [`scatterlist::SGTable`].
> +    ///
> +    /// This will pin the object in memory.
> +    ///
> +    /// [`shmem::SGTable`]: SGTable
> +    pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
> +        Ok(SGTable {
> +            sgt: self.sg_table()?.into(),
> +            // INVARIANT: We take an owned refcount to `self` here, =
ensuring that `sgt` remains
> +            // valid for as long as this `SGTable`.
> +            _owner: self.into(),
> +        })
> +    }
> }
>=20
> impl<T: DriverObject> Deref for Object<T> {
> @@ -223,3 +242,34 @@ impl<T: DriverObject> driver::AllocImpl for =
Object<T> {
>         dumb_map_offset: None,
>     };
> }
> +
> +/// An owned reference to a scatter-gather table of DMA address spans =
for a GEM shmem object.
> +///
> +/// This object holds an owned reference to the underlying GEM shmem =
object, ensuring that the
> +/// [`scatterlist::SGTable`] referenced by this type remains valid =
for the lifetime of this object.
> +///
> +/// # Invariants
> +///
> +/// - `sgt` is kept alive by `_owner`, ensuring it remains valid for =
as long as `Self`.
> +/// - `sgt` corresponds to the owned object in `_owner`.
> +/// - This object is only exposed in situations where we know the =
underlying `SGTable` will not be
> +///   modified for the lifetime of this object. Thus, it is safe to =
send/access this type across
> +///   threads.
> +pub struct SGTable<T: DriverObject> {
> +    sgt: NonNull<scatterlist::SGTable>,
> +    _owner: ARef<Object<T>>,
> +}
> +
> +// SAFETY: This object is thread-safe via our type invariants.
> +unsafe impl<T: DriverObject> Send for SGTable<T> {}
> +// SAFETY: This object is thread-safe via our type invariants.
> +unsafe impl<T: DriverObject> Sync for SGTable<T> {}
> +
> +impl<T: DriverObject> Deref for SGTable<T> {
> +    type Target =3D scatterlist::SGTable;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Creating an immutable reference to this is safe =
via our type invariants.
> +        unsafe { self.sgt.as_ref() }
> +    }
> +}
> --=20
> 2.51.0
>=20

Same comment as last patch.

=E2=80=94 Daniel

