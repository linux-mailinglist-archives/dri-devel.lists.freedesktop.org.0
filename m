Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BAC98B6E7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 10:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5395810E605;
	Tue,  1 Oct 2024 08:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D0A10E18E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 08:27:53 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svYEU-0002XU-DN; Tue, 01 Oct 2024 10:27:46 +0200
Message-ID: <ca5e444a22bae0a834a673e41e8d5b93c08f2351.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Print error message if inserting IOVA
 address range fails
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 01 Oct 2024 10:27:45 +0200
In-Reply-To: <20240930221706.399139-1-sui.jingfeng@linux.dev>
References: <20240930221706.399139-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Sui,

Am Dienstag, dem 01.10.2024 um 06:17 +0800 schrieb Sui Jingfeng:
> Etnaviv assumes that GPU page size is 4KiB, yet on some systems, the CPU
> page size is 16 KiB. The size of etnaviv buffer objects will be aligned
> to CPU page size on kernel side, however, userspace still assumes the
> page size is 4KiB and doing allocation with 4KiB page as unit. This
> results in softpin(userspace managed per-process address spaces) fails.
> Because kernel side BO takes up bigger address space than user space
> assumes whenever the size of a BO is not CPU page size aligned.
>=20

Seems we need to track the GPU and CPU allocation sizes separately.
Userspace is correct in assuming that the GPU page size is 4K and
buffers are aligned to this granule. There should be no need to waste
GPU VA space just because the CPU page size is larger than that and we
need to overallocate buffers to suit the CPU.

> Insert an error message to help debug when such an issue happen.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
> For example, when running glmark2-drm:
>=20
> [kernel space debug log]
>=20
>  etnaviv 0000:03:00.0: Insert bo failed, va: fd38b000, size: 4000
>  etnaviv 0000:03:00.0: Insert bo failed, va: fd38a000, size: 4000
>=20
> [user space debug log]
>=20
> bo->va =3D 0xfd48c000, bo->size=3D100000
> bo->va =3D 0xfd38c000, bo->size=3D100000
> bo->va =3D 0xfd38b000, bo->size=3D1000   <-- Insert IOVA fails started at=
 here.
> bo->va =3D 0xfd38a000, bo->size=3D1000
> bo->va =3D 0xfd389000, bo->size=3D1000
>=20
> [texture] texture-filter=3Dnearest:MESA: error: etna_cmd_stream_flush:238=
: submit failed: -28 (No space left on device)
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.c
> index 1661d589bf3e..682f27b27d59 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -310,8 +310,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_conte=
xt *context,
>  	else
>  		ret =3D etnaviv_iommu_find_iova(context, node,
>  					      etnaviv_obj->base.size);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		dev_err(context->global->dev,
> +			"Insert iova failed, va: %llx, size: %zx\n",
> +			va, etnaviv_obj->base.size);

As this might happen for a lot of buffers in a single submit and
userspace might be unimpressed by the submit failure and keep pushing
new submits, this has a potential to spam the logs. Please use
dev_err_ratelimited. Other than that, this patch looks good.

Regards,
Lucas

>  		goto unlock;
> +	}
> =20
>  	mapping->iova =3D node->start;
>  	ret =3D etnaviv_iommu_map(context, node->start, sgt,

