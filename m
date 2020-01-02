Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3FD12E413
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 09:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EACA89A59;
	Thu,  2 Jan 2020 08:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AFD89A59
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 08:56:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5E9A220023;
 Thu,  2 Jan 2020 09:55:59 +0100 (CET)
Date: Thu, 2 Jan 2020 09:55:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] panel: simple: Add Ivo M133NWF4 R0
Message-ID: <20200102085557.GA29446@ravnborg.org>
References: <20191229060658.746189-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191229060658.746189-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8
 a=gSXZn_GVY0joluNFdaoA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn.

On Sat, Dec 28, 2019 at 10:06:58PM -0800, Bjorn Andersson wrote:
> The InfoVision Optoelectronics M133NWF4 R0 panel is a 13.3" 1920x1080
> eDP panel, add support for it in panel-simple.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 31 ++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index ba3f85f36c2f..d7ae0ede2b6e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1806,6 +1806,34 @@ static const struct panel_desc innolux_zj070na_01p = {
>  	},
>  };
>  
> +static const struct drm_display_mode ivo_m133nwf4_r0_mode = {
> +	.clock = 138778,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 24,
> +	.hsync_end = 1920 + 24 + 48,
> +	.htotal = 1920 + 24 + 48 + 88,
> +	.vdisplay = 1080,
> +	.vsync_start = 1080 + 3,
> +	.vsync_end = 1080 + 3 + 12,
> +	.vtotal = 1080 + 3 + 12 + 17,
> +	.vrefresh = 60,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +static const struct panel_desc ivo_m133nwf4_r0 = {
> +	.modes = &ivo_m133nwf4_r0_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 294,
> +		.height = 165,
> +	},
> +	.delay = {
> +		.hpd_absent_delay = 200,
> +		.unprepare = 500,
> +	},
> +};

For new bindings - at least add connector_type.
And consider bus_format and bus_flags too.


> +
>  static const struct display_timing koe_tx14d24vm1bpa_timing = {
>  	.pixelclock = { 5580000, 5850000, 6200000 },
>  	.hactive = { 320, 320, 320 },
> @@ -3266,6 +3294,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "innolux,zj070na-01p",
>  		.data = &innolux_zj070na_01p,
> +	}, {
> +		.compatible = "ivo,m133nwf4-r0",
Compatible must be documented in a binding file.
We are discussing a new binding format where it is simple to add
a new panel. But no final conclusion yet.

The comments above (in panel_desc and here) also apply for the
other patch you sent.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
