Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A196428C6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 13:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F1810E225;
	Mon,  5 Dec 2022 12:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4910510E1CB;
 Mon,  5 Dec 2022 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670244644; x=1701780644;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gMptldGVhzjYPnMTfCAP3dSbkbYOTvZXp35eCE2vSQg=;
 b=ZDuYUX3sHDY9tsdT0ZEFBXoHWhbleaQSB+/XZRs4PToZsJgWXbIu3nbe
 ByYMU/d5XepqyXsu+LHfXJhvnzEDNkrcRsf1DqMmln0SC8SCiprv3MA5v
 VP1/3tL4/jwkhZ6dYPTKRnMuPubeNfmUdzpdR2QUidJhsQ1j9shQRAb4V
 FVUnJVAAkmp6XEmPUkO+9Muek6BLiwzl5Fgwx2Rxks7T3WE9wFLRCBSpK
 fy/F9Tkbw6+AAoNb4+ziif78WYqp/K/84plJPe9torsYArbT2OMXU6Ing
 +P4NUZmFW0WFHTrzzlNjt/mLSWLcusW+8tuldnRIvz4EYumjNedMZIYQj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="313984732"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="313984732"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 04:50:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="890949604"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="890949604"
Received: from naumanha-mobl.ger.corp.intel.com (HELO [10.213.231.131])
 ([10.213.231.131])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 04:50:42 -0800
Message-ID: <9d3d31bb-039b-651f-9788-100252f53a00@linux.intel.com>
Date: Mon, 5 Dec 2022 12:50:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Check full IP version when
 applying hw steering semaphore
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20221202223528.714491-1-matthew.d.roper@intel.com>
 <Y4qA760HHNU2b7RJ@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y4qA760HHNU2b7RJ@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/12/2022 22:49, Rodrigo Vivi wrote:
> On Fri, Dec 02, 2022 at 02:35:28PM -0800, Matt Roper wrote:
>> When determining whether the platform has a hardware-level steering
>> semaphore (i.e., MTL and beyond), we need to use GRAPHICS_VER_FULL() to
>> compare the full version rather than just the major version number
>> returned by GRAPHICS_VER().
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 3100240bf846 ("drm/i915/mtl: Add hardware-level lock for steering")
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> index 087e4ac5b68d..41a237509dcf 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>> @@ -367,7 +367,7 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>>   	 * driver threads, but also with hardware/firmware agents.  A dedicated
>>   	 * locking register is used.
>>   	 */
>> -	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
>> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))

Ouch, tricky class of bugs... Anyone has an idea how to maybe coerce the compiler into spotting them for us, cheaply?

This one is undefined behaviour I think so not good:

-#define IP_VER(ver, rel)               ((ver) << 8 | (rel))
+typedef void * i915_full_ver_t;
+
+#define IP_VER(ver, rel) (i915_full_ver_t)(unsigned long)((ver) << 8 | (rel))

Regards,

Tvrtko

>>   		err = wait_for(intel_uncore_read_fw(gt->uncore,
>>   						    MTL_STEER_SEMAPHORE) == 0x1, 100);
>>   
>> @@ -407,7 +407,7 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
>>   {
>>   	spin_unlock_irqrestore(&gt->mcr_lock, flags);
>>   
>> -	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
>> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>>   		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>>   }
>>   
>> -- 
>> 2.38.1
>>
