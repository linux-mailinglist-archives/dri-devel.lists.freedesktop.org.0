Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D2869A6AD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC9110E435;
	Fri, 17 Feb 2023 08:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F3F10E435
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676621564; x=1708157564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PM5xRak9MR7lO66pidCVY/0E20TFwyicvlQ69LhWtJw=;
 b=TotQ+Zt9G1BfcOvONB0VNiL8JYZ+gwqslla3QNMgOGhkOPYnsDpuHYlh
 +dob00kYxpDOIcXKeaHC3Dp3RVYZBrCrdBGXS1AhZGtVNQSWhBjx5Fez7
 joCkqF0sZjpsrLPAQTievZ65/peBCBUdFiTujkqEhNs82VgxAbXlDdHcM
 /HlExiEpQsZqwfvpeLe+fGveA1HqJjTqvYcohqOlcIHJWplsImWbYyz63
 6JS8DunBky+wiVO77Ik5zDp+BDTKU62T+PP4sU+GGv+uXtRfIeTIEM0VI
 9gVMYh72eD6+0PeYJ5xVvQ5YO05q4PoLPdw/ELqlmZvh3rIpjOh80Q1U4 g==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; d="scan'208";a="29147991"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 09:12:42 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 17 Feb 2023 09:12:42 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 09:12:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676621562; x=1708157562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PM5xRak9MR7lO66pidCVY/0E20TFwyicvlQ69LhWtJw=;
 b=YHmXP3CsOrjeXp2b67hu04Kk9wTPg+bTT4dzmpCG6gdcTZbpts8V6fRV
 TP2ddeHQzYVY/MmOgTR6Kp7S5/6JWoVJbJdFyZRBOeEZ1SHN4lOblMq/D
 eBUPGoQOrj8KJeueK3Kn1WZyG0CrhIhdoO2mp+L8wKJkcIwitagnIYZTG
 DBxERJK7uw/0Kf7owsKWPhOKrXPo68AeCfSh3y9+6hDZZEkJZPnp3QHpD
 xWoro8z0xQygbxODdKXK+Fm7r9Z2cKtikHpIe5pk4Oxs38PsphxvgMrNQ
 qTnpAVkWe/Au5XWBXZ6LE0g/w4xETmbZgpR++1Js6MsCHhS49rXaeU39N A==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; d="scan'208";a="29147990"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Feb 2023 09:12:42 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 81639280056;
 Fri, 17 Feb 2023 09:12:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v4 5/6] drm: lcdif: Add multiple encoders and first
 bridges support
Date: Fri, 17 Feb 2023 09:12:39 +0100
Message-ID: <2274637.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230217065407.2259731-6-victor.liu@nxp.com>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
 <20230217065407.2259731-6-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

thanks for the update.

Am Freitag, 17. Februar 2023, 07:54:06 CET schrieb Liu Ying:
> The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> simultaneously.  Look at LCDIF output port's remote port parents to
> find all enabled first bridges.  Add an encoder for each found bridge
> and attach the bridge to the encoder.  This is a preparation for
> adding i.MX93 LCDIF support.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> v3->v4:
> * Improve warning message when ignoring invalid LCDIF OF endpoint ids.
>   (Alexander)
>=20
> v2->v3:
> * No change.
>=20
> v1->v2:
> * Split from patch 2/2 in v1. (Marek, Alexander)
> * Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
> * Drop unneeded 'bridges' member from lcdif_drm_private structure.
>=20
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 68 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/mxsfb/lcdif_drv.h |  4 +-
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 21 ++--------
>  3 files changed, 66 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c index b5b9a8e273c6..f1f5caef390a 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -9,13 +9,16 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>=20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -38,19 +41,68 @@ static const struct drm_mode_config_helper_funcs
> lcdif_mode_config_helpers =3D { .atomic_commit_tail =3D
> drm_atomic_helper_commit_tail_rpm,
>  };
>=20
> +static const struct drm_encoder_funcs lcdif_encoder_funcs =3D {
> +	.destroy =3D drm_encoder_cleanup,
> +};
> +
>  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  {
> -	struct drm_device *drm =3D lcdif->drm;
> +	struct device *dev =3D lcdif->drm->dev;
> +	struct device_node *ep;
>  	struct drm_bridge *bridge;
>  	int ret;
>=20
> -	bridge =3D devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0, 0);
> -	if (IS_ERR(bridge))
> -		return PTR_ERR(bridge);
> -
> -	ret =3D drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> -	if (ret)
> -		return dev_err_probe(drm->dev, ret, "Failed to attach=20
bridge\n");
> +	for_each_endpoint_of_node(dev->of_node, ep) {
> +		struct device_node *remote;
> +		struct of_endpoint of_ep;
> +		struct drm_encoder *encoder;
> +
> +		remote =3D of_graph_get_remote_port_parent(ep);
> +		if (!of_device_is_available(remote)) {
> +			of_node_put(remote);
> +			continue;
> +		}
> +		of_node_put(remote);
> +
> +		ret =3D of_graph_parse_endpoint(ep, &of_ep);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to parse endpoint %pOF\n",=20
ep);
> +			of_node_put(ep);
> +			return ret;
> +		}
> +
> +		if (of_ep.id >=3D MAX_DISPLAYS) {
> +			dev_warn(dev, "ingoring invalid endpoint id=20
%u\n", of_ep.id);
> +			continue;
> +		}
> +
> +		bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0,=20
of_ep.id);
> +		if (IS_ERR(bridge)) {
> +			of_node_put(ep);
> +			return dev_err_probe(dev, PTR_ERR(bridge),
> +					     "Failed to get bridge=20
for endpoint%u\n",
> +					     of_ep.id);
> +		}
> +
> +		encoder =3D &lcdif->encoders[of_ep.id];
> +		encoder->possible_crtcs =3D drm_crtc_mask(&lcdif->crtc);
> +		ret =3D drm_encoder_init(lcdif->drm, encoder,=20
&lcdif_encoder_funcs,
> +				       DRM_MODE_ENCODER_NONE, NULL);
> +		if (ret) {
> +			dev_err(dev, "Failed to initialize encoder for=20
endpoint%u: %d\n",
> +				of_ep.id, ret);
> +			of_node_put(ep);
> +			return ret;
> +		}
> +
> +		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> +		if (ret) {
> +			of_node_put(ep);
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach=20
bridge for endpoint%u\n",
> +					     of_ep.id);
> +		}
> +	}
>=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> b/drivers/gpu/drm/mxsfb/lcdif_drv.h index aa6d099a1897..c7400bd9bbd9 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> @@ -14,6 +14,8 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_plane.h>
>=20
> +#define MAX_DISPLAYS	3
> +
>  struct clk;
>=20
>  struct lcdif_drm_private {
> @@ -30,7 +32,7 @@ struct lcdif_drm_private {
>  		/* i.MXRT does support overlay planes, add them here. */
>  	} planes;
>  	struct drm_crtc			crtc;
> -	struct drm_encoder		encoder;
> +	struct drm_encoder		encoders[MAX_DISPLAYS];
>  };
>=20
>  static inline struct lcdif_drm_private *
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c index d6009b353a16..c35d769f91dd 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -656,14 +656,6 @@ static const struct drm_crtc_funcs lcdif_crtc_funcs =
=3D {
> .disable_vblank =3D lcdif_crtc_disable_vblank,
>  };
>=20
> -/*
> -------------------------------------------------------------------------=
=2D-
> -- - * Encoder
> - */
> -
> -static const struct drm_encoder_funcs lcdif_encoder_funcs =3D {
> -	.destroy =3D drm_encoder_cleanup,
> -};
> -
>  /*
> -------------------------------------------------------------------------=
=2D-
> -- * Planes
>   */
> @@ -756,7 +748,6 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
>  					BIT(DRM_COLOR_YCBCR_BT2020);
>  	const u32 supported_ranges =3D BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>  				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
> -	struct drm_encoder *encoder =3D &lcdif->encoder;
>  	struct drm_crtc *crtc =3D &lcdif->crtc;
>  	int ret;
>=20
> @@ -780,13 +771,7 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
>  		return ret;
>=20
>  	drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
> -	ret =3D drm_crtc_init_with_planes(lcdif->drm, crtc,
> -					&lcdif->planes.primary,=20
NULL,
> -					&lcdif_crtc_funcs, NULL);
> -	if (ret)
> -		return ret;
> -
> -	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
> -	return drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
> -				DRM_MODE_ENCODER_NONE, NULL);
> +	return drm_crtc_init_with_planes(lcdif->drm, crtc,
> +					 &lcdif->planes.primary,=20
NULL,
> +					 &lcdif_crtc_funcs, NULL);
>  }


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


