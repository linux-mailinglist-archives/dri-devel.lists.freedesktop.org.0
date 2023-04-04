Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 873DA6D6EEF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 23:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA04010E2D9;
	Tue,  4 Apr 2023 21:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D4310E1FD;
 Tue,  4 Apr 2023 21:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680643604; x=1712179604;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Gq6CQFen4e2ff9QTttmNRt+fEJhdfSq2wiYPiT/2pNg=;
 b=cUC3GMmr/C8t93P4Jo4nRMQ8bdSd0d4h4rYu3q6PBzbug5aFt2KvkDcN
 JMOm9D7/kzIqO/gzt/eEeriyr591lyGtwEWjSTCfQbif/0DU080p9K56y
 d68P/6xBHe0XkV3QngqArG6O2Us/NGoHFDmHAd3UBApFqGmbroiNrsdk0
 yZlBz9a4MX1keLzesgelvL+lO5fFXm+CwAHq1R3Gduf64Gpb7f4tDi3P7
 P+UWtlH23xLilG5CRQNaCIkqvmsT+inRdiquwyYsU3vIRVrkKbOs9oZtJ
 TD3ClISIm5fBr10M7/QEMQLTzRHtt344/DPoZutdFCLG0w23Xlrm5rIQE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="321967876"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="321967876"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 14:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716790545"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="716790545"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.33.159])
 ([10.249.33.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 14:26:40 -0700
Message-ID: <11c408fd-e9be-5764-a847-defbeec2de9d@linux.intel.com>
Date: Tue, 4 Apr 2023 23:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/mtl: Disable stolen memory backed
 FB for A0
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, jouni.hogander@intel.com
References: <20230404181342.23362-1-nirmoy.das@intel.com>
 <ZCxsDA86FrHzL7Rk@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <ZCxsDA86FrHzL7Rk@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/4/2023 8:27 PM, Ville Syrjälä wrote:
> On Tue, Apr 04, 2023 at 08:13:42PM +0200, Nirmoy Das wrote:
>> Stolen memory is not usable for MTL A0 stepping beyond
>> certain access size and we have no control over userspace
>> access size of /dev/fb which can be backed by stolen memory.
>> So disable stolen memory backed fb by setting i915->dsm.usable_size
>> to zero.
>>
>> v2: remove hsdes reference and fix commit message(Andi)
>> v3: use revid as we want to target SOC stepping(Radhakrishna)
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> index 8ac376c24aa2..ee492d823f1b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> @@ -535,6 +535,14 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>>   	/* Basic memrange allocator for stolen space. */
>>   	drm_mm_init(&i915->mm.stolen, 0, i915->dsm.usable_size);
>>   
>> +	/*
>> +	 * Access to stolen lmem beyond certain size for MTL A0 stepping
>> +	 * would crash the machine. Disable stolen lmem for userspace access
>> +	 * by setting usable_size to zero.
>> +	 */
>> +	if (IS_METEORLAKE(i915) && INTEL_REVID(i915) == 0x0)
>> +		i915->dsm.usable_size = 0;
> That certainly won't prevent FBC from using stolen.
> Are we sure that FBC accesses are fine?

I think so. I remember Jouni tested this patch internally to unblock a 
FBC test.

Jouni, could you please share your thoughts. I can't seem to find the 
internal JIRA reference right now.


Regards,

Nirmoy

>
>> +
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.39.0
