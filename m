Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC17E2117
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 13:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E6710E2D5;
	Mon,  6 Nov 2023 12:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18B010E2D8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699272986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CzXLOj9MKAbvGiW8o8+/Q1C6f0siyVr3rxFScFSInA=;
 b=d0yQ0QDYE9gQFmzr0Fdc87GoqJwsGsw8Jan3Povof1MFTiuHlvtsROynFipJQ2EJxfK2/c
 EVxhQWsZlYOWeH3sishOeZwrUWAhdxmD3e9nIS5df9lUfuuvtNxpv48M3Ggbcl+Z6/P2fq
 1npMUARtVnGFbb+0zh61mlHR9+Mtjqc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-prV40a3tMgyZmmopSVnsmw-1; Mon, 06 Nov 2023 07:16:25 -0500
X-MC-Unique: prV40a3tMgyZmmopSVnsmw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9c15543088aso489786166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 04:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699272984; x=1699877784;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CzXLOj9MKAbvGiW8o8+/Q1C6f0siyVr3rxFScFSInA=;
 b=Db28IbQ9dtu6NT2R+JsG2yfYxymWO2UFNWsPil1MSFnkR1eNmJcR6hJ4+SVyw3iKNr
 HdqM0D21WZq1fZkUvnKagxWEO/cSqMGX/4kHSlQVYt/WiQxEyTAek5YlgabsyvaZtkEh
 6nfgh4AKK3BIrxTV21/cgDtMB3IPa/y7djFUlD3nLrf4JV8kNTrVSEjjoI5wdLIw4ltv
 hgk09bNk4H8HsNmrG4k1JhfvFP9rz8fLKxL2TGm5BjdGmykkaOr4HxeAedmLHulHk6NG
 3rc9bU4bwcBX0xpmOY2/FSEZ7q3ZudNVdKgk/25MnnfgkWyFTt54ITNk8g+gOZIvNQIN
 hPWw==
X-Gm-Message-State: AOJu0Yx5EVK/dUSE5nYW13z5/1hsFSDN3JMonSVIbE48OwMLQVJ2Da7v
 OuZcDBFzeDgBU+I54y9SI2eB1TpGB8+CeOqBzMPMjo2slla5HVG2qXZJId06V1a5IBQ+z5Jek5a
 QJ1VRhISII/xR3odQGt3222Ok7qSU
X-Received: by 2002:a17:907:971d:b0:9a1:8993:9532 with SMTP id
 jg29-20020a170907971d00b009a189939532mr10495083ejc.30.1699272984259; 
 Mon, 06 Nov 2023 04:16:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUgAEDfAJmw4pZnZyzo84xDCCxrHS0EphRdoqHH3atrmjbZ4VDAsE+ewCrg4/JxB5A0FrlYA==
X-Received: by 2002:a17:907:971d:b0:9a1:8993:9532 with SMTP id
 jg29-20020a170907971d00b009a189939532mr10495057ejc.30.1699272983897; 
 Mon, 06 Nov 2023 04:16:23 -0800 (PST)
Received: from pollux ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 t26-20020a056402241a00b00543597cd190sm4267631eda.47.2023.11.06.04.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 04:16:23 -0800 (PST)
Date: Mon, 6 Nov 2023 13:16:20 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Message-ID: <ZUjZFFtLM435tTxJ@pollux>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com>
 <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com>
MIME-Version: 1.0
In-Reply-To: <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com>
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

On Mon, Nov 06, 2023 at 10:14:29AM +0100, Christian König wrote:
> Am 03.11.23 um 16:34 schrieb Danilo Krummrich:
> [SNIP]
> > > 
> > > Especially we most likely don't want the VM to live longer than the
> > > application which originally used it. If you make the GPUVM an
> > > independent object you actually open up driver abuse for the
> > > lifetime of this.
> > 
> > Right, we don't want that. But I don't see how the reference count
> > prevents that.
> 
> It doesn't prevents that, it's just not the most defensive approach.
> 
> > 
> > Independant object is relative. struct drm_gpuvm is still embedded into
> > a driver
> > specific structure. It's working the same way as with struct
> > drm_gem_obejct.
> > 
> > > 
> > > Additional to that see below for a quite real problem with this.
> > > 
> > > > > Background is that the most common use case I see is that
> > > > > this object is
> > > > > embedded into something else and a reference count is then
> > > > > not really a good
> > > > > idea.
> > > > Do you have a specific use-case in mind where this would interfere?
> > > 
> > > Yes, absolutely. For an example see amdgpu_mes_self_test(), here we
> > > initialize a temporary amdgpu VM for an in kernel unit test which
> > > runs during driver load.
> > > 
> > > When the function returns I need to guarantee that the VM is
> > > destroyed or otherwise I will mess up normal operation.
> > 
> > Nothing prevents that. The reference counting is well defined. If the
> > driver did not
> > take additional references (which is clearly up to the driver taking
> > care of) and all
> > VM_BOs and mappings are cleaned up, the reference count is guaranteed to
> > be 1 at this
> > point.
> > 
> > Also note that if the driver would have not cleaned up all VM_BOs and
> > mappings before
> > shutting down the VM, it would have been a bug anyways and the driver
> > would potentially
> > leak memory and UAF issues.
> 
> Exactly that's what I'm talking about why I think this is an extremely bad
> idea.
> 
> It's a perfect normal operation to shutdown the VM while there are still
> mappings. This is just what happens when you kill an application.

Shut down the VM in terms of removing existing mappings, doing driver specifc
cleanup operations, etc. But not freeing the VM structure yet. That's what you
gonna do after you cleaned up everything.

So, when your application gets killed, you just call your driver_vm_destroy()
function, cleaning up all mappings etc. and then you call drm_gpuvm_put(). And
if you did a decent job cleaning things up (removing existing mappings etc.)
this drm_gpuvm_put() call will result into the vm_free() callback being called.

This reference count just prevents that the VM is freed as long as other
ressources are attached to it that carry a VM pointer, such as mappings and
VM_BOs. The motivation for that are VM_BOs. For mappings it's indeed a bit
paranoid, but it doesn't hurt either and keeps it consistant.

> 
> Because of this the mapping should *never* have a reference to the VM, but
> rather the VM destroys all mapping when it is destroyed itself.
> 
> > Hence, If the VM is still alive at a point where you don't expect it to
> > be, then it's
> > simply a driver bug.
> 
> Driver bugs is just what I try to prevent here. When individual mappings
> keep the VM structure alive then drivers are responsible to clean them up,
> if the VM cleans up after itself then we don't need to worry about it in the
> driver.

Drivers are *always* responsible for that. This has nothing to do with whether
the VM is reference counted or not. GPUVM can't clean up mappings after itself.
If the driver left mappings, GPUVM would just leak them without reference count.
It doesn't know about the drivers surrounding structures, nor does it know about
attached ressources such as PT(E)s. 

> 
> When the mapping is destroyed with the VM drivers can't mess this common
> operation up. That's why this is more defensive.
> 
> What is a possible requirement is that external code needs to keep
> references to the VM, but *never* the VM to itself through the mappings. I
> would consider that a major bug in the component.

Obviously, you just (want to) apply a different semantics to this reference
count. It is meant to reflect that the VM structure can be freed, instead of the
VM can be cleaned up. If you want to latter, you can have a driver specifc
reference count for that in the exact same way as it was before this patch.

> 
> Regards,
> Christian.
> 
> > 
> > > 
> > > Reference counting is nice when you don't know who else is referring
> > > to your VM, but the cost is that you also don't know when the object
> > > will guardedly be destroyed.
> > > 
> > > I can trivially work around this by saying that the generic GPUVM
> > > object has a different lifetime than the amdgpu specific object, but
> > > that opens up doors for use after free again.
> > 
> > If your driver never touches the VM's reference count and exits the VM
> > with a clean state
> > (no mappings and no VM_BOs left), effectively, this is the same as
> > having no reference
> > count.
> > 
> > In the very worst case you could argue that we trade a potential UAF
> > *and* memroy leak
> > (no reference count) with *only* a memory leak (with reference count),
> > which to me seems
> > reasonable.
> > 
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > > Thanks,
> > > > > Christian.
> > > > [1]https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/
> > > > 
> > > > 
> > > > > > Signed-off-by: Danilo Krummrich<dakr@redhat.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/drm_gpuvm.c            | 44
> > > > > > +++++++++++++++++++-------
> > > > > >    drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
> > > > > >    include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
> > > > > >    3 files changed, 78 insertions(+), 17 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > > > > > b/drivers/gpu/drm/drm_gpuvm.c
> > > > > > index 53e2c406fb04..6a88eafc5229 100644
> > > > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > > > @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm
> > > > > > *gpuvm, const char *name,
> > > > > >        gpuvm->rb.tree = RB_ROOT_CACHED;
> > > > > >        INIT_LIST_HEAD(&gpuvm->rb.list);
> > > > > > +    kref_init(&gpuvm->kref);
> > > > > > +
> > > > > >        gpuvm->name = name ? name : "unknown";
> > > > > >        gpuvm->flags = flags;
> > > > > >        gpuvm->ops = ops;
> > > > > > @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm
> > > > > > *gpuvm, const char *name,
> > > > > >    }
> > > > > >    EXPORT_SYMBOL_GPL(drm_gpuvm_init);
> > > > > > -/**
> > > > > > - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
> > > > > > - * @gpuvm: pointer to the &drm_gpuvm to clean up
> > > > > > - *
> > > > > > - * Note that it is a bug to call this function on a
> > > > > > manager that still
> > > > > > - * holds GPU VA mappings.
> > > > > > - */
> > > > > > -void
> > > > > > -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> > > > > > +static void
> > > > > > +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
> > > > > >    {
> > > > > >        gpuvm->name = NULL;
> > > > > > @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> > > > > >        drm_gem_object_put(gpuvm->r_obj);
> > > > > >    }
> > > > > > -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> > > > > > +
> > > > > > +static void
> > > > > > +drm_gpuvm_free(struct kref *kref)
> > > > > > +{
> > > > > > +    struct drm_gpuvm *gpuvm = container_of(kref, struct
> > > > > > drm_gpuvm, kref);
> > > > > > +
> > > > > > +    if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
> > > > > > +        return;
> > > > > > +
> > > > > > +    drm_gpuvm_fini(gpuvm);
> > > > > > +
> > > > > > +    gpuvm->ops->vm_free(gpuvm);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
> > > > > > + * @gpuvm: the &drm_gpuvm to release the reference of
> > > > > > + *
> > > > > > + * This releases a reference to @gpuvm.
> > > > > > + */
> > > > > > +void
> > > > > > +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
> > > > > > +{
> > > > > > +    if (gpuvm)
> > > > > > +        kref_put(&gpuvm->kref, drm_gpuvm_free);
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
> > > > > >    static int
> > > > > >    __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> > > > > > @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> > > > > >        if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
> > > > > >            return -EINVAL;
> > > > > > -    return __drm_gpuva_insert(gpuvm, va);
> > > > > > +    return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
> > > > > >    }
> > > > > >    EXPORT_SYMBOL_GPL(drm_gpuva_insert);
> > > > > > @@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
> > > > > >        }
> > > > > >        __drm_gpuva_remove(va);
> > > > > > +    drm_gpuvm_put(va->vm);
> > > > > >    }
> > > > > >    EXPORT_SYMBOL_GPL(drm_gpuva_remove);
> > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > > > b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > > > index 54be12c1272f..cb2f06565c46 100644
> > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > > > @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct
> > > > > > nouveau_bo *nvbo)
> > > > > >        }
> > > > > >    }
> > > > > > +static void
> > > > > > +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
> > > > > > +{
> > > > > > +    struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
> > > > > > +
> > > > > > +    kfree(uvmm);
> > > > > > +}
> > > > > > +
> > > > > > +static const struct drm_gpuvm_ops gpuvm_ops = {
> > > > > > +    .vm_free = nouveau_uvmm_free,
> > > > > > +};
> > > > > > +
> > > > > >    int
> > > > > >    nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
> > > > > >                   void *data,
> > > > > > @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct
> > > > > > drm_device *dev,
> > > > > >                   NOUVEAU_VA_SPACE_END,
> > > > > >                   init->kernel_managed_addr,
> > > > > >                   init->kernel_managed_size,
> > > > > > -               NULL);
> > > > > > +               &gpuvm_ops);
> > > > > >        /* GPUVM takes care from here on. */
> > > > > >        drm_gem_object_put(r_obj);
> > > > > > @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct
> > > > > > drm_device *dev,
> > > > > >        return 0;
> > > > > >    out_gpuvm_fini:
> > > > > > -    drm_gpuvm_destroy(&uvmm->base);
> > > > > > -    kfree(uvmm);
> > > > > > +    drm_gpuvm_put(&uvmm->base);
> > > > > >    out_unlock:
> > > > > >        mutex_unlock(&cli->mutex);
> > > > > >        return ret;
> > > > > > @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
> > > > > >        mutex_lock(&cli->mutex);
> > > > > >        nouveau_vmm_fini(&uvmm->vmm);
> > > > > > -    drm_gpuvm_destroy(&uvmm->base);
> > > > > > -    kfree(uvmm);
> > > > > > +    drm_gpuvm_put(&uvmm->base);
> > > > > >        mutex_unlock(&cli->mutex);
> > > > > >    }
> > > > > > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > > > > > index 0c2e24155a93..4e6e1fd3485a 100644
> > > > > > --- a/include/drm/drm_gpuvm.h
> > > > > > +++ b/include/drm/drm_gpuvm.h
> > > > > > @@ -247,6 +247,11 @@ struct drm_gpuvm {
> > > > > >            struct list_head list;
> > > > > >        } rb;
> > > > > > +    /**
> > > > > > +     * @kref: reference count of this object
> > > > > > +     */
> > > > > > +    struct kref kref;
> > > > > > +
> > > > > >        /**
> > > > > >         * @kernel_alloc_node:
> > > > > >         *
> > > > > > @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct
> > > > > > drm_gpuvm *gpuvm, const char *name,
> > > > > >                u64 start_offset, u64 range,
> > > > > >                u64 reserve_offset, u64 reserve_range,
> > > > > >                const struct drm_gpuvm_ops *ops);
> > > > > > -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> > > > > > +
> > > > > > +/**
> > > > > > + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
> > > > > > + * @gpuvm: the &drm_gpuvm to acquire the reference of
> > > > > > + *
> > > > > > + * This function acquires an additional reference to
> > > > > > @gpuvm. It is illegal to
> > > > > > + * call this without already holding a reference. No locks required.
> > > > > > + */
> > > > > > +static inline struct drm_gpuvm *
> > > > > > +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
> > > > > > +{
> > > > > > +    kref_get(&gpuvm->kref);
> > > > > > +
> > > > > > +    return gpuvm;
> > > > > > +}
> > > > > > +
> > > > > > +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
> > > > > >    bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
> > > > > > u64 addr, u64 range);
> > > > > >    bool drm_gpuvm_interval_empty(struct drm_gpuvm
> > > > > > *gpuvm, u64 addr, u64 range);
> > > > > > @@ -673,6 +694,14 @@ static inline void
> > > > > > drm_gpuva_init_from_op(struct drm_gpuva *va,
> > > > > >     * operations to drivers.
> > > > > >     */
> > > > > >    struct drm_gpuvm_ops {
> > > > > > +    /**
> > > > > > +     * @vm_free: called when the last reference of a
> > > > > > struct drm_gpuvm is
> > > > > > +     * dropped
> > > > > > +     *
> > > > > > +     * This callback is mandatory.
> > > > > > +     */
> > > > > > +    void (*vm_free)(struct drm_gpuvm *gpuvm);
> > > > > > +
> > > > > >        /**
> > > > > >         * @op_alloc: called when the &drm_gpuvm allocates
> > > > > >         * a struct drm_gpuva_op
> > > 
> > 
> 

