Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9DB69A6A3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4B110E434;
	Fri, 17 Feb 2023 08:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BBD10E434
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676621418; x=1708157418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7mQIM9qB5Xewca0JuXva0yWCc1fzx4zn1VmrGgIUoU=;
 b=KZSbrqzxHXwQm2xB5mieNKijp60vd0xRn0zBZXtkw5APQKdpbKKh0Qvy
 piwsvYf4yqkVj6fdpCkJnuuah8/nBawQaJBWIptgc8gif5TB6cKC3VDpj
 5QPijTuPsFar3urW9WAB1lg4/dVnoaJM06QaVm0c0iXjBUse+1LspEIjQ
 35I/bEPk8WtbwycWiIkBDKCE1Tw9fqtxjv14WKBXQq3AMoueM8CJYtkQZ
 socBCYqxI5BnLEmDBmvKiMho9UbWdwkTxKM31JDAnQDP9OHHpGsc1uwfo
 +2SpCSRa/RKg72pOiGCqlUw2mazjbSqtv7k0RLl42btOPnsXeDEEieS55 Q==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; d="scan'208";a="29147824"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 09:10:15 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 17 Feb 2023 09:10:15 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 09:10:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676621416; x=1708157416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7mQIM9qB5Xewca0JuXva0yWCc1fzx4zn1VmrGgIUoU=;
 b=JbTyiQPn6Ly0ZHkZSvxr3VmL9gZohzEmt83HMRznKAMlAbxYqeH0Vt0z
 l4O+2sHdCOzH/em4pzApjnQfes/SeWmlIxHJNBOgYpqp9WesyoMF2DkTz
 hKfvSjsg89wqpyL7n2upZiWIxKdHO47L9ii9SG3MZh/ysRiqZEcmmAdzM
 SbC+kwrsVeFp6DFIgwlFC9yST8huCuEUzX51hW+mZFfHEVYS0g/0A5TY2
 FybmP+uPwGEsQybnoCBSFscsVgoHvOw4g/St8zXeHWl71YbwPLNQJIMJ9
 sbfCxbxBvCHO+VUeNaJqX0zpGamZ3BgxoGyOJO0JCKDkgbdYdC4+nw+g6 w==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; d="scan'208";a="29147823"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Feb 2023 09:10:15 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 44185280056;
 Fri, 17 Feb 2023 09:10:15 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v4 4/6] drm: lcdif: Check consistent bus format and flags
 across first bridges
Date: Fri, 17 Feb 2023 09:10:12 +0100
Message-ID: <4809939.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230217065407.2259731-5-victor.liu@nxp.com>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
 <20230217065407.2259731-5-victor.liu@nxp.com>
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

thanks for this update.

Am Freitag, 17. Februar 2023, 07:54:05 CET schrieb Liu Ying:
> The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> simultaneously.  Check bus format and flags across first bridges in
> ->atomic_check() to ensure they are consistent.  This is a preparation
> for adding i.MX93 LCDIF support.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> v3->v4:
> * No change.
>=20
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
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c index d46de433cd8e..d6009b353a16 1006=
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


