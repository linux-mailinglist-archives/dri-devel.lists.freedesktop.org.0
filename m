Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1951C4E9C
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49686E52E;
	Tue,  5 May 2020 06:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0466E0FD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 05:44:19 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id u10so375379pls.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 22:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=OFyVgPW92xjeHjZOe3d3BTj75xEysQbpF9I3kxPup5I=;
 b=fqcQe4nTEPPqqUKFm8/irKkoCtCZhv5uz7tbiq6X/lrL0rbErtDlV6Z9fIJnnyHTbb
 WXKN028/CTSLOnK0pv+DU+ZH1xDdlXzRTO0xHKOYyaPVcyLAmhwH7TLcqE+vzRbU65K9
 /vOyhR7ZIDYOv8AzmWW2hfJjjb5ukdnp6PLbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=OFyVgPW92xjeHjZOe3d3BTj75xEysQbpF9I3kxPup5I=;
 b=rmYkbqbfPkfDj0GTrp4AI2NDs0J2w6rVdd7LCRgcjS1NE0nVFuMkpdN/odWiT7yf3h
 OsxuWwXsq5dQD7NpjH40BbAvrlA/9J25wzhmDe6DQct9tS2rjTTcukhDb0ceFaG1g0Ik
 cEapVHBVd5StRsUduZTLxjMFYq5MIGkZDoURtQqaFGmMj8pTr08n5SkFd76FHfu0JGlb
 eRTKrUQuHkEDNkXihIR11xB4a7SYo7ZrVC9sf5UNdlXf3Xii2E8Qcb2xAAnXglV5R7DS
 /zZeiYl9FcQeXzjrjaGDH7Nu2VJZHa9gnnqtsJvGAPsgM3ciCJHiFv2dipy8ClpepcRk
 CZoQ==
X-Gm-Message-State: AGi0PuYIGfD66Y10MwUZ4FlYvw3DDMo0FnGbPgMzoe6vbLhXGkXwt3y0
 oU82OD5GsSm+1CxTRFu4ca00dQ==
X-Google-Smtp-Source: APiQypKOZu4YMMmeSCWuV0yt1TPUe1gyOAOvbQ/KrM0zsU6tN1ZsiYm3L3tqll+HXgbuCJ3zsKE3YA==
X-Received: by 2002:a17:902:8641:: with SMTP id
 y1mr1649408plt.14.1588657459376; 
 Mon, 04 May 2020 22:44:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id b29sm862082pfp.68.2020.05.04.22.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 22:44:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering +
 polarity
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Mon, 04 May 2020 22:44:17 -0700
Message-ID: <158865745768.11125.12003632060774071567@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-05-04 21:36:31)
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
> remapping of eDP lanes and also polarity inversion.  Both of these
> features have been described in the device tree bindings for the
> device since the beginning but were never implemented in the driver.
> Implement both of them.
> 
> Part of this change also allows you to (via the same device tree
> bindings) specify to use fewer than the max number of DP lanes that
> the panel reports.  This could be useful if your display supports more
> lanes but only a few are hooked up on your board.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Except for one thing below:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 1a125423eb07..52cca54b525f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -707,26 +716,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>         int dp_rate_idx;
>         unsigned int val;
>         int ret = -EINVAL;
> +       int max_dp_lanes;
>  
> -       /*
> -        * Run with the maximum number of lanes that the DP sink supports.
> -        *
> -        * Depending use cases, we might want to revisit this later because:
> -        * - It's plausible that someone may have run fewer lines to the
> -        *   sink than the sink actually supports, assuming that the lines
> -        *   will just be driven at a higher rate.
> -        * - The DP spec seems to indicate that it's more important to minimize
> -        *   the number of lanes than the link rate.
> -        *
> -        * If we do revisit, it would be important to measure the power impact.
> -        */
> -       pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
> +       max_dp_lanes = ti_sn_get_max_lanes(pdata);
> +       pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
>  
>         /* DSI_A lane config */
>         val = CHA_DSI_LANES(4 - pdata->dsi->lanes);

Not a problem in this patch, but maybe this can be SN_MAX_DP_LANES -
pdata->dsi->lanes now.

>         regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
>                            CHA_DSI_LANES_MASK, val);
>  
> +       regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
> +       regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
> +                          pdata->ln_polrs << LN_POLRS_OFFSET);
> +
>         /* set dsi clk frequency value */
>         ti_sn_bridge_set_dsi_rate(pdata);
>  
> @@ -1063,6 +1066,50 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
>         return ret;
>  }
>  
> +static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
> +                                    struct device_node *np)
> +{
> +       u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
> +       u32 lane_polarities[SN_MAX_DP_LANES] = { };
> +       struct device_node *endpoint;
> +       u8 ln_assign = 0;
> +       u8 ln_polrs = 0;

Do we need to assign to 0 to start? Seems like no?

> +       int dp_lanes;
> +       int i;
> +
> +       /*
> +        * Read config from the device tree about lane remapping and lane
> +        * polarities.  These are optional and we assume identity map and
> +        * normal polarity if nothing is specified.  It's OK to specify just
> +        * data-lanes but not lane-polarities but not vice versa.
> +        */
> +       endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
> +       dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> +       if (dp_lanes > 0) {
> +               of_property_read_u32_array(endpoint, "data-lanes",
> +                                          lane_assignments, dp_lanes);
> +               of_property_read_u32_array(endpoint, "lane-polarities",
> +                                          lane_polarities, dp_lanes);
> +       } else {
> +               dp_lanes = SN_MAX_DP_LANES;
> +       }

Needs an of_node_put(endpoint) here for the
of_graph_get_endpoint_by_regs() above.

> +
> +       /*
> +        * Convert into register format.  Loop over all lanes even if
> +        * data-lanes had fewer elements so that we nicely initialize
> +        * the LN_ASSIGN register.
> +        */
> +       for (i = SN_MAX_DP_LANES - 1; i >= 0; i--) {
> +               ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
> +               ln_polrs = ln_polrs << 1 | lane_polarities[i];
> +       }
> +
> +       /* Stash in our struct for when we power on */
> +       pdata->dp_lanes = dp_lanes;
> +       pdata->ln_assign = ln_assign;
> +       pdata->ln_polrs = ln_polrs;
> +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
