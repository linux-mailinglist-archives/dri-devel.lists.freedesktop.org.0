Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9819583A0D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 10:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E0A9581F;
	Thu, 28 Jul 2022 08:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58CD958D2;
 Thu, 28 Jul 2022 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658995700; x=1690531700;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EHB/FyBdZHtU2z8oM3nJZ84oUbSLNxBSnlnUk4I7v8A=;
 b=GZ1UR3XgxkRwU2NBXl02h5RvxNJKOb4d2h2swViYFNPK3LECAcZ5GLW5
 dT2LW2oTXEw+2PPlfOiJXaOaPPRPQ+o4sNdL+5bzKr5NeG5+Eqhcmukve
 KKdeQqfqgVdaiCKlbguleCDgz7iBTaCxyzu7UZb5K7Lm6HESGhgZ7onGz
 +qLh9q7cLwEmS+Jxkx2KrwOBG2kLSaya4/cPuc2s0q8n6XJ8QD37iOMT/
 mMO+q2tWTYIQ5PzHLH3GSXNEd/6FGEoIh/FwS2yunlE3cs3W9jjG/1lM4
 IwmsIoCKoFbrAgUzO1NoHP/mhwMptVS8XgWI42G103YW/wpNOBInncCfr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="352448288"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="352448288"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 01:08:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="846602066"
Received: from abernota-mobl.ger.corp.intel.com (HELO [10.213.218.28])
 ([10.213.218.28])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 01:08:18 -0700
Message-ID: <46f484d0-4c3f-f63a-3ee2-eae1b71293f9@intel.com>
Date: Thu, 28 Jul 2022 09:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915/ttm: don't leak the ccs state
Content-Language: en-GB
To: "C, Ramalingam" <ramalingam.c@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220727164346.282407-1-matthew.auld@intel.com>
 <DM4PR11MB6043DA030C0AED1295B0E6F09D979@DM4PR11MB6043.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DM4PR11MB6043DA030C0AED1295B0E6F09D979@DM4PR11MB6043.namprd11.prod.outlook.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2022 00:16, C, Ramalingam wrote:
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Wednesday, July 27, 2022 10:14 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Thomas Hellström <thomas.hellstrom@linux.intel.com>; C,
>> Ramalingam <ramalingam.c@intel.com>
>> Subject: [PATCH] drm/i915/ttm: don't leak the ccs state
>>
>> The kernel only manages the ccs state with lmem-only objects, however the kernel should still take
>> care not to leak the CCS state from the previous user.
>>
>> Fixes: 48760ffe923a ("drm/i915/gt: Clear compress metadata for Flat-ccs objects")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Ramalingam C <ramalingam.c@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_migrate.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
>> index a69b244f14d0..9a0814422ba4 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
>> @@ -708,7 +708,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>>   	u8 src_access, dst_access;
>>   	struct i915_request *rq;
>>   	int src_sz, dst_sz;
>> -	bool ccs_is_src;
>> +	bool ccs_is_src, overwrite_ccs;
>>   	int err;
>>
>>   	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
>> @@ -749,6 +749,8 @@ intel_context_migrate_copy(struct intel_context *ce,
>>   			get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
>>   	}
>>
>> +	overwrite_ccs = HAS_FLAT_CCS(i915) && !ccs_bytes_to_cpy &&
>> +dst_is_lmem;
>> +
>>   	src_offset = 0;
>>   	dst_offset = CHUNK_SZ;
>>   	if (HAS_64K_PAGES(ce->engine->i915)) { @@ -852,6 +854,25 @@
>> intel_context_migrate_copy(struct intel_context *ce,
>>   			if (err)
>>   				goto out_rq;
>>   			ccs_bytes_to_cpy -= ccs_sz;
>> +		} else if (overwrite_ccs) {
>> +			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>> +			if (err)
>> +				goto out_rq;
>> +
>> +			/*
>> +			 * While we can't always restore/manage the CCS state,
>> +			 * we still need to ensure we don't leak the CCS state
>> +			 * from the previous user, so make sure we overwrite it
>> +			 * with something.
>> +			 */
>> +			err = emit_copy_ccs(rq, dst_offset, INDIRECT_ACCESS,
>> +					    dst_offset, DIRECT_ACCESS, len);
>> +			if (err)
>> +				goto out_rq;
>> +
>> +			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>> +			if (err)
>> +				goto out_rq;
> The change is looking good to the purpose. But shouldn't this be the part of lmem allocation itself?

Hmm, what do you mean by the lmem allocation itself? The scenarios I had 
in mind here were:

- { lmem, smem } buffer, object is allocated in smem (like with initial 
mmap) and then moved to lmem (smem -> lmem).

- { lmem, smem } buffer, object is allocated in lmem, but then evicted 
to smem. Object then moved back to lmem (smem -> lmem).

- { lmem, smem} buffer with CPU_ACCESS flag on small-bar system, object 
is allocated in non-mappable lmem, and them moved to the mappable part 
of lmem on fault (lmem -> lmem).

In all the above cases the CCS state is left uninitialised, AFAICT.

> 
> Ram.
>>   		}
>>
>>   		/* Arbitration is re-enabled between requests. */
>> --
>> 2.37.1
> 
