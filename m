Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E95730982
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 22:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFFE10E462;
	Wed, 14 Jun 2023 20:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2510510E462
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 20:59:09 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-bcb6dbc477eso1082686276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686776348; x=1689368348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JP+wDPly97ywsMRrVLmraQQeBjQEOheXPRjV7dTEQOw=;
 b=uvMiIkzg8Ec6M5XTOQAqMp1t0tQHji6hGKiVE6a250KIJ1Y0/m6ZHRFz9nhouWQBZM
 rGzOxVMPxZ3eQVPn912iUeMFSzQBtemDJARdUSJphTaWbbeerw7JzzTJp3DbcbB1GYxD
 N2QyYdI7uPKSpHJZ+SRWP/T04owpsoVFGcW9mKEkc97FFt3nsI97PS/nZ+GDdEoIMId8
 C/85OAxQqFfA5YppW3NjCd+7Vwb4xQr4CZdSb7kdkLYQT/ozQaTozPiNUC3ZLUwga8UO
 +PNOlkofnVfNXA8RECgaiXK01KefgbRCvfBwpopgiLbTvwfZduI3se/veMQD64p+sWuR
 +W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686776348; x=1689368348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JP+wDPly97ywsMRrVLmraQQeBjQEOheXPRjV7dTEQOw=;
 b=LhaXU3x95MJkf99T1lZPtdhz0MZe3+3dX6RFgFEsRPOgDRsx1vBq82T0S01OPrP7HH
 OxblKHhHmru5B/4J5ANxB65CAA9jy8TUdfPKtge88lyBdtwVlXYG+Pci/MQs2o3Crk4o
 qG3ad5sPMqdCOvpqZiCdv8tBqA/kaRRzyUxSYV3AG2C5GzAONtLkN2gPis78owzphUBA
 emkLtwh2b61MQMA6FRHu+vV9V7J1HmaoRR6CXivni5CekUHdIBkKIaTcp7tkBqCuoNQS
 2aayLqtGs2kCX76cjBd/QJvrVmxfddB7+J1vhNkySiMEF29j6gvZjx33ogfhjBGLWDOw
 bd2w==
X-Gm-Message-State: AC+VfDx20kygsQx9ZZDnVMv0olY7sCJ1OVfnY0qbaz7lCsLhcmQwcoSJ
 hKtFe+qu2zwUx1iTyeKfc3pBMVz1iOXEl8QXrUG1AQ==
X-Google-Smtp-Source: ACHHUZ6ldhrUzytb6pZK4Kqea7NKorIx47j+Tni32nNp0wQtVDjui5ZFE0ILZOdM0tTThjU0QHOz5VvxOXL1XdvwMwI=
X-Received: by 2002:a25:d748:0:b0:bba:9296:891f with SMTP id
 o69-20020a25d748000000b00bba9296891fmr2980889ybg.9.1686776347845; Wed, 14 Jun
 2023 13:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
 <ZIjayn8nVy-ejThH@gerhold.net>
In-Reply-To: <ZIjayn8nVy-ejThH@gerhold.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Jun 2023 22:58:56 +0200
Message-ID: <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
To: Stephan Gerhold <stephan@gerhold.net>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Thierry Reding <treding@nvidia.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, linux-arm-msm@vger.kernel.org,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 11:08=E2=80=AFPM Stephan Gerhold <stephan@gerhold.n=
et> wrote:

> I'm still quite confused about what exactly is supposed to be in
> (un)prepare and what in enable/disable. I've seen some related
> discussion every now and then but it's still quite inconsistent across
> different panel drivers... Can someone clarify this?

It is somewhat clarified in commit 45527d435c5e39b6eec4aa0065a562e7cf05d503
that added the callbacks:

Author: Ajay Kumar <ajaykumar.rs@samsung.com>
Date:   Fri Jul 18 02:13:48 2014 +0530

    drm/panel: add .prepare() and .unprepare() functions

    Panels often require an initialization sequence that consists of three
    steps: a) powering up the panel, b) starting transmission of video data
    and c) enabling the panel (e.g. turn on backlight). This is usually
    necessary to avoid visual glitches at the beginning of video data
    transmission.

    Similarly, the shutdown sequence is typically done in three steps as
    well: a) disable the panel (e.g. turn off backlight), b) cease video
    data transmission and c) power down the panel.

    Currently drivers can only implement .enable() and .disable() functions=
,
    which is not enough to implement the above sequences. This commit adds =
a
    second pair of functions, .prepare() and .unprepare() to allow more
    fine-grained control over when the above steps are performed.

    Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
    [treding: rewrite changelog, add kerneldoc]
    Signed-off-by: Thierry Reding <treding@nvidia.com>

My interpretation is that .enable/.disable is for enabling/disabling
backlight and well, make things show up on the display, and that
happens quickly.

prepare/unprepare is for everything else setting up/tearing down
the data transmission pipeline.

In the clock subsystem the enable/disable could be called in fastpath
and prepare/unprepare only from slowpath so e.g an IRQ handler
can gate a simple gated clock. This semantic seems to have nothing
to do with the display semantic. :/

Yours,
Linus Walleij
