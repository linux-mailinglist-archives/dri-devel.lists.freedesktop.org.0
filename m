Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E460A8C7E8F
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 00:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB4F10E358;
	Thu, 16 May 2024 22:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cAJw7pGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785FA10E358
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 22:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715898821;
 bh=fEbX+7ylWqAIZwkFyJWk3fwrpqNblL72bxWRqduXUxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cAJw7pGS7pPdPtQ50YTVb2xcfEYvPH0HyhvbVrebtFFvf/w0Fr09nLNoqO8IXQMmt
 b2fKlNn2efiah8db6Cum4qrnugXup+HiOspxIFEG8sT8WPjzlOR72rN7n24M0SNC43
 /VeyhULkNtguIsx5ABXOIpmPeTZQRLxW2347+dO0xmSVd43NtOydfMJCkudFXKyc3l
 iSth3ioiebD0lP3zVbVItwi5aj65F3s8F0SZZdBD0+baPxwj710PABw39IzNvlHanp
 qTDCONsNpIoh0vJBrN8JlAoi3j9DrcbykWA0FIedN8UETTWK1Edbo5blucsXfaM1N5
 uowUlW4DhiDmw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BD8183782190;
 Thu, 16 May 2024 22:33:40 +0000 (UTC)
Date: Thu, 16 May 2024 23:33:40 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/panthor: Enable fdinfo for memory stats
Message-ID: <sbti5hnhux35e334yxencz3nyt64l5ruvtcpjyim55mkm4r65h@qojfe6vldsqp>
References: <20240423213240.91412-1-adrian.larumbe@collabora.com>
 <20240423213240.91412-4-adrian.larumbe@collabora.com>
 <ZilCqPlJiTLfNQcG@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZilCqPlJiTLfNQcG@e110455-lin.cambridge.arm.com>
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

On 24.04.2024 18:34, Liviu Dudau wrote:
> Hello,
> 
> On Tue, Apr 23, 2024 at 10:32:36PM +0100, Adrián Larumbe wrote:
> > When vm-binding an already-created BO, the entirety of its virtual size is
> > then backed by system memory, so its RSS is always the same as its virtual
> > size.
> 
> How is that relevant to this patch? Or to put it differently: how are your
> words describing your code change here?

I think I wrote this as a throw-back to the time when we handled RSS calculations for
Panfrost objects, because heap BO's would be mapped on demand at every page fault.

I understand that without mention of this the remark seems out of context, so
depending on your taste I can either expand the message to underline this, or perhaps
drop it altogether.

I think I'd rather go for the latter, since the fact that panthor_gem_funcs includes
no binding for drm_gem_object_funcs::rss() should be enough of a hint at this.  

> > 
> > Also, we consider a PRIME imported BO to be resident if its matching
> > dma_buf has an open attachment, which means its backing storage had already
> > been allocated.
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Best regards,
> Liviu
> 
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index d6483266d0c2..386c0dfeeb5f 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -143,6 +143,17 @@ panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
> >  	return drm_gem_prime_export(obj, flags);
> >  }
> >  
> > +static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
> > +{
> > +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> > +	enum drm_gem_object_status res = 0;
> > +
> > +	if (bo->base.base.import_attach || bo->base.pages)
> > +		res |= DRM_GEM_OBJECT_RESIDENT;
> > +
> > +	return res;
> > +}
> > +
> >  static const struct drm_gem_object_funcs panthor_gem_funcs = {
> >  	.free = panthor_gem_free_object,
> >  	.print_info = drm_gem_shmem_object_print_info,
> > @@ -152,6 +163,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
> >  	.vmap = drm_gem_shmem_object_vmap,
> >  	.vunmap = drm_gem_shmem_object_vunmap,
> >  	.mmap = panthor_gem_mmap,
> > +	.status = panthor_gem_status,
> >  	.export = panthor_gem_prime_export,
> >  	.vm_ops = &drm_gem_shmem_vm_ops,
> >  };
> > -- 
> > 2.44.0
> > 

Adrian Larumbe
