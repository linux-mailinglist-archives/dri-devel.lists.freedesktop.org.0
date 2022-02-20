Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B74BCC34
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 05:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739F810E302;
	Sun, 20 Feb 2022 04:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8282510E302
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 04:52:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C20625B;
 Sun, 20 Feb 2022 05:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645332730;
 bh=1aG/bdP7UqXBWuCxPUBrFTLgOPk908pP5AN9RMlcxmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Go5D4VtKSuXyTESjXSw+krd6vn2GHsbOstWSBORXQnihbjLaCX6w5YUw8ii0LQ/er
 Z8RkLZkjZXP4msQUf1am10zN2ATOIIdsrTA+XB4fdU+32V7z/B653YwZHCbw82IbTA
 vF25AXOfVoZN8hUHkWZF1qfqDHPYhSioROYyKTL4=
Date: Sun, 20 Feb 2022 06:52:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G070Y2-L01 BPP settings
Message-ID: <YhHI8OjUfKb2lDng@pendragon.ideasonboard.com>
References: <20220220040718.532866-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220220040718.532866-1-marex@denx.de>
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
Cc: Christoph Fritz <chf.fritz@googlemail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sun, Feb 20, 2022 at 05:07:18AM +0100, Marek Vasut wrote:
> The Innolux G070Y2-L01 supports two modes of operation:
> 1) FRC=Low/NC ... MEDIA_BUS_FMT_RGB666_1X7X3_SPWG ... BPP=6
> 2) FRC=High ..... MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ... BPP=8
> 
> Currently the panel description mixes both, BPP from 1) and bus
> format from 2), which triggers a warning at panel-simple.c:615.
> 
> Pick the later, set bpp=8, fix the warning.
> 
> Fixes: a5d2ade627dca ("drm/panel: simple: Add support for Innolux G070Y2-L01")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 49e56adff6226..4405a9dc7574f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2137,7 +2137,7 @@ static const struct display_timing innolux_g070y2_l01_timing = {
>  static const struct panel_desc innolux_g070y2_l01 = {
>  	.timings = &innolux_g070y2_l01_timing,
>  	.num_timings = 1,
> -	.bpc = 6,
> +	.bpc = 8,
>  	.size = {
>  		.width = 152,
>  		.height = 91,

-- 
Regards,

Laurent Pinchart
