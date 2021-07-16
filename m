Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4963CB41C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 10:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254286E943;
	Fri, 16 Jul 2021 08:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A59C6E943
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 08:27:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id c17so13890219ejk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 01:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WF84jVz1n+eFQ0rQhweNnPNUFA0OwoAW3OrtXTw2zwI=;
 b=mhHWte1wDgb/V8iUxLE2rS8z4/Z2j4PSwuJ6yaKlz/kJ5i8bcss8iptKmIGPxKftlE
 usRHbm6sWLTh9Qw6l7Q9gsYQ7CE5ea6+WlzPFkP0FVrNBI9cvPAOVZS44lk+Y1cL5Hrd
 G+GidPpp3J8jnCkxB4OzeJACV+Leqwcz/DyMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WF84jVz1n+eFQ0rQhweNnPNUFA0OwoAW3OrtXTw2zwI=;
 b=rPTNWIEWEsHhwio2PoxnKALVx5B9fCfEVl6a8ygFJDAo4yx4P4s2W+sstXv6dpWB1c
 MQxZS3SYd5rBaZMtS4caaaNLJhidIGK/9b1jlRHStNQaF41j+kZSchRodx1COKtgg3+j
 q2VGl1E5Lv97GjDZ8L7F2tGrBM5XZsdl5gzKuKpRUNl2tyss2EcgNv0Y6FqjY4Ek0w+N
 JAzunr6A+FNKrz1Mt10LLbYMdHkezFA7wUlDDnz9x6SYyMXGoivBATxJAA+mL1iLJnTA
 9lU0N5VpVXazxqrw2x6+g7HAV4EaZ1eKnJXxyGmCc3ASaUn1HFFsv34SX3u8St+HjpEr
 wKEg==
X-Gm-Message-State: AOAM531bu+e/ncL8GPWd/GZHgOLhctds4AbrIywc9dzqVJz2ZtqPUhwy
 uoSfCaGLQMvjRwTigJkgvxuWNLYEO7sFBSOXJm4bPw==
X-Google-Smtp-Source: ABdhPJzEEe0BTThldgUONgS1rk6AKx/HvruqOq+AkYovc+Ld2bNsEdTnJg7+HBVSy+JbULezQ9lBt2Yv1QsEM2SHgKk=
X-Received: by 2002:a17:906:70b:: with SMTP id
 y11mr10565651ejb.328.1626424041003; 
 Fri, 16 Jul 2021 01:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210714060221.1483752-1-pihsun@chromium.org>
 <YO69IsBXv+lbcuWp@phenom.ffwll.local>
In-Reply-To: <YO69IsBXv+lbcuWp@phenom.ffwll.local>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Fri, 16 Jul 2021 16:26:44 +0800
Message-ID: <CANdKZ0fGnuHz3aX0Ptm7VnFmULRFcpSvSiYp=_91GfQ-JEW0VQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Use pm_runtime_force_{suspend,
 resume}
To: Pi-Hsun Shih <pihsun@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Xin Ji <xji@analogixsemi.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yu Jiahua <yujiahua1@huawei.com>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

)

On Wed, Jul 14, 2021 at 6:32 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 14, 2021 at 02:01:59PM +0800, Pi-Hsun Shih wrote:
> > Use pm_runtime_force_suspend and pm_runtime_force_resume to ensure that
> > anx7625 would always be powered off when suspended. Also update the
> > bridge enable hook to always ensure that the anx7625 is powered on
> > before starting DP operations.
> >
> > Fixes: 409776fa3c42 ("drm/bridge: anx7625: add suspend / resume hooks")
> >
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> >
> > ---
> >
> > An issue was found that the anx7625 driver won't power off when used as
> > eDP bridge on Asurada board if suspend is entered via VT2.
> >
> > The reason is that in this case, anx7625_suspend won't power off anx7625
> > (since intp_irq is not set). And anx7625_bridge_disable is only called
> > indirectly by other driver's (mediatek-drm) suspend.
> > pm_runtime_put_sync won't do anything since it's already in system
> > suspend.
> >
> > If not in VT2, the bridge disable is indirectly called when Chrome
> > stops, so anx7625 will be powered off correctly.
> >
> > To fix the issue, the suspend resume hooks are changed to
> > pm_runtime_force_{suspend,resume} to ensure the runtime suspend / resume
> > is always called correctly when system suspend / resume.
> > (Note that IRQ no longer needs to be disabled on suspend after commit
> > f03ab6629c7b ("drm/bridge: anx7625: Make hpd workqueue freezable"))
> >
> > Since bridge disable is called indirectly by mediatek-drm driver's
> > suspend, it might happens after anx7625 suspend is called. So a check
> > if the driver is already suspended via pm_runtime_force_suspend is also
> > added, to ensure that the anx7625_dp_stop won't be called when power
> > is off. And also since bridge enable might happens before anx7625 resume
> > is called, a check to that is also added, and would force resume the
> > device in this case.
> >
> > I'm not sure if the approach to fix this is the most appropriate way,
> > since using pm_runtime_force_resume in bridge enable kinda feels hacky
> > to me. I'm open to any suggestions.
>
> I thought the real fix was to create device links between the bridge and
> the other parts of the overall drm driver, so that the driver core can
> resume devices in the right order.
>
> Unfortunately those device link patches haven't made it in yet. Quick
> search on lore didn't find anything, maybe I was just dreaming, or maybe
> the patches only existed for panels.
>
> Either way, this is a drm_bridge.c problem that needs to be fixed there,
> not individually in each driver.
> -Daniel

Hi,

Thanks for the response, I did find some discussion about this in 2018 for
drm_panel
(https://patchwork.kernel.org/project/dri-devel/patch/b53584fd988d045c13de22d81825395b0ae0aad7.1524727888.git.jsarha@ti.com/),
which also mentioned drm_bridge.

From that thread it seems that linking all bridges with the previous one would
break some drivers, and there was no conclusion on how this should be done.

I have some ideas on how to solve this issue for the anx7625 driver without
affecting other drivers, are patches that do one of the following acceptable?
* Add some opt-in flag to drm_bridge which, if set, would create a stateless
  device link between the bridge and the encoder in drm_bridge_attach. And use
  the flag in anx7625 driver.
* Add the stateless device link in the anx7625 driver inside
anx7625_bridge_attach
  (We can remove the link if a general solution for drm_bridge comes out later).

Or is it still preferred to have some general solution in drm_bridge without
explicit opt-in?

Regards,
Pi-Hsun

>
> >
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 55 +++++++++--------------
> >  1 file changed, 20 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index a3d82377066b..9d0f5dc88b16 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1559,7 +1559,20 @@ static void anx7625_bridge_enable(struct drm_bridge *bridge)
> >
> >       DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
> >
> > -     pm_runtime_get_sync(dev);
> > +     /*
> > +      * The only case where pm_runtime is disabled here is when the function
> > +      * is called other driver's resume hook by
> > +      * drm_mode_config_helper_resume, but when the pm_runtime_force_resume
> > +      * hasn't been called on this device.
> > +      *
> > +      * pm_runtime_get_sync won't power on anx7625 in this case since we're
> > +      * in system resume, so instead we force resume anx7625 to make sure
> > +      * the following anx7625_dp_start would succeed.
> > +      */
> > +     if (pm_runtime_enabled(dev))
> > +             pm_runtime_get_sync(dev);
> > +     else
> > +             pm_runtime_force_resume(dev);
> >
> >       anx7625_dp_start(ctx);
> >  }
> > @@ -1571,9 +1584,10 @@ static void anx7625_bridge_disable(struct drm_bridge *bridge)
> >
> >       DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
> >
> > -     anx7625_dp_stop(ctx);
> > -
> > -     pm_runtime_put_sync(dev);
> > +     if (pm_runtime_enabled(dev)) {
> > +             anx7625_dp_stop(ctx);
> > +             pm_runtime_put_sync(dev);
> > +     }
> >  }
> >
> >  static enum drm_connector_status
> > @@ -1705,38 +1719,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
> >       return 0;
> >  }
> >
> > -static int __maybe_unused anx7625_resume(struct device *dev)
> > -{
> > -     struct anx7625_data *ctx = dev_get_drvdata(dev);
> > -
> > -     if (!ctx->pdata.intp_irq)
> > -             return 0;
> > -
> > -     if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
> > -             enable_irq(ctx->pdata.intp_irq);
> > -             anx7625_runtime_pm_resume(dev);
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -static int __maybe_unused anx7625_suspend(struct device *dev)
> > -{
> > -     struct anx7625_data *ctx = dev_get_drvdata(dev);
> > -
> > -     if (!ctx->pdata.intp_irq)
> > -             return 0;
> > -
> > -     if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
> > -             anx7625_runtime_pm_suspend(dev);
> > -             disable_irq(ctx->pdata.intp_irq);
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> >  static const struct dev_pm_ops anx7625_pm_ops = {
> > -     SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
> > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +                             pm_runtime_force_resume)
> >       SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
> >                          anx7625_runtime_pm_resume, NULL)
> >  };
> >
> > base-commit: c0d438dbc0b74901f1901d97a6c84f38daa0c831
> > --
> > 2.32.0.93.g670b81a890-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
