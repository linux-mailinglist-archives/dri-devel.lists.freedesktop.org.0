Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E18625B9D81
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 16:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A24E10EB54;
	Thu, 15 Sep 2022 14:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD6310EB4E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 14:40:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oYq2i-0006y0-Gv; Thu, 15 Sep 2022 16:40:40 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oYq2i-000uPh-VA; Thu, 15 Sep 2022 16:40:39 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oYq2g-0008Dt-Hm; Thu, 15 Sep 2022 16:40:38 +0200
Message-ID: <b3377fc111a704e8666cd6a71e2762dff63a6b75.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: don't truncate physical page address
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Thu, 15 Sep 2022 16:40:38 +0200
In-Reply-To: <20220915141941.3408991-1-l.stach@pengutronix.de>
References: <20220915141941.3408991-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Do, 2022-09-15 at 16:19 +0200, Lucas Stach wrote:
> While the interface for the MMU mapping takes phys_addr_t to hold a
> full 64bit address when necessary and MMUv2 is able to map physical
> addresses with up to 40bit, etnaviv_iommu_map() truncates the address
> to 32bits. Fix this by using the correct type.
>=20
> Fixes: 931e97f3afd8 ("drm/etnaviv: mmuv2: support 40 bit phys address")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.c
> index dc1aa738c4f1..2ff80d5ccf07 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -80,7 +80,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_conte=
xt *context, u32 iova,
> =C2=A0		return -EINVAL;
> =C2=A0
>=20
> =C2=A0	for_each_sgtable_dma_sg(sgt, sg, i) {
> -		u32 pa =3D sg_dma_address(sg) - sg->offset;
> +		phys_addr_t pa =3D sg_dma_address(sg) - sg->offset;
> =C2=A0		size_t bytes =3D sg_dma_len(sg) + sg->offset;
> =C2=A0
>=20
> =C2=A0		VERB("map[%d]: %08x %08x(%zx)", i, iova, pa, bytes);
                                    ^^^^                 ^^
Use %pap, &pa here?

regards
Philipp
