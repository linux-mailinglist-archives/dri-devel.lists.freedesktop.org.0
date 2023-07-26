Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92248762EEC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B97310E3FB;
	Wed, 26 Jul 2023 07:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D6310E3FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:57:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 56C9C6607115;
 Wed, 26 Jul 2023 08:57:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690358273;
 bh=N2O26sXW+3neyTVNvx6UPXNi7HVo1l52a8zTy/Ppwvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ccKxWSHuBg+g1lGWxk0lMmbj56df5eGcG/vWUxstJFiqMnE8635EgTxGQxLDzTUg5
 LlUUu1DyjpnGBhIa+14ga9P8BKpOIBKQiB+6/ByL6dfL3e4ZY5hOhDRaPpQfatDtgc
 a9OyPl3sJodJSUBnFJzHFVZHu+4Ln6+9VrvWuAveu7q5XuNEvL23d5/C2Dt1Rrsor1
 7VD7FZK0TSVDbyyW9B75OOR13KTjG/SQDpA1Jx31gumEwxMwmmdGlw7nKruoylbR8N
 dhMyqD0kTaYkJwL8hBjM1di26hKP5fRFSFsMPTiczzYnq/QOaUhN7f7xH34c84i3+s
 Cq6xYXir7u8Pw==
Date: Wed, 26 Jul 2023 09:57:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Reset vma->vm_ops before calling
 dma_buf_mmap()
Message-ID: <20230726095750.51b1e7e0@collabora.com>
In-Reply-To: <77a41226-b671-1895-6182-457f7fee9bda@suse.de>
References: <20230724112610.60974-1-boris.brezillon@collabora.com>
 <77a41226-b671-1895-6182-457f7fee9bda@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Roman Stratiienko <roman.stratiienko@globallogic.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jul 2023 20:50:43 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 24.07.23 um 13:26 schrieb Boris Brezillon:
> > The dma-buf backend is supposed to provide its own vm_ops, but some
> > implementation just have nothing special to do and leave vm_ops
> > untouched, probably expecting this field to be zero initialized (this
> > is the case with the system_heap implementation for instance).
> > Let's reset vma->vm_ops to NULL to keep things working with these
> > implementations.  
> 
> Thanks for your patch. This bug could affect a number of GEM 
> implementations.

The one I found that is probably hit by the same problem is
exynos_drm_gem.c, but there might be others...

> Instead of fixing this individually, could we set the 
> fields conditionally at
> 
>  
> https://elixir.bootlin.com/linux/v6.4/source/drivers/gpu/drm/drm_gem.c#L1042
> 
> ?
> 
> Something like
> 
>    if (!object->import_attach) {

If guess you meant the opposite: if (object->import_attach)

>      vma->priv =
>      vma->ops =
>    }

I suspect it will break other drivers relying on the fact vma->vm_ops
is auto-magically assigned to obj->funcs->vm_ops, even for prime
buffers. The one I'm looking at right now is amdgpu: it has its own way
of mapping imported dma-bufs, and resetting vma->vm_ops to NULL means
the ttm layer will fallback to the default ttm_bo_vm_ops, which is not
what amdgpu wants.

AFAICT, etnaviv is in the same situtation, though it's probably easier
to fix, given the open/close hooks for imported objects doesn't do much.

TLDR; yes, it'd be great to have this 'fix' moved at the core level, or
even have a dedicated path for dma-buf objects, but I fear it's going
to fall apart if we do that.

One option would be to add a dma_buf_vm_ops field to
drm_gem_object_funcs, add a
DRM_GEM_OBJ_FUNCS_SET_VM_OPS(vm_ops, dma_buf_vm_ops) macro that would
assign both dma_buf_vm_ops and vm_ops, patch all existing drivers
to use this macro (mechanical change where we assign both fields to the
same value, so we don't break anything, but don't fix broken
implementations either). Once this is in place, we can have the
following in drm_gem_mmap_obj():

	vma->vm_ops = object->import_attach ?
		      object->funcs->dma_buf_vm_ops :
		      object->funcs->vm_ops;
	vma->vm_private_data = vma->vm_ops ? obj : NULL;

And then we can specialize the shmem and exynos implementations
(actually, any implementation that's entirely deferring the mmap to the
dma-buf layer), so they explicitly set dma_buf_vm_ops to NULL.

Honestly, I'm not sure this is better than manually assigning
vma->vm_ops to NULL in the driver mmap function, but at least people
will have to consider it when they write their driver ('do I want
the same mmap behavior for dmabuf and !dmabuf?').

Anyway, I think this fix is worth applying, because it's self-contained
and easy to backport. We can discuss and sort out how we want to fix the
problem more generically later on.

> 
> plus a descriptive comment like the one you have in your patch.
> 
> Best regards
> Thomas
> 
> > 
> > Fixes: 26d3ac3cb04d ("drm/shmem-helpers: Redirect mmap for imported dma-buf")
> > Cc: <stable@vger.kernel.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Reported-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/drm_gem_shmem_helper.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 4ea6507a77e5..baaf0e0feb06 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -623,7 +623,13 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
> >   	int ret;
> >   
> >   	if (obj->import_attach) {
> > +		/* Reset both vm_ops and vm_private_data, so we don't end up with
> > +		 * vm_ops pointing to our implementation if the dma-buf backend
> > +		 * doesn't set those fields.
> > +		 */
> >   		vma->vm_private_data = NULL;
> > +		vma->vm_ops = NULL;
> > +
> >   		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
> >   
> >   		/* Drop the reference drm_gem_mmap_obj() acquired.*/  
> 

