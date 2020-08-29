Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0FC256A3A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 23:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF386E09F;
	Sat, 29 Aug 2020 21:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68506E09F
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 21:04:51 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0DF9180487;
 Sat, 29 Aug 2020 23:04:46 +0200 (CEST)
Date: Sat, 29 Aug 2020 23:04:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] drm/bridge: Fix the dsi remote end-points
Message-ID: <20200829210445.GA796939@ravnborg.org>
References: <20200828074251.3788165-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828074251.3788165-1-vkoul@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EgokR_zQcP2_nzH7EWcA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 01:12:50PM +0530, Vinod Koul wrote:
> DSI end-points are supposed to be at node 0 and node 1 as per binding.
> So fix this and use node 0 and node 1 for dsi.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Thanks, applied to drm-misc-next.

	Sam
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 1009fc4ed4ed..d734d9402c35 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -960,13 +960,13 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
>  static int lt9611_parse_dt(struct device *dev,
>  			   struct lt9611 *lt9611)
>  {
> -	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 1, -1);
> +	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
>  	if (!lt9611->dsi0_node) {
>  		dev_err(lt9611->dev, "failed to get remote node for primary dsi\n");
>  		return -ENODEV;
>  	}
>  
> -	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 2, -1);
> +	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
>  
>  	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
>  
> -- 
> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
