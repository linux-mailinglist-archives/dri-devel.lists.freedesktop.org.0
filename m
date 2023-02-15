Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1436977AB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 08:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989A410EA42;
	Wed, 15 Feb 2023 07:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1578410EA42
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676447762; x=1707983762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5aoHBNbyTFqHml3HSxh/oFSy5INCLfV1gfmvC5sjnPc=;
 b=HjDqm7rvemGGCIi70sHJy4HU3zTTc42f62YFVVv6+FoqR6OAF9BI25ch
 3csp6eK8jJ8+1G6pjIolvaaguvU9m5n4vCGC41/rZdTG60ZYMkt3suNht
 YNkxuSXVGqjJLhWWpvbt0CTWCn5KQq4JAGarp/JoZQmipAUwP7MXzfsiY
 twWgDSNQ87KnngkKb7JpLylzsuEtUNYZA8T2F9TbVM49qS1iHS53uf9Xs
 pMVGh7j42E3bBZ6Kx8huYf5PwPEHEnnskMDE1X76S8GFegi9YXoySbUc7
 VSENwtMkjxWcIIiXJdZMHE5AIX1Ekh7/XsWypb+A5bcVsH2uTT9Aotf9p Q==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29090243"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 15 Feb 2023 08:56:00 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 15 Feb 2023 08:56:00 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 15 Feb 2023 08:56:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676447760; x=1707983760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5aoHBNbyTFqHml3HSxh/oFSy5INCLfV1gfmvC5sjnPc=;
 b=HGR8fmAwS2yqWbdyABF50NCUh4zD3jvXwleEnwYUUSbgdkKF1J8W/t7z
 7/Gc0eNJWirYPcmUzqqv4kOj1xV8LUGVBltPi/r452CgjDBg8hfj8uSVQ
 mfHRUaRwbHlVm9XC3brxJj3TDiSPQUnfo5qCvQGi4q3yIjRZ/0Hh/3PPF
 d7FfKu5QT8XEmoUO/rKwX8AFJQam2xJmXQBG/DhV80veqe8I2GpMmIaiX
 oLJXy1nR67PP6JX/ygfjiETYMAH5Z1q6vExQBNsuOThciXe7I2qrZuhBW
 Qbu6tHMMoMRggKr8TCLvbEQ1m5XZtAvxCy7WZTSXpZhnA1lPuTKSqbVPj Q==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29090241"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Feb 2023 08:55:59 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 88234280056;
 Wed, 15 Feb 2023 08:55:59 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 4/6] drm: lcdif: Check consistent bus format and flags
 across first bridges
Date: Wed, 15 Feb 2023 08:55:59 +0100
Message-ID: <2148647.Icojqenx9y@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230213085612.1026538-5-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-5-victor.liu@nxp.com>
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

Am Montag, 13. Februar 2023, 09:56:10 CET schrieb Liu Ying:
> The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> simultaneously.  Check bus format and flags across first bridges in
> ->atomic_check() to ensure they are consistent.  This is a preparation
> for adding i.MX93 LCDIF support.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * No change.
>=20
> v1->v2:
> * Split from patch 2/2 in v1. (Marek, Alexander)
> * Drop a comment about bridge input bus format from
> lcdif_crtc_atomic_check().
>=20
>  drivers/gpu/drm/mxsfb/lcdif_drv.c |  2 -
>  drivers/gpu/drm/mxsfb/lcdif_drv.h |  1 -
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 76 ++++++++++++++++++++++---------
>  3 files changed, 55 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c index cc2ceb301b96..b5b9a8e273c6 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -52,8 +52,6 @@ static int lcdif_attach_bridge(struct lcdif_drm_private
> *lcdif) if (ret)
>  		return dev_err_probe(drm->dev, ret, "Failed to attach=20
bridge\n");
>=20
> -	lcdif->bridge =3D bridge;
> -
>  	return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> b/drivers/gpu/drm/mxsfb/lcdif_drv.h index 6cdba6e20c02..aa6d099a1897 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> @@ -31,7 +31,6 @@ struct lcdif_drm_private {
>  	} planes;
>  	struct drm_crtc			crtc;
>  	struct drm_encoder		encoder;
> -	struct drm_bridge		*bridge;
>  };
>=20
>  static inline struct lcdif_drm_private *
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c index 294cecdf5439..4ea3d2b2cf61 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_color_mgmt.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fb_dma_helper.h>
> @@ -424,15 +425,19 @@ static int lcdif_crtc_atomic_check(struct drm_crtc
> *crtc, struct drm_atomic_state *state)
>  {
>  	struct drm_device *drm =3D crtc->dev;
> -	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(drm);
>  	struct drm_crtc_state *crtc_state =3D=20
drm_atomic_get_new_crtc_state(state,
>  							=09
	  crtc);
>  	struct lcdif_crtc_state *lcdif_crtc_state =3D
> to_lcdif_crtc_state(crtc_state); bool has_primary =3D crtc_state->plane_m=
ask
> &
>  			   drm_plane_mask(crtc->primary);
> +	struct drm_connector_state *connector_state;
> +	struct drm_connector *connector;
> +	struct drm_encoder *encoder;
>  	struct drm_bridge_state *bridge_state;
> -	struct drm_bridge *bridge =3D lcdif->bridge;
> -	int ret;
> +	struct drm_bridge *bridge;
> +	u32 bus_format, bus_flags;
> +	bool format_set =3D false, flags_set =3D false;
> +	int ret, i;
>=20
>  	/* The primary plane has to be enabled when the CRTC is active. */
>  	if (crtc_state->active && !has_primary)
> @@ -442,26 +447,55 @@ static int lcdif_crtc_atomic_check(struct drm_crtc
> *crtc, if (ret)
>  		return ret;
>=20
> -	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> -	if (!bridge_state)
> -		lcdif_crtc_state->bus_format =3D MEDIA_BUS_FMT_FIXED;
> -	else
> -		lcdif_crtc_state->bus_format =3D bridge_state-
>input_bus_cfg.format;
> -
> -	if (lcdif_crtc_state->bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> -		dev_warn_once(drm->dev,
> -			      "Bridge does not provide bus format,=20
assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n" -			      "Please fix=20
bridge driver by
> handling atomic_get_input_bus_fmts.\n"); -		lcdif_crtc_state-
>bus_format =3D
> MEDIA_BUS_FMT_RGB888_1X24;
> +	/* Try to find consistent bus format and flags across first bridges.=20
*/
> +	for_each_new_connector_in_state(state, connector, connector_state,=20
i) {
> +		if (!connector_state->crtc)
> +			continue;
> +
> +		encoder =3D connector_state->best_encoder;
> +
> +		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
> +		if (!bridge)
> +			continue;
> +
> +		bridge_state =3D drm_atomic_get_new_bridge_state(state,=20
bridge);
> +		if (!bridge_state)
> +			bus_format =3D MEDIA_BUS_FMT_FIXED;
> +		else
> +			bus_format =3D bridge_state->input_bus_cfg.format;
> +
> +		if (bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> +			dev_warn(drm->dev,
> +				 "[ENCODER:%d:%s]'s bridge does not=20
provide bus format, assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n" +				=20
"Please fix bridge driver by handling
> atomic_get_input_bus_fmts.\n", +				=20
encoder->base.id, encoder->name);
> +			bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +		}
> +
> +		if (!format_set) {
> +			lcdif_crtc_state->bus_format =3D bus_format;
> +			format_set =3D true;
> +		} else if (lcdif_crtc_state->bus_format !=3D bus_format) {
> +			DRM_DEV_DEBUG_DRIVER(drm->dev, "inconsistent bus=20
format\n");

Is there another way to know the actual reason the atomic_check fails? Mayb=
e=20
this is worthy to be an error message instead.

Best regards,
Alexander

> +			return -EINVAL;
> +		}
> +
> +		if (bridge->timings)
> +			bus_flags =3D bridge->timings->input_bus_flags;
> +		else if (bridge_state)
> +			bus_flags =3D bridge_state->input_bus_cfg.flags;
> +		else
> +			bus_flags =3D 0;
> +
> +		if (!flags_set) {
> +			lcdif_crtc_state->bus_flags =3D bus_flags;
> +			flags_set =3D true;
> +		} else if (lcdif_crtc_state->bus_flags !=3D bus_flags) {
> +			DRM_DEV_DEBUG_DRIVER(drm->dev, "inconsistent bus=20
flags\n");
> +			return -EINVAL;
> +		}
>  	}
>=20
> -	if (bridge->timings)
> -		lcdif_crtc_state->bus_flags =3D bridge->timings-
>input_bus_flags;
> -	else if (bridge_state)
> -		lcdif_crtc_state->bus_flags =3D bridge_state-
>input_bus_cfg.flags;
> -	else
> -		lcdif_crtc_state->bus_flags =3D 0;
> -
>  	return 0;
>  }


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


