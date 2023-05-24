Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C074C70FC23
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B408F10E4E3;
	Wed, 24 May 2023 17:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E07310E123
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 17:03:52 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ae3a5dfa42so3840015ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684947831; x=1687539831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTCMbQuOQ0Gv9EZ3XI5kQ6nF5j6GhuYAcPObTk6+dJ4=;
 b=EWrSTGmzLJM8fWQ8TGaRKKSSrx0EAIMg/WQZ1TPY/KTLOx+0kvrBRMtehmF56CqR/e
 nqiZwX70llkTxhEmNgHbu5h/Ot4txJXyJA1Ek1F18iAroHsnSOnlkpgVExpNWFo07xW0
 RvRKEV0EoCzmpHZGMC/JA4GPZhOmGwHtrV6Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684947831; x=1687539831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTCMbQuOQ0Gv9EZ3XI5kQ6nF5j6GhuYAcPObTk6+dJ4=;
 b=JbCRBig0vQMoMmE/Z2KQ5fCdBCZyAZkjDc6BC2blRVx0SflMK/XED8DAgbFwxjO5Ap
 Zsh/tlxtiaYnWs4V0SEb8smOVKiSLlp2nBeW7y6xiZJC/4WDQVGf8ayVYruOhsqmbnon
 sYpkQI8d+/n/pq8mQU6U6+M/kaqTQ1f6r2nymGciu6J+LoclT7yrHCYFesqlY952GUhz
 x6WgaBdwpzNwHa10T9VPUwiWlFCqzJJ7zqP16AAfInPGTH5SUr6x9+oTPKnQILlRZouQ
 x4Ik2AAXvlpG0mZmsralEq4DtWwxSRJEEc1agPs0yD/tGKmYBvD+MLb8lN/IYAT+Ll7C
 HHBw==
X-Gm-Message-State: AC+VfDzLupJfBWCsFx/FHM8VCdcDyH5lzgkLYSLohIG5xYcpSbV7WRH9
 iyjAl2i7P/XLQdjqtgGq2sihR9S1EExxr3XsFGY=
X-Google-Smtp-Source: ACHHUZ5yqAIxXgCCaG4XJRauwRizYoMAg3bpYgmpX5JqGyCt13sXsQMWrcYAp+ydbOJYf6EhlswrJA==
X-Received: by 2002:a17:903:192:b0:1a5:a1b:bbd8 with SMTP id
 z18-20020a170903019200b001a50a1bbbd8mr21582238plg.45.1684947831253; 
 Wed, 24 May 2023 10:03:51 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com.
 [209.85.214.176]) by smtp.gmail.com with ESMTPSA id
 e12-20020a170902b78c00b001993a1fce7bsm8931812pls.196.2023.05.24.10.03.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 10:03:51 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ae64580e9fso3435ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:03:50 -0700 (PDT)
X-Received: by 2002:a05:6e02:12c2:b0:338:9f6a:d54a with SMTP id
 i2-20020a056e0212c200b003389f6ad54amr268468ilm.24.1684947464098; Wed, 24 May
 2023 09:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
 <21041738-e23f-45bc-580b-4139c0cb87d9@linaro.org>
In-Reply-To: <21041738-e23f-45bc-580b-4139c0cb87d9@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 May 2023 09:57:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCQXzwojXbUruZ3Nm-dueX8B6c7MENX5EFpVU1qyqp6A@mail.gmail.com>
Message-ID: <CAD=FV=WCQXzwojXbUruZ3Nm-dueX8B6c7MENX5EFpVU1qyqp6A@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/panel: Check for already prepared/enabled in
 drm_panel
To: neil.armstrong@linaro.org
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, hsinyi@google.com,
 Sam Ravnborg <sam@ravnborg.org>, yangcong5@huaqin.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 24, 2023 at 2:52=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 23/05/2023 21:27, Douglas Anderson wrote:
> > In a whole pile of panel drivers, we have code to make the
> > prepare/unprepare/enable/disable callbacks behave as no-ops if they've
> > already been called. It's silly to have this code duplicated
> > everywhere. Add it to the core instead so that we can eventually
> > delete it from all the drivers. Note: to get some idea of the
> > duplicated code, try:
> >    git grep 'if.*>prepared' -- drivers/gpu/drm/panel
> >    git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> >
> > NOTE: arguably, the right thing to do here is actually to skip this
> > patch and simply remove all the extra checks from the individual
> > drivers. Perhaps the checks were needed at some point in time in the
> > past but maybe they no longer are? Certainly as we continue
> > transitioning over to "panel_bridge" then we expect there to be much
> > less variety in how these calls are made. When we're called as part of
> > the bridge chain, things should be pretty simple. In fact, there was
> > some discussion in the past about these checks [1], including a
> > discussion about whether the checks were needed and whether the calls
> > ought to be refcounted. At the time, I decided not to mess with it
> > because it felt too risky.
> >
> > Looking closer at it now, I'm fairly certain that nothing in the
> > existing codebase is expecting these calls to be refcounted. The only
> > real question is whether someone is already doing something to ensure
> > prepare()/unprepare() match and enabled()/disable() match. I would say
> > that, even if there is something else ensuring that things match,
> > there's enough complexity that adding an extra bool and an extra
> > double-check here is a good idea. Let's add a drm_warn() to let people
> > know that it's considered a minor error to take advantage of
> > drm_panel's double-checking but we'll still make things work fine.
> >
> > [1] https://lore.kernel.org/r/20210416153909.v4.27.I502f2a92ddd36c3d28d=
014dd75e170c2d405a0a5@changeid
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/gpu/drm/drm_panel.c | 49 ++++++++++++++++++++++++++++++++----=
-
> >   include/drm/drm_panel.h     | 14 +++++++++++
> >   2 files changed, 57 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index f634371c717a..4e1c4e42575b 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -105,11 +105,22 @@ EXPORT_SYMBOL(drm_panel_remove);
> >    */
> >   int drm_panel_prepare(struct drm_panel *panel)
> >   {
> > +     int ret;
> > +
> >       if (!panel)
> >               return -EINVAL;
> >
> > -     if (panel->funcs && panel->funcs->prepare)
> > -             return panel->funcs->prepare(panel);
> > +     if (panel->prepared) {
> > +             dev_warn(panel->dev, "Skipping prepare of already prepare=
d panel\n");
> > +             return 0;
> > +     }
> > +
> > +     if (panel->funcs && panel->funcs->prepare) {
> > +             ret =3D panel->funcs->prepare(panel);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +     panel->prepared =3D true;
> >
> >       return 0;
> >   }
> > @@ -128,11 +139,22 @@ EXPORT_SYMBOL(drm_panel_prepare);
> >    */
> >   int drm_panel_unprepare(struct drm_panel *panel)
> >   {
> > +     int ret;
> > +
> >       if (!panel)
> >               return -EINVAL;
> >
> > -     if (panel->funcs && panel->funcs->unprepare)
> > -             return panel->funcs->unprepare(panel);
> > +     if (!panel->prepared) {
> > +             dev_warn(panel->dev, "Skipping unprepare of already unpre=
pared panel\n");
> > +             return 0;
> > +     }
> > +
> > +     if (panel->funcs && panel->funcs->unprepare) {
> > +             ret =3D panel->funcs->unprepare(panel);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +     panel->prepared =3D false;
> >
> >       return 0;
> >   }
> > @@ -155,11 +177,17 @@ int drm_panel_enable(struct drm_panel *panel)
> >       if (!panel)
> >               return -EINVAL;
> >
> > +     if (panel->enabled) {
> > +             dev_warn(panel->dev, "Skipping enable of already enabled =
panel\n");
> > +             return 0;
> > +     }
> > +
> >       if (panel->funcs && panel->funcs->enable) {
> >               ret =3D panel->funcs->enable(panel);
> >               if (ret < 0)
> >                       return ret;
> >       }
> > +     panel->enabled =3D true;
> >
> >       ret =3D backlight_enable(panel->backlight);
> >       if (ret < 0)
> > @@ -187,13 +215,22 @@ int drm_panel_disable(struct drm_panel *panel)
> >       if (!panel)
> >               return -EINVAL;
> >
> > +     if (!panel->enabled) {
> > +             dev_warn(panel->dev, "Skipping disable of already disable=
d panel\n");
> > +             return 0;
> > +     }
> > +
> >       ret =3D backlight_disable(panel->backlight);
> >       if (ret < 0)
> >               DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d=
\n",
> >                            ret);
> >
> > -     if (panel->funcs && panel->funcs->disable)
> > -             return panel->funcs->disable(panel);
> > +     if (panel->funcs && panel->funcs->disable) {
> > +             ret =3D panel->funcs->disable(panel);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +     panel->enabled =3D false;
> >
> >       return 0;
> >   }
> > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > index 432fab2347eb..c6cf75909389 100644
> > --- a/include/drm/drm_panel.h
> > +++ b/include/drm/drm_panel.h
> > @@ -198,6 +198,20 @@ struct drm_panel {
> >        * the panel is powered up.
> >        */
> >       bool prepare_prev_first;
> > +
> > +     /**
> > +      * @prepared:
> > +      *
> > +      * If true then the panel has been prepared.
> > +      */
> > +     bool prepared;
> > +
> > +     /**
> > +      * @enabled:
> > +      *
> > +      * If true then the panel has been enabled.
> > +      */
> > +     bool enabled;
> >   };
> >
> >   void drm_panel_init(struct drm_panel *panel, struct device *dev,
>
> LGTM and let's cleanup the panel drivers
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks! For now I'll hold off on landing to see where this series ends
up. If the series ends up looking good we'll have to coordinate
landing the various bits between the drm and the hid trees and the
second drm patch in my series depends on this one>

If my series implodes I'll land this one on its own with your Ack. In
any case, once this lands somewhere I'll take an AI to cleanup the
panels.

-Doug
