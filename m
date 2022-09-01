Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9205A9DF0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 19:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE5810E0CD;
	Thu,  1 Sep 2022 17:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD63D10E0CC;
 Thu,  1 Sep 2022 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662053002; x=1693589002;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VVuqBZbzMJCih0FOJA6So+dPXf7oXfY5h0sBm4RSNGI=;
 b=gPpGh4B11c5DDNKEueS8107YGI1635+XOz8qZ4eg0sgeR7ofseNsKm+z
 KgMfVhybTit3UL6zg+XzBDLpmx7mf6lQ7U1gkCaG25/adrgGgdqXktR4V
 QqAAfVcZLhcxh/SrbNJeqLyST3OAxVblHrKy6SfnkMgfE5tMJkZbDatSm
 XwxVw67wvzvN9JwlZXuoJY55i+nbS9hleKOvRnFBsphzKZrgS3f7tiGJM
 vUm5ae0LxnZheqJmXcyCXLezEiPjTJx4oNuiLzpL88gnjrurJx6dsVJvC
 o7FY7iXlXdTv6gfPxrIEzthlchONzT+SO59ErDICK+ZTsOzq38zr5+yq1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="357495601"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="357495601"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 10:23:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642428528"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.45.222])
 ([10.249.45.222])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 10:23:19 -0700
Message-ID: <1c52a5f4-a9b6-e0a5-2804-77a0d84df6e9@linux.intel.com>
Date: Thu, 1 Sep 2022 19:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: Abort suspend on
 i915_ttm_backup failure
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220831161841.20033-1-nirmoy.das@intel.com>
 <119f1fe3-e7cb-6cd6-2710-e1c3e395d49e@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <119f1fe3-e7cb-6cd6-2710-e1c3e395d49e@intel.com>
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
Cc: thomas.hellstrom@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/1/2022 5:57 PM, Andrzej Hajda wrote:
> On 31.08.2022 18:18, Nirmoy Das wrote:
>> On system suspend when system memory is low then i915_gem_obj_copy_ttm()
>> could fail trying to backup a lmem obj. GEM_WARN_ON() is not enough,
>> suspend shouldn't continue if i915_ttm_backup() throws an error.
>>
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6529
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>> index 9aad84059d56..6f5d5c0909b4 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>> @@ -79,7 +79,12 @@ static int i915_ttm_backup(struct 
>> i915_gem_apply_to_region *apply,
>>           goto out_no_populate;
>>         err = i915_gem_obj_copy_ttm(backup, obj, pm_apply->allow_gpu, 
>> false);
>> -    GEM_WARN_ON(err);
>> +    if (err) {
>> +        drm_err(&i915->drm,
>> +            "Unable to copy from device to system memory, err:%d\n",
>> +            err);
>
> I wonder if %pe wouldn't be better here, up to you.


More readable err should be useful, resend with %pe.

>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Thanks,

Nirmoy

>
> Regards
> Andrzej
>
>
>> +        goto out_no_populate;
>> +    }
>>       ttm_bo_wait_ctx(backup_bo, &ctx);
>>         obj->ttm.backup = backup;
>
