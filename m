Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB89AE05D1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ED910EA15;
	Thu, 19 Jun 2025 12:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VoHlUAZa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB9810EA15
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750336237; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iCsTtb8q3IZo2K9h8bglVi0t1xDkMSSOn2Sm6ziAeDuT1xRGFjqgPhwJrEdxOEM43hfRqpi9s4Vqx2vMqJKBxbNjJ9xYoEcOLyyvVcikxkUZNvbS08I+4IGWsKvrfd4nUw4+GNq+I/7+nYDM8pnnNlwyVjmwCeBgd0gf2UPHdXc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750336237;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ELpfdZD9/tqKi/aPIHiSn6Ngwux31l7JD86X6k6ZqBk=; 
 b=adFLry38Fmc1XcAkCrsePNrg0P8k5Egrx8/zqfSrNz0sWU5e0qV9sPug8sbpLEYb9ulgoIFxMg1xg8YwxobQEi/HOkrei6DE3cy8QOiz9oAKkX7pG33EnOJobejHOHF9bNtONSTjUy9nJ8BTSokZsyEv6zb/89Ie00OCn27eDnY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750336237; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ELpfdZD9/tqKi/aPIHiSn6Ngwux31l7JD86X6k6ZqBk=;
 b=VoHlUAZaZ0N0edr8Q/5E05NK400CB9c6/5zXOVE26QHtHJF/iswy2JxhBvmpRmmh
 guBv9JhtU+wiqp9839l3qvLdFftfEJzSxh1qpJk3FUbVxulcUbKpP4BMJ0aJbqci/rM
 ULiHhwBeq88jKWzDwYb7mPRYgv60L5MwyJQoeX2A=
Received: by mx.zohomail.com with SMTPS id 1750336235323548.4237453637628;
 Thu, 19 Jun 2025 05:30:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250619102102.750668-1-beata.michalska@arm.com>
Date: Thu, 19 Jun 2025 09:30:19 -0300
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org,
 aliceryhl@google.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <54E44DF8-1192-47B4-A9E3-5891D4BD7424@collabora.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
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

Hi Beata,

> On 19 Jun 2025, at 07:21, Beata Michalska <beata.michalska@arm.com> =
wrote:
>=20
> With the Opaque<T>, the expectations are that Rust should not make any
> assumptions on the layout or invariants of the wrapped C types.
> That runs rather counter to ioctl arguments, which must adhere to
> certain data-layout constraints. By using Opaque<T>, ioctl handlers
> end up doing unsound castings, which adds needless complexity and
> maintenance overhead, brining no safety benefits.

I don=E2=80=99t think that =E2=80=9Cunsound casts=E2=80=9D is what is =
happening here.

It's mostly the barrage of unsafe blocks to dereference the inner T for =
a
problem that does not exist.

> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
>=20
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>=20
> Additional comments:
> - UAPI types already automatically derive MaybeZeroable,
>   so it probably makes little sense to add any verification for that
> - FromBytes is pending, but due to the orphan rule, adding =
verification
>   of it being implemented for IOCTL args here is pointless

Even with this missing, I don=E2=80=99t see a problem with this patch.

In fact, if anything, the result of the discussion so far seems to point
towards automatically implementing FromBytes for all uapi types.


> - Verifying pointer alignment could make use of strict_provenance,
>   but that one is unstable and I am not sure what are the exact rules
>   here for using those. Without that one though, verifying alignment =
in
>   some cases (i.e. pointer tagging) might require more extensive =
changes.
>   Happy to deal with either.
>=20
> rust/kernel/drm/ioctl.rs | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index 445639404fb7..12b296131672 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -139,7 +139,7 @@ pub mod internal {
>                             // asserted above matches the size of this =
type, and all bit patterns of
>                             // UAPI structs must be valid.
>                             let data =3D unsafe {
> -                                &*(raw_data as *const =
$crate::types::Opaque<$crate::uapi::$struct>)
> +                                &mut *(raw_data as *mut =
$crate::uapi::$struct)
>                             };
>                             // SAFETY: This is just the DRM file =
structure
>                             let file =3D unsafe { =
$crate::drm::File::as_ref(raw_file) };
> --=20
> 2.25.1
>=20
>=20

=E2=80=94 Daniel=20

