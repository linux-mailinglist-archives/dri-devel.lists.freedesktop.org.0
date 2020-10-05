Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09A283CCC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 18:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ABA89CDB;
	Mon,  5 Oct 2020 16:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107D489CBA;
 Mon,  5 Oct 2020 16:49:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z1so10378763wrt.3;
 Mon, 05 Oct 2020 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cmy513aiCAKF5upvIJrZZZX0KF0VJYYwzL6n+RYf11I=;
 b=hr1n1nmFEEAdc+6X9eVIA7H6F4OuL0MJx7a0AXWZNvly8e9U9Bv3F3yI4GcfxAuWa0
 UkVOm2+8LGlyBofMkEifpRTcmKH5ESdbbeeTNdvJpoUEjWFASW3o5endWzeqz3Tz110C
 DWdYmVIKTkQLGMETSNrsFm9s1vp73pgjDyr+SPplVrJTrLoXF1pMv9jJD2mVLxkeOU39
 0i89EAGMWh8YrEK10YO4D2kV2kthuq1keUtJLukivFIs2kVrSXZrW1ZWU+va3mU+Wpdh
 IPl0VnfcjMrF8Q6bowVw/Za5dLBbscDV4JCOZ9lJSVrnSih4AD+6Ho1VdqwITThcqMSn
 C4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cmy513aiCAKF5upvIJrZZZX0KF0VJYYwzL6n+RYf11I=;
 b=iJYilXic9utFB6av7SYheZ7dM2LJvcPpj2mdUHHpcV7QigJCpg31ki5E1PRFj3ON1M
 vTT+3hwzA6/nWeol5GAn1HNNhZtcfetYGMXCm+kolGDgk+GryBTDZB5NPnFB8SsPLtua
 t6tYH5NX3GJiw1AngFn6azBF2i4icAeo3asKbaLM8CSpOYhpzMXktbwkAkMF3Gy9TGoJ
 GEpfaNd1C082j63cTtt6jIAGW3E6B6Fq/J25AXUBAul5COab5QDhHr8wjOx0HKEJ339a
 DJk0qeXkOu+eMuRup06LkvJ89C0Zdd7ltltu5ewAI5aVQ+720L4QzxRXa2lNVWuwa97/
 UUNQ==
X-Gm-Message-State: AOAM531UQN8p9h6HFPzFm5uRomxam0Is0u0k3r2a8j1bVfI+dfzyg+U+
 2irZypAmiXRYQV9XttH5UmtK6jTwaGe+td2rHvo=
X-Google-Smtp-Source: ABdhPJzTfFXUedYJkqNhnmDc2V1Hm1A4czYej5pOfm13kmGDdChZ59bZUbBhEi7CGyWZfe2PEzwOqMAIZZj0XsghJWo=
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr348661wrt.132.1601916589672; 
 Mon, 05 Oct 2020 09:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201005092419.15608-1-hdanton@sina.com>
 <20201005140203.GS438822@phenom.ffwll.local>
In-Reply-To: <20201005140203.GS438822@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 Oct 2020 09:49:37 -0700
Message-ID: <CAF6AEGveqvvv9MfBMAr34y9664fPouGjwPrK=v9OLVXv4dHzxg@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
To: Hillf Danton <hdanton@sina.com>, Rob Clark <robdclark@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 7:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 05, 2020 at 05:24:19PM +0800, Hillf Danton wrote:
> >
> > On Sun,  4 Oct 2020 12:21:45
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Now that the inactive_list is protected by mm_lock, and everything
> > > else on per-obj basis is protected by obj->lock, we no longer depend
> > > on struct_mutex.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem.c          |  1 -
> > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
> > >  2 files changed, 55 deletions(-)
> > >
> > [...]
> >
> > > @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> > >  {
> > >     struct msm_drm_private *priv =
> > >             container_of(shrinker, struct msm_drm_private, shrinker);
> > > -   struct drm_device *dev = priv->dev;
> > >     struct msm_gem_object *msm_obj;
> > >     unsigned long freed = 0;
> > > -   bool unlock;
> > > -
> > > -   if (!msm_gem_shrinker_lock(dev, &unlock))
> > > -           return SHRINK_STOP;
> > >
> > >     mutex_lock(&priv->mm_lock);
> >
> > Better if the change in behavior is documented that SHRINK_STOP will
> > no longer be needed.
>
> btw I read through this and noticed you have your own obj lock, plus
> mutex_lock_nested. I strongly recommend to just cut over to dma_resv_lock
> for all object lock needs (soc drivers have been terrible with this
> unfortuntaly), and in the shrinker just use dma_resv_trylock instead of
> trying to play clever games outsmarting lockdep.
>
> I recently wrote an entire blog length rant on why I think
> mutex_lock_nested is too dangerous to be useful:
>
> https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
>
> Not anything about this here, just general comment. The problem extends to
> shmem helpers and all that also having their own locks for everything.

the shrinker lock class has existed for a while.. and is based on the
idea that anything in the get-pages/vmap path cannot happen on a
WONTNEED bo.. although perhaps there should be a few more 'if
(WARN_ON(obj->madv != WILLNEED)) return -EBUSY'..

replacing obj->lock with dma_resv lock, might be a nice cleanup.. but
I think it will be a bit churny..

BR,
-R

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
