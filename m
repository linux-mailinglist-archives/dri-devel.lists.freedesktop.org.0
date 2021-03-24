Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A728E3474D0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 10:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC236E99F;
	Wed, 24 Mar 2021 09:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3C86E99C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:40:01 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so2354980wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=+spcrwNB5vbrwaK4T0mml0SYdMYl5UpR9KJiaTQ0lDk=;
 b=cHUmoWG62TuScphZQB1TRRPDN2v2lIKj7c+zPMqbUsVUCGF7azyokxzZftv9qkhhKv
 QCjAwskEi3J2ie/fdV8XhL5rtyev+MtTWZn7FrIQT2yjBT2buSJEZYxoMQGmDOP/8CP9
 BLTD7RlnMgpijdsr1yLDiqQGewX5ZnDeL4Fqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=+spcrwNB5vbrwaK4T0mml0SYdMYl5UpR9KJiaTQ0lDk=;
 b=CxRXpTWxAXJ2JGcu8Bo8tGLo6uHrnhdAJ0zmP2VIwqYY/PJ/Q8IWz+XPS2pHCsWcyv
 UwIkRBf2YTouHEzrGkAELLIVgbd1MO5LrZ0mMJIK1FE4pWEtozq580lo4Dd14O6J7uQ4
 eU2FXxQlmJPa75QDj1Uwj4bK7k1BSqIIx3wv6s/Q+m3zM8dSzN0m0wmZAZzFE55UgB8U
 15YpvBoe/tKpmWeBehb99pDwZKWGmrax1uhxHhvfWsb49qKQL7QqH7jfFELEqGKqYHJH
 UOZnmZ6RB7jYmdmxEXGlFIliijc9azTD94l96z4Z+GMHFAGDKCm43cXlMAHhfNOwBnam
 43Qw==
X-Gm-Message-State: AOAM530UrFmudh0LYEgyiHVqQJrA+h5ImeGLYmgC/759mem5JCn2VTKM
 Gw0vvWgSz/h894cxieraNX77wQ==
X-Google-Smtp-Source: ABdhPJzA1ZM1iOjaqxPi5UDsqjWUfrsBmpoB4hDKNUiQBbFAOixSqCuiLJcewIusZCJwhzXSCA5HKA==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr1971366wma.71.1616578800309; 
 Wed, 24 Mar 2021 02:40:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l1sm754850wrv.87.2021.03.24.02.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 02:39:59 -0700 (PDT)
Date: Wed, 24 Mar 2021 10:39:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] drm: bridge/panel: Cleanup connector on bridge
 detach
Message-ID: <YFsI6OA+jmyiPyv6@phenom.ffwll.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, od@zcrc.me,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20210120123535.40226-1-paul@crapouillou.net>
 <20210120123535.40226-2-paul@crapouillou.net>
 <CAKMK7uGGDe8bZpeTnyCkF7g_2gC1nixOzWe4FWYXPRWi-q5y7A@mail.gmail.com>
 <4YQ8NQ.HNQ7IMBKVEBV2@crapouillou.net>
 <CAKMK7uFHYPvJm46f-LXBO=nERGBBO3i_=YXZyAUi0ZXJFLmXVw@mail.gmail.com>
 <YFqgyTNt42vBe+w+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFqgyTNt42vBe+w+@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 od@zcrc.me, stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 04:15:37AM +0200, Laurent Pinchart wrote:
> On Wed, Jan 20, 2021 at 06:38:03PM +0100, Daniel Vetter wrote:
> > On Wed, Jan 20, 2021 at 6:12 PM Paul Cercueil wrote:
> > > Le mer. 20 janv. 2021 =E0 17:03, Daniel Vetter a =E9crit :
> > > > On Wed, Jan 20, 2021 at 1:35 PM Paul Cercueil wrote:
> > > >>
> > > >>  If we don't call drm_connector_cleanup() manually in
> > > >>  panel_bridge_detach(), the connector will be cleaned up with the =
other
> > > >>  DRM objects in the call to drm_mode_config_cleanup(). However, si=
nce our
> > > >>  drm_connector is devm-allocated, by the time drm_mode_config_clea=
nup()
> > > >>  will be called, our connector will be long gone. Therefore, the
> > > >>  connector must be cleaned up when the bridge is detached to avoid
> > > >>  use-after-free conditions.
> > > >
> > > > For -fixes this sounds ok, but for -next I think switching to drmm_
> > > > would be much better.
> > >
> > > The API would need to change to have access to the drm_device struct,
> > > though. That would be quite a big patch, there are a few dozens source
> > > files that use this API already.
> > =

> > Hm right pure drmm_ doesn't work for panel or bridge since it's
> > usually a separate driver. But devm_ also doesn't work. I think what
> > we need here is two-stage: first kmalloc the panel (or bridge, it's
> > really the same) in the panel/bridge driver load. Then when we bind it
> > to the drm_device we can tie it into the managed resources with
> > drmm_add_action_or_reset. Passing the drm_device to the point where we
> > allocate the panel/bridge doesn't work for these.
> > =

> > I think minimally we need a FIXME here and ack from Laurent on how
> > this should be solved at least, since panel bridge is used rather
> > widely.
> =

> Bridge removal is completely broken. If you unbind a bridge driver from
> the device, the bridge will be unregistered and resources freed, without
> the display driver knowing about this. The lifetime of the drm_bridge
> structure itself isn't the only issue to be addressed here, it's broader
> than that, and needs to consider that the display driver could be
> calling the bridge operations concurrently to the removal.

So for the "unloading bridge should first unload display" problem that was
supposed to get fixed with device links. There was at least a patch for
that, and I Rafel from pm side did all the core changes to make it work.
But it didn't land I think, so things keep on sucking.

Ofc the lifetime of the bridge structure is then an additional problem on
top here.

> We need a volunteer with enough motivation to solve this subsystem-wide
> :-) In the meantime, whatever shortcut addresses immediate issues is
> probably fine, as yak-shaving in this area would definitely not be
> reasonable.

I guess drm/bridge keeps on disappointing :-/
-Daniel

> =

> > > >> v2: Cleanup connector only if it was created
> > > >>
> > > >> Fixes: 13dfc0540a57 ("drm/bridge: Refactor out the panel wrapper f=
rom the lvds-encoder bridge.")
> > > >> Cc: <stable@vger.kernel.org> # 4.12+
> > > >> Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > >> Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > >> Cc: Jonas Karlman <jonas@kwiboo.se>
> > > >> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > >> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > >> ---
> > > >>  drivers/gpu/drm/bridge/panel.c | 6 ++++++
> > > >>  1 file changed, 6 insertions(+)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/brid=
ge/panel.c
> > > >> index 0ddc37551194..df86b0ee0549 100644
> > > >> --- a/drivers/gpu/drm/bridge/panel.c
> > > >> +++ b/drivers/gpu/drm/bridge/panel.c
> > > >> @@ -87,6 +87,12 @@ static int panel_bridge_attach(struct drm_bridg=
e *bridge,
> > > >>
> > > >>  static void panel_bridge_detach(struct drm_bridge *bridge)
> > > >>  {
> > > >> +	struct panel_bridge *panel_bridge =3D drm_bridge_to_panel_bridge=
(bridge);
> > > >> +	struct drm_connector *connector =3D &panel_bridge->connector;
> > > >> +
> > > >> +	/* Cleanup the connector if we know it was initialized */
> > > >> +	if (!!panel_bridge->connector.dev)
> > > >> +		drm_connector_cleanup(connector);
> > > >>  }
> > > >>
> > > >>  static void panel_bridge_pre_enable(struct drm_bridge *bridge)
> =

> -- =

> Regards,
> =

> Laurent Pinchart

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
