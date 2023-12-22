Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152A81CC47
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 16:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5615E10E7E6;
	Fri, 22 Dec 2023 15:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CED10E7D1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 15:34:10 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7e88feso2491616a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 07:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703259247; x=1703864047;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucQpKyhkJH6aCcPXYD2Sb2IO6f28+WRJaLTnE9HJbWo=;
 b=T5s+586iLWJ6P6ypDvZ48O5kbcpaWzw/H84RAZCAeCWhdPGnNRbYVZSm753DuOFXm0
 gzgpW1XbUcyM+Skij6SfqieqxJPolqwMdT8NxJ4wjKjVvaEdOzKuYEkijqstLnio8KxO
 RnhgtCqkzdueaB4YU+sg+BAUXPQyI+6ZnMLC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703259247; x=1703864047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucQpKyhkJH6aCcPXYD2Sb2IO6f28+WRJaLTnE9HJbWo=;
 b=l1hH9n2bR1yABI5j1PFjTP1yB7Cz+r0PGPmO/cKwNJWQTvDCY9gOZc3q2lvS/AiC1G
 qQd/nCgQpY7NJXGBZ9PKLVex8HR2k2bCVm7Kts0WZhWnoF3cQ7UAAPOjkVNWzc5MZoyW
 o8G/ZMgcSIQeKY/sInkttUgv1knspAFU98JmsajB1JkpU9nuRTKMnkCT6I0CcrRhwQ/e
 4qSaJeK0w4jbYKEoVIln3980le3WpadLZ2b+Ukji7GIGmscqnxvJwA+Z59jVsQNnE+n9
 FKOhncHFZ6VjfFzp1lX/vfNZU3pW/q/ZtKLVdJ3udnqCrDHqA9Fl3YCGlzj+8CEBHNn6
 IrXQ==
X-Gm-Message-State: AOJu0YyYG+Txx76495MRmAiMvoy8QPVnHP2S6qOK/eQ1vL39/YysiRnp
 99SW45rDgP/fnL3eonESafyEMElWfT05aDBrvMuqV8AEpOse
X-Google-Smtp-Source: AGHT+IF4KHc3cbUFcyrqdj2Al5y5cx0veoRTZqXFCrpwjCsZmKxvutJpcmC7XGk8U+upWWKaRmNDIw==
X-Received: by 2002:a17:907:9727:b0:a22:fb3f:7a67 with SMTP id
 jg39-20020a170907972700b00a22fb3f7a67mr1184464ejc.150.1703259247324; 
 Fri, 22 Dec 2023 07:34:07 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 w1-20020a1709064a0100b00a1b65958c54sm2180117eju.125.2023.12.22.07.34.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 07:34:06 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40d3102d5d6so62855e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 07:34:05 -0800 (PST)
X-Received: by 2002:a05:600c:210d:b0:40d:3ab7:86e0 with SMTP id
 u13-20020a05600c210d00b0040d3ab786e0mr104331wml.3.1703259244872; Fri, 22 Dec
 2023 07:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20231221135548.1.I10f326a9305d57ad32cee7f8d9c60518c8be20fb@changeid>
 <CAEXTbpdUjCvLE+m3d1vSvsE2njRSk1Ou3bZZGEvD_7oYt4+k4Q@mail.gmail.com>
In-Reply-To: <CAEXTbpdUjCvLE+m3d1vSvsE2njRSk1Ou3bZZGEvD_7oYt4+k4Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Dec 2023 07:33:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WDb7y-9dRgb0D=VxVB6EjUkcOJ+9D0Mp0-vw6wuKUHEg@mail.gmail.com>
Message-ID: <CAD=FV=WDb7y-9dRgb0D=VxVB6EjUkcOJ+9D0Mp0-vw6wuKUHEg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Wait for HPD when doing an AUX
 transfer
To: Pin-yen Lin <treapking@chromium.org>
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

On Fri, Dec 22, 2023 at 2:29=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Hi Douglas,
>
> On Fri, Dec 22, 2023 at 5:56=E2=80=AFAM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > Unlike what is claimed in commit f5aa7d46b0ee ("drm/bridge:
> > parade-ps8640: Provide wait_hpd_asserted() in struct drm_dp_aux"), if
> > someone manually tries to do an AUX transfer (like via `i2cdump ${bus}
> > 0x50 i`) while the panel is off we don't just get a simple transfer
> > error. Instead, the whole ps8640 gets thrown for a loop and goes into
> > a bad state.
> >
> > Let's put the function to wait for the HPD (and the magical 50 ms
> > after first reset) back in when we're doing an AUX transfer. This
> > shouldn't actually make things much slower (assuming the panel is on)
> > because we should immediately poll and see the HPD high. Mostly this
> > is just an extra i2c transfer to the bridge.
> >
> > Fixes: f5aa7d46b0ee ("drm/bridge: parade-ps8640: Provide wait_hpd_asser=
ted() in struct drm_dp_aux")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/b=
ridge/parade-ps8640.c
> > index 541e4f5afc4c..fb5e9ae9ad81 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -346,6 +346,11 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_a=
ux *aux,
> >         int ret;
> >
> >         pm_runtime_get_sync(dev);
> > +       ret =3D _ps8640_wait_hpd_asserted(ps_bridge, 200 * 1000);
> > +       if (ret) {
> > +               pm_runtime_put_sync_suspend(dev);
> > +               return ret;
> > +       }
> >         ret =3D ps8640_aux_transfer_msg(aux, msg);
> >         pm_runtime_mark_last_busy(dev);
> >         pm_runtime_put_autosuspend(dev);
> > --
> > 2.43.0.472.g3155946c3a-goog
> >
>
> I think commit 9294914dd550 ("drm/bridge: parade-ps8640: Link device
> to ensure suspend/resume order")  is trying to address the same
> problem, but we see this issue here because the device link is missing
> DL_FLAG_PM_RUNTIME. I prefer to add DL_FLAG_PM_RUNTIME here so we
> don't need to add a _ps8640_wait_hpd_asserted() after every
> pm_runtime_get_*() call.

I disagree. We've had several discussions on the lists about this
topic before, though since I'm technically on vacation right now I'm
not going to go look them up. In general "pm_runtime" is not
sufficient for powering up DRM components. While DRM components can
use pm_runtime themselves (as we are doing here), powering up another
DRM component by grabbing a pm_runtime reference isn't right. There is
a reason for the complexity of the DRM prepare/enable and all the
current debates about the right order to call components in prepare()
just demonstrates further that a simple pm_runtime reference isn't
enough.

It can be noted that, with ${SUBJECT} patch we _aren't_ powering up
the panel. I actually tested two cases on sc7180-lazor. In one case I
just closed the lid, which powered off the panel, but the touchscreen
kept the panel power rail on. In this case with my patch I could still
read the panel EDID. I then hacked the touchscreen off. Now when I
closed the lid I'd get a timeout. This is different than if we tried
to get a pm_runtime reference to the panel.


> As a side note, I've verified both this patch and DL_FLAG_PM_RUNTIME
> in our downstream v5.15 kernel and panel-edp driver. Both of them
> successfully wait for HPD asserted when the timeout used to happen,
> but the panel is black in that situation. That being said, this patch
> still brings us to a better state. Originally, panel_edp_resume()
> would return an error when the timeout occurs, so the panel-edp driver
> is stuck at an unexpected state. With this patch or
> DL_FLAG_PM_RUNTIME, the runtime PM callbacks won't fail and a system
> suspend/resume brings the panel back.

OK. I'm going to shut off email for real this time while I enjoy some
time off. Hopefully the above convinces you. Otherwise I guess we can
continue to debate in mid-January.

-Doug
