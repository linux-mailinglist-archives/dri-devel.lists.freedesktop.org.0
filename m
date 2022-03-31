Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B104EE132
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F9310EC16;
	Thu, 31 Mar 2022 18:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951CA10EC16;
 Thu, 31 Mar 2022 18:57:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso2206378wme.5; 
 Thu, 31 Mar 2022 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RcGA7qZL8bg5E6qFk3sdBJk26ZdghHIeSb/SgsZqBag=;
 b=cv7vJCYuueHR+RjurisIFmW8Xs45KZu/1kaJ+IcCX9wfrhy37/Q4x2pelmTd5sgbpE
 HQzJ0ZJjl7w4caBkZbkmW2WH0a0/x96En8B6WNH4QpgvPLE3JmOYpH1eLtTqiXLIk5RX
 os5c3ObHVviLGC5WFoo5DsFCWygJUx72OxxREXOHc6YvkuUkKJydvFGqaTQWS8UdKbnP
 DOjSpXD2xkTPWQyXU2ZF7txd+9B2tTtcO33Gd+ZU9kky4jrW/o6q8U2mLG3CyFS/jC7V
 nuU+AIB/7AnzXXJPEvhTK//ag26NrJIxg3Wa9JKxm0jqAw67nuu7Zs99kWVs8cA4kqj7
 kPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RcGA7qZL8bg5E6qFk3sdBJk26ZdghHIeSb/SgsZqBag=;
 b=G6Fk32Vw7DYvTlxaNZFkaSOX/Jk/MvcFhgOb4WcSy6ol1fDGcBH6hi5G0reK+4CkO2
 4XhDDJtOCHceUTAkC1hJy1J2cYFvu0Xu3CRGyD3F2LxtLUoOIfCX004UsxucA+Uf573i
 ib2KdDlSZGIWxtC4yHpenRIGQJHk029RH/JHtWZKoDX06E+OgkDLTvE0l5ShhHaNrcaS
 0aTLgFHyL76U5KyEJWTE6ae8Lqe8SUMgWLPaIvdu5eH75mBCnXhkDv804OE6y6LnLKGu
 m8LT+iipB7cgVEKG+EFNV+qCIcWg8pD7VxyHDO4J/JccrnkJoa1syuuqEDw6Ma6QtVSg
 yj+w==
X-Gm-Message-State: AOAM532GZR7WywOOpnIWAZspmnV9XW+8OAKZyWUunQhoLC5KH2KBcd29
 LJ10+GnYPFzM7TsCKv5DONKCVoxTUOdaAMpEQkY=
X-Google-Smtp-Source: ABdhPJzjWFQNfQlScp7L8msEibU0gM72m999QKy+C7eRMt+/vP9w0VatzkP5yDG6lf4lyS4mdaftC+0wu2HwQWo8nt0=
X-Received: by 2002:a05:600c:35d0:b0:38c:e6fa:44eb with SMTP id
 r16-20020a05600c35d000b0038ce6fa44ebmr5803865wmq.102.1648753065007; Thu, 31
 Mar 2022 11:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220330204804.660819-1-robdclark@gmail.com>
 <20220330204804.660819-8-robdclark@gmail.com>
 <83979c7b-8a8a-5006-6af3-f3ca8b0d8ced@collabora.com>
In-Reply-To: <83979c7b-8a8a-5006-6af3-f3ca8b0d8ced@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 31 Mar 2022 11:58:36 -0700
Message-ID: <CAF6AEGtEczCSzwMNcr2EJJ=OcncABC2ZM2dVpAYoJM+5TBTKXQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] drm/msm/gem: Rework vma lookup and pin
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 11:27 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 3/30/22 23:47, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Combines duplicate vma lookup in the get_and_pin path.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c | 50 ++++++++++++++++++-----------------
> >  1 file changed, 26 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index deafae6feaa8..218744a490a4 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -376,39 +376,40 @@ put_iova_vmas(struct drm_gem_object *obj)
> >       }
> >  }
> >
> > -static int get_iova_locked(struct drm_gem_object *obj,
> > -             struct msm_gem_address_space *aspace, uint64_t *iova,
> > +static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
> > +             struct msm_gem_address_space *aspace,
> >               u64 range_start, u64 range_end)
> >  {
> >       struct msm_gem_vma *vma;
> > -     int ret = 0;
> >
> >       GEM_WARN_ON(!msm_gem_is_locked(obj));
> >
> >       vma = lookup_vma(obj, aspace);
> >
> >       if (!vma) {
> > +             int ret;
> > +
> >               vma = add_vma(obj, aspace);
> >               if (IS_ERR(vma))
> > -                     return PTR_ERR(vma);
> > +                     return vma;
> >
> >               ret = msm_gem_init_vma(aspace, vma, obj->size,
> >                       range_start, range_end);
> >               if (ret) {
> You're allocation range_start -> range_end
>
>
> >                       del_vma(vma);
> > -                     return ret;
> > +                     return ERR_PTR(ret);
> >               }
> > +     } else {
> > +             GEM_WARN_ON(vma->iova < range_start);
> > +             GEM_WARN_ON((vma->iova + obj->size) > range_end);
>
> and then comparing range_start -> range_start + obj->size, hence you're
> assuming that range_end always equals to obj->size during the allocation.
>
> I'm not sure what is the idea here.. this looks inconsistent. I think
> you wanted to write:
>
>                 GEM_WARN_ON(vma->iova < range_start);
>                 GEM_WARN_ON(vma->iova + (vma->node.size << PAGE_SHIFT) > range_end);
>
> But is it really useful to check whether the new range is inside of the
> old range? Shouldn't it be always a error to change the IOVA range
> without reallocating vma?

There are a few cases (for allocations for GMU) where the range is
larger than the bo.. see a6xx_gmu_memory_alloc()

BR,
-R

>
> I'd expect to see:
>
>                 GEM_WARN_ON(vma->iova != range_start);
>                 GEM_WARN_ON(vma->iova + (vma->node.size << PAGE_SHIFT) != range_end);
>
> and then error out if range mismatches.
