Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845079318ED
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 19:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBAE10E42D;
	Mon, 15 Jul 2024 17:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IPabq0Aj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F91410E42D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721063166;
 bh=MTzvTzAoatx0Q48KY1FTPa7YgzLwWXSImXnZ/96XLmY=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=IPabq0AjwORpneio+GIUvHaQSCAGrJxwa4XH0288QESrg/JDPfdvTcw0TIUoWZ+zh
 V5N3dU3vYbTpiOWgFuvvW+xi+p5Vttwj3LZAonH6q34e0XPPf8JyeBMxc+UJZOLzVw
 Kkbto8N2n9zDuxcu4Ds59NUVCVGXADRu58SbzVTkC1A+fxjyDI5IN2BZwaQHbYU0KW
 vZkOwKM7pVie7w36ao5c/3TipklCyhDNrI2XOUi5WUBvWQpsxcvZKoKca3r7c/VQMx
 xgqyd9e0ZaTO95kUmMtXsz9uLcEhkAh44XdJIT/BgNSBMn2F45vwYrrHCBNNNb7+bn
 juoK9dOvmCyQA==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7E4A23782193;
 Mon, 15 Jul 2024 17:06:02 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <ZpTl-uUbzmvHGMEH@phenom.ffwll.local>
Date: Mon, 15 Jul 2024 14:05:49 -0300
Cc: Danilo Krummrich <dakr@redhat.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 lyude@redhat.com, robh@kernel.org, lina@asahilina.net, mcanal@igalia.com,
 airlied@gmail.com, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <89FFB898-120A-431E-9B18-4D08AFAEFBFD@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <d7719653-f270-493d-ac42-6a1291eb7dc0@redhat.com>
 <ZpTl-uUbzmvHGMEH@phenom.ffwll.local>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailer: Apple Mail (2.3774.600.62)
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

Hi Sima!


>=20
> Yeah I'm not sure a partially converted driver where the main driver =
is
> still C really works, that pretty much has to throw out all the type
> safety in the interfaces.
>=20
> What I think might work is if such partial drivers register as full =
rust
> drivers, and then largely delegate the implementation to their =
existing C
> code with a big "safety: trust me, the C side is bug free" comment =
since
> it's all going to be unsafe :-)
>=20
> It would still be a big change, since all the driver's callbacks need =
to
> switch from container_of to upcast to their driver structure to some =
small
> rust shim (most likely, I didn't try this out) to get at the driver =
parts
> on the C side. And I think you also need a small function to downcast =
to
> the drm base class. But that should be all largely mechanical.
>=20
> More freely allowing to mix&match is imo going to be endless pains. We
> kinda tried that with the atomic conversion helpers for legacy kms
> drivers, and the impendance mismatch was just endless amounts of very
> subtle pain. Rust will exacerbate this, because it encodes semantics =
into
> the types and interfaces. And that was with just one set of helpers, =
for
> rust we'll likely need a custom one for each driver that's partially
> written in rust.
> -Sima
>=20

I humbly disagree here.

I know this is a bit tangential, but earlier this year I converted a =
bunch of codec libraries to Rust in v4l2. That worked just fine with the =
C codec drivers. There were no regressions as per our test tools.

The main idea is that you isolate all unsafety to a single point: so =
long as the C code upholds the safety guarantees when calling into Rust, =
the Rust layer will be safe. This is just the same logic used in unsafe =
blocks in Rust itself, nothing new really.

This is not unlike what is going on here, for example:


```
+unsafe extern "C" fn open_callback<T: BaseDriverObject<U>, U: =
BaseObject>(
+ raw_obj: *mut bindings::drm_gem_object,
+ raw_file: *mut bindings::drm_file,
+) -> core::ffi::c_int {
+ // SAFETY: The pointer we got has to be valid.
+ let file =3D unsafe {
+ file::File::<<<U as IntoGEMObject>::Driver as =
drv::Driver>::File>::from_raw(raw_file)
+ };
+ let obj =3D
+ <<<U as IntoGEMObject>::Driver as drv::Driver>::Object as =
IntoGEMObject>::from_gem_obj(
+ raw_obj,
+ );
+
+ // SAFETY: from_gem_obj() returns a valid pointer as long as the type =
is
+ // correct and the raw_obj we got is valid.
+ match T::open(unsafe { &*obj }, &file) {
+ Err(e) =3D> e.to_errno(),
+ Ok(()) =3D> 0,
+ }
+}
```

We have to trust that the kernel is passing in a valid pointer. By the =
same token, we can choose to trust drivers if we so desire.

> that pretty much has to throw out all the type
> safety in the interfaces.

Can you expand on that?

In particular, I believe that we should ideally be able to convert from =
a C "struct Foo * " to a Rust =E2=80=9CFooRef" for types whose lifetimes =
are managed either by the kernel itself or by a C driver. In practical =
terms, this has run into the issues we=E2=80=99ve been discussing in =
this thread, but there may be solutions e.g.:

> One thing that comes to my mindis , you could probably create some =
driver specific
> "dummy" types to satisfy the type generics of the types you want to =
use. Not sure
> how well this works out though.

I haven=E2=80=99t thought of anything yet - which is why I haven=E2=80=99t=
 replied. OTOH, IIRC, Faith seems to have something in mind that can =
work with the current abstractions, so I am waiting on her reply.


> What I think might work is if such partial drivers register as full =
rust
> drivers, and then largely delegate the implementation to their =
existing C
> code with a big "safety: trust me, the C side is bug free" comment =
since
> it's all going to be unsafe :-)

> with a big "safety: trust me, the C side is bug free" comment since =
it's all going to be unsafe :-)

This is what I want too :) but I can=E2=80=99t see how your proposed =
approach is better, at least at a cursory glance. It is a much bigger =
change, though, which is a clear drawback.

> And that was with just one set of helpers, for
> rust we'll likely need a custom one for each driver that's partially
> written in rust.

That=E2=80=99s exactly what I am trying to avoid. In other words, I want =
to find a way to use the same abstractions and the same APIs so that we =
do not run precisely into that problem.

=E2=80=94 Daniel

