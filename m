Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A52A89C22
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF89510E745;
	Tue, 15 Apr 2025 11:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79A3610E744
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:24:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A92215A1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 04:24:14 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F07E83F66E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 04:24:15 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:24:12 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Enforce DRM_PANTHOR_BO_NO_MMAP
Message-ID: <Z_5B3NxoR5cy8VVH@e110455-lin.cambridge.arm.com>
References: <20250415105710.1490623-1-boris.brezillon@collabora.com>
 <20250415131842.1f678004@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415131842.1f678004@collabora.com>
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

On Tue, Apr 15, 2025 at 01:18:42PM +0200, Boris Brezillon wrote:
> On Tue, 15 Apr 2025 12:57:10 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > Right now the DRM_PANTHOR_BO_NO_MMAP flag is ignored by
> > panthor_ioctl_bo_mmap_offset(), meaning BOs with this flag set can
> > still be mmap-ed.
> > 
> > Fortunately, this bug only impacts user BOs, because kernel BOs are not
> > exposed to userspace (they don't have a BO handle), so they can't
> > be mmap-ed anyway. Given all user BOs setting this flag are private
> > anyway (not shareable), there's no potential data leak.
> > 
> > Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
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
> 
> Maybe it should be EPERM instead of EINVAL here.

Yeah, I agree. With that change:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> > +
> >  	ret = drm_gem_create_mmap_offset(obj);
> >  	if (ret)
> >  		goto out;
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
