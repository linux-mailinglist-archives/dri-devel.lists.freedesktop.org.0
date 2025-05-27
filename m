Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA341AC51AF
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132E010E4B3;
	Tue, 27 May 2025 15:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="dkL+n4Hg";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VwH4pNXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B39810E4B3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1748358667; x=1779894667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2MVZpihUPQEApskbaFJ/Op8f6hJtY+RACNT9VgBm90=;
 b=dkL+n4HghDrvfAK0z1k8lJ70KyaqK+kjUZYBHlkRxZo8umPfvbkoMzUR
 pKmlwDByAOJ+FnJtw4Gn9z4PJ861jFZTzoRqlqwKXWJdQt5/1poZfXTZU
 c0lMepHRTF2ja8SGq+ozurebMSjgOSL5lJX+G3JYiJOHD7CpyVQrSHEW/
 5y11jtmMQIfehdgjVQiC2UFvafI/Rw3obp+4ABOpZxskP4AI59cHOp1C7
 592w/MDe7u0yTF3rmp8b7ATHIZ7bYYsomG9p7fGbEndHEiV6dtacRL+tr
 /V7OiNU5jFfA5XmiOvpoBqN9fzHZD8iZRWBNEFBqHLugYV+mO00wZ2psM A==;
X-CSE-ConnectionGUID: SRmLJ52ORbW/MDEpPhRVqA==
X-CSE-MsgGUID: 0AC1gYExTwKOHKAznO14/w==
X-IronPort-AV: E=Sophos;i="6.15,318,1739833200"; d="scan'208";a="44317926"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 27 May 2025 17:11:02 +0200
X-CheckPoint: {6835D605-24-45F3AE15-E90F7DFA}
X-MAIL-CPID: ADF923318D80C8723CF8796F0D9E7B8B_5
X-Control-Analysis: str=0001.0A006368.6835D61C.0039, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 219F9168237; Tue, 27 May 2025 17:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1748358657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2MVZpihUPQEApskbaFJ/Op8f6hJtY+RACNT9VgBm90=;
 b=VwH4pNXSpFryQdVTwHpcvBdw1PisEJ6kDr+x+VmIlYLUaXDQr8u9ZHc//ZpBoXeaOmLnjy
 x9kCUi9TuNJcKDqjwhfnrmYGV09PdCIxKywsE75oxGG0+RMHH0PeTntw3mUOtoFUz3YwBH
 6+11bfJuEczw9D0Fvfp/DBfmbDYAAwcnDtsCOJN6IuL8Gq0J3R6rVHWzhRur8uSgTH4WRP
 8k1RAjSJesgiCsQWICAjaX2xVKErDCztjDKxdCN/MqJNOO9kajtJvhWPjqVH3FNnCf0arR
 sbTQDxFqoJnMYEN8qYz5HK6yBNOMGETn4aTHXUdeEQNjoq8f+lGcffVsO6T7GA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/bridge: samsung-dsim: use while loop in
 samsung_dsim_transfer_start
Date: Tue, 27 May 2025 17:10:53 +0200
Message-ID: <3539459.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250527-samsung-dsim-v1-1-5be520d84fbb@pengutronix.de>
References: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
 <20250527-samsung-dsim-v1-1-5be520d84fbb@pengutronix.de>
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

Am Dienstag, 27. Mai 2025, 16:21:47 CEST schrieb Philipp Zabel:
> Turn the open-coded goto-again construct into a while loop, to make
> samsung_dsim_transfer_start() a bit shorter and easier to read.
>=20
> Hold the spinlock when looping back around and avoid the duplicated
> list_empty() check.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 51 +++++++++++++++--------------=
=2D-----
>  1 file changed, 21 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 0014c497e3fe7d8349a119dbdda30d65d816cccf..1dfc9710bee5134e0e0114ce5=
2f673c21564b11b 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1235,43 +1235,34 @@ static void samsung_dsim_transfer_start(struct sa=
msung_dsim *dsi)
>  {
>  	unsigned long flags;
>  	struct samsung_dsim_transfer *xfer;
> -	bool start =3D false;
> =20
> -again:
>  	spin_lock_irqsave(&dsi->transfer_lock, flags);
> =20
> -	if (list_empty(&dsi->transfer_list)) {
> +	while (!list_empty(&dsi->transfer_list)) {
> +		xfer =3D list_first_entry(&dsi->transfer_list,
> +					struct samsung_dsim_transfer, list);
> +
>  		spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> -		return;
> +
> +		if (xfer->packet.payload_length &&
> +		    xfer->tx_done =3D=3D xfer->packet.payload_length)
> +			/* waiting for RX */
> +			return;
> +
> +		samsung_dsim_send_to_fifo(dsi, xfer);
> +
> +		if (xfer->packet.payload_length || xfer->rx_len)
> +			return;
> +
> +		xfer->result =3D 0;
> +		complete(&xfer->completed);
> +
> +		spin_lock_irqsave(&dsi->transfer_lock, flags);
> +
> +		list_del_init(&xfer->list);
>  	}
> =20
> -	xfer =3D list_first_entry(&dsi->transfer_list,
> -				struct samsung_dsim_transfer, list);
> -
>  	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> -
> -	if (xfer->packet.payload_length &&
> -	    xfer->tx_done =3D=3D xfer->packet.payload_length)
> -		/* waiting for RX */
> -		return;
> -
> -	samsung_dsim_send_to_fifo(dsi, xfer);
> -
> -	if (xfer->packet.payload_length || xfer->rx_len)
> -		return;
> -
> -	xfer->result =3D 0;
> -	complete(&xfer->completed);
> -
> -	spin_lock_irqsave(&dsi->transfer_lock, flags);
> -
> -	list_del_init(&xfer->list);
> -	start =3D !list_empty(&dsi->transfer_list);
> -
> -	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> -
> -	if (start)
> -		goto again;
>  }
> =20
>  static bool samsung_dsim_transfer_finish(struct samsung_dsim *dsi)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


