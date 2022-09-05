Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044945AD089
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA80310E2CA;
	Mon,  5 Sep 2022 10:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6000810E2B5;
 Mon,  5 Sep 2022 10:48:25 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oV96T-0005L3-MN; Mon, 05 Sep 2022 12:13:17 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 9/9] drm/rockchip: convert to using has_audio from
 display_info
Date: Mon, 05 Sep 2022 12:13:17 +0200
Message-ID: <11952780.MucGe3eQFb@diego>
In-Reply-To: <429e4b3f905b070fb985ce7388b9637e2b4704dd.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
 <429e4b3f905b070fb985ce7388b9637e2b4704dd.1662036058.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 1. September 2022, 14:47:11 CEST schrieb Jani Nikula:
> Prefer the parsed results for has_audio in display info over calling
> drm_detect_monitor_audio().
>=20
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Heiko St=FCbner <heiko@sntech.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 4 ++--
>  drivers/gpu/drm/rockchip/inno_hdmi.c   | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/roc=
kchip/cdn-dp-core.c
> index f77bdf5f5168..50af9861553b 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -272,10 +272,10 @@ static int cdn_dp_connector_get_modes(struct drm_co=
nnector *connector)
>  		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
>  				  edid->width_cm, edid->height_cm);
> =20
> -		dp->sink_has_audio =3D drm_detect_monitor_audio(edid);
> -
>  		drm_connector_update_edid_property(connector, edid);
>  		ret =3D drm_add_edid_modes(connector, edid);
> +
> +		dp->sink_has_audio =3D connector->display_info.has_audio;
>  	}
>  	mutex_unlock(&dp->lock);
> =20
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockc=
hip/inno_hdmi.c
> index 87b2243ea23e..fadaa795fb3d 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -564,10 +564,11 @@ static int inno_hdmi_connector_get_modes(struct drm=
_connector *connector)
> =20
>  	edid =3D drm_get_edid(connector, hdmi->ddc);
>  	if (edid) {
> -		hdmi->hdmi_data.sink_has_audio =3D drm_detect_monitor_audio(edid);
>  		drm_connector_update_edid_property(connector, edid);
>  		ret =3D drm_add_edid_modes(connector, edid);
>  		kfree(edid);
> +
> +		hdmi->hdmi_data.sink_has_audio =3D connector->display_info.has_audio;
>  	}
> =20
>  	return ret;
>=20




