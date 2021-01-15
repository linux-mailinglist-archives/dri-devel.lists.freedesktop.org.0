Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7352F7DCB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 15:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C776E40D;
	Fri, 15 Jan 2021 14:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF20F6E40D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:11:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id h17so7291927wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 06:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BEKoTjwSfW1RfMzVCA9mjqDjw1KHoBWvacz8G0lbnIc=;
 b=FqpkZEfSXPDJ2q+0eV/KMhuxiuxky/KpQzUjQRDU232VAJB3mc32ZVls04itzlWGcc
 dCgv3vg6mEjRKF/HY3J/GWBDuZYpiQ2G8nX5LWIU624mTw2RtA9yCE+ZN0UQzWI/aTUd
 v5EVuU9bOlU3eYWJQhhHTeEInxyTIFGcWoe1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BEKoTjwSfW1RfMzVCA9mjqDjw1KHoBWvacz8G0lbnIc=;
 b=tbTDvZo9vKyDDzgObG1s88LixuHJrQ+SQlAnLQzwNwfSh1pzr/8nl6k+wukGwqp5tA
 1g3XzHmFXfmMHg/8A2kz7krILTCWRuZKkekKN15lc3LVLcXWSdM85eMVOYSVrmiQ8XAi
 eci98Rzkj0diBAx+eE6jM4NtPCXskAV3COsxBgesPSkargFaU6Nm26oiInt3AhY9xDKV
 Jh82jcuy3De/w+oxagKlU947qGfxUZIUl0j7KyEQZrKJj7fQzAb+Mb/2S/1OnbwUvoAC
 /8xeiCEnI0wO52SlKtwH8RNFeOQezjkN1M7lpUt7gUcf4xM4UaimHLZ+p2BUsVD90bmC
 xMBg==
X-Gm-Message-State: AOAM532aFa0N5V07nnFh0lnx2kT5BkG8on629nVVbRAAEN14ViqDbiTZ
 Sm6949oQgXQEru1vj7OkVbWQzA==
X-Google-Smtp-Source: ABdhPJw2MbxDuSfA/1xs0ER/zwL9JUJZhRyQi2y95APjrM9B4VNIF43/5UMkcUsqyjXbp2AubU+0vQ==
X-Received: by 2002:a1c:6383:: with SMTP id x125mr3772398wmb.58.1610719886386; 
 Fri, 15 Jan 2021 06:11:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s6sm14716380wro.79.2021.01.15.06.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:11:25 -0800 (PST)
Date: Fri, 15 Jan 2021 15:11:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] drm: Set vm_ops to GEM object's values during mmap
Message-ID: <YAGii4JitMpYr7iP@phenom.ffwll.local>
References: <20210115093038.10345-1-tzimmermann@suse.de>
 <f8b37a6e-b750-7b23-4628-8b11dbc04d36@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8b37a6e-b750-7b23-4628-8b11dbc04d36@ideasonboard.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 09:57:24AM +0000, Kieran Bingham wrote:
> Hi Thomas,
> 
> On 15/01/2021 09:30, Thomas Zimmermann wrote:
> > The GEM mmap code relies on the GEM object's mmap callback to set the
> > VMA's vm_ops field. This is easily forgotten and already led to a memory
> > leak in the CMA helpers. Instead set the vm_ops field in the DRM core
> > code to the GEM object's value. Drivers with different needs can override
> > this in their mmap callback.
> > 
> > v2:
> > 	* support (vm_ops == NULL) if mmap is given; required by VRAM
> > 	  helpers

I guess vram helpers need this because ttm has it's own vm_ops struct?
Might be another thing worth unifying (eventually).

> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: f5ca8eb6f9bd ("drm/cma-helper: Implement mmap as GEM CMA object functions")
> > Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Re-tested just fine this side ;-)
>  - https://paste.ubuntu.com/p/Jgz6xMKNJX/

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Thanks
> 
> Kieran
> 
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/drm_gem.c   | 19 ++++++++++---------
> >  drivers/gpu/drm/drm_prime.c |  2 ++
> >  2 files changed, 12 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 34b2f111c01c..c2ce78c4edc3 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1068,20 +1068,17 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
> >  	drm_gem_object_get(obj);
> >  
> >  	vma->vm_private_data = obj;
> > +	vma->vm_ops = obj->funcs->vm_ops;
> >  
> >  	if (obj->funcs->mmap) {
> >  		ret = obj->funcs->mmap(obj, vma);
> > -		if (ret) {
> > -			drm_gem_object_put(obj);
> > -			return ret;
> > -		}
> > +		if (ret)
> > +			goto err_drm_gem_object_put;
> >  		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
> >  	} else {
> > -		if (obj->funcs->vm_ops)
> > -			vma->vm_ops = obj->funcs->vm_ops;
> > -		else {
> > -			drm_gem_object_put(obj);
> > -			return -EINVAL;
> > +		if (!vma->vm_ops) {
> > +			ret = -EINVAL;
> > +			goto err_drm_gem_object_put;
> >  		}
> >  
> >  		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
> > @@ -1090,6 +1087,10 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
> >  	}
> >  
> >  	return 0;
> > +
> > +err_drm_gem_object_put:
> > +	drm_gem_object_put(obj);
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_gem_mmap_obj);
> >  
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 683aa29ecd3b..2a54f86856af 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -717,6 +717,8 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> >  	vma->vm_pgoff += drm_vma_node_start(&obj->vma_node);
> >  
> >  	if (obj->funcs && obj->funcs->mmap) {
> > +		vma->vm_ops = obj->funcs->vm_ops;
> > +

Do you know how much we still need the non-obj->funcs path here? Maybe
time to detele it and wrape the obj->funcs check in a WARN_ON?
-Daniel


> >  		ret = obj->funcs->mmap(obj, vma);
> >  		if (ret)
> >  			return ret;
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
