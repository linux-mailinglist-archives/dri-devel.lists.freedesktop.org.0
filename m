Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD2503042
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 00:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3732110E274;
	Fri, 15 Apr 2022 22:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E7C10E274
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 22:12:06 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef4a241cc5so87423957b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 15:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HsqXPexxYMVzLMlPpbKlOEvSDCYnqmBjUtOeVDxLnZs=;
 b=xhQ2AvW2Z1zqui2BTplZgbziBOulqJ1GuEv2l+ti0mytPxdwPTOduV9Lrd4EgKLZdZ
 vj5ZF1Q43oH0HPPhlIrcQRoilFOuoQgXAQYZSIaQJabLjs5hzu0wl1IDPDAgAuxVnyLa
 bz3LtuVl/3q62ZTWdbmPPYEV4Rsa8vuMAjxYIVi1dzDNcrIffKYS/QFyrZeg+N4c/EZQ
 JVZDNcplKTS6kZzFpXT+zas/cBQ7qUNYRWhMYcz652wAwfwVX2z6TwMiwoFRNsmvjR38
 tm7xFqAV7CjcM5ru5ce2mlRxMMR8gY/krWL7n1RMuLyGTX1O7lwAgPRUjb4uXkEwp+h9
 7nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HsqXPexxYMVzLMlPpbKlOEvSDCYnqmBjUtOeVDxLnZs=;
 b=quw4GaWkYH3gWcP50IKekjgCeo/3YtZ28dE+R0hEJXr7xhYAzqAbdWBENQ0qKHivob
 nSJHBvDsPjZX/qI1k1L8KhfI0ePHXxNAu9VvOkYXFyLxxb2R/hfqN8iiHPvH2CmVdJsy
 0kFIX6h3b+uR6vvTY1Nk60h06Dplr7PiSixpP5AGyu1NtaFMo/lb4/+ooUKBpxTQU7wz
 hJ8wQjaWjNwog3+N/5S5lCCHrLDHocZNnHKrvHYMPTqFx1BNNZxyZUTl6u+BdcqAdVps
 5YqFmXdVX+/n254FfTWd44wwz6mk+fQPYepIjeMoPHevX9R23BIp6YHD+VPcLRRf8u5l
 aO8g==
X-Gm-Message-State: AOAM530h3erzflGNZo7zI8gJdV10XvWy/nZ4JLV1CUNMxAyL45tYk8km
 U49YoaS6dTPs4lPe9R5ZY1sjLWlopoZQyjEbqUCdDg==
X-Google-Smtp-Source: ABdhPJzVoea4GIffohnCRr22ILa4ZrD82KPISDU+95GM4vH11cc3D6jmkGCqIQXE5NvprUoyY23DR23ZMd3mngkY9ts=
X-Received: by 2002:a81:753:0:b0:2eb:ebe9:ff4f with SMTP id
 80-20020a810753000000b002ebebe9ff4fmr886197ywh.255.1650060725233; Fri, 15 Apr
 2022 15:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.4.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
 <027b3ca1-fbd3-7bce-1ca0-ec92a5f23fee@linaro.org>
 <CAD=FV=Xu7b=t1C4JHF4U9BsD9wFy_x_GseJFNytHdCKvnS9DoA@mail.gmail.com>
In-Reply-To: <CAD=FV=Xu7b=t1C4JHF4U9BsD9wFy_x_GseJFNytHdCKvnS9DoA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Apr 2022 01:11:54 +0300
Message-ID: <CAA8EJppyBTDeFVztS2rTihAwEjJdmJf1Md-Qa3x3MijVvbzSUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] drm/panel-edp: Take advantage of
 is_hpd_asserted() in struct drm_dp_aux
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
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Apr 2022 at 00:17, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 14, 2022 at 5:51 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 09/04/2022 05:36, Douglas Anderson wrote:
> > > Let's add support for being able to read the HPD pin even if it's
> > > hooked directly to the controller. This will allow us to get more
> > > accurate delays also lets us take away the waiting in the AUX transfer
> > > functions of the eDP controller drivers.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >   drivers/gpu/drm/panel/panel-edp.c | 37 ++++++++++++++++++++++++++-----
> > >   1 file changed, 31 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > > index 1732b4f56e38..4a143eb9544b 100644
> > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > @@ -417,6 +417,19 @@ static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
> > >       return 0;
> > >   }
> > >
> > > +static bool panel_edp_can_read_hpd(struct panel_edp *p)
> > > +{
> > > +     return !p->no_hpd && (p->hpd_gpio || (p->aux && p->aux->is_hpd_asserted));
> > > +}
> > > +
> > > +static bool panel_edp_read_hpd(struct panel_edp *p)
> > > +{
> > > +     if (p->hpd_gpio)
> > > +             return gpiod_get_value_cansleep(p->hpd_gpio);
> > > +
> > > +     return p->aux->is_hpd_asserted(p->aux);
> > > +}
> > > +
> > >   static int panel_edp_prepare_once(struct panel_edp *p)
> > >   {
> > >       struct device *dev = p->base.dev;
> > > @@ -441,13 +454,21 @@ static int panel_edp_prepare_once(struct panel_edp *p)
> > >       if (delay)
> > >               msleep(delay);
> > >
> > > -     if (p->hpd_gpio) {
> > > +     if (panel_edp_can_read_hpd(p)) {
> > >               if (p->desc->delay.hpd_absent)
> > >                       hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
> > >               else
> > >                       hpd_wait_us = 2000000;
> > >
> > > -             err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
> > > +             /*
> > > +              * Extra max delay, mostly to account for ps8640. ps8640
> > > +              * is crazy and the bridge chip driver itself has over 200 ms
> > > +              * of delay if it needs to do the pm_runtime resume of the
> > > +              * bridge chip to read the HPD.
> > > +              */
> > > +             hpd_wait_us += 3000000;
> >
> > I think this should come in a separate commit and ideally this should be
> > configurable somehow. Other hosts wouldn't need such 'additional' delay.
> >
> > With this change removed:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> What would you think about changing the API slightly? Instead of
> is_hpd_asserted(), we change it to wait_hpd_asserted() and it takes a
> timeout in microseconds. If you pass 0 for the timeout the function is
> defined to behave the same as is_hpd_asserted() today--AKA a single
> poll of the line.

This might work. Can you check it, please?

BTW: are these changes dependent on the first part of the patchset? It
might be worth splitting the patchset into two parts.

-- 
With best wishes
Dmitry
