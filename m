Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D9B3EAE0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 17:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A606F10E4D3;
	Mon,  1 Sep 2025 15:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KpZcuocW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D1F10E160;
 Mon,  1 Sep 2025 15:37:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756741050; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kGhneXmVXbR6/QfsJolRQDGhH48dehg/RmylKlOpuadFuZqXRIumn7Xv80GYgFFh0b/6jK3bB/ekrBS2G4mSfmY9iMgv322T9v5txORynQMxx0X46CLIIoK8pHC+QegFmusBjENR9XXeZE4tnOl9gWw8wOHYP58FWrdj+QiB7s8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756741050;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=J7yNOxJZhdfDkiP8jJZkUqR/tXFBeS7v4u5qWtcTUEY=; 
 b=HKAhVfOrzmyG5XLUQ0XJDV2MtCbypoEuvWQWY+4NYyRmjaGKyeTifj/bPLLX8bmvIZKDhUGFeg2WbHsPoVCZGnSlHKMXEcPfpJKAb9IKt0AyLiSDomNzAjHJv53687X5IbVHZ3uidTVBhE7jwpE1ZtE3g9oC6jH5huf3Zc6r4vc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756741050; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=J7yNOxJZhdfDkiP8jJZkUqR/tXFBeS7v4u5qWtcTUEY=;
 b=KpZcuocWTgw2nu+e2eochKKy2UEKN00BFb65rWUcDTSr5jeUUSquOBYJE7KGwZhM
 Du2wepEg4XMQswrwUOSyodSxJZmSMkC/3Fj6W7Q971Q2DctqMVxLFIAFD6k3f8mo44G
 HIfJx04iViT7NFpPXe1vmybQo3Urk5qkptmsUQgg=
Received: by mx.zohomail.com with SMTPS id 1756741048112173.95372647627437;
 Mon, 1 Sep 2025 08:37:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 01/14] rust: drm: gem: Simplify use of generics
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-2-lyude@redhat.com>
Date: Mon, 1 Sep 2025 12:37:10 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Asahi Lina <lina+kernel@asahilina.net>,
 "open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C036DE82-747A-4DCE-845F-CE832DA8991A@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-2-lyude@redhat.com>
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

Hi Lyude, thanks a lot for working on this! :)

> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Now that my rust skills have been honed, I noticed that there's a lot =
of
> generics in our gem bindings that don't actually need to be here. =
Currently
> the hierarchy of traits in our gem bindings looks like this:
>=20
>  * Drivers implement:
>    * BaseDriverObject<T: DriverObject> (has the callbacks)
>    * DriverObject (has the drm::Driver type)
>  * Crate implements:
>    * IntoGEMObject for Object<T> where T: DriverObject
>      Handles conversion to/from raw object pointers
>    * BaseObject for T where T: IntoGEMObject
>      Provides methods common to all gem interfaces
>=20
>  Also of note, this leaves us with two different drm::Driver =
associated
>  types:
>    * DriverObject::Driver
>    * IntoGEMObject::Driver
>=20
> I'm not entirely sure of the original intent here unfortunately (if =
anyone
> is, please let me know!), but my guess is that the idea would be that =
some
> objects can implement IntoGEMObject using a different ::Driver than
> DriverObject - presumably to enable the usage of gem objects from =
different
> drivers. A reasonable usecase of course.
>=20
> However - if I'm not mistaken, I don't think that this is actually how
> things would go in practice. Driver implementations are of course
> implemented by their associated drivers, and generally drivers are not
> linked to each-other when building the kernel. Which is to say that =
even in
> a situation where we would theoretically deal with gem objects from =
another
> driver, we still wouldn't have access to its drm::driver::Driver
> implementation. It's more likely we would simply want a variant of gem
> objects in such a situation that have no association with a
> drm::driver::Driver type.
>=20
> Taking that into consideration, we can assume the following:
> * Anything that implements BaseDriverObject will implement =
DriverObject
>  In other words, all BaseDriverObjects indirectly have an associated
>  ::Driver type - so the two traits can be combined into one with no
>  generics.
> * Not everything that implements IntoGEMObject will have an associated
>  ::Driver, and that's OK.
>=20
> And with this, we now can do quite a bit of cleanup with the use of
> generics here. As such, this commit:
>=20
> * Removes the generics on BaseDriverObject
> * Moves DriverObject::Driver into BaseDriverObject
> * Removes DriverObject
> * Removes IntoGEMObject::Driver
> * Add AllocImpl::Driver, which we can use as a binding to figure out =
the
>  correct File type for BaseObject
>=20
> Leaving us with a simpler trait hierarchy that now looks like this:
>=20
>  * Drivers implement: BaseDriverObject
>  * Crate implements:
>    * IntoGEMObject for Object<T> where T: DriverObject
>    * BaseObject for T where T: IntoGEMObject
>=20
> Which makes the code a lot easier to understand and build on :).
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V2:
> * Don't refer to Object<T> in callbacks, as this would result in =
drivers
>  getting the wrong gem object type for shmem gem objects once we add
>  support for those. Instead, we'll just add a type alias to clean this
>  part up.
> V3:
> * Fix nova compilation
> * Also, add an associated driver type to AllocImpl - as we still need =
the
>  current driver accessible from BaseObject so that we can use the =
driver's
>  various associated types, like File
> V4:

?

This is v3. Can you clarify this before we go further? :)

> * Add missing Object =3D Self constraint to type bounds for =
create_handle,
>  lookup_handle. I forgot that if drivers can have private gem objects =
with
>  a different data layout, we can only guarantee gem objects with =
handles
>  are of the same gem object type as the main one in use by the driver.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>

=E2=80=94 Daniel

