Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB76E4655
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF3310E41A;
	Mon, 17 Apr 2023 11:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7013310E41A;
 Mon, 17 Apr 2023 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681730693; x=1713266693;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dQdP2C0y13QjGPGlu8h5gpexTCLBs2TEofj4iMkHvbs=;
 b=IuOusUPIqI0eCAhX3xcC993jz4FYVodiE0twOCfIMFKZI7YurSUk7wsU
 ERW9SR+NvitmZ80Lj3CnYHu8zZxESLYBFQ0J12BbKIFvhMllTs5awbOAG
 v9oQMJOJZCnjamy0mraok9zQN80oplJ1SvF6fktYFJFcsFj6+CSsLjSAG
 PDKhnk9c0CkH2pRv1i0K1+7fztrN4NSMovFO6pvFhBWWhzPPauFMWKgO9
 y9wKAoMX58Mu+e8Fzom2k0t2Jj3rQYRuaRrr3iVYiA7+nKVbALwCgZ3Bo
 OV1CwLwWxSXqUXiAmW7czt5Z3VqlI+TnxXokMYWjYNHvV34CWJLNnpIfz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="325210114"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="325210114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 04:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="721081935"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="721081935"
Received: from gtohallo-mobl.ger.corp.intel.com (HELO [10.213.232.210])
 ([10.213.232.210])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 04:24:47 -0700
Message-ID: <048d4dba-153f-5d32-75fc-d7e7144d1e9c@linux.intel.com>
Date: Mon, 17 Apr 2023 12:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
 <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
 <2177327.1BCLMh4Saa@suse>
 <1b341218-f0e2-a613-2ac6-107064a813ca@linux.intel.com>
 <ZDku5SJhl2Ve51UC@liuzhao-OptiPlex-7080>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZDku5SJhl2Ve51UC@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/04/2023 11:45, Zhao Liu wrote:
> Hi Tvrtko,
> 
> On Wed, Apr 12, 2023 at 04:45:13PM +0100, Tvrtko Ursulin wrote:
> 
> [snip]
> 
>>>
>>> [snip]
>>>> However I am unsure if disabling pagefaulting is needed or not. Thomas,
>>>> Matt, being the last to touch this area, perhaps you could have a look?
>>>> Because I notice we have a fallback iomap path which still uses
>>>> io_mapping_map_atomic_wc. So if kmap_atomic to kmap_local conversion is
>>>> safe, does the iomap side also needs converting to
>>>> io_mapping_map_local_wc? Or they have separate requirements?
>>>
>>> AFAIK, the requirements for io_mapping_map_local_wc() are the same as for
>>> kmap_local_page(): the kernel virtual address is _only_ valid in the caller
>>> context, and map/unmap nesting must be done in stack-based ordering (LIFO).
>>>
>>> I think a follow up patch could safely switch to io_mapping_map_local_wc() /
>>> io_mapping_unmap_local_wc since the address is local to context.
>>>
>>> However, not being an expert, reading your note now I suspect that I'm missing
>>> something. Can I ask why you think that page-faults disabling might be
>>> necessary?
>>
>> I am not saying it is, was just unsure and wanted some people who worked on this code most recently to take a look and confirm.
>>
>> I guess it will work since the copying is done like this anyway:
>>
>> 		/*
>> 		 * This is the fast path and we cannot handle a pagefault
>> 		 * whilst holding the struct mutex lest the user pass in the
>> 		 * relocations contained within a mmaped bo. For in such a case
>> 		 * we, the page fault handler would call i915_gem_fault() and
>> 		 * we would try to acquire the struct mutex again. Obviously
>> 		 * this is bad and so lockdep complains vehemently.
>> 		 */
>> 		pagefault_disable();
>> 		copied = __copy_from_user_inatomic(r, urelocs, count * sizeof(r[0]));
>> 		pagefault_enable();
>> 		if (unlikely(copied)) {
>> 			remain = -EFAULT;
>> 			goto out;
>> 		}
>>
>> Comment is a bit outdated since we don't use that global "struct mutex" any longer, but in any case, if there is a page fault on the mapping where we need to recurse into i915 again to satisfy if, we seem to have code already to handle it. So kmap_local conversion I *think* can't regress anything.
> 
> Thanks for your explanation!
> 
>>
>> Patch to convert the io_mapping_map_atomic_wc can indeed come later.
> 
> Okay, I will also look at this.
> 
>>
>> In terms of logistics - if we landed this series to out branch it would be queued only for 6.5. Would that work for you?
> 
> Yeah, it's ok for me. But could I ask, did I miss the 6.4 merge time?

Yes, but just because we failed to review and merge in time, not because 
you did not provide patches in time.

Regards,

Tvrtko

