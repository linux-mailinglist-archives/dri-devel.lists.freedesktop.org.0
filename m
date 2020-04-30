Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEAD1C04D5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 20:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE336E249;
	Thu, 30 Apr 2020 18:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C425B6E249
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 18:31:07 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id z25so336794otq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMCD+Jo7E8IZbBxHKMYz3Qb/9HJIoY2bae742xpPUjY=;
 b=aua11ZHUyJrWxfH/6aP8CrbZcJDCWjioXF2XxEBLB2ngHWepZw1xBuSZfnzrNfwzta
 xUjumh+rBT00oWNzWYG66IRDKD4J8zWQqYylpHeFPUpc9QvQbSsyHakHoEu+dyjLRUc4
 SFxbpETHruDT3zVej0CEUaXZc0FXxgtLEXrYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMCD+Jo7E8IZbBxHKMYz3Qb/9HJIoY2bae742xpPUjY=;
 b=Hj/W4lK08wSkqBXSA5xaB6An/6ksNinIfNfShZm2Ac7OpNwXzRS91Y+eAAT1RARdRv
 S9bMJKYC3quankEz4br43SzvoChhIQBTmyXKp+t5Or+RRuivYADccFo9MB47ofZknZF+
 jjleDqIvzOeNg9T5o1fgiqYe4BJKengPk9x7tJ2RUUZnyvNOm+ct8R8jRCyG/8Il60TZ
 tf77p0AJ0TWc6Orsw9+/qJpISZJdYGz6T3lx99lmpfwiXkau7mHKFp60kKW9XGs8ptaY
 9hB3aX55auX9XaIsf8ckdvMHSwn92eCvHTmDgT7wMPEBAzLPVisUpUtYOgPMO6opzfLW
 NInQ==
X-Gm-Message-State: AGi0PuZDKj39TgumSyx+VdoBZAGy8ej14TXK2FG86k/Zv0Iw3Zj5FNAk
 2jYpPGblXfZO1TPbXn4hWbBmdgpTDXFgLuhwzJJWFQ==
X-Google-Smtp-Source: APiQypKyYOqC4tEmwwTS7QE+OtDLiAeWnwyyRNPl/roowM0owcKKaIbR2jDNbxulnsFh0+v9ggay3MC+vnWMcWGOKEk=
X-Received: by 2002:a9d:d06:: with SMTP id 6mr405884oti.188.1588271466950;
 Thu, 30 Apr 2020 11:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com>
 <875zdiacv2.fsf@intel.com>
 <CAOw6vbK69aWzti9a7MXNmAfVfJXzzC5g74p4ukSE49MhaV_b3g@mail.gmail.com>
In-Reply-To: <CAOw6vbK69aWzti9a7MXNmAfVfJXzzC5g74p4ukSE49MhaV_b3g@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 30 Apr 2020 20:30:53 +0200
Message-ID: <CAKMK7uEzTn2nKyEaxMcd6602tprwkdnBrmrFYO+_Hi7FY39jAw@mail.gmail.com>
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
To: Sean Paul <seanpaul@chromium.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Michal Orzel <michalorzel.eng@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 5:38 PM Sean Paul <seanpaul@chromium.org> wrote:
>
> On Wed, Apr 29, 2020 at 4:57 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Tue, 28 Apr 2020, Michal Orzel <michalorzel.eng@gmail.com> wrote:
> > > As suggested by the TODO list for the kernel DRM subsystem, replace
> > > the deprecated functions that take/drop modeset locks with new helpers.
> > >
> > > Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> > > index 35c2719..901b078 100644
> > > --- a/drivers/gpu/drm/drm_mode_object.c
> > > +++ b/drivers/gpu/drm/drm_mode_object.c
> > > @@ -402,12 +402,13 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
> > >  {
> > >       struct drm_mode_obj_get_properties *arg = data;
> > >       struct drm_mode_object *obj;
> > > +     struct drm_modeset_acquire_ctx ctx;
> > >       int ret = 0;
> > >
> > >       if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > >               return -EOPNOTSUPP;
> > >
> > > -     drm_modeset_lock_all(dev);
> > > +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> >
> > I cry a little every time I look at the DRM_MODESET_LOCK_ALL_BEGIN and
> > DRM_MODESET_LOCK_ALL_END macros. :(
> >
> > Currently only six users... but there are ~60 calls to
> > drm_modeset_lock_all{,_ctx} that I presume are to be replaced. I wonder
> > if this will come back and haunt us.
> >
>
> What's the alternative? Seems like the options without the macros is
> to use incorrect scope or have a bunch of retry/backoff cargo-cult
> everywhere (and hope the copy source is done correctly).

Yeah Sean & me had a bunch of bikesheds and this is the least worst
option we could come up with. You can't make it a function because of
the control flow. You don't want to open code this because it's tricky
to get right, if all you want is to just grab all locks. But it is
magic hidden behind a macro, which occasionally ends up hurting.
-Daniel

> Sean
>
> > BR,
> > Jani.
> >
> >
> > >
> > >       obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
> > >       if (!obj) {
> > > @@ -427,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
> > >  out_unref:
> > >       drm_mode_object_put(obj);
> > >  out:
> > > -     drm_modeset_unlock_all(dev);
> > > +     DRM_MODESET_LOCK_ALL_END(ctx, ret);
> > >       return ret;
> > >  }
> > >
> > > @@ -449,12 +450,13 @@ static int set_property_legacy(struct drm_mode_object *obj,
> > >  {
> > >       struct drm_device *dev = prop->dev;
> > >       struct drm_mode_object *ref;
> > > +     struct drm_modeset_acquire_ctx ctx;
> > >       int ret = -EINVAL;
> > >
> > >       if (!drm_property_change_valid_get(prop, prop_value, &ref))
> > >               return -EINVAL;
> > >
> > > -     drm_modeset_lock_all(dev);
> > > +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> > >       switch (obj->type) {
> > >       case DRM_MODE_OBJECT_CONNECTOR:
> > >               ret = drm_connector_set_obj_prop(obj, prop, prop_value);
> > > @@ -468,7 +470,7 @@ static int set_property_legacy(struct drm_mode_object *obj,
> > >               break;
> > >       }
> > >       drm_property_change_valid_put(prop, ref);
> > > -     drm_modeset_unlock_all(dev);
> > > +     DRM_MODESET_LOCK_ALL_END(ctx, ret);
> > >
> > >       return ret;
> > >  }
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
