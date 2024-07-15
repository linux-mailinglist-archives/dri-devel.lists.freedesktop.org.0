Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29F9318B5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 18:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4642F10E1B2;
	Mon, 15 Jul 2024 16:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CQJkhrcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56ED10E1B2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 16:46:22 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fb222a8eaeso31411095ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721061982; x=1721666782;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q43fP/YwIscAu2HdaErO2TBIovUlIaQMWdgLOPVgO94=;
 b=CQJkhrcmCtmgqQ1mpfTfJrdrw5GZBQQWooKxfO63glDvvMVU4iELNTIzfx2QRK3Qao
 4CVzMWfPw1VzcmguO3ceGV0pBcbqcK8d9jf3ycBiL3g7e1MJjrw7wS6ZZY61DTWrs5ts
 1w/hSC6TTMj2RjZ1Vl/T4rrxfBEAC3qqFYHgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721061982; x=1721666782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q43fP/YwIscAu2HdaErO2TBIovUlIaQMWdgLOPVgO94=;
 b=qRXCLpPshRAc+A16jicg9UqzE9A3iQQNhJtChHiK/FfxEffSCPK3cRjEyQst/fsO78
 o3jLOfRQGaLlv6m6cmlsIAxxJ/f4VYQGsfR+kyqZz53sxXxs6KpE20IDMcykLvkVQyr0
 JMtlVuSDmsqpge3gVXyf/S7jX6gF4ZRan9j3OlvLAyvfZOCCzfwR+A9xlSyAfcKOHFcn
 oJOYiJ6CzleBwNN/Oq8sGKA+Nx9h6MImqZ/bIodmBiGHGPmtpRvKugwZTADU44ne76jM
 mJcLBDQaeGsw9We7HX0noGa88q62a8CYzvj8mR3D/h2EgC0dcUe49MRPnt/kR+hhDj3h
 Qr0g==
X-Gm-Message-State: AOJu0Ywnpt7cN3DFuxCygZfKjizjOXAY2OARS7z4SWkbeHuHKtWQcZ4T
 jjzbwf5J1w8X9XLOa8uOgeyPRSE9Z0hsv3JTmga9Jl1j1BpoydsVPannjk6j3UuHxkNq8xoUHrE
 =
X-Google-Smtp-Source: AGHT+IEQx6R+m206RLgB+FnJU98TJsKFUdNgx1ITSh2AGOFgfvPBqbgqVIOckwl6CX4LnSpuR+8y9Q==
X-Received: by 2002:a17:902:db03:b0:1fa:8f64:8b0d with SMTP id
 d9443c01a7336-1fbb6cdab5bmr202603185ad.4.1721061981746; 
 Mon, 15 Jul 2024 09:46:21 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com.
 [209.85.214.179]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc2726fsm43301445ad.169.2024.07.15.09.46.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 09:46:21 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1fb67f59805so2795ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:46:21 -0700 (PDT)
X-Received: by 2002:ac8:6908:0:b0:447:e497:95d0 with SMTP id
 d75a77b69052e-44f5ac90b7dmr6164531cf.17.1721061621306; Mon, 15 Jul 2024
 09:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
In-Reply-To: <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 09:40:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdsuEiyPK2K3sYdQm50WNukA5pxD=wUaEAVQStNnNA_A@mail.gmail.com>
Message-ID: <CAD=FV=UdsuEiyPK2K3sYdQm50WNukA5pxD=wUaEAVQStNnNA_A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Jun 21, 2024 at 1:46=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Jun 21, 2024 at 1:45=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > At shutdown if you've got a _properly_ coded DRM modeset driver then
> > you'll get these two warnings at shutdown time:
> >
> >   Skipping disable of already disabled panel
> >   Skipping unprepare of already unprepared panel
> >
> > These warnings are ugly and sound concerning, but they're actually a
> > sign of a properly working system. That's not great.
> >
> > We're not ready to get rid of the calls to drm_panel_disable() and
> > drm_panel_unprepare() because we're not 100% convinced that all DRM
> > modeset drivers are properly calling drm_atomic_helper_shutdown() or
> > drm_helper_force_disable_all() at the right times. However, having the
> > warning show up for correctly working systems is bad.
> >
> > As a bit of a workaround, add some "if" tests to try to avoid the
> > warning on correctly working systems. Also add some comments and
> > update the TODO items in the hopes that future developers won't be too
> > confused by what's going on here.
> >
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This patch came out of discussion on dri-devel on 2024-06-21
> > [1]. NOTE: I have put all changes into one patch since it didn't seem
> > to add anything to break up the updating of the TODO or the comments
> > in the core into separate patches since the patch is all about one
> > topic and all code is expected to land in the same tree.
> >
> > Previous versions:
> > v0: https://lore.kernel.org/r/20240604172305.v3.24.Ieb287c2c3ee3f6d3b0d=
5f49b29f746b93621749c@changeid/
> > v1: https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49=
b29f746b93621749c@changeid
> >
> > [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=3Ddri-devel=
&date=3D2024-06-21
> >
> >  Documentation/gpu/todo.rst           | 35 +++++++++++++---------------
> >  drivers/gpu/drm/drm_panel.c          | 18 ++++++++++++++
> >  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++-------
> >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++-------
> >  4 files changed, 68 insertions(+), 37 deletions(-)
>
> Ugh! I realized right after I hit "send" that I forgot to mark this as
> V2 and give it version history. Sorry! :( Please consider this to be
> v2. It's basically totally different than v1 based on today's IRC
> discussion, which should be linked above.
>
> If I need to send a new version I will send it as v3.

Is anyone willing to give me a Reviewed-by and/or Acked by for this
patch? ...or does anything want me to make any changes? Given all the
discussion we had, it would be nice to get this landed before we
forget what we agreed upon. :-P

-Doug
