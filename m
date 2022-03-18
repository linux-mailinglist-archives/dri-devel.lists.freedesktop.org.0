Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0DD4DE249
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 21:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D62F10E067;
	Fri, 18 Mar 2022 20:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE31810E06D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 20:17:00 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 t8-20020a0568301e2800b005b235a56f2dso6276979otr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 13:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8tlcYNpepdm22QA3Lct8SGtvDtAuqT6l+yuSa0ZQBdU=;
 b=kmAE+PWKLmMMOioiuldX7Avv+MTex0WOK+WL61BN1rwSZWKSmDbZ05d79+oV58GQkK
 sUagG8aQqGWp60xoZZ2FuXeqeDqVRRzoJZJ6jGA2rent4uXBZs4WLVz17kKnSkGF4RIi
 y4v5PPoVmWKOVs9nGj25JlJHFV5D1Zip3Nd1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8tlcYNpepdm22QA3Lct8SGtvDtAuqT6l+yuSa0ZQBdU=;
 b=JgRzmVMcjVmionNCUHjiLwNnBG1YZhL/0KbwZ2oTSdcFdIf8BW0fswQKTKCU/E86jL
 nPZDSRe29Zsp/xUAVktznL9e3ASYX9cqiCDr9AhMNj1jSo1fQqZWHHKAkfILXPPbjwxp
 0aEzyGZWptaTNeL9KXr2+aF8yOYjCSgOdiOd34A+l/RheCH5YaUtkGiElMl3Avf7r1v2
 9R2IwIwWQXe21BDBsgpCBl7lpkF3YCukOVN7tIORc24BUA+fcAkyS3nC8e4cz3OFMGf6
 KL4qCXR7owzK6yU846/q1WPhpbB4z8wxdHaqWoNnI7kslOz+rPCDYcHCvRdnV1GBserj
 Aklg==
X-Gm-Message-State: AOAM533VJjXxPwJ9k8SUAsJpoAAu5wK1ytpVHzh6uVWqARZC//ukp9VX
 Fp6fycEKEgSkJwapMUq4GXv/u9o0GDImZuLkGMvuBw==
X-Google-Smtp-Source: ABdhPJwijT7fYkKE3KtZ9zZndfySXiygtZ4IoqRyxDGO65XURBz78vQHVuBq4cEGNrcjzKsfJyluEZ7Y5EkR7kYPOF0=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr2546954oth.77.1647634619985; Fri, 18 Mar
 2022 13:16:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Mar 2022 13:16:59 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
 <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Mar 2022 13:16:59 -0700
Message-ID: <CAE-0n53U=bqPTGtPx2Ho5axtO6EL6WtOtmFisxSufC6OZERV1Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
 interaction
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, quic_kalyant <quic_kalyant@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2022-03-18 09:24:17)
> Hi,
>
> On Thu, Mar 17, 2022 at 6:19 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Sankeerth Billakanti (2022-03-16 10:35:51)
> > >         The source device should ensure the sink is ready before
> > > proceeding to read the sink capability or performing any aux transactions.
> > > The sink will indicate its readiness by asserting the HPD line.
> > >
> > >         The eDP sink requires power from the source and its HPD line will
> > > be asserted only after the panel is powered on. The panel power will be
> > > enabled from the panel-edp driver.
> > >
> > >         The controller driver needs to wait for the hpd line to be asserted
> > > by the sink.
> > >
> > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_aux.c     |  6 ++++++
> > >  drivers/gpu/drm/msm/dp/dp_catalog.c | 23 +++++++++++++++++++++++
> > >  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> > >  drivers/gpu/drm/msm/dp/dp_reg.h     |  7 ++++++-
> > >  4 files changed, 36 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> > > index 6d36f63..2ddc303 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > > @@ -337,6 +337,12 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
> > >                 goto exit;
> > >         }
> > >
> > > +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> >
> > Why are we making aux transactions when hpd isn't asserted? Can we only
> > register the aux device once we know that state is "connected"? I'm
> > concerned that we're going to be possibly polling the connected bit up
> > to some amount of time (0x0003FFFF usecs?) for each aux transfer when
> > that doesn't make any sense to keep checking. We should be able to check
> > it once, register aux, and then when disconnect happens we can
> > unregister aux.
>
> This is for eDP and, unless someone wants to redesign it again, is
> just how it works.
>
> Specifically:
>
> 1. On eDP you _always_ report "connected". This is because when an eDP
> panel is turned off (but still there) you actually have no way to
> detect it--you just have to assume it's there. And thus you _always_
> register the AUX bus.

Is reporting "connected" the same as HPD being asserted in the case of
eDP? I can understand wanting to report "connected", because as you say,
the panel is always connected; there aren't dongles or cables involved.
But the state of the HPD pin is changing at runtime, and eDP supports
irq_hpd pulses from what I recall, for "link management".

I think this device requires the status bit in the hardware to say it is
"connected" before aux transactions are guaranteed to work. Presumably
the HPD pin could go be asserted at the SoC's pad and there could be
some time still where the hardware status bit hasn't flipped over to
"connected" yet and thus aux transactions are going to fail. Can qcom
confirm this?

>
> 2. When we are asked to read the EDID that happens _before_ the normal
> prepare/enable steps. The way that this should work is that the
> request travels down to the panel. The panel turns itself on (waiting
> for any hardcoded delays it knows about) and then initiates an AUX
> transaction. The AUX transaction is in charge of waiting for HPD.

Are we talking about generic_edp_panel_probe()? Why doesn't that poll
hpd gpio like panel_edp_prepare_once() does? Are there any links to
discussions about this I can read? Pushing hpd state checking into aux
transactions looks like the wrong direction. Also, as I said up above I
am concerned that even checking the GPIO won't work and we need some way
to ask the bridge if HPD is asserted or not and then fallback to the
GPIO method if the display phy/controller doesn't have support to check
HPD internally. Something on top of DRM_BRIDGE_OP_HPD?

>
>
> For the DP case this should not cause any significant overhead, right?
> HPD should always be asserted so this is basically just one extra IO
> read confirming that HPD is asserted which should be almost nothing...
> You're just about to do a whole bunch of IO reads/writes in order to
> program the AUX transaction anyway.

In the DP case the dongle/cable can be disconnected in the middle of aux
transactions. If that happens we could be waiting a while in this
transfer function to timeout looking for the status bit. The driver
already gets an "unplug" irq when the cable is disconnected though so it
would be better to figure out a way to stop the aux transactions quickly
when that happens without having to read the hardware and poll the bit
that we already know is doomed to timeout. I think apple dongles throw
this logic for a loop though because the HDMI cable can be disconnected
from the dongle and then we don't see an "unplug" irq, just the number
of sinks becomes 0. Maybe there's an irq_hpd event, not sure.

>
>
> > > +       if (ret) {
> > > +               DRM_DEBUG_DP("DP sink not ready for aux transactions\n");
> > > +               goto exit;
> > > +       }
> > > +
> > >         dp_aux_update_offset_and_segment(aux, msg);
> > >         dp_aux_transfer_helper(aux, msg, true);
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > index fac815f..2c3b0f7 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > @@ -242,6 +242,29 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
> > >         phy_calibrate(phy);
> > >  }
> > >
> > > +int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
> > > +{
> > > +       u32 state, hpd_en, timeout;
> > > +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> > > +                               struct dp_catalog_private, dp_catalog);
> > > +
> > > +       hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL) &
> > > +                                       DP_DP_HPD_CTRL_HPD_EN;
> >
> > Use two lines
> >
> >         hpd_en = dp_read_aux();
> >         hpd_en &= DP_DP_HPD_CTRL_HPD_EN;
> >
> > > +
> > > +       /* no-hpd case */
> > > +       if (!hpd_en)
> > > +               return 0;
>
> I guess reading from hardware is fine, but I would have expected the
> driver to simply know whether HPD is used or not. Don't need to read
> it from hardware, do we? It's not like it's changing from minute to
> minute--this is something known at probe time.

Are you saying that HPD is always asserted? That doesn't sound right.
My understanding is that HPD will be asserted after the panel is powered
up. Before that HPD is deasserted. Similarly, when we power down the
panel, HPD will be deasserted. I guess DRM wants to assume that an eDP
panel is always connected? That sounds like it might be OK as long as
userspace doesn't use "connected" to know that it's OK to do things like
read/write aux or push pixels to the panel when HPD is deasserted.
