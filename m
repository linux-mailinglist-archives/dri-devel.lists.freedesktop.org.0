Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130803AAEEA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 10:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434806E8BD;
	Thu, 17 Jun 2021 08:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6846E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 08:38:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z8so5736327wrp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=niCJQ3H8AiHapfvyh3qbwW9BZG651eP8Po7X5NizSRs=;
 b=jp0Mzj9zmTwFtVCASubVR/oVj32rfOuUhACHWfrgCM89xghuMfAYFlEMTD+NJB4p7C
 5HQ8wYsmYKgvHGKa+OAXfWs7Z31qzkuzZhf2DC7hCB+l/a3pqAUKblQAJwajUCxhS8hC
 +XKkEh8dPH2iP+LT64GSyehgfV4L9Q9rT45J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=niCJQ3H8AiHapfvyh3qbwW9BZG651eP8Po7X5NizSRs=;
 b=TFEI3SR/9fKfcfC3ZiGUbunyqX4yk5CVvxLXHiMHDKEP6bpoOZ4io8OIGBedR7cA5H
 x4pehEyY10bPvKqkUg3T0tRUVcUE0DoodbnEUoA7Fg1kvayCxGBzbp/HNEDtysmxazqn
 yZeDZ2/EwrGhqmVWDkDCUC7P/2dD4EZLxLE3XTvCCC222v7UH7yLv2i1b3VwyyEqtyNl
 0KuJ/ZYevjFlk67M6pzYhLSSY7lRmz6Oh63uv3Xsy64i5kjTHuD0Pb47pa3Qnfq0RlCB
 Rgfzg6RyY6yAh97WWvT2fK6bvZCgndamNEQyRbJX7sPGaKCwIi9CVlESnFAf1nfdE1Zg
 bVAA==
X-Gm-Message-State: AOAM531qXizj8TEWVbrsHS/lkCyvGVqkLjm5iVLYw3cJf5ujghoyd2zg
 Me9sECbDfGYGC44UTxsbCG0lfQ==
X-Google-Smtp-Source: ABdhPJzq2dDQkQHFt47tYXkGJs+DBPqLWvkeegznk76cvDOsSLU/YJURuRP+fIgCcSVnFNQfHQ/VIQ==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr4211251wri.263.1623919134514; 
 Thu, 17 Jun 2021 01:38:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s7sm4504849wru.67.2021.06.17.01.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 01:38:54 -0700 (PDT)
Date: Thu, 17 Jun 2021 10:38:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Remove duplicated call to
 ops->pread
Message-ID: <YMsKHLshWwakmUAR@phenom.ffwll.local>
References: <20210616090350.828696-1-daniel.vetter@ffwll.ch>
 <CAM0jSHMTc6o5M=xbYJDoR0NWpEthOcHMSB=Pb4dHnV9gdDj9eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0jSHMTc6o5M=xbYJDoR0NWpEthOcHMSB=Pb4dHnV9gdDj9eA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 11:45:28AM +0100, Matthew Auld wrote:
> On Wed, 16 Jun 2021 at 10:04, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Between
> >
> > commit ae30af84edb5b7cc95485922e43afd909a892e1b
> > Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Date:   Tue Mar 23 16:50:00 2021 +0100
> >
> >     drm/i915: Disable userptr pread/pwrite support.
> >
> > and
> >
> > commit 0049b688459b846f819b6e51c24cd0781fcfde41
> > Author: Matthew Auld <matthew.auld@intel.com>
> > Date:   Thu Nov 5 15:49:33 2020 +0000
> >
> >     drm/i915/gem: Allow backends to override pread implementation
> >
> > this accidentally landed twice.
> >
> > Cc: Matthew Auld <matthew.auld@intel.com
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com

Pushed to drm-intel-gt-next, thanks for your review.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/i915/i915_gem.c | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> > index 6a0a3f0e36e1..07aa80773a02 100644
> > --- a/drivers/gpu/drm/i915/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/i915_gem.c
> > @@ -469,12 +469,6 @@ i915_gem_pread_ioctl(struct drm_device *dev, void *data,
> >         if (ret != -ENODEV)
> >                 goto out;
> >
> > -       ret = -ENODEV;
> > -       if (obj->ops->pread)
> > -               ret = obj->ops->pread(obj, args);
> > -       if (ret != -ENODEV)
> > -               goto out;
> > -
> >         ret = i915_gem_object_wait(obj,
> >                                    I915_WAIT_INTERRUPTIBLE,
> >                                    MAX_SCHEDULE_TIMEOUT);
> > --
> > 2.32.0.rc2
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
