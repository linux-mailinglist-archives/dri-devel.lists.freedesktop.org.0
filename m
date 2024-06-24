Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA99143DE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAF910E3A1;
	Mon, 24 Jun 2024 07:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Fln7WuY7";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="j6hx42G/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76E010E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719215118; x=1750751118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/TEq/tOMH+qPmZFRmuad42oBNyqOeBWDlG7hBkvjLvI=;
 b=Fln7WuY7W9/ocAL3DQeKemrc2WJ3gKmq2rmKfN0dkgBh/NyvGULiBtID
 /gK5bZ6+n4kKKnU6KekCyEXFWo4bYlvgJCcUTOCt7V0TLAcUROdQ8+XIJ
 drkOAYS3p3baGm+If1nJnIQjlAxek5p1zX7g55lQ1RqRYIGr72/k89DE/
 JPvwGcgrGfEoOSRsE1AwTYzIL3fdG73TZDE5ZdPMJ/32+MDN3I/tffon0
 JlQu0LkAfkiH4KnpZ10T4wxwPJ/+EsZD9QWnsv+Ovp0SAjlINI5dIVwoA
 Sr7lzKqKi7MqZDIkaLQ6RUA6IpQXcooHy0WBmYSW6mQZy5fIUSmJJFJFh g==;
X-CSE-ConnectionGUID: Wh9bgL2LQ0iv/myJ2sn1IQ==
X-CSE-MsgGUID: z5dybkD1RxWVhbCbaTUyYQ==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37544192"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 09:45:16 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 293F4166FA4; Mon, 24 Jun 2024 09:45:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719215112;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/TEq/tOMH+qPmZFRmuad42oBNyqOeBWDlG7hBkvjLvI=;
 b=j6hx42G/sWA0r22YlJuYD3UPvJFtfFG5LIUfzu9lPxgz2FGnWw3+bWdu2kkv5QBjsFr0dx
 8OCmpbhgZcSaw+C/g13aBQMyaGPUf/6QC/EbsGwyni3BwrxK+g1yOR6MdWhV021OBfQrjc
 0QSaTtJ9kmEr1KmeL8C5dBHat8bpFDwKkxkQJMJDiGkQmmo4BE2AI8KQKm++oPnwONYdg0
 IB+yQJqxBZeETuyeh/5fN6jLbnAIUK4nkTl+MPZLi8QWil5wbz4A93MqTyKXwt5Tq3yEY1
 JBRFcm8q2T88lw7JcHNBZHYA9XEaxXZM3+i37Jxq2zD6vRJmCeRws1QS1eyOWA==
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
Subject: Re: [PATCH v3 4/6] drm/bridge: tc358767: Disable
 MIPI_DSI_CLOCK_NON_CONTINUOUS
Date: Mon, 24 Jun 2024 09:45:13 +0200
Message-ID: <5794906.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240623143846.12603-4-marex@denx.de>
References: <20240623143846.12603-1-marex@denx.de>
 <20240623143846.12603-4-marex@denx.de>
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

Am Sonntag, 23. Juni 2024, 16:38:36 CEST schrieb Marek Vasut:
> The MIPI_DSI_CLOCK_NON_CONTINUOUS causes visible artifacts in high
> resolution modes, disable it. Namely, in DSI->DP mode 1920x1200 24
> bpp 59.95 Hz, with DSI bus at maximum 1 Gbps per lane setting, the
> image contains jittering empty lines.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

I can't see these artifacts in 1920x1200 24bpp, but still looks good to me
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

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
>  drivers/gpu/drm/bridge/tc358767.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index c4e2455ad95e4..a48454fe2f634 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2303,7 +2303,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data *=
tc)
>  	dsi->lanes =3D dsi_lanes;
>  	dsi->format =3D MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +			  MIPI_DSI_MODE_LPM;
> =20
>  	ret =3D devm_mipi_dsi_attach(dev, dsi);
>  	if (ret < 0) {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


