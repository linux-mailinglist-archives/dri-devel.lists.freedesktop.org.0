Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6D32A35D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 16:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57796E196;
	Tue,  2 Mar 2021 15:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3796E6E196
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 15:10:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id k66so3108553wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 07:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXOLlDxgBV9CPVsJZhCVv2ZAjJMGwcQADbotLvfbenk=;
 b=S+M6qzZ7yCmHcy3il0rDzNS/Vlzq84AvNlMDXuGTEwX6ZJ9wa7uAgNCDxFnAr04WKk
 +XEHnKh+yg3E3Ppd7Jjdh/DwXO9Dn99pRYfrQjREe0W/zmG8CwLz9NxzK2x94OfLMJtE
 2RyfT0UVnZB4jCrpDyLXl7kkibonIrCQRZFzBokWzByp3YJqOLsQzjdRHcGaaMRAiKz/
 zmmmyoQ6rkaubYyoG9MN9MaJDioEi3dEsLDRY2I0CTn/8/nvogJroDKMvz0CvXaeUNzx
 6R8dkZ1WVVc+3Y2jAkUfQRL3SUFjMB0JvUvX8eD7tPqypJC5bVz6kE/vpWuMROxIzQaR
 +/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXOLlDxgBV9CPVsJZhCVv2ZAjJMGwcQADbotLvfbenk=;
 b=NF1c0/dhZYzUhtf2nzwkZLf17aNNYjb5T0JJWX1i5u9gk3awUTtvaR7A7YfweSNwVW
 1w/Qq1zxRQcReS2zUmyN4DiCTma7ei6Ejc6pRzQWAWkGDP0e1+wMnSqTy7Iod1jrnt1X
 yGsXLfizDwc4r1U3JYzQNYScjb6iwqWp0JgpmhW84drc3CRLAI7exajvByLq8NjIYW5D
 bkrd4GZI3c04TcJUbq8QHhYd5yL+B+asCmHQ6mR0uy9gAqAIXsu1sejyeY1fu+Vz96WR
 1ulZBeEUwEeB51Vr1cRXhj5ppFeuwltzt+yLdppxoQxv/sVLIajkcvZrtc3KJlHYaye+
 s6Wg==
X-Gm-Message-State: AOAM532E29yN0Tw3HlQMZaWlF0M1R/UMDgjy9KOw156IVmJM5tApLxq1
 USW3ITstVnght2Ba1VFDcT1Qy/WYLPMSsW9pcnYlmg==
X-Google-Smtp-Source: ABdhPJyAoGvTCSUcVybeiOLq0BiGe/yxxG90GrRzZerwITF1bUCaDidNmZLCBCAQSjq4LRzRo8HrnjteTLi1tMeDZRI=
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr4336707wmo.183.1614697852764; 
 Tue, 02 Mar 2021 07:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-5-maxime@cerno.tech>
 <CAPY8ntDwQG1Ax8wgc2zZMKZgXk2+efBtFFiu7YF=_RX4Y4YUiA@mail.gmail.com>
 <20210302130154.o4ljnzqjr3gfsvpn@gilmour>
In-Reply-To: <20210302130154.o4ljnzqjr3gfsvpn@gilmour>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Mar 2021 15:10:37 +0000
Message-ID: <CAPY8ntCh510mg_J7+2J_d1bd1Dgd+q8rGwfM4D9nA63z1-DFtA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/vc4: hdmi: Check and warn if we can't reach 4kp60
 frequencies
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Mar 2021 at 13:02, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> Thanks for your review
>
> On Thu, Feb 25, 2021 at 04:38:37PM +0000, Dave Stevenson wrote:
> > On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > In order to reach the frequencies needed to output at 594MHz, the
> > > firmware needs to be configured with the appropriate parameters in the
> > > config.txt file (enable_hdmi_4kp60 and force_turbo).
> >
> > force_turbo isn't the right way to go about this as it permanently
> > bumps all the clocks up, even if running the display at VGA.
>
> so enable_hdmi_4kp60 is enough?

No, but force_turbo=1 is the wrong way to go about fixing that.

I'll start a thread with Dom & Tim to discuss the best way of doing
this. Immediate thoughts are that either vc4_hdmi needs to request the
core clock be increased, or potentially the firmware could note the
boosted BVB rate and increase core accordingly.

  Dave

> > > Let's detect it at bind time, warn the user if we can't, and filter out
> > > the relevant modes.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++++
> > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
> > >  2 files changed, 25 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index b5bc742993a4..f05f6da286f7 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -953,6 +953,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> > >         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
> > >                 return -EINVAL;
> > >
> > > +       if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
> > > +               return -EINVAL;
> > > +
> > >         vc4_state->pixel_rate = pixel_rate;
> > >
> > >         return 0;
> > > @@ -972,6 +975,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
> > >         if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
> > >                 return MODE_CLOCK_HIGH;
> > >
> > > +       if (vc4_hdmi->disable_4kp60 && ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK))
> > > +               return MODE_CLOCK_HIGH;
> > > +
> > >         return MODE_OK;
> > >  }
> > >
> > > @@ -1986,6 +1992,17 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
> > >         vc4_hdmi->disable_wifi_frequencies =
> > >                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
> > >
> > > +       if (variant->max_pixel_clock == 600000000) {
> > > +               struct vc4_dev *vc4 = to_vc4_dev(drm);
> > > +               long max_rate = clk_get_max_rate(vc4->hvs->core_clk);
> > > +
> > > +               if (max_rate < 550000000) {
> > > +                       drm_warn(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
> > > +                       drm_warn(drm, "Please change your config.txt file to add hdmi_enable_4kp60 and force_turbo");
> >
> > Do we really want to warn in bind? Again you could have a VGA
> > resolution monitor attached but that would trigger this warning.
> > Can we warn (once) on processing the mode list and filtering out a clk
> > > HDMI_14_MAX_TMDS_CLK mode instead?
>
> That's a good idea indeed, I'll rework the patch to do that
>
> Thanks!
> Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
