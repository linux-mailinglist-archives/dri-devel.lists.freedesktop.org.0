Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE35518647
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 16:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519D10F224;
	Tue,  3 May 2022 14:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8BB10F166;
 Tue,  3 May 2022 14:14:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w4so23523885wrg.12;
 Tue, 03 May 2022 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OpVFLxl9pFOrEMMRYurod/ib5CbjrjCpO741fI+XBvY=;
 b=ORZ5qamh0mtHiKUsp6Fsrqgs6cYzaoQsveccu4xwYWKnkIx69MGl6kFqs/vJuMNA7f
 8F4kJHrlhCJ1BJHsmYT7q2d7ksTHVG0AElPCf9HOMpGKvj/x3FKDmq/8B6CjOYMNY6bR
 XjWo6uFJ3DLx5WRMfep4udC5lmGEB5aUJV1EIlrMx+BgFL3vFronlN3nn83fTJAjjoTz
 F0/WrfJEQwyEtfLgctGJnLXu5730T+IbV7kbAsy3cMUr4UMsZr84KgRnIGFKBmptwW4P
 lbQPnRg42BwPDILk0vcq0WY+nKGLo5NP0hpZPLNrXlT0maXHoEdzYzCk1DqXxrtsbfAa
 hdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpVFLxl9pFOrEMMRYurod/ib5CbjrjCpO741fI+XBvY=;
 b=GfAUwXmHoMfap2OymMzg42jZaE4Lf09zA34YjwYV3mMfUgGvGUk5TNTgMbXYCtt8KJ
 AatdeX3wRYgQqKMQLKpJYaXDcL0Dx1Lcn2icYBUK8iEaWZgun84V7dNPnwFt2V+skfXv
 uisAczFYeeav9CtuZXRNgT4mr0h65Ec+JSz3ri8kz0lAkH3PLjQor3gcE1kwjZykKCwv
 MT4E1YwBviUOswZxG7bdOPTjPijDtkMUSIBFlmhWi7rIStkK1uojFtXqfqviFZWeW1pL
 +JTSYLzLO5I+cVUG9k/bYDyBszzitZwz/1jfLHZf5f04Txa4SeK7WOvi8UymqtFgrbfx
 Af+g==
X-Gm-Message-State: AOAM530dZIz1gvf0UOAvjeX1hI6jQjNpKhuvywYpbXEPMW1KZLGa/mT3
 Lef0aLjtpExxNahYGfbzcdeQXf48nbqvBOjjJmA=
X-Google-Smtp-Source: ABdhPJxfCQsPR/EgO4+YAJav9yefxL/RYqx57TttjxZzGPlfPZF6XdSj2vXBbpV/r5m5E2PqVw7XTGqwYv3OdqLPtKU=
X-Received: by 2002:adf:d1ec:0:b0:20c:6228:e2c8 with SMTP id
 g12-20020adfd1ec000000b0020c6228e2c8mr8026476wrd.328.1651587249457; Tue, 03
 May 2022 07:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220502172908.3569799-1-robdclark@gmail.com>
 <86160889d7be260c5012044643b81d10098943fe.camel@pengutronix.de>
In-Reply-To: <86160889d7be260c5012044643b81d10098943fe.camel@pengutronix.de>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 May 2022 07:13:55 -0700
Message-ID: <CAF6AEGve4OYRYvSim6_7ihYZb-HuwQkBqm8D_=1MRxDHhhQFag@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Limit command submission when no IOMMU
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 3, 2022 at 5:12 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Montag, dem 02.05.2022 um 10:29 -0700 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Running the GPU without an IOMMU is not really a supported (or sane)
> > configuration.  Yet it can be useful during SoC bringup (ie. if the
> > iommu driver doesn't work yet).
> >
> > Lets limit it to users who already have /dev/mem access, to avoid the
> > chance that a user accidentially configures kernel without IOMMU
> > support.
>
> I haven't followed MSM too closely, so ctx->aspace may also include the
> GPU MMU, but if this really only includes the IOMMU (as the commit
> message implies) then this breaks Freedreno on i.MX5.

it includes the gpu mmu, so a2xx should be fine.

BR,
-R

> Regards,
> Lucas
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index 23b68bc945f6..9cd8c8708990 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -734,6 +734,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       if (args->pad)
> >               return -EINVAL;
> >
> > +     if (unlikely(!ctx->aspace) && !capable(CAP_SYS_RAWIO)) {
> > +             DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
> > +             return -EPERM;
> > +     }
> > +
> >       /* for now, we just have 3d pipe.. eventually this would need to
> >        * be more clever to dispatch to appropriate gpu module:
> >        */
>
>
