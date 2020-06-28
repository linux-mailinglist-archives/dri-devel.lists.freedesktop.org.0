Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A886920C6C8
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85C16E190;
	Sun, 28 Jun 2020 07:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260836E190
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 07:28:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C030C4FB;
 Sun, 28 Jun 2020 09:28:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593329301;
 bh=ck+LjAkxjFbi+T46BUzZf+XpAk4V6f33vhP8DfWZQHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uOXm1rRxayXR+zKQy3KRDZgAUKQTQRWl8eKer9/zKORUNd5yFoInZcCU7aBUs+y6Y
 YOr58xIXYiNhUT0myqyZxMLrTlYE7PeBX/ITh9unu3mm08hj0KPhRkuDwGD1NnIT71
 ZdSA1chOyEZIx1s1yK9BircekQKa03LFbtHav0iw=
Date: Sun, 28 Jun 2020 10:28:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pascal Roeleven <dev@pascalroeleven.nl>
Subject: Re: [PATCH v2 2/5] drm: panel: Add Starry KR070PE2T
Message-ID: <20200628072819.GB8391@pendragon.ideasonboard.com>
References: <20200320112205.7100-1-dev@pascalroeleven.nl>
 <20200320112205.7100-3-dev@pascalroeleven.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320112205.7100-3-dev@pascalroeleven.nl>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pascal,

On Fri, Mar 20, 2020 at 12:21:33PM +0100, Pascal Roeleven wrote:
> The KR070PE2T is a 7" panel with a resolution of 800x480.
> 
> KR070PE2T is the marking present on the ribbon cable. As this panel is
> probably available under different brands, this marking will catch
> most devices.
> 
> As I can't find a datasheet for this panel, the bus_flags are instead
> from trial-and-error. The flags seem to be common for these kind of
> panels as well.
> 
> Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index e14c14ac6..b3d257257 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2842,6 +2842,32 @@ static const struct panel_desc shelly_sca07010_bfn_lnn = {
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>  };
>  
> +static const struct drm_display_mode starry_kr070pe2t_mode = {
> +	.clock = 33000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 209,
> +	.hsync_end = 800 + 209 + 1,
> +	.htotal = 800 + 209 + 1 + 45,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 22,
> +	.vsync_end = 480 + 22 + 1,
> +	.vtotal = 480 + 22 + 1 + 22,
> +	.vrefresh = 60,
> +};
> +
> +static const struct panel_desc starry_kr070pe2t = {
> +	.modes = &starry_kr070pe2t_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 152,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,

I'm trying to fix inconsistencies in the panel-simple driver, and this
caught my eyes. MEDIA_BUS_FMT_RGB888_1X24 isn't a correct format for
LVDS panels. MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG or MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA
should be used instead. As I couldn't find documentation for the panel,
I can't tell which format is correct. Could you please help ?

> +};
> +
>  static const struct drm_display_mode starry_kr122ea0sra_mode = {
>  	.clock = 147000,
>  	.hdisplay = 1920,
> @@ -3474,6 +3500,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "shelly,sca07010-bfn-lnn",
>  		.data = &shelly_sca07010_bfn_lnn,
> +	}, {
> +		.compatible = "starry,kr070pe2t",
> +		.data = &starry_kr070pe2t,
>  	}, {
>  		.compatible = "starry,kr122ea0sra",
>  		.data = &starry_kr122ea0sra,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
