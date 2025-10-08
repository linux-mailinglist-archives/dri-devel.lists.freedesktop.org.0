Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A3BC4520
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 12:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB6F10E1E6;
	Wed,  8 Oct 2025 10:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iqqNoT/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203CB10E1E6;
 Wed,  8 Oct 2025 10:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 421D760255;
 Wed,  8 Oct 2025 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CD1C4CEF4;
 Wed,  8 Oct 2025 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759919432;
 bh=AXcMqvG7cWe67YMt9/vHX2AYm8W1c2Xwkevu9/LVcgA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=iqqNoT/aMi/YEka2R9fqbhXzM6g7OQ3F8JZv1/EXkGXevjj/VkdLMnjYD8rnf59gn
 cTTPtm9/zxzcMRCP4HZk7f7lJeLzBXK8s4F2/Iif/dIusIkQP/2IuvttpkdhVGym0J
 pti/VdjbRO9en5lKB2V9n/4I3Ay5MkN0W/+7LGUJdQCHqU+uTWCcngcGkko7gxf6ih
 CMqjKg8iOzBDIxin/1aEHaGV7uuXfO6tTDN+Qr4OS80WOjJsHpqjtBRM759svJ3Vss
 Qz5etPE9MLXJLKor7BByDjHbJM4z2mtoFrfLnRonF9NGv5WdqEmFtDNfcigUIbbjSb
 USRw9mZj8hUNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 12:30:25 +0200
Message-Id: <DDCVDASJNW9T.BUT6XK1WXD0A@kernel.org>
Subject: Re: [PATCH v4 01/13] gpu: nova-core: Set correct DMA mask
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-2-apopple@nvidia.com>
In-Reply-To: <20251008001253.437911-2-apopple@nvidia.com>
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

On Wed Oct 8, 2025 at 2:12 AM CEST, Alistair Popple wrote:
> Set the correct DMA mask. Without this DMA will fail on some setups.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes for v4:
>  - Use a const (GPU_DMA_BITS) instead of a magic number
>
> Changes for v2:
>  - Update DMA mask to correct value for Ampere/Turing (47 bits)
> ---
>  drivers/gpu/nova-core/driver.rs | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index edc72052e27a..84fe4a45eb6a 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -3,6 +3,8 @@
>  use kernel::{
>      auxiliary, c_str,
>      device::Core,
> +    dma::Device,
> +    dma::DmaMask,
>      pci,
>      pci::{Class, ClassMask, Vendor},
>      prelude::*,
> @@ -20,6 +22,10 @@ pub(crate) struct NovaCore {
>  }
> =20
>  const BAR0_SIZE: usize =3D SZ_16M;
> +
> +// For now we only support Ampere which can use up to 47-bit DMA address=
es.
> +const GPU_DMA_BITS: u32 =3D 47;

IIRC, the idea was to abstract this properly with a subsequent patch worked=
 on
by John. In that case, please add a TODO.

>  pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> =20
>  kernel::pci_device_table!(
> @@ -57,6 +63,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo=
) -> Result<Pin<KBox<Self
>          pdev.enable_device_mem()?;
>          pdev.set_master();
> =20
> +        // SAFETY: No DMA allocations have been made yet

I think you forgot to address my comment from v2:

	It's not really about DMA allocations that have been made previously, ther=
e is
	no unsafe behavior in that.
=09
	It's about the method must not be called concurrently with any DMA allocat=
ion or
	mapping primitives.
=09
	Can you please adjust the comment correspondingly?

In general, I recommend having a look at the safety requirements of the
corresponding function.

NIT: Please end with a period.

> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_B=
ITS>())? };
> +
>          let devres_bar =3D Arc::pin_init(
>              pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/ba=
r0")),
>              GFP_KERNEL,
> --=20
> 2.50.1

