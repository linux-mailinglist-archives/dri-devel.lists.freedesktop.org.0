Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E36A2AD6C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 17:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95CD10E303;
	Thu,  6 Feb 2025 16:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dYCFPFSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2C210E303
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 16:13:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23F095C64A4;
 Thu,  6 Feb 2025 16:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07F8C4CEDD;
 Thu,  6 Feb 2025 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738858425;
 bh=yugtap81E+1XEiUSlot9N/ao/3tXx/zIxbLqkf5yQ2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYCFPFSLLiDASvYd4s42uud1DtC2OYpyDgEeLT35r+DrvE2jij76XmTWQ9G67IkkY
 GXlKlZixxwv1mXchRyKAC2XLHInGz7nXltb/sepWggEKQB2TlbKf/zl7RmfFuI/bgH
 POQtLfiwx3vOBe+qHPtYDAHCNvMvnzxOt413CP2Ky6rkPlhy2ILdMwAJlRvRLqD0vj
 Zr7POyxFiXm5+iQmgkdVq1+ZtMEZUnmtN8vK+HRSG+ejF6wz2rbhMHSIENz/QYTel5
 LTPtPbUTgV8Ae2h5Vlge1PtDZVU6vqHxlAMGJQmuO06gQkxOszYi8GtT6wvI2wkZns
 f+nG5+ZFP0G5A==
Date: Thu, 6 Feb 2025 17:13:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
Message-ID: <20250206-hallowed-ultra-tiger-cfec8e@houat>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nds2ddkwji5fimma"
Content-Disposition: inline
In-Reply-To: <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
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


--nds2ddkwji5fimma
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> //(devm_)ioremap/devm_platform_ioremap_resource.
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> <+...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> ...+>
>=20
> v2: Change the SmPl patch to work on multiple occurences of
> the pattern. This also fixes the compilation error.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Ma=EDra Canal <mcanal@igalia.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 55 +++++++++++-------------------------=
------
>  1 file changed, 14 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c=
573d80ce7c88595 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct drm_dev=
ice *drm,
>  {
>  	struct platform_device *pdev =3D vc4_hdmi->pdev;
>  	struct device *dev =3D &pdev->dev;
> -	struct resource *res;
>  	int ret;
> =20
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi");
> -	if (!res)
> -		return -ENODEV;
> -
> -	vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> -					       resource_size(res));
> +	vc4_hdmi->hdmicore_regs =3D devm_platform_ioremap_resource_byname(pdev,
> +									"hdmi");
>  	if (!vc4_hdmi->hdmicore_regs)
>  		return -ENOMEM;
> =20
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
> -	if (!res)
> -		return -ENODEV;
> -
> -	vc4_hdmi->hd_regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	vc4_hdmi->hd_regs =3D devm_platform_ioremap_resource_byname(pdev, "hd");
>  	if (!vc4_hdmi->hd_regs)
>  		return -ENOMEM;

I *think* that one is shared between both HDMI controllers on the
RaspberryPi4, so we can't claim them from both instances. We should add
a comment there to document that it's on purpose.

The rest looks good.

Maxime

--nds2ddkwji5fimma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6TftgAKCRAnX84Zoj2+
drfXAYDBINKHBSckIuo/kq/HoUvq16io0SUMaLB/CVkeidnE3EXaDz9M3WhZ60Ha
n8d4HmABf0i2bHqp4iPr3Cr3YiSEnV9zX0sFLdFl/FejJMglsT19c+7lwsGMwuaH
8nnPGZ1q6A==
=1kXI
-----END PGP SIGNATURE-----

--nds2ddkwji5fimma--
