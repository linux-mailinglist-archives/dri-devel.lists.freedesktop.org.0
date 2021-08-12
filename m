Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8273EA91F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 19:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF2A6E42E;
	Thu, 12 Aug 2021 17:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5C76E42E;
 Thu, 12 Aug 2021 17:07:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 6so5025752wme.5;
 Thu, 12 Aug 2021 10:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HFRt0wziwCpQcCnxa537F+IhhJf27Jkl+Fr+dlW4BP0=;
 b=YsAymJhgfctdXRrVg5tCsE+2YeenjK9nfl4ERVAjKtDmFCPeCKagM97Ff4NpvIUByR
 61XBCorWB5JK9Rl0XgUcQavCgtbf5fFnNoYQP0diFgFVtYbQYjp3GDmqXR4fut+2taF9
 NJrA6Sa/owdJ6iIuPHloHY1WBSVi34aa7Ia/djsgw8Yi2x9SEG/r9sXrfqbPpJzub0eu
 3WysqIm1j2HeaZ4S9VeuI0mTWJLcoDiv1+nrvZ/OadgYHUaj4/zjaUCAhGZlsYsoYzz7
 +QYINKKPBFa2qcjMcYEhlIS65FDrJ7eCkRGZt8Po5onm9MsFOWC6K1TLsXL5kQXO45Iv
 E0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HFRt0wziwCpQcCnxa537F+IhhJf27Jkl+Fr+dlW4BP0=;
 b=K8ZaRqAEx9KEbEC9UnArMWP4qBgraXRIhVWIDioYOMhwCYZgXyUAf88ERj7/KIUygS
 Ql3geS8Eth8+mEQNT93gZo4Of4WCoWBql6kRwIjtmuBEt0j1teqcxmqcvfwY1jkEmxkg
 LdLIWlzeM3Fb9JEqt/yJL766/lMKSRA02ofc5g6I2lpDiXq5CuAnm8uxtV1EmEBVBdPm
 O+nM/JQi3TgC71MhvWjLKvJ+5p6TYdHxwBIKXc4o2Ik8RIvm/eUiSFZgagwj4f7Vryf5
 r0t0OmJa7sQFiQUz+IZfrQUOZnA5XwuC1L1T5iXM+E1ya7qDvnyqIMq3GHOXphmflpGi
 nSJQ==
X-Gm-Message-State: AOAM530xRrytYm2l9+wps8TxmCTYRYHfrvvOl2Vi70Z5IZSqU7lRNcxR
 A+QcwddqhBFZdbgOBc0MpY6fQOBvfXQjDqZ+ltM=
X-Google-Smtp-Source: ABdhPJyyvzqMX+VE9EN3SxNGu4zLM6L6KBs2315nlwOIz/s+gUJnha7d6qfPVv7ZNVJFR06ap6Ku+MhKhxa66YJOyO0=
X-Received: by 2002:a05:600c:c5:: with SMTP id u5mr2296366wmm.49.1628788064120; 
 Thu, 12 Aug 2021 10:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-2-robdclark@gmail.com>
 <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
In-Reply-To: <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Aug 2021 10:11:59 -0700
Message-ID: <CAF6AEGsiOC0rweuuRF5yC+ssPzF6Sz5Y=tgYHbgTx+km3eCu=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple
 connectors
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Aug 12, 2021 at 9:55 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If we created our own connector because the driver does not support the
> > NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
> > a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
> > supported that mode) this would change nothing.
> >
> > Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
> I'm going to apply this one to drm-misc/drm-misc-next and push since
> it's a fix and we're before -rc6, then I'll take a look at the later
> patches in the series.
>

Thanks.. this is the only one with some urgency, the rest can wait
until next cycle.  (And the bridge vs msm patches can land
independently, I've tested the different possible combinations)

BR,
-R
