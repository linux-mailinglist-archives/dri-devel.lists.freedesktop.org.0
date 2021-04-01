Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB686351736
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 19:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054486E2D7;
	Thu,  1 Apr 2021 17:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D3E6E2D7;
 Thu,  1 Apr 2021 17:34:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c8so2585150wrq.11;
 Thu, 01 Apr 2021 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rK2LdS6ODAydJkNJDKUimZKMnsbdOM3cvA6asgW0c80=;
 b=fbPIbSHJtsRAZcXnsol7EI9DCaFJZ9nwvBGgXN7up6EJ+E7CAhF1Ocm4pX77zRlF+8
 iKer8GP+EWclFlHSRplim3szwZeCqo9UrNPQK+ESFU3xZx/mVuM36sWFCBPU02kN8Uq0
 DrqxAh9Yelt//O5VEqVWrdz94ICrGpecJ2+v7/UoVs3x95tlMaCNyEElnc+zC12GyHtt
 3QOyMFLgzT9duhlCILmgOvPRQhwbHAQWQOicexLPIm89xw1ppK5cpSIp43+b9tOWE5kU
 GrihkfBolOIcGBgdosfKtjs1FoGncRGD0YlOxjPzUrt1qVQnOvspWi4etXScsO+R2xt6
 rDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rK2LdS6ODAydJkNJDKUimZKMnsbdOM3cvA6asgW0c80=;
 b=QWthwtX6M5YiIPdDgadLSRmCm83pUUfb2DDWa2WTPoXRWZB96zGHqtj6mJICMNwwHg
 b1ezDGMDiF9uNsAVwnNYMFPnSS9RMnyAQWAE2w+poocLWBt3sgYFltjIWkWWFasFdni4
 8U4z837vJgURJleFcn7kf6ul9EvntZ9Teoec6GYLplbL/3V4iG5RQZyKSEhO2k323hQT
 bRxHtPMPoH3n1Ppsnsb4abc+WNyKHPAa6Ki1Npyt31TTOnM/gZRNkUPC9XV1tWdP8+Ou
 9UJGce9lY6oaZ+mniK0QZ9juzdE/v4LRYUFU6leEzlJy+pXpQzX+658gnXlFb0GAJ4+u
 +TiQ==
X-Gm-Message-State: AOAM532sqibhDSO1zUIXO5hUnyeYCedu+YMIuy8KbRdW9DxeSx37Dxjh
 /UXiJUhwiNUapMaBDTNTZQ4Wb/iAITJM7UpJGVE=
X-Google-Smtp-Source: ABdhPJzTzb75Zq5lVKxlXsLtahJ+rLK1yT4ChASxTdyK4VvEYKWc/dOfoDSRkP8SuHFCh33/CUU6oLC581EOnJ+bucE=
X-Received: by 2002:adf:fb42:: with SMTP id c2mr11041823wrs.83.1617298459053; 
 Thu, 01 Apr 2021 10:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-3-robdclark@gmail.com>
 <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
In-Reply-To: <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 1 Apr 2021 10:37:44 -0700
Message-ID: <CAF6AEGvQ3Ep4O_SKGiptq1BiMK0tUjJ=U84M2otvQtVfWHEzoQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm: Avoid mutex in shrinker_count()
To: Doug Anderson <dianders@chromium.org>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 1, 2021 at 8:34 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Mar 31, 2021 at 6:24 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > @@ -45,6 +30,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> >         list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
> >                 if (freed >= sc->nr_to_scan)
> >                         break;
> > +               /* Use trylock, because we cannot block on a obj that
> > +                * might be trying to acquire mm_lock
> > +                */
>
> nit: I thought the above multi-line commenting style was only for
> "net" subsystem?

we do use the "net" style a fair bit already.. (OTOH I tend to not
really care what checkpatch says)

> >                 if (!msm_gem_trylock(&msm_obj->base))
> >                         continue;
> >                 if (is_purgeable(msm_obj)) {
> > @@ -56,8 +44,11 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> >
> >         mutex_unlock(&priv->mm_lock);
> >
> > -       if (freed > 0)
> > +       if (freed > 0) {
> >                 trace_msm_gem_purge(freed << PAGE_SHIFT);
> > +       } else {
> > +               return SHRINK_STOP;
> > +       }
>
> It probably doesn't matter, but I wonder if we should still be
> returning SHRINK_STOP if we got any trylock failures. It could
> possibly be worth returning 0 in that case?

On the surface, you'd think that, but there be mm dragons.. we can hit
shrinker from the submit path when the obj is locked already and we
are trying to allocate backing pages.  We don't want to tell vmscan to
keep trying, because we'll keep failing to grab that objects lock

>
> > @@ -75,6 +66,9 @@ vmap_shrink(struct list_head *mm_list)
> >         unsigned unmapped = 0;
> >
> >         list_for_each_entry(msm_obj, mm_list, mm_list) {
> > +               /* Use trylock, because we cannot block on a obj that
> > +                * might be trying to acquire mm_lock
> > +                */
>
> If you end up changing the commenting style above, should also be here.
>
> At this point this seems fine to land to me. Though I'm not an expert
> on every interaction in this code, I've spent enough time starting at
> it that I'm comfortable with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

thanks

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
