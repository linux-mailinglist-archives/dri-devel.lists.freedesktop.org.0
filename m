Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F650DD6A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 12:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3DC10E0B4;
	Mon, 25 Apr 2022 10:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830A810E0B4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 10:00:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivVw-0001AZ-Kr; Mon, 25 Apr 2022 12:00:16 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivVv-0057YD-Bh; Mon, 25 Apr 2022 12:00:13 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivVt-0005AB-9C; Mon, 25 Apr 2022 12:00:13 +0200
Message-ID: <0e642da615b8f52fb36cd1248f8a124ea4e4b7b8.camel@pengutronix.de>
Subject: Re: [PATCH v17 14/21] drm/mediatek: add ETHDR support for MT8195
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, wim@linux-watchdog.org,  AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, linux@roeck-us.net
Date: Mon, 25 Apr 2022 12:00:13 +0200
In-Reply-To: <20220416020749.29010-15-nancy.lin@mediatek.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-15-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sa, 2022-04-16 at 10:07 +0800, Nancy.Lin wrote:
> ETHDR is a part of ovl_adaptor.
> ETHDR is designed for HDR video and graphics conversion in the external
> display path. It handles multiple HDR input types and performs tone
> mapping, color space/color format conversion, and then combine
> different layers, output the required HDR or SDR signal to the
> subsequent display path.
>=20
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
[...]
> +static int mtk_ethdr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mtk_ethdr *priv;
> +	int ret;
> +	int i;
> +
> +	dev_info(dev, "%s+\n", __func__);

Left-over debug statements?

> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < ETHDR_ID_MAX; i++) {
> +		priv->ethdr_comp[i].dev =3D dev;
> +		priv->ethdr_comp[i].regs =3D of_iomap(dev->of_node, i);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +		ret =3D cmdq_dev_get_client_reg(dev,
> +					      &priv->ethdr_comp[i].cmdq_base, i);
> +		if (ret)
> +			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv->ethdr_comp[i].regs, i)=
;
> +	}
> +
> +	for (i =3D 0; i < ETHDR_CLK_NUM; i++)
> +		priv->ethdr_clk[i].id =3D ethdr_clk_str[i];
> +	ret =3D devm_clk_bulk_get_optional(dev, ETHDR_CLK_NUM, priv->ethdr_clk)=
;
> +	if (ret)
> +		return ret;
> +
> +	priv->irq =3D platform_get_irq(pdev, 0);
> +	if (priv->irq < 0)
> +		priv->irq =3D 0;
> +
> +	if (priv->irq) {
> +		ret =3D devm_request_irq(dev, priv->irq, mtk_ethdr_irq_handler,
> +				       IRQF_TRIGGER_NONE, dev_name(dev), priv);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
> +			return ret;
> +		}
> +	}
> +
> +	priv->reset_ctl =3D devm_reset_control_array_get_optional_exclusive(dev=
);

This is missing error handling. You could use dev_err_probe() here.

regards
Philipp
