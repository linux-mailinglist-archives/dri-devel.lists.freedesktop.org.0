Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC38070DB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52A10E10B;
	Wed,  6 Dec 2023 13:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9F10E721
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:27:08 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dae7cc31151so5202373276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701869227; x=1702474027;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fh65rB9m3zmcwI78gbdoma11sFPZlknVdRdIEejcOzk=;
 b=XBC6UTk2ErobcnLNNjZ5py1VAsBJIq9Z13aEpCl3KTJaii4mHxEmWcZZitoFjnXljb
 5zsCtrGYaYbTVPZ/nxBoR27cD0A98PCTMHLz2GVR8TDiqS0mZl6m+KrYCauVqGm2uhVI
 dFaRZivoFRydAFpMAnpAe/ZE1+pE4VCryISZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701869227; x=1702474027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fh65rB9m3zmcwI78gbdoma11sFPZlknVdRdIEejcOzk=;
 b=TUsQiHG+3eh4En80ujiUN+e8nR7atmm4opBTCorVpN/JP268SXNKUxyamZDrxOJ9tJ
 N2mADgD74j65B7EzasbET3Wy9hBMWZVzZXNJWP80kxYUBJP/KGD/sr+hcIytzubKuebp
 xyBp8vqA8agDbWF9wVsIRkdN5BTGZLwyl1e69P4Qeldm6lWlOXALWpoFx8oqFbTzhM/j
 zCO/orWeMZ0o4RA+VVEm68Y02CH+pLQ5G403aW9rjrqdNMpvCpOS+9WCceudRsRm8Z65
 cpCUOwco/yMOyLWuzVzADmHu0vMR0Kwwu6awBD+cnIi2UraTPTqtRMX5SC5nyQ13Qvqm
 zBFA==
X-Gm-Message-State: AOJu0Yw6A6lPjohqIIZltA4bRTbP5jZ0YgpS47NCIW3NRywLy6sDH1Q3
 c4G5LiSEkg3KA7gyWOafy5djAmotNyhl3FHbBI4abg==
X-Google-Smtp-Source: AGHT+IFZfIL6+W7s5pyxsZPYDOSlcNwPx1enVqhU/bXlRGWh1G3b6ooz5yL/Ne/H71992drIOEXBk1ppxWa2Qb/yRrw=
X-Received: by 2002:a25:2692:0:b0:db7:d9e2:f399 with SMTP id
 m140-20020a252692000000b00db7d9e2f399mr662560ybm.29.1701869226832; Wed, 06
 Dec 2023 05:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
 <CAPY8ntAALKiTEG6qyFO=qVqSLUW9x8AMfPMc_TUwC3z8tJ7Kzw@mail.gmail.com>
In-Reply-To: <CAPY8ntAALKiTEG6qyFO=qVqSLUW9x8AMfPMc_TUwC3z8tJ7Kzw@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 6 Dec 2023 14:26:55 +0100
Message-ID: <CABGWkvq-fJTDFPB=389XbHW_SLt6BQr-BhjZqZ+01i3v8EaYwA@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, michael@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Jagan,

On Tue, Dec 5, 2023 at 4:39=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Dario
>
> On Tue, 5 Dec 2023 at 10:54, Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
> >
> > The patch fixes the code for finding the next bridge with the
> > "pre_enable_prev_first" flag set to false. In case this condition is
> > not verified, i. e. there is no subsequent bridge with the flag set to
> > false, the whole bridge list is traversed, invalidating the "next"
> > variable.
> >
> > The use of a new iteration variable (i. e. "iter") ensures that the val=
ue
> > of the "next" variable is not invalidated.
>
> We already have https://patchwork.freedesktop.org/patch/529288/ that
> has been reviewed (but not applied) to resolve this. What does this
> version do differently and why?

My patches only affect drm_atomic_bridge_chain_post_disable(), whereas
Jagan's patch affects both
drm_atomic_bridge_chain_post_disable() and drm_atomic_bridge_chain_pre_enab=
le().
I tested Jagan's patch on my system with success and I reviewed with
Michael Trimarchi the
drm_atomic_bridge_chain_pre_enable() fixing and we think it's okay.
We also believe that our changes to post_disable() are better, as we
set the 'next' variable only when required,
and the code is more optimized since the list_is_last() is not called
within the loop.
Would it be possible to use Jagan's patch for fixing
drm_atomic_bridge_chain_pre_enable() and mine for
fixing drm_atomic_bridge_chain_post_disable()?

Thanks and regards,
Dario

>
>   Dave
>
> > Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to al=
ter bridge init order")
> > Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/drm_bridge.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.=
c
> > index f66bf4925dd8..2e5781bf192e 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -662,7 +662,7 @@ void drm_atomic_bridge_chain_post_disable(struct dr=
m_bridge *bridge,
> >                                           struct drm_atomic_state *old_=
state)
> >  {
> >         struct drm_encoder *encoder;
> > -       struct drm_bridge *next, *limit;
> > +       struct drm_bridge *iter, *next, *limit;
> >
> >         if (!bridge)
> >                 return;
> > @@ -680,14 +680,15 @@ void drm_atomic_bridge_chain_post_disable(struct =
drm_bridge *bridge,
> >                                  * was enabled first, so disabled last
> >                                  */
> >                                 limit =3D next;
> > +                               iter =3D next;
> >
> >                                 /* Find the next bridge that has NOT re=
quested
> >                                  * prev to be enabled first / disabled =
last
> >                                  */
> > -                               list_for_each_entry_from(next, &encoder=
->bridge_chain,
> > +                               list_for_each_entry_from(iter, &encoder=
->bridge_chain,
> >                                                          chain_node) {
> > -                                       if (!next->pre_enable_prev_firs=
t) {
> > -                                               next =3D list_prev_entr=
y(next, chain_node);
> > +                                       if (!iter->pre_enable_prev_firs=
t) {
> > +                                               next =3D list_prev_entr=
y(iter, chain_node);
> >                                                 limit =3D next;
> >                                                 break;
> >                                         }
> > --
> > 2.43.0
> >

--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
