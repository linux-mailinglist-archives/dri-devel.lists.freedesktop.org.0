Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0638BA9CBB4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 16:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5869210E30E;
	Fri, 25 Apr 2025 14:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V6uRKjbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE26010E30E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745591424;
 bh=4z4ULHlJVIMsCH+XO1eJC+hJKCbBUsa1mYl8nI678po=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V6uRKjbZVrIIkNn2B/oisjCyB8PZ3YQWDzwABALJYDWBkPhRZGKjZpNIRgTtx0Mz7
 kJS6w0SHK0SaJbVc3ETVjKus+GH/pYui5Qj7PfAFwfuELf0gAiIfSbm5lSueN/wh8y
 w/TAyCm8zhCryMb2cBx9p6nt3N4SIIorm4exdu5D+yxvPXnUoHXXKnzR8mM1sxcYU8
 cI9jVnGSVT3yy/mlJ3+ssTNvBaKQlDP3trrJsL9bx67niP9d82c2F9DeBj7e9yzjKP
 HgGmMytKAlhWcPghy3ehS9MZ3H4CBWrUb9Iqlzh72hhOeYyjKJaDEjThZ+IKniwIV/
 Q9kJi04tYfVGA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9599E17E00BD;
 Fri, 25 Apr 2025 16:30:23 +0200 (CEST)
Date: Fri, 25 Apr 2025 16:30:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 09/15] drm/panthor: Test for imported buffers with
 drm_gem_is_imported()
Message-ID: <20250425163017.050f94f0@collabora.com>
In-Reply-To: <bd83794c-17a9-4e28-bf62-7a62bef57c22@arm.com>
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-10-tzimmermann@suse.de>
 <bd83794c-17a9-4e28-bf62-7a62bef57c22@arm.com>
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

On Fri, 25 Apr 2025 14:34:53 +0100
Steven Price <steven.price@arm.com> wrote:

> On 17/03/2025 13:06, Thomas Zimmermann wrote:
> > Instead of testing import_attach for imported GEM buffers, invoke
> > drm_gem_is_imported() to do the test. The helper tests the dma_buf
> > itself while import_attach is just an artifact of the import. Prepares
> > to make import_attach optional.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c |  2 +-
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++-----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 8244a4e6c2a2..fd014ccc3bfc 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -155,7 +155,7 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
> >  	struct panthor_gem_object *bo = to_panthor_bo(obj);
> >  	enum drm_gem_object_status res = 0;
> >  
> > -	if (bo->base.base.import_attach || bo->base.pages)
> > +	if (drm_gem_is_imported(&bo->base.base) || bo->base.pages)
> >  		res |= DRM_GEM_OBJECT_RESIDENT;
> >  
> >  	return res;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 12a02e28f50f..3e123159ac10 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -1103,7 +1103,7 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
> >  	/* If the vm_bo object was destroyed, release the pin reference that
> >  	 * was hold by this object.
> >  	 */
> > -	if (unpin && !bo->base.base.import_attach)
> > +	if (unpin && !drm_gem_is_imported(&bo->base.base))
> >  		drm_gem_shmem_unpin(&bo->base);  
> 
> I'm seeing issues on cleanup where drm_gem_is_imported() doesn't return 
> the same as !!import_attach in the above code. Specifically this appears 
> to be caused by drm_gem_object_exported_dma_buf_free() setting ->dma_buf 
> to NULL which makes the BO look like it isn't imported.
> 
> Stashing the imported state in the BO fixes the problem (see below 
> hack), but it would be nice to fix this more generally in case there are 
> other drivers that need to know the imported state during cleanup.
> 
> Any suggestions for how drm_gem_is_imported() can more accurately report 
> the state during cleanup?

This should be fixed by [1], but I wonder why it's not been merged in
drm-misc-next yet.

[1]https://patches.linaro.org/project/linux-media/patch/20250416065820.26076-1-tzimmermann@suse.de/
