Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DA5AD085
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76F710E2B5;
	Mon,  5 Sep 2022 10:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2163 seconds by postgrey-1.36 at gabe;
 Mon, 05 Sep 2022 10:48:23 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A9310E2B5;
 Mon,  5 Sep 2022 10:48:23 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oV95T-0005Kp-Ed; Mon, 05 Sep 2022 12:12:15 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 8/9] drm/rockchip: cdn-dp: call
 drm_connector_update_edid_property() unconditionally
Date: Mon, 05 Sep 2022 12:12:14 +0200
Message-ID: <3530081.XrmoMso0CX@diego>
In-Reply-To: <bb733eccfb389533cc6e207689be845164a1ed91.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
 <bb733eccfb389533cc6e207689be845164a1ed91.1662036058.git.jani.nikula@intel.com>
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

Am Donnerstag, 1. September 2022, 14:47:10 CEST schrieb Jani Nikula:
> Calling drm_connector_update_edid_property() should be done
> unconditionally instead of depending on the number of modes added. Also
> match the call order in inno_hdmi and rk3066_hdmi.
>=20
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Heiko St=FCbner <heiko@sntech.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/roc=
kchip/cdn-dp-core.c
> index c204e9b95c1f..f77bdf5f5168 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -273,10 +273,9 @@ static int cdn_dp_connector_get_modes(struct drm_con=
nector *connector)
>  				  edid->width_cm, edid->height_cm);
> =20
>  		dp->sink_has_audio =3D drm_detect_monitor_audio(edid);
> +
> +		drm_connector_update_edid_property(connector, edid);
>  		ret =3D drm_add_edid_modes(connector, edid);
> -		if (ret)
> -			drm_connector_update_edid_property(connector,
> -								edid);
>  	}
>  	mutex_unlock(&dp->lock);
> =20
>=20




