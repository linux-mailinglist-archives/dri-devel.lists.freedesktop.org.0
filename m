Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21299057FC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 18:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2469710E8BD;
	Wed, 12 Jun 2024 16:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QS5Dn00T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F0A10E8A9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 16:03:29 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-797e2834c4eso1888485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718208207; x=1718813007;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohVgUKw8pNuG0pdNC0IycgIg/FLKQkS/xkAb0Ciu+dY=;
 b=QS5Dn00TJHhaNeOcZd0H5bLkI6K8HKHt5ExO7aanJmn4I8AaYorrp9EKc5+URbh2Vr
 hqR++miGA63zlcNdrIS7Gqe5fnBLUCBi8mQlyMz292V5mM7tFWdeKGlSxS7mb7uELd9x
 fHtF1YVwDaO8KG6u5mK2mFUsW48e0L5BReHS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718208207; x=1718813007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohVgUKw8pNuG0pdNC0IycgIg/FLKQkS/xkAb0Ciu+dY=;
 b=eEkYGjXgLMc6Mq9KMabUZuwAl8BZlXzDOyxPRJfY7jfLX9EmydCHmmj8OgqXD95tXO
 9/Wtr0n5VDlNNN2sGWS8figFkaAEg2wrg6tL0naWUJQZ7sLPpSzous4Scj/JygKHpFfJ
 K+6JRumoYfUkniMALED2Wqn3052Vow4TRZbuV+x2yeXcWOOdxV3VilfVEIDJiKNGLo1c
 sqgHbg6ZpYhJORwCAyUKqeWLMcz+ge5UsbXEOj0fkpoSEc3liXZiqKT7biQoVImzbyqa
 mH3anXJZfsY2OJtniZUUv17z3x+xLBFwvUdm6I6fTYDKcvVw7NxDptjEelpMYotlQhbK
 aQvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7DSTz6Vgm5vOoY7+aF8ws9bsJtEc1+sELoHeO/EWQe7LwVlMSjg7c87bM8XR5VlJN2Anw5/9RSm1eNIBq77uAnx0u/adQkNA7NiR5+2Dj
X-Gm-Message-State: AOJu0Ywb/tEBQvCWL+0xHCnKiKX/AXRZg5fxnQggmiKA403fSmw+Xaw1
 hQdc47j7oG5jOcTtOysXGLexL41QRmroSUOeKHYLEdwcVG3noleQoQPEMeWwFBrmGC6NrARpSwc
 =
X-Google-Smtp-Source: AGHT+IFvNzoy711ifVFvsnkZKSxBy9srgtiUa8bAL3jNNnZTUbmITeTqk+FFq3hTdaBOQNNH1ZSA2A==
X-Received: by 2002:a05:620a:3903:b0:796:5fd7:5219 with SMTP id
 af79cd13be357-798101077c2mr9395585a.20.1718208206846; 
 Wed, 12 Jun 2024 09:03:26 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44085391d1esm30959611cf.16.2024.06.12.09.03.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 09:03:26 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4400cc0dad1so521681cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUth3HNeM71mfKUdtWJTmWQ5G9kQVbrCqLLkv9c5czY4ntorUK8w1H0imFUsawyxxTLyX3Bh1ey/eAFNB4vBgk6+eqkqTTl7UiEbH3Ij0SF
X-Received: by 2002:a05:622a:8c3:b0:441:6135:ba89 with SMTP id
 d75a77b69052e-44161360e39mr1211681cf.3.1718208205353; Wed, 12 Jun 2024
 09:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <20240612-garnet-condor-from-saturn-1c51bb@houat>
 <CAD=FV=Xpu0-_kEvRWy9w8ypjo7pF7tsFWxHfhMZ=YjHugTqG1w@mail.gmail.com>
 <Zmm6_27GikpmT3HQ@phenom.ffwll.local>
In-Reply-To: <Zmm6_27GikpmT3HQ@phenom.ffwll.local>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 09:03:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSXX_FgBcF0XHMUkLpfEzPcgThLEttcB9RzVXzyqKnNw@mail.gmail.com>
Message-ID: <CAD=FV=WSXX_FgBcF0XHMUkLpfEzPcgThLEttcB9RzVXzyqKnNw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>
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

On Wed, Jun 12, 2024 at 8:13=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> > > I ran the coccinelle script we started with, and here are the results=
:
> > >
> > > ./drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1640:25-39: ERROR: KMS driver v=
mw_pci_driver is missing shutdown implementation
> > > ./drivers/gpu/drm/kmb/kmb_drv.c:621:30-49: ERROR: KMS driver kmb_plat=
form_driver is missing shutdown implementation
> > > ./drivers/gpu/drm/tiny/arcpgu.c:422:30-52: ERROR: KMS driver arcpgu_p=
latform_driver is missing shutdown implementation
> >
> > Sure, although I think we agreed even back when we talked about this
> > last that your coccinelle script wasn't guaranteed to catch every
> > driver. ...so I guess the question is: are we willing to accept that
> > we'll stop disabling panels at shutdown for any drivers that might
> > were missed. For instance, looking at it by hand (which also could
> > miss things), I previously thought that we also might need:
> >
> > * nouveau
> > * tegra
> > * amdgpu
> > * sprd
> > * gma500
> > * radeon
> >
> > I sent patches for those drivers but they don't go through drm-misc
> > and some of the drivers had a lot of abstraction layers and were hard
> > to reason about. I'm also not 100% confident that all of those drivers
> > really are affected--they'd have to be used with panel-simple or
> > panel-edp...
>
> Aside from amdgpu and radeon they're all in -misc now, and Alex is
> generally fairly responsive.

Ah, nice! They weren't when I sent the patches ages ago. I guess I
should go ahead and repost things and maybe they'll get some traction.


> > In any case, having some sort of warning that would give us a
> > definitive answer would be nice. My proposed patch would give us that
> > warning. I could even jump to a WARN_ON right from the start.
>
> Yeah we defo want some warning to at least check this at runtime.

Yeah, my patch today currently just has a "dev_warn", but the question
is whether it would get more attention with a full on WARN_ON(). I
know WARN_ON() can be pretty controversial.

-Doug
