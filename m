Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B58868B96
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960F110ED75;
	Tue, 27 Feb 2024 09:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/cL/1B/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FDC10E8D8;
 Tue, 27 Feb 2024 09:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709024689; x=1740560689;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y2UrKSWInZ9I0x2fkWVzm6GMFP9c8TqSE09bFhTMbjg=;
 b=j/cL/1B/TdTds099mJEbxXDFIhDwwUj7O0fcQ/TfK+1vEp2LxUuLAwVs
 sjfMvkyl/U+CpVNUqAJi8VtauBxIE4oq5gqiSgPPy2ay07/hOOe+vVKcP
 OWvz9plZwVS3gYQNGsg1EQZuvbfyf7+qD9RefO6NZu4qiBWuJkxuP/VLp
 8T/+fNosHQkK3AxTUOhphb4AxNHYGFxcXLI/+rgtHjSyfivx38dH74bsc
 KyOlMEGbelUYIoja8CrFh0euig/uV3AxrKSRP2MXOeQQRLrjnXocPJek4
 w8k4F4t7SQV58/3EaoEYUPCMQDnShj385eBHTrH+3l58dwJes46uIbuUt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7140349"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7140349"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11592685"
Received: from vsorecau-mobl.ger.corp.intel.com (HELO [10.213.217.201])
 ([10.213.217.201])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:04:47 -0800
Message-ID: <96eec421-090a-4420-ab94-098414334e29@linux.intel.com>
Date: Tue, 27 Feb 2024 09:04:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: check before removing mm notifier
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Shawn Lee <shawn.c.lee@intel.com>
References: <20240219125047.28906-1-nirmoy.das@intel.com>
 <3c1a25f9-b1ee-4832-a89c-68813cc72416@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <3c1a25f9-b1ee-4832-a89c-68813cc72416@linux.intel.com>
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


On 21/02/2024 11:52, Nirmoy Das wrote:
> Merged it to drm-intel-gt-next with s/check/Check

Shouldn't this have had:

Fixes: ed29c2691188 ("drm/i915: Fix userptr so we do not have to worry about obj->mm.lock, v7.")
Cc: <stable@vger.kernel.org> # v5.13+

?

Regards,

Tvrtko
  
> On 2/19/2024 1:50 PM, Nirmoy Das wrote:
>> Error in mmu_interval_notifier_insert() can leave a NULL
>> notifier.mm pointer. Catch that and return early.
>>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Shawn Lee <shawn.c.lee@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> index 0e21ce9d3e5a..61abfb505766 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> @@ -349,6 +349,9 @@ i915_gem_userptr_release(struct 
>> drm_i915_gem_object *obj)
>>   {
>>       GEM_WARN_ON(obj->userptr.page_ref);
>> +    if (!obj->userptr.notifier.mm)
>> +        return;
>> +
>>       mmu_interval_notifier_remove(&obj->userptr.notifier);
>>       obj->userptr.notifier.mm = NULL;
>>   }
