Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CEA4ECAAE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 19:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE48B10E392;
	Wed, 30 Mar 2022 17:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4563D10E392;
 Wed, 30 Mar 2022 17:31:42 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j18so30290736wrd.6;
 Wed, 30 Mar 2022 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MzOHSa1wGev7C61xNe7AlpnL6176z6/FaTx3bV4mjuY=;
 b=VpSVi2g7tol4ZEtmFAbrEKl2ClldYYPOqDfvuzHFwzN1r2GBUOmp+X5qC2sTOGTv+q
 VasI8bOaDB17Wj5zf6L3Vi7yNqMM+GuCL205yQjNT6GPsOlj6+OlpQwqpEvjuRUsNZfE
 C/azEpBsaT8HORk1sROgRQ8Th4grMWoEvzorWWrPiI6ky8S1auDWu6UaZz9+3BJNOaa2
 yIrpyzcehU9u17ygGvZ6BJqsxzCVWFm8+RxbW29xvfyBYaZdDrZR3pEfnJXPGdQA3bYd
 eXnmrSEzBgpFA3JOZZEKy205JvU1lvDbhL30Ri3r8WDUcg6vb5+6MrByecZVrsy7dMNX
 549g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MzOHSa1wGev7C61xNe7AlpnL6176z6/FaTx3bV4mjuY=;
 b=wQDvhfYJmki+ynFnrSAX4n6oruD/Fl6vBgpm3RnsXASMHqz9Q9CCqbCPqx1LzE1drK
 MdkYrW4rhV+8byPWxa+nVxDTkYvy4mvWLk3wYWM4JzuxfbaxE1/1XlGk5GBMSG3A3xu8
 MbpQJvdZHsS5AQoahmWlyBrTNgdhADl4XkPztd1uBkp6mbOab+HuxBtVV5HBSo8evhJG
 qPGJ3vOX1J6A8PzKaJs7OiF7IIk+MiuLxVYYTML04ZwHHg74tUqvazWdCrmUMDXFfnUX
 8O4AJBM46g8TNCNT9iXbPPoRPvfVM8wfO9LzeKWDlSR0lNypCD1p9Xmrc+TdsfweM2Kb
 eUdQ==
X-Gm-Message-State: AOAM532DbIObGzYVbpBL0+3WogWZDNTuiFo8bowm8X8R5+RwOToNiQDM
 63yVzg+oBW/E2l3pUavvordL8fh4jjFYtATiVpc=
X-Google-Smtp-Source: ABdhPJxzLtFOHA8j1KP7060UxbMN89W0F5SOw0/ZWrSMMqfII6hCIzYI4qnQ5sVFdKPvpVEKavi+htl4y4KW0PBzBc0=
X-Received: by 2002:adf:dd4d:0:b0:203:f178:b78b with SMTP id
 u13-20020adfdd4d000000b00203f178b78bmr622734wrm.93.1648661500674; Wed, 30 Mar
 2022 10:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com>
 <20220329230105.601666-4-robdclark@gmail.com>
 <CAA8EJpqAaW0Q-QeQObonUqAhdWaw8mPPvChmboH88ttTx+2XGg@mail.gmail.com>
In-Reply-To: <CAA8EJpqAaW0Q-QeQObonUqAhdWaw8mPPvChmboH88ttTx+2XGg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 30 Mar 2022 10:32:32 -0700
Message-ID: <CAF6AEGtkpF5MLza0LY_AJsC4vu1nAzXZ5xv4Eusz+Bpp6GFXRA@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/msm/gem: Split out inuse helper
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 4:32 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Prep for a following patch.  While we are at it, convert a few remaining
> > WARN_ON()s to GEM_WARN_ON().
>
> Well... GEM_WARN_ON doesn't really look like a 'while we are at it'.
> It might be better to split it into a separate commit.

it was a bit lazy.. I'll split it out

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c     |  2 +-
> >  drivers/gpu/drm/msm/msm_gem.h     |  1 +
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++-----
> >  3 files changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index a4f61972667b..f96d1dc72021 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -938,7 +938,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
> >                                 name, comm ? ":" : "", comm ? comm : "",
> >                                 vma->aspace, vma->iova,
> >                                 vma->mapped ? "mapped" : "unmapped",
> > -                               vma->inuse);
> > +                               msm_gem_vma_inuse(vma));
> >                         kfree(comm);
> >                 }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > index 947ff7d9b471..1b7f0f0b88bf 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -61,6 +61,7 @@ struct msm_gem_vma {
> >  int msm_gem_init_vma(struct msm_gem_address_space *aspace,
> >                 struct msm_gem_vma *vma, int npages,
> >                 u64 range_start, u64 range_end);
> > +bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
> >  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
> >                 struct msm_gem_vma *vma);
> >  void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> > index f914ddbaea89..dc2ae097805e 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -37,6 +37,11 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
> >         return aspace;
> >  }
> >
> > +bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
> > +{
> > +       return !!vma->inuse;
> > +}
>
> It almost  asks to be a static inline. The patch 04 makes it complex,
> so it's probably not that important.

yeah, that is the reason I didn't make it static inline

BR,
-R

> > +
> >  /* Actually unmap memory for the vma */
> >  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
> >                 struct msm_gem_vma *vma)
> > @@ -44,7 +49,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
> >         unsigned size = vma->node.size << PAGE_SHIFT;
> >
> >         /* Print a message if we try to purge a vma in use */
> > -       if (WARN_ON(vma->inuse > 0))
> > +       if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
> >                 return;
> >
> >         /* Don't do anything if the memory isn't mapped */
> > @@ -61,7 +66,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
> >  void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
> >                 struct msm_gem_vma *vma)
> >  {
> > -       if (!WARN_ON(!vma->iova))
> > +       if (!GEM_WARN_ON(!vma->iova))
> >                 vma->inuse--;
> >  }
> >
> > @@ -73,7 +78,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
> >         unsigned size = npages << PAGE_SHIFT;
> >         int ret = 0;
> >
> > -       if (WARN_ON(!vma->iova))
> > +       if (GEM_WARN_ON(!vma->iova))
> >                 return -EINVAL;
> >
> >         /* Increase the usage counter */
> > @@ -100,7 +105,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
> >  void msm_gem_close_vma(struct msm_gem_address_space *aspace,
> >                 struct msm_gem_vma *vma)
> >  {
> > -       if (WARN_ON(vma->inuse > 0 || vma->mapped))
> > +       if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
> >                 return;
> >
> >         spin_lock(&aspace->lock);
> > @@ -120,7 +125,7 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
> >  {
> >         int ret;
> >
> > -       if (WARN_ON(vma->iova))
> > +       if (GEM_WARN_ON(vma->iova))
> >                 return -EBUSY;
> >
> >         spin_lock(&aspace->lock);
> > --
> > 2.35.1
> >
>
>
> --
> With best wishes
> Dmitry
