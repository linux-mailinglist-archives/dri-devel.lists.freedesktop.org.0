Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DAC91452C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 10:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0DC10E3B2;
	Mon, 24 Jun 2024 08:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="gKQaIFqD";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="E4/6AaFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5240810E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719218637; x=1750754637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DRj6duR1NpzoP1rLUxSsV6cnokPiQocgwg3CdEGGqHM=;
 b=gKQaIFqDi+gqfXZ/fYl9xs20sElwhBWOmktjYdTOCLBp8h87oUACU6GO
 /2aMvesM2WaOE4Htmfgw6BHh8d5tprouujSSCQv8g6FOfQWRT4dVcKlQL
 L+F8WabGXn2QA0wBmiaA7n1gZehINqK+Uf4sdoJcIOFXDWHpa6zJbLjBP
 6k0vvhj4IKbY15ZW9pKGmrEeUi8vZ3T0D8CEQC0vfHsBVtyPC1ib5/82+
 dqgNEm+fNHNIuREiLxtdpnMdI1wFmBZICJ1nKE00UUYuzGdUtiVSjDoVP
 kpKfuB8f7YQl5qPJUVWqbKtbyQeKVApSoLWbcuOOZuTVw6X3SUByQ8m2H A==;
X-CSE-ConnectionGUID: FtgYLy5sTU6eSFUdEsDopg==
X-CSE-MsgGUID: DJdqwdZSRP2E/x19DOGMRg==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37546249"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 10:43:55 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B802160BB3; Mon, 24 Jun 2024 10:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719218631;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DRj6duR1NpzoP1rLUxSsV6cnokPiQocgwg3CdEGGqHM=;
 b=E4/6AaFcdK/a0GyRhL1YHYTFZwFVjmykZc93wXLTMj8RzPyzoW5GLJwWOjTpfo3x8JCFRD
 FSzlXPbgqd79wEQsSikoy122HjBK+A3jXV0Bfl9G3WSSqpGihuCxhctWDrPcJMg/a48egJ
 Lt60y1CuyTZwoFTIzJDnZ5xRJxOAaNG6WuU/9LUCFDVnCmjMXLlBb2L8f0sO/RY2a1SysL
 CToSJnLN6H8lQK9ypBLJkPextuMNMofwCiumop1NviHUWqht0DuDFmVcDlIlabAhV9MlsJ
 4RrfFXsgQcWXo13jI4s0Omxr+8XY6eDfI7UhhJC0YZEpwlQ2fQ37ro4I9b4HHg==
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
Subject: Re: [PATCH v3 5/6] drm/bridge: tc358767: Set LSCLK divider for SYSCLK
 to 1
Date: Mon, 24 Jun 2024 10:43:53 +0200
Message-ID: <2332715.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240623143846.12603-5-marex@denx.de>
References: <20240623143846.12603-1-marex@denx.de>
 <20240623143846.12603-5-marex@denx.de>
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

Am Sonntag, 23. Juni 2024, 16:38:37 CEST schrieb Marek Vasut:
> The only information in the datasheet regarding this divider is a note
> in SYS_PLLPARAM register documentation which states that when LSCLK is
> 270 MHz, LSCLK_DIV should be 1. What should LSCLK_DIV be set to when
> LSCLK is 162 MHz (for DP 1.62G mode) is unclear, but empirical test
> confirms using LSCLK_DIV 1 has no adverse effects either. In the worst
> case, the internal TC358767 clock would run faster.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Works also on a 2.7Gbps link.
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
>  drivers/gpu/drm/bridge/tc358767.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index a48454fe2f634..743bf1334923d 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -738,7 +738,7 @@ static int tc_stream_clock_calc(struct tc_data *tc)
>  static int tc_set_syspllparam(struct tc_data *tc)
>  {
>  	unsigned long rate;
> -	u32 pllparam =3D SYSCLK_SEL_LSCLK | LSCLK_DIV_2;
> +	u32 pllparam =3D SYSCLK_SEL_LSCLK | LSCLK_DIV_1;
> =20
>  	rate =3D clk_get_rate(tc->refclk);
>  	switch (rate) {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


