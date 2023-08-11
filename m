Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF57790CE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 15:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A4A10E0EE;
	Fri, 11 Aug 2023 13:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C971710E0E7;
 Fri, 11 Aug 2023 13:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691760746; x=1723296746;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fugS7kwDcCIQ3IS0c4mHMDjYbpVrCdqodKwA41IqF6M=;
 b=NbCt6bRzpEIfweoEfagWY8aoBNXY5+p1W8LGeoUCtMa+2o1mVDsGuMg0
 42STlLiiDm06rZz/PIIEoQvOIf2oC3Lh9dNOjxYktweSPbBjD65mavImH
 /d4D8xpxFXfN3Dex4jeil0e9HLevtU253YPwKSiclq8RFKZMjpKRPMhvM
 vAte9OhC/A3KpHWLrfLBQW3IYHsdypkaj5M8J1Xo2yompNb5PD/lKZDiL
 RX994kcQ1o/LTqEA93yCFemPMDsv3yn4mXMnSJHd/KuaBosHqH26fewdQ
 Kisqp9kjgwxVJ4rShNGK6UXuhbl12r7deJa9gc1ixzMaPdAm8uyBFZPvR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375390743"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="375390743"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 06:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="876175869"
Received: from inechita-mobl2.ger.corp.intel.com (HELO [10.249.254.165])
 ([10.249.254.165])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 06:32:26 -0700
Message-ID: <d7558cf8-3f7d-5bb5-c41f-e57172c92262@linux.intel.com>
Date: Fri, 11 Aug 2023 15:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-xe] [RFC PATCH] Documentation/gpu: Draft VM_BIND locking
 document
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230630164452.9228-1-thomas.hellstrom@linux.intel.com>
 <ZM1ca0wEM9n+34qA@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZM1ca0wEM9n+34qA@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for reviewing, Rodrigo!


On 8/4/23 22:15, Rodrigo Vivi wrote:

> On Fri, Jun 30, 2023 at 06:44:52PM +0200, Thomas Hellström wrote:
>> Add the first version of the VM_BIND locking document which is
>> intended to be part of the xe driver upstreaming agreement.
>>
>> The document describes and discuss the locking used during exec-
>> functions, evicton and for userptr gmvas. Intention is to be using the
>> same nomenclature as the drm-vm-bind-async.rst, but to keep naming a
>> little shorter, use gvm and gmva instead of gpu_vm and gpu_vma which
>> is used in the previous document, with an intention to modify also
>> that document.
> I preferred the gpu_vm and gpu_vma as written in the async doc.
> Much easier to read imho.

OK. I'll keep that naming then.


>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   Documentation/gpu/drm-vm-bind-locking.rst | 339 ++++++++++++++++++++++
>>   1 file changed, 339 insertions(+)
>>   create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
>>
>> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
>> new file mode 100644
>> index 000000000000..f5d1a40a2906
>> --- /dev/null
>> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
>> @@ -0,0 +1,339 @@
>> +===============
>> +VM_BIND lockinghttps://jira.devtools.intel.com/browse/VLK-50299a
>> +===============
>> +
>> +This document attempts to describe what's needed to get VM_BIND locking right,
>> +including the userptr mmu_notifier locking and it will also discuss some
>> +optimizations to get rid of the looping through of all userptr mappings and
>> +external / shared object mappings that is needed in the simplest
>> +implementation. It will also discuss some implications for faulting gvms.
>> +
>> +Nomenclature
>> +============
>> +
>> +* ``Context``: GPU execution context.
>> +* ``gvm``: Abstraction of a GPU address space with meta-data. Typically
>> +  one per client (DRM file-private), or one per context.
>> +* ``gvma``: Abstraction of a GPU address range within a gvma with
> within a gpu_vm you meant?
Yes.
>
>> +  associated meta-data. The backing storage of a gvma can either be
>> +  a gem buffer object or anonymous pages mapped also into the CPU
>> +  address space for the process.
>> +* ``userptr gvma or just userptr``: A gvma, the backing store of
>> +  which is anonymous pages as described above.
>> +* ``revalidating``: Revalidating a gvma means making the latest version
>> +  of the backing store resident and making sure the gvma's
>> +  page-table entries point to that backing store.
>> +* ``dma_fence``: A struct dma_fence that is similar to a struct completion
>> +  and which tracks GPU activity. When the GPU activity is finished,
>> +  the dma_fence signals.
>> +* ``dma_resv``: A struct dma_resv (AKA reservation object) that is used
>> +  to track GPU activity in the form of multiple dma_fences on a
>> +  gvm or a gem buffer object. The dma_resv contains an array / list
>> +  of dma_fences and a lock that needs to be held when adding
>> +  additional dma_fences to the dma_resv. The lock is of a type that
>> +  allows deadlock-safe locking of multiple dma_resvs in arbitrary order.
>> +* ``exec function``: An exec function is a function that revalidates all
>> +  affected gvmas, submits a GPU command batch and registers the
>> +  dma_fence representing the GPU command's activity with all affected
>> +  dma_resvs. For completeness, although not covered by this document,
>> +  it's worth mentioning that an exec function may also be the
>> +  revalidation worker that is used by some drivers in compute /
>> +  long-running mode.
>> +* ``local object``: A GEM object which is local to a gvm. Shared gem
>> +  objects also share the gvm's dma_resv.
>> +* ``shared object``: AKA external object: A GEM object which may be shared
>> +  by multiple gvms and whose backing storage may be shared with
>> +  other drivers.
>> +
>> +
>> +Introducing the locks
>> +=====================
>> +
>> +One of the benefits of VM_BIND is that local GEM objects share the gvm's
>> +dma_resv object and hence the dma_resv lock. So even with a huge
>> +number of local GEM objects, only one lock is needed to make the exec
>> +sequence atomic.
>> +
>> +The following locks and locking orders are used:
>> +
>> +* The ``gvm->lock`` (optionally an rwsem). Protects how the gvm is
>> +  partitioned into gvmas, protects the gvm's list of external objects,
>> +  and can also with some simplification protect the gvm's list of
>> +  userptr gvmas. With the CPU mm analogy this would correspond to the
>> +  mmap_lock.
>> +* The ``userptr_seqlock``. This lock is taken in read mode for each
>> +  userptr gvma on the gvm's userptr list, and in write mode during mmu
>> +  notifier invalidation.
> is this something that exists withing the mmu_notifier or a new lock
> when handling the notifier?

No it's the MMU interval notifier functionality that acts like a 
seqlock: The read side waits until there are no writers (invalidators) 
until entering a critical section and reruns the read-side critical 
section if there was a writer sneaking in before leaving the read-side 
critical section. I'll add a pointer to that documentation.


>
>> +* The ``gvm->resv`` lock. Protects the gvm's list of gvmas needing
>> +  rebinding, and also the residency of all the gvm's local GEM object.
>> +* The ``gvm->userptr_notifier_lock``. This is an rwsem that is taken in read
>> +  mode during exec and write mode during a mmu notifier invalidation. In
>> +  the absence of a separate page-table lock, this lock can serve
>> +  together with the gvm's dma_resv lock as a page-table lock. More on
>> +  this below. The userptr notifier lock is per gvm.
> is the userptr_seqlock also per gpu_vm?
> and what's the difference from this and the other?
This lock ensures atomicity when checking the seqlock sequnce and 
submitting a batch job / publishing a dma-fence, so that either the 
read-side reruns or the write-side waits for the published fence. This 
is also more generically described in the MMU notifier documentation. 
Will update and clarify. The userptr_seqlock is per userptr vma.

>
>> +* The ``gvm->page_table_lock``. Protects the gvm's page-table updates. For
>> +  simplicity the gvm's dma_resv lock can be reused as page-table lock.
>> +
>> +There are certain optimizations described below that require
>> +additional locks. More on that later.
>> +
>> +.. code-block:: C
>> +
>> +   dma_resv_lock(&gvm->resv);
>> +
>> +   for_each_gvma_on_revalidate_list(gvm, &gvma) {
>> +		revalidate_gvma(&gvma);
>> +		remove_from_revalidate_list(&gvma);
>> +   }
>> +
>> +   add_dependencies(&gpu_job, &gvm->resv);
>> +   job_dma_fence = gpu_submit(&gpu_job));
>> +
>> +   add_dma_fence(job_dma_fence, &gvm->resv);
>> +   dma_resv_unlock(&gvm->resv);
>> +
>> +Eviction of one of these local objects will then be something like the
>> +following:
>> +
>> +.. code-block:: C
>> +
>> +   obj = get_object_from_lru();
>> +
>> +   dma_resv_lock(obj->resv);
>> +   for_each_gvma_of_obj(obj, &gvma);
>> +		put_gvma_on_revalidate_list(&gvma);
>> +
>> +   add_dependencies(&eviction_job, &obj->resv);
>> +   job_dma_fence = gpu_submit(&eviction_job);
>> +   add_dma_fence(&obj->resv, job_dma_fence);
>> +
>> +   dma_resv_unlock(&obj->resv);
>> +   put_object(obj);
>> +
>> +Note that since the object is local to the gvm, it will share the gvm's
>> +``dma_resv`` lock so that ``obj->resv == gvm->resv``. Invalidated gvmas are put
>> +on the gvm's revalidation list, which is protected by ``gvm->resv``, which
>> +is always locked while evicting, due to the above equality.
>> +
>> +Does the gvma need to be unbound before eviction? For VM_BIND gvms
>> +the answer is no. Since the eviction blit or copy will wait for GPU
>> +idle, any attempt by the GPU to access freed memory through the
>> +gvma will be preceded by a new exec function, which will
>> +make sure the gvma is revalidated, that is not an issue.
> The question opening the phrase made me think this was an open,
> but it more like an answer for a common question? Should we rephrase
> that to an affirmative note?
Sure.
>
>> +
>> +Introducing external (or shared) buffer objects
>> +===============================================
>> +
>> +Since shared buffer objects may be shared by multiple gvm's they
>> +can't share their reservation object with a single gvm, but will rather
>> +have a reservation object of their own. The shared objects bound to a
>> +gvm using one or many
>> +gvmas are therefore typically put on a per-gvm list which is
>> +protected by the gvm lock. One could in theory protect it also with
>> +the ``gvm->resv``, but since the list of dma_resvs to take is typically
>> +built before the ``gvm->resv`` is locked due to a limitation in
>> +the current locking helpers, that is typically not done. Also see
>> +below for userptr gvmas.
>> +
>> +At eviction time we now need to invalidate *all* gvmas of a shared
>> +object, but we can no longer be certain that we hold the gvm's
>> +dma_resv of all the object's gvmas. We can only be certain that we
>> +hold the object's private dma_resv. We can trylock the dma_resvs for
>> +the affected gvm's but that might be unnecessarily complex. If we
>> +have a ww_acquire context at hand at eviction time we can also perform
>> +sleeping locks of those dma_resvs but that could cause expensive
>> +rollbacks. One option is to just mark the invalidated gvmas with a bool
>> +which is inspected on the next exec function, when the gvm's
>> +dma_resv and the object's dma_resv is held, and the invalidated
>> +gvmas could then be put on the gvm's list of invalidated
>> +gvmas. That bool would then, although being per-gvma formally be
>> +protected by the object's dma_resv.
>> +
>> +The exec function would then look something like the following:
>> +
>> +.. code-block:: C
>> +
>> +   read_lock(&gvm->lock);
>> +		
>> +   dma_resv_lock(&gvm->resv);
>> +
>> +   // Shared object list is protected by the gvm->lock.
>> +   for_each_shared_obj(gvm, &obj) {
>> +		dma_resv_lock(&obj->resv);
>> +		move_marked_gvmas_to_revalidate_gvma_list(obj, &gvm);
>> +   }
>> +
>> +   for_each_gvma_to_revalidate(gvm, &gvma) {
>> +		revalidate_gvma(&gvma);
>> +		remove_from_revalidate_list(&gvma);
>> +   }
>> +
>> +   add_dependencies(&gpu_job, &gvm->resv);
>> +   job_dma_fence = gpu_submit(&gpu_job));
>> +
>> +   add_dma_fence(job_dma_fence, &gvm->resv);
>> +   for_each_shared_obj(gvm, &obj)
>> +          add_dma_fence(job_dma_fence, &obj->resv);
>> +   dma_resv_unlock_all_resv_locks();
>> +
>> +   read_unlock(&gvm->lock);
>> +
>> +And the corresponding shared-object aware eviction would look like:
>> +
>> +.. code-block:: C
>> +
>> +   obj = get_object_from_lru();
>> +
>> +   dma_resv_lock(obj->resv);
>> +   for_each_gvma_of_obj(obj, &gvma);
>> +		if (object_is_vm_local(obj))
>> +		             put_gvma_on_revalidate_list(&gvma, &gvm);
>> +		else
>> +		             mark_gvma_for_revalidation(&gvma);
>> +
>> +   add_dependencies(&eviction_job, &obj->resv);
>> +   job_dma_fence = gpu_submit(&eviction_job);
>> +   add_dma_fence(&obj->resv, job_dma_fence);
>> +
>> +   dma_resv_unlock(&obj->resv);
>> +   put_object(obj);
>> +
>> +Yet another option is to put the gvmas to be invalidated on a separate
>> +gvm list protected by a lower level lock that can be taken both at eviction
>> +time and at transfer-to-revalidate list time. The details are not in
>> +this document, but this for reference implemented in the Intel xe
>> +driver.
> is this part of what we need to rethink for the suspend/resume evictions?

No it's not related.


>
>> +
>> +Introducing userptr gvmas
>> +=========================
>> +
>> +A userptr gvma is a gvma that, instead of mapping a buffer object to a
>> +GPU virtual address range, directly maps a CPU mm range of anonymous-
>> +or file page-cache pages.
>> +A very simple approach would be to just pin the pages using
>> +pin_user_pages() at bind time and unpin them at unbind time, but this
>> +creates a Denial-Of-Service vector since a single user-space process
>> +would be able to pin down all of system memory, which is not
>> +desirable. (For special use-cases and with proper accounting pinning might
>> +still be a desirable feature, though). What we need to do in the general case is
>> +to obtain a reference to the desired pages, make sure we are notified
>> +using a MMU notifier just before the CPU mm unmaps the pages, dirty
>> +them if they are not mapped read-only to the GPU, and then drop the reference.
>> +When we are notified by the MMU notifier that CPU mm is about to drop the
>> +pages, we need to stop GPU access to the pages,
>> +GPU page-table and make sure that before the next time the GPU tries to access
>> +whatever is now present in the CPU mm range, we unmap the old pages
>> +from the GPU page tables and repeat the process of obtaining new page
>> +references. Note that when the core mm decides to laundry pages, we get such
>> +an unmap MMU notification and can mark the pages dirty again before the
>> +next GPU access. We also get similar MMU notifications for NUMA accounting
>> +which the GPU driver doesn't really need to care about, but so far
>> +it's proven difficult to exclude certain notifications.
>> +
>> +Using a MMU notifier for device DMA (and other methods) is described in
>> +`this document
>> +<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
>> +
>> +Now the method of obtaining struct page references using
>> +get_user_pages() unfortunately can't be used under a dma_resv lock
>> +since that would violate the locking order of the dma_resv lock vs the
>> +mmap_lock that is grabbed when resolving a CPU pagefault. This means the gvm's
>> +list of userptr gvmas needs to be protected by an outer lock, and this
>> +is the first time we strictly need the gvm->lock. While it was
>> +previously used also to protect the list of the gvm's shared objects,
>> +we could in theory have used the gvm->resv for that.
>> +
>> +The MMU interval seqlock for a userptr gvma is used in the following
>> +way:
>> +
>> +.. code-block:: C
>> +
>> +   down_read(&gvm->lock);
>> +
>> +   retry:
>> +
>> +   // Note: mmu_interval_read_begin() blocks until there is no
>> +   // invalidation notifier running anymore.
>> +   seq = mmu_interval_read_begin(&gvma->userptr_interval);
>> +   if (seq != gvma->saved_seq) {
>> +           obtain_new_page_pointers(&gvma);
>> +	   dma_resv_lock(&gvm->resv);
>> +	   put_gvma_on_revalidate_list(&gvma, &gvm);
>> +	   dma_resv_unlock(&gvm->resv);
>> +	   gvma->saved_seq = seq;
>> +   }
>> +
>> +   // The usual revalidation goes here.
>> +
>> +   // Final userptr sequence validation may not happen before the
>> +   // submission dma_fence is added to the gvm's resv, from the POW
>> +   // of the MMU invalidation notifier. Hence the
>> +   // userptr_notifier_lock that will make them appear atomic.
>> +
>> +   add_dependencies(&gpu_job, &gvm->resv);
>> +   down_read(&gvm->userptr_notifier_lock);
>> +   if (mmu_interval_read_retry(&gvma->userptr_interval, gvma->saved_seq)) {
>> +          up_read(&gvm->userptr_notifier_lock);
>> +	  goto retry;
>> +   }
>> +
>> +   job_dma_fence = gpu_submit(&gpu_job));
>> +
>> +   add_dma_fence(job_dma_fence, &gvm->resv);
>> +
>> +   for_each_shared_obj(gvm, &obj)
>> +          add_dma_fence(job_dma_fence, &obj->resv);
>> +
>> +   dma_resv_unlock_all_resv_locks();
>> +   up_read(&gvm->userptr_notifier_lock);
>> +   up_read(&gvm->lock);
>> +
>> +The code between ``mmu_interval_read_begin()`` and the
>> +``mmu_interval_read_retry()`` marks the read side critical section of
>> +what we call the ``userptr_seqlock``. In reality the gvm's userptr
>> +gvma list is looped through, and the check is done for *all* of its
>> +userptr gvmas, although we only show a single one here.
>> +
>> +The userptr gvma MMU invalidation notifier might be called from
>> +reclaim context and, again to avoid locking order violations, we can't
>> +take any dma_resv lock nor the gvm->lock from within it.
>> +
>> +.. code-block:: C
>> +
>> +  bool gvma_userptr_invalidate(userptr_interval, cur_seq)
>> +  {
>> +          // Make sure the exec function either sees the new sequence
>> +	  // and backs off or we wait for the dma-fence:
>> +	
>> +          down_write(&gvm->userptr_notifier_lock);
>> +	  mmu_interval_set_seq(userptr_interval, cur_seq);
>> +	  up_write(&gvm->userptr_notifier_lock);
>> +
>> +	  dma_resv_wait_timeout(&gvm->resv, DMA_RESV_USAGE_BOOKKEEP,
>> +		                false, MAX_SCHEDULE_TIMEOUT);
>> +	  return true;
>> +  }
>> +
>> +When this invalidation notifier returns, the GPU can no longer be
>> +accessing the old pages of the userptr gvma and needs to redo the page-binding
>> +before a new GPU submission can succeed.
>> +
>> +Optimizing gvma iteration
>> +-------------------------
>> +
>> +Iterating through all of a gvm's userptr gvmas to check the validity
>> +on each exec function may be very costly. There is a scheme to avoid
>> +this and only iterate through the userptr gvmas that actually saw an
>> +invalidation notifier call since the last exec. T
>> +
>> +TODO: describe that scheme here. It's implemented in the xe driver.
>> +
>> +Locking for page-table updates at bind- and unbind time
>> +=======================================================
>> +
>> +TODO.
>> +
>> +Recoverable page-fault implications
>> +===================================
>> +
>> +TODO.
>> -- 
>> 2.40.1
>>
