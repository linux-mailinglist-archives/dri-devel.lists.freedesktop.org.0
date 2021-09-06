Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881C4016F3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 09:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B168897F5;
	Mon,  6 Sep 2021 07:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764CC897F5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 07:29:21 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mN948-0000Qj-Dr; Mon, 06 Sep 2021 09:29:16 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mN946-0005Cl-If; Mon, 06 Sep 2021 09:29:14 +0200
Message-ID: <d93c6866fb8a6e9bebf3b3ed6959e2c3abaf647d.camel@pengutronix.de>
Subject: Re: [PATCH v5 09/16] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie
 <airlied@linux.ie>,  Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,  "jason-jh
 . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com,  srv_heupstream@mediatek.com
Date: Mon, 06 Sep 2021 09:29:14 +0200
In-Reply-To: <20210906071539.12953-10-nancy.lin@mediatek.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-10-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nancy,

On Mon, 2021-09-06 at 15:15 +0800, Nancy.Lin wrote:
> MT8195 vdosys1 has more than 32 reset bits and a different reset base
> than other chips. Modify mmsys for support 64 bit and different reset
> base.
>=20
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h |  1 +
>  drivers/soc/mediatek/mtk-mmsys.c    | 15 ++++++++++++---
>  drivers/soc/mediatek/mtk-mmsys.h    |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/m=
t8195-mmsys.h
> index 648baaec112b..f67801c42fd9 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -123,6 +123,7 @@
>  #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
>  #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		(0 << 0)
> =20
> +#define MT8195_VDO1_SW0_RST_B           0x1d0
>  #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
>  #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
>  #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 060065501b8a..97cb26339ef6 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -18,6 +18,8 @@
>  #include "mt8365-mmsys.h"
>  #include "mt8195-mmsys.h"
> =20
> +#define MMSYS_SW_RESET_PER_REG 32
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =3D {
>  	.clk_driver =3D "clk-mt2701-mm",
>  	.routes =3D mmsys_default_routing_table,
> @@ -48,12 +50,14 @@ static const struct mtk_mmsys_driver_data mt8173_mmsy=
s_driver_data =3D {
>  	.clk_driver =3D "clk-mt8173-mm",
>  	.routes =3D mmsys_default_routing_table,
>  	.num_routes =3D ARRAY_SIZE(mmsys_default_routing_table),
> +	.sw_reset_start =3D MMSYS_SW0_RST_B,
>  };
> =20
>  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data =3D {
>  	.clk_driver =3D "clk-mt8183-mm",
>  	.routes =3D mmsys_mt8183_routing_table,
>  	.num_routes =3D ARRAY_SIZE(mmsys_mt8183_routing_table),
> +	.sw_reset_start =3D MMSYS_SW0_RST_B,
>  };
> =20
>  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =3D {
> @@ -74,6 +78,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys=
1_driver_data =3D {
>  	.num_routes =3D ARRAY_SIZE(mmsys_mt8195_routing_table),
>  	.config =3D mmsys_mt8195_config_table,
>  	.num_configs =3D ARRAY_SIZE(mmsys_mt8195_config_table),
> +	.sw_reset_start =3D MT8195_VDO1_SW0_RST_B,
>  };
> =20
>  struct mtk_mmsys {
> @@ -126,19 +131,23 @@ static int mtk_mmsys_reset_update(struct reset_cont=
roller_dev *rcdev, unsigned l
>  {
>  	struct mtk_mmsys *mmsys =3D container_of(rcdev, struct mtk_mmsys, rcdev=
);
>  	unsigned long flags;
> +	u32 offset;
>  	u32 reg;
>  	int i;
> =20
> +	offset =3D (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> +	id =3D id % MMSYS_SW_RESET_PER_REG;
> +
>  	spin_lock_irqsave(&mmsys->lock, flags);
> =20
> -	reg =3D readl_relaxed(mmsys->regs + MMSYS_SW0_RST_B);
> +	reg =3D readl_relaxed(mmsys->regs + mmsys->data->sw_reset_start + offse=
t);
> =20
>  	if (assert)
>  		reg &=3D ~BIT(id);
>  	else
>  		reg |=3D BIT(id);
> =20
> -	writel_relaxed(reg, mmsys->regs + MMSYS_SW0_RST_B);
> +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw_reset_start + offset)=
;
> =20
>  	spin_unlock_irqrestore(&mmsys->lock, flags);
> =20
> @@ -237,7 +246,7 @@ static int mtk_mmsys_probe(struct platform_device *pd=
ev)
>  	spin_lock_init(&mmsys->lock);
> =20
>  	mmsys->rcdev.owner =3D THIS_MODULE;
> -	mmsys->rcdev.nr_resets =3D 32;
> +	mmsys->rcdev.nr_resets =3D 64;

If only MT8195 vdosys1 has more than 32 reset bits, this should be kept
at 32 for the others.

regards
Philipp
