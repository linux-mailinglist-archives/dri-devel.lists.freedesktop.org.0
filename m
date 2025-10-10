Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0389BCDB73
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 17:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7444610EC48;
	Fri, 10 Oct 2025 15:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VQbIct5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BD110EC48
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760108913;
 bh=7ayOEb/6QjakoXaje73y7gqyfsylx4Z/vrfyLGORarU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VQbIct5GHgbE4ijxW/+44tJBcHCf3lpRhqm52LBt2fu1LK0bZWn3WmayEmY8XUBZm
 f9Y/xK+iGFTtVB1euHtNDh8ksXNxR04iTxqv9Lz9RaWIJsGexxRsASOtAhAj8f6LVo
 nVWAAElX56hU/iwhMWTVletFSOoVL7vNIMy7Kfl58Y6Rs/oGrZYXPwWw/HtllLTkgx
 V7ciDfyx0cG28zheru9n3E8PMfO7cLESJcyEM7OL9Xi5SFwzMCIfz2BIuQuFS+Ltyo
 Nh3cucbSj7CFJD1arQICbacXnp+dDrG4hZllnUrwxpdato79Tl7TiyJ15zS9ghZG+E
 dwCbZxLHVOvJQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EDD8717E0CF8;
 Fri, 10 Oct 2025 17:08:32 +0200 (CEST)
Date: Fri, 10 Oct 2025 17:08:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v2 04/13] drm/panthor: Expose the selected coherency
 protocol to the UMD
Message-ID: <20251010170827.37b750aa@fedora>
In-Reply-To: <9664ba34-c02e-446a-bfc7-5b7f32a60833@arm.com>
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-5-boris.brezillon@collabora.com>
 <9664ba34-c02e-446a-bfc7-5b7f32a60833@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Oct 2025 15:22:50 +0100
Steven Price <steven.price@arm.com> wrote:

> On 10/10/2025 11:11, Boris Brezillon wrote:
> > If we want to be able to skip CPU cache maintenance operations on
> > CPU-cached mappings, the UMD needs to know the kind of coherency
> > in place. Add a field to drm_panthor_gpu_info to do that. We can re-use
> > a padding field for that since this object is write-only from the
> > KMD perspective, and the UMD should just ignore it.
> > 
> > v2:
> > - New commit
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.c |  6 +++-
> >  drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
> >  include/uapi/drm/panthor_drm.h           | 39 ++++++++++++++++++++++--
> >  3 files changed, 42 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > index c7033d82cef5..afe24a03a71c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -25,6 +25,8 @@
> >  
> >  static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
> >  {
> > +	/* Start with no coherency, and update it if the device is flagged coherent. */
> > +	ptdev->gpu_info.selected_coherency = GPU_COHERENCY_NONE;
> >  	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> >  
> >  	if (!ptdev->coherent)
> > @@ -34,8 +36,10 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
> >  	 * ACE protocol has never been supported for command stream frontend GPUs.
> >  	 */
> >  	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
> > -		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
> > +		      GPU_COHERENCY_PROT_BIT(ACE_LITE))) {
> > +		ptdev->gpu_info.selected_coherency = GPU_COHERENCY_PROT_BIT(ACE_LITE);
> >  		return 0;
> > +	}
> >  
> >  	drm_err(&ptdev->base, "Coherency not supported by the device");
> >  	return -ENOTSUPP;
> > diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> > index 9d98720ce03f..a95c0b94ef58 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> > @@ -49,7 +49,7 @@ struct panthor_gpu {
> >  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
> >  {
> >  	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> > -		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
> > +		  ptdev->gpu_info.selected_coherency);  
> 
> It looks like an existing bug, but GPU_COHERENCY_PROTOCOL doesn't take a
> bit mask. So we should be just writing GPU_COHERENCY_ACE_LITE not
> GPU_COHERENCY_PROT_BIT(ACE_LITE).

Oops. Should I prepare a fix, or does someone at Arm intend to send a
fix for this one?

> 
> >  }
> >  
> >  static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
> > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> > index 467d365ed7ba..b9e483ff5e21 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -245,6 +245,26 @@ enum drm_panthor_dev_query_type {
> >  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
> >  };
> >  
> > +/**
> > + * enum drm_panthor_gpu_coherency: Type of GPU coherency
> > + */
> > +enum drm_panthor_gpu_coherency {
> > +	/**
> > +	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE Lite coherency.
> > +	 */
> > +	DRM_PANTHOR_GPU_COHERENCY_ACE_LITE = 1 << 0,
> > +
> > +	/**
> > +	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE coherency.  
> 
> Copy/paste mistake                       ^^^^^

Will fix.

> 
> > +	 */
> > +	DRM_PANTHOR_GPU_COHERENCY_ACE = 1 << 1,
> > +
> > +	/**
> > +	 * @DRM_PANTHOR_GPU_COHERENCY_NONE: No coherency.
> > +	 */
> > +	DRM_PANTHOR_GPU_COHERENCY_NONE = 31,
> > +};  
> 
> This is a mix of bit mask and non-bit mask. I'm assuming this was
> intended for the newly added selected_coherency field, in which case it
> shouldn't be shifting - the values are 0 and 1 for ace_lite and ace.

Yeah, I think I went back and forth on this, and just picked the worst
option in the end. I'll make it a real enum with the mapping you
suggested.
