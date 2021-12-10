Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E328F46FD5C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 10:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDEE10E59C;
	Fri, 10 Dec 2021 09:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C81B10E59C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 09:05:55 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso6993525pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 01:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YkZCXGvo7zlBCfHv5goewvZ5xrMRAZ+VhM3/1H8V2Z0=;
 b=fJfIcPbq/5wSbuhuhEmVgGmzCKHohM94gsOFdJOHshWxLrGpNPmiqTcdlaUuKprXiL
 mr1hq6zvm1WzAzHP02/XZJrg8pcZfk+P1mZkOjrd48mijYXylexXT0I6U2F0hQB37t8j
 v9We/lANMNS+tq8+5GLkhzQXQ2dYEAvwXQVhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YkZCXGvo7zlBCfHv5goewvZ5xrMRAZ+VhM3/1H8V2Z0=;
 b=lm1PIjiICHlr0x05yF+6p7AJMhUQRb3yR6HUsL6kz2FiXFnJInSXnjqzr2mYfSfvCW
 tJlnA0eBDKciczU930QS5rdC/DImrMW1V9PLj4infoduu9GROPVTthfaTnqff/OQUdf+
 VpF0K0Cd+645eqUwhJrtdfBVr+5VPc6V7XKz7e/B3/IMjs4nsKPzSuvo9qA/UllXkhvS
 Kfhd4CgcGkArHaXTptBCEjvFiUBOQ+mcdpgZrnRQVBySUB7C0bkQTcA/wYUlH2+ib2Tg
 iCPWUzYSwLFQ1zBZJcYSsRFXDep1MskfyyySzIiapDIJuYmc/iiVSag9WnmS+KyqePRC
 I67g==
X-Gm-Message-State: AOAM530VF8ALgc+CrrXHKq7tFI9lUjrT3xEt3OXrNvXAeOJk+NrmI5eE
 diXCcWAO7CDtMov8jiW5z2rmparAwU45qsgS941zfw==
X-Google-Smtp-Source: ABdhPJw+JYpv2WA2SL5fMfjRTzoTsn6BugpkZTpvF9tP6lgFMqC10DtYu5fTqzBRZ48dv/rnyEIgy0h3ZyHpjC1OwG8=
X-Received: by 2002:a17:90a:6906:: with SMTP id
 r6mr22292943pjj.118.1639127154572; 
 Fri, 10 Dec 2021 01:05:54 -0800 (PST)
MIME-Version: 1.0
References: <20211016145827.586870-1-michael@amarulasolutions.com>
 <CAOf5uw=DffhS=WAh-OFXOCO+4kd5ey=2Eqf0Zhyrgd_d5D8meA@mail.gmail.com>
 <CAPY8ntCvAnu9HS1WxWRkveXnQ_vD8EOdshX-ob8vGuGqOKp+RA@mail.gmail.com>
 <CAOf5uwmGjwXsQdVm-tyvkcPY0bJ++KFbewvrQ-esU=9FStmg+A@mail.gmail.com>
In-Reply-To: <CAOf5uwmGjwXsQdVm-tyvkcPY0bJ++KFbewvrQ-esU=9FStmg+A@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 10 Dec 2021 10:05:42 +0100
Message-ID: <CAOf5uwmn4UM8iE71DjcGpX+pQU_wkU6bBNV-=b6kT-x-LtsnMg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Avoid unbalance
 prepare/unprepare
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave

some questions below

On Thu, Dec 9, 2021 at 7:10 PM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi Dave
>
> On Thu, Dec 9, 2021 at 6:58 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Michael
> >
> > On Thu, 9 Dec 2021 at 16:58, Michael Nazzareno Trimarchi
> > <michael@amarulasolutions.com> wrote:
> > >
> > > Hi all
> > >
> > > On Sat, Oct 16, 2021 at 4:58 PM Michael Trimarchi
> > > <michael@amarulasolutions.com> wrote:
> > > >
> > > > All the panel driver check the fact that their prepare/unprepare
> > > > call was already called. It's not an ideal solution but fix
> > > > for now the problem on ili9881c
> > > >
> > > > [ 9862.283296] ------------[ cut here ]------------
> > > > [ 9862.288490] unbalanced disables for vcc3v3_lcd
> > > > [ 9862.293555] WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2851
> > > > _regulator_disable+0xd4/0x190
> > > >
> > > > from:
> > > >
> > > > [ 9862.038619]  drm_panel_unprepare+0x2c/0x4c
> > > > [ 9862.043212]  panel_bridge_post_disable+0x18/0x24
> > > > [ 9862.048390]  dw_mipi_dsi_bridge_post_disable+0x3c/0xf0
> > > > [ 9862.054153]  drm_atomic_bridge_chain_post_disable+0x8c/0xd0
> > > >
> > > > and:
> > > >
> > > > [ 9862.183103]  drm_panel_unprepare+0x2c/0x4c
> > > > [ 9862.187695]  panel_bridge_post_disable+0x18/0x24
> > > > [ 9862.192872]  drm_atomic_bridge_chain_post_disable+0x8c/0xd0
> > > > [ 9862.199117]  disable_outputs+0x120/0x31c
> >
> > This is down to the dw-mipi-dsi driver calling the post_disable hook
> > explicitly at [1], but then also allowing the framework to call it.
> > The explicit call is down to limitations in the DSI support, so we
> > can't control the DSI host state to a fine enough degree (an ongoing
> > discussion [2] [3]). There shouldn't be a need to handle mismatched
> > calling in individual panel drivers.
> >
> >   Dave
> >
> > [1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L894
> > [2] https://lists.freedesktop.org/archives/dri-devel/2021-November/332060.html
> > [3] https://lists.freedesktop.org/archives/dri-devel/2021-December/334007.html
>
> I'm in the second case. I need to enable HS mode after the panel is
> initialized. Time to time I have timeout
> on dsi command or I have wrong panel initialization. So I explicit call from
> the bridge but I understand that is not correct in the design point of view.
>
> So this patch can not be queued because it's a known problem that
> people are discussing
>
Author: Michael Trimarchi <michael@amarulasolutions.com>
Date:   Thu Dec 9 15:45:48 2021 +0100

    drm: bridge: samsung-dsim: Enable panel/bridge before exist from standby

    We need to exist from standby as last operation to have a proper video
    working. This code implement the same code was before the bridge
    migration

    Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
b/drivers/gpu/drm/bridge/samsung-dsim.c
index 654851edbd9b..21265ae80022 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1838,6 +1838,7 @@ static void samsung_dsim_atomic_enable(struct
drm_bridge *bridge,
                                       struct drm_bridge_state
*old_bridge_state)
 {
        struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+       struct drm_atomic_state old_state;
        int ret;

        if (dsi->state & DSIM_STATE_ENABLED)
@@ -1859,6 +1860,9 @@ static void samsung_dsim_atomic_enable(struct
drm_bridge *bridge,
        }

        samsung_dsim_set_display_mode(dsi);
+
+       drm_atomic_bridge_chain_enable(dsi->out_bridge, &old_state);
+
        samsung_dsim_set_display_enable(dsi, true);

        dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;

Right now I'm doing this to enable the change. I must change the panel
to avoid double enabled

I have some questions:

- the chain is an element (bridge/panel) linked together via some
connector (I hope I understand) when I enable
a bridge chain, all the elements should move from some status to
another. If we mark them already this should
not avoid that one element can be enabled two times? An element that
sources two other elements should for instance
receive the enable from two times before switching on.

Michael

> Michael
>
> >
> >
> > > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > > > index 103a16018975..f75eecb0e65c 100644
> > > > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > > > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > > > @@ -52,6 +52,8 @@ struct ili9881c {
> > > >
> > > >         struct regulator        *power;
> > > >         struct gpio_desc        *reset;
> > > > +
> > > > +       bool                    prepared;
> > > >  };
> > > >
> > >
> > > I found that this can be a general problem. Should not mandatory to
> > > track panel status
> > >
> > > DRM_PANEL_PREPARED
> > > DRM_PANEL_ENABLED
> > >
> > > Michael
> > > >  #define ILI9881C_SWITCH_PAGE_INSTR(_page)      \
> > > > @@ -707,6 +709,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
> > > >         unsigned int i;
> > > >         int ret;
> > > >
> > > > +       /* Preparing when already prepared is a no-op */
> > > > +       if (ctx->prepared)
> > > > +               return 0;
> > > > +
> > > >         /* Power the panel */
> > > >         ret = regulator_enable(ctx->power);
> > > >         if (ret)
> > > > @@ -745,6 +751,8 @@ static int ili9881c_prepare(struct drm_panel *panel)
> > > >         if (ret)
> > > >                 return ret;
> > > >
> > > > +       ctx->prepared = true;
> > > > +
> > > >         return 0;
> > > >  }
> > > >
> > > > @@ -770,10 +778,16 @@ static int ili9881c_unprepare(struct drm_panel *panel)
> > > >  {
> > > >         struct ili9881c *ctx = panel_to_ili9881c(panel);
> > > >
> > > > +       /* Unpreparing when already unprepared is a no-op */
> > > > +       if (!ctx->prepared)
> > > > +               return 0;
> > > > +
> > > >         mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> > > >         regulator_disable(ctx->power);
> > > >         gpiod_set_value(ctx->reset, 1);
> > > >
> > > > +       ctx->prepared = false;
> > > > +
> > > >         return 0;
> > > >  }
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > >
> > > --
> > > Michael Nazzareno Trimarchi
> > > Co-Founder & Chief Executive Officer
> > > M. +39 347 913 2170
> > > michael@amarulasolutions.com
> > > __________________________________
> > >
> > > Amarula Solutions BV
> > > Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> > > T. +31 (0)85 111 9172
> > > info@amarulasolutions.com
> > > www.amarulasolutions.com
>
>
>
> --
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
