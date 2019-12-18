Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25240123E38
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 05:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15C76E21E;
	Wed, 18 Dec 2019 04:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ADA6E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 04:03:38 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id j17so497623edp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 20:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WvtqXilSlJPN1QGpSxyGGS/ZVTciM36srRLrGnMdy6s=;
 b=cw7thn/2ylkaRR3OBZwjpzr6jSKMMGGYYN/XYtUjcI+PydQaBImiphz/U26IWwXv+E
 rf3rI3letEaVPNje4kANoOg5tmieAziMMqxr2mPaqcvXaoZR1IyZzNBlVLIYKb25/oRR
 2sLCK6sDDyPsO7bX8JCkvhBmzjH7XDpXB68aTY2f6lkJnxsfEH+vtp65Ckd7pdpKE8SG
 jRIvEaBkEsxEuCpAGRCab8GyGRRtkE3hfs0DQwu2kdv4YmXGlNihIIYKfJeDoo0wc+Dx
 HR1//9IYxLPwKNtyrffs2R0xOyFDoHtIsuRbklP5Ap1574p84t2kgJZT3Hy9bgO/8DxY
 5n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WvtqXilSlJPN1QGpSxyGGS/ZVTciM36srRLrGnMdy6s=;
 b=gxYzG7ep2Iw/pQj07qN3NbCSTrUpqJatAJzD98Kl3trY32L+6e1HEXzc2Hhnr8y9xR
 taqmj9QZLpl0EwmQQp1isxoQZrfWrhREbpyV1MLwDSCZu+fEn/hN8+ABqExlsDcFm0jZ
 /w0ZFDJIxgya7QVHYzZ7xNZ/i1Nbzd13PQ+GwMrqwXGIYtXWoKcbmKyuzc0iQjY7T+CL
 HGtUTuhbnTFBkq1yTUCvrPtY7Nf6L17cIj6iQmSjKHTLqdCmwMjgHj6tCYmweSwrVX+S
 qQG8uwkG/PmC+NSm9hX5W8s0vb9H0xiYwDDg9ephWHrnXBjQXF7OmtWBQg3EVKNiDZlh
 xL1w==
X-Gm-Message-State: APjAAAXrUyxdhtgm7P11suQklN5e4hJFHZT1eVKcvNvtIR7wvnNLJu/7
 gpRGzDZBqMBcWYgeGOlS/fkR+FLKaOR+DrkMH68=
X-Google-Smtp-Source: APXvYqye0KX/YqOUN1d9A0hcRCDrWSGNXPE2j0EihGrHWieCJzqQXPVaY4ihg3LYQEgjcP7/y3vK2rzVUgZtABeV+sI=
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr1260655edr.57.1576641817459; 
 Tue, 17 Dec 2019 20:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20191218004741.102067-1-dianders@chromium.org>
 <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
 <CAF6AEGs5CKNhKh_ZLUqWh8_2GxiDiuaTC2P-yzHqz+Dvhbp-VQ@mail.gmail.com>
In-Reply-To: <CAF6AEGs5CKNhKh_ZLUqWh8_2GxiDiuaTC2P-yzHqz+Dvhbp-VQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 17 Dec 2019 20:03:30 -0800
Message-ID: <CAF6AEGukOwr6TUmo3UySML5LWOC-b7vN4NwJv0OGprFafgTdEw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] drm/bridge: ti-sn65dsi86: Avoid invalid rates
To: Douglas Anderson <dianders@chromium.org>
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 8:01 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Dec 17, 2019 at 4:48 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Based on work by Bjorn Andersson <bjorn.andersson@linaro.org>,
> > Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, and
> > Rob Clark <robdclark@chromium.org>.
> >
> > Let's read the SUPPORTED_LINK_RATES and/or MAX_LINK_RATE (depending on
> > the eDP version of the sink) to figure out what eDP rates are
> > supported and pick the ideal one.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 118 ++++++++++++++++++++------
> >  1 file changed, 93 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index e1b817ccd9c7..da5ddf6be92b 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -475,39 +475,103 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
> >         return i;
> >  }
> >
> > -static int ti_sn_bridge_get_max_dp_rate_idx(struct ti_sn_bridge *pdata)
> > +static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
> > +                                         bool rate_valid[])
> >  {
> > -       u8 data;
> > +       u8 dpcd_val;
> > +       int rate_times_200khz;
> >         int ret;
> > +       int i;
> >
> > -       ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &data);
> > +       ret = drm_dp_dpcd_readb(&pdata->aux, DP_EDP_DPCD_REV, &dpcd_val);
> > +       if (ret != 1) {
> > +               DRM_DEV_ERROR(pdata->dev,
> > +                             "Can't read eDP rev (%d), assuming 1.1\n", ret);
> > +               dpcd_val = DP_EDP_11;
> > +       }
> > +
> > +       if (dpcd_val >= DP_EDP_14) {
> > +               /* eDP 1.4 devices must provide a custom table */
> > +               __le16 sink_rates[DP_MAX_SUPPORTED_RATES];
> > +
> > +               ret = drm_dp_dpcd_read(&pdata->aux, DP_SUPPORTED_LINK_RATES,
> > +                                      sink_rates, sizeof(sink_rates));
> > +
> > +               if (ret != sizeof(sink_rates)) {
> > +                       DRM_DEV_ERROR(pdata->dev,
> > +                               "Can't read supported rate table (%d)\n", ret);
> > +
> > +                       /* By zeroing we'll fall back to DP_MAX_LINK_RATE. */
> > +                       memset(sink_rates, 0, sizeof(sink_rates));
> > +               }
> > +
> > +               for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
> > +                       rate_times_200khz = le16_to_cpu(sink_rates[i]);
> > +
> > +                       if (!rate_times_200khz)
> > +                               break;
> > +
> > +                       switch (rate_times_200khz) {
> > +                       case 27000:
>
> maybe a bit bike-sheddy, but I kinda prefer to use traditional normal
> units, ie. just multiply the returned value by 200 and adjust the
> switch case values.  At least then they match the values in the lut
> (other than khz vs mhz), which makes this whole logic a bit more
> obvious... and at that point, maybe just loop over the lut table?

(hit SEND too soon)

and other than that, lgtm but haven't had a chance to test it yet
(although I guess none of us have an eDP 1.4+ screen so maybe that is
moot :-))

BR,
-R


> BR,
> -R
>
> > +                               rate_valid[7] = 1;
> > +                               break;
> > +                       case 21600:
> > +                               rate_valid[6] = 1;
> > +                               break;
> > +                       case 16200:
> > +                               rate_valid[5] = 1;
> > +                               break;
> > +                       case 13500:
> > +                               rate_valid[4] = 1;
> > +                               break;
> > +                       case 12150:
> > +                               rate_valid[3] = 1;
> > +                               break;
> > +                       case 10800:
> > +                               rate_valid[2] = 1;
> > +                               break;
> > +                       case 8100:
> > +                               rate_valid[1] = 1;
> > +                               break;
> > +                       default:
> > +                               /* unsupported */
> > +                               break;
> > +                       }
> > +               }
> > +
> > +               for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
> > +                       if (rate_valid[i])
> > +                               return;
> > +               }
> > +               DRM_DEV_ERROR(pdata->dev,
> > +                             "No matching eDP rates in table; falling back\n");
> > +       }
> > +
> > +       /* On older versions best we can do is use DP_MAX_LINK_RATE */
> > +       ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &dpcd_val);
> >         if (ret != 1) {
> >                 DRM_DEV_ERROR(pdata->dev,
> >                               "Can't read max rate (%d); assuming 5.4 GHz\n",
> >                               ret);
> > -               return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
> > +               dpcd_val = DP_LINK_BW_5_4;
> >         }
> >
> > -       /*
> > -        * Return an index into ti_sn_bridge_dp_rate_lut.  Just hardcode
> > -        * these indicies since it's not like the register spec is ever going
> > -        * to change and a loop would just be more complicated.  Apparently
> > -        * the DP sink can only return these few rates as supported even
> > -        * though the bridge allows some rates in between.
> > -        */
> > -       switch (data) {
> > -       case DP_LINK_BW_1_62:
> > -               return 1;
> > -       case DP_LINK_BW_2_7:
> > -               return 4;
> > +       switch (dpcd_val) {
> > +       default:
> > +               DRM_DEV_ERROR(pdata->dev,
> > +                             "Unexpected max rate (%#x); assuming 5.4 GHz\n",
> > +                             (int)dpcd_val);
> > +               /* fall through */
> >         case DP_LINK_BW_5_4:
> > -               return 7;
> > +               rate_valid[7] = 1;
> > +               /* fall through */
> > +       case DP_LINK_BW_2_7:
> > +               rate_valid[4] = 1;
> > +               /* fall through */
> > +       case DP_LINK_BW_1_62:
> > +               rate_valid[1] = 1;
> > +               break;
> >         }
> > -
> > -       DRM_DEV_ERROR(pdata->dev,
> > -                     "Unexpected max data rate (%#x); assuming 5.4 GHz\n",
> > -                     (int)data);
> > -       return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
> >  }
> >
> >  static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
> > @@ -609,9 +673,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
> >  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> >  {
> >         struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> > +       bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)];
> >         const char *last_err_str = "No supported DP rate";
> >         int dp_rate_idx;
> > -       int max_dp_rate_idx;
> >         unsigned int val;
> >         int ret = -EINVAL;
> >
> > @@ -655,11 +719,15 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> >         regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
> >                            val);
> >
> > +       ti_sn_bridge_read_valid_rates(pdata, rate_valid);
> > +
> >         /* Train until we run out of rates */
> > -       max_dp_rate_idx = ti_sn_bridge_get_max_dp_rate_idx(pdata);
> >         for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> > -            dp_rate_idx <= max_dp_rate_idx;
> > +            dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
> >              dp_rate_idx++) {
> > +               if (!rate_valid[dp_rate_idx])
> > +                       continue;
> > +
> >                 ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
> >                 if (!ret)
> >                         break;
> > --
> > 2.24.1.735.g03f4e72817-goog
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
