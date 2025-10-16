Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E597FBE39A3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 15:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE2410E9DB;
	Thu, 16 Oct 2025 13:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hjK5TKmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721FA10E9DB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760620028;
 bh=/Mcf//ldWRMHxgf2J6O2uLx2TMWNZbe8RjS8L8mYELo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hjK5TKmbLEaT/Ib23Sxz7NSrcU20Fn4h3dSjSIquOY+Pf5FEYRcpU+SCMRDrjPUfY
 IkWneJwSQmIo+a5oH2/CscUZFaZjEjfW6klIGTSf1K0Pmjsv5poJFyZb8lcV7mpGUw
 77jVzDExGVO3Vbc6U1hIMpfIQDl57lxwO97F3WtO5s/JdhMQidlkh746hsNWr8cwLe
 /GTvcg+UgW/fGyCef+seLvASF8Esq4pulRIvoDmV474di9MsYOCNIhFzMFqikFAHJI
 7XYB5vwyo3CWuSkyN/a1fVBwLuJQLzFDhuRfO5O5bnG9MDf8X2fns1i6gXQ9jLCwBg
 O5B8TMORAhWCg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 974CC17E0CF8;
 Thu, 16 Oct 2025 15:07:07 +0200 (CEST)
Date: Thu, 16 Oct 2025 15:07:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync()
 and a drm_gem_sync() helper
Message-ID: <20251016150704.405524b9@fedora>
In-Reply-To: <20251016145708.5721c43a@fedora>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <k4qq6mcgil6ubyrarr6ptib7qckrgg6eh5y747ckycvnoyu7tf@d5aoylyi5nvz>
 <20251016145708.5721c43a@fedora>
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

On Thu, 16 Oct 2025 14:57:08 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 16 Oct 2025 10:13:25 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
> > Hi,
> > 
> > On Wed, Oct 15, 2025 at 06:03:14PM +0200, Boris Brezillon wrote:  
> > > Prepare things for standardizing synchronization around CPU accesses
> > > of GEM buffers. This will be used to provide default
> > > drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and provide
> > > a way for drivers to add their own ioctls to synchronize CPU
> > > writes/reads when they can't do it directly from userland.
> > > 
> > > v2:
> > > - New commit
> > > 
> > > v3:
> > > - No changes
> > > 
> > > v4:
> > > - Add Steve's R-b
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Reviewed-by: Steven Price <steven.price@arm.com>
> > > ---
> > >  drivers/gpu/drm/drm_gem.c | 10 +++++++++
> > >  include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 55 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > index a1a9c828938b..a1431e4f2404 100644
> > > --- a/drivers/gpu/drm/drm_gem.c
> > > +++ b/drivers/gpu/drm/drm_gem.c
> > > @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
> > >  }
> > >  EXPORT_SYMBOL(drm_gem_vunmap);
> > >  
> > > +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t size,
> > > +		 enum drm_gem_object_access_flags access)
> > > +{
> > > +	if (obj->funcs->sync)
> > > +		return obj->funcs->sync(obj, offset, size, access);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_gem_sync);
> > > +
> > >  /**
> > >   * drm_gem_lock_reservations - Sets up the ww context and acquires
> > >   * the lock on an array of GEM objects.
> > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > index 8d48d2af2649..1c33e59ab305 100644
> > > --- a/include/drm/drm_gem.h
> > > +++ b/include/drm/drm_gem.h
> > > @@ -66,6 +66,33 @@ enum drm_gem_object_status {
> > >  	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
> > >  };
> > >  
> > > +/**
> > > + * enum drm_gem_object_status - bitmask describing GEM access types to prepare for    
> > 
> > Treating an enum as a bitmask is a bit weird to me. I'd say either have
> > a bitmask with BIT(enum values), or no enum at all.  
> 
> I'll drop the enum and make it pure defines.
> 
> >   
> > > + */
> > > +enum drm_gem_object_access_flags {
> > > +	/** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access. */
> > > +	DRM_GEM_OBJECT_CPU_ACCESS = 0,
> > > +
> > > +	/** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device access. */
> > > +	DRM_GEM_OBJECT_DEV_ACCESS = BIT(0),
> > > +
> > > +	/** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the entity doing the access. */
> > > +	DRM_GEM_OBJECT_ACCESSOR_MASK = BIT(0),    
> > 
> > Do we really want to have to variants with the same discriminant? If so,
> > we should document why it's something we want.
> >   
> > > +	/** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only accesses. */
> > > +	DRM_GEM_OBJECT_READ_ACCESS = BIT(1),
> > > +
> > > +	/** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only accesses. */
> > > +	DRM_GEM_OBJECT_WRITE_ACCESS = BIT(2),
> > > +
> > > +	/** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write accesses. */
> > > +	DRM_GEM_OBJECT_RW_ACCESS = DRM_GEM_OBJECT_READ_ACCESS |
> > > +				   DRM_GEM_OBJECT_WRITE_ACCESS,
> > > +
> > > +	/** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check the access type. */
> > > +	DRM_GEM_OBJECT_ACCESS_TYPE_MASK = DRM_GEM_OBJECT_RW_ACCESS,    
> > 
> > Same thing.
> > 
> > Or is it that you encode both the direction and access type, and have a
> > mask to isolate each?  
> 
> This ^.
> 
> > 
> > If so, we should really move it out from an enum into defines, or treat each
> > separately like dma_sync_does.  
> 
> Sure, I can do that.

Actually, looking at the enum just above the one added in this patch
(drm_gem_object_status), it seems that it has the same flaws, and I
think it was the reason I went for this enum-based approach, because I
tend to be consistent with the code base I'm modifying.

Now, I get that defining flags with an enum and then composing those to
then pass the composition to some helper pretending it's still an enum
only works in C (because with C you can do anything you want :D), and
probably not if you're in pedantic mode. But if we want to enforce
that, we should probably fix the existing code base, otherwise this
will keep happening ;-). And no, before you ask, I'm not volunteering
for this :P.
