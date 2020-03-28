Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41AD1969B9
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 23:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1E56E05A;
	Sat, 28 Mar 2020 22:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EE96E05A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 22:02:38 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id a49so13848841otc.11
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=isVtdDuL+ZC2JRMHdxAHdfV8aIeJjVzf0LpDESpJMO0=;
 b=b2HRxBs8m8MBI5G5rZeZx3VkI0SXj6/y6VeNJu6Rn6IG7o6b2oLt1i8/3eSbcv1qN5
 cHE4lHnZa85p+ewNoKYeVFsixKEegiSGtl+p57Olt5mvRJVbe6+kfL+ihJMpS1y5X/Jr
 OXi1QW623vICe0d54sTfRP4a3qy1lAg1+PFH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=isVtdDuL+ZC2JRMHdxAHdfV8aIeJjVzf0LpDESpJMO0=;
 b=OO0t0hTXybBgaPWLqM8/mO6oK7+9bSoVRHuLBfKwgrWFS5Zp9tZ3i+se+n7jfqckNZ
 ZV17Pqh2MJ6EFndc2+xO1mBAhn/1SJKaqUFeor1GiWcF1oCuGjLrIcn+fvnkRv9cUfVm
 lLtDfr+xPwEJ5joGEWSYncnxe5KNlDf15pmyznuieXWPKSjaPc3ZrNgez1yPrNO/m5Um
 y0f1OP6muwqUHo9Z65h8vf8VE3RQ/vfQjpSuLNPAr+HYf1wJZvktRmisMm+XV/4/SIvO
 mgqM6eYepZH/uJpW7P9sS8H9YbiwZLvw5bQ0t8O7Dch+rfxiGRaszRSkMR+ZxXQOpGGk
 9yoA==
X-Gm-Message-State: ANhLgQ2VlbWp52dOo6BrPWK2knWQOdVcHVOgjXTE8gHJJl+GFHTrrj/1
 qZR0ZxhFbt+/h+C/mU814w2/+MQkOujdOn2L+g+1hlUv
X-Google-Smtp-Source: ADFU+vtm/G35Ca0yCXqhBk9vyeYAcdK5CzKIzl1sq2rQzReBewQD9UWi/fyAosKi43RQJWwgId0AtlsuowZDEXE5XHQ=
X-Received: by 2002:a4a:4190:: with SMTP id x138mr4630675ooa.35.1585432958047; 
 Sat, 28 Mar 2020 15:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200328162358.18500-1-daniel.vetter@ffwll.ch>
 <20200328184942.GA28087@ravnborg.org>
In-Reply-To: <20200328184942.GA28087@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 28 Mar 2020 23:02:26 +0100
Message-ID: <CAKMK7uHjD-wc3qR6h76u+CSJVGC_cJktfwyQDs9Jrt4C3JU3ag@mail.gmail.com>
Subject: Re: [PATCH] drm/managed: Fix off-by-one in warning
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: kernel test robot <lkp@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 7:49 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel.
>
> On Sat, Mar 28, 2020 at 05:23:58PM +0100, Daniel Vetter wrote:
> > I'm thinking this is the warning that fired in the 0day report, but I
> > can't double-check yet since 0day didn't upload its source tree
> > anywhere I can check. And all the drivers I can easily test don't use
> > drm_dev_alloc anymore ...
> >
> > Also if I'm correct supreme amounts of bad luck because usually kslap
> > (for bigger structures) gives us something quite a bit bigger than
> > what we asked for.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: c6603c740e0e ("drm: add managed resources tied to drm_device")
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_managed.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > index 4955241ceb4c..9cebfe370a65 100644
> > --- a/drivers/gpu/drm/drm_managed.c
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -139,8 +139,7 @@ void drmm_add_final_kfree(struct drm_device *dev, void *container)
> >  {
> >       WARN_ON(dev->managed.final_kfree);
> >       WARN_ON(dev < (struct drm_device *) container);
> > -     WARN_ON(dev + 1 >=
> > -             (struct drm_device *) (container + ksize(container)));
> > +     WARN_ON(dev + 1 > (struct drm_device *) (container + ksize(container)));
>
> I do not think this is the right fix...
> The original code would trigger if
> 1) the container only had a drm_device - and nothing else
> 2) and the allocated size was the same

Yup, which apparently happens for all the drivers calling
drm_dev_alloc(). At least on the unlucky architecture that 0day tested
on (or build settings, or whatever). The issue was hit with drm/bochs,
which is still using drm_dev_alloc (like most older-ish drivers).

> And the modification will now allow for a container with the exact size
> of drm_device.
>
> I checked all users in my tree - no-one only had a drm_device.
> The minimum was one extra pointer.
>
> Another thing that could trigger the warning was if any users
> did not specify a pointer to memory allocated by k(z)alloc()
> But I could not find any.
>
> tiny/st7735r.c looked suspisius, but I think it is also OK,
> because struct st7735r_priv is allocated, but the poitner specified in
> st7735r_priv.dbidev. But dbidev is the first field - so OK.
>
> So no better clue...

Yeah all the drivers using drm_dev_init with embedded drm_device wont hit this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
