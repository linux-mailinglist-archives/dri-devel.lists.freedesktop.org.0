Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B155287C0F0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 17:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941C10EF4E;
	Thu, 14 Mar 2024 16:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbzSBFrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1D910EF4E;
 Thu, 14 Mar 2024 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710432388; x=1741968388;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xAnI8MPiFBJ2niClHFiZeOk8l5r7cL4JtmHSlGbzMXk=;
 b=cbzSBFrcMbVdesme7g2XMHwXro/aaS0pOpHOpunSiz1qKhdL4EHCKfqS
 77VGxK/4xLM0k+6csPu5rB0Mx15WgLMEH8QSjXW6gT2fDuODxjcTwDlPR
 idIpuAR17wjSgpYzf7c3Yu+3f60Mt4Flf9XiSak/G4MBIYYKIlDXOudI7
 WqcWMBHBGVBoVoW0rr8jJrPM0XqLsymCIJD+oEfjeXNv2vcumU9XzW8ql
 c7uQSqaRfTAJfBgDYBoqVjWqrlFTD/0UDcZ1fl/Z1yX+dJOXA6GF+PmWR
 ArQf37aZ2nAHsfIUOcV9VAW1DKvmTQiRAUN1Sua5Kt7Ai/I64tIwYSrKc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16417456"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16417456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43259502"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.35.115])
 ([10.246.35.115])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:05:11 -0700
Message-ID: <35df0767-384f-49f2-806a-f83765ca7c4c@linux.intel.com>
Date: Thu, 14 Mar 2024 17:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Report full vm address range
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 stable@vger.kernel.org
References: <20240313193907.95205-1-andi.shyti@linux.intel.com>
 <46ab1d25-5d16-4610-8b8f-2ee07064ec2e@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <46ab1d25-5d16-4610-8b8f-2ee07064ec2e@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/14/2024 3:04 PM, Lionel Landwerlin wrote:
> Hi Andi,
>
> In Mesa we've been relying on I915_CONTEXT_PARAM_GTT_SIZE so as long 
> as that is adjusted by the kernel

What do you mean by adjusted by, should it be a aligned size?

I915_CONTEXT_PARAM_GTT_SIZE ioctl is returning vm->total which is 
adjusted(reduced by a page).

This patch might cause silent error as it is not removing WABB which is 
using the reserved page to add dummy blt and if userspace is using that

page then it will be overwritten.


Regards,

Nirmoy

> , we should be able to continue working without issues.
>
> Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
> Thanks,
>
> -Lionel
>
> On 13/03/2024 21:39, Andi Shyti wrote:
>> Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
>> vm") has reserved an object for kernel space usage.
>>
>> Userspace, though, needs to know the full address range.
>>
>> Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.2+
>> ---
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c 
>> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> index fa46d2308b0e..d76831f50106 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -982,8 +982,9 @@ static int gen8_init_rsvd(struct 
>> i915_address_space *vm)
>>         vm->rsvd.vma = i915_vma_make_unshrinkable(vma);
>>       vm->rsvd.obj = obj;
>> -    vm->total -= vma->node.size;
>> +
>>       return 0;
>> +
>>   unref:
>>       i915_gem_object_put(obj);
>>       return ret;
>
>
