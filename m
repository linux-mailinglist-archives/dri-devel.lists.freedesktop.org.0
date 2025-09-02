Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06CFB40E23
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41DF10E82C;
	Tue,  2 Sep 2025 19:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CCW3q19f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2F210E82C;
 Tue,  2 Sep 2025 19:53:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B18BF41812;
 Tue,  2 Sep 2025 19:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAF6C4CEED;
 Tue,  2 Sep 2025 19:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756842798;
 bh=EES9E4p0II9pKq1UKkB0kITaMd3S6hMDx8aHEP9YBYM=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=CCW3q19f1yy6u796iT5OMmZJMQLz+bWmn4U6nlUY7VzI2NWzyHxVfjszhxKJ93DmH
 ci8C/CpnQ5DDiJLgd0Q82xyrht1moay6Tn+b29iioYmVATBhO3UiDJ+yRVSBkmhSf/
 aNcG9zBu6bQpx7D4GL+hFKD50p6ue0RUxM8Rb6uTuLTDRT2adLnXhJQqRTIyl+md46
 ybLvLczL+ZeDR5e0Nb3f/1QyIQVX6Ow4VY5+gMGwOpbCvMS98XakCbuSiB4zsFDg+m
 kQFCbyjmGMUl+xAnJ/J4IBXXqtBKmBXqZn8emdVArub4WIhnBs/xk5elo0IQ/kz/+u
 lmO2IXDyaNg2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 21:53:12 +0200
Message-Id: <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
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

On Tue Sep 2, 2025 at 4:31 PM CEST, Alexandre Courbot wrote:
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 274989ea1fb4a5e3e6678a08920ddc76d2809ab2..1062014c0a488e959379f009c=
2e8029ffaa1e2f8 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -6,6 +6,8 @@
> =20
>  #[pin_data]
>  pub(crate) struct NovaCore {
> +    // Placeholder for the real `Gsp` object once it is built.
> +    pub(crate) gsp: (),
>      #[pin]
>      pub(crate) gpu: Gpu,
>      _reg: auxiliary::Registration,
> @@ -40,8 +42,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInf=
o) -> Result<Pin<KBox<Self
>          )?;
> =20
>          let this =3D KBox::pin_init(
> -            try_pin_init!(Self {
> +            try_pin_init!(&this in Self {
>                  gpu <- Gpu::new(pdev, bar)?,
> +                gsp <- {
> +                    // SAFETY: `this.gpu` is initialized to a valid valu=
e.
> +                    let gpu =3D unsafe { &(*this.as_ptr()).gpu };
> +
> +                    gpu.start_gsp(pdev)?
> +                },

Please use pin_chain() [1] for this.

More in general, unsafe code should be the absolute last resort. If we add =
new
unsafe code I'd love to see a comment justifying why there's no other way t=
han
using unsafe code for this, as we agreed in [2].

I did a quick grep on this series and I see 21 occurrences of "unsafe", if =
I
substract the ones for annotations and for FromBytes impls, it's still 9 ne=
w
ones. :(

Do we really need all of them?

Otherwise, I really like this, it's a great improvement over initializing
everything into the Gpu struct -- thanks for the refactoring!

[1] https://rust.docs.kernel.org/kernel/prelude/trait.PinInit.html#method.p=
in_chain
[2] https://docs.kernel.org/gpu/nova/guidelines.html#language
