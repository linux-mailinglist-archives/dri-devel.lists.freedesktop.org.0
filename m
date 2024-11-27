Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B769DADCE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 20:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA8B10E1D4;
	Wed, 27 Nov 2024 19:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Li2z0z9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765E810E1D4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 19:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732735584; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kTsdsC6upmSd6l9rP6fjrCIJTU8U+4weBu0WWXSZJsBh3ncMDkcl0uP+GF+aVS7f8lWclS4y/kVVXXhDrqefu1pZpa0cGwtqrQAsad9IuO7BneMQSu30sLxwtMHlSbV5/qPoQUYR27Esj+E+vv8C3efftJuUd1XS7jv9y4fLNUc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732735584;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RX2Qxk8Q8vCZMNnquh0zQky0kuIksspy8X4nlKr9Wa4=; 
 b=RU5OzG5/WYF0rooLuXFku7RZvN8EHAn4OM1AeFXhiTDMvs+0krCDxtCaqTDFZ/4QjsnEN/iJMg0KTm4WdndTj1GpA8FsD0R5cKspa49zADVKuyY50kCaAWQ31zBGbfSBJSqwpdn3MhQMxlRcJlEoKvcljvWvdzorvvngK6p8oRQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732735584; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=RX2Qxk8Q8vCZMNnquh0zQky0kuIksspy8X4nlKr9Wa4=;
 b=Li2z0z9TF8VTmmVVSPHSTt2M+wJTSea2pPKhQsaG7NSyCGjNOUmq9zqIEKC40vvl
 ubKC0N8n27ckA2rP0d1XIVEoM4KqqHpGXf7GZs7RW51zDYM9EnpkKQjc5aAcEXX04yM
 ht/l2gxmk3ReqSzQHyuyr8QHu6udKyJrrOoZ9yfg=
Received: by mx.zohomail.com with SMTPS id 1732735582329215.8868752125901;
 Wed, 27 Nov 2024 11:26:22 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 16/35] rust: drm/kms: Add RawConnector and
 RawConnectorState
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-17-lyude@redhat.com>
Date: Wed, 27 Nov 2024 16:26:06 -0300
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
Message-Id: <B8CBF3CE-1591-4624-816D-9A528B76E1B2@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-17-lyude@redhat.com>
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

> On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Now that we have more then one way to refer to connectors, we also =
want to

nit: typo here, s/then/than

> ensure that any methods which are common to any kind of connector type =
can
> be used on all connector representations. This is where RawConnector =
and
> RawConnectorState come in: we implement these traits for any type =
which
> implements AsRawConnector or AsRawConnectorState respectively.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/connector.rs | 34 ++++++++++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/connector.rs =
b/rust/kernel/drm/kms/connector.rs
> index 98ac7fb781d4e..f62740d7f6469 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -331,6 +331,27 @@ unsafe fn from_raw<'a>(ptr: *mut =
bindings::drm_connector) -> &'a Self {
>     }
> }
>=20
> +/// Common methods available on any type which implements =
[`AsRawConnector`].
> +///
> +/// This is implemented internally by DRM, and provides many of the =
basic methods for working with
> +/// connectors.
> +pub trait RawConnector: AsRawConnector {
> +    /// Return the index of this DRM connector
> +    #[inline]
> +    fn index(&self) -> u32 {
> +        // SAFETY: The index is initialized by the time we expose DRM =
connector objects to users,
> +        // and is invariant throughout the lifetime of the connector
> +        unsafe { (*self.as_raw()).index }
> +    }
> +
> +    /// Return the bitmask derived from this DRM connector's index
> +    #[inline]
> +    fn mask(&self) -> u32 {
> +        1 << self.index()
> +    }
> +}
> +impl<T: AsRawConnector> RawConnector for T {}
> +
> unsafe extern "C" fn connector_destroy_callback<T: DriverConnector>(
>     connector: *mut bindings::drm_connector,
> ) {
> @@ -523,6 +544,19 @@ pub trait FromRawConnectorState: =
AsRawConnectorState {
>     unsafe fn from_raw_mut<'a>(ptr: *mut =
bindings::drm_connector_state) -> &'a mut Self;
> }
>=20
> +/// Common methods available on any type which implements =
[`AsRawConnectorState`].
> +///
> +/// This is implemented internally by DRM, and provides many of the =
basic methods for working with
> +/// the atomic state of [`Connector`]s.
> +pub trait RawConnectorState: AsRawConnectorState {
> +    fn connector(&self) -> &Self::Connector {
> +        // SAFETY: This is guaranteed safe by type invariance, and =
we're guaranteed by DRM that
> +        // `self.state.connector` points to a valid instance of a =
`Connector<T>`
> +        unsafe { =
Self::Connector::from_raw((*self.as_raw()).connector) }
> +    }
> +}
> +impl<T: AsRawConnectorState> RawConnectorState for T {}
> +
> /// The main interface for a [`struct drm_connector_state`].
> ///
> /// This type is the main interface for dealing with the atomic state =
of DRM connectors. In
> --=20
> 2.46.1
>=20
>=20

LGTM,

=E2=80=94 Daniel

