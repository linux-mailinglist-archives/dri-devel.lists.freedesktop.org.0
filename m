Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B1BCB385
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 01:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AF910EB35;
	Thu,  9 Oct 2025 23:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="jGreVek6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FCF10EB35
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=FMd471QT/VhvjFXorUXuE2WlEYMkCwcbF7uR1pYLSH4=; b=jGreVek6OZbEDqwbPYSBdqw5Gd
 dPlT4qbvlXaRMpjpPGrFMmjZ/5KDhssnGVQx9omVGaTsOHBx4XRzf1sxQLZN6viJD3JXd2HO9GN5m
 +31C3251pm7/+xzqLiEBODFk7qGkDMYMo5fNVxpuDly02opd4rPo5bLDDQvlLYbsQVm7xar92d9ZT
 jqnqJZ+6fgpoXtnFe6IsXnqC0z1doYUnXwEiC6KaMEcXZjE/81+yWN/arG3ylFilc87KF4fZGG/Px
 2/yXDR3UzSKdo8cQFyrvaI4jvrgOfPlmVDn3ZWZo6lvXNi0AAJgGPlu1LI9XJgzV6HlloP3a/OF9B
 1QTiG/ug==;
Received: from i53875bdd.versanet.de ([83.135.91.221] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1v70Gy-00080d-IE; Fri, 10 Oct 2025 01:42:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: damon.ding@rock-chips.com, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix connector status detection
 for bridges
Date: Fri, 10 Oct 2025 01:42:11 +0200
Message-ID: <3572997.QJadu78ljV@diego>
In-Reply-To: <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
References: <20251009193028.4952-1-heiko@sntech.de>
 <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Dmitry,

Am Freitag, 10. Oktober 2025, 00:30:11 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Dmitry Baryshkov:
> On Thu, Oct 09, 2025 at 09:30:28PM +0200, Heiko Stuebner wrote:
> > Right now if there is a next bridge attached to the analogix-dp control=
ler
> > the driver always assumes this bridge is connected to something, but th=
is
> > is of course not always true, as that bridge could also be a hotpluggab=
le
> > dp port for example.
> >=20
> > On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: displ=
ay-
> > connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monit=
or
> > for DisplayPort targets is more complicated than just reading the HPD p=
in
> > level" and we should be "letting the actual DP driver perform detection=
=2E"
> >=20
> > So use drm_bridge_detect() to detect the next bridge's state but ignore
> > that bridge if the analogix-dp is handling the hpd-gpio.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > As this patch stands, it would go on top of v6 of Damon's bridge-connec=
tor
> > work, but could very well be also integrated into one of the changes th=
ere.
> >=20
> > I don't know yet if my ordering and/or reasoning is the correct one or =
if
> > a better handling could be done, but with that change I do get a nice
> > hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
> > Analogix-DP ends in a full size DP port.
> >=20
> >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drive=
rs/gpu/drm/bridge/analogix/analogix_dp_core.c
> > index c04b5829712b..cdc56e83b576 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridg=
e, struct drm_connector *conne
> >  	struct analogix_dp_device *dp =3D to_dp(bridge);
> >  	enum drm_connector_status status =3D connector_status_disconnected;
> > =20
> > -	if (dp->plat_data->next_bridge)
> > -		return connector_status_connected;
> > +	/*
> > +	 * An optional next bridge should be in charge of detection the
> > +	 * connection status, except if we manage a actual hpd gpio.
> > +	 */
> > +	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
> > +		return drm_bridge_detect(dp->plat_data->next_bridge, connector);
>=20
> And it's also not correct because the next bridge might be a retimer
> with the bridge next to it being a one with the actual detection
> capabilities. drm_bridge_connector solves that in a much better way. See
> the series at [1]
>=20
> [1] https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e017=
9@samsung.com/

Hence my comment above about that possibly not being the right variant.
Sort of asking for direction :-) .

I am working on top of Damon's drm-bridge-connector series as noted above,
but it looks like the detect function still is called at does then stuff.

My board is the rk3588-tiger-displayport-carrier [0], with a dp-connector
which is the next bridge, so _without_ any changes, the analogix-dp
always assumes "something" is connected and I end up with

[    9.869198] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get=
 hpd single ret =3D -110
[    9.980422] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get=
 hpd single ret =3D -110
[   10.091522] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get=
 hpd single ret =3D -110
[   10.202419] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get=
 hpd single ret =3D -110
[   10.313651] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get=
 hpd single ret =3D -110

when no display is connected.

With this change I do get the expected hotplug behaviour, so something is
missing still even with the bridge-connector series.


Heiko


[0] v3: https://lore.kernel.org/r/20250812083217.1064185-3-heiko@sntech.de
    v4: https://lore.kernel.org/r/20251009225050.88192-3-heiko@sntech.de
    (moved hpd-gpios from dp-connector back to analogix-dp per dp-connector
    being not able to detect dp-monitors)
>=20
> > =20
> >  	if (!analogix_dp_detect_hpd(dp))
> >  		status =3D connector_status_connected;
>=20
>=20




