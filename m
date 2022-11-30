Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF063D454
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C3210E44E;
	Wed, 30 Nov 2022 11:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7556A10E44E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:21:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id bg10so40738wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RuSCu6Sc5O77Oj3wELaaUy6VtrciSxnoo8y2CPFyY+U=;
 b=M5OU+UwmCE1dEQUm9MGdXnRpdzmbCWLfqjalSYP23MuqwTZ9RwFy/pfMOsPhuvK6s3
 RiK7JxFxDC/TRdJDjog5UlAx3+QHvvk+4eHlFtUCvbrEYR1WO7WCBR59V08EJk4u9QnO
 N8B08dkiBlp3ZJc8e7cHv8OxsGRBeXy47Ce3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RuSCu6Sc5O77Oj3wELaaUy6VtrciSxnoo8y2CPFyY+U=;
 b=FuhoVK4nymt+Um6/vD4zENG5kt9SjjA7NrR2kg4pWjyvhQ7Q4maN+cc+0aAjUUetNu
 ptElTljHQtTEVx/webEbLRrSCll9fUbfD/K1Sz+fLcB5fWliU4BxzHFt6PTq7+uMkcpI
 ME7VLK8lxQtVFqNfKGONhLARd2QA7GuoVQMG5Gjnn7oXrNslOmqwCF90Fk5JQJQdpkrV
 8b+kHfWCo86baZdMffbp054x3V05jWhZh9QqCFoy8ESowAH42xztVZebwS2TbCnPCMiu
 MZrtoUBlKygWhwIox42xqBnLVotpke9PO+bT0MKPwC8y49Bcbl8YiV9I+/PilaiYSrjl
 y2AQ==
X-Gm-Message-State: ANoB5pnUtpttKqZWNlDXy4g4nmEz3LEltDbzcLKthPLEu0dXMdsWmK2I
 KWRPdMhv3t7UsEj79JBV7IeGqQ==
X-Google-Smtp-Source: AA0mqf7Y6ivv5bQ1OH3MnYDxUtlCUbzKEC1tIMe0iHw9hdRx5C5HeGZP24b3Lywyd5EKm1ITulLBpg==
X-Received: by 2002:a05:600c:2241:b0:3cf:9ced:dce4 with SMTP id
 a1-20020a05600c224100b003cf9ceddce4mr43768262wmm.120.1669807281946; 
 Wed, 30 Nov 2022 03:21:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c154b00b003c6f3e5ba42sm5960234wmg.46.2022.11.30.03.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:21:21 -0800 (PST)
Date: Wed, 30 Nov 2022 12:21:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [2/2] drm/shmem-helper: Avoid vm_open error paths
Message-ID: <Y4c8r0fxjI+WsvhM@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221129200242.298120-3-robdclark@gmail.com>
 <20221129203205.GA2132357@roeck-us.net>
 <CAF6AEGuK4jv25cQ4p-rrytx9Qn4JZdRRfkVJn9T3nf7vJmG5VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuK4jv25cQ4p-rrytx9Qn4JZdRRfkVJn9T3nf7vJmG5VQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 12:47:42PM -0800, Rob Clark wrote:
> On Tue, Nov 29, 2022 at 12:32 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Tue, Nov 29, 2022 at 12:02:42PM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > vm_open() is not allowed to fail.  Fortunately we are guaranteed that
> > > the pages are already pinned, and only need to increment the refcnt.  So
> > > just increment it directly.
> >
> > I don't know anything about drm or gem, but I am wondering _how_
> > this would be guaranteed. Would it be through the pin function ?
> > Just wondering, because that function does not seem to be mandatory.
> 
> We've pinned the pages already in mmap.. vm->open() is perhaps not the
> best name for the callback function, but it is called for copying an
> existing vma into a new process (and for some other cases which do not
> apply here because VM_DONTEXPAND).
> 
> (Other drivers pin pages in the fault handler, where there is actually
> potential to return an error, but that change was a bit more like
> re-writing shmem helper ;-))

Yhea vm_ops->open should really be called vm_ops->dupe or ->copy or
something like that ...
-Daniel

> 
> BR,
> -R
> 
> > >
> > > Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > index 110a9eac2af8..9885ba64127f 100644
> > > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > @@ -571,12 +571,20 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
> > >  {
> > >       struct drm_gem_object *obj = vma->vm_private_data;
> > >       struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> > > -     int ret;
> > >
> > >       WARN_ON(shmem->base.import_attach);
> > >
> > > -     ret = drm_gem_shmem_get_pages(shmem);
> > > -     WARN_ON_ONCE(ret != 0);
> > > +     mutex_lock(&shmem->pages_lock);
> > > +
> > > +     /*
> > > +      * We should have already pinned the pages, vm_open() just grabs
> >
> > should or guaranteed ? This sounds a bit weaker than the commit
> > description.
> >
> > > +      * an additional reference for the new mm the vma is getting
> > > +      * copied into.
> > > +      */
> > > +     WARN_ON_ONCE(!shmem->pages_use_count);
> > > +
> > > +     shmem->pages_use_count++;
> > > +     mutex_unlock(&shmem->pages_lock);
> >
> > The previous code, in that situation, would not increment pages_use_count,
> > and it would not set not set shmem->pages. Hopefully, it would not try to
> > do anything with the pages it was unable to get. The new code assumes that
> > shmem->pages is valid even if pages_use_count is 0, while at the same time
> > taking into account that this can possibly happen (or the WARN_ON_ONCE
> > would not be needed).
> >
> > Again, I don't know anything about gem and drm, but it seems to me that
> > there might now be a severe problem later on if the WARN_ON_ONCE()
> > ever triggers.
> >
> > Thanks,
> > Guenter
> >
> > >
> > >       drm_gem_vm_open(vma);
> > >  }

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
