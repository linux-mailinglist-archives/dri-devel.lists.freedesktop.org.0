Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90BC14D0BB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 19:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA8F6E445;
	Wed, 29 Jan 2020 18:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3336E445
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 18:54:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 463822002C;
 Wed, 29 Jan 2020 19:54:08 +0100 (CET)
Date: Wed, 29 Jan 2020 19:54:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add EDT panel support
Message-ID: <20200129185407.GB25273@ravnborg.org>
References: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <1580317318-32071-3-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580317318-32071-3-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8
 a=e5mUnYsNAAAA:8 a=925PnCcy7A-X2AUHGAkA:9 a=CjuIK1q_8ugA:10
 a=QsnFDINu91a9xkgZirup:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 prabhakar.mahadev-lad.rj@bp.renesas.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marian-Cristian

On Wed, Jan 29, 2020 at 05:01:58PM +0000, Marian-Cristian Rotariu wrote:
> EDT ET043080DH6-GP is a 4.3" WQVGA 480x272 RGB LCD panel used on the iWave
> Generic SODIMM Development Platform.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5d48768..aa64790 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1268,6 +1268,36 @@ static const struct panel_desc edt_et035012dm6 = {
>  	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
>  };
>  
> +static const struct drm_display_mode edt_etm043080dh6gp_mode = {
> +	.clock = 10870,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 8,
> +	.hsync_end = 480 + 8 + 4,
> +	.htotal = 480 + 8 + 4 + 41,
> +
> +	/*
> +	 * IWG22M: Y resolution changed for "dc_linuxfb" module crashing while
> +	 * fb_align
> +	 */
> +
> +	.vdisplay = 288,
> +	.vsync_start = 288 + 2,
> +	.vsync_end = 288 + 2 + 4,
> +	.vtotal = 288 + 2 + 4 + 10,
> +	.vrefresh = 60,
> +};
> +
> +static const struct panel_desc edt_etm043080dh6gp = {
> +	.modes = &edt_etm043080dh6gp_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 100,
> +		.height = 65,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +};

As a minimum you must specify the connector_type too.
If you have the datesheet for the panel then please use
display_timings so you can specify min, typ, max timing.

	Sam


> +
>  static const struct drm_display_mode edt_etm0430g0dh6_mode = {
>  	.clock = 9000,
>  	.hdisplay = 480,
> @@ -3189,6 +3219,9 @@ static const struct of_device_id platform_of_match[] = {
>  		.compatible = "edt,et035012dm6",
>  		.data = &edt_et035012dm6,
>  	}, {
> +		.compatible = "edt,etm043080dh6gp",
> +		.data = &edt_etm043080dh6gp,
> +	}, {
>  		.compatible = "edt,etm0430g0dh6",
>  		.data = &edt_etm0430g0dh6,
>  	}, {
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
