Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBC354CC03
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 16:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E4510E607;
	Wed, 15 Jun 2022 14:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2B10F713;
 Wed, 15 Jun 2022 14:59:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m16-20020a7bca50000000b0039c8a224c95so1281015wml.2; 
 Wed, 15 Jun 2022 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6fopigGhBHUvToQDW8C96mevEAHmyd9RwH6T3VHGQno=;
 b=aMm4UMWGVLS0PAt7bgDYcLdhm/CszdAgtdVdM0VB45miYsgwGwV09ga2eYkF4zV8yE
 kUtl2fvYUcU7gIGTYYEkTyc6kdkn+RFFKlGwxZoASle2G2i0bcCNksb6K0Kc73gmP5qU
 G1J8w5fZywh60Dj2gtTk22jbwzc1IhxKa5YXcVEdViPzZrOrJYAJu3ojR7mrJWPmlND2
 2Z8qcYC60RFp6XpiM4BGr+2XVXKD1E7lHXhSAFHKx9eHClHe+2Un2u1GC2EzxzP1SIz4
 Vw0e6Y3MBvEM+wL9S7jigJAfH3hZYTDU/M5Ys9NHbpq1jLpR21o0Agibudjy8rVbRB5P
 ttjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6fopigGhBHUvToQDW8C96mevEAHmyd9RwH6T3VHGQno=;
 b=cg+1J4x38SHj8WMsJ0QMn78sRSYMG+X64xl9JwBKy0tJpoMGQKHmNlgR8WD3AZweYo
 7oxFppen94Q3r/K6mwCbsLy9QUOZ7hjkr7TIMk2eMgUkuhVYw5cGi6/RoNv0xMGS5Fzp
 qbVNEdkdV6xBxbFO1D7Eyv075qA73hT/FQAmOwEoXsuoikbTSaGAetNpRXxpILqpAHrM
 1VAFpAXjtVnJbZ1IaxJxNUnrONT1LxAYSloc3aJqaySyK7LLNXt6CTRXeKlpphu07UeD
 AuuLxING+SzTiu7NUa19oIoRx6jsiykBe1yDojmUhK8rLDc9/hkKpugdL7SQuIgLwUKO
 n43w==
X-Gm-Message-State: AOAM531biJ4BOEB7NBNIttKWDTkKWvNLSOb9Vj5ZFYfDlru4nsecr1tL
 PPAYbYZiu31KaMPkGbJBvCSaCybs50Z3UHtbAWs=
X-Google-Smtp-Source: ABdhPJwOdzB0phMq92UxkYkA4A0DK81tSFVTV8Pe3y2MmItWnkJUarOsTTIAMYPDNE2/mS2V7lGTfJqzy/ONnv84lkk=
X-Received: by 2002:a05:600c:4f96:b0:39c:951e:66b7 with SMTP id
 n22-20020a05600c4f9600b0039c951e66b7mr10636359wmq.84.1655305179680; Wed, 15
 Jun 2022 07:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220610172055.2337977-1-robdclark@gmail.com>
 <42e52572-726b-d94d-6523-7b42dbeecff1@kali.org>
In-Reply-To: <42e52572-726b-d94d-6523-7b42dbeecff1@kali.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Jun 2022 07:59:44 -0700
Message-ID: <CAF6AEGuTw3fMaNbvkt9z3EWqjND2R3nrRu+PP=GVQjx+TW0N9w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gem: Drop early returns in close/purge vma
To: Steev Klimaszewski <steev@kali.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 11, 2022 at 11:16 AM Steev Klimaszewski <steev@kali.org> wrote:
>
> Hi Rob,
>
> On 6/10/22 12:20 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Keep the warn, but drop the early return.  If we do manage to hit this
> > sort of issue, skipping the cleanup just makes things worse (dangling
> > drm_mm_nodes when the msm_gem_vma is freed, etc).  Whereas the worst
> > that happens if we tear down a mapping the GPU is accessing is that we
> > get GPU iova faults, but otherwise the world keeps spinning.
> >

forgot this initially:

Reported-by: Steev Klimaszewski <steev@kali.org>

> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> > index 3c1dc9241831..c471aebcdbab 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -62,8 +62,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
> >       unsigned size = vma->node.size;
> >
> >       /* Print a message if we try to purge a vma in use */
> > -     if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
> > -             return;
> > +     GEM_WARN_ON(msm_gem_vma_inuse(vma));
> >
> >       /* Don't do anything if the memory isn't mapped */
> >       if (!vma->mapped)
> > @@ -128,8 +127,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
> >   void msm_gem_close_vma(struct msm_gem_address_space *aspace,
> >               struct msm_gem_vma *vma)
> >   {
> > -     if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
> > -             return;
> > +     GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped);
> >
> >       spin_lock(&aspace->lock);
> >       if (vma->iova)
>
> I've seen the splat on the Lenovo Yoga C630 here, and have tested this
> patch, and as described, the splat still happens, but the system is
> still able to be used.
>
> Tested-by: Steev Klimaszewski <steev@kali.org>
>
