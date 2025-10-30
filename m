Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF8C20EBF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4B10E0BA;
	Thu, 30 Oct 2025 15:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1EC10E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:27:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1vEUYu-0000uH-HI; Thu, 30 Oct 2025 16:27:40 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1vEUYt-006EZI-2R;
 Thu, 30 Oct 2025 16:27:39 +0100
Received: from pza by lupine with local (Exim 4.98.2)
 (envelope-from <p.zabel@pengutronix.de>) id 1vEUYt-00000000CkU-2pWz;
 Thu, 30 Oct 2025 16:27:39 +0100
Message-ID: <89a86fc1c48f921aa3b06146f43a32dc58515548.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/tve: fix probe device leak
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 30 Oct 2025 16:27:39 +0100
In-Reply-To: <20250923151346.17512-1-johan@kernel.org>
References: <20250923151346.17512-1-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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

On Di, 2025-09-23 at 17:13 +0200, Johan Hovold wrote:
> Make sure to drop the reference taken to the DDC device during probe on
> probe failure (e.g. probe deferral) and on driver unbind.
>=20
> Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encode=
r (TVEv2)")
> Cc: stable@vger.kernel.org	# 3.10
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ip=
uv3/imx-tve.c
> index c5629e155d25..895413d26113 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> @@ -525,6 +525,13 @@ static const struct component_ops imx_tve_ops =3D {
>  	.bind	=3D imx_tve_bind,
>  };
> =20
> +static void imx_tve_put_device(void *_dev)
> +{
> +	struct device *dev =3D _dev;
> +
> +	put_device(dev);
> +}
> +
>  static int imx_tve_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -546,6 +553,11 @@ static int imx_tve_probe(struct platform_device *pde=
v)
>  	if (ddc_node) {
>  		tve->ddc =3D of_find_i2c_adapter_by_node(ddc_node);
>  		of_node_put(ddc_node);
> +
> +		ret =3D devm_add_action_or_reset(dev, imx_tve_put_device,
> +					       &tve->ddc->dev);

I think this needs to be wrapped in "if (tve->ddc) { }",
of_find_i2c_adapter_by_node() can return NULL.

regards
Philipp
