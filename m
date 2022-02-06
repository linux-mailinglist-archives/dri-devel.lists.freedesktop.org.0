Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879084AB264
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 22:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018D710F655;
	Sun,  6 Feb 2022 21:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573D10F655
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 21:33:13 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 87b6f5d4-8794-11ec-b20b-0050568c148b;
 Sun, 06 Feb 2022 21:34:14 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id F280B194BAB;
 Sun,  6 Feb 2022 22:33:11 +0100 (CET)
Date: Sun, 6 Feb 2022 22:33:09 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
Message-ID: <YgA+lcSNaQ2x4Wef@ravnborg.org>
References: <20220204143337.89221-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204143337.89221-1-narmstrong@baylibre.com>
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
Cc: jonas@kwiboo.se, robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 jernej.skrabec@gmail.com, biju.das.jz@bp.renesas.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neail,

On Fri, Feb 04, 2022 at 03:33:37PM +0100, Neil Armstrong wrote:
> When the dw-hdmi bridge is in first place of the bridge chain, this
> means there is no way to select an input format of the dw-hdmi HW
> component.
> 
> Since introduction of display-connector, negotiation was broken since
> the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
> in last position of the bridge chain or behind another bridge also
> supporting input & output format negotiation.
> 
> Commit 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks")
> was introduced to make negotiation work again by making display-connector
> act as a pass-through concerning input & output format negotiation.
> 
> But in the case where the dw-hdmi is single in the bridge chain, for
> example on Renesas SoCs, with the display-connector bridge the dw-hdmi
> is no more single, breaking output format.

I have forgotten all the details during my leave from drm, so I
may miss something obvious.
This fix looks like it papers over some general thingy with the
format negotiation.

We do not want to see the below in all display drivers, so
I assume the right fix is to stuff it in somewhere in the framework.

Or do I miss something?

	Sam


> 
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Fixes: 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks").
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
> Changes since v2:
> - Add rob's r-b
> - Fix invalid Fixes commit hash
> 
> Changes since v1:
> - Remove bad fix in dw_hdmi_bridge_atomic_get_input_bus_fmts
> - Fix typos in commit message
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..97cdc61b57f6 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  	if (!output_fmts)
>  		return NULL;
>  
> -	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */
> -	if (list_is_singular(&bridge->encoder->bridge_chain)) {
> +	/* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
> +	if (list_is_singular(&bridge->encoder->bridge_chain) ||
> +	    list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
>  		*num_output_fmts = 1;
>  		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>  
> -- 
> 2.25.1
