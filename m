Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B0148C6C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 17:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A5172B23;
	Fri, 24 Jan 2020 16:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B7072B23
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 16:42:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 18D25808B4;
 Fri, 24 Jan 2020 17:42:35 +0100 (CET)
Date: Fri, 24 Jan 2020 17:42:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] drm/tiny/repaper: Make driver OF-independent
Message-ID: <20200124164233.GA6043@ravnborg.org>
References: <20200122105403.30035-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122105403.30035-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=74mfOMir7v8SzzIflKUA:9 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy.


On Wed, Jan 22, 2020 at 12:54:00PM +0200, Andy Shevchenko wrote:
> There is one OF call in the driver that limits its area of use.
> Replace it to generic device_get_match_data() and get rid of OF dependency.
> 
> While here, cast SPI driver data to certain enumerator type.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 76d179200775..fd9e95ce3201 100644
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
>  
>  enum repaper_model {
> +	EXXXXCSXXX = 0,
>  	E1144CS021 = 1,
>  	E1190CS021,
>  	E2200CS021,
The new enum value is not used in the following - is it necessary?

	Sam


> @@ -995,21 +996,21 @@ static int repaper_probe(struct spi_device *spi)
>  {
>  	const struct drm_display_mode *mode;
>  	const struct spi_device_id *spi_id;
> -	const struct of_device_id *match;
>  	struct device *dev = &spi->dev;
>  	enum repaper_model model;
>  	const char *thermal_zone;
>  	struct repaper_epd *epd;
>  	size_t line_buffer_size;
>  	struct drm_device *drm;
> +	const void *match;
>  	int ret;
>  
> -	match = of_match_device(repaper_of_match, dev);
> +	match = device_get_match_data(dev);
>  	if (match) {
> -		model = (enum repaper_model)match->data;
> +		model = (enum repaper_model)match;
>  	} else {
>  		spi_id = spi_get_device_id(spi);
> -		model = spi_id->driver_data;
> +		model = (enum repaper_model)spi_id->driver_data;
>  	}
>  
>  	/* The SPI device is used to allocate dma memory */
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
