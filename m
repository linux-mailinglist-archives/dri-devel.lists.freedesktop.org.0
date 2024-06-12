Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35C905555
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB07610E888;
	Wed, 12 Jun 2024 14:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="REDBJfyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A2810E885
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:39:19 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4405a5425baso21269351cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718203156; x=1718807956;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UY8FyGhFzNz8kU02mOEKGYBexw/0qw3Ur3irWH55yC0=;
 b=REDBJfyAS4cdbOumWApxo0dLBIUWUM3M4aMV61G5C2UulTJ+l7vDjlRuhaLqiqsysY
 wdWu9xbSlLJ1shNpLG/w+5uh2tz6heZ+dhzEB7Gqo0fBBah1o+vE9r3v9w8+mYeo5ogw
 7E0sMT3b4DUy3coZji/LjbkogK6dJmMlcjp7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718203156; x=1718807956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UY8FyGhFzNz8kU02mOEKGYBexw/0qw3Ur3irWH55yC0=;
 b=TT3dyKys6Vj51+fFK/Cuu5wx/nTtO0RExHqXPEJnpsFhhZbOm65QOV3DJEdarQwR1+
 rgN5VWr+Bc+SkuX66trJFQTv9+AHIVjUfW8YHSw8YkXTyE8JBiYCrkhdtDJXafEuv/MY
 WG9q8X4gAzaI4x7zyUg92s48diGGzaVf8EgvUZKMhvCXNLdlkvUDxiVxwvS7gb3H5XO2
 5KabGqQ8/z7k25FM9g1N23fEovjybqc3IOheZZvKZjuVDr0nrDSm5zKAU9BezQYs+Npn
 Z9p4gww+CzyRDYU9mo7vc7Sqt8KIB0WbTAdxA9hsewKo/dOOdzch2aJQcSDyzoaaOULt
 Q+xQ==
X-Gm-Message-State: AOJu0YwYjlbwP5eemFwz3aSl4rQjY+dZ2ohlMnGps5LnOxoaeOmN0qyM
 ZeYngB0N18zgYTYmCHUQEcHu8qH2gU+H0iOY20TVELLjhxkcdwTM6KVXd+Fqg2hQQdgh4b6DSGE
 =
X-Google-Smtp-Source: AGHT+IE1yBAytX7s+8a7meixhaFtUoyqwPxhbgcr9hbEZbxE8jG7k9L325QLamwMlhhrCcxjHK589A==
X-Received: by 2002:a0c:f14b:0:b0:6b2:a12f:7831 with SMTP id
 6a1803df08f44-6b2a12f7b23mr5246806d6.8.1718203155905; 
 Wed, 12 Jun 2024 07:39:15 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b08857de8bsm22053286d6.2.2024.06.12.07.39.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 07:39:15 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-44056f72257so345011cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:39:14 -0700 (PDT)
X-Received: by 2002:a05:622a:998:b0:43f:bba6:3759 with SMTP id
 d75a77b69052e-44158bc6537mr4241291cf.10.1718203153602; Wed, 12 Jun 2024
 07:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <20240612-garnet-condor-from-saturn-1c51bb@houat>
In-Reply-To: <20240612-garnet-condor-from-saturn-1c51bb@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 07:39:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xpu0-_kEvRWy9w8ypjo7pF7tsFWxHfhMZ=YjHugTqG1w@mail.gmail.com>
Message-ID: <CAD=FV=Xpu0-_kEvRWy9w8ypjo7pF7tsFWxHfhMZ=YjHugTqG1w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 12, 2024 at 1:09=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Tue, Jun 11, 2024 at 07:48:51AM GMT, Douglas Anderson wrote:
> > At shutdown if you've got a _properly_ coded DRM modeset driver then
> > you'll get these two warnings at shutdown time:
> >
> >   Skipping disable of already disabled panel
> >   Skipping unprepare of already unprepared panel
> >
> > These warnings are ugly and sound concerning, but they're actually a
> > sign of a properly working system. That's not great.
> >
> > It's not easy to get rid of these warnings. Until we know that all DRM
> > modeset drivers used with panel-simple and panel-edp are properly
> > calling drm_atomic_helper_shutdown() or drm_helper_force_disable_all()
> > then the panel drivers _need_ to disable/unprepare themselves in order
> > to power off the panel cleanly. However, there are lots of DRM modeset
> > drivers used with panel-edp and panel-simple and it's hard to know
> > when we've got them all. Since the warning happens only on the drivers
> > that _are_ updated there's nothing to encourage broken DRM modeset
> > drivers to get fixed.
> >
> > In order to flip the warning to the proper place, we need to know
> > which modeset drivers are going to shutdown properly. Though ugly, do
> > this by creating a list of everyone that shuts down properly. This
> > allows us to generate a warning for the correct case and also lets us
> > get rid of the warning for drivers that are shutting down properly.
> >
> > Maintaining this list is ugly, but the idea is that it's only short
> > term. Once everyone is converted we can delete the list and call it
> > done. The list is ugly enough and adding to it is annoying enough that
> > people should push to make this happen.
> >
> > Implement this all in a shared "header" file included by the two panel
> > drivers that need it. This avoids us adding an new exports while still
> > allowing the panel drivers to be modules. The code waste should be
> > small and, as per above, the whole solution is temporary.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I came up with this idea to help us move forward since otherwise I
> > couldn't see how we were ever going to fix panel-simple and panel-edp
> > since they're used by so many DRM Modeset drivers. It's a bit ugly but
> > I don't hate it. What do others think?
>
> I don't think it's the right approach, even more so since we're so close
> now to having it in every driver.
>
> I ran the coccinelle script we started with, and here are the results:
>
> ./drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1640:25-39: ERROR: KMS driver vmw_p=
ci_driver is missing shutdown implementation
> ./drivers/gpu/drm/kmb/kmb_drv.c:621:30-49: ERROR: KMS driver kmb_platform=
_driver is missing shutdown implementation
> ./drivers/gpu/drm/tiny/arcpgu.c:422:30-52: ERROR: KMS driver arcpgu_platf=
orm_driver is missing shutdown implementation

Sure, although I think we agreed even back when we talked about this
last that your coccinelle script wasn't guaranteed to catch every
driver. ...so I guess the question is: are we willing to accept that
we'll stop disabling panels at shutdown for any drivers that might
were missed. For instance, looking at it by hand (which also could
miss things), I previously thought that we also might need:

* nouveau
* tegra
* amdgpu
* sprd
* gma500
* radeon

I sent patches for those drivers but they don't go through drm-misc
and some of the drivers had a lot of abstraction layers and were hard
to reason about. I'm also not 100% confident that all of those drivers
really are affected--they'd have to be used with panel-simple or
panel-edp...

In any case, having some sort of warning that would give us a
definitive answer would be nice. My proposed patch would give us that
warning. I could even jump to a WARN_ON right from the start.

My proposed patch is self-admittedly super ugly and is also designed
to be temporary, so I don't think of this as giving up right before
crossing the finish line but instead accepting a tiny bit of temporary
ugliness to make sure that we don't accidentally regress anyone. I
would really hope it would be obvious to anyone writing / reviewing
drivers that the function I introduced isn't intended for anyone but
panel-simple and panel-edp.

-Doug
