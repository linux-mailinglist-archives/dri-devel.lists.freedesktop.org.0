Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA8792F45
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 21:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4908510E4EB;
	Tue,  5 Sep 2023 19:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BBC10E4EB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 19:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693943452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yVBfK1DvZv/Y6K7aqs+nuW3+7ho60W/vg/ureTBOoHw=;
 b=FTlruyuPtH52r2jfmfbO7nJvK0EBRDjuTyaIsneqew89iKuBgaUxf3K5q8z/g0hrebkPv3
 Xq37VdePpzx2lFtLzRWeNQZonB8rDZklJhrWASOWj211TquUuUV8EYzFjwF938V1xOL9Kz
 35LSVZLhbzLImMbvgv7/TmOLdaaTtg4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-c-Jppds7PRWDsqLoGCFkig-1; Tue, 05 Sep 2023 15:50:50 -0400
X-MC-Unique: c-Jppds7PRWDsqLoGCFkig-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9a57ec840e2so29076666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 12:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693943449; x=1694548249;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yVBfK1DvZv/Y6K7aqs+nuW3+7ho60W/vg/ureTBOoHw=;
 b=OxH59nJDbZgJtuZy5OGA0sENWnb3iRqQfHyQRAcUUM7tA/zfWO2t/hS53tik8OIOK8
 lZGB+Mp0lnT54g4M6ChPBsFA+nDiJJPICoT4G304EdTs/lQZ8uSB3GwukRl6QCP5Hde8
 jQLCpXQBSNI1/ubxIeFXV4raACMMKc0Pw82Y9ldcnztzWK0I1IE7YdzeAiEDI0pfrPJM
 8fKnG1C5wrjb2ALCGXFPO0AmvrfDevrhWh3o3iEdioPV6FAV/Qi8Bt2EniREx/2Ww5Pb
 nYnYCPxTjgaziLrHaUcT/Q6pHL0BXxZ4yGM5vpP7Heeryd5QTgXma6NvcTqsSZlu0dEW
 FEaA==
X-Gm-Message-State: AOJu0Yzl8CImEcHHM9Elo25QZG/enXNc6abf3ayRwB/LWmusEobIrQpx
 Awoi+ej7XTBcB40KQrJ8ivCp0nwcjk5Mu87tcSuLwFR69Cd3UqFjwwDAV1NNpEQXBrI+PWlpz6v
 oep6h+GBHezR8T/bwzdGDql8y9A9v
X-Received: by 2002:a17:907:6e2a:b0:98e:4f1:f987 with SMTP id
 sd42-20020a1709076e2a00b0098e04f1f987mr776771ejc.3.1693943448927; 
 Tue, 05 Sep 2023 12:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNhr9tGYtEUZCFM+pMDNSF0Xhe7Vu8eqwnK/2HemagreM5f9up0+2+5djhC37qWI39fBlIKA==
X-Received: by 2002:a17:907:6e2a:b0:98e:4f1:f987 with SMTP id
 sd42-20020a1709076e2a00b0098e04f1f987mr776749ejc.3.1693943448486; 
 Tue, 05 Sep 2023 12:50:48 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 lu7-20020a170906fac700b00992e14af9b9sm7877303ejb.134.2023.09.05.12.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 12:50:47 -0700 (PDT)
Date: Tue, 5 Sep 2023 21:50:45 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] Documentation/gpu: VM_BIND locking document
Message-ID: <ZPeGld0mBwbWptV9@cassiopeiae>
References: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 11:15:47AM +0200, Thomas Hellström wrote:
> Add the first version of the VM_BIND locking document which is
> intended to be part of the xe driver upstreaming agreement.
> 
> The document describes and discuss the locking used during exec-
> functions, evicton and for userptr gpu-vmas. Intention is to be using the
> same nomenclature as the drm-vm-bind-async.rst.
> 
> v2:
> - s/gvm/gpu_vm/g (Rodrigo Vivi)
> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>   (Rodrigo Vivi)
> - Adjust commit message accordingly.
> - Add SPDX license header.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  Documentation/gpu/drm-vm-bind-locking.rst | 351 ++++++++++++++++++++++
>  1 file changed, 351 insertions(+)
>  create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
> 
> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
> new file mode 100644
> index 000000000000..b813961a9ec2
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -0,0 +1,351 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +===============
> +VM_BIND locking
> +===============
> +
> +This document attempts to describe what's needed to get VM_BIND locking right,
> +including the userptr mmu_notifier locking and it will also discuss some
> +optimizations to get rid of the looping through of all userptr mappings and
> +external / shared object mappings that is needed in the simplest
> +implementation. It will also discuss some implications for faulting gpu_vms.
> +
> +Nomenclature
> +============
> +
> +* ``Context``: GPU execution context.
> +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> +  meta-data. Typically one per client (DRM file-private), or one per
> +  context.
> +* ``gpu_vma``: Abstraction of a GPU address range within a gpu_vm with

The same nomenclature was used within the VM_BIND async document as well. I
wonder if it would make sense to align the naming with the GPUVA manager, such
that ('drm_gpuva_manager' -> 'drm_gpuvm'). This would also result into better
function names, such as drm_gpuvm_resv_lock() or drm_gpuvm_prepare_objects() and
potentially way better naming for the VM_BO abstraction 'drm_gpuvm_bo'.

However, I'd like to keep 'drm_gpuva' rather than 'drm_gpu_vma', but I think
this is close enough anyway.

> +  associated meta-data. The backing storage of a gpu_vma can either be
> +  a gem buffer object or anonymous pages mapped also into the CPU
> +  address space for the process.
> +* ``userptr gpu_vma or just userptr``: A gpu_vma, the backing store of
> +  which is anonymous pages as described above.
> +* ``revalidating``: Revalidating a gpu_vma means making the latest version
> +  of the backing store resident and making sure the gpu_vma's
> +  page-table entries point to that backing store.
> +* ``dma_fence``: A struct dma_fence that is similar to a struct completion
> +  and which tracks GPU activity. When the GPU activity is finished,
> +  the dma_fence signals.
> +* ``dma_resv``: A struct dma_resv (AKA reservation object) that is used
> +  to track GPU activity in the form of multiple dma_fences on a
> +  gpu_vm or a gem buffer object. The dma_resv contains an array / list
> +  of dma_fences and a lock that needs to be held when adding
> +  additional dma_fences to the dma_resv. The lock is of a type that
> +  allows deadlock-safe locking of multiple dma_resvs in arbitrary order.
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected gpu_vmas, submits a GPU command batch and registers the
> +  dma_fence representing the GPU command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +* ``local object``: A GEM object which is local to a gpu_vm. Shared gem
> +  objects also share the gpu_vm's dma_resv.
> +* ``shared object``: AKA external object: A GEM object which may be shared
> +  by multiple gpu_vms and whose backing storage may be shared with
> +  other drivers.
> +
> +
> +Introducing the locks
> +=====================
> +
> +One of the benefits of VM_BIND is that local GEM objects share the gpu_vm's
> +dma_resv object and hence the dma_resv lock. So even with a huge
> +number of local GEM objects, only one lock is needed to make the exec
> +sequence atomic.
> +
> +The following locks and locking orders are used:
> +
> +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the gpu_vm is
> +  partitioned into gpu_vmas, protects the gpu_vm's list of external objects,
> +  and can also with some simplification protect the gpu_vm's list of
> +  userptr gpu_vmas. With the CPU mm analogy this would correspond to the
> +  mmap_lock.
> +* The ``userptr_seqlock``. This lock is taken in read mode for each
> +  userptr gpu_vma on the gpu_vm's userptr list, and in write mode during mmu
> +  notifier invalidation. This is not a real seqlock but described in
> +  ``mm/mmu_notifier.c` as a "Collision-retry read-side/write-side
> +  'lock' a lot like a seqcount, however this allows multiple
> +  write-sides to hold it at once...". The read side critical section
> +  is enclosed by ``mmu_interval_read_begin() /
> +  mmu_interval_read_retry()`` with ``mmu_interval_read_begin()``
> +  sleeping uninterruptibly if the write side is held.
> +  The write side is held by the core mm while calling mmu interval
> +  invalidation notifiers.
> +* The ``gpu_vm->resv`` lock. Protects the gpu_vm's list of gpu_vmas needing
> +  rebinding, and also the residency of all the gpu_vm's local GEM object.
> +* The ``gpu_vm->userptr_notifier_lock``. This is an rwsem that is taken in read
> +  mode during exec and write mode during a mmu notifier invalidation. In
> +  the absence of a separate page-table lock, this lock can serve
> +  together with the gpu_vm's dma_resv lock as a page-table lock. More on
> +  this below. The userptr notifier lock is per gpu_vm.
> +* The ``gpu_vm->page_table_lock``. Protects the gpu_vm's page-table updates. For
> +  simplicity the gpu_vm's dma_resv lock can be reused as page-table lock.
> +
> +There are certain optimizations described below that require
> +additional locks. More on that later.
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(&gpu_vm->resv);
> +
> +   for_each_gpu_vma_on_revalidate_list(gpu_vm, &gpu_vma) {
> +		revalidate_gpu_vma(&gpu_vma);
> +		remove_from_revalidate_list(&gpu_vma);
> +   }
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   dma_resv_unlock(&gpu_vm->resv);
> +
> +Eviction of one of these local objects will then be something like the
> +following:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vma_of_obj(obj, &gpu_vma);
> +		put_gpu_vma_on_revalidate_list(&gpu_vma);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +Note that since the object is local to the gpu_vm, it will share the gpu_vm's
> +``dma_resv`` lock so that ``obj->resv == gpu_vm->resv``. Invalidated gpu_vmas are put
> +on the gpu_vm's revalidation list, which is protected by ``gpu_vm->resv``, which
> +is always locked while evicting, due to the above equality.
> +
> +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before eviction,
> +Since the eviction blit or copy will wait for GPU idle, any attempt by
> +the GPU to access freed memory through the gpu_vma will be preceded by
> +a new exec function, which will make sure the gpu_vma is
> +revalidated. The eviction code holding the object's dma_resv while
> +revalidating will ensure a new exec function may not race with the eviction.
> +
> +Introducing external (or shared) buffer objects
> +===============================================
> +
> +Since shared buffer objects may be shared by multiple gpu_vm's they
> +can't share their reservation object with a single gpu_vm, but will rather
> +have a reservation object of their own. The shared objects bound to a
> +gpu_vm using one or many
> +gpu_vmas are therefore typically put on a per-gpu_vm list which is
> +protected by the gpu_vm lock. One could in theory protect it also with
> +the ``gpu_vm->resv``, but since the list of dma_resvs to take is typically
> +built before the ``gpu_vm->resv`` is locked due to a limitation in
> +the current locking helpers, that is typically not done. Also see
> +below for userptr gpu_vmas.
> +
> +At eviction time we now need to invalidate *all* gpu_vmas of a shared
> +object, but we can no longer be certain that we hold the gpu_vm's
> +dma_resv of all the object's gpu_vmas. We can only be certain that we

I need to think a bit more about locking of extobj and evicted object tracking
in the case of processing 'drm_gpuva_ops' directly through callbacks within the
fence signalling critical path as mentioend in [1].

In order to support that, we'd need to protect extobjs with a separate lock,
and while iterating extobjs to acquire the dma-resv lock drop the lock within
the loop before we actually acquire the dma-resv lock. Maple tree supports that
already and this can be fully done within the GPUVA manager; no need for the
driver to care about that.

While, as already mentioned, I'd really love to support that, I noticed that we
have a similar issue with tracking evicted objects. There are (similar) ways to
deal with that, however, it drastically increases complexity.

Hence, I'd like to reconsider whether it's worth supporting it in the first
place. Most of the arguments in order to support it are for decreasing
complexity. However, if it increases complexity elsewhere, it's probably not
worth. The only argument left would be for synchronous bind jobs which could
be injected at any point of time without the need to be queued up in the
scheduler to preserve ordering. However, I'm not yet sure how important this
would be. For Xe it doesn't really seem to be a concern I guess?

[1] https://lore.kernel.org/dri-devel/202308221050.kTj8uFMA-lkp@intel.com/T/#m7f3b5a7ff70723332adeea32671578cb95c62f7c

> +hold the object's private dma_resv. We can trylock the dma_resvs for
> +the affected gpu_vm's but that might be unnecessarily complex. If we
> +have a ww_acquire context at hand at eviction time we can also perform
> +sleeping locks of those dma_resvs but that could cause expensive
> +rollbacks. One option is to just mark the invalidated gpu_vmas with a bool
> +which is inspected on the next exec function, when the gpu_vm's
> +dma_resv and the object's dma_resv is held, and the invalidated
> +gpu_vmas could then be put on the gpu_vm's list of invalidated
> +gpu_vmas. That bool would then, although being per-gpu_vma formally be
> +protected by the object's dma_resv.
> +
> +The exec function would then look something like the following:
> +
> +.. code-block:: C
> +
> +   read_lock(&gpu_vm->lock);
> +
> +   dma_resv_lock(&gpu_vm->resv);
> +
> +   // Shared object list is protected by the gpu_vm->lock.
> +   for_each_shared_obj(gpu_vm, &obj) {
> +		dma_resv_lock(&obj->resv);
> +		move_marked_gpu_vmas_to_revalidate_gpu_vma_list(obj, &gpu_vm);
> +   }
> +
> +   for_each_gpu_vma_to_revalidate(gpu_vm, &gpu_vma) {
> +		revalidate_gpu_vma(&gpu_vma);
> +		remove_from_revalidate_list(&gpu_vma);
> +   }
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   for_each_shared_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +   dma_resv_unlock_all_resv_locks();
> +
> +   read_unlock(&gpu_vm->lock);
> +
> +And the corresponding shared-object aware eviction would look like:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vma_of_obj(obj, &gpu_vma);
> +		if (object_is_vm_local(obj))
> +		             put_gpu_vma_on_revalidate_list(&gpu_vma, &gpu_vm);
> +		else
> +		             mark_gpu_vma_for_revalidation(&gpu_vma);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +Yet another option is to put the gpu_vmas to be invalidated on a separate
> +gpu_vm list protected by a lower level lock that can be taken both at eviction
> +time and at transfer-to-revalidate list time. The details are not in
> +this document, but this for reference implemented in the Intel xe
> +driver.
> +
> +Introducing userptr gpu_vmas
> +============================
> +
> +A userptr gpu_vma is a gpu_vma that, instead of mapping a buffer object to a
> +GPU virtual address range, directly maps a CPU mm range of anonymous-
> +or file page-cache pages.
> +A very simple approach would be to just pin the pages using
> +pin_user_pages() at bind time and unpin them at unbind time, but this
> +creates a Denial-Of-Service vector since a single user-space process
> +would be able to pin down all of system memory, which is not
> +desirable. (For special use-cases and with proper accounting pinning might
> +still be a desirable feature, though). What we need to do in the general case is
> +to obtain a reference to the desired pages, make sure we are notified
> +using a MMU notifier just before the CPU mm unmaps the pages, dirty
> +them if they are not mapped read-only to the GPU, and then drop the reference.
> +When we are notified by the MMU notifier that CPU mm is about to drop the
> +pages, we need to stop GPU access to the pages,
> +GPU page-table and make sure that before the next time the GPU tries to access
> +whatever is now present in the CPU mm range, we unmap the old pages
> +from the GPU page tables and repeat the process of obtaining new page
> +references. Note that when the core mm decides to laundry pages, we get such
> +an unmap MMU notification and can mark the pages dirty again before the
> +next GPU access. We also get similar MMU notifications for NUMA accounting
> +which the GPU driver doesn't really need to care about, but so far
> +it's proven difficult to exclude certain notifications.
> +
> +Using a MMU notifier for device DMA (and other methods) is described in
> +`this document
> +<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
> +
> +Now the method of obtaining struct page references using
> +get_user_pages() unfortunately can't be used under a dma_resv lock
> +since that would violate the locking order of the dma_resv lock vs the
> +mmap_lock that is grabbed when resolving a CPU pagefault. This means the gpu_vm's
> +list of userptr gpu_vmas needs to be protected by an outer lock, and this
> +is the first time we strictly need the gpu_vm->lock. While it was
> +previously used also to protect the list of the gpu_vm's shared objects,
> +we could in theory have used the gpu_vm->resv for that.
> +
> +The MMU interval seqlock for a userptr gpu_vma is used in the following
> +way:
> +
> +.. code-block:: C
> +
> +   down_read(&gpu_vm->lock);
> +
> +   retry:
> +
> +   // Note: mmu_interval_read_begin() blocks until there is no
> +   // invalidation notifier running anymore.
> +   seq = mmu_interval_read_begin(&gpu_vma->userptr_interval);
> +   if (seq != gpu_vma->saved_seq) {
> +           obtain_new_page_pointers(&gpu_vma);
> +	   dma_resv_lock(&gpu_vm->resv);
> +	   put_gpu_vma_on_revalidate_list(&gpu_vma, &gpu_vm);
> +	   dma_resv_unlock(&gpu_vm->resv);
> +	   gpu_vma->saved_seq = seq;
> +   }
> +
> +   // The usual revalidation goes here.
> +
> +   // Final userptr sequence validation may not happen before the
> +   // submission dma_fence is added to the gpu_vm's resv, from the POW
> +   // of the MMU invalidation notifier. Hence the
> +   // userptr_notifier_lock that will make them appear atomic.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   down_read(&gpu_vm->userptr_notifier_lock);
> +   if (mmu_interval_read_retry(&gpu_vma->userptr_interval, gpu_vma->saved_seq)) {
> +          up_read(&gpu_vm->userptr_notifier_lock);
> +	  goto retry;
> +   }
> +
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +
> +   for_each_shared_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +
> +   dma_resv_unlock_all_resv_locks();
> +   up_read(&gpu_vm->userptr_notifier_lock);
> +   up_read(&gpu_vm->lock);
> +
> +The code between ``mmu_interval_read_begin()`` and the
> +``mmu_interval_read_retry()`` marks the read side critical section of
> +what we call the ``userptr_seqlock``. In reality the gpu_vm's userptr
> +gpu_vma list is looped through, and the check is done for *all* of its
> +userptr gpu_vmas, although we only show a single one here.
> +
> +The userptr gpu_vma MMU invalidation notifier might be called from
> +reclaim context and, again to avoid locking order violations, we can't
> +take any dma_resv lock nor the gpu_vm->lock from within it.
> +
> +.. code-block:: C
> +
> +  bool gpu_vma_userptr_invalidate(userptr_interval, cur_seq)
> +  {
> +          // Make sure the exec function either sees the new sequence
> +	  // and backs off or we wait for the dma-fence:
> +
> +          down_write(&gpu_vm->userptr_notifier_lock);
> +	  mmu_interval_set_seq(userptr_interval, cur_seq);
> +	  up_write(&gpu_vm->userptr_notifier_lock);
> +
> +	  dma_resv_wait_timeout(&gpu_vm->resv, DMA_RESV_USAGE_BOOKKEEP,
> +		                false, MAX_SCHEDULE_TIMEOUT);
> +	  return true;
> +  }
> +
> +When this invalidation notifier returns, the GPU can no longer be
> +accessing the old pages of the userptr gpu_vma and needs to redo the page-binding
> +before a new GPU submission can succeed.
> +
> +Optimizing gpu_vma iteration
> +----------------------------
> +
> +Iterating through all of a gpu_vm's userptr gpu_vmas to check the validity
> +on each exec function may be very costly. There is a scheme to avoid
> +this and only iterate through the userptr gpu_vmas that actually saw an
> +invalidation notifier call since the last exec. T
> +
> +TODO: describe that scheme here. It's implemented in the xe driver.
> +
> +Locking for page-table updates at bind- and unbind time
> +=======================================================
> +
> +TODO.
> +
> +Recoverable page-fault implications
> +===================================
> +
> +TODO.
> -- 
> 2.41.0
> 

