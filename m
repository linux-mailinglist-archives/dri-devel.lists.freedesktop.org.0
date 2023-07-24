Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075E75EAA8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 06:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F0F10E273;
	Mon, 24 Jul 2023 04:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3939010E273
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 04:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1690174401; x=1721710401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IMd4ymp81ERgjM37zJCHhqkuja1bu0TPTxGEMriEzWM=;
 b=LQXw1EvmH5ST0EgC3CNZYvH1suaXIddfC05ER8LA9dq3N0xopYZNsyGp
 lfGbHYMWhpeLxhU+Ivz8a//4x8Ry88SixVem1RYvlayVfkst+tFmgu9yr
 jQK3bB+txu/OTk2TsCv9rxNwb535iE+Nnot9R21fDID0TrwC7QUE/TYKp
 P9POOoYtPL9VhmD857ROUHiZpj2G6s/qUg+GuAWdV3wXB0xx2SYnM836D
 zO+3B60d0uAujAerkC2m+uUiXkdOFJUC9APcPak+gdGMo9FYGztAVwDsh
 M3ClKBwejBcqPdM6n799zANMI6iUVJsBzRhx5vVhEMHvwnUbYuH/Fq1yo A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; d="scan'208";a="32068515"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Jul 2023 06:53:18 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 884FD280078;
 Mon, 24 Jul 2023 06:53:18 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Clean up a call to
 request_irq()
Date: Mon, 24 Jul 2023 06:53:18 +0200
Message-ID: <5697757.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <1c921fe0-2758-44dd-85f3-2ef8eb6583bb@moroto.mountain>
References: <1c921fe0-2758-44dd-85f3-2ef8eb6583bb@moroto.mountain>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, kernel-janitors@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Freitag, 21. Juli 2023, 16:56:17 CEST schrieb Dan Carpenter:
> This is calling request_threaded_irq() but the thread parameter is NULL
> so it's actually not a threaded irq.  Which is a bit misleading.  Call
> request_irq() instead.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c index 9b7a00bafeaa..9d81dbbc6680
> 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1637,8 +1637,8 @@ static int samsung_dsim_register_te_irq(struct
> samsung_dsim *dsi, struct device
>=20
>  	te_gpio_irq =3D gpiod_to_irq(dsi->te_gpio);
>=20
> -	ret =3D request_threaded_irq(te_gpio_irq, samsung_dsim_te_irq_handler,=
=20
NULL,
> -				   IRQF_TRIGGER_RISING |=20
IRQF_NO_AUTOEN, "TE", dsi);
> +	ret =3D request_irq(te_gpio_irq, samsung_dsim_te_irq_handler,
> +			  IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE",=20
dsi);
>  	if (ret) {
>  		dev_err(dsi->dev, "request interrupt failed with %d\n",=20
ret);
>  		gpiod_put(dsi->te_gpio);

This change looks good, but it seems worth using devm_ call instead (as a=20
separate patch probably). dsi->te_gpio is also requested per devm_ call, so=
=20
eventually samsung_dsim_unregister_te_irq could be removed if the IRQ is=20
device managed as well.

Despite that for this patch:
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


