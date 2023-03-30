Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5B6D0B78
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 18:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6978210EF14;
	Thu, 30 Mar 2023 16:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F88010EF14
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:39:14 +0000 (UTC)
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1phvIu-0005Pe-NM; Thu, 30 Mar 2023 18:39:12 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 11/12] drm/rockchip: convert to using has_audio from
 display_info
Date: Thu, 30 Mar 2023 18:39:12 +0200
Message-ID: <2628105.X9hSmTKtgW@diego>
In-Reply-To: <a7eba2b4d00765b668937cb2430fd23057e6a873.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
 <a7eba2b4d00765b668937cb2430fd23057e6a873.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 30. M=E4rz 2023, 17:39:48 CEST schrieb Jani Nikula:
> Prefer the parsed results for has_audio in display info over calling
> drm_detect_monitor_audio().
>=20
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Heiko St=FCbner <heiko@sntech.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 4 ++--
>  drivers/gpu/drm/rockchip/inno_hdmi.c   | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/roc=
kchip/cdn-dp-core.c
> index b6afe3786b74..4a4cf4354e27 100644
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
> index f51774866f41..98691aef1be5 100644
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




