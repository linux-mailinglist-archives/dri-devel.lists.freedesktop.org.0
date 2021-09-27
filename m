Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF690419794
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 17:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C581789CF6;
	Mon, 27 Sep 2021 15:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C172A89CF6;
 Mon, 27 Sep 2021 15:17:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w29so52476355wra.8;
 Mon, 27 Sep 2021 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tetxFL9+5GmfRcJZUQF3Nho9xO1Jgkf6i2MZ8kBXK5Y=;
 b=f1E1cYAW/S9T++gJfdfEOEFSrF80YvO0xsjuPylXQ6axVTPupw1Q/O3SXOB8WisaeS
 VjgByosbcj36sq3m5wcz267wJT/80ig2yp7HNitCAZbGLxaeeHNn0j8zJ6yxeQl9jGB1
 cbJpyy9Oh/xGHt7j8dz2yIJ9/bB0suHH2shVEvNl1h9r1ERIrz9ziQHM+D2Oim3LG8LB
 ZFfVg6/dLmrf8cFt4SlTR/mPDyuOGLVpufZFcu7bU8y8FRyOehjIXBQncqsvf3bd1J7x
 f48XLHbjoch3dCteMViY7Dht01O+mgADvmmf02DquoqwcUq8+LL7ap43YUmHOK7GfHsJ
 V0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tetxFL9+5GmfRcJZUQF3Nho9xO1Jgkf6i2MZ8kBXK5Y=;
 b=3QGigwL5PSe4B9EuulCTe1xmTLcJO9PH1KQ1MMau4V7Hc/JoJXtnuHdn8e/Fj71L0i
 bYy/L5Guf3thP+msP8ce9j5pmnu0F6xn63yqcxmRXeNODdjpYGkz3qmUgZb+G9oorlqU
 EXyr5QRgTY/XS8RJuISfZJtYGRqRnS9MMjcMkew2gi9Iby9TXUqn4Cct6yjD2sbxEDmj
 I2C6gh2rq1upFE9OtfEDOAUfB+qTf2YrwAjJA+SuzCtNDVEQAMpnEeCDwoAkpig8vvfL
 bEQyERs2aHjLmn56xfd0mlRagsZBc/ZbvDBvgf+M8OsdpjZbZDC7K8iLxeApcTi5HrU4
 AHCA==
X-Gm-Message-State: AOAM532mzHjZvgWlaH+nwkSI/Ul8dy22fUuqWeueT3oAOfGd8IWN1SvE
 CqtsYCPrw1rCgVDGOv7A4YXwJqybZCXfyLLMUFg=
X-Google-Smtp-Source: ABdhPJy4Z6K+A31iTGXB/OiQhqwB1ORVFMl6q4JShHt0KMHu9lZw8pI8JsGnP6jluVs2MNamyaMr2p8qBRRgjMLOPb4=
X-Received: by 2002:adf:dd8e:: with SMTP id x14mr485784wrl.260.1632755857102; 
 Mon, 27 Sep 2021 08:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210926190554.761482-1-robdclark@gmail.com>
 <CAA8EJpozNAfQpy4w-Edx_8wyQ_X+sDzAgqk6Z6EHj0ZJ5r0HBg@mail.gmail.com>
In-Reply-To: <CAA8EJpozNAfQpy4w-Edx_8wyQ_X+sDzAgqk6Z6EHj0ZJ5r0HBg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 27 Sep 2021 08:22:09 -0700
Message-ID: <CAF6AEGs8o_cSbhQeVuRTTZhyqp-sqnhh3_od6TgkfB8T=Zet8g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix crash on dev file close
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

On Sun, Sep 26, 2021 at 12:36 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, 26 Sept 2021 at 22:01, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If the device file was opened prior to fw being available (such as from
> > initrd before rootfs is mounted, when the initrd does not contain GPU
> > fw), that would cause a later crash when the dev file is closed due to
> > unitialized submitqueues list:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I've sent a close version of this patch a day or so ago, but yours is
> better, as I did not touch rwlock init.

Thanks, sorry I did not see your patch earlier

BR,
-R

> >
> >    CPU: 4 PID: 263 Comm: plymouthd Tainted: G        W         5.15.0-rc2-next-20210924 #2
> >    Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
> >    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >    pc : msm_submitqueue_close+0x30/0x190 [msm]
> >    lr : msm_postclose+0x54/0xf0 [msm]
> >    sp : ffff80001074bb80
> >    x29: ffff80001074bb80 x28: ffff03ad80c4db80 x27: ffff03ad80dc5ab0
> >    x26: 0000000000000000 x25: ffff03ad80dc5af8 x24: ffff03ad81e90800
> >    x23: 0000000000000000 x22: ffff03ad81e90800 x21: ffff03ad8b35e788
> >    x20: ffff03ad81e90878 x19: 0000000000000000 x18: 0000000000000000
> >    x17: 0000000000000000 x16: ffffda15f14f7940 x15: 0000000000000000
> >    x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000040
> >    x11: 0000000000000000 x10: 0000000000000000 x9 : ffffda15cd18ff88
> >    x8 : ffff03ad80c4db80 x7 : 0000000000000228 x6 : 0000000000000000
> >    x5 : 1793a4e807e636bd x4 : ffff03ad80c4db80 x3 : ffff03ad81e90878
> >    x2 : 0000000000000000 x1 : ffff03ad80c4db80 x0 : 0000000000000000
> >    Call trace:
> >     msm_submitqueue_close+0x30/0x190 [msm]
> >     msm_postclose+0x54/0xf0 [msm]
> >     drm_file_free.part.0+0x1cc/0x2e0 [drm]
> >     drm_close_helper.isra.0+0x74/0x84 [drm]
> >     drm_release+0x78/0x120 [drm]
> >     __fput+0x78/0x23c
> >     ____fput+0x1c/0x30
> >     task_work_run+0xcc/0x22c
> >     do_exit+0x304/0x9f4
> >     do_group_exit+0x44/0xb0
> >     __wake_up_parent+0x0/0x3c
> >     invoke_syscall+0x50/0x120
> >     el0_svc_common.constprop.0+0x4c/0xf4
> >     do_el0_svc+0x30/0x9c
> >     el0_svc+0x20/0x60
> >     el0t_64_sync_handler+0xe8/0xf0
> >     el0t_64_sync+0x1a0/0x1a4
> >    Code: aa0003f5 a90153f3 f8408eb3 aa1303e0 (f85e8674)
> >    ---[ end trace 39b2fa37509a2be2 ]---
> >    Fixing recursive fault but reboot is needed!
> >
> > Fixes: 86c2a0f000c1 drm/msm: ("Small submitqueue creation cleanup")
> > Reported-by: Steev Klimaszewski <steev@kali.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c         | 3 +++
> >  drivers/gpu/drm/msm/msm_submitqueue.c | 4 ----
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index f350de754f84..938765ad7109 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -689,6 +689,9 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
> >         if (!ctx)
> >                 return -ENOMEM;
> >
> > +       INIT_LIST_HEAD(&ctx->submitqueues);
> > +       rwlock_init(&ctx->queuelock);
> > +
> >         kref_init(&ctx->ref);
> >         msm_submitqueue_init(dev, ctx);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> > index 32a55d81b58b..7ce0771b5582 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -140,10 +140,6 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
> >          */
> >         default_prio = DIV_ROUND_UP(max_priority, 2);
> >
> > -       INIT_LIST_HEAD(&ctx->submitqueues);
> > -
> > -       rwlock_init(&ctx->queuelock);
> > -
> >         return msm_submitqueue_create(drm, ctx, default_prio, 0, NULL);
> >  }
> >
> > --
> > 2.31.1
> >
>
>
> --
> With best wishes
> Dmitry
