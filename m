Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A45A4B27B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 16:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A88189F4F;
	Sun,  2 Mar 2025 15:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zpv+ZJN+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B211989F4F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 15:03:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF1E25C5648
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 15:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A78C4CEF8
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740927838;
 bh=yKEyjVjrcZ07H0H/l2fXaHH3kRT0mUTfx7ZYWTJvsrs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Zpv+ZJN+pYf6vpFtD1qXkXbY8//W/77cBmoSU7sykIszFxrZ+3xkXbxzvgTEWBAGF
 A2nk+qP7wSCGjvexvvfNm+CW0nayj7O1d1M3taQ9gvF2IZjyE4FOHeSpJVu3bXwI7f
 YtL1z6Tqn8o/iyAL/aHRmSuB8MML3y0LPUgVV4Q8PyCroeFy16SJccIbONKZu02/gK
 awBxB7+nP1LxK0u7JIDtkZgB+iw4OgHOzL//MD3UT453Lyyex/pEJYO6eCrexDty/Z
 Az0b2wvdcmV8kMB5xAIgHysgX+wbXAa8EguESVqcF6gy7KcK9ZaZ/BX0va/GDIVSzM
 K1T8XwJmUlulw==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2fee05829edso1804853a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 07:03:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUi9g4kn3gz0ciF/QwaRw7Rrc6whKU2EQezCBfqiLPrdshp/o9o4FiYPLE0yRgZ+bsAImeiVr4jtbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxXg7q4SFqVDwOFLt6upl6GDqpxYy6I2bY5R33AFDV56C0Ska8
 gBewpu+8pX8bE12uczY7sbwgtuAonKTv25KEkNDDZMhsIhESNWiZLMEM9NmZwcv0O8Q9oEkpgnh
 P8YYqwxoN56rOHaxCB4ucW3msQA==
X-Google-Smtp-Source: AGHT+IFcggPNuy4DXBSberKRtq5j3TpP8ycVDoZHKl3XBUqSRO6lbtiDAuC4ZtjulRmLzqaolJxpQyXzSIZZGSZq2Ew=
X-Received: by 2002:a17:90b:3c02:b0:2fa:1029:f169 with SMTP id
 98e67ed59e1d1-2febabf406cmr17371736a91.33.1740927837148; Sun, 02 Mar 2025
 07:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
 <20250213-mem-cocci-v3-v1-4-93466d165349@redhat.com>
In-Reply-To: <20250213-mem-cocci-v3-v1-4-93466d165349@redhat.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 23:04:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9vqSTQBa2EkdBRiznxKG0nphisen1aCipQYN1qgHzrfg@mail.gmail.com>
X-Gm-Features: AQ5f1Jow8xnYudaM1cpXtjCz7_kHiw0p--GeKhar_Us_V5O0D7c-NQScsqvu7NU
Message-ID: <CAAOTY_9vqSTQBa2EkdBRiznxKG0nphisen1aCipQYN1qgHzrfg@mail.gmail.com>
Subject: Re: [PATCH 04/12] drm/mediatek: move to
 devm_platform_ioremap_resource() usage
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marek Vasut <marex@denx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi, Anusha:

Anusha Srivatsa <asrivats@redhat.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=888:20=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource(pdev,...);
> -ioremap_res =3D devm_ioremap_resource(...);
> +ioremap_res =3D devm_platform_ioremap_resource(pdev,0);

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_color.c | 4 +---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 +---
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 +---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 4 +---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 4 +---
>  drivers/gpu/drm/mediatek/mtk_dsi.c        | 4 +---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c       | 4 +---
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c   | 4 +---
>  8 files changed, 8 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/=
mediatek/mtk_disp_color.c
> index dd8433a38282a9ba1bcc3a4ddd01dd89738ccb60..39c7de4cdcc16b56a5a1d046a=
aabaf5580227ed2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> @@ -96,7 +96,6 @@ static int mtk_disp_color_probe(struct platform_device =
*pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_color *priv;
> -       struct resource *res;
>         int ret;
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -108,8 +107,7 @@ static int mtk_disp_color_probe(struct platform_devic=
e *pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->clk),
>                                      "failed to get color clk\n");
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->regs =3D devm_ioremap_resource(dev, res);
> +       priv->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(priv->regs))
>                 return dev_err_probe(dev, PTR_ERR(priv->regs),
>                                      "failed to ioremap color\n");
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/=
mediatek/mtk_disp_gamma.c
> index b17b11d93846f2019d8c4afb294375333e22dc42..8afd15006df2a21f3f52fe00e=
ca3c5501f4fb76a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -256,7 +256,6 @@ static int mtk_disp_gamma_probe(struct platform_devic=
e *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_gamma *priv;
> -       struct resource *res;
>         int ret;
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -268,8 +267,7 @@ static int mtk_disp_gamma_probe(struct platform_devic=
e *pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->clk),
>                                      "failed to get gamma clk\n");
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->regs =3D devm_ioremap_resource(dev, res);
> +       priv->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(priv->regs))
>                 return dev_err_probe(dev, PTR_ERR(priv->regs),
>                                      "failed to ioremap gamma\n");
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> index 563b1b248fbbb38ef03bb3e3ceecdd265961df60..b174dda091d3fbd16796e8e12=
8b030fccf5b902c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -306,7 +306,6 @@ static const struct component_ops mtk_disp_merge_comp=
onent_ops =3D {
>  static int mtk_disp_merge_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct resource *res;
>         struct mtk_disp_merge *priv;
>         int ret;
>
> @@ -314,8 +313,7 @@ static int mtk_disp_merge_probe(struct platform_devic=
e *pdev)
>         if (!priv)
>                 return -ENOMEM;
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->regs =3D devm_ioremap_resource(dev, res);
> +       priv->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(priv->regs))
>                 return dev_err_probe(dev, PTR_ERR(priv->regs),
>                                      "failed to ioremap merge\n");
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index df82cea4bb79c472acbb66e0df27fbad3e70bd20..d0581c4e3c999cf865fdd0aaf=
4c2f38dd404926e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -604,7 +604,6 @@ static int mtk_disp_ovl_probe(struct platform_device =
*pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_ovl *priv;
> -       struct resource *res;
>         int irq;
>         int ret;
>
> @@ -621,8 +620,7 @@ static int mtk_disp_ovl_probe(struct platform_device =
*pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->clk),
>                                      "failed to get ovl clk\n");
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->regs =3D devm_ioremap_resource(dev, res);
> +       priv->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(priv->regs))
>                 return dev_err_probe(dev, PTR_ERR(priv->regs),
>                                      "failed to ioremap ovl\n");
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index bf47790e4d6be5d60070c63c15c75fa201cc4b27..c9d41d75e7f2a3af5820921b7=
e563da377ce8d0d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -313,7 +313,6 @@ static int mtk_disp_rdma_probe(struct platform_device=
 *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_rdma *priv;
> -       struct resource *res;
>         int irq;
>         int ret;
>
> @@ -330,8 +329,7 @@ static int mtk_disp_rdma_probe(struct platform_device=
 *pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->clk),
>                                      "failed to get rdma clk\n");
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->regs =3D devm_ioremap_resource(dev, res);
> +       priv->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(priv->regs))
>                 return dev_err_probe(dev, PTR_ERR(priv->regs),
>                                      "failed to ioremap rdma\n");
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 40752f2320548fbf6c7de96b18e8a636ac9c31be..f298293471de49473dd059733=
83dc22f7d3b6c23 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1192,7 +1192,6 @@ static int mtk_dsi_probe(struct platform_device *pd=
ev)
>  {
>         struct mtk_dsi *dsi;
>         struct device *dev =3D &pdev->dev;
> -       struct resource *regs;
>         int irq_num;
>         int ret;
>
> @@ -1217,8 +1216,7 @@ static int mtk_dsi_probe(struct platform_device *pd=
ev)
>         if (IS_ERR(dsi->hs_clk))
>                 return dev_err_probe(dev, PTR_ERR(dsi->hs_clk), "Failed t=
o get hs clock\n");
>
> -       regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       dsi->regs =3D devm_ioremap_resource(dev, regs);
> +       dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(dsi->regs))
>                 return dev_err_probe(dev, PTR_ERR(dsi->regs), "Failed to =
ioremap memory\n");
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index ca82bc829cb96446d4d34eeef45848df03bd716b..d729c13590cb5ec176f15b680=
c262a26b677e6aa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1425,7 +1425,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi =
*hdmi,
>         struct device_node *cec_np, *remote, *i2c_np;
>         struct platform_device *cec_pdev;
>         struct regmap *regmap;
> -       struct resource *mem;
>         int ret;
>
>         ret =3D mtk_hdmi_get_all_clk(hdmi, np);
> @@ -1471,8 +1470,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi =
*hdmi,
>         }
>         hdmi->sys_regmap =3D regmap;
>
> -       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       hdmi->regs =3D devm_ioremap_resource(dev, mem);
> +       hdmi->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(hdmi->regs)) {
>                 ret =3D PTR_ERR(hdmi->regs);
>                 goto put_device;
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/me=
diatek/mtk_mdp_rdma.c
> index fc69ee38ce7d6a245a7460cfde8de426e83b2e80..7982788ae9df51f1a378d8d53=
8737f38af7299f2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -291,7 +291,6 @@ static const struct component_ops mtk_mdp_rdma_compon=
ent_ops =3D {
>  static int mtk_mdp_rdma_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct resource *res;
>         struct mtk_mdp_rdma *priv;
>         int ret =3D 0;
>
> @@ -299,8 +298,7 @@ static int mtk_mdp_rdma_probe(struct platform_device =
*pdev)
>         if (!priv)
>                 return -ENOMEM;
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->regs =3D devm_ioremap_resource(dev, res);
> +       priv->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(priv->regs))
>                 return dev_err_probe(dev, PTR_ERR(priv->regs),
>                                      "failed to ioremap rdma\n");
>
> --
> 2.47.0
>
