Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC61ED00D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 14:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380B289AA7;
	Wed,  3 Jun 2020 12:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA7989AA7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 12:46:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p5so2192234wrw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1dezsFrAXgQRUAbtXd/hJtP7u21s0pQo3uaV+ZSVkq8=;
 b=a3Badg6H297rkPRUu85C7NekyP85uPbUUYCvla+11fA6tY+0ETeq5kIhf76cla91VX
 6/wXhaWqDbECuDFzSyo7feKnVRLVxeCbwr76IpqTige1zr3RwszH/8rs3l5bxcCf5SkS
 k23uYnUcH0tYgE2PHnt+qeZGAUeWjVXzWb7L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1dezsFrAXgQRUAbtXd/hJtP7u21s0pQo3uaV+ZSVkq8=;
 b=S+7BL3zdwWi3aYgaz4/GV+5lztJPzWAsDkVe5cbJjqOdpT37Xk5qMTVU5P6Mddkw/W
 HDgQTitwy+hQY1XWY5ll0XNhggLavco/AIdb6bhHb8Qfu4SGPlhPTKgHQ/VDtzb8erW8
 LEbhs1B/Pbz0h/C6x5kbAPxaT5f/26R+j4RHd5Weu9XglWDlHDOM/alwucImoLRauzOY
 E/1UwNjE4ySy6AW+h13IkB/SHTRMy/q8e94AqdKH2bJqNjmdXkVEf47p5H+8vvUSTy4t
 bxJfGeFDXlfKi0UP+iHPYsYJF9qfvJQsz5Ol2sytqvWf9SgrnH6d5GlCwwawuqN7z9kk
 kIXQ==
X-Gm-Message-State: AOAM531c5qcU7GIINvY15KC32dvCYmjpfOPzn8C1FPtd9ydEszcJlafF
 1DIPi7R+GkOknsviVDfnrw7tUg==
X-Google-Smtp-Source: ABdhPJwqNZ2+TYHPjG3wKm9X3fQYrXyzJyZ0YxRk8JXA+4aip8pXwNCddmeftejCdxfMEayVg3qCFg==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr29147968wrv.389.1591188369746; 
 Wed, 03 Jun 2020 05:46:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l5sm2665527wml.27.2020.06.03.05.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 05:46:08 -0700 (PDT)
Date: Wed, 3 Jun 2020 14:46:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: Don't call dma_buf_vunmap without _vmap
Message-ID: <20200603124606.GL20149@phenom.ffwll.local>
References: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
 <20200514201117.465146-1-daniel.vetter@ffwll.ch>
 <CAF6AEGskgFyDxX+MWF84Z53ATmVd3972py88Og=aLQFV0d7UPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGskgFyDxX+MWF84Z53ATmVd3972py88Og=aLQFV0d7UPQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 31, 2020 at 09:02:11AM -0700, Rob Clark wrote:
> On Thu, May 14, 2020 at 1:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > I honestly don't exactly understand what's going on here, but the
> > current code is wrong for sure: It calls dma_buf_vunmap without ever
> > calling dma_buf_vmap.
> >
> > What I'm not sure about is whether the WARN_ON is correct:
> > - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
> >   a pretty neat layering violation of how you shouldn't peek behind
> >   the curtain of the dma-buf exporter, but par for course. Note that
> >   all the nice new helpers don't (and we should probably have a bit a
> >   warning about this in the kerneldoc).
> >
> > - but then in the get_vaddr() in msm_gem.c, we seems to happily wrap a
> >   vmap() around any object with ->pages set (so including imported
> >   dma-buf).
> >
> > - I'm not seeing any guarantees that userspace can't use an imported
> >   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
> >   guarantees that an imported dma-buf won't end up with a ->vaddr set.
> >
> > But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> > calling dma_buf_vunmap is the wrong thing to do.
> >
> > v2: Rob said in review that we do indeed have a gap in get_vaddr() that
> > needs to be plugged. But the users I've found aren't legit users on
> > imported dma-buf, so we can just reject that.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Queued in drm-misc-next for 5.9, thanks for your review.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index 5a6a79fbc9d6..e70abd1cde43 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -554,6 +554,9 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
> >         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> >         int ret = 0;
> >
> > +       if (obj->import_attach)
> > +               return ERR_PTR(-ENODEV);
> > +
> >         mutex_lock(&msm_obj->lock);
> >
> >         if (WARN_ON(msm_obj->madv > madv)) {
> > @@ -907,8 +910,7 @@ static void free_object(struct msm_gem_object *msm_obj)
> >         put_iova(obj);
> >
> >         if (obj->import_attach) {
> > -               if (msm_obj->vaddr)
> > -                       dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> > +               WARN_ON(msm_obj->vaddr);
> >
> >                 /* Don't drop the pages for imported dmabuf, as they are not
> >                  * ours, just free the array we allocated:
> > --
> > 2.26.2
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
