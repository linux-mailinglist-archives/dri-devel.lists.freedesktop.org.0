Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4256D102
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1B018ABF8;
	Sun, 10 Jul 2022 19:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833E18ABF7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=iyE7B5mxH23Qpbml6rr1QS7WcljyPHYFfCKlWCb/Qwg=;
 b=MHcGG5wiDQn2lLhYPwcianFrn5Q4XWqleTBc8nh0ptWoZJEGrvM6pgRPZbHZmq4ao/FOpTd4T6kRm
 p1jmzzkJijV96rpEG2z7HBnbYkTi2MbMp4BrNOpI/IUh+0xoSLH+98vrHbsZbYiSIVxk2NQ6b6bRDx
 Tu8Q81kj3g8bxh+lVrt3um2QQDm2FrI0Jm/qkK4o8vRvWuodQBfMSf+KD24V65O33TyVU5/Lba2Sa8
 esE6A0FhixIkggGKL5b/O0rGHEubTMLhFnJQsozl5Rj7JIABHRGy7svFtT6snUdRwqt7TQOx3od+sA
 WVgeB26qyY70Lr7GDBP7yUCjU2et3pA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=iyE7B5mxH23Qpbml6rr1QS7WcljyPHYFfCKlWCb/Qwg=;
 b=YENmjPIfhOKP9hsi+mIUiqdyXj1mRjZR/ZG+GXW8+5qAQ12pLo4PyNJKDq+eAUgUdo9DCcQrdMhhV
 jLtX79xAg==
X-HalOne-Cookie: 6d7e2cf7ebc2ef8c736aba40a23a457d92014d9c
X-HalOne-ID: 1258a0ac-0084-11ed-a6c6-d0431ea8a283
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1258a0ac-0084-11ed-a6c6-d0431ea8a283;
 Sun, 10 Jul 2022 19:11:16 +0000 (UTC)
Date: Sun, 10 Jul 2022 21:11:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 2/3] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
Message-ID: <YsskUiGP8HCQeUUR@ravnborg.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710184536.172705-3-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, Jul 10, 2022 at 09:45:35PM +0300, Dmitry Baryshkov wrote:
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 01171547f638..df08207d6223 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>  	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>  
> -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> +static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
>  {
> -	if (pdata->connector->display_info.bpc <= 6)
> +	if (connector->display_info.bpc <= 6)
>  		return 18;
>  	else
>  		return 24;
> @@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>  	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>  };
>  
> -static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
> +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
>  {
>  	unsigned int bit_rate_khz, dp_rate_mhz;
>  	unsigned int i;
> @@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>  
>  	/* Calculate minimum bit rate based on our pixel clock. */
> -	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
> +	bit_rate_khz = mode->clock * bpp;
>  
>  	/* Calculate minimum DP data rate, taking 80% as per DP spec */
>  	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
> @@ -1016,12 +1016,19 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +	struct drm_connector *connector;
>  	const char *last_err_str = "No supported DP rate";
>  	unsigned int valid_rates;
>  	int dp_rate_idx;
>  	unsigned int val;
>  	int ret = -EINVAL;
>  	int max_dp_lanes;
> +	unsigned int bpp;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
> +							     bridge->encoder);
> +	if (!connector)
> +		return;
It would be prudent with a dev_err() logging here as we do not expect to
fail.
I looked into something similar, but with a less elegant solution, and
could not convince myself that the display driver would create the
connector before ti_sn_bridge_atomic_enable() was called.

This is another reason why a dev_err would be nice - so tester could see
if this fails or not.

With the dev_err added:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  
>  	max_dp_lanes = ti_sn_get_max_lanes(pdata);
>  	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> @@ -1047,8 +1054,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
>  			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
>  
> +	bpp = ti_sn_bridge_get_bpp(connector);
>  	/* Set the DP output format (18 bpp or 24 bpp) */
> -	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> +	val = (bpp == 18) ? BPP_18_RGB : 0;
>  	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
>  
>  	/* DP lane config */
> @@ -1059,7 +1067,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
>  
>  	/* Train until we run out of rates */
> -	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> +	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
>  	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>  	     dp_rate_idx++) {
>  		if (!(valid_rates & BIT(dp_rate_idx)))
> -- 
> 2.35.1
