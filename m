Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A85156D79
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 02:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C472A6E0DB;
	Mon, 10 Feb 2020 01:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE9D6E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 01:56:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 97A4D2001E;
 Mon, 10 Feb 2020 02:56:35 +0100 (CET)
Date: Mon, 10 Feb 2020 02:56:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/4] drm/tiny/repaper: Make driver OF-independent
Message-ID: <20200210015634.GA22066@ravnborg.org>
References: <20200131204923.48928-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131204923.48928-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8
 a=e5mUnYsNAAAA:8 a=WZHNqt2aAAAA:8 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8
 a=aE2j6VG5sAdimHmDfK4A:9 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=PrHl9onO2p7xFKlKy1af:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy.

On Fri, Jan 31, 2020 at 10:49:22PM +0200, Andy Shevchenko wrote:
> There is one OF call in the driver that limits its area of use.
> Replace it to generic device_get_match_data() and get rid of OF dependenc=
y.
> =

> While here, cast SPI driver data to certain enumerator type.
> =

> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Lechner <david@lechnology.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> v2: Replace cryptic macro with comment, add Rb tag (Sam)
>  drivers/gpu/drm/tiny/repaper.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> =


Thanks, applied this and the other three patches to drm-misc-next.

	Sam

> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repape=
r.c
> index 76d179200775..e52a19ffd7c0 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -17,7 +17,7 @@
>  #include <linux/dma-buf.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/property.h>
>  #include <linux/sched/clock.h>
>  #include <linux/spi/spi.h>
>  #include <linux/thermal.h>
> @@ -40,6 +40,7 @@
>  #define REPAPER_RID_G2_COG_ID	0x12
>  =

>  enum repaper_model {
> +	/* 0 is reserved to avoid clashing with NULL */
>  	E1144CS021 =3D 1,
>  	E1190CS021,
>  	E2200CS021,
> @@ -995,21 +996,21 @@ static int repaper_probe(struct spi_device *spi)
>  {
>  	const struct drm_display_mode *mode;
>  	const struct spi_device_id *spi_id;
> -	const struct of_device_id *match;
>  	struct device *dev =3D &spi->dev;
>  	enum repaper_model model;
>  	const char *thermal_zone;
>  	struct repaper_epd *epd;
>  	size_t line_buffer_size;
>  	struct drm_device *drm;
> +	const void *match;
>  	int ret;
>  =

> -	match =3D of_match_device(repaper_of_match, dev);
> +	match =3D device_get_match_data(dev);
>  	if (match) {
> -		model =3D (enum repaper_model)match->data;
> +		model =3D (enum repaper_model)match;
>  	} else {
>  		spi_id =3D spi_get_device_id(spi);
> -		model =3D spi_id->driver_data;
> +		model =3D (enum repaper_model)spi_id->driver_data;
>  	}
>  =

>  	/* The SPI device is used to allocate dma memory */
> -- =

> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
