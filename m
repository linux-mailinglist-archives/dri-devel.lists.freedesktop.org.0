Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2EC20C6C1
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 09:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4261A6E16D;
	Sun, 28 Jun 2020 07:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7B56E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 07:24:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 502244FB;
 Sun, 28 Jun 2020 09:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593329087;
 bh=lDJLYgo5DAMTz/2ZdYYg0U6WeJE3NuS2/RgMKA97/9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D82vwPQig11JOHMRyv/yZYP6lyVm8zSHDNpAs0wCDRKTXvpE+c5DucVv1Cv2X83RT
 TJdPfYkU6pAuRhBrNqmysO/eOdeFqpg8qR6JQGz95C83P5RHew9bWDMGhXDQrmpLhs
 vMoSUdCBnQvqz1GD8hajRAHRr79ryIsz/3AvgwTk=
Date: Sun, 28 Jun 2020 10:24:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 2/2] drm/panel: simple: Add Satoz SAT050AT40H12R2
 panel support
Message-ID: <20200628072444.GA8391@pendragon.ideasonboard.com>
References: <20200109184037.9091-1-miquel.raynal@bootlin.com>
 <20200109184037.9091-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109184037.9091-2-miquel.raynal@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel,

On Thu, Jan 09, 2020 at 07:40:37PM +0100, Miquel Raynal wrote:
> Add support for the Satoz SAT050AT40H12R2 panel.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes since v4:
> * None.
> 
> Changes since v3:
> * Added connector type.
> 
> Changes since v2:
> * Dropped two uneeded lines which would fail the build.
> 
> Changes since v1:
> * Switched to display_timing's instead of display_mode.
> 
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index aaa08beac13c..1aa6622abc49 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2577,6 +2577,30 @@ static const struct panel_desc samsung_ltn140at29_301 = {
>  	},
>  };
>  
> +static const struct display_timing satoz_sat050at40h12r2_timing = {
> +	.pixelclock = {33300000, 33300000, 50000000},
> +	.hactive = {800, 800, 800},
> +	.hfront_porch = {16, 210, 354},
> +	.hback_porch = {46, 46, 46},
> +	.hsync_len = {1, 1, 40},
> +	.vactive = {480, 480, 480},
> +	.vfront_porch = {7, 22, 147},
> +	.vback_porch = {23, 23, 23},
> +	.vsync_len = {1, 1, 20},
> +};
> +
> +static const struct panel_desc satoz_sat050at40h12r2 = {
> +	.timings = &satoz_sat050at40h12r2_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 108,
> +		.height = 65,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,

I'm trying to fix inconsistencies in the panel-simple driver, and this
caught my eyes. MEDIA_BUS_FMT_RGB888_1X24 isn't a correct format for
LVDS panels. MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG or MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA
should be used instead. As I couldn't find documentation for the panel,
I can't tell which format is correct. Could you please help ?

> +};
> +
>  static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
>  	.clock = 168480,
>  	.hdisplay = 1920,
> @@ -3377,6 +3401,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "samsung,ltn140at29-301",
>  		.data = &samsung_ltn140at29_301,
> +	}, {
> +		.compatible = "satoz,sat050at40h12r2",
> +		.data = &satoz_sat050at40h12r2,
>  	}, {
>  		.compatible = "sharp,ld-d5116z01b",
>  		.data = &sharp_ld_d5116z01b,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
