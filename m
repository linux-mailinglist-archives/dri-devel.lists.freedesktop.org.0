Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B902128FC1
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 21:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BC26E041;
	Sun, 22 Dec 2019 20:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE5B6E041;
 Sun, 22 Dec 2019 20:05:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Dec 2019 12:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,345,1571727600"; d="scan'208";a="249272950"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2019 12:05:15 -0800
Date: Sun, 22 Dec 2019 11:54:09 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC v2 05/12] drm/i915/svm: Page table mirroring support
Message-ID: <20191222195408.GM17413@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-6-niranjana.vishwanathapura@intel.com>
 <20191217203103.GG16762@mellanox.com>
 <20191218224147.GB17413@nvishwa1-DESK.sc.intel.com>
 <20191220134529.GW16762@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220134529.GW16762@mellanox.com>
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

On Fri, Dec 20, 2019 at 01:45:33PM +0000, Jason Gunthorpe wrote:
>On Wed, Dec 18, 2019 at 02:41:47PM -0800, Niranjana Vishwanathapura wrote:
>> > > +static u32 i915_svm_build_sg(struct i915_address_space *vm,
>> > > +			     struct hmm_range *range,
>> > > +			     struct sg_table *st)
>> > > +{
>> > > +	struct scatterlist *sg;
>> > > +	u32 sg_page_sizes = 0;
>> > > +	u64 i, npages;
>> > > +
>> > > +	sg = NULL;
>> > > +	st->nents = 0;
>> > > +	npages = (range->end - range->start) / PAGE_SIZE;
>> > > +
>> > > +	/*
>> > > +	 * No need to dma map the host pages and later unmap it, as
>> > > +	 * GPU is not allowed to access it with SVM.
>> > > +	 * XXX: Need to dma map host pages for integrated graphics while
>> > > +	 * extending SVM support there.
>> > > +	 */
>> > > +	for (i = 0; i < npages; i++) {
>> > > +		u64 addr = range->pfns[i] & ~((1UL << range->pfn_shift) - 1);
>> > > +
>> > > +		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
>> > > +			sg->length += PAGE_SIZE;
>> > > +			sg_dma_len(sg) += PAGE_SIZE;
>> > > +			continue;
>> > > +		}
>> > > +
>> > > +		if (sg)
>> > > +			sg_page_sizes |= sg->length;
>> > > +
>> > > +		sg =  sg ? __sg_next(sg) : st->sgl;
>> > > +		sg_dma_address(sg) = addr;
>> > > +		sg_dma_len(sg) = PAGE_SIZE;
>> >
>> > This still can't be like this - assigning pfn to 'dma_address' is
>> > fundamentally wrong.
>> >
>> > Whatever explanation you had, this needs to be fixed up first before we get
>> > to this patch.
>> >
>>
>> The pfn is converted into a device address which goes into sg_dma_address.
>> Ok, let me think about what else we can do here.
>
>If you combine this with the other function and make it so only
>DEVICE_PRIVATE pages get converted toa dma_address with out dma_map,
>then that would make sense.
>

Ok thanks, will do that.

>> > > +static int
>> > > +i915_svm_invalidate_range_start(struct mmu_notifier *mn,
>> > > +				const struct mmu_notifier_range *update)
>> > > +{
>> > > +	struct i915_svm *svm = container_of(mn, struct i915_svm, notifier);
>> > > +	unsigned long length = update->end - update->start;
>> > > +
>> > > +	DRM_DEBUG_DRIVER("start 0x%lx length 0x%lx\n", update->start, length);
>> > > +	if (!mmu_notifier_range_blockable(update))
>> > > +		return -EAGAIN;
>> > > +
>> > > +	i915_gem_vm_unbind_svm_buffer(svm->vm, update->start, length);
>> > > +	return 0;
>> > > +}
>> >
>> > I still think you should strive for a better design than putting a
>> > notifier across the entire address space..
>> >
>>
>> Yah, thought it could be later optimization.
>> If I think about it, it has be be a new user API to set the range,
>> or an intermediate data structure for tracking the bound ranges.
>> Will look into it.
>
>Well, there are lots of options. Like I said, implicit ODP uses a
>level of the device page table to attach the notifier.
>
>There are many performance trade offs here, it depends what works best
>for your work load I suppose. But usually the fault path is the fast
>thing, so I would think to avoid registering mmu_intervals on it and
>accept the higher probability of collisions.
>

Ok thanks, yah, solution should tune for the performant path. Will look into it.

Thanks,
Niranjana

>Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
