Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791D9BCDF6F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 18:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5955F10EC5B;
	Fri, 10 Oct 2025 16:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V9DaO9Ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B069110EC57
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760113900;
 bh=2YKIQ2N7Cqp5eOfcHsNV4kZUlUlXr4IHr9djUu6Bm2I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V9DaO9ExB+ooPKnpXZfbpA66EuVTy800M3MNHozn5RIYWtgERM90x/nfebUNpM7Cz
 ybZTmfeqLWTeZguBcvcFvASXM7by0ZkZHXeG0MX9ARGi9hDRZOjoeXMDPb5iT3GUvt
 shVJ0LIjcKjyZuwlKwZg9jK0I1DKXCSmfUjraWMTkRDjy+UDCpX6webqQjipFQybOk
 DNOf65ViEHAcrTKLtP+Nxf7+EPTXA4zxnNNKF5zWK7rXJW414bixBABH6e1vZjmKDU
 EHWVoxUyhQDL++Tq+nFIFaepXIKe2AT4SaSrRFm6jicfPT1XHjcmo9ivv3YFZnvj0j
 jU2lr0HrH/Lrw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B8A2917E0C54;
 Fri, 10 Oct 2025 18:31:39 +0200 (CEST)
Date: Fri, 10 Oct 2025 18:31:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v2 12/13] drm/panfrost: Add flag to map GEM object
 Write-Back Cacheable
Message-ID: <20251010183134.6e8c4152@fedora>
In-Reply-To: <ae4cb263-ac1c-49ee-a3fb-3937c6982e1c@arm.com>
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-13-boris.brezillon@collabora.com>
 <ae4cb263-ac1c-49ee-a3fb-3937c6982e1c@arm.com>
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

On Fri, 10 Oct 2025 16:00:45 +0100
Steven Price <steven.price@arm.com> wrote:

> On 10/10/2025 11:11, Boris Brezillon wrote:
> > From: Faith Ekstrand <faith.ekstrand@collabora.com>
> > 
> > Will be used by the UMD to optimize CPU accesses to buffers
> > that are frequently read by the CPU, or on which the access
> > pattern makes non-cacheable mappings inefficient.
> > 
> > Mapping buffers CPU-cached implies taking care of the CPU
> > cache maintenance in the UMD, unless the GPU is IO coherent.
> > 
> > v2:
> > - Add more to the commit message
> > 
> > Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Should we not expose the PANFROST_BO_WB_MMAP flag through
> DRM_IOCTL_PANFROST_QUERY_BO_INFO? The documentation states that we
> return "Flags passed at creation time", but then this new flag isn't
> returned.

It was meant to be, I just got the test reversed in
panfrost_ioctl_query_bo_info().

> 
> Thanks,
> Steve
> 
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++--
> >  drivers/gpu/drm/panfrost/panfrost_gem.c |  3 +++
> >  include/uapi/drm/panfrost_drm.h         |  1 +
> >  3 files changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 00c0881fa2f0..0f51b1dc1abc 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -125,6 +125,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
> >  	return 0;
> >  }
> >  
> > +#define PANFROST_BO_FLAGS	(PANFROST_BO_NOEXEC | \
> > +				 PANFROST_BO_HEAP | \
> > +				 PANFROST_BO_WB_MMAP)
> > +
> >  static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
> >  		struct drm_file *file)
> >  {
> > @@ -134,8 +138,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
> >  	struct panfrost_gem_mapping *mapping;
> >  	int ret;
> >  
> > -	if (!args->size || args->pad ||
> > -	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
> > +	if (!args->size || args->pad || (args->flags & ~PANFROST_BO_FLAGS))
> >  		return -EINVAL;
> >  
> >  	/* Heaps should never be executable */
> > @@ -661,6 +664,9 @@ static int panfrost_ioctl_query_bo_info(struct drm_device *dev, void *data,
> >  
> >  		if (bo->is_heap)
> >  			args->create_flags |= PANFROST_BO_HEAP;
> > +
> > +		if (bo->base.map_wc)
> > +			args->create_flags |= PANFROST_BO_WB_MMAP;

Oops, it's actually

		if (!bo->base.map_wc)
			args->create_flags |= PANFROST_BO_WB_MMAP;

> >  	}
> >  
> >  	drm_gem_object_put(gem_obj);
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> > index da0362202d94..0e8028ee9d1f 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> > @@ -320,6 +320,9 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
> >  	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
> >  	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
> >  
> > +	if (flags & PANFROST_BO_WB_MMAP)
> > +		bo->base.map_wc = false;
> > +
> >  	return bo;
> >  }
> >  
> > diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> > index 5832a291adc4..2c1e28f9dd07 100644
> > --- a/include/uapi/drm/panfrost_drm.h
> > +++ b/include/uapi/drm/panfrost_drm.h
> > @@ -104,6 +104,7 @@ struct drm_panfrost_wait_bo {
> >  /* Valid flags to pass to drm_panfrost_create_bo */
> >  #define PANFROST_BO_NOEXEC	1
> >  #define PANFROST_BO_HEAP	2
> > +#define PANFROST_BO_WB_MMAP	4
> >  
> >  /**
> >   * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.  
> 

