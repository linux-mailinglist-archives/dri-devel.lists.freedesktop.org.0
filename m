Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EBB12573E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0A96EA9D;
	Wed, 18 Dec 2019 22:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BD06EA9C;
 Wed, 18 Dec 2019 22:53:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 14:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210248657"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 14:52:56 -0800
Date: Wed, 18 Dec 2019 14:41:47 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC v2 05/12] drm/i915/svm: Page table mirroring support
Message-ID: <20191218224147.GB17413@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-6-niranjana.vishwanathapura@intel.com>
 <20191217203103.GG16762@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217203103.GG16762@mellanox.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "kenneth.w.graunke@intel.com" <kenneth.w.graunke@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jason.ekstrand@intel.com" <jason.ekstrand@intel.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 08:31:07PM +0000, Jason Gunthorpe wrote:
>On Fri, Dec 13, 2019 at 01:56:07PM -0800, Niranjana Vishwanathapura wrote:
>> +static struct i915_svm *vm_get_svm(struct i915_address_space *vm)
>> +{
>> +	struct i915_svm *svm = vm->svm;
>> +
>> +	mutex_lock(&vm->svm_mutex);
>> +	if (svm && !kref_get_unless_zero(&svm->ref))
>> +		svm = NULL;
>
>Quite strange to see a get_unless_zero under a lock..
>

Thanks.

Yah I agree (construct taken from a differnt place).
It should go away once I swith to mmu_notifier_get/put.

>> +static void release_svm(struct kref *ref)
>> +{
>> +	struct i915_svm *svm = container_of(ref, typeof(*svm), ref);
>> +	struct i915_address_space *vm = svm->vm;
>> +
>> +	mmu_notifier_unregister(&svm->notifier, svm->notifier.mm);
>
>This would be a lot better to use mmu_notifier_put to manage the
>reference and deallocation.
>

Yah, have that in mind, will use that.

>> +static u32 i915_svm_build_sg(struct i915_address_space *vm,
>> +			     struct hmm_range *range,
>> +			     struct sg_table *st)
>> +{
>> +	struct scatterlist *sg;
>> +	u32 sg_page_sizes = 0;
>> +	u64 i, npages;
>> +
>> +	sg = NULL;
>> +	st->nents = 0;
>> +	npages = (range->end - range->start) / PAGE_SIZE;
>> +
>> +	/*
>> +	 * No need to dma map the host pages and later unmap it, as
>> +	 * GPU is not allowed to access it with SVM.
>> +	 * XXX: Need to dma map host pages for integrated graphics while
>> +	 * extending SVM support there.
>> +	 */
>> +	for (i = 0; i < npages; i++) {
>> +		u64 addr = range->pfns[i] & ~((1UL << range->pfn_shift) - 1);
>> +
>> +		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
>> +			sg->length += PAGE_SIZE;
>> +			sg_dma_len(sg) += PAGE_SIZE;
>> +			continue;
>> +		}
>> +
>> +		if (sg)
>> +			sg_page_sizes |= sg->length;
>> +
>> +		sg =  sg ? __sg_next(sg) : st->sgl;
>> +		sg_dma_address(sg) = addr;
>> +		sg_dma_len(sg) = PAGE_SIZE;
>
>This still can't be like this - assigning pfn to 'dma_address' is
>fundamentally wrong.
>
>Whatever explanation you had, this needs to be fixed up first before we get
>to this patch.
>

The pfn is converted into a device address which goes into sg_dma_address.
Ok, let me think about what else we can do here.
As device addresses are not dma mapped, may be we can look at it as direct
mapped (__phys_to_dma())? Or perhaps define our own sgl.
Not sure, will look into it.

>> +static int i915_range_fault(struct svm_notifier *sn,
>> +			    struct drm_i915_gem_vm_bind *args,
>> +			    struct sg_table *st, u64 *pfns)
>> +{
>> +	unsigned long timeout =
>> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>> +	/* Have HMM fault pages within the fault window to the GPU. */
>> +	struct hmm_range range = {
>> +		.notifier = &sn->notifier,
>> +		.start = sn->notifier.interval_tree.start,
>> +		.end = sn->notifier.interval_tree.last + 1,
>> +		.pfns = pfns,
>> +		.pfn_shift = PAGE_SHIFT,
>> +		.flags = i915_range_flags,
>> +		.values = i915_range_values,
>> +		.default_flags = (range.flags[HMM_PFN_VALID] |
>> +				  ((args->flags & I915_GEM_VM_BIND_READONLY) ?
>> +				   0 : range.flags[HMM_PFN_WRITE])),
>> +		.pfn_flags_mask = 0,
>> +
>> +	};
>> +	struct i915_svm *svm = sn->svm;
>> +	struct mm_struct *mm = sn->notifier.mm;
>> +	struct i915_address_space *vm = svm->vm;
>> +	u32 sg_page_sizes;
>> +	u64 flags;
>> +	long ret;
>> +
>> +	while (true) {
>> +		if (time_after(jiffies, timeout))
>> +			return -EBUSY;
>> +
>> +		range.notifier_seq = mmu_interval_read_begin(range.notifier);
>> +		down_read(&mm->mmap_sem);
>> +		ret = hmm_range_fault(&range, 0);
>> +		up_read(&mm->mmap_sem);
>> +		if (ret <= 0) {
>> +			if (ret == 0 || ret == -EBUSY)
>> +				continue;
>> +			return ret;
>> +		}
>> +
>> +		sg_page_sizes = i915_svm_build_sg(vm, &range, st);
>> +		mutex_lock(&svm->mutex);
>> +		if (mmu_interval_read_retry(range.notifier,
>> +					    range.notifier_seq)) {
>> +			mutex_unlock(&svm->mutex);
>> +			continue;
>> +		}
>> +		break;
>> +	}
>> +
>> +	flags = (args->flags & I915_GEM_VM_BIND_READONLY) ?
>> +		I915_GTT_SVM_READONLY : 0;
>> +	ret = svm_bind_addr_commit(vm, args->start, args->length,
>> +				   flags, st, sg_page_sizes);
>> +	mutex_unlock(&svm->mutex);
>
>This looks better..
>
>> +int i915_gem_vm_bind_svm_buffer(struct i915_address_space *vm,
>> +				struct drm_i915_gem_vm_bind *args)
>> +{
>> +	struct svm_notifier sn;
>> +	struct i915_svm *svm;
>> +	struct mm_struct *mm;
>> +	struct sg_table st;
>> +	u64 npages, *pfns;
>> +	int ret = 0;
>> +
>> +	svm = vm_get_svm(vm);
>> +	if (!svm)
>> +		return -EINVAL;
>> +
>> +	mm = svm->notifier.mm;
>> +	if (mm != current->mm) {
>> +		ret = -EPERM;
>> +		goto bind_done;
>> +	}
>
>Bit strange, we have APIs now to make it fairly easy to deal with
>multiple processe, (ie the get/put scheme) why have this restriction?
>

Nothing particular, just thought of supporting it later if required.

>> +
>> +	args->length += (args->start & ~PAGE_MASK);
>> +	args->start &= PAGE_MASK;
>> +	DRM_DEBUG_DRIVER("%sing start 0x%llx length 0x%llx vm_id 0x%x\n",
>> +			 (args->flags & I915_GEM_VM_BIND_UNBIND) ?
>> +			 "Unbind" : "Bind", args->start, args->length,
>> +			 args->vm_id);
>> +	if (args->flags & I915_GEM_VM_BIND_UNBIND) {
>> +		i915_gem_vm_unbind_svm_buffer(vm, args->start, args->length);
>> +		goto bind_done;
>> +	}
>> +
>> +	npages = args->length / PAGE_SIZE;
>> +	if (unlikely(sg_alloc_table(&st, npages, GFP_KERNEL))) {
>> +		ret = -ENOMEM;
>> +		goto bind_done;
>> +	}
>> +
>> +	pfns = kvmalloc_array(npages, sizeof(uint64_t), GFP_KERNEL);
>> +	if (unlikely(!pfns)) {
>> +		ret = -ENOMEM;
>> +		goto range_done;
>> +	}
>> +
>> +	ret = svm_bind_addr_prepare(vm, args->start, args->length);
>> +	if (unlikely(ret))
>> +		goto prepare_done;
>> +
>> +	sn.svm = svm;
>> +	ret = mmu_interval_notifier_insert(&sn.notifier, mm,
>> +					   args->start, args->length,
>> +					   &i915_svm_mni_ops);
>> +	if (!ret) {
>> +		ret = i915_range_fault(&sn, args, &st, pfns);
>> +		mmu_interval_notifier_remove(&sn.notifier);
>> +	}
>
>success oriented flow...
>

Ok.

>> +static int
>> +i915_svm_invalidate_range_start(struct mmu_notifier *mn,
>> +				const struct mmu_notifier_range *update)
>> +{
>> +	struct i915_svm *svm = container_of(mn, struct i915_svm, notifier);
>> +	unsigned long length = update->end - update->start;
>> +
>> +	DRM_DEBUG_DRIVER("start 0x%lx length 0x%lx\n", update->start, length);
>> +	if (!mmu_notifier_range_blockable(update))
>> +		return -EAGAIN;
>> +
>> +	i915_gem_vm_unbind_svm_buffer(svm->vm, update->start, length);
>> +	return 0;
>> +}
>
>I still think you should strive for a better design than putting a
>notifier across the entire address space..
>

Yah, thought it could be later optimization.
If I think about it, it has be be a new user API to set the range,
or an intermediate data structure for tracking the bound ranges.
Will look into it.

Thanks,
Niranjana

>> +
>> +#if defined(CONFIG_DRM_I915_SVM)
>> +struct i915_svm {
>> +	/* i915 address space */
>> +	struct i915_address_space *vm;
>> +
>> +	struct mmu_notifier notifier;
>> +	struct mutex mutex; /* protects svm operations */
>> +	/*
>> +	 * XXX: Probably just make use of mmu_notifier's reference
>> +	 * counting (get/put) instead of our own.
>> +	 */
>
>Yes
>
>Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
