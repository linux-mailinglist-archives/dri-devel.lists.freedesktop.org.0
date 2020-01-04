Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2215B1302F6
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 16:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276C86E442;
	Sat,  4 Jan 2020 15:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500116E442
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 15:18:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EC59B80622;
 Sat,  4 Jan 2020 16:18:35 +0100 (CET)
Date: Sat, 4 Jan 2020 16:18:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm/panel: simple: Add Satoz SAT050AT40H12R2
 panel support
Message-ID: <20200104151834.GD17768@ravnborg.org>
References: <20191224141905.22780-1-miquel.raynal@bootlin.com>
 <20191224141905.22780-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224141905.22780-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P-IC7800AAAA:8
 a=6d4WGEFEbrAP5ViGYu4A:9 a=CjuIK1q_8ugA:10 a=d3PnA9EDa4IxuAV0gXij:22
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
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel.

On Tue, Dec 24, 2019 at 03:19:05PM +0100, Miquel Raynal wrote:
> Add support for the Satoz SAT050AT40H12R2 RGB panel.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes since v2:
> * Dropped two uneeded lines which would fail the build.
> 
> Changes since v1:
> * Switched to display_timing's instead of display_mode.
> 
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index ac6f6b5d200d..cc1595c5633a 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2559,6 +2559,29 @@ static const struct panel_desc samsung_ltn140at29_301 = {
>  	},
>  };
>  
> +static const struct display_timing satoz_sat050at40h12r2_timing = {
> +	.pixelclock = { 33300000, 33300000, 50000000 },
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
> +};
Please add connector_type as well.
This is mandatory for all new panels.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
