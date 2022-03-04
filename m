Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F94CDD5F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 20:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9A4113420;
	Fri,  4 Mar 2022 19:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FB5113420
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 19:38:41 +0000 (UTC)
Date: Fri, 04 Mar 2022 19:38:29 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/bridge_connector: enable HPD by default if supported
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-Id: <5WJ88R.LXNASHJRBDGL1@crapouillou.net>
In-Reply-To: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
References: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikita,

Le sam., d=E9c. 25 2021 at 09:31:51 +0300, Nikita Yushchenko=20
<nikita.yoush@cogentembedded.com> a =E9crit :
> Hotplug events reported by bridge drivers over drm_bridge_hpd_notify()
> get ignored unless somebody calls drm_bridge_hpd_enable(). When the
> connector for the bridge is bridge_connector, such a call is done from
> drm_bridge_connector_enable_hpd().
>=20
> However drm_bridge_connector_enable_hpd() is never called on init=20
> paths,
> documentation suggests that it is intended for suspend/resume paths.
>=20
> In result, once encoders are switched to bridge_connector,
> bridge-detected HPD stops working.
>=20
> This patch adds a call to that API on init path.
>=20
> This fixes HDMI HPD with rcar-du + adv7513 case when adv7513 reports=20
> HPD
> events via interrupts.
>=20
> Fixes: c24110a8fd09 ("drm: rcar-du: Use drm_bridge_connector_init()=20
> helper")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Merged to drm-misc-next.

Thanks!

Cheers,
-Paul

> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c=20
> b/drivers/gpu/drm/drm_bridge_connector.c
> index 791379816837..4f20137ef21d 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -369,8 +369,10 @@ struct drm_connector=20
> *drm_bridge_connector_init(struct drm_device *drm,
>  				    connector_type, ddc);
>  	drm_connector_helper_add(connector,=20
> &drm_bridge_connector_helper_funcs);
>=20
> -	if (bridge_connector->bridge_hpd)
> +	if (bridge_connector->bridge_hpd) {
>  		connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> +		drm_bridge_connector_enable_hpd(connector);
> +	}
>  	else if (bridge_connector->bridge_detect)
>  		connector->polled =3D DRM_CONNECTOR_POLL_CONNECT
>  				  | DRM_CONNECTOR_POLL_DISCONNECT;
> --
> 2.30.2


