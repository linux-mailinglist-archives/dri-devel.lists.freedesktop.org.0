Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE6AEC74E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 15:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C69410E0CE;
	Sat, 28 Jun 2025 13:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BjPMCxxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE8510E0CE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 13:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751115932; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Cl6vz0LodRAmUXK9JWUe/DN6LGA+382mwGoCrJviPNChKqA14pBSJMnhuv0Id8bfoT8wJYxGh+px4hKzi9RBho/R+wBSrjh3rt4BqQJQHhkr1n0qg0qjYeAyFCr4UZfCtUb+ADzSy3iFxvbJQxbGxRwDhNq8ABFtAZpU5ATY4Lg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751115932;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jS0aPYFdSsYaI+kz+ozQfKMKnrgcBiBNEwXblPsLUnY=; 
 b=ii46Kbg/y9rHWkVjPUcPUt4qu7I6cHwriGkz4yVI40hqO51SiPuoiwKK4rcLjBGH5nUqr5QyB/o+mPvBNWaU2HunZC86UBIgvhRN1cCpcdDqqNImzP3Tn9CMBBmpSdNyRNizI1SCweqh0JfH4+qr/rM+AwyuQdBmEooZg0K1Idk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751115932; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=jS0aPYFdSsYaI+kz+ozQfKMKnrgcBiBNEwXblPsLUnY=;
 b=BjPMCxxJ2vMlult7S4dNIjqXP6mAT8ytwkJyX01p1jjmQ5fNiMt+Tani/ksoOVbn
 rpaovyPp3YJSyKzCE5j46u1hdQ9c/pcRxymIMDk+vOodGVqubLY/oKn+qGlTAp5+KiV
 sHKJhzpTAPfK0oUD9mc7y9oF3aSJ9J1uWkdhUut8=
Received: by mx.zohomail.com with SMTPS id 175111592984456.954539899633915;
 Sat, 28 Jun 2025 06:05:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Introduce Tyr
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
Date: Sat, 28 Jun 2025 10:05:11 -0300
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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

Hi Miguel,

> On 28 Jun 2025, at 06:44, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> Hi Daniel,
>=20
> Some procedural notes and general comments, and please note that some
> may apply several times.
>=20
> On Sat, Jun 28, 2025 at 12:35=E2=80=AFAM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> Signed-off-by: Rob Herring <robh@kernel.org>
>>=20
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>=20
> No newline.
>=20
>> [2]: =
https://gitlab.freedesktop.org/panfrost/linux/-/tree/tyr?ref_type=3Dheads
>=20
> The base commit seems to be the one in this branch, but the branch is
> a custom one that is not intended to land as-is, right?
>=20
> If all the patches are in the list already (like the regulator ones),
> then I would suggest putting the links to those instead. Otherwise, I
> would mark the patch as RFC, since it is not meant to be applied
> as-is.
>=20
> Maybe I am just missing context, and this is all crystal clear for
> everyone else, but normally patches are supposed to be candidates to
> be applied, possibly with other dependencies, all coming from the
> list.
>=20

The branch I shared is drm-misc-next plus a few dependencies, i.e.: 10 =
commits
total if I counted it correctly - all of which have been sent to the =
list
already and most of which have seen a quite a few iterations. I should =
have
explicitly said this, though.

Anyway, I thought that having a branch would be more tidy than listing =
them, as
the branch shows in what order they're applied and etc. For example, the =
patch
for read_poll_timeout was cherry-picked from Fujita's v12 series, and =
that was
subsequently dropped in v13 until the rest of the series was merged on =
v15. I
thought that referring to v12 of that series would be slightly =
confusing.

IOW: this should be appliable as soon as the dependencies themselves are
merged. I am hoping that this can happen on the 6.17 merge window as the
comments on most of them appear to be dying down so maybe the r-b's will =
start
coming soon. It also gives a user to read_poll_timeout(), which may =
prompt Fujita
to keep working on it.


>> +use core::pin::Pin
>  =20
> This should already be able to come from the prelude.
>=20
>> +/// Convienence type alias for the DRM device type for this driver
>=20
> "Convenience"

Yeah, it's a constant battle between having spelling check enabled =
(which on my
case flags the code itself, thereby producing a mountain of false =
positives) vs
not. In this case, the bad spelling won :)

Thanks for catching it, though.

>=20
> Also, please end comments/docs with periods.

Right

>=20
>> +unsafe impl Send for TyrData {}
>> +unsafe impl Sync for TyrData {}
>=20
> Clippy should catch this (orthogonal to what Danilo mentioned).
>=20
>> +use kernel::alloc::flags::*;
>=20
> Prelude covers this.
>=20
>> +// SAFETY:
>> +//
>> +// This type is the same type exposed by Panthor's uAPI. As it's =
declared as
>> +// #repr(C), we can be sure that the layout is the same. Therefore, =
it is safe
>> +// to expose this to userspace.
>=20
> If they are not bullets, please don't add newlines, i.e. you can start
> in the same line.
>=20
> Also, `#[repr(C)]`.
>=20
> Regarding the safety comment, it should explain how it covers the
> requirements of `AsBytes`:
>=20
>    Values of this type may not contain any uninitialized bytes. This
> type must not have interior mutability.
>=20
>> +#[allow(dead_code)]
>=20
> Could it be `expect`?

Hmm, I must say I did not know that this was a thing.

Why is it better than [#allow] during the development phase?

>=20
>> +/// Powers on the l2 block.
>> +pub(crate) fn l2_power_on(iomem: &Devres<IoMem>) -> Result<()> {
>=20
> -> Result
>=20
>> +#![allow(dead_code)]
>=20
> Could it be `expect`?
>=20
>> +    author: "The Tyr driver authors",
>=20
> Please use the `authors` key (this one is going away) -- with it now
> you could mention each author.
>=20
>> +#include<uapi/drm/panthor_drm.h>
>=20
> Missing space.
>=20
> Cheers,
> Miguel

=E2=80=94 Daniel

