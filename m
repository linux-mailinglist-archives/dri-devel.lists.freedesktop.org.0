Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED757E2653
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 15:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654AD10E327;
	Mon,  6 Nov 2023 14:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEF710E327
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699279891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A3CBuUCtBedu68S9oCLYgJPqgVDgAohwR9zGww68nTA=;
 b=Ln9jrD6gzJ8Wuwp3opX9ZTys9f656iLF9e2lBmnPUL1qbNHRX1N/a1kYztmbOpRZ5SlYtt
 0ZDOqQA0AILTs7RMI0PmbFgfnN4q7j2uKGleAusAMePYc+3IvwElJPg6eTriMQk2xi7eWJ
 ZJ2m45aZDDHScPY+X9YJuYIdD4r4CJc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-CbhvCJh_OrW6Sawe05YT6w-1; Mon, 06 Nov 2023 09:11:30 -0500
X-MC-Unique: CbhvCJh_OrW6Sawe05YT6w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9d30a6a67abso313724466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 06:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699279889; x=1699884689;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A3CBuUCtBedu68S9oCLYgJPqgVDgAohwR9zGww68nTA=;
 b=THEyjseF33UJ2Ci7qkR1vFXTAPGGBb9QTAfKJEMRia7OIWk8BUGh6JQCX71Y4eFK4+
 I4bj8SNZiFjZfo4LdzU8Pp+alVhYkHp6oWFg84PmPBHbxivLw3IurXblHGgYUvDGZY7c
 ZKpEouy3AnNSVF7ng/7ESvd8rE5KKSjMCO1KraeHPaBmdpZxgA5fgwFjQmVFOV2LWqRb
 oz/vfVebrExH90/GwhouqnpBhc4+ipbhbXaTM8wNtGstXLRjvcUsdy4f76K2SjpSR8Ln
 RnlAmtZkNq71KdOAFB70pQML++M+FxyZpAVcKI+NDAZ8c7/5UAuAp4szRb4yTsAprw50
 IBuQ==
X-Gm-Message-State: AOJu0YzRS9KpQ089ghlJ/QWGSFI8wJko7xogfaJmhrrVqxm7q12RB2Mn
 KAquGcINcqN9CboktiM1ciCEtB37EcVVlby2kPsJH3RzMd1Rnq1Hi4DhVecrrXJOGwo6vptXY/W
 iCDUbxOsWhst5QJTusWT+bK0YfTYQ
X-Received: by 2002:a17:907:2d91:b0:9ae:5765:c134 with SMTP id
 gt17-20020a1709072d9100b009ae5765c134mr17141273ejc.15.1699279889435; 
 Mon, 06 Nov 2023 06:11:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0BCmvs5f4weEDNDeRMJwTL6MtXtzVMt9RQ3pg2ptwgQYznWjPXq0igrkMRvZrdU21GlNm6Q==
X-Received: by 2002:a17:907:2d91:b0:9ae:5765:c134 with SMTP id
 gt17-20020a1709072d9100b009ae5765c134mr17141245ejc.15.1699279889002; 
 Mon, 06 Nov 2023 06:11:29 -0800 (PST)
Received: from pollux ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 mr31-20020a170907829f00b009dda52b1147sm3381918ejc.126.2023.11.06.06.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 06:11:28 -0800 (PST)
Date: Mon, 6 Nov 2023 15:11:25 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Message-ID: <ZUj0DdYZUgjhcvf5@pollux>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com>
 <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com>
 <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com>
MIME-Version: 1.0
In-Reply-To: <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com>
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

On Mon, Nov 06, 2023 at 02:05:13PM +0100, Christian König wrote:
> Am 06.11.23 um 13:16 schrieb Danilo Krummrich:
> > [SNIP]
> > This reference count just prevents that the VM is freed as long as other
> > ressources are attached to it that carry a VM pointer, such as mappings and
> > VM_BOs. The motivation for that are VM_BOs. For mappings it's indeed a bit
> > paranoid, but it doesn't hurt either and keeps it consistant.
> 
> Ah! Yeah, we have similar semantics in amdgpu as well.
> 
> But we keep the reference to the root GEM object and not the VM.
> 
> Ok, that makes much more sense then keeping one reference for each mapping.
> 
> > > Because of this the mapping should *never* have a reference to the VM, but
> > > rather the VM destroys all mapping when it is destroyed itself.
> > > 
> > > > Hence, If the VM is still alive at a point where you don't expect it to
> > > > be, then it's
> > > > simply a driver bug.
> > > Driver bugs is just what I try to prevent here. When individual mappings
> > > keep the VM structure alive then drivers are responsible to clean them up,
> > > if the VM cleans up after itself then we don't need to worry about it in the
> > > driver.
> > Drivers are *always* responsible for that. This has nothing to do with whether
> > the VM is reference counted or not. GPUVM can't clean up mappings after itself.
> 
> Why not?

I feel like we're talking past each other here, at least to some extend.
However, I can't yet see where exactly the misunderstanding resides.

> 
> At least in amdgpu we have it exactly like that. E.g. the higher level can
> cleanup the BO_VM structure at any time possible, even when there are
> mappings.

What do you mean with "cleanup the VM_BO structue" exactly?

The VM_BO structure keeps track of all the mappings mapped in the VM_BO's VM
being backed by the VM_BO's GEM object. And the GEM objects keeps a list of
the corresponding VM_BOs.

Hence, as long as there are mappings that this VM_BO keeps track of, this VM_BO
should stay alive.

> The VM then keeps track which areas still need to be invalidated
> in the physical representation of the page tables.

And the VM does that through its tree of mappings (struct drm_gpuva). Hence, if
the VM would just remove those structures on cleanup by itself, you'd loose the
ability of cleaning up the page tables. Unless, you track this separately, which
would make the whole tracking of GPUVM itself kinda pointless.

> 
> I would expect that the generalized GPU VM handling would need something
> similar. If we leave that to the driver then each driver would have to
> implement that stuff on it's own again.

Similar to what? What exactly do you think can be generalized here?

> 
> > If the driver left mappings, GPUVM would just leak them without reference count.
> > It doesn't know about the drivers surrounding structures, nor does it know about
> > attached ressources such as PT(E)s.
> 
> What are we talking with the word "mapping"? The BO_VM structure? Or each
> individual mapping?

An individual mapping represented by struct drm_gpuva.

> 
> E.g. what we need to prevent is that VM structure (or the root GEM object)
> is released while VM_BOs are still around. That's what I totally agree on.
> 
> But each individual mapping is a different story. Userspace can create so
> many of them that we probably could even overrun a 32bit counter quite
> easily.

REFCOUNT_MAX is specified as 0x7fff_ffff. I agree there can be a lot of
mappings, but (including the VM_BO references) more than 2.147.483.647 per VM?

> 
> > > When the mapping is destroyed with the VM drivers can't mess this common
> > > operation up. That's why this is more defensive.
> > > 
> > > What is a possible requirement is that external code needs to keep
> > > references to the VM, but *never* the VM to itself through the mappings. I
> > > would consider that a major bug in the component.
> > Obviously, you just (want to) apply a different semantics to this reference
> > count. It is meant to reflect that the VM structure can be freed, instead of the
> > VM can be cleaned up. If you want to latter, you can have a driver specifc
> > reference count for that in the exact same way as it was before this patch.
> 
> Yeah, it becomes clear that you try to solve some different problem than I
> have expected.
> 
> Regards,
> Christian.
> 
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > > Reference counting is nice when you don't know who else is referring
> > > > > to your VM, but the cost is that you also don't know when the object
> > > > > will guardedly be destroyed.
> > > > > 
> > > > > I can trivially work around this by saying that the generic GPUVM
> > > > > object has a different lifetime than the amdgpu specific object, but
> > > > > that opens up doors for use after free again.
> > > > If your driver never touches the VM's reference count and exits the VM
> > > > with a clean state
> > > > (no mappings and no VM_BOs left), effectively, this is the same as
> > > > having no reference
> > > > count.
> > > > 
> > > > In the very worst case you could argue that we trade a potential UAF
> > > > *and* memroy leak
> > > > (no reference count) with *only* a memory leak (with reference count),
> > > > which to me seems
> > > > reasonable.
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > > Thanks,
> > > > > > > Christian.
> > > > > > [1]https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/
> > > > > > 
> > > > > > 
> > > > > > > > Signed-off-by: Danilo Krummrich<dakr@redhat.com>
> > > > > > > > ---
> > > > > > > >     drivers/gpu/drm/drm_gpuvm.c            | 44
> > > > > > > > +++++++++++++++++++-------
> > > > > > > >     drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
> > > > > > > >     include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
> > > > > > > >     3 files changed, 78 insertions(+), 17 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > > > > > > > b/drivers/gpu/drm/drm_gpuvm.c
> > > > > > > > index 53e2c406fb04..6a88eafc5229 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > > > > > @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm
> > > > > > > > *gpuvm, const char *name,
> > > > > > > >         gpuvm->rb.tree = RB_ROOT_CACHED;
> > > > > > > >         INIT_LIST_HEAD(&gpuvm->rb.list);
> > > > > > > > +    kref_init(&gpuvm->kref);
> > > > > > > > +
> > > > > > > >         gpuvm->name = name ? name : "unknown";
> > > > > > > >         gpuvm->flags = flags;
> > > > > > > >         gpuvm->ops = ops;
> > > > > > > > @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm
> > > > > > > > *gpuvm, const char *name,
> > > > > > > >     }
> > > > > > > >     EXPORT_SYMBOL_GPL(drm_gpuvm_init);
> > > > > > > > -/**
> > > > > > > > - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
> > > > > > > > - * @gpuvm: pointer to the &drm_gpuvm to clean up
> > > > > > > > - *
> > > > > > > > - * Note that it is a bug to call this function on a
> > > > > > > > manager that still
> > > > > > > > - * holds GPU VA mappings.
> > > > > > > > - */
> > > > > > > > -void
> > > > > > > > -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> > > > > > > > +static void
> > > > > > > > +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
> > > > > > > >     {
> > > > > > > >         gpuvm->name = NULL;
> > > > > > > > @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> > > > > > > >         drm_gem_object_put(gpuvm->r_obj);
> > > > > > > >     }
> > > > > > > > -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> > > > > > > > +
> > > > > > > > +static void
> > > > > > > > +drm_gpuvm_free(struct kref *kref)
> > > > > > > > +{
> > > > > > > > +    struct drm_gpuvm *gpuvm = container_of(kref, struct
> > > > > > > > drm_gpuvm, kref);
> > > > > > > > +
> > > > > > > > +    if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
> > > > > > > > +        return;
> > > > > > > > +
> > > > > > > > +    drm_gpuvm_fini(gpuvm);
> > > > > > > > +
> > > > > > > > +    gpuvm->ops->vm_free(gpuvm);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
> > > > > > > > + * @gpuvm: the &drm_gpuvm to release the reference of
> > > > > > > > + *
> > > > > > > > + * This releases a reference to @gpuvm.
> > > > > > > > + */
> > > > > > > > +void
> > > > > > > > +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
> > > > > > > > +{
> > > > > > > > +    if (gpuvm)
> > > > > > > > +        kref_put(&gpuvm->kref, drm_gpuvm_free);
> > > > > > > > +}
> > > > > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
> > > > > > > >     static int
> > > > > > > >     __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> > > > > > > > @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> > > > > > > >         if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
> > > > > > > >             return -EINVAL;
> > > > > > > > -    return __drm_gpuva_insert(gpuvm, va);
> > > > > > > > +    return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
> > > > > > > >     }
> > > > > > > >     EXPORT_SYMBOL_GPL(drm_gpuva_insert);
> > > > > > > > @@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
> > > > > > > >         }
> > > > > > > >         __drm_gpuva_remove(va);
> > > > > > > > +    drm_gpuvm_put(va->vm);
> > > > > > > >     }
> > > > > > > >     EXPORT_SYMBOL_GPL(drm_gpuva_remove);
> > > > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > > > > > b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > > > > > index 54be12c1272f..cb2f06565c46 100644
> > > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > > > > > @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct
> > > > > > > > nouveau_bo *nvbo)
> > > > > > > >         }
> > > > > > > >     }
> > > > > > > > +static void
> > > > > > > > +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
> > > > > > > > +{
> > > > > > > > +    struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
> > > > > > > > +
> > > > > > > > +    kfree(uvmm);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static const struct drm_gpuvm_ops gpuvm_ops = {
> > > > > > > > +    .vm_free = nouveau_uvmm_free,
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >     int
> > > > > > > >     nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
> > > > > > > >                    void *data,
> > > > > > > > @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct
> > > > > > > > drm_device *dev,
> > > > > > > >                    NOUVEAU_VA_SPACE_END,
> > > > > > > >                    init->kernel_managed_addr,
> > > > > > > >                    init->kernel_managed_size,
> > > > > > > > -               NULL);
> > > > > > > > +               &gpuvm_ops);
> > > > > > > >         /* GPUVM takes care from here on. */
> > > > > > > >         drm_gem_object_put(r_obj);
> > > > > > > > @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct
> > > > > > > > drm_device *dev,
> > > > > > > >         return 0;
> > > > > > > >     out_gpuvm_fini:
> > > > > > > > -    drm_gpuvm_destroy(&uvmm->base);
> > > > > > > > -    kfree(uvmm);
> > > > > > > > +    drm_gpuvm_put(&uvmm->base);
> > > > > > > >     out_unlock:
> > > > > > > >         mutex_unlock(&cli->mutex);
> > > > > > > >         return ret;
> > > > > > > > @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
> > > > > > > >         mutex_lock(&cli->mutex);
> > > > > > > >         nouveau_vmm_fini(&uvmm->vmm);
> > > > > > > > -    drm_gpuvm_destroy(&uvmm->base);
> > > > > > > > -    kfree(uvmm);
> > > > > > > > +    drm_gpuvm_put(&uvmm->base);
> > > > > > > >         mutex_unlock(&cli->mutex);
> > > > > > > >     }
> > > > > > > > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > > > > > > > index 0c2e24155a93..4e6e1fd3485a 100644
> > > > > > > > --- a/include/drm/drm_gpuvm.h
> > > > > > > > +++ b/include/drm/drm_gpuvm.h
> > > > > > > > @@ -247,6 +247,11 @@ struct drm_gpuvm {
> > > > > > > >             struct list_head list;
> > > > > > > >         } rb;
> > > > > > > > +    /**
> > > > > > > > +     * @kref: reference count of this object
> > > > > > > > +     */
> > > > > > > > +    struct kref kref;
> > > > > > > > +
> > > > > > > >         /**
> > > > > > > >          * @kernel_alloc_node:
> > > > > > > >          *
> > > > > > > > @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct
> > > > > > > > drm_gpuvm *gpuvm, const char *name,
> > > > > > > >                 u64 start_offset, u64 range,
> > > > > > > >                 u64 reserve_offset, u64 reserve_range,
> > > > > > > >                 const struct drm_gpuvm_ops *ops);
> > > > > > > > -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
> > > > > > > > + * @gpuvm: the &drm_gpuvm to acquire the reference of
> > > > > > > > + *
> > > > > > > > + * This function acquires an additional reference to
> > > > > > > > @gpuvm. It is illegal to
> > > > > > > > + * call this without already holding a reference. No locks required.
> > > > > > > > + */
> > > > > > > > +static inline struct drm_gpuvm *
> > > > > > > > +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
> > > > > > > > +{
> > > > > > > > +    kref_get(&gpuvm->kref);
> > > > > > > > +
> > > > > > > > +    return gpuvm;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
> > > > > > > >     bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
> > > > > > > > u64 addr, u64 range);
> > > > > > > >     bool drm_gpuvm_interval_empty(struct drm_gpuvm
> > > > > > > > *gpuvm, u64 addr, u64 range);
> > > > > > > > @@ -673,6 +694,14 @@ static inline void
> > > > > > > > drm_gpuva_init_from_op(struct drm_gpuva *va,
> > > > > > > >      * operations to drivers.
> > > > > > > >      */
> > > > > > > >     struct drm_gpuvm_ops {
> > > > > > > > +    /**
> > > > > > > > +     * @vm_free: called when the last reference of a
> > > > > > > > struct drm_gpuvm is
> > > > > > > > +     * dropped
> > > > > > > > +     *
> > > > > > > > +     * This callback is mandatory.
> > > > > > > > +     */
> > > > > > > > +    void (*vm_free)(struct drm_gpuvm *gpuvm);
> > > > > > > > +
> > > > > > > >         /**
> > > > > > > >          * @op_alloc: called when the &drm_gpuvm allocates
> > > > > > > >          * a struct drm_gpuva_op

