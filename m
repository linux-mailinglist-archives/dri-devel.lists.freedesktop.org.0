Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850E67B6EFE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 18:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69D510E2F8;
	Tue,  3 Oct 2023 16:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA2810E2F7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696352121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7tfHP4kmRXiaICtPd4tqtaPxNkyYEUzIvHl3BC2KeQ=;
 b=Zii5WNc2/BedwAaH7hCkNdrRtpx7mbCtz+7NDCgHz/dL0Drdqi151m85fv2MCertMPHwz4
 j3x9lnLyxsWTGdxUBxH50sp0Efrq9k3tf5I4sQud6Sl0l2fMmJz6a75nPsO1sBQRPSMJ+l
 DbYlffEPi3JVkozBTWwfYVYQC96IfRI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-SiCsJ-DWNCu1vZXE_sG-yg-1; Tue, 03 Oct 2023 12:55:19 -0400
X-MC-Unique: SiCsJ-DWNCu1vZXE_sG-yg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-537a183caa3so953429a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 09:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696352118; x=1696956918;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U7tfHP4kmRXiaICtPd4tqtaPxNkyYEUzIvHl3BC2KeQ=;
 b=fMBuqqd00v4PIuMTYRbzrhUOe8MYhSvHt1ALNoef7JgA/COpjdCDSPODrX4lsRakyE
 /57d5n5CEdLIZqDCcu7+GZdDQNn3JDfjfj9kyO9E4wiNJvA4vmhkW9W1UerjUw2JLO58
 2MmZ+Zj75LazPH1Hc9niOG2neZsZq2PLK07h6fgybif8QJI/7pVd64nfEUukf1EW8zDJ
 xAxp8KGEA4PT1MSuS6Zp9OddNgNcZZsiX2OsVs2a97h0Oh9JDaONDXeLxj/CuB8LF1Ma
 a5Xm6TfVnAlhznJ7slZQMzRFOo6hJAbdhF7XwWPu0njTXqc5ADOQ5+EJvQI87I5uAiPV
 3BlA==
X-Gm-Message-State: AOJu0YzbhW978JIFi6HBX3l5s8CchTnPn+nuwWxDU5DTH+lvWx4jQl/h
 t19DQBm/paslBRNm9Pe4+zHWK3B6voJ1mhl2faj4x4lDO8gnBNpIivZmIWuJ7y5DaEeAIsQr3WR
 OQc3x/MaA2Keu8cuYKxr8Q8ZipqbE
X-Received: by 2002:a17:906:3582:b0:9b2:9e44:222e with SMTP id
 o2-20020a170906358200b009b29e44222emr13968996ejb.19.1696352118544; 
 Tue, 03 Oct 2023 09:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0BlhYJTy/eGpPg/g7Kj2hxrX0S6xOFKK/n+JvzSroe+HOFvr7h1DKLjxtdlUBZaQYPZuHxw==
X-Received: by 2002:a17:906:3582:b0:9b2:9e44:222e with SMTP id
 o2-20020a170906358200b009b29e44222emr13968962ejb.19.1696352117956; 
 Tue, 03 Oct 2023 09:55:17 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 sb8-20020a170906edc800b0099cf840527csm1321057ejb.153.2023.10.03.09.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 09:55:17 -0700 (PDT)
Date: Tue, 3 Oct 2023 18:55:15 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v5 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
Message-ID: <ZRxHcwYUbp5/fS+v@pollux>
References: <20230928191624.13703-1-dakr@redhat.com>
 <20230928191624.13703-5-dakr@redhat.com>
 <e4e68970-c7c9-55e2-9483-01252f38c956@linux.intel.com>
 <20231003120554.547090bc@collabora.com>
 <f551ee9059e52d46343f5fa997b7d9f8ab6654d9.camel@linux.intel.com>
 <20231003162143.490e3ef0@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20231003162143.490e3ef0@collabora.com>
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, donald.robson@imgtec.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems like we're mostly aligned on this series, except for the key
controversy we're discussing for a few versions now: locking of the internal
lists. Hence, let's just re-iterate the options we have to get this out of the
way.

(1) The spinlock dance. This basically works for every use case, updating the VA
    space from the IOCTL, from the fence signaling path or anywhere else.
    However, it has the downside of requiring spin_lock() / spin_unlock() for
    *each* list element when locking all external objects and validating all
    evicted objects. Typically, the amount of extobjs and evicted objects
    shouldn't be excessive, but there might be exceptions, e.g. Xe.

(2) The dma-resv lock dance. This is convinient for drivers updating the VA
    space from a VM_BIND ioctl() and is especially efficient if such drivers
    have a huge amount of external and/or evicted objects to manage. However,
    the downsides are that it requires a few tricks in drivers updating the VA
    space from the fence signaling path (e.g. job_run()). Design wise, I'm still
    skeptical that it is a good idea to protect internal data structures with
    external locks in a way that it's not clear to callers that a certain
    function would access one of those resources and hence needs protection.
    E.g. it is counter intuitive that drm_gpuvm_bo_put() would require both the
    dma-resv lock of the corresponding object and the VM's dma-resv lock held.
    (Additionally, there were some concerns from amdgpu regarding flexibility in
    terms of using GPUVM for non-VM_BIND uAPIs and compute, however, AFAICS
    those discussions did not complete and to me it's still unclear why it
    wouldn't work.)

(3) Simply use an internal mutex per list. This adds a tiny (IMHO negligible)
    overhead for drivers updating the VA space from a VM_BIND ioctl(), namely
    a *single* mutex_lock()/mutex_unlock() when locking all external objects
    and validating all evicted objects. And it still requires some tricks for
    drivers updating the VA space from the fence signaling path. However, it's
    as simple as it can be and hence way less error prone as well as
    self-contained and hence easy to use. Additionally, it's flexible in a way
    that we don't have any expections on drivers to already hold certain locks
    that the driver in some situation might not be able to acquire in the first
    place.

(4) Arbitrary combinations of the above. For instance, the current V5 implements
    both (1) and (2) (as either one or the other). But also (1) and (3) (as in
    (1) additionally to (3)) would be an option, where a driver could opt-in for
    the spinlock dance in case it updates the VA space from the fence signaling
    path.

I also considered a few other options as well, however, they don't seem to be
flexible enough. For instance, as by now we could use SRCU for the external
object list. However, this falls apart once a driver wants to remove and re-add
extobjs for the same VM_BO instance. (For the same reason it wouldn't work for
evicted objects.)

Personally, after seeing the weird implications of (1), (2) and a combination of
both, I tend to go with (3). Optionally, with an opt-in for (1). The reason for
the latter is that with (3) the weirdness of (1) by its own mostly disappears.

Please let me know what you think, and, of course, other ideas than the
mentioned ones above are still welcome.

- Danilo

On Tue, Oct 03, 2023 at 04:21:43PM +0200, Boris Brezillon wrote:
> On Tue, 03 Oct 2023 14:25:56 +0200
> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
> 
> > > > > +/**
> > > > > + * get_next_vm_bo_from_list() - get the next vm_bo element
> > > > > + * @__gpuvm: The GPU VM
> > > > > + * @__list_name: The name of the list we're iterating on
> > > > > + * @__local_list: A pointer to the local list used to store
> > > > > already iterated items
> > > > > + * @__prev_vm_bo: The previous element we got from
> > > > > drm_gpuvm_get_next_cached_vm_bo()
> > > > > + *
> > > > > + * This helper is here to provide lockless list iteration.
> > > > > Lockless as in, the
> > > > > + * iterator releases the lock immediately after picking the
> > > > > first element from
> > > > > + * the list, so list insertion deletion can happen concurrently.
> > > > > + *
> > > > > + * Elements popped from the original list are kept in a local
> > > > > list, so removal
> > > > > + * and is_empty checks can still happen while we're iterating
> > > > > the list.
> > > > > + */
> > > > > +#define get_next_vm_bo_from_list(__gpuvm, __list_name,
> > > > > __local_list, __prev_vm_bo)     \
> > > > > +       ({                                                       
> > > > >                        \
> > > > > +               struct drm_gpuvm_bo *__vm_bo =
> > > > > NULL;                                    \
> > > > > +                                                                
> > > > >                        \
> > > > > +               drm_gpuvm_bo_put(__prev_vm_bo);                  
> > > > >                        \
> > > > > +                                                                
> > > > >                        \
> > > > > +               spin_lock(&(__gpuvm)-  
> > > > > >__list_name.lock);                                \    
> > > > 
> > > > Here we unconditionally take the spinlocks while iterating, and the
> > > > main 
> > > > point of DRM_GPUVM_RESV_PROTECTED was really to avoid that?
> > > > 
> > > >   
> > > > > +               if (!(__gpuvm)-  
> > > > > >__list_name.local_list)                                 \  
> > > > > +                       (__gpuvm)->__list_name.local_list =
> > > > > __local_list;               \
> > > > > +               else                                             
> > > > >                        \
> > > > > +                       WARN_ON((__gpuvm)->__list_name.local_list
> > > > > != __local_list);     \
> > > > > +                                                                
> > > > >                        \
> > > > > +               while (!list_empty(&(__gpuvm)->__list_name.list))
> > > > > {                     \
> > > > > +                       __vm_bo = list_first_entry(&(__gpuvm)-  
> > > > > >__list_name.list,        \  
> > > > > +                                                  struct
> > > > > drm_gpuvm_bo,                 \
> > > > > +                                                 
> > > > > list.entry.__list_name);             \
> > > > > +                       if (kref_get_unless_zero(&__vm_bo->kref))
> > > > > {    
> > > > And unnecessarily grab a reference in the RESV_PROTECTED case.  
> > > > >                         \
> > > > > +                               list_move_tail(&(__vm_bo)-  
> > > > > >list.entry.__list_name,      \  
> > > > > +                                             
> > > > > __local_list);                           \
> > > > > +                               break;                           
> > > > >                        \
> > > > > +                       } else
> > > > > {                                                        \
> > > > > +                               list_del_init(&(__vm_bo)-  
> > > > > >list.entry.__list_name);      \  
> > > > > +                               __vm_bo =
> > > > > NULL;                                         \
> > > > > +                       }                                        
> > > > >                        \
> > > > > +               }                                                
> > > > >                        \
> > > > > +               spin_unlock(&(__gpuvm)-  
> > > > > >__list_name.lock);                              \  
> > > > > +                                                                
> > > > >                        \
> > > > > +               __vm_bo;                                         
> > > > >                        \
> > > > > +       })    
> > > > 
> > > > IMHO this lockless list iteration looks very complex and should be 
> > > > pretty difficult to maintain while moving forward, also since it
> > > > pulls 
> > > > the gpuvm_bos off the list, list iteration needs to be protected by
> > > > an 
> > > > outer lock anyway.  
> > > 
> > > As being partly responsible for this convoluted list iterator, I must
> > > say I agree with you. There's so many ways this can go wrong if the
> > > user doesn't call it the right way, or doesn't protect concurrent
> > > list
> > > iterations with a separate lock (luckily, this is a private
> > > iterator). I
> > > mean, it works, so there's certainly a way to get it right, but gosh,
> > > this is so far from the simple API I had hoped for.
> > >   
> > > > Also from what I understand from Boris, the extobj 
> > > > list would typically not need the fine-grained locking; only the
> > > > evict 
> > > > list?  
> > > 
> > > Right, I'm adding the gpuvm_bo to extobj list in the ioctl path, when
> > > the GEM and VM resvs are held, and I'm deferring the
> > > drm_gpuvm_bo_put()
> > > call to a work that's not in the dma-signalling path. This being
> > > said,
> > > I'm still not comfortable with the
> > > 
> > > gem = drm_gem_object_get(vm_bo->gem);
> > > dma_resv_lock(gem->resv);
> > > drm_gpuvm_bo_put(vm_bo);
> > > dma_resv_unlock(gem->resv);
> > > drm_gem_object_put(gem);
> > > 
> > > dance that's needed to avoid a UAF when the gpuvm_bo is the last GEM
> > > owner, not to mention that drm_gpuva_unlink() calls
> > > drm_gpuvm_bo_put()
> > > after making sure the GEM gpuvm_list lock is held, but this lock
> > > might
> > > differ from the resv lock (custom locking so we can call
> > > gpuvm_unlink() in the dma-signalling path). So we now have paths
> > > where
> > > drm_gpuvm_bo_put() are called with the resv lock held, and others
> > > where
> > > they are not, and that only works because we're relying on the the
> > > fact
> > > those drm_gpuvm_bo_put() calls won't make the refcount drop to zero,
> > > because the deferred vm_bo_put() work still owns a vm_bo ref.  
> > 
> > I'm not sure I follow to 100% here, but in the code snippet above it's
> > pretty clear to me that it needs to hold an explicit gem object
> > reference when calling dma_resv_unlock(gem->resv). Each time you copy a
> > referenced pointer (here from vm_bo->gem to gem) you need to up the
> > refcount unless you make sure (by locks or other means) that the source
> > of the copy has a strong refcount and stays alive, so that's no weird
> > action to me. Could possibly add a drm_gpuvm_bo_get_gem() to access the
> > gem member (and that also takes a refcount) for driver users to avoid
> > the potential pitfall.
> 
> Except this is only needed because of the GEM-resv-must-be-held locking
> constraint that was added on vm_bo_put(). I mean, the usual way we do
> object un-referencing is by calling _put() and letting the internal
> logic undo things when the refcount drops to zero. If the object needs
> to be removed from some list, it's normally the responsibility of the
> destruction method to lock the list, remove the object and unlock the
> list. Now, we have a refcounted object that's referenced by vm_bo, and
> whose lock needs to be taken when the destruction happens, which leads
> to this weird dance described above, when, in normal situations, we'd
> just call drm_gpuvm_bo_put(vm_bo) and let drm_gpuvm do its thing.
> 
> > 
> > > 
> > > All these tiny details add to the overall complexity of this common
> > > layer, and to me, that's not any better than the
> > > get_next_vm_bo_from_list() complexity you were complaining about
> > > (might
> > > be even worth, because this sort of things leak to users).
> > > 
> > > Having an internal lock partly solves that, in that the locking of
> > > the
> > > extobj list is now entirely orthogonal to the GEM that's being
> > > removed
> > > from this list, and we can lock/unlock internally without forcing the
> > > caller to take weird actions to make sure things don't explode. Don't
> > > get me wrong, I get that this locking overhead is not acceptable for
> > > Xe, but I feel like we're turning drm_gpuvm into a white elephant
> > > that
> > > only few people will get right.  
> > 
> > I tend to agree, but to me the big complication comes from the async
> > (dma signalling path) state updates.
> 
> I don't deny updating the VM state from the dma signalling path adds
> some amount of complexity, but the fact we're trying to use dma_resv
> locks for everything, including protection of internal datasets doesn't
> help. Anyway, I think both of us are biased when it comes to judging
> which approach adds the most complexity :P.
> 
> Also note that, right now, the only thing I'd like to be able to update
> from the dma signalling path is the VM mapping tree. Everything else
> (drm_gpuva_[un]link(), add/remove extobj), we could do outside this
> path:
> 
> - for MAP operations, we could call drm_gpuva_link() in the ioctl path
>   (we'd just need to initialize the drm_gpuva object)
> - for MAP operations, we're already calling drm_gpuvm_bo_obtain() from
>   the ioctl path
> - for UNMAP operations, we could add the drm_gpuva_unlink() call to the
>   VM op cleanup worker
> 
> The only problem we'd have is that drm_gpuva_link() needs to be called
> inside drm_gpuvm_ops::sm_step_remap() when a remap with next/prev !=
> NULL occurs, otherwise we lose track of these mappings.
> 
> > 
> > Let's say for example we have a lower level lock for the gem object's
> > gpuvm_bo list. Some drivers grab it from the dma fence signalling path,
> > other drivers need to access all vm's of a bo to grab their dma_resv
> > locks using a WW transaction. There will be problems, although probably
> > solveable.
> 
> To me, the gpuvm extobj vm_bo list is just an internal list and has an
> internal lock associated. The lock that's protecting the GEM vm_bo list
> is a bit different in that the driver gets to decide when a vm_bo is
> inserted/removed by calling drm_gpuvm_[un]link(), and can easily make
> sure the lock is held when this happens, while the gpuvm internal lists
> are kinda transparently updated (for instance, the first caller of
> drm_gpuvm_bo_obtain() adds the vm_bo to the extobj and the last vm_bo
> owner calling drm_gpuvm_bo_put() removes it from this list, which is
> certainly not obvious based on the name of these functions).
> 
> If we want to let drivers iterate over the extobj/evict lists, and
> assuming they are considered internal lists maintained by the core and
> protected with an internal lock, we should indeed provide iteration
> helpers that:
> 
> 1/ make sure all the necessary external locks are held (VM resv, I
>    guess)
> 2/ make sure the internal lock is not held during iteration (the sort
>    of snapshot list trick you're using for the evict list in Xe)
> 
> > > > Also it seems that if we are to maintain two modes here, for 
> > > > reasonably clean code we'd need two separate instances of 
> > > > get_next_bo_from_list().
> > > > 
> > > > For the !RESV_PROTECTED case, perhaps one would want to consider
> > > > the 
> > > > solution used currently in xe, where the VM maintains two evict
> > > > lists. 
> > > > One protected by a spinlock and one protected by the VM resv. When
> > > > the 
> > > > VM resv is locked to begin list traversal, the spinlock is locked
> > > > *once* 
> > > > and the spinlock-protected list is looped over and copied into the
> > > > resv 
> > > > protected one. For traversal, the resv protected one is used.  
> > > 
> > > Oh, so you do have the same sort of trick where you move the entire
> > > list to another list, such that you can let other paths update the
> > > list
> > > while you're iterating your own snapshot. That's interesting...  
> > 
> > Yes, it's instead of the "evicted" bool suggested here. I thought the
> > latter would be simpler. Although that remains to be seen after all
> > use-cases are implemented.
> > 
> > But in general I think the concept of copying from a staging list to
> > another with different protection rather than traversing the first list
> > and unlocking between items is a good way of solving the locking
> > inversion problem with minimal overhead. We use it also for O(1)
> > userptr validation.
> 
> That's more or less the idea behind get_next_vm_bo_from_list() except
> it's dequeuing one element at a time, instead of moving all items at
> once. Note that, if you allow concurrent removal protected only by the
> spinlock, you still need to take/release this spinlock when iterating
> over elements of this snapshot list, because all the remover needs to
> remove an element is the element itself, and it doesn't care in which
> list it's currently inserted (real or snapshot/staging list), so you'd
> be iterating over a moving target if you don't protect the iteration
> with the spinlock.
> 

