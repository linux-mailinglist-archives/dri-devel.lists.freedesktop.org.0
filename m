Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86A805B35
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 18:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D1D10E036;
	Tue,  5 Dec 2023 17:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A32010E036
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 17:35:33 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a195e0145acso696199266b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701797731; x=1702402531;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ndluAKrKzxsWUgZyPsRUnjGXiLqileF9IHLPH69o7cE=;
 b=VPEAmauaMPG8PM6aYZ1CwVR/5s4ORlMBn4AESWovNRRXIpmZbHQ+q/XUEZOOLswSxv
 Ert8kDmnc/+WtVpLMtxqRNHPuaIjKqw/tGLXzIWx5JFkYQjAr4RJiaGn6XikMSmDnGF+
 zCOiJtoVZldOI7sd03fRb+K5rL04x3SKPoQkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701797731; x=1702402531;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ndluAKrKzxsWUgZyPsRUnjGXiLqileF9IHLPH69o7cE=;
 b=rt+v1dfoVClXDCKsWZ2bdlUSD/olC6lKRhapBeUhZfPqbQ8CBAoY6QAbHNx3K0vazj
 dkYDbRhUJPTRW9pXhiB/jsl2SuLkfMgg5xBN4Zhs2CWAOveWXkgwRWKU7YO33g+ckTi6
 uVtWIWA9pZcqtqSXdW+YT4aK/BEgyiKULfayo7oxQZwZdnIxy1hBCCrLnqRLMdxuZwQm
 AeyJ2ujzzVInEoqDZK7s157ABrbN0r9OUTGFhP855sBZMRucNYUg64PS3NtUBh5ZbnVW
 +ytSohmRoqNomPHEATCYlw8J93joTjy1cy8U40W9PXqQgUBJ5t1rCJrpIGd1FsVp9s7/
 hXSg==
X-Gm-Message-State: AOJu0YzrAxxj73jv8hQ8A1wR55Ml0Hho/Uq76fDlmBvxqeAZIFf7xwzX
 Ni4c96G7AHX+QM6VFwFuoa8L6rLfzrXZP3mAyMoz3fDQ
X-Google-Smtp-Source: AGHT+IHZTHGZ//PmOX+CzAsTGur7H70gcgRAd07V++Z7y9aAnhaTtxOT2ALYjPazrQZ6bmgT0qSc1g==
X-Received: by 2002:a17:906:51c5:b0:a19:a19b:4218 with SMTP id
 v5-20020a17090651c500b00a19a19b4218mr570377ejk.131.1701797729913; 
 Tue, 05 Dec 2023 09:35:29 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 uk33-20020a170907ca2100b00a1a8d03347csm1037020ejc.13.2023.12.05.09.35.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 09:35:29 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40b51e26a7aso75225e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 09:35:29 -0800 (PST)
X-Received: by 2002:a05:600c:511a:b0:40b:2ec6:2a87 with SMTP id
 o26-20020a05600c511a00b0040b2ec62a87mr561610wms.5.1701797729119; Tue, 05 Dec
 2023 09:35:29 -0800 (PST)
MIME-Version: 1.0
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
 <20231205121617.GF17394@pendragon.ideasonboard.com>
 <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
 <20231205134050.GG17394@pendragon.ideasonboard.com>
In-Reply-To: <20231205134050.GG17394@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 09:35:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WFykYh2PAw5G3uL-64LG45O3cPRiwN1HOfMAoeLK5KMg@mail.gmail.com>
Message-ID: <CAD=FV=WFykYh2PAw5G3uL-64LG45O3cPRiwN1HOfMAoeLK5KMg@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 5, 2023 at 5:40=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Dec 05, 2023 at 02:31:24PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Dec 5, 2023 at 1:16=E2=80=AFPM Laurent Pinchart wrote:
> > > On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> > > > From: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > Based on grepping through the source code, this driver appears to b=
e
> > > > missing a call to drm_atomic_helper_shutdown() at system shutdown t=
ime.
> > > > This is important because drm_helper_force_disable_all() will cause
> > > > panels to get disabled cleanly which may be important for their pow=
er
> > > > sequencing.  Future changes will remove any custom powering off in
> > > > individual panel drivers so the DRM drivers need to start getting t=
his
> > > > right.
> > > >
> > > > The fact that we should call drm_atomic_helper_shutdown() in the ca=
se of
> > > > OS shutdown comes straight out of the kernel doc "driver instance
> > > > overview" in drm_drv.c.
> > > >
> > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b=
3c307a6192efabb4cbb06b195f15@changeid
> > > > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> > > > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown=
]
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Thanks!
> >
> > > > Panel-simple does print two new warnings:
> > > >
> > > >     +panel-simple panel: Skipping disable of already disabled panel
> > > >     +panel-simple panel: Skipping unprepare of already unprepared p=
anel
> > >
> > > Have you investigated where this comes from ?
> >
> > Meh, I knew I forgot something ;-)
> >
> > The panel is unprepared and disabled a first time from shmob_drm's
> > .shutdown() callback:
> >
> >   shmob_drm_shutdown
> >     drm_atomic_helper_shutdown
> >       drm_atomic_helper_disable_all
> >         drm_atomic_commit
> >           drm_atomic_helper_commit
> >             commit_tail
> >               drm_atomic_helper_commit_tail
> >                 drm_atomic_helper_commit_modeset_disables
> >                   disable_outputs
> >                     drm_atomic_bridge_chain_disable
> >                         drm_panel_disable
> >                     drm_atomic_bridge_chain_post_disable
> >                         drm_panel_unprepare
> >
> > And a second time from simple_panel's .shutdown() callback():
> >
> >   panel_simple_platform_shutdown
> >     panel_simple_shutdown
> >       drm_panel_disable
> >       drm_panel_unprepare
>
> That looks like what Doug mentioned should be removed in the commit
> message of this patch (a confirmation would be nice). It should be fine
> for now.

Yup, this is completely expected right now and is actually a _good_
sign that your patch is doing what it should be. We unfortunately
can't remove the panel_simple_shutdown() until all DRM modeset drivers
(or at least all the ones that could be used w/ panel_simple) are
properly calling drm_helper_force_disable_all(), though.

-Doug
