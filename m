Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943833901AD
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CC46EA19;
	Tue, 25 May 2021 13:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8636EA11;
 Tue, 25 May 2021 13:07:13 +0000 (UTC)
IronPort-SDR: z0+S8mezmuWYNkWBfAZHTG+3JyRn5qZ4dW7ko3t/p9/2ZXHvGNEdRtWdyk9PczoPcqddY2TP/r
 B7kRfrF3EXLg==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266080442"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="266080442"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 06:07:10 -0700
IronPort-SDR: vvjAEhb+B0kN8AskxBivyDf5INTMxKjqegeP3aXn7ySBEE9lUiYuswhmfPImuss9DZ9e4p4eF2
 hOyQIlSv9A7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="476414875"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2021 06:07:08 -0700
Received: from [10.249.148.145] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.148.145])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14PD76DU024184; Tue, 25 May 2021 14:07:06 +0100
Subject: Re: [RFC PATCH 12/97] drm/i915/guc: Don't repeat CTB layout
 calculations
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-13-matthew.brost@intel.com>
 <20210525025328.GA9162@sdutt-i7>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <9017c2e4-ce78-aace-621b-f2b0d2296583@intel.com>
Date: Tue, 25 May 2021 15:07:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525025328.GA9162@sdutt-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: tvrtko.ursulin@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25.05.2021 04:53, Matthew Brost wrote:
> On Thu, May 06, 2021 at 12:13:26PM -0700, Matthew Brost wrote:
>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> We can retrieve offsets to cmds buffers and descriptor from
>> actual pointers that we already keep locally.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 16 ++++++++++------
>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index dbece569fbe4..fbd6bd20f588 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -244,6 +244,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>>  {
>>  	struct intel_guc *guc = ct_to_guc(ct);
>>  	u32 base, cmds;
>> +	void *blob;
>>  	int err;
>>  	int i;
>>  
>> @@ -251,15 +252,18 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>>  
>>  	/* vma should be already allocated and map'ed */
>>  	GEM_BUG_ON(!ct->vma);
>> +	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(ct->vma->obj));
> 
> This doesn't really have anything to do with this patch, but again this
> patch will be squashed into a large patch updating the GuC firmware, so
> I think this is fine.

again, no need to squash GuC patches up to 20/97

> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>>  	base = intel_guc_ggtt_offset(guc, ct->vma);
>>  
>> -	/* (re)initialize descriptors
>> -	 * cmds buffers are in the second half of the blob page
>> -	 */
>> +	/* blob should start with send descriptor */
>> +	blob = __px_vaddr(ct->vma->obj);
>> +	GEM_BUG_ON(blob != ct->ctbs[CTB_SEND].desc);
>> +
>> +	/* (re)initialize descriptors */
>>  	for (i = 0; i < ARRAY_SIZE(ct->ctbs); i++) {
>>  		GEM_BUG_ON((i != CTB_SEND) && (i != CTB_RECV));
>>  
>> -		cmds = base + PAGE_SIZE / 4 * i + PAGE_SIZE / 2;
>> +		cmds = base + ptrdiff(ct->ctbs[i].cmds, blob);
>>  		CT_DEBUG(ct, "%d: cmds addr=%#x\n", i, cmds);
>>  
>>  		guc_ct_buffer_reset(&ct->ctbs[i], cmds);
>> @@ -269,12 +273,12 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>>  	 * Register both CT buffers starting with RECV buffer.
>>  	 * Descriptors are in first half of the blob.
>>  	 */
>> -	err = ct_register_buffer(ct, base + PAGE_SIZE / 4 * CTB_RECV,
>> +	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs[CTB_RECV].desc, blob),
>>  				 INTEL_GUC_CT_BUFFER_TYPE_RECV);
>>  	if (unlikely(err))
>>  		goto err_out;
>>  
>> -	err = ct_register_buffer(ct, base + PAGE_SIZE / 4 * CTB_SEND,
>> +	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs[CTB_SEND].desc, blob),
>>  				 INTEL_GUC_CT_BUFFER_TYPE_SEND);
>>  	if (unlikely(err))
>>  		goto err_deregister;
>> -- 
>> 2.28.0
>>
