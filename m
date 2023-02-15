Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968D6977A6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 08:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B6F10EA54;
	Wed, 15 Feb 2023 07:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5329E10EA54
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676447694; x=1707983694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kmB3ZyRL9WLhReGN/zQsy3Lf0X194Zzb2QgZBtzAYLo=;
 b=XiY37ik1ZpN7WiPs7WpMr0F3q9el5IFytnwEn2+CYNgi7ZCgdvGjuiLC
 Wj5qWUG/4HFYlsCN4yg8s7ABbXCWuFaPtC4lsftIVLmfuj2Gn+lNvu4ns
 GrfQ/yL1Me6mjU1cKA6KD2S8MeCqr8lJrbmd6UHF1Qg0cDa6KG46gGAs2
 Enps8WQDHmI9cxexaPpGHuEusr/KEA0wGBPxR+Cx9ZG7FvVOv0WjASE4W
 BFNu4o3FN1ZeChNAe6f04sgMrD+JANPPbf8A/tsgV4A2Ed6YN9Pd2BbBw
 8noI2Tp7BnZiWoL0mp0925sWkgL0TJchB+WLX9+E1srye5zB9xs+D79FO w==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29090186"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 15 Feb 2023 08:54:52 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 15 Feb 2023 08:54:52 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 15 Feb 2023 08:54:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676447692; x=1707983692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kmB3ZyRL9WLhReGN/zQsy3Lf0X194Zzb2QgZBtzAYLo=;
 b=W/KeE4vOo0315s601L2Ug8QlZWUWl+2EkIvFnW8ORwnxSc0fjJBqj5cp
 oF/++7LPCIZpzRU/TBf1OKH9nXgds+mVXNVJsbRw8IuZtb4D/wE4o3uBb
 VnwNbMT/EJdbKu6m6Qn7LjqL3DN0Y4Blq7d+e7CdQc6QquXl7yr106yFa
 bR6DJwugbVNOMpwcSG+ui1X4esH9I0169nZIGCqHNEYpHZtoHWGvvYk+r
 G/hMp7NBfavSNWthgFxf1Xr/Dte5aBQNSrNGPOBE1FmUhr9QDqj1q7Muj
 BUPIKdEnZNpGlSnPKd9XpxULzR3eTiyy64il+aEmSyodiDW12aD6i6UOk g==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29090185"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Feb 2023 08:54:52 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 27501280056;
 Wed, 15 Feb 2023 08:54:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 5/6] drm: lcdif: Add multiple encoders and first
 bridges support
Date: Wed, 15 Feb 2023 08:54:50 +0100
Message-ID: <1893357.taCxCBeP46@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230213085612.1026538-6-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-6-victor.liu@nxp.com>
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

Am Montag, 13. Februar 2023, 09:56:11 CET schrieb Liu Ying:
> The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> simultaneously.  Look at LCDIF output port's remote port parents to
> find all enabled first bridges.  Add an encoder for each found bridge
> and attach the bridge to the encoder.  This is a preparation for
> adding i.MX93 LCDIF support.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
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
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c index b5b9a8e273c6..eb6c265fa2fe 1006=
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

Is it possible for remote to be NULL?

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
> +			dev_warn(dev, "invalid endpoint id %u\n",=20
of_ep.id);

I would write
dev_warn(dev, "ignoring invalid endpoint id %u\n", of_ep.id);
just because the parsing continues but this one is skipped.

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

Admittedly I'm not used to the drm API, but do we need to some manual clean=
up/
revert if some endpoints is e.g. deferred, but previous endpoints already h=
ave=20
been successfully added? e.g. endpoint 0 is added, but adding endpoint 1=20
fails.

Best regards,
Alexander

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
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c index 4ea3d2b2cf61..5f34d01e133e 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -654,14 +654,6 @@ static const struct drm_crtc_funcs lcdif_crtc_funcs =
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
> @@ -754,7 +746,6 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
>  					BIT(DRM_COLOR_YCBCR_BT2020);
>  	const u32 supported_ranges =3D BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>  				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
> -	struct drm_encoder *encoder =3D &lcdif->encoder;
>  	struct drm_crtc *crtc =3D &lcdif->crtc;
>  	int ret;
>=20
> @@ -778,13 +769,7 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
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


