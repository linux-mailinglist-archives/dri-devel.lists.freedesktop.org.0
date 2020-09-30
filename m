Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A583427E232
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A311F6E558;
	Wed, 30 Sep 2020 07:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307BC6E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 07:10:08 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id dd13so1258078ejb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJxJUO1q02OR1Jz51Gat1lvUD5xjyc0x8sYFXeu1B7Q=;
 b=cDRAMcDths1ItIePTpT0NggINDycRKh0Es5ljvt+gbD3NNEC2wu6MEykhpnkDbBmm8
 yofftEp2LOo5vZaCGgYlS0zRF/MDMIL5tg9nc7Ca81eJuB/aErOS1+2QHJwi5y8eyI0x
 a/GpbwUoZH9+bg4Y1aDHk1BgKnFN6Q49OuAEhI9uRrTM48jJeZCk/s16knamUszGGDDD
 qT6EV4k6dbTjDoMjtX3tYkEg9GaqvVtvVAtAhoVjc/xXmJPYddIF8DBgP1Rs8jIr4uL7
 tPWFIGPdUS8N94FPcGvSNG7o9uqjb0wv+g0HkA9VcHCv2bo3yZUfUG94Z4EmTCk8riL4
 QdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJxJUO1q02OR1Jz51Gat1lvUD5xjyc0x8sYFXeu1B7Q=;
 b=X0bTMa7tmIKhKc71YiaS7zO0pVLiVg7pS18MhpR0d2/kmVjwZJYCakxeMIdsAP0E+M
 9E/rVk26Ctge6/YoxPPacBnApiKwr4jaMoJwbBZybQhFz5N+7AcZ5zeesxjtN1MU2O/L
 oIYynRTX6g7sGxmEAQgKJgeMJJUnjlP2J/fxvZJDTulvSRr9j69RUieZxA0T4EWPKzDe
 hW0WEapzVxBPSJagUsMciA2hSWjg8eYuGP0x32zYyquXbor6zUlUg80X/lI/JT+kDVEk
 drZojj264slrzuIPmPvgSscf3svV+XwZl07uQVSIwUh9NHtD7VXYf2xTacL4W63AZs7j
 mtsw==
X-Gm-Message-State: AOAM5329IRTuREoWvHG7xWfWk7jTsidiKcKBWePHT4KM4hvwV9ELYKom
 kP6vwXPSeXQA8r377RaRisJDDMgdNISoulARyJsxWnZr
X-Google-Smtp-Source: ABdhPJyeCWBAhDPnw5Sd4P37dWIsIT9O07hBnWXeHWlLzhhnMqPZ5jrAyBhWIQ3Xt8unTidlyXuSBNMAkZEgzDH+eCQ=
X-Received: by 2002:a17:906:3aca:: with SMTP id
 z10mr1370645ejd.419.1601449805605; 
 Wed, 30 Sep 2020 00:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200930055459.31310-1-airlied@gmail.com>
 <CAPM=9txdYB4WPaXZGZ1XO-s_9BHjv===-QGvW+-N405T1_RsDQ@mail.gmail.com>
In-Reply-To: <CAPM=9txdYB4WPaXZGZ1XO-s_9BHjv===-QGvW+-N405T1_RsDQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Sep 2020 17:09:54 +1000
Message-ID: <CAPM=9tzdT8suD5PZJGrWMM-kOSYYcvA3ZP2y=muZoQ6gNyJkRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix regression in ttm moves
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Roland Scheidegger <sroland@vmware.com>
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
Cc: Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

just FYI I'm seeing a regression on vmwgfx with drm-fixes and drm-next
merged into it.

I'm going take some time to dig through and work out where, the
regression is a command failure and a ioremap failure.

Dave.

On Wed, 30 Sep 2020 at 16:26, Dave Airlie <airlied@gmail.com> wrote:
>
> Uggh this is part of the mess with the revert, I'm not sure how best
> to dig out of this one yet.
>
> Dave.
>
> On Wed, 30 Sep 2020 at 15:55, Dave Airlie <airlied@gmail.com> wrote:
> >
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This fixes a bug introduced in be1213a341a289afc51f89181c310e368fba0b66
> > drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED v2
> >
> > On vmwgfx this causes a Command buffer error WARN to trigger.
> >
> > This is because the old code used to check if bo->ttm was true,
> > and the new code doesn't, fix it code to add back the check resolves
> > the issue.
> >
> > Fixes: be1213a341a2 ("drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED v2")
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 70b3bee27850..e8aa2fe8e9d1 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -251,9 +251,11 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
> >                 /* Zero init the new TTM structure if the old location should
> >                  * have used one as well.
> >                  */
> > -               ret = ttm_tt_create(bo, old_man->use_tt);
> > -               if (ret)
> > -                       goto out_err;
> > +               if (!bo->ttm) {
> > +                       ret = ttm_tt_create(bo, old_man->use_tt);
> > +                       if (ret)
> > +                               goto out_err;
> > +               }
> >
> >                 ret = ttm_tt_set_placement_caching(bo->ttm, mem->placement);
> >                 if (ret)
> > --
> > 2.20.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
