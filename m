Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A87A9DAA06
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 15:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BE010EAE7;
	Wed, 27 Nov 2024 14:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="aa+V5kB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952BF10EAE7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 14:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732718613; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NOI6dDP3D2TjL1boOmDGAU+aw0ARWRV9GO8H5F/7MMrWrS7SyaNakYH0kpFBcstUia9aJDkK31p5OI1b6LZCBFxfrvL+JHUuQMZET/rNOGSa3E8/tg4T8jtjgLAhi8P37YUhANfgFNnQ1SxAw8us76Nq2Dfg4FOmUESt7qvie3k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732718613;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oTwTz0AGCDwSgvoHUUyLYZrH4mlX58t6JryU8TBBMTY=; 
 b=YX4h1nFwzjRIFl3ucnw7h9kxVgwaLIMswS5MnShdnXzkQG+RNLQ1QC3e9NsoxXtvmZEm66gllSU1mK4kEEkHGbivFPYNNddOtRpzOglPYA5fxpHL/1rdHl3DJTKe8oxs5i2loFmzc3e/89I0ijmihIvaZi+zhXtKgl7r8q4nyQA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732718613; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=oTwTz0AGCDwSgvoHUUyLYZrH4mlX58t6JryU8TBBMTY=;
 b=aa+V5kB2LKz3uonZgIzaptffnNhXkFYrrjFOXUumxp4/bWbEfYsoDK5RRNXCWUT2
 yW+P8viqvYoU5KK9UA9cdyi4OuL42IgUokcPpeF4b0QMZVOLfwXEHP4vVSd9tTcEI2+
 COrW1Atp5V+erePZPxJfnxmbjd7LCsIdXTzxQJJc=
Received: by mx.zohomail.com with SMTPS id 1732718613236384.9475704770982;
 Wed, 27 Nov 2024 06:43:33 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 09/35] WIP: rust: drm/kms: Add
 Connector.attach_encoder()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-10-lyude@redhat.com>
Date: Wed, 27 Nov 2024 11:43:18 -0300
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
Message-Id: <5C141885-C8D3-4CD9-8919-683D1DFE4AB3@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-10-lyude@redhat.com>
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

Hi Lyude

> On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This adds a simple binding for completing the last step of creating a =
DRM
> connector - attaching its encoder. This function should only be called
> before the connector is registered, and DRM should enforce this itself =
by
> returning an error if a driver tries to add an encoder to an
> already-registered DRM connector.
>=20
> Note that unlike most of the methods we'll be adding to DRM mode =
objects,
> this is directly implemented on the Connector<T> type since I don't =
really
> think it would make sense for us to allow this operation on an
> OpaqueConnector (a DRM connector without a known DriverConnector
> implementation, something we'll be adding in the next few commits).
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> TODO:
> * Figure out a solution for making sure that this can only be called =
when a
>  Connector is unregistered, probably via an UnregisteredConnector =
type.
>=20

Either that, or via the typestate pattern. But I think a =
UnregisteredConnector type
will work fine based on your previous UnregisteredKmsDevice.

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/connector.rs | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/connector.rs =
b/rust/kernel/drm/kms/connector.rs
> index 0fa927a3743b2..54457b327c365 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -28,6 +28,7 @@
> use super::{
>     ModeObject,
>     RcModeObject,
> +    encoder::*,
>     KmsDriver,
> };
> use macros::pin_data;
> @@ -227,6 +228,20 @@ pub fn new(
>             =
ARef::from_raw(NonNull::new_unchecked(Box::into_raw(Pin::into_inner_unchec=
ked(new))))
>         })
>     }
> +
> +    /// Attach an encoder to this [`Connector`].
> +    ///
> +    /// TODO: Move this to an `UnregisteredConnector` interface =
somehow=E2=80=A6
> +    #[must_use]
> +    pub fn attach_encoder<E>(&self, encoder: &Encoder<E>) -> Result
> +    where
> +        E: DriverEncoder<Driver =3D T::Driver>
> +    {
> +        // SAFETY: FFI call with no special requirements
> +        to_result(unsafe {
> +            bindings::drm_connector_attach_encoder(self.as_raw(), =
encoder.as_raw())
> +        })
> +    }
> }
>=20
> /// A trait implemented by any type that acts as a [`struct =
drm_connector`] interface.
> --=20
> 2.46.1
>=20
>=20

LGTM.

=E2=80=94 Daniel

