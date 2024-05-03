Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3306F8BB800
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 01:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7AE112A5D;
	Fri,  3 May 2024 23:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JDEu0mO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D020112A5D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 23:12:01 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6969388c36fso846736d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 16:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714777919; x=1715382719;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prxQbPa1s7Bfkbjtnci/PRV2YJ37FKzJezsvysnibwU=;
 b=JDEu0mO6kqI2zqD4maV7jgl9Tsmdudnxg3bPPU+3x/EZn/YQp58E6+XDKHpsNWeDv3
 qeO91szLHKdwwPeTDK+uSV2yA/YKd6+1UFnYEclCMBCtrleBkk9gi4ZxZIrSzkMZyUWF
 +o/45/b4ndMH0pKXIEBbsxsqPw50au/axi06E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714777919; x=1715382719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prxQbPa1s7Bfkbjtnci/PRV2YJ37FKzJezsvysnibwU=;
 b=c0uNeZv4adLYu7ZZ2tDNdGm3SpyNhYYVyLUX6M3juGo/jDcaDmBZR3MaQA2rsS5wF+
 N33TLGCEc71DEIVrf/N8JRx5co6LjGSGq2xSLKTR0S15Y8Un2Kx471LZXfrWl3+Z/2sR
 MhbFJTXhMBj5sypJrZy/aydxXaVSCTacQNH8COAbr9+bkWl0EU8oELzHeXKc1WnmnqYE
 lGwFeJblupFh6JEQCytfAQhHwFq+x79domhATSBN+0fGN9T8KO0bszs6BghYx2cPdGPG
 2i3d7bpuTpqyHW2M+33rvsGSzix/sZWViluHa8lgWdCXz8Gng4cTnEcWDUPgPH8xY5ir
 CE6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEOG/J8P8ksg7Jhh03xIDbkZC4+1FfEVGURSjmQL06GySDOtwnI28kJpC8zagbToKlwc8EHhksyWpIoJkPI1Kf+5mSLN2SsgfB8hd8mYyA
X-Gm-Message-State: AOJu0YxRy2BiqJwiyrSWlK/XDXbYu3dUTohRNpKppGnU3tKG/LvaHkTa
 mODLA1jH7LdCpUb9RooOIvgAHjC+5RYxJuFQIR3KJLIRQkFBVdU43im2mvPkFP5M0qKx55/GDpw
 y3w==
X-Google-Smtp-Source: AGHT+IHr/1T1UpZzZv+w1WUrfvDFSlmDOQoIqj5yW1WvPn+CZTi+Xrk/Blel6hS+0UCNxxxqongOXw==
X-Received: by 2002:a05:6214:410f:b0:6a0:424c:6eab with SMTP id
 kc15-20020a056214410f00b006a0424c6eabmr4593034qvb.47.1714777918732; 
 Fri, 03 May 2024 16:11:58 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 de17-20020ad45851000000b006a0f3c93325sm1590597qvb.84.2024.05.03.16.11.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 16:11:56 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-43989e6ca42so64621cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 16:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAWe7sakxTwrb9zrPc4j168ibkPxgmcirEzJSw4PbTG16QbufhQXY79QD0J/0yuoJgiIptT3jAR5oJ0idnp7DNKSZosA0ywq/7vh0xIW7X
X-Received: by 2002:ac8:7f03:0:b0:43b:af4:d3a with SMTP id
 d75a77b69052e-43d088fc74amr388471cf.19.1714777916272; 
 Fri, 03 May 2024 16:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
 <20231205121617.GF17394@pendragon.ideasonboard.com>
 <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
 <20231205134050.GG17394@pendragon.ideasonboard.com>
 <CAD=FV=WFykYh2PAw5G3uL-64LG45O3cPRiwN1HOfMAoeLK5KMg@mail.gmail.com>
In-Reply-To: <CAD=FV=WFykYh2PAw5G3uL-64LG45O3cPRiwN1HOfMAoeLK5KMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 May 2024 16:11:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VODa=t2WTgs8sE4HVnS77eoS3y4TjoOEyCD4OAKHg94w@mail.gmail.com>
Message-ID: <CAD=FV=VODa=t2WTgs8sE4HVnS77eoS3y4TjoOEyCD4OAKHg94w@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Tue, Dec 5, 2023 at 9:35=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Dec 5, 2023 at 5:40=E2=80=AFAM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Tue, Dec 05, 2023 at 02:31:24PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, Dec 5, 2023 at 1:16=E2=80=AFPM Laurent Pinchart wrote:
> > > > On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> > > > > From: Douglas Anderson <dianders@chromium.org>
> > > > >
> > > > > Based on grepping through the source code, this driver appears to=
 be
> > > > > missing a call to drm_atomic_helper_shutdown() at system shutdown=
 time.
> > > > > This is important because drm_helper_force_disable_all() will cau=
se
> > > > > panels to get disabled cleanly which may be important for their p=
ower
> > > > > sequencing.  Future changes will remove any custom powering off i=
n
> > > > > individual panel drivers so the DRM drivers need to start getting=
 this
> > > > > right.
> > > > >
> > > > > The fact that we should call drm_atomic_helper_shutdown() in the =
case of
> > > > > OS shutdown comes straight out of the kernel doc "driver instance
> > > > > overview" in drm_drv.c.
> > > > >
> > > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c=
8b3c307a6192efabb4cbb06b195f15@changeid
> > > > > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown=
/]
> > > > > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdo=
wn]
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > Thanks!
> > >
> > > > > Panel-simple does print two new warnings:
> > > > >
> > > > >     +panel-simple panel: Skipping disable of already disabled pan=
el
> > > > >     +panel-simple panel: Skipping unprepare of already unprepared=
 panel
> > > >
> > > > Have you investigated where this comes from ?
> > >
> > > Meh, I knew I forgot something ;-)
> > >
> > > The panel is unprepared and disabled a first time from shmob_drm's
> > > .shutdown() callback:
> > >
> > >   shmob_drm_shutdown
> > >     drm_atomic_helper_shutdown
> > >       drm_atomic_helper_disable_all
> > >         drm_atomic_commit
> > >           drm_atomic_helper_commit
> > >             commit_tail
> > >               drm_atomic_helper_commit_tail
> > >                 drm_atomic_helper_commit_modeset_disables
> > >                   disable_outputs
> > >                     drm_atomic_bridge_chain_disable
> > >                         drm_panel_disable
> > >                     drm_atomic_bridge_chain_post_disable
> > >                         drm_panel_unprepare
> > >
> > > And a second time from simple_panel's .shutdown() callback():
> > >
> > >   panel_simple_platform_shutdown
> > >     panel_simple_shutdown
> > >       drm_panel_disable
> > >       drm_panel_unprepare
> >
> > That looks like what Doug mentioned should be removed in the commit
> > message of this patch (a confirmation would be nice). It should be fine
> > for now.
>
> Yup, this is completely expected right now and is actually a _good_
> sign that your patch is doing what it should be. We unfortunately
> can't remove the panel_simple_shutdown() until all DRM modeset drivers
> (or at least all the ones that could be used w/ panel_simple) are
> properly calling drm_helper_force_disable_all(), though.

FWIW, I've sent out a new version of the series that removes most
panel-specific enable/prepare tracking and also adjusts the TODO to
make it clear that these warnings are expected for panel-simple and
panel-edp [1]. For all other panels my series removes the extra
drm_panel_disable() and drm_panel_unprepare().

I noticed that ${SUBJECT} patch hasn't landed yet, but from grepping I
couldn't find it used with any panels that I was touching... In any
case, it seems like it would be nice if it could land...

I'm not sure the best way to deal with panel-simple / panel-edp. I'm a
little scared to just remove the disable/unprepare since they are used
across so many different DRM modeset drivers, but the annoying thing
is that the warning shows up only on DRM modeset drivers that have
been fixed and _not_ on ones that weren't fixed. :( To get a warning
at the right times we'd need something that runs _after_ driver
shutdown to check whether the DRM modeset driver forgot to call
drm_atomic_helper_shutdown()...

[1] https://lore.kernel.org/r/20240503213441.177109-1-dianders@chromium.org
