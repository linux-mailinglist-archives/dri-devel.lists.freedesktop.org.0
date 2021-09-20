Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B2B410FB4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 08:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66E389FBC;
	Mon, 20 Sep 2021 06:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805D189FBC;
 Mon, 20 Sep 2021 06:58:19 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id u21so14628290qtw.8;
 Sun, 19 Sep 2021 23:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5h7cl8Ajs5AwUhLTVL4cZufs552Y56de9iOn7+e0oio=;
 b=NWbm5PltTIwo+bw8yBo/aN2z9NHLRVzLbsvW1RKr1HFznCGoO3u/sSp6yeT8/6+9yp
 XvN/wruXJfaDK4OlgpgMNREJhzOL1AvlVwGBVqB49R4OzHgk3fjWsA1gwjOWaKGEhkAR
 JUTZHNBF/tw41uF9ZA382+S+yPDqcZ6JoX2B8RCqRK6nmTF3BlZeMzWcNqt5KCdxrTvm
 mnh5GlfBLdoADFqo9QHvaBQGepmMxmBGj0pOPhKhIUidyjKZa2Dtk2XzWjRJqJ5ShLib
 pz7LSBdsBo4n4Sr3/+pSxS+zSWhWp5UlgwV5N2eTPb736LDSM2OJwr0kuDq1Xy05eeqO
 caKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5h7cl8Ajs5AwUhLTVL4cZufs552Y56de9iOn7+e0oio=;
 b=fMNPHYfA26t9a80O33nxypqpBgDTty1Wd7FgI9opOUHB9hI/AQZ34kf/INZ9k3xwQe
 I1Hqw5NrduI2u4OmfRb96DcOqfYCq7T0mngROcPLS5WRCzVil1dk/iEf3w7Vy2uvmfNH
 9z7/P+lOqoXNu8+NINV5OrztCWF9KE3AwLj/YMWe2f0pPGf8JXg7GsM4WYdmXGgHVx8/
 eBPW80TbvrJq5yacE1Ar/J+hiYevert9cAhzieebU48aD+O1V0JMTAfrblVCz9RT1SHG
 VIh2fE0w6IdALaDJO5dwQZb1371oBiCwHuBEEOf2ZW4BWNg1Ojpm8BdJdQTByd/0yQ/J
 cQug==
X-Gm-Message-State: AOAM530Mhcl8dvJGO0h8lLY4Zddl3mu8tZ60+7/5jDvCt6PX3ZgQaCeP
 UqlhY9TqOK9NKgW8Q3cWixs2uNTSrZLpa9Oa/8c=
X-Google-Smtp-Source: ABdhPJxgIjW/sYBwCAwNOauYqYmXhV85Q+NRfeADRCpLGDjLuUSmiyDtCixGmB6wEfjHNGJYF4h8sH9zAiausdbUp6k=
X-Received: by 2002:ac8:5dcc:: with SMTP id e12mr21395932qtx.164.1632121098542; 
 Sun, 19 Sep 2021 23:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210913193509.3575-1-anarsoul@gmail.com>
 <87r1dr34nk.fsf@intel.com>
 <410de2c8e865446ec7f9d72a419b2674d34891bf.camel@redhat.com>
 <87v932zt5j.fsf@intel.com>
 <CA+E=qVdELSDKWBwyayTDjRr+RXuWjXN6Vb8EzbgS_0YTb=1dFg@mail.gmail.com>
 <87sfy6z0mr.fsf@intel.com>
In-Reply-To: <87sfy6z0mr.fsf@intel.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 19 Sep 2021 23:57:52 -0700
Message-ID: <CA+E=qVcvOnMxo7njvib8fAwsxfziWBjKicD5HwJQo7N=n_22sA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: add a delay before setting panel brightness
 after power on
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, 
 Aaron Ma <aaron.ma@canonical.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, Sep 15, 2021 at 1:47 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Tue, 14 Sep 2021, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> > On Tue, Sep 14, 2021 at 3:31 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >>
> >> On Tue, 14 Sep 2021, Lyude Paul <lyude@redhat.com> wrote:
> >> > On Tue, 2021-09-14 at 12:09 +0300, Jani Nikula wrote:
> >> >> On Mon, 13 Sep 2021, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> >> >> > Panel in my Dell XPS 7590, that uses Intel's HDR backlight interface to
> >> >> > control brightness, apparently needs a delay before setting brightness
> >> >> > after power on. Without this delay the panel does accept the setting
> >> >> > and may come up with some arbitrary brightness (sometimes it's too dark,
> >> >> > sometimes it's too bright, I wasn't able to find a system).
> >> >> >
> >> >> > I don't have access to the spec, so I'm not sure if it's expected
> >> >> > behavior or a quirk for particular device.
> >> >> >
> >> >> > Delay was chosen by experiment: it works with 100ms, but fails with
> >> >> > anything lower than 75ms.
> >> >>
> >> >> Looks like we don't respect the panel delays for DPCD backlight. The
> >> >> values are used for setting up the panel power sequencer, and thus PWM
> >> >> based backlight, but we should probably use the delays in DPCD backlight
> >> >> code too.
> >> >
> >> > This makes sense to me, you're referring to the panel delays in the VBT
> >> > correct?
> >>
> >> Yes. See pps_init_delays() and intel_pps_backlight_on(). The delays
> >> aren't applied to DPCD backlight, I think it would make sense if they
> >> were.
> >
> > I guess it explains why it usually stops working after suspend.
> > Probably BIOS doesn't re-init the power sequencer on resume.
>
> The point is, the DPCD backlight isn't driven via the power sequencer,
> while the PWM pin would be.
>
> Please file a bug at [1], and attach /sys/kernel/debug/dri/0/i915_vbt as
> well as dmesg from boot with drm.debug=14 module parameter set.

Done, see https://gitlab.freedesktop.org/drm/intel/-/issues/4170

> Thanks,
> Jani.
>
>
> [1] https://gitlab.freedesktop.org/drm/intel/issues/new
>
>
>
> >
> >> BR,
> >> Jani.
> >>
> >> >
> >> >>
> >> >> BR,
> >> >> Jani.
> >> >>
> >> >>
> >> >> >
> >> >> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >> >> > ---
> >> >> >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
> >> >> >  1 file changed, 4 insertions(+)
> >> >> >
> >> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> >> >> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> >> >> > index 4f8337c7fd2e..c4f35e1b5870 100644
> >> >> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> >> >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> >> >> > @@ -210,6 +210,10 @@ intel_dp_aux_hdr_enable_backlight(const struct
> >> >> > intel_crtc_state *crtc_state,
> >> >> >
> >> >> >         ctrl = old_ctrl;
> >> >> >         if (panel->backlight.edp.intel.sdr_uses_aux) {
> >> >> > +               /* Wait 100ms to ensure that panel is ready otherwise it
> >> >> > may not
> >> >> > +                * set chosen backlight level
> >> >> > +                */
> >> >> > +               msleep(100);
> >> >> >                 ctrl |= INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE;
> >> >> >                 intel_dp_aux_hdr_set_aux_backlight(conn_state, level);
> >> >> >         } else {
> >> >>
> >>
> >> --
> >> Jani Nikula, Intel Open Source Graphics Center
>
> --
> Jani Nikula, Intel Open Source Graphics Center
