Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1268C5133A9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DC710E38F;
	Thu, 28 Apr 2022 12:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F202710E38F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 12:27:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id y21so2865335wmi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 05:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IEJ//JmR0XyjYWk0f1M0fejNZE/mcJOikGnc9DxgVX4=;
 b=HKcjG6GsPdY4uul9g2m4Ob260sBdWqlNpb9fg959BV+6LKTeNmlXs60BlISvFNqItn
 4r9fz0cFtUMoUI233i+Shdy6b7oBTxdRogvfD3MSSWaIlnRpiMrXeOHJd6cZbeLlOOvW
 lJq2+Is+MLuuXBXi/qDXms9ROhS9n64fzmbyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IEJ//JmR0XyjYWk0f1M0fejNZE/mcJOikGnc9DxgVX4=;
 b=K8mC7tiLEFZ/FK3IeiW3Y5CJULr4FsphDIke2EjWqLJr16wf6ZSjxvRCfLh6JAGtA/
 2qTLzpPTahu6V0d0wgf7V6sUukKqUPSv1wQGm6Xmqurazictdv+JDboeePU8dhlr+JY2
 QM4pHaXyCmfcBd+J/xvL+EXzJtodEhzysF2pqLWuC1INInJUlCA13Umd6owX8dYfqahP
 0JIEeUTYubAh8PN/pcGzCYstm0CXjXym+aNpcIePit+2mwLZVZGHP+hwe9AYfdfffvN8
 uFzfBmayae13dQY0JQzzzqTZ7BaHrbT70LRqjZ/6YkF1NC9BPSKQt8L2+TjBkMj4eZZI
 Exvg==
X-Gm-Message-State: AOAM531Q3CcTL/3uWhylpwx3my/za3Rg+fD8ugCVWXJzE8+s7gmCtDJ6
 iFyiaVPIdpOgWUoq4EknkSfMTR6+GdWY+LWa
X-Google-Smtp-Source: ABdhPJw5R3/3TMDnYnSxRgYlZ3m5Oyf4y338EmjwGQe6N5NFO38KuHCyWoKz/9jy58xDnXIf6xN6ZQ==
X-Received: by 2002:a05:600c:4e93:b0:394:e58:c446 with SMTP id
 f19-20020a05600c4e9300b003940e58c446mr3494117wmq.21.1651148825451; 
 Thu, 28 Apr 2022 05:27:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6488000000b002051f1028f6sm18769699wri.111.2022.04.28.05.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:27:04 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:27:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm: handle kernel fences in
 drm_gem_plane_helper_prepare_fb
Message-ID: <YmqIFxkpYhdpqKmO@phenom.ffwll.local>
References: <20220421191002.2251-1-christian.koenig@amd.com>
 <YmlpViYhgZF3+EHE@phenom.ffwll.local>
 <4bea78f5-2a09-55de-264a-aec9bc7c4678@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bea78f5-2a09-55de-264a-aec9bc7c4678@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 28, 2022 at 08:41:28AM +0200, Christian König wrote:
> Am 27.04.22 um 18:03 schrieb Daniel Vetter:
> > On Thu, Apr 21, 2022 at 09:10:02PM +0200, Christian König wrote:
> > > drm_gem_plane_helper_prepare_fb() was using
> > > drm_atomic_set_fence_for_plane() which ignores all implicit fences when an
> > > explicit fence is already set. That's rather unfortunate when the fb still
> > > has a kernel fence we need to wait for to avoid presenting garbage on the
> > > screen.
> > > 
> > > So instead update the fence in the plane state directly. While at it also
> > > take care of all potential GEM objects and not just the first one.
> > > 
> > > Also remove the now unused drm_atomic_set_fence_for_plane() function, new
> > > drivers should probably use the atomic helpers directly.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Is this enough to have amdgpu (and well others using ttm) fully rely on
> > this for atomic kms updates? Anything to clean up there? Would be neat to
> > include that in this series too if there's anything.
> 
> At least I strongly think so. I just haven't removed the
> dma_resv_wait_timeout() from amdgpu_dm_commit_planes() because that is
> simply not code I'm very familiar with.

Yeah defo not in the same patch, but a follow up would be really good.
Then DC folks could confirm that we got this right.

I think some other drivers would also benefit from some cleanup:

- nv50_wndw_prepare_fb could replace it's open-coded prepare with a call
  to the helper here I think.

- qxl looks buggy, at least I didn't find any wait for bo->moving, nor
  does the reserve seem to be synchronous qxl_bo_pin. Adding a call to the
  helper below in qxl_plane_prepare_fb() after the call to qxl_bo_pin() is
  probably the right thing.

- vwmgfx isn't gem, so can't use the gem helper outright (I think at
  least), but also looks buggy in the same way.

I'd include patches for amd/dc, nv and qxl and let the expert test it.
Just so we have some confirmation that this all now actually works,
without any driver hacks and stuff. The only really important thing is
that they're gem drivers, otherwise the bo pointers the helper relies on
aren't filled out in the drm_fb structure.
-Daniel

> 
> > > ---
> > >   drivers/gpu/drm/drm_atomic_uapi.c       | 37 ---------------
> > >   drivers/gpu/drm/drm_gem_atomic_helper.c | 63 +++++++++++++++++++++----
> > >   include/drm/drm_atomic_uapi.h           |  2 -
> > >   include/drm/drm_plane.h                 |  4 +-
> > >   4 files changed, 54 insertions(+), 52 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > > index c6394ba13b24..0f461261b3f3 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -254,43 +254,6 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
> > >   }
> > >   EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
> > > -/**
> > > - * drm_atomic_set_fence_for_plane - set fence for plane
> > > - * @plane_state: atomic state object for the plane
> > > - * @fence: dma_fence to use for the plane
> > > - *
> > > - * Helper to setup the plane_state fence in case it is not set yet.
> > > - * By using this drivers doesn't need to worry if the user choose
> > > - * implicit or explicit fencing.
> > > - *
> > > - * This function will not set the fence to the state if it was set
> > > - * via explicit fencing interfaces on the atomic ioctl. In that case it will
> > > - * drop the reference to the fence as we are not storing it anywhere.
> > > - * Otherwise, if &drm_plane_state.fence is not set this function we just set it
> > > - * with the received implicit fence. In both cases this function consumes a
> > > - * reference for @fence.
> > > - *
> > > - * This way explicit fencing can be used to overrule implicit fencing, which is
> > > - * important to make explicit fencing use-cases work: One example is using one
> > > - * buffer for 2 screens with different refresh rates. Implicit fencing will
> > > - * clamp rendering to the refresh rate of the slower screen, whereas explicit
> > > - * fence allows 2 independent render and display loops on a single buffer. If a
> > > - * driver allows obeys both implicit and explicit fences for plane updates, then
> > > - * it will break all the benefits of explicit fencing.
> > > - */
> > > -void
> > > -drm_atomic_set_fence_for_plane(struct drm_plane_state *plane_state,
> > > -			       struct dma_fence *fence)
> > I was a bit on the fence with ditching this, but the only offender not
> > using the prepare_fb helpers is i915, and so just more reasons that i915
> > needs to get off its hand-rolled atomic code with its own funky dependency
> > handling and everything.
> 
> Yeah, agree totally. amdgpu should now also work out of the box, I just
> didn't dared to actually enable it in the same patch.
> 
> > 
> > > -{
> > > -	if (plane_state->fence) {
> > > -		dma_fence_put(fence);
> > > -		return;
> > > -	}
> > > -
> > > -	plane_state->fence = fence;
> > > -}
> > > -EXPORT_SYMBOL(drm_atomic_set_fence_for_plane);
> > > -
> > >   /**
> > >    * drm_atomic_set_crtc_for_connector - set CRTC for connector
> > >    * @conn_state: atomic state object for the connector
> > > diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> > > index a6d89aed0bda..8fc0b42acdff 100644
> > > --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> > > @@ -1,6 +1,7 @@
> > >   // SPDX-License-Identifier: GPL-2.0-or-later
> > >   #include <linux/dma-resv.h>
> > > +#include <linux/dma-fence-chain.h>
> > >   #include <drm/drm_atomic_state_helper.h>
> > >   #include <drm/drm_atomic_uapi.h>
> > > @@ -141,25 +142,67 @@
> > >    * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> > You forgot to update the kerneldoc here, and also the reference to the
> > same function in the IN_FENCE_FD.
> > 
> > I think it'd be best to put a reference to that DOC: section here, and
> > adjust the uapi property doc to just state that the explicit fence will
> > overrule implicit sync. And then maybe also mention here that USAGE_KERNEL
> > fences are still obeyed.
> > 
> > With these changes (which should make sure that all references to
> > drm_atomic_set_fence_for_plane() are truly gone) this is
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Ok, going to update the doc and push this if nobody objects.
> 
> Thanks,
> Christian.
> 
> > 
> > 
> > 
> > >    * explicit fencing in atomic modeset updates.
> > >    */
> > > -int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
> > > +int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
> > > +				    struct drm_plane_state *state)
> > >   {
> > > +	struct dma_fence *fence = dma_fence_get(state->fence);
> > >   	struct drm_gem_object *obj;
> > > -	struct dma_fence *fence;
> > > +	enum dma_resv_usage usage;
> > > +	size_t i;
> > >   	int ret;
> > >   	if (!state->fb)
> > >   		return 0;
> > > -	obj = drm_gem_fb_get_obj(state->fb, 0);
> > > -	ret = dma_resv_get_singleton(obj->resv, DMA_RESV_USAGE_WRITE, &fence);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
> > > -	 * to handle more fences in general for multiple BOs per fb.
> > > +	/*
> > > +	 * Only add the kernel fences here if there is already a fence set via
> > > +	 * explicit fencing interfaces on the atomic ioctl.
> > > +	 *
> > > +	 * This way explicit fencing can be used to overrule implicit fencing,
> > > +	 * which is important to make explicit fencing use-cases work: One
> > > +	 * example is using one buffer for 2 screens with different refresh
> > > +	 * rates. Implicit fencing will clamp rendering to the refresh rate of
> > > +	 * the slower screen, whereas explicit fence allows 2 independent
> > > +	 * render and display loops on a single buffer. If a driver allows
> > > +	 * obeys both implicit and explicit fences for plane updates, then it
> > > +	 * will break all the benefits of explicit fencing.
> > >   	 */
> > > -	drm_atomic_set_fence_for_plane(state, fence);
> > > +	usage = fence ? DMA_RESV_USAGE_KERNEL : DMA_RESV_USAGE_WRITE;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(state->fb->obj); ++i) {
> > > +		struct dma_fence *new;
> > > +
> > > +		obj = drm_gem_fb_get_obj(state->fb, i);
> > > +		if (!obj)
> > > +			continue;
> > > +
> > > +		ret = dma_resv_get_singleton(obj->resv, usage, &new);
> > > +		if (ret)
> > > +			goto error;
> > > +
> > > +		if (new && fence) {
> > > +			struct dma_fence_chain *chain = dma_fence_chain_alloc();
> > > +
> > > +			if (!chain) {
> > > +				ret = -ENOMEM;
> > > +				goto error;
> > > +			}
> > > +
> > > +			dma_fence_chain_init(chain, fence, new, 1);
> > > +			fence = &chain->base;
> > > +
> > > +		} else if (new) {
> > > +			fence = new;
> > > +		}
> > > +	}
> > > +
> > > +	dma_fence_put(state->fence);
> > > +	state->fence = fence;
> > >   	return 0;
> > > +
> > > +error:
> > > +	dma_fence_put(fence);
> > > +	return ret;
> > >   }
> > >   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
> > > diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
> > > index 8cec52ad1277..4c6d39d7bdb2 100644
> > > --- a/include/drm/drm_atomic_uapi.h
> > > +++ b/include/drm/drm_atomic_uapi.h
> > > @@ -49,8 +49,6 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
> > >   			      struct drm_crtc *crtc);
> > >   void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
> > >   				 struct drm_framebuffer *fb);
> > > -void drm_atomic_set_fence_for_plane(struct drm_plane_state *plane_state,
> > > -				    struct dma_fence *fence);
> > >   int __must_check
> > >   drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
> > >   				  struct drm_crtc *crtc);
> > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > > index 2628c7cde2da..89ea54652e87 100644
> > > --- a/include/drm/drm_plane.h
> > > +++ b/include/drm/drm_plane.h
> > > @@ -74,9 +74,7 @@ struct drm_plane_state {
> > >   	 *
> > >   	 * Optional fence to wait for before scanning out @fb. The core atomic
> > >   	 * code will set this when userspace is using explicit fencing. Do not
> > > -	 * write this field directly for a driver's implicit fence, use
> > > -	 * drm_atomic_set_fence_for_plane() to ensure that an explicit fence is
> > > -	 * preserved.
> > > +	 * write this field directly for a driver's implicit fence.
> > >   	 *
> > >   	 * Drivers should store any implicit fence in this from their
> > >   	 * &drm_plane_helper_funcs.prepare_fb callback. See drm_gem_plane_helper_prepare_fb()
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
