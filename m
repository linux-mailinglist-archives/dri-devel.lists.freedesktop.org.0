Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A405B1D6CF5
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 22:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8076E12D;
	Sun, 17 May 2020 20:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA0E6E12D
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 20:50:57 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id 62so4388590vsi.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+opHELFn+vfx8V02zWeG3vM5gyR2OnHH3uBql5RxzSI=;
 b=MGWvQRvrBwsvLpJHVnfw+r3MKWLQtaT+DT5NHLZnjGdVooeXac2QO5pdHCAbf/DPX8
 gL0FJM2ZtBIPwFnYNCuY13hmGcUQYgnhcwS/bD8Tr8kIhU98uvTmIqDlCjMG2R8bE7O3
 /TJuVrMU78Sg5yF3WewUqNv9PS+vj2iTw1AfkU9t7DcTbqnK/PrNlNdHySASoamRa8qh
 0OlRSd98opmtKy7ciFX63n+tn33S8kOxL3c8V7oTD7KnQfe8YOkUh0byiVhHrF93ob6T
 pkKJ/zBR5+OW6nrax/OdDv2fqVhK436pj1Ml3sj6gg6z/UXbDpG5IH3PU+82FCAvtrl9
 nAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+opHELFn+vfx8V02zWeG3vM5gyR2OnHH3uBql5RxzSI=;
 b=AzqJgkMOPoNmDP9Ogn/5AlJ4uIrsEwdCxyo2Lxpo1juD2ljdjmSEA2T+kaz7/cIcRB
 76d+dWCAYyTpy3ui2qTz4hJ5cvu+aZg+6Ao+ppIb3oyYRJrsBPAM20ErQh//+WcyUOz7
 S6Aqd7W6Ef9mhfzc2pQu+SZpu/ug2RSacdYRlAOTeyCTjPT6WlCjZ0WRnu5oDJ71BZSS
 R2a1seHxTZc+XSjoVJgyVBGj0d7pksKJPcGMyuWhHPwl9pZpFUioSm14mF1NVOeYqNUM
 yMI/faGrHeKWdSBOCWdT+hPzyfWmqpEp/YUGhVedKPcxjryWOlYsVjQmoe/N4xz39WOH
 0eoA==
X-Gm-Message-State: AOAM533gcZpSl00GKA0CklrOeiJx87T2otgyvzJxlSDmlwmcUGsUtJML
 2HO5iEuKSxeBbj36OxKrF8X5OvzaRHTjvuuPRqs=
X-Google-Smtp-Source: ABdhPJxLljBrW3SPkAM7Dzl/UVINzVBj3BJ+iqyiI4+cpRbNsuLsJwrFLCN3/hSzrEQlkbmAsqXefvxQE50haM1QaOQ=
X-Received: by 2002:a67:ecc2:: with SMTP id i2mr8459795vsp.85.1589748657109;
 Sun, 17 May 2020 13:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200320132334.GC95012@mwanda>
 <CACvgo51xwgF2hJPOESWGpJ16WittQSVixdd+62KwFsZaHO-Dpg@mail.gmail.com>
 <20200323121333.GF26299@kadam>
In-Reply-To: <20200323121333.GF26299@kadam>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 17 May 2020 21:48:08 +0100
Message-ID: <CACvgo53Xbc7prbQrcSXwQtTffFo2gYO7O=yK=zaWA6dj-_bEzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gem: Fix a leak in drm_gem_objects_lookup()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Mar 2020 at 12:13, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Mar 23, 2020 at 11:13:22AM +0000, Emil Velikov wrote:
> > Hi Dan,
> >
> > On Fri, 20 Mar 2020 at 13:23, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > If the "handles" allocation or the copy_from_user() fails then we leak
> > > "objs".  It's supposed to be freed in panfrost_job_cleanup().
> > >
> > > Fixes: c117aa4d8701 ("drm: Add a drm_gem_objects_lookup helper")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/gpu/drm/drm_gem.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > index a9e4a610445a..f28724f2eb69 100644
> > > --- a/drivers/gpu/drm/drm_gem.c
> > > +++ b/drivers/gpu/drm/drm_gem.c
> > > @@ -710,6 +710,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> > >         if (!objs)
> > >                 return -ENOMEM;
> > >
> > > +       *objs_out = objs;
> > > +
> > >         handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
> > >         if (!handles) {
> > >                 ret = -ENOMEM;
> > > @@ -723,8 +725,6 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> > >         }
> > >
> > >         ret = objects_lookup(filp, handles, count, objs);
> > > -       *objs_out = objs;
> > > -
> > >  out:
> > >         kvfree(handles);
> > >         return ret;
> >
> > It seems that this will return error to the caller, mangle the output
> > pointer and effectively still leak the objs.
>
> The patch works.
>
> This is "one function frees everything" style error handling.  It gets
> passed back to panfrost_ioctl_submit() which calls panfrost_job_put()
> which calls panfrost_job_cleanup() which frees it.
>
> It's a horrible way to do error handling but this was the only actual
> bug I could see with the approach.
>
> > Better option IMHO is to:
> > - move the __user/copy_from_user into the caller
> > Removes a silly kvmalloc_array(1,...) in ~90+ users and drops the "out" label.
> > Extra bonus, this is the only instance in drm_gem with __user -
> > consistency is nice.
> > - add "err" or similar label, where the objs is freed before returning an error.
>
> Those sound like good ideas.  Also we could use kvcalloc() instead of
> kvmalloc_array() with __GFP_ZERO.  But it's too much for me to do...
> I'm mostly focused on static analysis warnings.
>
Your patch addresses the issue with the smallest diffstat, so I've
pushed it to drm-misc-next.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
