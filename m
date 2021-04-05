Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA5D353A7E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 03:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9536E4E6;
	Mon,  5 Apr 2021 01:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC756E4E6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 01:04:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DF46D40;
 Mon,  5 Apr 2021 03:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617584685;
 bh=hqEwlgigVcb3IY7SwZRK5/j7ogk7+PtQsnC7wFhwKNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v+jZD/Myw3t5K26Rhdd2HGxfXOm+TXDLMdmt1WaeSON/pdsg+BfnpqxAU1hCKxeA7
 T+Bl8Csju9G44nvkn4daRldh33zLhvZn8HmmauBxQfO2zc0OupVODZBzGdzgTC1sP2
 BKRMuePCOppxVmDeE7bAMN3k2yH4j6t5poeqbqOI=
Date: Mon, 5 Apr 2021 04:04:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 10/12] drm/bridge: ti-sn65dsi86: Read the EDID only if
 refclk was provided
Message-ID: <YGpiAKAETufAuMwF@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.10.I7a8708139ae993f30f51eec7d065a1906c31a4bc@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.10.I7a8708139ae993f30f51eec7d065a1906c31a4bc@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:44PM -0700, Douglas Anderson wrote:
> Though I don't have access to any hardware that uses ti-sn65dsi86 and
> _doesn't_ provide a "refclk", I believe that we'll have trouble
> reading the EDID at bootup in that case. Specifically I believe that
> if there's no "refclk" we need the MIPI source clock to be active
> before we can successfully read the EDID. My evidence here is that, in
> testing, I couldn't read the EDID until I turned on the DPPLL in the
> bridge chip and that the DPPLL needs the input clock to be active.
> 
> Since this is hard to support, let's punt trying to read the EDID if
> there's no "refclk".
> 
> I don't believe there are any users of the ti-sn65dsi86 bridge chip
> that _don't_ use "refclk". The bridge chip is _very_ inflexible in
> that mode. The only time I've seen that mode used was for some really
> early prototype hardware that was thrown in the e-waste bin years ago
> when we realized how inflexible it was.
> 
> Even if someone is using the bridge chip without the "refclk" they're
> in no worse shape than they were before the (fairly recent) commit
> 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC").
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index a76cac93cb46..fb50f9f95b0f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -275,6 +275,18 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  	bool was_enabled;
>  	int num;
>  
> +	/*
> +	 * Don't try to read the EDID if no refclk. In theory it is possible
> +	 * to make this work but it's tricky. I believe that we need to get
> +	 * our upstream MIPI source to provide a pixel clock before we can
> +	 * do AUX transations but we need to be able to read the EDID before
> +	 * we've picked a display mode. The bridge is already super limited
> +	 * if you try to use it without a refclk so presumably limiting to
> +	 * the fixed modes our downstream panel reports is fine.
> +	 */
> +	if (!pdata->refclk)
> +		goto exit;
> +
>  	if (!edid) {
>  		was_enabled = pdata->pre_enabled;
>  
> @@ -291,6 +303,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  			return num;
>  	}
>  
> +exit:
>  	return drm_panel_get_modes(pdata->panel, connector);
>  }
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
