Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BAA1C605F
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 20:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3036E80B;
	Tue,  5 May 2020 18:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7111C6E80B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 18:45:20 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id w68so777520vke.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 11:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5wHhztHLFnBrWe2DrhJMe0XhNIi9ECLuQiryle+9hws=;
 b=VVReM2U7DiVBj8k3pkKVcLc66Z4fh4wsIzJxpwUZJi4Wg9YN8qZE6ZEMRt/Ks21ny+
 hY5Q0l3WH6MFzmN5zcVRy81kbiTuz+IMdvhEpenLk2S5TREd1eYQXvn710iYgdIvXwKX
 H7sDIyshHoNBsg+sneB1TQOPqNn1kvJLiuu4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wHhztHLFnBrWe2DrhJMe0XhNIi9ECLuQiryle+9hws=;
 b=nVUaasoT4Xtuy8kxLgW5DJddY/5XN9KdqbZTg+7+UXBpR53hlpY7eAP+NdRvPoMREN
 VTpB9cJPHQsp9E8zLh+dfQKszOt+5dedq4+uNduV/+L3o8itPePAXAMgZ+zSj3W7d4vt
 qaLI16vu4qmc8EdALN+ACbBS9rTcjn9PzGv5lirrcyORb9TYpFN6J369m7tW1Q8w7qeb
 DUBDkLWHI2yn8p1O0D6UV/Kzz0qTL33IQYxj1MxnxFlCJO3sNQcy2Q3ygkimC3BYsbtU
 9nRpyobjzIZwMbsufO87w5PSXGjG0HkI3TE/IpMIsrqJPkQ4KRMXMyhSPvtxXWheO9mt
 9SYw==
X-Gm-Message-State: AGi0PuYWvHVcgtXkaZs2ZBkQb+u6ykBAEudqnH3iFFWyRBcBBPP+/i2U
 mHDWv2rI02vErJGbnLQ8/8T+boNcvAE=
X-Google-Smtp-Source: APiQypIz0ItScfU2X95ukmrkWv5nw44wfZWHSCLHIllscPzRr2JEE8tlnj+BbAcFg0C8OqSd6E3bFA==
X-Received: by 2002:a1f:5fc3:: with SMTP id t186mr3839645vkb.92.1588704318576; 
 Tue, 05 May 2020 11:45:18 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id e136sm1465441vsc.9.2020.05.05.11.45.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 11:45:17 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id s5so817236uad.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 11:45:17 -0700 (PDT)
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr3285723uau.8.1588704316968;
 Tue, 05 May 2020 11:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <158865745768.11125.12003632060774071567@swboyd.mtv.corp.google.com>
In-Reply-To: <158865745768.11125.12003632060774071567@swboyd.mtv.corp.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 May 2020 11:45:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uq6K95FBkKYn=M6+7cfyam11n_f-9AMxosmDBZQYfmsQ@mail.gmail.com>
Message-ID: <CAD=FV=Uq6K95FBkKYn=M6+7cfyam11n_f-9AMxosmDBZQYfmsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering +
 polarity
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Mon, May 4, 2020 at 10:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-05-04 21:36:31)
> > The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
> > remapping of eDP lanes and also polarity inversion.  Both of these
> > features have been described in the device tree bindings for the
> > device since the beginning but were never implemented in the driver.
> > Implement both of them.
> >
> > Part of this change also allows you to (via the same device tree
> > bindings) specify to use fewer than the max number of DP lanes that
> > the panel reports.  This could be useful if your display supports more
> > lanes but only a few are hooked up on your board.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Except for one thing below:
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 1a125423eb07..52cca54b525f 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -707,26 +716,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> >         int dp_rate_idx;
> >         unsigned int val;
> >         int ret = -EINVAL;
> > +       int max_dp_lanes;
> >
> > -       /*
> > -        * Run with the maximum number of lanes that the DP sink supports.
> > -        *
> > -        * Depending use cases, we might want to revisit this later because:
> > -        * - It's plausible that someone may have run fewer lines to the
> > -        *   sink than the sink actually supports, assuming that the lines
> > -        *   will just be driven at a higher rate.
> > -        * - The DP spec seems to indicate that it's more important to minimize
> > -        *   the number of lanes than the link rate.
> > -        *
> > -        * If we do revisit, it would be important to measure the power impact.
> > -        */
> > -       pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
> > +       max_dp_lanes = ti_sn_get_max_lanes(pdata);
> > +       pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> >
> >         /* DSI_A lane config */
> >         val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
>
> Not a problem in this patch, but maybe this can be SN_MAX_DP_LANES -
> pdata->dsi->lanes now.

Since I introduce the define in this patch, I'll update it in v2.


> >         regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
> >                            CHA_DSI_LANES_MASK, val);
> >
> > +       regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
> > +       regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
> > +                          pdata->ln_polrs << LN_POLRS_OFFSET);
> > +
> >         /* set dsi clk frequency value */
> >         ti_sn_bridge_set_dsi_rate(pdata);
> >
> > @@ -1063,6 +1066,50 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
> >         return ret;
> >  }
> >
> > +static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
> > +                                    struct device_node *np)
> > +{
> > +       u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
> > +       u32 lane_polarities[SN_MAX_DP_LANES] = { };
> > +       struct device_node *endpoint;
> > +       u8 ln_assign = 0;
> > +       u8 ln_polrs = 0;
>
> Do we need to assign to 0 to start? Seems like no?

Yes.  See usage:

  ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
  ln_polrs = ln_polrs << 1 | lane_polarities[i];

Notably each time we shift a new bit in we base on the old value.  If
you think it'll make it clearer, I can put this initialization at the
beginning of the loop.  It's 2 extra lines of code but if it adds
clarity I'll do it.


> > +       int dp_lanes;
> > +       int i;
> > +
> > +       /*
> > +        * Read config from the device tree about lane remapping and lane
> > +        * polarities.  These are optional and we assume identity map and
> > +        * normal polarity if nothing is specified.  It's OK to specify just
> > +        * data-lanes but not lane-polarities but not vice versa.
> > +        */
> > +       endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
> > +       dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> > +       if (dp_lanes > 0) {
> > +               of_property_read_u32_array(endpoint, "data-lanes",
> > +                                          lane_assignments, dp_lanes);
> > +               of_property_read_u32_array(endpoint, "lane-polarities",
> > +                                          lane_polarities, dp_lanes);
> > +       } else {
> > +               dp_lanes = SN_MAX_DP_LANES;
> > +       }
>
> Needs an of_node_put(endpoint) here for the
> of_graph_get_endpoint_by_regs() above.

Thanks!  I'll fix in v2, which I'll send out either after a delay of a
few days or whenever I get resolution on my email to Laurent,
whichever comes first.  ;-)


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
