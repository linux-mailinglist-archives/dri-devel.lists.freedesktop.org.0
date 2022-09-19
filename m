Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A05BD084
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066B010E669;
	Mon, 19 Sep 2022 15:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2822610E669
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:19:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B8AD499;
 Mon, 19 Sep 2022 17:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663600744;
 bh=a+tgm8YW9P+vfve/Nys1Rl5YgyMmUeApmVVsQf9hWvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hq4+WkNfms6hxDm+VAKpQa/6MUUdEfwSualc3PsDbGGD2077EAChnASKu2TFyXk8B
 9f2QxEXztH+1tR4C9jAiec28wzaa8DBa44NVEpKo1Q5Rp9ilVabTwTxetx9+NGwy8R
 +6t2o39CP3TN/CQC0zK0Ox0hva4yvJYhi2/fJGeI=
Date: Mon, 19 Sep 2022 18:18:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 03/12] drm/mediatek: Drop chain_mode_fixup call in
 mode_valid()
Message-ID: <YyiIW6mbO+24eaJK@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-4-sam@ravnborg.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Jul 17, 2022 at 07:44:45PM +0200, Sam Ravnborg wrote:
> The mode_valid implementation had a call to
> drm_bridge_chain_mode_fixup() which would be wrong as the mode_valid is
> not allowed to change anything - only to validate the mode.
> 
> As the next bridge is often/always a connector the call had no effect
> anyway. So drop it.
> 
> From the git history I could see this call was included in the original
> version of the driver so there was no help there to find out why it was
> added in the first place. But a lot has changed since the initial driver
> were added and is seems safe to remove the call now.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 3196189429bc..a63b76055f81 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1208,22 +1208,11 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>  				      const struct drm_display_mode *mode)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> -	struct drm_bridge *next_bridge;
>  
>  	dev_dbg(hdmi->dev, "xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
>  		mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
>  		!!(mode->flags & DRM_MODE_FLAG_INTERLACE), mode->clock * 1000);
>  
> -	next_bridge = drm_bridge_get_next_bridge(&hdmi->bridge);
> -	if (next_bridge) {
> -		struct drm_display_mode adjusted_mode;
> -
> -		drm_mode_copy(&adjusted_mode, mode);
> -		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
> -						 &adjusted_mode))
> -			return MODE_BAD;
> -	}
> -
>  	if (hdmi->conf) {
>  		if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
>  			return MODE_BAD;

-- 
Regards,

Laurent Pinchart
