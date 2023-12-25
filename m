Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB8181DF62
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 10:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE5A10E0EB;
	Mon, 25 Dec 2023 09:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B783110E0EB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 09:08:18 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-35fd0154368so18587935ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 01:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703495298; x=1704100098;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5GaJDOeVX+a5k01RPdTA9Ji7XUnbBCMon+kA4ZX7Kl0=;
 b=OfTaHlUHtchb0fFeuUIOYnY/KSKJwP/kco/sEjLrhw+wPFQSX/4CVXQXhI2+GE7Xya
 Z9KuCe3u/DAHRKUN3SuwqsivvyV4WsM5A7izwKweGaBRWOk2MBw62iVRMr8Pglh1hTSK
 7kGLWHvIDjO+K2Y8qdCIRwXprNhvpJq6N9mbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703495298; x=1704100098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GaJDOeVX+a5k01RPdTA9Ji7XUnbBCMon+kA4ZX7Kl0=;
 b=OeMHc+TEg5r8olnawivOTSgd8uUv7YSX4xoF2wupBPtwfpFJuOH7tw5HNA2zkKF5yO
 aYSPCd1rZwORS6giELTrreuU0LjctYYS4oLeWVha+8AzhJT+0NyMZXrfWecF9goN/AnB
 NyrbEKrja0sbqdWGErvRtF0jhgMY5UOPIStKzJPufJMfWpbEKCU6zZvbJ1hGjyI9QKYd
 SrbLO63ESOa5oFwa3w0fzXWZ1eziJkdFsgsZ6MAlQG/NZOdQTf8WigQpZLFrfEfbSoNc
 MCM+4fbNMjSdQ7VLmpWE9qcUpkaW1cOsplwqiDdeekPW8krAq6gfVU0S0H5eNnV9dEZW
 61WA==
X-Gm-Message-State: AOJu0YyfnXb06d/A5jms8QikZK9w1nwrP3PkSIFT26Mlanzk7uVpH8rT
 y1EZQ/xUbDMuBAdk61OgL6Vh8MR+pymi4F2t0rggb0TX0Ah5
X-Google-Smtp-Source: AGHT+IHHs+FFEAJ0LUOibcCM5Ef2h1iH5PS2ZU+74IFmDvaeMZ93K646IdSYB8bvUePKKxGDxwVMmj029urPxM7OhLc=
X-Received: by 2002:a92:ca4c:0:b0:35f:efdc:f067 with SMTP id
 q12-20020a92ca4c000000b0035fefdcf067mr6304522ilo.11.1703495297937; Mon, 25
 Dec 2023 01:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20231221135548.1.I10f326a9305d57ad32cee7f8d9c60518c8be20fb@changeid>
 <CAEXTbpdUjCvLE+m3d1vSvsE2njRSk1Ou3bZZGEvD_7oYt4+k4Q@mail.gmail.com>
 <CAD=FV=WDb7y-9dRgb0D=VxVB6EjUkcOJ+9D0Mp0-vw6wuKUHEg@mail.gmail.com>
In-Reply-To: <CAD=FV=WDb7y-9dRgb0D=VxVB6EjUkcOJ+9D0Mp0-vw6wuKUHEg@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 25 Dec 2023 17:08:07 +0800
Message-ID: <CAEXTbpdWPcc9==xb-_+2wY29aNdieLThmn_7JD4KV8U1LWgB2g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Wait for HPD when doing an AUX
 transfer
To: Doug Anderson <dianders@chromium.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 hsinyi@chromium.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Dec 22, 2023 at 11:34=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Fri, Dec 22, 2023 at 2:29=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Hi Douglas,
> >
> > On Fri, Dec 22, 2023 at 5:56=E2=80=AFAM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > >
> > > Unlike what is claimed in commit f5aa7d46b0ee ("drm/bridge:
> > > parade-ps8640: Provide wait_hpd_asserted() in struct drm_dp_aux"), if
> > > someone manually tries to do an AUX transfer (like via `i2cdump ${bus=
}
> > > 0x50 i`) while the panel is off we don't just get a simple transfer
> > > error. Instead, the whole ps8640 gets thrown for a loop and goes into
> > > a bad state.
> > >
> > > Let's put the function to wait for the HPD (and the magical 50 ms
> > > after first reset) back in when we're doing an AUX transfer. This
> > > shouldn't actually make things much slower (assuming the panel is on)
> > > because we should immediately poll and see the HPD high. Mostly this
> > > is just an extra i2c transfer to the bridge.
> > >
> > > Fixes: f5aa7d46b0ee ("drm/bridge: parade-ps8640: Provide wait_hpd_ass=
erted() in struct drm_dp_aux")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm=
/bridge/parade-ps8640.c
> > > index 541e4f5afc4c..fb5e9ae9ad81 100644
> > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > @@ -346,6 +346,11 @@ static ssize_t ps8640_aux_transfer(struct drm_dp=
_aux *aux,
> > >         int ret;
> > >
> > >         pm_runtime_get_sync(dev);
> > > +       ret =3D _ps8640_wait_hpd_asserted(ps_bridge, 200 * 1000);
> > > +       if (ret) {
> > > +               pm_runtime_put_sync_suspend(dev);
> > > +               return ret;
> > > +       }
> > >         ret =3D ps8640_aux_transfer_msg(aux, msg);
> > >         pm_runtime_mark_last_busy(dev);
> > >         pm_runtime_put_autosuspend(dev);
> > > --
> > > 2.43.0.472.g3155946c3a-goog
> > >
> >
> > I think commit 9294914dd550 ("drm/bridge: parade-ps8640: Link device
> > to ensure suspend/resume order")  is trying to address the same
> > problem, but we see this issue here because the device link is missing
> > DL_FLAG_PM_RUNTIME. I prefer to add DL_FLAG_PM_RUNTIME here so we
> > don't need to add a _ps8640_wait_hpd_asserted() after every
> > pm_runtime_get_*() call.
>
> I disagree. We've had several discussions on the lists about this
> topic before, though since I'm technically on vacation right now I'm
> not going to go look them up. In general "pm_runtime" is not
> sufficient for powering up DRM components. While DRM components can
> use pm_runtime themselves (as we are doing here), powering up another
> DRM component by grabbing a pm_runtime reference isn't right. There is
> a reason for the complexity of the DRM prepare/enable and all the
> current debates about the right order to call components in prepare()
> just demonstrates further that a simple pm_runtime reference isn't
> enough.
>
> It can be noted that, with ${SUBJECT} patch we _aren't_ powering up
> the panel. I actually tested two cases on sc7180-lazor. In one case I
> just closed the lid, which powered off the panel, but the touchscreen
> kept the panel power rail on. In this case with my patch I could still
> read the panel EDID. I then hacked the touchscreen off. Now when I
> closed the lid I'd get a timeout. This is different than if we tried
> to get a pm_runtime reference to the panel.
>
Okay, thanks for the detailed explanation. Then, let's go with the
approach in this patch. So,

Tested-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Pin-yen Lin <treapking@chromium.org>

>
> > As a side note, I've verified both this patch and DL_FLAG_PM_RUNTIME
> > in our downstream v5.15 kernel and panel-edp driver. Both of them
> > successfully wait for HPD asserted when the timeout used to happen,
> > but the panel is black in that situation. That being said, this patch
> > still brings us to a better state. Originally, panel_edp_resume()
> > would return an error when the timeout occurs, so the panel-edp driver
> > is stuck at an unexpected state. With this patch or
> > DL_FLAG_PM_RUNTIME, the runtime PM callbacks won't fail and a system
> > suspend/resume brings the panel back.
>
> OK. I'm going to shut off email for real this time while I enjoy some
> time off. Hopefully the above convinces you. Otherwise I guess we can
> continue to debate in mid-January.
>
> -Doug

Happy holiday!

Pin-yen
