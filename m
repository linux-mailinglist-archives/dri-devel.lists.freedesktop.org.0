Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F59EDB18
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FDC10E22E;
	Wed, 11 Dec 2024 23:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rdmkgM1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB1310E22E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:20:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401be44b58so3064e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733959228; x=1734564028; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rdZnIKQ/LHZQhWa+g8bmrkCZc7Dw1lYEQ4CMJReSzdA=;
 b=rdmkgM1ojMh8LmgU3J5pae1Q2xu48zP3oQHu9n88dDEGvMICx59HD8WVOI0XaOm1FQ
 MN1Rk89WruH9kb7gJfwtuWwNZTcULT3Retg5f2ua1SaEntgeonuhgSmbHVJBGeGfvpHp
 XGUv9yW/fmjV6lRbhE9/goIbx74dAJTa6N0W3nN4mHU4fuRh60VhQ2UYh28sJ2PbGR7b
 /KIGBPxIteXwsWG6krKaAcijX3ZfY9UtJN18VSmXxhRUeMoyfD7zr3aMqQBZmT+pHNXh
 GI2UHD0QFbb0Zq98DKnF0qItUW762AMszkfFRhEqd9SyzoBfNd5PfXSObcVHaq7EQWY+
 IpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733959228; x=1734564028;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rdZnIKQ/LHZQhWa+g8bmrkCZc7Dw1lYEQ4CMJReSzdA=;
 b=kaA/Oqeb/u/4Xs9PHNlbaY/VQeuOVeGsWuq/VKOfUeQ5wmWAwCVb7fkuqbgV+4W9EQ
 j2WbTX31oZTdMHxtZFzQcXQMQdcLlj4Ict/pycxUjXmk2WljBgrdMBQjw1p9T6k4GtMn
 Pu8QaIZoQdHsn6M3gIllQlm2YMReKopSI0hwqF7N4F/rQaXQi5NY8NV3sqD1m4xYMklK
 RUk4c2WLovnwOtyJ6SjtfSx7W3LHafj7UA/FI0ATj0CxB9xsygsEB6KB41BbJ5xfGkt1
 7hPrf9zQR3HA07YLMcOn4EWYltbtBns2tgWX5ac0urrfzDRAMGOkcKeFkiQaqUc5lh0M
 UXbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2WkXZyfjr5bc9tvYfhZ1qCv1ynN4ipVui1HNzDbbb4JFovwbbRrpkFWTtV5mg1VRqDeRA0XYjNnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpYnBuXgjM/h494O8UrG393Zc0C/NWoBwDTgFCNdpGoXBk8G4D
 25hr16RrYjCyBuYkyrd6pLqGWH/f4+o59y1+fAH2eyJ9U4+j+8cz0GdDgSrOjok=
X-Gm-Gg: ASbGncuLnqXPemdo3NEz0gO4JslFEViZXPlL4imciXA1IKG3JSzJlhC4RcVwhxIH7eG
 nmGiv/8C0+CzB3aZn69GhuxyALG0y3g5VRuGquBW3VfbwM0SfXgkjOUzIp1JTLyOqz+oB5LtV9U
 1J0YgldJdN4uCyYb6B4ZVY+2Ar/6Ey+sbD19xDYG7FXDAqNzeLUfF6goStgLW5H3qsZNsRuXa/S
 8BaXLup0JAqb83gclkSFqO9OXrX0ldGXT3ferfbjse/oQ18SLfuViOOhpxRBcTVQ89745Hs+LvL
 UCdiKSKHHhI/8cc2EhC4qq47LTdLS0lJTA==
X-Google-Smtp-Source: AGHT+IEQJicMAgPo8nzkfcZiEODI37NW3NL1MWTwEmoAELXOFZY/uswhnYqoKCcWgpFW43WqVKttWQ==
X-Received: by 2002:a05:6512:3092:b0:53f:8c46:42a6 with SMTP id
 2adb3069b0e04-5402f0154f1mr385964e87.27.1733959228512; 
 Wed, 11 Dec 2024 15:20:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53eb12aba45sm1527259e87.33.2024.12.11.15.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:20:27 -0800 (PST)
Date: Thu, 12 Dec 2024 01:20:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 bliang@analogixsemi.com, 
 qwen@analogixsemi.com, treapking@google.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge:anx7625: Update HDCP status at
 atomic_disable()
Message-ID: <dxczrjwzevtqn4jg7iaanui66hxsmx6gr6yvcm3wbztskweqmy@jyqpt2ntd224>
References: <20241209064632.1705578-1-xji@analogixsemi.com>
 <fy6zvkdidz2srerfq5bshgcshps2wfa4syxwndwesgxcej66ws@nf5svlpkeodh>
 <CAEXTbpeC9DpLxHm2fw7hWKGfpxhUy5ZgHXtGJ0=WSxRrVa845w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEXTbpeC9DpLxHm2fw7hWKGfpxhUy5ZgHXtGJ0=WSxRrVa845w@mail.gmail.com>
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

On Wed, Dec 11, 2024 at 11:54:54PM +0800, Pin-yen Lin wrote:
> Hi Dimitry,
> 
> Thanks for the review.
> 
> On Wed, Dec 11, 2024 at 5:44 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Dec 09, 2024 at 02:46:32PM +0800, Xin Ji wrote:
> > > When user enabled HDCP feature, upper layer will set HDCP content
> > > to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> > > HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> > > support HDCP feature.
> > >
> > > However once HDCP content turn to  DRM_MODE_CONTENT_PROTECTION_ENABLED
> > > upper layer will not update the HDCP content to
> > > DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor disconnect.
> >
> > What is "upper layer"? Is it a kernel or a userspace?
> 
> I think Xin meant userspace, but sounds like there are some
> misunderstanding around the HDCP status.
> >
> > >From drm_hdcp_update_content_protection() documentation:
> >
> > No uevent for DESIRED->UNDESIRED or ENABLED->UNDESIRED,
> > as userspace is triggering such state change and kernel performs it without
> > fail.This function update the new state of the property into the connector's
> > state and generate an uevent to notify the userspace.
> >
> >
> > >
> > > So when user dynamic change the display resolution, anx7625 driver must
> > > call drm_hdcp_update_content_protection() to update HDCP content to
> > > DRM_MODE_CONTENT_PROTECTION_UNDESIRED in bridge interface
> > > .atomic_disable().
> >
> > Why?
> >
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 25 ++++++++++++++++++-----
> > >  1 file changed, 20 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index a2675b121fe4..a75f519ddcb8 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data *ctx)
> > >                                TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
> > >  }
> > >
> > > +static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ctx)
> > > +{
> > > +     struct device *dev = ctx->dev;
> > > +
> > > +     if (!ctx->connector)
> > > +             return;
> > > +
> > > +     anx7625_hdcp_disable(ctx);
> > > +
> > > +     ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > +     drm_hdcp_update_content_protection(ctx->connector,
> > > +                                        ctx->hdcp_cp);
> > > +
> > > +     dev_dbg(dev, "update CP to UNDESIRE\n");
> > > +}
> > > +
> > >  static int anx7625_hdcp_enable(struct anx7625_data *ctx)
> > >  {
> > >       u8 bcap;
> > > @@ -2165,11 +2181,8 @@ static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
> > >                       dev_err(dev, "current CP is not ENABLED\n");
> > >                       return -EINVAL;
> > >               }
> > > -             anx7625_hdcp_disable(ctx);
> > > -             ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > -             drm_hdcp_update_content_protection(ctx->connector,
> > > -                                                ctx->hdcp_cp);
> > > -             dev_dbg(dev, "update CP to UNDESIRE\n");
> > > +
> > > +             anx7625_hdcp_disable_and_update_cp(ctx);
> >
> > No. atomic_check() MAY NOT perform any changes to the hardware. It might
> > be just a probe from userspace to check if the mode or a particular
> > option can be set in a particular way. There is no guarantee that
> > userspace will even try to commit it.
> 
> So, we should move the hdcp status update from .atomic_check() to
> .atomic_enable() and .atomic_disable(), right? That is, enable HDCP
> for the chip at .atomic_enable() if it is DESIRED and disable it at
> .atomic_disable() if we enabled it previously.

This is one of the options (e.g. used by cdns-mhdp8546). Another option
(i915, amd) is to enable and disable HDCP in atomic_enable() following
selected HDCP state.

> 
> Maybe we can keep some of the checks in .atomic_check(), but I doubt
> if those logics actually make sense.

I think these checks are okay, just move the
anx7625_hdcp_disable_and_update_cp() to a proper place.

> >
> > >       }
> > >
> > >       if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > @@ -2449,6 +2462,8 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
> > >
> > >       dev_dbg(dev, "drm atomic disable\n");
> > >
> > > +     anx7625_hdcp_disable_and_update_cp(ctx);
> > > +
> > >       ctx->connector = NULL;
> > >       anx7625_dp_stop(ctx);
> > >
> > > --
> > > 2.25.1
> > >
> >
> > --
> > With best wishes
> > Dmitry
> 
> Regards,
> Pin-yen

-- 
With best wishes
Dmitry
