Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5363D74D154
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DD610E21F;
	Mon, 10 Jul 2023 09:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D018410E10D;
 Mon, 10 Jul 2023 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688981125; x=1720517125;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PGOTy3epTYPFyVb1CAx49FFIjQC9zgRGP5LLSUNF85Q=;
 b=A/X4qNLW4aAG5F0SqdukgE5t1SFLpJDCc+XybkhY4x4BYNOMSHeM82Ax
 GWfQpWaX5E83Nm6+00xJqQGOeWQzIA1OguPC1yRC+6fTmVNi+/Gh3z2yf
 UNzrpI4JI1Ri+pM9IGWy2iXQWreoayImUoDqnPh568MFYjpchL/Ct8Vos
 P4mY+WMuaLF+g4wkinURpGwY/F5vtHAbjD/20MM0pNpzFiFL2Ug5TTaRC
 vqB1hleM3AyWPnXFjrtuulnjmWsJK2wiWUEBJ5DI1M46SHIRpxEO7GVl6
 na5dZvfcF19b3+Fz0h/+2XezTQRXUzswkpMTLe+pSFQzRYhPT27cxCJP5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="427989963"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="427989963"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="786085438"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="786085438"
Received: from ccgoode-mobl.ger.corp.intel.com (HELO [10.213.236.139])
 ([10.213.236.139])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:25:21 -0700
Message-ID: <d4da0656-9eb5-f6e5-9c30-83b7c1419586@linux.intel.com>
Date: Mon, 10 Jul 2023 10:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Remove dead code from
 gen8_pte_encode
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230707124644.3965281-1-tvrtko.ursulin@linux.intel.com>
 <ZKgeGwl0nj9QAptv@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZKgeGwl0nj9QAptv@intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/07/2023 15:17, Rodrigo Vivi wrote:
> On Fri, Jul 07, 2023 at 01:46:44PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Commit 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
>> added a dedicated gen12_pte_encode but forgot to remove the Gen12 specific
>> bit from gen8_pte_encode.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Pushed, thanks for the reviews!

Regards,

Tvrtko

> 
>> ---
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> index f948d33e5ec5..c8568e5d1147 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -37,9 +37,6 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>   	if (unlikely(flags & PTE_READ_ONLY))
>>   		pte &= ~GEN8_PAGE_RW;
>>   
>> -	if (flags & PTE_LM)
>> -		pte |= GEN12_PPGTT_PTE_LM;
>> -
>>   	/*
>>   	 * For pre-gen12 platforms pat_index is the same as enum
>>   	 * i915_cache_level, so the switch-case here is still valid.
>> -- 
>> 2.39.2
>>
