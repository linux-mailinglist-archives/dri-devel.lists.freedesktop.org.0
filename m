Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8CE48D178
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 05:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9C310F82F;
	Thu, 13 Jan 2022 04:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EE010F83D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 04:13:20 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso5017860otf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 20:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=YF7ErIifg0iNFmv3Em8vDBYKQaapOqJDovasJQSWbpA=;
 b=NsO0FAPcfuf76qmzLWx4b4wp9dZYO/2A0enzd2W7mGqYopIfyShUBWU31br441BgPy
 JSchsqrzO71SDf4RpRz/LJeafAZxEr7tcYMl7on+Rh5p+7b77LQ/ji5LbYXPSxiIjRBW
 +wpVajqKE+9XNf55wZft5f0zLsWXN2V42TdoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=YF7ErIifg0iNFmv3Em8vDBYKQaapOqJDovasJQSWbpA=;
 b=VBQUOPVCv4PlhMer45utViGa0DlZNagWJIKyBrXQ6oT1y/wIts8C70it8aBwypXW8Q
 SymGKyMca9NGyu2ltToQyfHAOlC1F+jiVE4hg5rwj19B4uZFK8wDEjCiZYHrF2GcLD2r
 fn+pJtAyUDlmNuhDd1Ti1hADBzY+21jkawBzWcvZ01cTyuikjDXis53zwdIH3vaWDzFr
 qtKzL64393y0AJOxoYLIZr2gj9J9m/i51I+nScY/reCzeRNNCBeJ+3X2ZPLxe/yfeZHB
 mG/75Oj9I1ZJFozxhNRTEhrNa0ieTnkyHtoFtnXekan9Dh/fj85pp21WSCUUlQtuXkDO
 IFJQ==
X-Gm-Message-State: AOAM532wExJWyrlxYJ03/vL8xr98U7qYmasAxwLCgHahbaH9DB/qXgUn
 76HxdFhEQliLXpnqxS2Eng9M2VUU7jgm27PDPazDvQ==
X-Google-Smtp-Source: ABdhPJwtEE8y/SBCOBJZ0IZoluimP5IFNxmqLTvXIV0GunkKcWIBztLpgd9HRnIJMsrJXnHPCQnnZLReZsQXlk0AaEE=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr1921284otk.159.1642047198573; 
 Wed, 12 Jan 2022 20:13:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Jan 2022 20:13:18 -0800
MIME-Version: 1.0
In-Reply-To: <84ee17f9-2597-86b6-1517-2358d443f65b@quicinc.com>
References: <1641926606-1012-1-git-send-email-quic_khsieh@quicinc.com>
 <1641926606-1012-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53hrPYR3ThwxM_+fzyRSB+6W1drFymW5n_RKmg_gf8z-w@mail.gmail.com>
 <84ee17f9-2597-86b6-1517-2358d443f65b@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 12 Jan 2022 20:13:18 -0800
Message-ID: <CAE-0n5134H0puMicozjdfTY+zXVUZyrebjv7Hto3EWcQAELO4A@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-12 14:17:54)
>
> On 1/12/2022 12:00 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-01-11 10:43:23)
> >> Current DP drivers have regulators, clocks, irq and phy are grouped
> >> together within a function and executed not in a symmetric manner.
> >> This increase difficulty of code maintenance and limited code scalabil=
ity.
> >> This patch divides the driver life cycle of operation into four states=
,
> >> resume (including booting up), dongle plugin, dongle unplugged and sus=
pend.
> >> Regulators, core clocks and irq are grouped together and enabled at re=
sume
> >> (or booting up) so that the DP controller is armed and ready to receiv=
e HPD
> >> plugin interrupts. HPD plugin interrupt is generated when a dongle plu=
gs
> >> into DUT (device under test). Once HPD plugin interrupt is received, D=
P
> >> controller will initialize phy so that dpcd read/write will function a=
nd
> >> following link training can be proceeded successfully. DP phy will be
> >> disabled after main link is teared down at end of unplugged HPD interr=
upt
> >> handle triggered by dongle unplugged out of DUT. Finally regulators, c=
ode
> >> clocks and irq are disabled at corresponding suspension.
>
> 0) Please note that=C2=A0 dongles are behavior differently.
>
> 1) Apple dongle will generate plug-in interrupt only if no hdmi monitor
> atatched to dongle. it will generate irq-hpd interrupt once hdmi monitor
> connect to dongle later.
>
> 2) Apple dongle will generate plugged-in interrupt followed by irq-hpd
> interrupt if dongle has hdmi monitor attached when connects to DUT.
>
> 3) other dongle will not generate plug-in interrupt unless dongle has
> hdmi monitor attached when connects to DUT. It only generate plug-in
> interrupt only and no irq-hpd interrupt=C2=A0 generated on this case.

Ok. The test scenarios can be reworded in terms of plugin irq and
irq-hpd if that makes it easier.

>
> 4) Note: phy_initialized only associated with plugged-in interrupt
>
> 5) irq-hpd interrupt must happen after plugged-in interrupt and before
> unplugged interrupt

More precisely it's that plugged-in interrupt must be handled before
irq-hpd but plugged-in and irq-hpd can both be pending at the device
concurrently unless they're masked and unmasked in some particular
order. I thought the driver ensures that only irq-hpd is unmasked once
the plugged in irq is handled. Can you confirm? Similarly, unplugged irq
is unmasked after plugged in irq is handled, but irq-hpd and unplugged
can both be pending if the irq handler is delayed?

>
> I will fill up below question with Apple dongle case with the order of
> event happen timing.
>
> > I'll write out the various scenarios
> >
> > #1
> >       dongle plugged in with HDMI cable attached
> >       driver probe
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) generate plugged-in interrupt triggers handler
> 4) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
>
> >
> >
> > #2
> >       dongle unplugged
> >       driver probe
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
>
>
> >
> > #3
> >       dongle plugged in without HDMI cable attached
> >       driver probe
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) generate plug-in interrupt triggers handler
> 4) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
>
> Note: same as case #1
> > #4
> >       driver probe
> >       dongle plugged in without HDMI cable attached
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) dongle plugged in
> 4) generate plug-in interrupt triggers handler
> 5) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
>
> >
> >
> > #5
> >       driver probe
> >       dongle plugged in with HDMI cable attached
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) dongle plugged in
> 4) generate plug-in interrupt trigger handler
> 5) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
>
> Note: same as case #4
>
> >
> > #6
> >       driver probe
> >       dongle plugged in
> >       suspend
> >       resume
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) dongle plug in
> 4) generate plug-in interrupt triggers handler
> 5) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
> 6) suspend
> 7) dp_display_host_deinit() =3D=3D> core_initialized =3D false;
> 8) dp_display_host_phy_exit() =3D=3D> phy_initialize =3D false;
> 9) resume
> 10) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 11) generate plug-in interrupt
> 12) dp_display_phy_init() =3D=3D> phy_initialize =3D true;
>
> >
> > #7
> >       driver probe
> >       dongle plugged in
> >       suspend
> >       dongle unplugged
> >       resume
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) dongle plugged in
> 4) generate plug-in interrupt triggers handler
> 5) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
> 6) suspend
> 7) dp_display_host_deinit() =3D=3D> core_initialized =3D false;
> 8) dp_display_host_phy_exit() =3D=3D> phy_initialize =3D false;

Why is the order of operations swapped? During probe core_initialized
is done first and then phy_initialized but then on suspend
core_initialized is done first again before phy_initialized. That's
asymmetric.

> 9) dongle unplugged
> 10) resume
> 11) dp_display_host_init() =3D=3D> core_initialized =3D true;
>
> #8
>         driver probe
>         dongle plugged in without HDMI cable attached
>         suspend
>         resume
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) dongle plug in
> 4) generate plug-in interrupt triggers handler
> 5) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
> 6) suspend
> 7) dp_display_host_deinit() =3D=3D> core_initialized =3D false;
> 8) dp_display_host_phy_exit() =3D=3D> phy_initialize =3D false;
> 9) resume
> 10) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 11) generate plug-in interrupt
> 12) dp_display_phy_init() =3D=3D> phy_initialize =3D true;
>
>
> NOTE: same case #6
>
> #9
>         driver probe
>         dongle plugged in without HDMI cable attached
>         suspend
>         HDMI cable attached during suspend
>         resume
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) dongle plugged in
> 4) generate plug-in interrupt triggers handler
> 5) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
> 6) suspend
> 7) dp_display_host_deinit() =3D=3D> core_initialized =3D false;
> 8) dp_display_host_phy_exit() =3D=3D> phy_initialize =3D false;
> 9) HDMI cable attached
> 10) resume
> 11) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 12) generate plug-in interrupt
> 13) dp_display_phy_init() =3D=3D> phy_initialize =3D true;
>
>
> What's the state of the phy and core initialized variable at the end of
> each of these scenarios? Please fill out the truth table.
>
>                   +-----------------+------------------------
>                    |    false        |       true            |
>                   +-----------------+------------------------
>   phy_initialized  |                 |                       |
>                   +-----------------+------------------------
>   core_initialized |                 | #1,                   |
>                   +-----------------+------------------------
>
> I guess we also need eDP scenarios, but that's probably simpler
>
> #10
>         eDP panel connected
>         driver probe
>
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) generate plug-in interrupt triggers handler

I think this is more like "dp_display_config_hpd() is called by hpd
kthread"?

> 4) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
>
>
>
> #11
>         eDP panel disconnected
>         driver probe
>
> NOTE: eDP panel can not be disconnected

The panel can certainly be disconnected in the sense that the ribbon
cable to the panel is busted or not working properly. That's what this
scenario is for.

>
> #12
>         eDP panel disconnected
>         driver probe
>         suspend
>         resume
>
> NOTE: assume edp panel connected
> 1) driver probe =3D=3D> core_initialized =3D false;    phy_initialized =
=3D false;
> 2) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 3) generate plug-in interrupt triggers handler
> 4) dp_display_phy_init() =3D=3D> phy_initialized =3D true;
> 5) suspend
> 6) dp_display_host_deinit() =3D=3D> core_initialized =3D false;
> 7) dp_display_host_phy_exit() =3D=3D> phy_initialize =3D false;
> 8) resume
> 9) dp_display_host_init() =3D=3D> core_initialized =3D true;
> 10) generate plug-in interrupt
> 11) dp_display_phy_init() =3D=3D> phy_initialize =3D true;

Thanks. It really helps to see the various scenarios.

>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm=
/dp/dp_display.c
> >> index 7cc4d21..f6bb4bc 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -83,6 +83,7 @@ struct dp_display_private {
> >>
> >>          /* state variables */
> >>          bool core_initialized;
> >> +       bool phy_initialized;
> >>          bool hpd_irq_on;
> >>          bool audio_supported;
> >>
> >> @@ -372,21 +373,46 @@ static int dp_display_process_hpd_high(struct dp=
_display_private *dp)
> >>          return rc;
> >>   }
> >>
> >> -static void dp_display_host_init(struct dp_display_private *dp, int r=
eset)
> >> +static void dp_display_host_phy_init(struct dp_display_private *dp)
> >>   {
> >> -       bool flip =3D false;
> >> +       DRM_DEBUG_DP("core_init=3D%d phy_init=3D%d\n",
> >> +                       dp->core_initialized, dp->phy_initialized);
> >>
> >> +       if (!dp->phy_initialized) {
> >> +               dp_ctrl_phy_init(dp->ctrl);
> >> +               dp->phy_initialized =3D true;
> >> +       }
> >> +}
> >> +
> >> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
> >> +{
> >> +       DRM_DEBUG_DP("core_init=3D%d phy_init=3D%d\n",
> >> +                       dp->core_initialized, dp->phy_initialized);
> >> +
> >> +       if (dp->phy_initialized) {
> >> +               dp_ctrl_phy_exit(dp->ctrl);
> >> +               dp->phy_initialized =3D false;
> >> +       }
> >> +}
> >> +
> >> +static void dp_display_host_init(struct dp_display_private *dp)
> >> +{
> >>          DRM_DEBUG_DP("core_initialized=3D%d\n", dp->core_initialized)=
;
> >>          if (dp->core_initialized) {
> >>                  DRM_DEBUG_DP("DP core already initialized\n");
> >>                  return;
> >>          }
> >>
> >> -       if (dp->usbpd->orientation =3D=3D ORIENTATION_CC2)
> >> -               flip =3D true;
> >> +       dp_power_init(dp->power, false);
> >> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> >> +
> >> +       /*
> >> +        * eDP is the embedded primary display and has its own phy
> >> +        * initialize phy immediately
> > Question still stands why we can't wait for hpd high from the eDP panel=
.
> > Also, I think "has its own phy" means that it's not part of a combo
> > USB+DP phy? Can you please clarify?
> >
> >> +        */
> >> +       if (dp->dp_display.connector_type =3D=3D DRM_MODE_CONNECTOR_eD=
P)
> >> +               dp_display_host_phy_init(dp);
> >>
> >> -       dp_power_init(dp->power, flip);
> >> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
> >>          dp_aux_init(dp->aux);
> >>          dp->core_initialized =3D true;
> >>   }
> >> @@ -1306,20 +1330,23 @@ static int dp_pm_resume(struct device *dev)
> >>          dp->hpd_state =3D ST_DISCONNECTED;
> >>
> >>          /* turn on dp ctrl/phy */
> >> -       dp_display_host_init(dp, true);
> >> +       dp_display_host_init(dp);
> >>
> >>          dp_catalog_ctrl_hpd_config(dp->catalog);
> >>
> >> -       /*
> >> -        * set sink to normal operation mode -- D0
> >> -        * before dpcd read
> >> -        */
> >> -       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >>
> >>          if (dp_catalog_link_is_connected(dp->catalog)) {
> >> +               /*
> >> +                * set sink to normal operation mode -- D0
> >> +                * before dpcd read
> >> +                */
> >> +               dp_display_host_phy_init(dp);
> >> +               dp_link_psm_config(dp->link, &dp->panel->link_info, fa=
lse);
> >>                  sink_count =3D drm_dp_read_sink_count(dp->aux);
> >>                  if (sink_count < 0)
> >>                          sink_count =3D 0;
> >> +
> >> +               dp_display_host_phy_exit(dp);
> > Why is the phy exited on resume when the link is still connected? Is
> > this supposed to be done only when the sink_count is 0? And how does
> > this interact with eDP where the phy is initialized by the call to
> > dp_display_host_init() earlier in this function.
> >
> >>          }
> >>
> >>          dp->link->sink_count =3D sink_count;

Any response to the above two comments?
