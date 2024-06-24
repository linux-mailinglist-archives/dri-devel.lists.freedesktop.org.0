Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3E914663
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DC610E3D5;
	Mon, 24 Jun 2024 09:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="lKNMu3OM";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rZn9sRoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976E810E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719221178; x=1750757178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b+1ybzMEPJszfSht4zq+KSxDEwwj3FqeB6Wof95ESQs=;
 b=lKNMu3OMKlBkdN58goaqZPTsJgNI9bjCbDzpc6VupLxUg1uNjuGv5bLb
 gsctRpw2nHQE2shhl7oKMb9IpiNa1pzwbU+gbrPd5juiKwS75T+WzU3Qe
 bZUr/myIezi5BUA+XGn9HFRj6+TwMTafWsEBpx1rnZTyEWNBRheNmN45y
 flnT95TE9jryl8BKTB0LQQZR7BkFkSmyFqkegXIZ77XFYhmpyZirUQvel
 BD4mCCClbF5nIVqdvdtLWip8Vt1t9VeO9kdT6V4Sc9r5GgbK74/a6Ne+R
 S4tgzblhwFjaLMVps4KrEDvIHJQTJydwvvlSJ0HIaWNlnUsaG9/XS4sy5 w==;
X-CSE-ConnectionGUID: Xcc32l4JQB6sKZZ4JfRh8Q==
X-CSE-MsgGUID: TCp50Z/rSlWrBn5E5sWhMw==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37547837"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 11:26:16 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1862E16FE3A; Mon, 24 Jun 2024 11:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719221172;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=b+1ybzMEPJszfSht4zq+KSxDEwwj3FqeB6Wof95ESQs=;
 b=rZn9sRoHo3tsUemP3o6TBY678gcTLRhPODeDEp05SMCYCeMnzr+e+d6Z8NG/6+joPzw5yL
 vknHYZTHUE7gKNMAy8T8Bp/mCLNKga7RkuHkWH96pSHZOQXJdWzJ9tus0WxbjXDv+Ae0lD
 0OEF5tXpubRlxPpp6jt7SdhPR6CGDHWHb+sjAnJWocDhWpsRE2DtXpGWAmOeD5NpDmbCTL
 9AZMynhFcg2Nb3DCWk/qAjL4+pgGZkddw9RJmnwgx37RpLwwAdnY+J/felFsKqC6ORKp1/
 G+Vts6fSIfj5an5FFltXJSTuoUAELZ+Y9www4sY1WM+SeaavLs5d8q1I+35qLg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: Re: [1/2] drm: bridge: samsung-dsim: Initialize bridge on attach
Date: Mon, 24 Jun 2024 11:26:12 +0200
Message-ID: <2199187.Mh6RI2rZIc@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240513021849.129136-1-marex@denx.de>
References: <20240513021849.129136-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Montag, 13. Mai 2024, 04:16:27 CEST schrieb Marek Vasut:
> Initialize the bridge on attach already, to force lanes into LP11
> state, since attach does trigger attach of downstream bridges which
> may trigger (e)DP AUX channel mode read.
>=20
> This fixes a corner case where DSIM with TC9595 attached to it fails
> to operate the DP AUX channel, because the TC9595 enters some debug
> mode when it is released from reset without lanes in LP11 mode. By
> ensuring the DSIM lanes are in LP11, the TC9595 (tc358767.c driver)
> can be reset in its attach callback called from DSIM attach callback,
> and recovered out of the debug mode just before TC9595 performs first
> AUX channel access later in its attach callback.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

This does the trick on my hardware as well.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 95fedc68b0ae5..56093fc3d62cc 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1622,9 +1622,21 @@ static int samsung_dsim_attach(struct drm_bridge *=
bridge,
>  			       enum drm_bridge_attach_flags flags)
>  {
>  	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dsi->dev);
> +	if (ret < 0)
> +		return ret;
> =20
> -	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> -				 flags);
> +	ret =3D samsung_dsim_init(dsi);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret =3D drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> +				flags);
> +err:
> +	pm_runtime_put_sync(dsi->dev);
> +	return ret;
>  }
> =20
>  static const struct drm_bridge_funcs samsung_dsim_bridge_funcs =3D {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


