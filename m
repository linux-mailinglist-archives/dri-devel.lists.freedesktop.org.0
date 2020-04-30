Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88401C0087
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 17:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41716E923;
	Thu, 30 Apr 2020 15:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD0F6E922
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 15:38:31 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id di6so3193472qvb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P9HhjXHjgQ2uRdTOdCGFRzrISVJUe9hHihb1s6U+pG0=;
 b=EBCfRCyNsTlDJFaRQRt4ZOByXKwsez2d0WVoOUVj0uyzY2FQjjUArA4Cdr92cMp5yy
 00zTxOzpBt6C0OXx4Ubu0BX+XEnhoymU29QAZiSeYC1TaiquQ6Guo8m/i8tGqEPIt2Yt
 upoTJJeeNPy2dAk4ETUD4kl9Dplk18J7ntJnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9HhjXHjgQ2uRdTOdCGFRzrISVJUe9hHihb1s6U+pG0=;
 b=QAMNsm8m6sM+a/Db0z2jY73TPdcyS/Q/XG8aof1hG1NOWyjGg0rRIMuzjJexiQgWB8
 8KZlAiQfiJ5Jhi0TuDFhDYckokXgmnfro+AWfWnaerlYqGyrIiwg91g8wN11nBLtNseY
 g7UnG1tpIcJC/xebN85aZ7S68IlYTXXNKMSubJyD4H7pXCk9vTBbKvStdjfIvhjch9Cv
 baXZ3WjTzwdrRC3lCYMTRslcNgWhVOLGJVG5bwG6abYNK0g8OXnz1RszCV9ivD0L5h6A
 XIEA4IPJIJYUuOaQzuVABw6J37CmmA1pJK0wEfIyLkDE/qEB+9p9HxbKCSXo//020FRY
 eAGw==
X-Gm-Message-State: AGi0PuYr9oAe4RsEcGYDYWLMlky/uzHqDMttS+/FCiEca0FmBKv35J81
 YHAv+YL5GW4rItoZTh56EyB5B/donlE=
X-Google-Smtp-Source: APiQypIlHgELMg3gI6v8wQcgLZ1t1xfv/i44Um2VWReKXr/8xTiog9B7j+zOe7rf9zL2+m4PdVUC4Q==
X-Received: by 2002:a05:6214:9ce:: with SMTP id
 dp14mr3707262qvb.142.1588261109848; 
 Thu, 30 Apr 2020 08:38:29 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id g133sm246102qke.73.2020.04.30.08.38.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 08:38:28 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id o139so3392499ybc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:38:27 -0700 (PDT)
X-Received: by 2002:a5b:483:: with SMTP id n3mr6464401ybp.519.1588261107424;
 Thu, 30 Apr 2020 08:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com>
 <875zdiacv2.fsf@intel.com>
In-Reply-To: <875zdiacv2.fsf@intel.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 30 Apr 2020 11:37:49 -0400
X-Gmail-Original-Message-ID: <CAOw6vbK69aWzti9a7MXNmAfVfJXzzC5g74p4ukSE49MhaV_b3g@mail.gmail.com>
Message-ID: <CAOw6vbK69aWzti9a7MXNmAfVfJXzzC5g74p4ukSE49MhaV_b3g@mail.gmail.com>
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: tzimmermann@suse.de, Dave Airlie <airlied@linux.ie>,
 Michal Orzel <michalorzel.eng@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 4:57 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Tue, 28 Apr 2020, Michal Orzel <michalorzel.eng@gmail.com> wrote:
> > As suggested by the TODO list for the kernel DRM subsystem, replace
> > the deprecated functions that take/drop modeset locks with new helpers.
> >
> > Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> > index 35c2719..901b078 100644
> > --- a/drivers/gpu/drm/drm_mode_object.c
> > +++ b/drivers/gpu/drm/drm_mode_object.c
> > @@ -402,12 +402,13 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
> >  {
> >       struct drm_mode_obj_get_properties *arg = data;
> >       struct drm_mode_object *obj;
> > +     struct drm_modeset_acquire_ctx ctx;
> >       int ret = 0;
> >
> >       if (!drm_core_check_feature(dev, DRIVER_MODESET))
> >               return -EOPNOTSUPP;
> >
> > -     drm_modeset_lock_all(dev);
> > +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>
> I cry a little every time I look at the DRM_MODESET_LOCK_ALL_BEGIN and
> DRM_MODESET_LOCK_ALL_END macros. :(
>
> Currently only six users... but there are ~60 calls to
> drm_modeset_lock_all{,_ctx} that I presume are to be replaced. I wonder
> if this will come back and haunt us.
>

What's the alternative? Seems like the options without the macros is
to use incorrect scope or have a bunch of retry/backoff cargo-cult
everywhere (and hope the copy source is done correctly).

Sean

> BR,
> Jani.
>
>
> >
> >       obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
> >       if (!obj) {
> > @@ -427,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
> >  out_unref:
> >       drm_mode_object_put(obj);
> >  out:
> > -     drm_modeset_unlock_all(dev);
> > +     DRM_MODESET_LOCK_ALL_END(ctx, ret);
> >       return ret;
> >  }
> >
> > @@ -449,12 +450,13 @@ static int set_property_legacy(struct drm_mode_object *obj,
> >  {
> >       struct drm_device *dev = prop->dev;
> >       struct drm_mode_object *ref;
> > +     struct drm_modeset_acquire_ctx ctx;
> >       int ret = -EINVAL;
> >
> >       if (!drm_property_change_valid_get(prop, prop_value, &ref))
> >               return -EINVAL;
> >
> > -     drm_modeset_lock_all(dev);
> > +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> >       switch (obj->type) {
> >       case DRM_MODE_OBJECT_CONNECTOR:
> >               ret = drm_connector_set_obj_prop(obj, prop, prop_value);
> > @@ -468,7 +470,7 @@ static int set_property_legacy(struct drm_mode_object *obj,
> >               break;
> >       }
> >       drm_property_change_valid_put(prop, ref);
> > -     drm_modeset_unlock_all(dev);
> > +     DRM_MODESET_LOCK_ALL_END(ctx, ret);
> >
> >       return ret;
> >  }
>
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
