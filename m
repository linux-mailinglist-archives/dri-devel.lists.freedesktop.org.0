Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54367A90768
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 17:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5702810E96B;
	Wed, 16 Apr 2025 15:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BimieP5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03E710E96B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744816290;
 bh=Y0aDJo3BpmAPUnjeYTLnlh4xGI7M1rc2AbX/mzm31hA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BimieP5E7YJ4puMKXJDjO/wPHuOHks1Bo/fmuz76KFoRypOVOhZZ9fa46TF3NDg7J
 yWgXcIV8ZS/HfQFJ9toaKUdE6NY4iizL8VK7EmPwYlnJUnOKtnM0i5S0uUViZSY4of
 GySWpzbnVsR+3jKrpJO5km7UPdM3mLb1CaTJUzMyP8rZvKXQWbVmCVbcKYa1mmnyQs
 gEchMBxXFYk4kFRu7k08hPui2NNy8gwuH4/nbwG7nR9pd/FVFkQcVjgC6fmGDVxJbt
 lq5MXG+YbqcG9zI+xaIC/NR8QO6A5Dv2S+PAgkUV32WXSuxi4nEC8svefPj/iEouqQ
 SREln/Dq7/mrw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9383517E05F7;
 Wed, 16 Apr 2025 17:11:30 +0200 (CEST)
Date: Wed, 16 Apr 2025 17:11:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Enforce DRM_PANTHOR_BO_NO_MMAP
Message-ID: <20250416171124.376030b3@collabora.com>
In-Reply-To: <2f27c97e-514f-4074-9fb4-3ca46f53220f@arm.com>
References: <20250415105710.1490623-1-boris.brezillon@collabora.com>
 <2f27c97e-514f-4074-9fb4-3ca46f53220f@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Wed, 16 Apr 2025 15:26:42 +0100
Steven Price <steven.price@arm.com> wrote:

> On 15/04/2025 11:57, Boris Brezillon wrote:
> > Right now the DRM_PANTHOR_BO_NO_MMAP flag is ignored by
> > panthor_ioctl_bo_mmap_offset(), meaning BOs with this flag set can
> > still be mmap-ed.
> > 
> > Fortunately, this bug only impacts user BOs, because kernel BOs are not
> > exposed to userspace (they don't have a BO handle), so they can't
> > be mmap-ed anyway. Given all user BOs setting this flag are private
> > anyway (not shareable), there's no potential data leak.  
> 
> Maybe I'm missing something, but I think the below check in
> panthor_gem_mmap() should also prevent this:
> 
> > static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> > {
> > 	struct panthor_gem_object *bo = to_panthor_bo(obj);
> > 
> > 	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
> > 	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> > 		return -EINVAL;

Doh, how did I miss that one...

> > 
> > 	return drm_gem_shmem_object_mmap(obj, vma);
> > }  
> 
> That said, it doesn't make sense to be able to get an offset if you
> can't mmap() so this seems like a good change. Indeed potentially with
> this we no longer need panthor_gem_mmap() - although I haven't
> completely convinced myself of that yet.
> 
> > Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Okay, if we decide to keep that change, I need to reword the commit
message and drop the Fixes tag.

> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_drv.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index 15d8e2bcf6ad..1499df07f512 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -940,6 +940,7 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
> >  					struct drm_file *file)
> >  {
> >  	struct drm_panthor_bo_mmap_offset *args = data;
> > +	struct panthor_gem_object *bo;
> >  	struct drm_gem_object *obj;
> >  	int ret;
> >  
> > @@ -950,6 +951,10 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
> >  	if (!obj)
> >  		return -ENOENT;
> >  
> > +	bo = to_panthor_bo(obj);
> > +	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> > +		return -EINVAL;
> > +
> >  	ret = drm_gem_create_mmap_offset(obj);
> >  	if (ret)
> >  		goto out;  
> 

