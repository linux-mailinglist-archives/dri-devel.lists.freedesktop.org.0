Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8729CF26
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 10:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681F6E4B3;
	Wed, 28 Oct 2020 09:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96A46E4B3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 09:16:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k18so4024293wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ef4v3cP1xPuu0jMaaNBBUHPYFO8zk076vAefo9A49Hs=;
 b=bzwb0rt75nLwXb5o9Z9Mr6TJIDK3ctyFIXZ2B3wLmtqhnc9OD8tnxPOQHpdm6LkYG9
 2ahmj9BRum5DhCrFpDGF8g3xhlLBZ1lwSEpHhy2JGhaAEyrHCTGF9P7SAYi7SPwpUthq
 D0iC58eNIdG7HCew+gQKuXI+YHNAWSKzKhavU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ef4v3cP1xPuu0jMaaNBBUHPYFO8zk076vAefo9A49Hs=;
 b=VNLN1J1rbeF9EbXvkkOGwEI7iVhjtybk2J/HnBUXXDWiPFMy5W+9Nif0gJgpegzqlw
 GWvC+0vprST9Ca1gbSo16oZNcbjnjwbscvtGJQQmNx5Xubp3kgX4kyT28umT94bZtZMP
 ilB5vSnf0Ampv9ERBMzw1zrv9r+gJxWqdGtnGo6+LdBYONRaOcxjUBiGsZPXR7gHH8ai
 WQfimmYw7G+oADCjW9s9OzXon7BA5sz45PD8WZAWExV65NXSPaJxmECfcxGcGKyKg1vb
 53xdBliRLfVLun+wt2UfMFLqqoKbtRar/s3sUl977QmV0nindunzdbeCa6mEWT7ENcnO
 BbgQ==
X-Gm-Message-State: AOAM5308kbVIOTHBMu9t83PqGmk05eQwP+nXM87/UpyGwO6o1rINtKJd
 etC4OqPfPp+xLTmqQb51tqdmrQ==
X-Google-Smtp-Source: ABdhPJztAPmrgFPSxl4+jj+/G/+Vm08v7+BZxmeXI8ZAc5z27bOZiT91JTV21ZQTl6N6oiJG3iFQKQ==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr6839220wma.126.1603876584348; 
 Wed, 28 Oct 2020 02:16:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m12sm5350859wmi.33.2020.10.28.02.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 02:16:23 -0700 (PDT)
Date: Wed, 28 Oct 2020 10:16:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/3] drm/ttm: replace last move_notify with
 delete_mem_notify
Message-ID: <20201028091621.GT401619@phenom.ffwll.local>
References: <20201021044031.1752624-1-airlied@gmail.com>
 <20201021044031.1752624-2-airlied@gmail.com>
 <ace0e5e0-e3cf-4729-d2cc-a50ac6012044@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ace0e5e0-e3cf-4729-d2cc-a50ac6012044@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 11:58:45AM +0200, Christian K=F6nig wrote:
> Am 21.10.20 um 06:40 schrieb Dave Airlie:
> > From: Dave Airlie <airlied@redhat.com>
> > =

> > The move notify callback is only used in one place, this should
> > be removed in the future, but for now just rename it to the use
> > case which is to notify the driver that the GPU memory is to be
> > deleted.
> =

> Probably the right thing to do is to call the move callback with move(fro=
m,
> NULL) in this case as well.
> =

> And then driver can call the necessary function to throw away the backing
> store pipelined.
> =

> > =

> > Drivers can be cleaned up after this separately.
> > =

> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Not sure where to best ask this question, but while reading code I
stumbled over the bo->pin_count check in ttm_bo_release(). And I'm
confused.

Allowing a bo to be pinned without holding a full reference to it feels
like a pretty serious bug. Where&why is that needed? I'm kinda tempted to
wrap this in a WARN_ON, just to make sure there's no surprises in usage
(and maybe warn in unpin if we drop the pin count with the refcount at 0
already).
-Daniel

> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  8 +++++++-
> >   drivers/gpu/drm/drm_gem_vram_helper.c      |  8 +++-----
> >   drivers/gpu/drm/nouveau/nouveau_bo.c       |  8 +++++++-
> >   drivers/gpu/drm/qxl/qxl_ttm.c              |  7 ++++++-
> >   drivers/gpu/drm/radeon/radeon_ttm.c        |  8 +++++++-
> >   drivers/gpu/drm/ttm/ttm_bo.c               |  4 ++--
> >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  8 +++++++-
> >   include/drm/ttm/ttm_bo_driver.h            | 10 ++--------
> >   8 files changed, 41 insertions(+), 20 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 87e10a212b8a..62f9194b1dd1 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -1730,6 +1730,12 @@ static int amdgpu_ttm_access_memory(struct ttm_b=
uffer_object *bo,
> >   	return ret;
> >   }
> > +static void
> > +amdgpu_bo_delete_mem_notify(struct ttm_buffer_object *bo)
> > +{
> > +	amdgpu_bo_move_notify(bo, false, NULL);
> > +}
> > +
> >   static struct ttm_bo_driver amdgpu_bo_driver =3D {
> >   	.ttm_tt_create =3D &amdgpu_ttm_tt_create,
> >   	.ttm_tt_populate =3D &amdgpu_ttm_tt_populate,
> > @@ -1739,7 +1745,7 @@ static struct ttm_bo_driver amdgpu_bo_driver =3D {
> >   	.evict_flags =3D &amdgpu_evict_flags,
> >   	.move =3D &amdgpu_bo_move,
> >   	.verify_access =3D &amdgpu_verify_access,
> > -	.move_notify =3D &amdgpu_bo_move_notify,
> > +	.delete_mem_notify =3D &amdgpu_bo_delete_mem_notify,
> >   	.release_notify =3D &amdgpu_bo_release_notify,
> >   	.io_mem_reserve =3D &amdgpu_ttm_io_mem_reserve,
> >   	.io_mem_pfn =3D amdgpu_ttm_io_mem_pfn,
> > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> > index 19087b22bdbb..9da823eb0edd 100644
> > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > @@ -949,9 +949,7 @@ static void bo_driver_evict_flags(struct ttm_buffer=
_object *bo,
> >   	drm_gem_vram_bo_driver_evict_flags(gbo, placement);
> >   }
> > -static void bo_driver_move_notify(struct ttm_buffer_object *bo,
> > -				  bool evict,
> > -				  struct ttm_resource *new_mem)
> > +static void bo_driver_delete_mem_notify(struct ttm_buffer_object *bo)
> >   {
> >   	struct drm_gem_vram_object *gbo;
> > @@ -961,7 +959,7 @@ static void bo_driver_move_notify(struct ttm_buffer=
_object *bo,
> >   	gbo =3D drm_gem_vram_of_bo(bo);
> > -	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
> > +	drm_gem_vram_bo_driver_move_notify(gbo, false, NULL);
> >   }
> >   static int bo_driver_move(struct ttm_buffer_object *bo,
> > @@ -1002,7 +1000,7 @@ static struct ttm_bo_driver bo_driver =3D {
> >   	.eviction_valuable =3D ttm_bo_eviction_valuable,
> >   	.evict_flags =3D bo_driver_evict_flags,
> >   	.move =3D bo_driver_move,
> > -	.move_notify =3D bo_driver_move_notify,
> > +	.delete_mem_notify =3D bo_driver_delete_mem_notify,
> >   	.io_mem_reserve =3D bo_driver_io_mem_reserve,
> >   };
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index 70b6f3b1ae85..acff82afe260 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -1401,6 +1401,12 @@ nouveau_bo_fence(struct nouveau_bo *nvbo, struct=
 nouveau_fence *fence, bool excl
> >   		dma_resv_add_shared_fence(resv, &fence->base);
> >   }
> > +static void
> > +nouveau_bo_delete_mem_notify(struct ttm_buffer_object *bo)
> > +{
> > +	nouveau_bo_move_ntfy(bo, false, NULL);
> > +}
> > +
> >   struct ttm_bo_driver nouveau_bo_driver =3D {
> >   	.ttm_tt_create =3D &nouveau_ttm_tt_create,
> >   	.ttm_tt_populate =3D &nouveau_ttm_tt_populate,
> > @@ -1408,7 +1414,7 @@ struct ttm_bo_driver nouveau_bo_driver =3D {
> >   	.ttm_tt_destroy =3D &nouveau_ttm_tt_destroy,
> >   	.eviction_valuable =3D ttm_bo_eviction_valuable,
> >   	.evict_flags =3D nouveau_bo_evict_flags,
> > -	.move_notify =3D nouveau_bo_move_ntfy,
> > +	.delete_mem_notify =3D nouveau_bo_delete_mem_notify,
> >   	.move =3D nouveau_bo_move,
> >   	.verify_access =3D nouveau_bo_verify_access,
> >   	.io_mem_reserve =3D &nouveau_ttm_io_mem_reserve,
> > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_tt=
m.c
> > index 1cc3c14bc684..b52a4563b47b 100644
> > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > @@ -166,6 +166,11 @@ static int qxl_bo_move(struct ttm_buffer_object *b=
o, bool evict,
> >   	return ret;
> >   }
> > +static void qxl_bo_delete_mem_notify(struct ttm_buffer_object *bo)
> > +{
> > +	qxl_bo_move_notify(bo, false, NULL);
> > +}
> > +
> >   static struct ttm_bo_driver qxl_bo_driver =3D {
> >   	.ttm_tt_create =3D &qxl_ttm_tt_create,
> >   	.ttm_tt_destroy =3D &qxl_ttm_backend_destroy,
> > @@ -173,7 +178,7 @@ static struct ttm_bo_driver qxl_bo_driver =3D {
> >   	.evict_flags =3D &qxl_evict_flags,
> >   	.move =3D &qxl_bo_move,
> >   	.io_mem_reserve =3D &qxl_ttm_io_mem_reserve,
> > -	.move_notify =3D &qxl_bo_move_notify,
> > +	.delete_mem_notify =3D &qxl_bo_delete_mem_notify,
> >   };
> >   static int qxl_ttm_init_mem_type(struct qxl_device *qdev,
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> > index cd454e5c802f..321c09d20c6c 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -824,6 +824,12 @@ bool radeon_ttm_tt_is_readonly(struct radeon_devic=
e *rdev,
> >   	return !!(gtt->userflags & RADEON_GEM_USERPTR_READONLY);
> >   }
> > +static void
> > +radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
> > +{
> > +	radeon_bo_move_notify(bo, false, NULL);
> > +}
> > +
> >   static struct ttm_bo_driver radeon_bo_driver =3D {
> >   	.ttm_tt_create =3D &radeon_ttm_tt_create,
> >   	.ttm_tt_populate =3D &radeon_ttm_tt_populate,
> > @@ -833,7 +839,7 @@ static struct ttm_bo_driver radeon_bo_driver =3D {
> >   	.evict_flags =3D &radeon_evict_flags,
> >   	.move =3D &radeon_bo_move,
> >   	.verify_access =3D &radeon_verify_access,
> > -	.move_notify =3D &radeon_bo_move_notify,
> > +	.delete_mem_notify =3D &radeon_bo_delete_mem_notify,
> >   	.io_mem_reserve =3D &radeon_ttm_io_mem_reserve,
> >   };
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 2b578012cdef..e2afab3d97ee 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -284,8 +284,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
> >   static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
> >   {
> > -	if (bo->bdev->driver->move_notify)
> > -		bo->bdev->driver->move_notify(bo, false, NULL);
> > +	if (bo->bdev->driver->delete_mem_notify)
> > +		bo->bdev->driver->delete_mem_notify(bo);
> >   	ttm_bo_tt_destroy(bo);
> >   	ttm_resource_free(bo, &bo->mem);
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> > index de25cf016be2..88be48ad0344 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > @@ -771,6 +771,12 @@ static int vmw_move(struct ttm_buffer_object *bo,
> >   	return ret;
> >   }
> > +static void
> > +vmw_delete_mem_notify(struct ttm_buffer_object *bo)
> > +{
> > +	vmw_move_notify(bo, false, NULL);
> > +}
> > +
> >   struct ttm_bo_driver vmw_bo_driver =3D {
> >   	.ttm_tt_create =3D &vmw_ttm_tt_create,
> >   	.ttm_tt_populate =3D &vmw_ttm_populate,
> > @@ -780,7 +786,7 @@ struct ttm_bo_driver vmw_bo_driver =3D {
> >   	.evict_flags =3D vmw_evict_flags,
> >   	.move =3D vmw_move,
> >   	.verify_access =3D vmw_verify_access,
> > -	.move_notify =3D vmw_move_notify,
> > +	.delete_mem_notify =3D vmw_delete_mem_notify,
> >   	.swap_notify =3D vmw_swap_notify,
> >   	.io_mem_reserve =3D &vmw_ttm_io_mem_reserve,
> >   };
> > diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> > index 72f106b335e9..29f6a1d1c853 100644
> > --- a/include/drm/ttm/ttm_bo_driver.h
> > +++ b/include/drm/ttm/ttm_bo_driver.h
> > @@ -156,15 +156,9 @@ struct ttm_bo_driver {
> >   			     struct file *filp);
> >   	/**
> > -	 * Hook to notify driver about a driver move so it
> > -	 * can do tiling things and book-keeping.
> > -	 *
> > -	 * @evict: whether this move is evicting the buffer from the graphics
> > -	 * address space
> > +	 * Hook to notify driver about a resource delete.
> >   	 */
> > -	void (*move_notify)(struct ttm_buffer_object *bo,
> > -			    bool evict,
> > -			    struct ttm_resource *new_mem);
> > +	void (*delete_mem_notify)(struct ttm_buffer_object *bo);
> >   	/**
> >   	 * notify the driver that we're about to swap out this bo
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
