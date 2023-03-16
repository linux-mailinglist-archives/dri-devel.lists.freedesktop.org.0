Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0E76BCD06
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 11:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2183810E101;
	Thu, 16 Mar 2023 10:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7FC10E101
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 10:41:20 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id t129so549825iof.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678963279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuyYSP6SPR+Rpc5oB9smN5+cA4uJ40zcl370tC/DYEw=;
 b=VdFK9wO3bWJxzN1oyPJNzTbCFUcO2h3khVD9S8x1f0IjKgIlT+EJyi25jm/NsZWi6V
 o2gHQgdCz7Z7uXb0gDVjAfFsByKuJ2QwH4sWDt0p+BqC1Y97ICSuV82fMRlp9RDUB+hX
 bR1phPIaW+n4fx7Y1tiJqNZYrPT/0Ba4FWWqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678963279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JuyYSP6SPR+Rpc5oB9smN5+cA4uJ40zcl370tC/DYEw=;
 b=fsQTq53LMHNOIAdsdyitxupo0nQiUlfauYAXwmYQeWr27EDLmONxgu27L42m5u5suQ
 lD83GjEqi8hWMP1CzgGPQZdWTIm57cJUHX6IfQgAezNXKV5gjFYvNY3v+ykyGYd8GUgZ
 jsCdyNgUIS/qpnwMpXL0hOBZhJteJFT1EqWkiEtaeFFsEmgNJC+tCMsDNLvCqyL9fSXa
 Yjcvu2mgXI2qWgeXQjExpi9yEXtUpzygogsC7IKS1cSWeQEraIBQfINAocn6gkApic7H
 8eEeaoLpsRn308NtGmFfwtIDMQaQFnJk7c/xJ9gslTTXg1PWM1bY+nVbH0AFbG7gRZlR
 N5Dw==
X-Gm-Message-State: AO0yUKWrDTY+L9GfCb88xb6tYMh1PEj/4Xrjx+Hpykdgk4jynQ+7fKUN
 Av+qnzkcx3yEDkbO12Dc92lCShpB9alUFcN6cw+nqw==
X-Google-Smtp-Source: AK7set8Sjrf3rJ2OyrNXGh5/pgmyV/OOM3eeJAznxKybJO5577cMqIP/hFMZFLkA0Ic/WT0SdqTwNXi4K/wejh57sto=
X-Received: by 2002:a5d:8b47:0:b0:745:c41a:8f0f with SMTP id
 c7-20020a5d8b47000000b00745c41a8f0fmr20956879iot.2.1678963279337; Thu, 16 Mar
 2023 03:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230314110043.2139111-1-treapking@chromium.org>
 <CAD=FV=W=jVsvD620wWKfniRYQNJnb7goDUKb_HhL_qVxLYGZOA@mail.gmail.com>
 <CAEXTbpe6EyukjKfgaVtHdMK2Ppw715kUUnOqvFa+tEX913p9aQ@mail.gmail.com>
 <CAD=FV=VLh37hFpLwyuPoGNDCpvVL7FGLySVp7d1W788YkjNYog@mail.gmail.com>
In-Reply-To: <CAD=FV=VLh37hFpLwyuPoGNDCpvVL7FGLySVp7d1W788YkjNYog@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 16 Mar 2023 18:41:08 +0800
Message-ID: <CAEXTbpcs1kruF=UkYSGYBBMJW_qeEELh6Yy8c5H+6TUkeU_3LA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: ps8640: Skip redundant bridge enable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 16, 2023 at 5:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Mar 14, 2023 at 8:28=E2=80=AFPM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Hi Doug,
> >
> > On Wed, Mar 15, 2023 at 5:31=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Mar 14, 2023 at 4:00=E2=80=AFAM Pin-yen Lin <treapking@chromi=
um.org> wrote:
> > > >
> > > > Skip the drm_bridge_chain_pre_enable call when the bridge is alread=
y
> > > > pre_enabled. This make pre_enable and post_disable (thus
> > > > pm_runtime_get/put) symmetric.
> > > >
> > > > Fixes: 46f206304db0 ("drm/bridge: ps8640: Rework power state handli=
ng")
> > > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/d=
rm/bridge/parade-ps8640.c
> > > > index 4b361d7d5e44..08de501c436e 100644
> > > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > @@ -557,7 +557,8 @@ static struct edid *ps8640_bridge_get_edid(stru=
ct drm_bridge *bridge,
> > > >          * EDID, for this chip, we need to do a full poweron, other=
wise it will
> > > >          * fail.
> > > >          */
> > > > -       drm_atomic_bridge_chain_pre_enable(bridge, connector->state=
->state);
> > > > +       if (poweroff)
> > > > +               drm_atomic_bridge_chain_pre_enable(bridge, connecto=
r->state->state);
> > >
> > > It always seemed weird to me that this function was asymmetric, so I
> > > like this change, thanks!
> > >
> > > I also remember wondering before how this function was safe, though.
> > > The callpath for getting here from the ioctl is documented in the
> > > function and when I look at it I wonder if anything is preventing the
> > > bridge from being enabled / disabled through normal means at the same
> > > time your function is running. That could cause all sorts of badness
> > > if it is indeed possible. Does anyone reading this know if that's
> > > indeed a problem?
> >
> > If the "normal mean" is disabling the bridge, then we are probably
> > disabling the whole display pipeline. If so, is the EDID still
> > relevant in this case?
>
> In general when we do a "modeset" I believe that the display pipeline
> is disabled and re-enabled. On a Chromebook test image you can see
> this disable / re-enable happen when you switch between "VT2" and the
> main login screen.
>
> If the display pipeline is disabled / re-enabled then it should still
> be fine to keep the EDID cached, so that's not what I'm worried about.
> I'm more worried that someone could be querying the EDID at the same
> time that someone else was turning the screen off. In that case it
> would be possible for "poweroff" to be true (because the screen was on

You mean "poweroff" to be "false", right? That is,
"ps_bridge->pre_enabled" is true. So the .get_edid function assumes
that the pipeline is enabled, but another thread is turning off the
screen.

> when we started reading the EDID) and then partway through the screen
> could get turned off.

Thanks for the detailed explanation. In that case, we probably get an
error and return a NULL EDID. But do we need the EDID when the screen
is turned off? And the EDID should be re-read if the screen is turned
back on.

However, in a reversed setting, if the .get_edid is reading EDID when
the pipeline is disabled (poweroff=3Dtrue), but someone enables the
pipeline in between. In that case, .get_edid might disable the bridge
and panel after the pipeline is enabled.

Anyway, the function is not safe, but it's no more unsafe than before.
Patch 2/2 should lower the chance for anything bad to happen by adding
a cache by only read EDID once.
>
> -Doug

Thanks and regards,
Pin-yen
