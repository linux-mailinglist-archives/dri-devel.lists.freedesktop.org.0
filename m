Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29920890907
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 20:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5681120D4;
	Thu, 28 Mar 2024 19:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="VzVU3Au5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 961 seconds by postgrey-1.36 at gabe;
 Wed, 27 Mar 2024 21:06:51 UTC
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A003911203D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 21:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1711573609; x=1711832809;
 bh=tmh4P03wZoUNrmGMRDjppoh9LNoMf3SVixBqcaDEGJE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=VzVU3Au50Flw9LC5rZqT4ufKGY2RGvXVAD6wqVWwHR3g+HcKuyPqFqKLXbzMVNIq/
 bB/KSJNYpUi/Z9uUo2mwGyz8MjMqYGBe5jc1cJqmLrv1QFAHguXDxk6d0qkYeunOxu
 yeUvGtr0AHi/VaWcYtb5ay87EmGVyfvHjrFkKamyeukRgeUMu1taw1uUaeDgRjpTUx
 UO2Rj++2rE2fvIBpaBA5q2qI45its36ojMnA6d6wIyfaiNaHKw9ueUag5bfUOhoHUZ
 LPeJO0p9tpaHDHI3ay1MdoFAA5p2/DYsWAl0UBlhNCGAaZqWlwTfRpArIIoBEIm0r1
 Slcsdqv9eH/sw==
Date: Wed, 27 Mar 2024 21:06:42 +0000
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/4] WIP: drm: Introduce rvkms
Message-ID: <b41f707d-7e06-4c1a-93f0-d74ee242b650@proton.me>
In-Reply-To: <20240322221305.1403600-3-lyude@redhat.com>
References: <20240322221305.1403600-1-lyude@redhat.com>
 <20240322221305.1403600-3-lyude@redhat.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 28 Mar 2024 19:21:35 +0000
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

On 22.03.24 23:03, Lyude Paul wrote:
> diff --git a/drivers/gpu/drm/rvkms/connector.rs b/drivers/gpu/drm/rvkms/c=
onnector.rs
> new file mode 100644
> index 0000000000000..40f84d38437ee
> --- /dev/null
> +++ b/drivers/gpu/drm/rvkms/connector.rs
> @@ -0,0 +1,55 @@
> +// TODO: License and stuff
> +// Contain's rvkms's drm_connector implementation
> +
> +use super::{RvkmsDriver, RvkmsDevice, MAX_RES, DEFAULT_RES};
> +use kernel::{
> +    prelude::*,
> +    drm::{
> +        device::Device,
> +        kms::{
> +            connector::{self, ConnectorGuard},
> +            ModeConfigGuard
> +        }
> +    },
> +    prelude::*
> +};
> +use core::marker::PhantomPinned;
> +
> +#[pin_data]
> +pub(crate) struct DriverConnector {
> +    #[pin]
> +    _p: PhantomPinned
> +}

This struct does not need to be annotated with `#[pin_data]`, this
should just work:

pub(crate) struct DriverConnector;

> +
> +pub(crate) type Connector =3D connector::Connector<DriverConnector>;
> +
> +impl connector::DriverConnector for DriverConnector {
> +    type Initializer =3D impl PinInit<Self, Error>;
> +
> +    type State =3D ConnectorState;
> +
> +    type Driver =3D RvkmsDriver;
> +
> +    type Args =3D ();
> +
> +    fn new(dev: &Device<Self::Driver>, args: Self::Args) -> Self::Initia=
lizer {

And then here just return `Self`.

This works, since there is a blanket impl `PinInit<T, E> for T`.

Looking at how you use this API, I am not sure if you actually need
pin-init for the type that implements `DriverConnector`.
Do you need to store eg `Mutex<T>` or something else that needs
pin-init in here in a more complex driver?

--=20
Cheers,
Benno

> +        try_pin_init!(Self { _p: PhantomPinned })
> +    }
> +
> +    fn get_modes(
> +        connector: ConnectorGuard<'_, Self>,
> +        _guard: &ModeConfigGuard<'_, Self::Driver>
> +    ) -> i32 {
> +        let count =3D connector.add_modes_noedid(MAX_RES);
> +
> +        connector.set_preferred_mode(DEFAULT_RES);
> +        count
> +    }
> +}
> +
> +#[derive(Clone, Default)]
> +pub(crate) struct ConnectorState;
> +
> +impl connector::DriverConnectorState for ConnectorState {
> +    type Connector =3D DriverConnector;
> +}

