Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B757E039B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 14:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5579C10E9D4;
	Fri,  3 Nov 2023 13:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D716010E9D3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699017247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeaDcEiv+OJg0rs4GLDtEP9L7bFfkuejpkBRQMtkogU=;
 b=V5pFrTl10ZBw5FWclt5E2MjhSSa5yxLc97YcnOPL+VcOxq5SyImhErSJjxMgdPiubeLlu9
 n0dY/39KCPSEynzPQi9uQgRiklZrzZToGhDfYZMzGhCmdDCiglIimvR/6cCYqr+jbIZnQy
 l7JG/lMogr1nB8sbZcJVd3JOWHEuODo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-bebrDEGePB-zAS4YTNkrHA-1; Fri, 03 Nov 2023 09:14:05 -0400
X-MC-Unique: bebrDEGePB-zAS4YTNkrHA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-53da5262466so1777962a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 06:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699017244; x=1699622044;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JeaDcEiv+OJg0rs4GLDtEP9L7bFfkuejpkBRQMtkogU=;
 b=QxMXOyfl3JHGgNFGWS9ufV00MvzpEmhnJwZvFEvj+VVipX/9NIWMIrNWAIMQdc57l7
 0S2oFpODU8FLEA0y5JK2pUJxFcl8FsI0fL1SyCb7oeWFp8p5CUCDMUVZ2hJxW1L1l8f1
 yxsn3jcuVLpIhT/nK+oZHKwdzHGOVnl4Lb7Ub4AYcgahFKmCQ3tn1Xuc0QQTUyBs7iK3
 uBeENgO5YFjUCIOGQEzPNl0qS4UhOh+68p8gpxyZio+HUzqzq6E+F/R54r3TqnK2ylby
 mf8WdOw03hQnvIuEiwkCK0/2Cn49RV6rO0y6UBoQIA8Cn7LsG6KAbYK7cKC/YiuN84x9
 aFBg==
X-Gm-Message-State: AOJu0Yy0AAJTsOxoDTQBlxwLBfNgZqQdWIKnjowI36vxGlwqDEQhRqZg
 Nq22NeiP3BBSFL1RSj9eDwOMRGfhLYUSWJ8CWkcFymTXO+9TEiupCHLPi7Fujpid872C6MNtkjB
 cNEHBIBed7rGhmKfPmMzQu+Fa7fN+
X-Received: by 2002:a50:aad8:0:b0:543:6444:ef2a with SMTP id
 r24-20020a50aad8000000b005436444ef2amr7882709edc.32.1699017244401; 
 Fri, 03 Nov 2023 06:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3lBEphXT3+HJ50//TEhF8drMREBzcuwnqkwelfwZLHV53PXj0681AMylRS6SA/ZFsXHXmIQ==
X-Received: by 2002:a50:aad8:0:b0:543:6444:ef2a with SMTP id
 r24-20020a50aad8000000b005436444ef2amr7882683edc.32.1699017244056; 
 Fri, 03 Nov 2023 06:14:04 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a056402094f00b0053116e45317sm944419edz.44.2023.11.03.06.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 06:14:03 -0700 (PDT)
Date: Fri, 3 Nov 2023 14:14:01 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Message-ID: <ZUTyGTxcH7WlHKsv@pollux>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com>
MIME-Version: 1.0
In-Reply-To: <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 03, 2023 at 08:18:35AM +0100, Christian König wrote:
> Am 02.11.23 um 00:31 schrieb Danilo Krummrich:
> > Implement reference counting for struct drm_gpuvm.
> 
> From the design point of view what is that good for?

It was discussed in this thread [1].

Essentially, the idea is to make sure that vm_bo->vm is always valid without the
driver having the need to take extra care. It also ensures that GPUVM can't be
freed with mappings still held.

> 
> Background is that the most common use case I see is that this object is
> embedded into something else and a reference count is then not really a good
> idea.

Do you have a specific use-case in mind where this would interfere?

> 
> Thanks,
> Christian.

[1] https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/

> 
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >   drivers/gpu/drm/drm_gpuvm.c            | 44 +++++++++++++++++++-------
> >   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
> >   include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
> >   3 files changed, 78 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 53e2c406fb04..6a88eafc5229 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> >   	gpuvm->rb.tree = RB_ROOT_CACHED;
> >   	INIT_LIST_HEAD(&gpuvm->rb.list);
> > +	kref_init(&gpuvm->kref);
> > +
> >   	gpuvm->name = name ? name : "unknown";
> >   	gpuvm->flags = flags;
> >   	gpuvm->ops = ops;
> > @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuvm_init);
> > -/**
> > - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
> > - * @gpuvm: pointer to the &drm_gpuvm to clean up
> > - *
> > - * Note that it is a bug to call this function on a manager that still
> > - * holds GPU VA mappings.
> > - */
> > -void
> > -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> > +static void
> > +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
> >   {
> >   	gpuvm->name = NULL;
> > @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> >   	drm_gem_object_put(gpuvm->r_obj);
> >   }
> > -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> > +
> > +static void
> > +drm_gpuvm_free(struct kref *kref)
> > +{
> > +	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
> > +
> > +	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
> > +		return;
> > +
> > +	drm_gpuvm_fini(gpuvm);
> > +
> > +	gpuvm->ops->vm_free(gpuvm);
> > +}
> > +
> > +/**
> > + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
> > + * @gpuvm: the &drm_gpuvm to release the reference of
> > + *
> > + * This releases a reference to @gpuvm.
> > + */
> > +void
> > +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
> > +{
> > +	if (gpuvm)
> > +		kref_put(&gpuvm->kref, drm_gpuvm_free);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
> >   static int
> >   __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> > @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> >   	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
> >   		return -EINVAL;
> > -	return __drm_gpuva_insert(gpuvm, va);
> > +	return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_insert);
> > @@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
> >   	}
> >   	__drm_gpuva_remove(va);
> > +	drm_gpuvm_put(va->vm);
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gpuva_remove);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > index 54be12c1272f..cb2f06565c46 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
> >   	}
> >   }
> > +static void
> > +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
> > +{
> > +	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
> > +
> > +	kfree(uvmm);
> > +}
> > +
> > +static const struct drm_gpuvm_ops gpuvm_ops = {
> > +	.vm_free = nouveau_uvmm_free,
> > +};
> > +
> >   int
> >   nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
> >   			   void *data,
> > @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
> >   		       NOUVEAU_VA_SPACE_END,
> >   		       init->kernel_managed_addr,
> >   		       init->kernel_managed_size,
> > -		       NULL);
> > +		       &gpuvm_ops);
> >   	/* GPUVM takes care from here on. */
> >   	drm_gem_object_put(r_obj);
> > @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
> >   	return 0;
> >   out_gpuvm_fini:
> > -	drm_gpuvm_destroy(&uvmm->base);
> > -	kfree(uvmm);
> > +	drm_gpuvm_put(&uvmm->base);
> >   out_unlock:
> >   	mutex_unlock(&cli->mutex);
> >   	return ret;
> > @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
> >   	mutex_lock(&cli->mutex);
> >   	nouveau_vmm_fini(&uvmm->vmm);
> > -	drm_gpuvm_destroy(&uvmm->base);
> > -	kfree(uvmm);
> > +	drm_gpuvm_put(&uvmm->base);
> >   	mutex_unlock(&cli->mutex);
> >   }
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index 0c2e24155a93..4e6e1fd3485a 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -247,6 +247,11 @@ struct drm_gpuvm {
> >   		struct list_head list;
> >   	} rb;
> > +	/**
> > +	 * @kref: reference count of this object
> > +	 */
> > +	struct kref kref;
> > +
> >   	/**
> >   	 * @kernel_alloc_node:
> >   	 *
> > @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> >   		    u64 start_offset, u64 range,
> >   		    u64 reserve_offset, u64 reserve_range,
> >   		    const struct drm_gpuvm_ops *ops);
> > -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> > +
> > +/**
> > + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
> > + * @gpuvm: the &drm_gpuvm to acquire the reference of
> > + *
> > + * This function acquires an additional reference to @gpuvm. It is illegal to
> > + * call this without already holding a reference. No locks required.
> > + */
> > +static inline struct drm_gpuvm *
> > +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
> > +{
> > +	kref_get(&gpuvm->kref);
> > +
> > +	return gpuvm;
> > +}
> > +
> > +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
> >   bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
> >   bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
> > @@ -673,6 +694,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
> >    * operations to drivers.
> >    */
> >   struct drm_gpuvm_ops {
> > +	/**
> > +	 * @vm_free: called when the last reference of a struct drm_gpuvm is
> > +	 * dropped
> > +	 *
> > +	 * This callback is mandatory.
> > +	 */
> > +	void (*vm_free)(struct drm_gpuvm *gpuvm);
> > +
> >   	/**
> >   	 * @op_alloc: called when the &drm_gpuvm allocates
> >   	 * a struct drm_gpuva_op
> 

