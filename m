Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF85A82BF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 18:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E423510E479;
	Wed, 31 Aug 2022 16:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5632E10E479;
 Wed, 31 Aug 2022 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661962288; x=1693498288;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NBfCWzYbyuL+k32joQAKk4jVaWSXioNUcycpQB6BaMQ=;
 b=nZuBBxs/mSsfsEOTul7pUz+v1DietBwOnaum1orEqC/r7xWt/7frHBOH
 7usNIAD8mzknMnWmEMEafnrDBZRBkakR82TMTladrdjbr8RLGOxI+ggWK
 /thIqKsfmwf0UXyC/bHMOxwq/N3JCD9UM5fTd9C2idFyM0PN0yHQXu+gE
 PF4x4gSPL96KEsRHoAladqa5infYftIBjlpalW94VlqUFnM4obOiKQS07
 B47QmFjGYMbWUrjWqkUD3nGYF+EoMJTNcC0qaa0obV4dmZHY54RUNqYgJ
 /MWrJxhMqrUwGhdE7GNxsLKx0FBF73j1rCyaSZTTB0WrQDHZuxb3w3gmq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="282458547"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="282458547"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 09:09:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="673412058"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.43.91])
 ([10.252.43.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 09:09:13 -0700
Message-ID: <d947d50b-248f-9f56-80d9-c1f73049b6a1@linux.intel.com>
Date: Wed, 31 Aug 2022 18:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: Abort suspend on
 i915_ttm_backup failure
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-gfx@lists.freedesktop.org
References: <20220829120409.24260-1-nirmoy.das@intel.com>
 <f8f8d5d8-3e50-2eac-1a29-d3583ef99ebe@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <f8f8d5d8-3e50-2eac-1a29-d3583ef99ebe@intel.com>
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
Cc: thomas.hellstrom@intel.com, dri-devel@lists.freedesktop.org,
 chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/31/2022 5:50 PM, Matthew Auld wrote:
> On 29/08/2022 13:04, Nirmoy Das wrote:
>> On system suspend when system memory is low then i915_gem_obj_copy_ttm()
>> could fail trying to backup a lmem obj. GEM_WARN_ON() is not enough,
>> suspend shouldn't continue if i915_ttm_backup() throws an error.
>>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6529
>
> Does this fix it? Does CI not complain about the drm_err? Also do we 
> know what the actual error was?


The error isn't reoccurring so the best guess is: large framebuffer copy 
took long time and  wait_for_suspend()

timed out. This needs more coverage from IGT and I am looking into 
that.  Let's ignore the "Closes" tag from this

patch till I come up a IGT test for this.


Nirmoy


>
>> Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Passing the error along seems reasonable to me,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
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
>> +        goto out_no_populate;
>> +    }
>>       ttm_bo_wait_ctx(backup_bo, &ctx);
>>         obj->ttm.backup = backup;
