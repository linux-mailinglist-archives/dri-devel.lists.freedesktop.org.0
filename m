Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F60C8050F8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 11:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E06610E4E4;
	Tue,  5 Dec 2023 10:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1541310E4E3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 10:45:26 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B0596602F1E;
 Tue,  5 Dec 2023 10:45:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701773124;
 bh=IKTn8O+SstX/pQW7d/EruX3HIOiN7KyQDAK6SZjaTuk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=InCrVAHH6s2h1EKKNm/D9OEf/g5BrFmNb/s0G/rPMo2XWOlit2WRoRi+CQqpAY/xQ
 Nx83I1piga68OSoZGPzcjWgnsMQMdLi/yxsqWYOCbYvYH8UORQbayW5NHo2ZtXJEET
 eR4sI8Lt4JeDpgnAkMtIIAfRJkSrmbNnzfFn4JxyeOGzLqZ7FmlA0sGRPCrW6uGpwa
 M+uowkxnvzw+SnqMJIyswC9CZ+3p2plBBK85akzjB27Bq4paBwTXNLP+a/s8Dx93s3
 ao9Jv4QzhXY5bMs1uCKKVvzvLUe8S/9Z3ugMJMUkyfnUUVa8XYVcqtg5HfWI/MWwB0
 +vJSJs3x0bu5w==
Date: Tue, 5 Dec 2023 11:45:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH] drm/gpuvm: Let drm_gpuvm_bo_put() report when the vm_bo
 object is destroyed
Message-ID: <20231205114521.59fe56dd@collabora.com>
In-Reply-To: <a5d208d1-4215-4432-ace7-e13eee0f7851@redhat.com>
References: <20231204151406.1977285-1-boris.brezillon@collabora.com>
 <a5d208d1-4215-4432-ace7-e13eee0f7851@redhat.com>
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Dec 2023 02:46:32 +0100
Danilo Krummrich <dakr@redhat.com> wrote:

> On 12/4/23 16:14, Boris Brezillon wrote:
> > Some users need to release resources attached to the vm_bo object when
> > it's destroyed. In Panthor's case, we need to release the pin ref so
> > BO pages can be returned to the system when all GPU mappings are gone.
> > 
> > This could be done through a custom drm_gpuvm::vm_bo_free() hook, but
> > this has all sort of locking implications that would force us to expose
> > a drm_gem_shmem_unpin_locked() helper, not to mention the fact that
> > having a ::vm_bo_free() implementation without a ::vm_bo_alloc() one
> > seems odd. So let's keep things simple, and extend drm_gpuvm_bo_put()
> > to report when the object is destroyed.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>

Queued to drm-misc-next.

> 
> > ---
> >   drivers/gpu/drm/drm_gpuvm.c | 8 ++++++--
> >   include/drm/drm_gpuvm.h     | 2 +-
> >   2 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 54f5e8851de5..ae13e2d63637 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -1502,14 +1502,18 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> >    * hold the dma-resv or driver specific GEM gpuva lock.
> >    *
> >    * This function may only be called from non-atomic context.
> > + *
> > + * Returns: true if vm_bo was destroyed, false otherwise.
> >    */
> > -void
> > +bool
> >   drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
> >   {
> >   	might_sleep();
> >   
> >   	if (vm_bo)
> > -		kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
> > +		return !!kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
> > +
> > +	return false;
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
> >   
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index f94fec9a8517..7cc41a7d86d5 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -738,7 +738,7 @@ drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
> >   	return vm_bo;
> >   }
> >   
> > -void drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
> > +bool drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
> >   
> >   struct drm_gpuvm_bo *
> >   drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,  
> 

