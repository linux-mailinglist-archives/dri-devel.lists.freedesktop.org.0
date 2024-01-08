Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731A827A78
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 22:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98DC10E2D7;
	Mon,  8 Jan 2024 21:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1A310E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 21:59:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so26502895e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 13:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1704751186; x=1705355986;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZA6MVaxiJ2A9l409ToIFuD+Lm8QfNuypGfD4+VFQBc=;
 b=jghNNcR+uJcliM7OAJn9JoKmRHUlDZL6kNiJQ4EkzUMZbb83wgJEGXRzQyH/v3wEYI
 COzn4+sZhUc7A54OEdaQ23kmgHjtZ0Pz1VAOk3pGH3FITLe2wP6Gmrmua9QNnT4sZfZM
 lg0tGveEpI0pTpN54Z8ULselOzW3woa4UsCZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704751186; x=1705355986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZA6MVaxiJ2A9l409ToIFuD+Lm8QfNuypGfD4+VFQBc=;
 b=ce1m1fKB7k4KznGr8/kZB7EitndSc4p5VOLzwaqUcViG/skVP2+aYIdVDzk5kQPnV6
 2Fy02cFa36xAsk4JvggB0H5sPmitonFGYrFeLgZ7AD6WuVTz+gmnETGmFkWRgx8iCdKs
 l6/Vp4rP6LROpeoHZliriXhAfFX/eElRnHnuVzzinfPpXz/9dN7cwlr0axzSk0YbOjbN
 EENfIpvJktvE4JWlaS1Drt7yZokuNTuEYZeOxPl8pUhNW/rxzKyBC/O65moolyu1CupW
 iW0GJZ1+QZpX4PCgKbJDbINU7pN5WFJIiSpzh9wNmfG7UxrOtclJPLSn9619oBKK4LuW
 jHcQ==
X-Gm-Message-State: AOJu0YxTj2HJsQJpl0+fcbBMZPqt9uX6iuIWUx/3RS6htRIfaQ2eV7iI
 gTDQ+8oPdDSaRZVz2CkxTYE32H7svehv604fHayQQipIcTl0
X-Google-Smtp-Source: AGHT+IGQLjPCyTDehlPlz2gRqvgdpKDJv/90OAQG90+0bdE8VFBQbtjOu55OtpIv8g3tFDZGpojxiw==
X-Received: by 2002:a05:600c:548d:b0:40b:3849:4df6 with SMTP id
 iv13-20020a05600c548d00b0040b38494df6mr2168563wmb.36.1704751186026; 
 Mon, 08 Jan 2024 13:59:46 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 gv2-20020a170906f10200b00a26a80a58fcsm288024ejb.196.2024.01.08.13.59.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 13:59:45 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40e43e55b87so18635e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 13:59:45 -0800 (PST)
X-Received: by 2002:a05:600c:444b:b0:40d:87df:92ca with SMTP id
 v11-20020a05600c444b00b0040d87df92camr1890wmn.3.1704751185061; Mon, 08 Jan
 2024 13:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20231221135548.1.I10f326a9305d57ad32cee7f8d9c60518c8be20fb@changeid>
 <CAEXTbpdUjCvLE+m3d1vSvsE2njRSk1Ou3bZZGEvD_7oYt4+k4Q@mail.gmail.com>
 <CAD=FV=WDb7y-9dRgb0D=VxVB6EjUkcOJ+9D0Mp0-vw6wuKUHEg@mail.gmail.com>
 <CAEXTbpdWPcc9==xb-_+2wY29aNdieLThmn_7JD4KV8U1LWgB2g@mail.gmail.com>
In-Reply-To: <CAEXTbpdWPcc9==xb-_+2wY29aNdieLThmn_7JD4KV8U1LWgB2g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jan 2024 13:59:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W4dkqhDbt6z=+C-pkU4HKd+NkzjRaa6P3Dxn-+cy3rCA@mail.gmail.com>
Message-ID: <CAD=FV=W4dkqhDbt6z=+C-pkU4HKd+NkzjRaa6P3Dxn-+cy3rCA@mail.gmail.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 25, 2023 at 1:08=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Hi,
>
> On Fri, Dec 22, 2023 at 11:34=E2=80=AFPM Doug Anderson <dianders@chromium=
.org> wrote:
> >
> > Hi,
> >
> > On Fri, Dec 22, 2023 at 2:29=E2=80=AFAM Pin-yen Lin <treapking@chromium=
.org> wrote:
> > >
> > > Hi Douglas,
> > >
> > > On Fri, Dec 22, 2023 at 5:56=E2=80=AFAM Douglas Anderson <dianders@ch=
romium.org> wrote:
> > > >
> > > > Unlike what is claimed in commit f5aa7d46b0ee ("drm/bridge:
> > > > parade-ps8640: Provide wait_hpd_asserted() in struct drm_dp_aux"), =
if
> > > > someone manually tries to do an AUX transfer (like via `i2cdump ${b=
us}
> > > > 0x50 i`) while the panel is off we don't just get a simple transfer
> > > > error. Instead, the whole ps8640 gets thrown for a loop and goes in=
to
> > > > a bad state.
> > > >
> > > > Let's put the function to wait for the HPD (and the magical 50 ms
> > > > after first reset) back in when we're doing an AUX transfer. This
> > > > shouldn't actually make things much slower (assuming the panel is o=
n)
> > > > because we should immediately poll and see the HPD high. Mostly thi=
s
> > > > is just an extra i2c transfer to the bridge.
> > > >
> > > > Fixes: f5aa7d46b0ee ("drm/bridge: parade-ps8640: Provide wait_hpd_a=
sserted() in struct drm_dp_aux")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/d=
rm/bridge/parade-ps8640.c
> > > > index 541e4f5afc4c..fb5e9ae9ad81 100644
> > > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > @@ -346,6 +346,11 @@ static ssize_t ps8640_aux_transfer(struct drm_=
dp_aux *aux,
> > > >         int ret;
> > > >
> > > >         pm_runtime_get_sync(dev);
> > > > +       ret =3D _ps8640_wait_hpd_asserted(ps_bridge, 200 * 1000);
> > > > +       if (ret) {
> > > > +               pm_runtime_put_sync_suspend(dev);
> > > > +               return ret;
> > > > +       }
> > > >         ret =3D ps8640_aux_transfer_msg(aux, msg);
> > > >         pm_runtime_mark_last_busy(dev);
> > > >         pm_runtime_put_autosuspend(dev);
> > > > --
> > > > 2.43.0.472.g3155946c3a-goog
> > > >
> > >
> > > I think commit 9294914dd550 ("drm/bridge: parade-ps8640: Link device
> > > to ensure suspend/resume order")  is trying to address the same
> > > problem, but we see this issue here because the device link is missin=
g
> > > DL_FLAG_PM_RUNTIME. I prefer to add DL_FLAG_PM_RUNTIME here so we
> > > don't need to add a _ps8640_wait_hpd_asserted() after every
> > > pm_runtime_get_*() call.
> >
> > I disagree. We've had several discussions on the lists about this
> > topic before, though since I'm technically on vacation right now I'm
> > not going to go look them up. In general "pm_runtime" is not
> > sufficient for powering up DRM components. While DRM components can
> > use pm_runtime themselves (as we are doing here), powering up another
> > DRM component by grabbing a pm_runtime reference isn't right. There is
> > a reason for the complexity of the DRM prepare/enable and all the
> > current debates about the right order to call components in prepare()
> > just demonstrates further that a simple pm_runtime reference isn't
> > enough.
> >
> > It can be noted that, with ${SUBJECT} patch we _aren't_ powering up
> > the panel. I actually tested two cases on sc7180-lazor. In one case I
> > just closed the lid, which powered off the panel, but the touchscreen
> > kept the panel power rail on. In this case with my patch I could still
> > read the panel EDID. I then hacked the touchscreen off. Now when I
> > closed the lid I'd get a timeout. This is different than if we tried
> > to get a pm_runtime reference to the panel.
> >
> Okay, thanks for the detailed explanation. Then, let's go with the
> approach in this patch. So,
>
> Tested-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Pin-yen Lin <treapking@chromium.org>

Thanks for the tags. I've pushed this to drm-misc-fixes:

024b32db43a3 drm/bridge: parade-ps8640: Wait for HPD when doing an AUX tran=
sfer
