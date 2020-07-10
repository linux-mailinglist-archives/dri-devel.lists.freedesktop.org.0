Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C810121BE29
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 22:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DA26ED0F;
	Fri, 10 Jul 2020 20:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493D06ED02
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 20:00:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8C58A804F2;
 Fri, 10 Jul 2020 22:00:46 +0200 (CEST)
Date: Fri, 10 Jul 2020 22:00:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v2 PATCH] drm/panel: auo, b116xw03: fix flash backlight when
 power on
Message-ID: <20200710200045.GA690424@ravnborg.org>
References: <20200705094514.34526-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200705094514.34526-1-jitao.shi@mediatek.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8 a=e5mUnYsNAAAA:8
 a=gnzG3gG3vXdd7EKY-HoA:9 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
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
Cc: David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 05, 2020 at 05:45:14PM +0800, Jitao Shi wrote:
> Delay the backlight on to make sure the video stable.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Thanks, fixed up and applied to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3ad828eaefe1..61781ffa7840 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -724,6 +724,7 @@ static const struct drm_display_mode auo_b116xw03_mode = {
>  	.vsync_end = 768 + 10 + 12,
>  	.vtotal = 768 + 10 + 12 + 6,
>  	.vrefresh = 60,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>  };
>  
>  static const struct panel_desc auo_b116xw03 = {
> @@ -734,6 +735,12 @@ static const struct panel_desc auo_b116xw03 = {
>  		.width = 256,
>  		.height = 144,
>  	},
> +	.delay = {
> +		.enable = 400,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +	.connector_type = DRM_MODE_CONNECTOR_eDP,
>  };
>  
>  static const struct drm_display_mode auo_b133xtn01_mode = {
> -- 
> 2.25.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
