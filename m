Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E202F1A1E85
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 12:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178086EA0D;
	Wed,  8 Apr 2020 10:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCDB6EA0D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 10:05:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 934022002C;
 Wed,  8 Apr 2020 12:05:37 +0200 (CEST)
Date: Wed, 8 Apr 2020 12:05:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] drm/panel: NT39016: Add support for 50 Hz refresh rate
Message-ID: <20200408100536.GB20795@ravnborg.org>
References: <20200408095830.8131-1-paul@crapouillou.net>
 <20200408095830.8131-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408095830.8131-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=7gkXJVJtAAAA:8 a=4Tl8vMu-OU4bpAJtNNUA:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Wed, Apr 08, 2020 at 11:58:30AM +0200, Paul Cercueil wrote:
> By changing the pixel clock and the length of the back porch, it is
> possible to obtain a perfect 50 Hz refresh rate.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Lower case in $subject.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> index f1286cf6528b..05cae8d62d56 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> @@ -325,7 +325,7 @@ static int nt39016_remove(struct spi_device *spi)
>  }
>  
>  static const struct drm_display_mode kd035g6_display_modes[] = {
> -	{
> +	{	/* 60 Hz */
>  		.clock = 6000,
>  		.hdisplay = 320,
>  		.hsync_start = 320 + 10,
> @@ -338,6 +338,19 @@ static const struct drm_display_mode kd035g6_display_modes[] = {
>  		.vrefresh = 60,
>  		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  	},
> +	{	/* 50 Hz */
> +		.clock = 5400,
> +		.hdisplay = 320,
> +		.hsync_start = 320 + 42,
> +		.hsync_end = 320 + 42 + 50,
> +		.htotal = 320 + 42 + 50 + 20,
> +		.vdisplay = 240,
> +		.vsync_start = 240 + 5,
> +		.vsync_end = 240 + 5 + 1,
> +		.vtotal = 240 + 5 + 1 + 4,
> +		.vrefresh = 50,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
>  };
>  
>  static const struct nt39016_panel_info kd035g6_info = {
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
