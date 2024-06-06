Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF98FE6D6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 14:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7A410E93B;
	Thu,  6 Jun 2024 12:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 989 seconds by postgrey-1.36 at gabe;
 Thu, 06 Jun 2024 12:52:26 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BBF10E93B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 12:52:26 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vw3gN4y7Vz6K9Hc;
 Thu,  6 Jun 2024 20:34:40 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 8FE3C1408F9;
 Thu,  6 Jun 2024 20:35:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 6 Jun
 2024 13:35:52 +0100
Date: Thu, 6 Jun 2024 13:35:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: Don't print error if EDEFER_PROBE
 returned on component_add
Message-ID: <20240606133551.00007d14@Huawei.com>
In-Reply-To: <20240605-mtk-disp-rdma-dev-err-probe-v1-1-91259e1d3a93@collabora.com>
References: <20240605-mtk-disp-rdma-dev-err-probe-v1-1-91259e1d3a93@collabora.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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

On Wed, 05 Jun 2024 12:50:25 -0400
N=EDcolas F. R. A. Prado <nfraprado@collabora.com> wrote:

> Use dev_err_probe() in the component_add() error path to prevent
> printing an error when the probe is deferred. This was observed on
> mt8195 with the disp-rdma driver:
>=20
>   mediatek-disp-rdma 1c002000.rdma: Failed to add component: -517
>=20
> But the same pattern is used across many other drivers, so update them
> all.
>=20
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c         | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_color.c       | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c       | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c       | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c        | 2 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c            | 2 +-
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/me=
diatek/mtk_disp_aal.c
> index 3ce8f32b06d5..892dc40458fb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -197,7 +197,7 @@ static int mtk_disp_aal_probe(struct platform_device =
*pdev)
> =20
>  	ret =3D component_add(dev, &mtk_disp_aal_component_ops);
>  	if (ret)
> -		dev_err(dev, "Failed to add component: %d\n", ret);
> +		dev_err_probe(dev, ret, "Failed to add component\n");
Perhaps
		return dev_err_probe(...)

	return 0;

Whilst I can see you are focused on this one problem case, it
might be better to use dev_err_probe() for all the similar
cases earlier in these functions.

Then that return dev_err_probe() pattern will make more sense
as it will be consistent with all the other calls.
