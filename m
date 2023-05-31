Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B025B717D6F
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 12:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E6010E1BE;
	Wed, 31 May 2023 10:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F380310E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 10:54:47 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b02e0ec7d5so4509465ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685530487; x=1688122487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aW1b1ccAWN4g+utpYsd/EKLY8pCRgvbm0rstGDwBDSU=;
 b=EKcuDnKmwPD117tH/GwwZWVjGgwRlWmNDDSwzZCPJHnmMbbDbi88XW7atFxnH+K5k2
 zc9VDCeYx5zo0zp1XbC9WmmcFzlucpPHOpc/9MAWBNFvIaHH4mFKDp2thmrcAHxoSp3C
 GfRhl2uH0J7Vl6OJFM24WgsV1osBETWIb3srvZ/LGDEiNs9+PZtIyk2sgDO+5MH1fhf+
 Cj81WiOizy3KS+SygfcL5IhTMCWHonqJmQ6FSmEODyRVis4NRXZr6+rCzYw4nNErvCGv
 gvVsy2+DGnILZALoejASkTaBUwcSl9nNHAYZjDTTX110ewqrb3JXNAh4W5ewOqn6DZuP
 mvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685530487; x=1688122487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aW1b1ccAWN4g+utpYsd/EKLY8pCRgvbm0rstGDwBDSU=;
 b=gN2V089P2t/DEABqLUwyx++a0somfRpAnNFYVzvo5EUy8/maZUbDR2HHY+fFG95cft
 lEnmJ9Ny0jbzJMPvw3xeRHGewGx4m6WdIKNdb1Q+9S87Kil3h1VqHNOMvS+tmpQNVgbK
 iKCfIpX6Vo74XLwbM5tCI+7rGaeOdkwxwyGgMqjaFNJj3LLQ6mvA0kNgVl4K/1ejO2C2
 K33viL+9rcprbONjlAn+N/PI+CkhroH3N2FRWf17cI3BYdwcKyktehALbiTDcWm6PPPR
 dVbeXRT9uafiX2cYVfhR7FTyl+asH1KrwJBbLLlaYbOndbg6uDNHinGQlPg+9dv3JM0+
 94qQ==
X-Gm-Message-State: AC+VfDwi6eNwLmlUvzf4IN/UNcsG653/SN7wkxaD+OvPOPSJbA9e1sbj
 x3gQmyXjbc4PyASTy8wlVnYh3NiQrn4WpDo1elg=
X-Google-Smtp-Source: ACHHUZ6Pk/b50QlriP6fmYh21EsZlRkoEXx2f4SkiI3WgSLoGLCoajx5TP+OOXzXRcAbrFO52OXXYS5rFksm4EKd1fQ=
X-Received: by 2002:a17:902:e852:b0:1b0:3cda:6351 with SMTP id
 t18-20020a170902e85200b001b03cda6351mr5360668plg.0.1685530487124; Wed, 31 May
 2023 03:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230526130131.16521-1-lm0963hack@gmail.com>
 <20230530222150.24oogloda6wtvpvm@intel.intel>
 <CAAgLYK7FNrAYFRp7C3LDtqevFENQLw8YYAFR2Pk9wdfQ5RKVeg@mail.gmail.com>
 <20230531081917.grx3qqqm7usaqoa5@intel.intel>
In-Reply-To: <20230531081917.grx3qqqm7usaqoa5@intel.intel>
From: lm0963 <lm0963hack@gmail.com>
Date: Wed, 31 May 2023 18:54:34 +0800
Message-ID: <CAAgLYK4KzuKMTkBwzCJj4wa+W+=9fR+A1J=XR-n1E-W7EjexuA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
To: Andi Shyti <andi.shyti@kernel.org>
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
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 sw0312.kim@samsung.com, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On Wed, May 31, 2023 at 4:19=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Min,
>
> > > > If it is async, runqueue_node is freed in g2d_runqueue_worker on an=
other
> > > > worker thread. So in extreme cases, if g2d_runqueue_worker runs fir=
st, and
> > > > then executes the following if statement, there will be use-after-f=
ree.
> > > >
> > > > Signed-off-by: Min Li <lm0963hack@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/=
drm/exynos/exynos_drm_g2d.c
> > > > index ec784e58da5c..414e585ec7dd 100644
> > > > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > > @@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct drm_device *=
drm_dev, void *data,
> > > >       /* Let the runqueue know that there is work to do. */
> > > >       queue_work(g2d->g2d_workq, &g2d->runqueue_work);
> > > >
> > > > -     if (runqueue_node->async)
> > > > +     if (req->async)
> > >
> > > did you actually hit this? If you did, then the fix is not OK.
> >
> > No, I didn't actually hit this. I found it through code review. This
> > is only a theoretical issue that can only be triggered in extreme
> > cases.
>
> first of all runqueue is used again two lines below this, which
> means that if you don't hit the uaf here you will hit it
> immediately after.

No, if async is true, then it will goto out, which will directly return.

if (runqueue_node->async)
    goto out;   // here, go to out, will directly return

wait_for_completion(&runqueue_node->complete);      // not hit
g2d_free_runqueue_node(g2d, runqueue_node);

out:
return 0;

>
> Second, if runqueue is freed, than we need to remove the part
> where it's freed because it doesn't make sense to free runqueue
> at this stage.

It is freed by g2d_free_runqueue_node in g2d_runqueue_worker

static void g2d_runqueue_worker(struct work_struct *work)
{
    ......
    if (runqueue_node) {
        pm_runtime_mark_last_busy(g2d->dev);
        pm_runtime_put_autosuspend(g2d->dev);

        complete(&runqueue_node->complete);
        if (runqueue_node->async)
            g2d_free_runqueue_node(g2d, runqueue_node);        // freed her=
e
    }

>
> Finally, can you elaborate on the code review that you did so
> that we all understand it?

queue_work(g2d->g2d_workq, &g2d->runqueue_work);
msleep(100);        // add sleep here to let g2d_runqueue_worker run first
if (runqueue_node->async)
    goto out;


>
> Andi



--
Min Li
