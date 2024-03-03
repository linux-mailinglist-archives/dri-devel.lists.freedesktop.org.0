Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C295686F67B
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 18:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C7810E961;
	Sun,  3 Mar 2024 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gl3mvHj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A55310E961
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 17:43:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2FF01CE08CA;
 Sun,  3 Mar 2024 17:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E43C433F1;
 Sun,  3 Mar 2024 17:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709487782;
 bh=qJ09RHZhZupJd0yUAMrg15L1EonazM6hfg7HvBc4dqU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gl3mvHj1LeSU+t+auF4ARJDUMTEiCum/A3TvDet9nk9H8ra5LejfpRm9zdDrE62fC
 lgTsPcPk2mVECDumxiceoujTh4tu/+EL0MWT0mOgD5/NZwu9bExDqwGj5uxJPKkuNP
 GBexCInsXs3vGrSMEDXEDndORFgB3DDIJsQocGMIfy8OVODdjAFba0V4sBeSf5FGHU
 r4CpDFiebw/m1qH7cEA2RY5wHXl5icL+7gnwBbqID1M3REqMbJvgn6iTI+kOvS0dOr
 /Tr+SpzjOdL8uRRiCujBcGkcJwPd25CwhM3/iV7CP5F8iBdRmM8qM0OafgKlj6kwFV
 ZO//USU2UeFgQ==
Date: Sun, 3 Mar 2024 17:42:45 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Paul Cercueil
 <paul@crapouillou.net>, Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich
 <Michael.Hennerich@analog.com>, <linux-doc@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v7 0/6] iio: new DMABUF based API
Message-ID: <20240303174245.37efc0b0@jic23-huawei>
In-Reply-To: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 23 Feb 2024 13:13:58 +0100
Nuno Sa <nuno.sa@analog.com> wrote:

> Hi Jonathan, likely you're wondering why I'm sending v7. Well, to be
> honest, we're hoping to get this merged this for the 6.9 merge window.
> Main reason is because the USB part is already in (so it would be nice
> to get the whole thing in). Moreover, the changes asked in v6 were simple
> (even though I'm not quite sure in one of them) and Paul has no access to
> it's laptop so he can't send v7 himself. So he kind of said/asked for me =
to do it.

So, we are cutting this very fine. If Linus hints strongly at an rc8 maybe =
we
can sneak this in. However, I need an Ack from Vinod for the dma engine cha=
nges first.

Also I'd love a final 'looks ok' comment from DMABUF folk (Ack even better!)

Seems that the other side got resolved in the USB gadget, but last we heard=
 form
Daniel and Christian looks to have been back on v5. I'd like them to confirm
they are fine with the changes made as a result.=20

I've been happy with the IIO parts for a few versions now but my ability to=
 review
the DMABUF and DMA engine bits is limited.

A realistic path to get this in is rc8 is happening, is all Acks in place b=
y Wednesday,
I get apply it and hits Linux-next Thursday, Pull request to Greg on Saturd=
ay and Greg
is feeling particularly generous to take one on the day he normally closes =
his trees.

Whilst I'll cross my fingers, looks like 6.10 material to me :(

I'd missed the progress on the USB side so wasn't paying enough attention. =
Sorry!

Jonathan

>=20
> v6:
>  * https://lore.kernel.org/linux-iio/20240129170201.133785-1-paul@crapoui=
llou.net/
>=20
> v7:
>  - Patch 1
>   * Renamed *device_prep_slave_dma_vec() -> device_prep_peripheral_dma_ve=
c();
>   * Added a new flag parameter to the function as agreed between Paul
>     and Vinod. I renamed the first parameter to prep_flags as it's suppos=
ed to
>     be used (I think) with enum dma_ctrl_flags. I'm not really sure how t=
hat API
>     can grow but I was thinking in just having a bool cyclic parameter (a=
s the
>     first intention of the flags is to support cyclic transfers) but ende=
d up
>     "respecting" the previously agreed approach.
> - Patch 2
>   * Adapted patch for the changes made in patch 1.
> - Patch 5
>   * Adapted patch for the changes made in patch 1.
>=20
> Patchset based on next-20240223.
>=20
> ---
> Paul Cercueil (6):
>       dmaengine: Add API function dmaengine_prep_peripheral_dma_vec()
>       dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec
>       iio: core: Add new DMABUF interface infrastructure
>       iio: buffer-dma: Enable support for DMABUFs
>       iio: buffer-dmaengine: Support new DMABUF based userspace API
>       Documentation: iio: Document high-speed DMABUF based API
>=20
>  Documentation/iio/dmabuf_api.rst                   |  54 +++
>  Documentation/iio/index.rst                        |   2 +
>  drivers/dma/dma-axi-dmac.c                         |  40 ++
>  drivers/iio/buffer/industrialio-buffer-dma.c       | 181 +++++++-
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c |  59 ++-
>  drivers/iio/industrialio-buffer.c                  | 462 +++++++++++++++=
++++++
>  include/linux/dmaengine.h                          |  27 ++
>  include/linux/iio/buffer-dma.h                     |  31 ++
>  include/linux/iio/buffer_impl.h                    |  33 ++
>  include/uapi/linux/iio/buffer.h                    |  22 +
>  10 files changed, 894 insertions(+), 17 deletions(-)
> ---
> base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
> change-id: 20240223-iio-dmabuf-5ee0530195ca
> --
>=20
> Thanks!
> - Nuno S=C3=A1
>=20

