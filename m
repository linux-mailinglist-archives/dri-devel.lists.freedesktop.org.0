Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E029DB919
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 14:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D956A10ECB9;
	Thu, 28 Nov 2024 13:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="icyi0gsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645D010ECB5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 13:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732802096; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l+9m7rzrhCK/WwVoK1f2OozTwSgJw9qGNA8s1UrTumYtGbumRUcK2CApnz9gr0epiQhgYx+fc7u42Peb/n0XfLol1UFTGN6eUCTm0+YrR4iwR51rQEp8ojMwRYSVORRyqxhv6UvHdFib2jY3IFW1lOIoZZ9Is0dlIa3AO/kp5DA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732802096;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PoqsZLnhEF0znXNeMeDwKfsa/xTbLP8PvVVyRU6zuvI=; 
 b=nqyRxGBMOnsyTIRPiZwSCEJwatwrSGzvHPgibgr0KpRmPWuGIrPSn+0OWPjJKMIM3QkzD0QAJ0CFooKcpoxG/vtpLPfsz+Ryv63Nkd9GDy5Se7r5jH/EGGCemTmIEGjICpbgc+MTNgxB1BUyUAU8I6n4k38ur1rdh7FmYm4a+iE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732802096; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=PoqsZLnhEF0znXNeMeDwKfsa/xTbLP8PvVVyRU6zuvI=;
 b=icyi0gsGHOCYdgFdmY9KGqZkixFUsWtjIvIgIVyuNHxjhC6q89LuuBvDlbzMReYl
 mjTb7xYGuL3dDMh8w3b1Md1CKFLiTjGbog6bjtzlrjFu2m7lJr8hCh7I2nK+ME2R9kB
 +cCQMNoKVP3W5Vp/dqwe570CSgEQVXaF/KYZk/PE=
Received: by mx.zohomail.com with SMTPS id 1732802096009385.5779076930594;
 Thu, 28 Nov 2024 05:54:56 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 24/35] rust: drm/kms: Add RawCrtcState::active()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-25-lyude@redhat.com>
Date: Thu, 28 Nov 2024 10:54:41 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <628D2479-AC44-402C-B15D-CBE0927F7053@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-25-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.200.121)
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

> On 30 Sep 2024, at 20:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> A binding for checking drm_crtc_state.active.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/crtc.rs | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> index 43c7264402b07..ec9b58763dcca 100644
> --- a/rust/kernel/drm/kms/crtc.rs
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -496,6 +496,14 @@ fn crtc(&self) -> &Self::Crtc {
>         //   state
>         unsafe { <Self::Crtc as =
AsRawCrtc>::from_raw((*self.as_raw()).crtc) }
>     }
> +
> +    /// Returns whether or not the CRTC is active in this atomic =
state.
> +    fn active(&self) -> bool {
> +        // SAFETY: `active` and the rest of its containing bitfield =
can only be modified from the
> +        // atomic check context, and are invariant beyond that point =
- so our interface can ensure
> +        // this access is serialized
> +        unsafe { (*self.as_raw()).active }
> +    }
> }
> impl<T: AsRawCrtcState> RawCrtcState for T {}
>=20
> --=20
> 2.46.1
>=20
>=20


LGTM.

=E2=80=94 Daniel=
