Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE3B2F1B9C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0089D61;
	Mon, 11 Jan 2021 16:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CEF89D5F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:58:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so495004wrc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4FqdUl+82w6WQ3AgKtaR9Ms7/D3PccxuSOkwBbIHSfQ=;
 b=gLQy7sdd++mPhIh7HsdZgDZ44VQV66IhNyV451vLAxIg3dfS1nbu5hONh7WShiRdt6
 hxqD7CVEtKcgBfagdN7Uu6VJjJvp3A+a6+CDvRuYPIMC32E6l2xL/idb0BPgfBKcYFn2
 IJsVDrwX/LtG9DxNZcwhZnO+ZAo6lap5GsSwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4FqdUl+82w6WQ3AgKtaR9Ms7/D3PccxuSOkwBbIHSfQ=;
 b=V4dN44HFulKPqvd95Ku3n7gZS7bW2EmhbKyJZr4z9ZRHHfuRJ1PzbET+d9kGaGzcmj
 BkWUFg6l3wNluax+Gf6OpjYgDuHLFG5cR9zQWCCO+mwPAPUVtNx0SHpL0B2E4OC6obt2
 fbJjoiSwL4UPB/OYUkm3YGzlHOpBK8/araGSOOOFODFjfvAsdNZsa1jwAbok9FXQVbIb
 LeqO6dYeW8vMyRV0pI+hh+mr8iAEqCdyAGUBOxO0tohGEJNSsSWZ8eDEJYfELDccfNeW
 m2C8D5zSpHUTrScTQPDtqFscufd2EJzSmynajRqjrxsHXEXs/B3sDlM3a6BmcYmUCD8E
 wHSg==
X-Gm-Message-State: AOAM530RyAA/GvnRlveAvfKGD6Yy1JLt5KiWujeLdTIIcnbZzXWpJ4oG
 +RS9ik9jlkvS2CjpBVFvpf6mRQ==
X-Google-Smtp-Source: ABdhPJzUUtudaQHIkwtOF8q9nDHaJ26/sAlo6U/GtHff2RUsJVajVjlbhR+QS23CmuIMHVZP8Twt1Q==
X-Received: by 2002:adf:e406:: with SMTP id g6mr44798wrm.255.1610384296005;
 Mon, 11 Jan 2021 08:58:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p15sm296486wrt.15.2021.01.11.08.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 08:58:15 -0800 (PST)
Date: Mon, 11 Jan 2021 17:58:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 05/13] drm/mgag200: Use drm_gem_shmem_vmap_local() in
 damage handling
Message-ID: <X/yDpZbtRhe2YlCp@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-6-tzimmermann@suse.de>
 <X/yClQZQ0B5AMfEP@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/yClQZQ0B5AMfEP@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 airlied@redhat.com, virtualization@lists.linux-foundation.org, sean@poorly.run,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 05:53:41PM +0100, Daniel Vetter wrote:
> On Fri, Jan 08, 2021 at 10:43:32AM +0100, Thomas Zimmermann wrote:
> > Damage handling in mgag200 requires a short-term mapping of the source
> > BO. Use drm_gem_shmem_vmap_local().
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

On second thought, strike that r-b, I have a confused question.
> 
> > ---
> >  drivers/gpu/drm/mgag200/mgag200_mode.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > index 1dfc42170059..a33e28d4c5e9 100644
> > --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> > +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > @@ -1552,22 +1552,32 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
> >  		      struct drm_rect *clip)
> >  {
> >  	struct drm_device *dev = &mdev->base;
> > +	struct drm_gem_object *obj = fb->obj[0];
> >  	struct dma_buf_map map;
> >  	void *vmap;
> >  	int ret;
> >  
> > -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> > +	ret = dma_resv_lock(obj->resv, NULL);
> >  	if (drm_WARN_ON(dev, ret))
> > -		return; /* BUG: SHMEM BO should always be vmapped */
> > +		return;
> > +	ret = drm_gem_shmem_vmap_local(obj, &map);
> > +	if (drm_WARN_ON(dev, ret))
> > +		goto err_dma_resv_unlock; /* BUG: SHMEM BO should always be vmapped */

Why is this guaranteed? I tried to hunt for a vmap in mga200g code, and
dind't find any. I'd ahve expected something in prepare/finish_fb.

Also since this is not a vram-helper using driver, why convert it over to
vmap_local? I guess that should also be explained in the commit message a
bit better.
-Daniel

> >  	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
> >  
> >  	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
> >  
> > -	drm_gem_shmem_vunmap(fb->obj[0], &map);
> > +	drm_gem_shmem_vunmap_local(obj, &map);
> > +	dma_resv_unlock(obj->resv);
> >  
> >  	/* Always scanout image at VRAM offset 0 */
> >  	mgag200_set_startadd(mdev, (u32)0);
> >  	mgag200_set_offset(mdev, fb);
> > +
> > +	return;
> > +
> > +err_dma_resv_unlock:
> > +	dma_resv_unlock(obj->resv);
> >  }
> >  
> >  static void
> > -- 
> > 2.29.2
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
