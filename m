Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8C1256A3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327CF6EA88;
	Wed, 18 Dec 2019 22:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF666EA88;
 Wed, 18 Dec 2019 22:26:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 14:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="248048747"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2019 14:26:35 -0800
Date: Wed, 18 Dec 2019 14:15:26 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC v2 06/12] drm/i915/svm: Device memory support
Message-ID: <20191218221526.GA17413@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-7-niranjana.vishwanathapura@intel.com>
 <20191217203543.GH16762@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217203543.GH16762@mellanox.com>
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

On Tue, Dec 17, 2019 at 08:35:47PM +0000, Jason Gunthorpe wrote:
>On Fri, Dec 13, 2019 at 01:56:08PM -0800, Niranjana Vishwanathapura wrote:
>> @@ -169,6 +170,11 @@ static int i915_range_fault(struct svm_notifier *sn,
>>  			return ret;
>>  		}
>>
>> +		/* For dgfx, ensure the range is in device local memory only */
>> +		regions = i915_dmem_convert_pfn(vm->i915, &range);
>> +		if (!regions || (IS_DGFX(vm->i915) && (regions & REGION_SMEM)))
>> +			return -EINVAL;
>> +
>
>This is not OK, as I said before, the driver cannot de-reference pfns
>before doing the retry check, under lock.
>

Thanks.
Ok, will push it down and do it after validating the range.

>> +
>> +int i915_dmem_convert_pfn(struct drm_i915_private *dev_priv,
>> +			  struct hmm_range *range)
>> +{
>> +	unsigned long i, npages;
>> +	int regions = 0;
>> +
>> +	npages = (range->end - range->start) >> PAGE_SHIFT;
>> +	for (i = 0; i < npages; ++i) {
>> +		struct i915_buddy_block *block;
>> +		struct intel_memory_region *mem;
>> +		struct page *page;
>> +		u64 addr;
>> +
>> +		page = hmm_device_entry_to_page(range, range->pfns[i]);
>                        ^^^^^^^^^^^^^^^^^^^^^^
>
>For instance, that cannot be done on a speculatively loaded page.
>
>This also looks like it suffers from the same bug as
>

Ok.

>> +		if (!page)
>> +			continue;
>> +
>> +		if (!(range->pfns[i] & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
>> +			regions |= REGION_SMEM;
>> +			continue;
>> +		}
>> +
>> +		if (!i915_dmem_page(dev_priv, page)) {
>> +			WARN(1, "Some unknown device memory !\n");
>
>Why is that a WARN? The user could put other device memory in the
>address space. You need to 'segfault' the GPU execution if this happens.
>

OK, will return an error here if user is trying to bind here.
I agree, we need to segfault the GPU if it is GPU fault handling.

>> +			range->pfns[i] = 0;
>> +			continue;
>> +		}
>> +
>> +		regions |= REGION_LMEM;
>> +		block = page->zone_device_data;
>> +		mem = block->private;
>> +		addr = mem->region.start +
>> +		       i915_buddy_block_offset(block);
>> +		addr += (page_to_pfn(page) - block->pfn_first) << PAGE_SHIFT;
>> +
>> +		range->pfns[i] &= ~range->flags[HMM_PFN_DEVICE_PRIVATE];
>> +		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
>> +		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
>
>This makes more sense as a direct manipulation of the sgl, not sure
>why this routine is split out from the sgl builder?
>

Ok, yah, let me merge it with sgl building.

Thanks,
Niranjana

>Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
