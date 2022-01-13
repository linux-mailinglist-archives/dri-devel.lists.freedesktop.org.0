Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FABD48D99D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B58D10E23F;
	Thu, 13 Jan 2022 14:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB04F10E23F;
 Thu, 13 Jan 2022 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642083498; x=1673619498;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c5lzrJ1y6v56RTBeUL2+cdshIkvO15Q0j4CA1nmDp6c=;
 b=huXPHxZp6f7WAJs872keqGNsCwvOYsPdGLQmvX+ryWuuwI35rabK8EL1
 7xZ6A9ALYO2qkMlgym+4ELk27U1M8MX6E8XALSO1+4kjePpIYoTz50K77
 kSwmjHIPIYN9JBqg8X6zaBXxxGRKvWcbEc0cSJv7OyKLQgMVrQhv8UJdR
 i8ca07p94IYaIebmYlM2pda4MPT3xR9du3ezwaT2ajubTigK551h1Es6K
 +44P2WRcqw1Klq6uti2iu6NGskDyPMVoQVmooKdRoRob+ER28LcEZr9pV
 oLE7R3zSx62eBWaiZvGWr06QPx4JNn4wDNbrCaOgnfaWJgd65xCgZAVmZ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="243968269"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="243968269"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 06:18:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="529006804"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2022 06:18:16 -0800
Received: from [10.249.128.188] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.128.188])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 20DEIFvJ030970; Thu, 13 Jan 2022 14:18:15 GMT
Message-ID: <2e7b4c82-222c-6ec2-8e58-d2981bb97cb6@intel.com>
Date: Thu, 13 Jan 2022 15:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: Flip guc_id allocation partition
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20220111163019.13694-1-matthew.brost@intel.com>
 <37083d2f-e572-4c78-41ba-a1693e9e84f8@intel.com>
 <20220112232629.GA19134@jons-linux-dev-box>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220112232629.GA19134@jons-linux-dev-box>
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13.01.2022 00:26, Matthew Brost wrote:
> On Thu, Jan 13, 2022 at 12:21:17AM +0100, Michal Wajdeczko wrote:
>> On 11.01.2022 17:30, Matthew Brost wrote:

...

>>> @@ -1863,6 +1861,33 @@ static void guc_submit_request(struct i915_request *rq)
>>>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
>>>  }
>>>  
>>> +static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>> +{
>>> +	int ret;
>>> +
>>> +	GEM_BUG_ON(!intel_context_is_parent(ce));
>>> +	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
>>> +
>>> +	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
>>> +				       NUMBER_MULTI_LRC_GUC_ID(guc),
>>> +				       order_base_2(ce->parallel.number_children
>>> +						    + 1));
>>
>> btw, is there any requirement (GuC ABI ?) that allocated ids need
>> to be allocated with power of 2 alignment ? I don't think that we
>> must optimize that hard and in some cases waste extra ids (as we might
>> be limited on some configs)
>>
> 
> No pow2 requirement in GuC ABI, bitmaps only work on pow2 alignment and
> didn't optmize this.
>

there is a slower variant of "find" function:

bitmap_find_next_zero_area - find a contiguous aligned zero area

that does not have this limitation

..


>>> @@ -1989,6 +2008,14 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>  
>>>  	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>>>  
>>> +	if (unlikely(intel_context_is_parent(ce) &&
>>> +		     !guc->submission_state.guc_ids_bitmap)) {
>>> +		guc->submission_state.guc_ids_bitmap =
>>> +			bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>>> +		if (!guc->submission_state.guc_ids_bitmap)
>>> +			return -ENOMEM;
>>> +	}
>>
>> maybe move this chunk to new_mlrc_guc_id() ?
>> or we can't due to the spin_lock below ?
>> but then how do you protect guc_ids_bitmap pointer itself ?
>>
> 
> Can't use GFP_KERNEL inside a spin lock...
> 

ok, but what if there will be two or more parallel calls to pin_guc_id()
with all being first parent context? each will see NULL guc_ids_bitmap..
or there is another layer of synchronization?

-Michal
