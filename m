Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6CE91450A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 10:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF1C10E3AD;
	Mon, 24 Jun 2024 08:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="gZCjficR";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="je/36g37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F1010E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719218295; x=1750754295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tYxLqKSpuLYt+pAGwIrMUzwjGihbRqiaqxOLRxTf2EM=;
 b=gZCjficRQy84rYVPkBgWZ0CSy1+FfsA6z97vBxkJ3HQc+mxIT2sQl3k7
 oVCsoHWd6zstMb4dgk1pZWhwWN5uGPVnotTv1G4dXh2uZEvv9roU6aEEl
 R3ZznL7EhcnXW/9lpJhHAh/JkMp0OQB17HpoO8lFcI+Hd0CkrfAuKVrX3
 MJBXdBCcZrQb3ggTpf+Ke0gTM6gFqa1/zTh/7FVhymzzvxCZPlkdWDv0b
 3Zy5rf3vNE0Db+Nfkm1wAKoDyFkZ2N+YtQg2f+v15iofgevFryi3H4nho
 oFnu26tWt/dBvK6rNKUxVETp6TAZ35Dlb/mY+MWqj4tRYEQEWM05SkSQ4 w==;
X-CSE-ConnectionGUID: 9a4bLTI3TLud2t07OOVF3g==
X-CSE-MsgGUID: gmiUPi6wS5eWgbItNDhUCw==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37546056"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 10:38:13 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4DA5616F8EC; Mon, 24 Jun 2024 10:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719218289;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tYxLqKSpuLYt+pAGwIrMUzwjGihbRqiaqxOLRxTf2EM=;
 b=je/36g379btgjS7OBFwcfDaXYmrnLYzyziczkuV1cDIGceA3Qv2gn0tBgJNHlE4GRgunsc
 ukfPLXfkS9p1PS0pqvFaRJyOQQqpRG5qr/YKfKfEBLqVd97bwWg0FjrqZRCFV2KZtDPTGY
 bJLkXjM0r4qHhMK1LUKS1yRiptunzg8hob6i9Ie2R2n8mLSyD+0Mlc/j0YG9O5sDj/euEJ
 gOHTJktYRVXNWvKjeF/NmzdBeioHzIZsscCKOzKsweU3qJ/hJU+H7SHErLT7BRs/c1Fzz5
 YER68T7pHf70Y0aKO+3TDLjl03n49RIS89WLlJzo1s9JKVoB3xWxHiD8PnAeVg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@dh-electronics.com, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 6/6] Revert "drm/bridge: tc358767: Set default CLRSIPO
 count"
Date: Mon, 24 Jun 2024 10:38:09 +0200
Message-ID: <4932429.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240623143846.12603-6-marex@denx.de>
References: <20240623143846.12603-1-marex@denx.de>
 <20240623143846.12603-6-marex@denx.de>
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

Am Sonntag, 23. Juni 2024, 16:38:38 CEST schrieb Marek Vasut:
> This reverts commit 01338bb82fed40a6a234c2b36a92367c8671adf0.
>=20
> With clock improvements in place, this seems to be no longer
> necessary. Set the CLRSIPO to default setting recommended by
> manufacturer.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Although calculation sheet indicates this depends on DSI-Timings, this
works as well.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
> V2: No change
> V3: No change
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 743bf1334923d..2b035a136a6e5 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1356,10 +1356,10 @@ static int tc_dsi_rx_enable(struct tc_data *tc)
>  	u32 value;
>  	int ret;
> =20
> -	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 25);
> -	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 25);
> -	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 25);
> -	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 25);
> +	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 5);
> +	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 5);
> +	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 5);
> +	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 5);
>  	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
>  	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
>  	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


