Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDAA570D30
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 00:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899A091E44;
	Mon, 11 Jul 2022 22:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB46C91E40
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 22:10:07 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id o133so8338688oig.13
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=V4mk1W3OniljS8YPM11si/jZlWMggyziuS1oj31jQVM=;
 b=FQHRTU7ZvcqILN4Ud1+1ls+ML6DsKpf6hZvdi1PXkWJxoOm8WI58KO8JpBFOntcWco
 KLkuGGR19dZS2kAOzW8KECrJln5Ib/RMK4b+IS4VKtpM3oOHodOKTrFj/OFnFSRX36cv
 utAZO5uiRv/VMsJIRRr14CiAOUVBGa/lwUIJtXezQGrJsKeTy7Nc+wjc5ljEWPbBhtWj
 dng3N9KslipjBaJZi0jZzETTaa+dDsfiBguuFno6paGnM6Lm42CWxuJupiHzYShn8j7b
 uQ9LPFgCT6yLC3gtZCNHnhwHfCGvC2T4+bl1YjTnZ78KdKayAL2/JWVWk3jgzttIIrv+
 Fr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V4mk1W3OniljS8YPM11si/jZlWMggyziuS1oj31jQVM=;
 b=Pw5RMxCxihDICCComXlnzm02Fsr7wgalICGDU1bxSA6BrtiBB0PstzOp7Q3WDmjxqb
 PZZvAVWH5s5eV0O3Hd5bSw1cE8jo7bn7sJquUttRZAXnPK/B5gO9q8wph3NkDT2qTR6Y
 tThtf+LYCXeO/JmJFyElntsJvd7DgKp29j7PsowGwM7tTtuvt5/SVmxBahN9+cHcz8Bf
 GYMu1/0OgR+u3rVEpM3rAZMBep/gNP+zRh2F0eizsS5msuL+6d9ZbW6f5evTcIaPYU3J
 OILQrc4aGMfxvuoAu1K0cKrQMZ74wEB1JAoMaY9QA3rAfBjJ6cplXR9myohQF3e7aCSK
 F82g==
X-Gm-Message-State: AJIora9qGlkR/Ef7s0WDuACvfgireZrO49M6W9yK/6gQW0e39vQVWf3o
 OtAAlicFSoY7aLTqnoUjmFev9Q==
X-Google-Smtp-Source: AGRyM1t140/a/OrsmWjfzbQXpBvjuOvtdzQsGzuy57X3fj66JnFKdgeE/F13jZWfyePITILiTg0Umw==
X-Received: by 2002:a05:6808:f89:b0:339:ce78:1ad8 with SMTP id
 o9-20020a0568080f8900b00339ce781ad8mr315866oiw.207.1657577406972; 
 Mon, 11 Jul 2022 15:10:06 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 h4-20020a056870170400b000f5ccbb7d75sm3848978oae.1.2022.07.11.15.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 15:10:06 -0700 (PDT)
Message-ID: <958cb551-52da-615d-64e3-cf0c2da61789@kali.org>
Date: Mon, 11 Jul 2022 17:10:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v3 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/11/22 4:21 AM, Dmitry Baryshkov wrote:
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index d6dd4d99a229..b362a7bf4d97 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>   	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>   }
>   
> -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> +static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
>   {
> -	if (pdata->connector->display_info.bpc <= 6)
> +	if (connector->display_info.bpc <= 6)
>   		return 18;
>   	else
>   		return 24;
> @@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>   	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>   };
>   
> -static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
> +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
>   {
>   	unsigned int bit_rate_khz, dp_rate_mhz;
>   	unsigned int i;
> @@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
>   		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>   
>   	/* Calculate minimum bit rate based on our pixel clock. */
> -	bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
> +	bit_rate_khz = mode->clock * bpp;
>   
>   	/* Calculate minimum DP data rate, taking 80% as per DP spec */
>   	dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
> @@ -1016,12 +1016,21 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>   				       struct drm_bridge_state *old_bridge_state)
>   {
>   	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +	struct drm_connector *connector;
>   	const char *last_err_str = "No supported DP rate";
>   	unsigned int valid_rates;
>   	int dp_rate_idx;
>   	unsigned int val;
>   	int ret = -EINVAL;
>   	int max_dp_lanes;
> +	unsigned int bpp;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
> +							     bridge->encoder);
> +	if (!connector) {
> +		dev_err_ratelimited(pdata->dev, "Could not get the connector\n");
> +		return;
> +	}
>   
>   	max_dp_lanes = ti_sn_get_max_lanes(pdata);
>   	pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> @@ -1047,8 +1056,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>   	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
>   			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
>   
> +	bpp = ti_sn_bridge_get_bpp(connector);
>   	/* Set the DP output format (18 bpp or 24 bpp) */
> -	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> +	val = bpp == 18 ? BPP_18_RGB : 0;
>   	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
>   
>   	/* DP lane config */
> @@ -1059,7 +1069,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>   	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
>   
>   	/* Train until we run out of rates */
> -	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> +	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
>   	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>   	     dp_rate_idx++) {
>   		if (!(valid_rates & BIT(dp_rate_idx)))

Tested on the Lenovo Yoga C630.  bpc is found to be 6, which I believe 
is correct.

Tested-by: Steev Klimaszewski <steev@kali.org>

