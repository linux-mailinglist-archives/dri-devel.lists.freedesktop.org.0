Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6433346B57
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 22:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42C56E921;
	Tue, 23 Mar 2021 21:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913F26E921
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 21:46:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B733DB1D;
 Tue, 23 Mar 2021 22:46:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616535970;
 bh=Uze8l2oHcPC8MtkpUZ2eSJ2rMkiJCYeeUHCf7SRLrrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OUMbWTqT4pd9L4vLfj1WXuDcsp1pG6Ds6vVO66+kOIYPQpPay4vYl78W8uByVnkqv
 0X21Y6u58nrJB/wUmnZTDdqhLBcjhBDiENirXfpjSA7undfwAGGW1I2F0JoHjEisqc
 DSqxaoO1/DbKEtCoKm2KPoag2pknbmvcdRNJubY4=
Date: Tue, 23 Mar 2021 23:45:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store
 valid rates
Message-ID: <YFphd/KA2Z5p5d4k@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
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
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Tue, Mar 23, 2021 at 02:08:55PM -0700, Doug Anderson wrote:
> On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> >
> > The valid rates are stored in an array of 8 booleans. Replace it with a
> > bitmask to save space.
> 
> I'm curious: do you have evidence that this does anything useful? I
> guess you're expecting it to save .text space, right? Stack usage and
> execution time differences should be irrelevant--it's not in a
> critical section and the difference should be tiny anyway. As far as
> .text segment goes, it's not obvious to me that the compiler will use
> fewer instructions to manipulate bits compared to booleans.
> 
> Doing a super simple "ls -ah" on vmlinux (unstripped):
> 
> Before: 224820232 bytes
> After: 224820376 bytes
> 
> ...so your change made it _bigger_.   OK, so running "strip
> --strip-debug" on those:
> 
> Before: 26599464 bytes
> After: 26599464 bytes
> 
> ...so exactly the same. I tried finding some evidence using "readelf -ah":
> 
> Before:
>   [ 2] .text             PROGBITS         ffffffc010010000  00020000
>        0000000000b03508  0000000000000000 WAX       0     0     65536
>   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
>        00000000002e84b3  0000000000000000 WAMS       0     0     4096
> 
> After:
>   [ 2] .text             PROGBITS         ffffffc010010000  00020000
>        0000000000b03508  0000000000000000 WAX       0     0     65536
>   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
>        00000000002e84b3  0000000000000000 WAMS       0     0     4096
> 
> Maybe you have some evidence showing an improvement? Ah, OK. I
> disassembled ti_sn_bridge_enable() and your patch saves 12 bytes, but
> I guess maybe alignment washes it out in reality...
> 
> 
> In terms of readability / conventions, I personally find this change a
> bit of a wash. I mean, I guess I originally implemented it as an array
> and I thought that was the most readable, but I like bitfields fine
> too. If everyone loves it then I won't object, but to me it feels like
> touching lines of code for something that's personal preference. ;-)

You're right that the .text and CPU time improvements were not my
target. I was focussed on stack usage, as that's a limited resource in
the kernel. I don't have any evidence that we would be close to any
limit, so it's tiny, and if you or anyone else have a strong opinion
that an array of booleans is better due to readability concerns, I can
drop this change. I only thought about those poor 7 bits in every bool
that sat there unused, feeling useless :-)

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++-----------
> >  1 file changed, 13 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index c45420a50e73..1d1be791d5ba 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -557,9 +557,9 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
> >         return i;
> >  }
> >
> > -static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
> > -                                         bool rate_valid[])
> > +static unsigned int ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata)
> >  {
> > +       unsigned int valid_rates = 0;
> >         unsigned int rate_per_200khz;
> >         unsigned int rate_mhz;
> >         u8 dpcd_val;
> > @@ -599,13 +599,13 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
> >                              j < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
> >                              j++) {
> >                                 if (ti_sn_bridge_dp_rate_lut[j] == rate_mhz)
> > -                                       rate_valid[j] = true;
> > +                                       valid_rates |= BIT(j);
> >                         }
> >                 }
> >
> >                 for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
> > -                       if (rate_valid[i])
> > -                               return;
> > +                       if (valid_rates & BIT(i))
> > +                               return valid_rates;
> >                 }
> >                 DRM_DEV_ERROR(pdata->dev,
> >                               "No matching eDP rates in table; falling back\n");
> > @@ -627,15 +627,17 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
> >                               (int)dpcd_val);
> >                 fallthrough;
> >         case DP_LINK_BW_5_4:
> > -               rate_valid[7] = 1;
> > +               valid_rates |= BIT(7);
> >                 fallthrough;
> >         case DP_LINK_BW_2_7:
> > -               rate_valid[4] = 1;
> > +               valid_rates |= BIT(4);
> >                 fallthrough;
> >         case DP_LINK_BW_1_62:
> > -               rate_valid[1] = 1;
> > +               valid_rates |= BIT(1);
> >                 break;
> >         }
> > +
> > +       return valid_rates;
> >  }
> >
> >  static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
> > @@ -753,8 +755,8 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
> >  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> >  {
> >         struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> > -       bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
> >         const char *last_err_str = "No supported DP rate";
> > +       unsigned int valid_rates;
> >         int dp_rate_idx;
> >         unsigned int val;
> >         int ret = -EINVAL;
> > @@ -793,13 +795,13 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> >         regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
> >                            val);
> >
> > -       ti_sn_bridge_read_valid_rates(pdata, rate_valid);
> > +       valid_rates = ti_sn_bridge_read_valid_rates(pdata);
> >
> >         /* Train until we run out of rates */
> >         for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> >              dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
> >              dp_rate_idx++) {
> > -               if (!rate_valid[dp_rate_idx])
> > +               if (!(valid_rates & BIT(dp_rate_idx)))
> >                         continue;
> >
> >                 ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
> 
> In any case, since it does save 12 bytes:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
