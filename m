Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6C572BB10
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 10:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4F610E1BB;
	Mon, 12 Jun 2023 08:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB6510E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:44:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2971962183;
 Mon, 12 Jun 2023 08:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10537C433EF;
 Mon, 12 Jun 2023 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686559479;
 bh=PvW69xSn/ZnscQwnR3pGAydQ1x3Pq+L3epgJsaYuygU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X2U0TNR2frupVx4XLj+Be6LKtikr8mYRTmadd5OPQSEkVshLwIQJ09Va7UsWOTHAz
 VWkfsFGq17SGNmVUEiRlh8wDOP/VbICI7gGF03dkQJGVWJsqlThtb96cUbXGzuTixJ
 SlpZmkT4kPcgMsHhTdU8i3CEG1QcZtQzDOt6A/JExh9q21O/xKQlk+W0HOKVY+QEGF
 NjwbRjwczCDkiopO59wJjmmSDzke3NjXZBqFMD26hDwJ1NI4v9uz//wDzgQ1SWYKSv
 kehLQ530mbO2RC5cWeyszeLXkrkLEM3oDVXGskEZZndpFac5WtiJKyVwtscjFiToIc
 3GwGR/zrk0jnw==
Date: Mon, 12 Jun 2023 10:44:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/7] drm/panel: sitronix-st7789v: Specify the expected
 bus format
Message-ID: <5fo6iwwx3ljzp6p32vh35lrewpqdpenvpartadsf5dim3ewdm3@wcfnue5kizfj>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230609145951.853533-4-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 09, 2023 at 04:59:47PM +0200, Miquel Raynal wrote:
> The LCD controller supports RGB444, RGB565 and RGB888. The value that is
> written in the COLMOD register indicates using RGB888, so let's clearly
> specify the in-use bus format.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu=
/drm/panel/panel-sitronix-st7789v.c
> index e9ca7ebb458a..0abb45bea18d 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -6,6 +6,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> =20
> @@ -170,6 +171,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
>  	struct drm_display_mode *mode;
> +	u32 bus_format =3D MEDIA_BUS_FMT_RGB666_1X18;

I'm not sure it should be set in stone in the driver.

This is a property of the panel/controller, but also one of the RGB
controller upstream that will and how the board has been wired.

It's not unusual for boards with a limited number of GPIOs to take a
RGB888 panel and connect only as a RGB565 with the lowest bits to the
ground for example.

So I think this should come from the device tree, ideally from the media
graph endpoint.

Maxime
