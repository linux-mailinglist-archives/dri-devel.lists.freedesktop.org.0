Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918968A9703
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 12:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F745113192;
	Thu, 18 Apr 2024 10:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhvJ+u8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B0D10FBB0;
 Thu, 18 Apr 2024 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713435014; x=1744971014;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ndzPxIg8Myuph1BxKvie0FrlTnYiWR+q5a1usk+ktr0=;
 b=HhvJ+u8DagJYiCxYBilN8+7W7f8d8wfvJ7qB7r/eB+pbiFkax2sYi/7F
 8RKahNUQj6BpeGYJmuNu5RzdAyOfGF5xW+BVEClGyNupDqqGPTXtRBRuy
 OoB/I9mBp4EpEh0NbPkXImnrOfbiKl49os5QRPWe7RrshC6h4dYZW5296
 CH/Zo06C4ZHNvkg11+fNpkfeU5FXlPfbSyp5GNwk104Lm2oALTXBuaF+R
 yrE277TaKVaQ3kgha4YSNXNDyauApP2m8lMfG/q0Dj9ZiHdFj1dWpYfIw
 ygknXXB/ypDli2Xfhlgnt7Z3PhywGOAoQ19dfHuh/VPvFxTrYnKEEDS+L w==;
X-CSE-ConnectionGUID: Xlx6sTboQpezrO5pdsyBOg==
X-CSE-MsgGUID: Pm+QuNghTtmLHgyXsnnUfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="11915391"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="11915391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 03:10:13 -0700
X-CSE-ConnectionGUID: MMkXmdRNSF6xopy+N1S3DQ==
X-CSE-MsgGUID: z2bmknMFSViK0t7mjlZTyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="60357107"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 03:10:10 -0700
Message-ID: <af4a1507-201c-4f8f-a855-a65e91c418ae@linux.intel.com>
Date: Thu, 18 Apr 2024 15:43:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Extract xe_gt_idle() helper
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
 <20240417084145.242480-4-aravind.iddamsetty@linux.intel.com>
 <fa0574b1-cff1-48b1-bc8e-ccd5a8b2d0a6@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <fa0574b1-cff1-48b1-bc8e-ccd5a8b2d0a6@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/04/24 19:20, Michal Wajdeczko wrote:
>
> On 17.04.2024 10:41, Aravind Iddamsetty wrote:
>> This would be used in other places outside of gt_reset path.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c | 31 +++++++++++++++++++++----------
>>  drivers/gpu/drm/xe/xe_gt.h |  1 +
>>  2 files changed, 22 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index cfa5da900461..59f497d575ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
>>  	return 0;
>>  }
>>  
>> +/* Idle the GT */
> as this is a public function, can we have a proper kernel-doc here?
>
> and maybe some hint what should be done if this function fails?

Ok will do.

Thanks,
Aravind.
>
>> +int xe_gt_idle(struct xe_gt *gt)
>> +{
>> +	int err;
>> +
>> +	xe_gt_sanitize(gt);
>> +
>> +	xe_uc_gucrc_disable(&gt->uc);
>> +	xe_uc_stop_prepare(&gt->uc);
>> +	xe_gt_pagefault_reset(gt);
>> +
>> +	err = xe_uc_stop(&gt->uc);
>> +	if (err)
>> +		return err;
>> +
>> +	xe_gt_tlb_invalidation_reset(gt);
>> +
>> +	return err;
>> +}
>> +
>>  static int gt_reset(struct xe_gt *gt)
>>  {
>>  	int err;
>> @@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
>>  	}
>>  
>>  	xe_pm_runtime_get(gt_to_xe(gt));
>> -	xe_gt_sanitize(gt);
>>  
>>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>  	if (err)
>>  		goto err_msg;
>>  
>> -	xe_uc_gucrc_disable(&gt->uc);
>> -	xe_uc_stop_prepare(&gt->uc);
>> -	xe_gt_pagefault_reset(gt);
>> -
>> -	err = xe_uc_stop(&gt->uc);
>> -	if (err)
>> -		goto err_out;
>> -
>> -	xe_gt_tlb_invalidation_reset(gt);
>> +	xe_gt_idle(gt);
>>  
>>  	err = do_gt_reset(gt);
>>  	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index ed6ea8057e35..d62af1725ff6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
>>  void xe_gt_reset_async(struct xe_gt *gt);
>>  void xe_gt_sanitize(struct xe_gt *gt);
>>  void xe_gt_remove(struct xe_gt *gt);
>> +int xe_gt_idle(struct xe_gt *gt);
>>  
>>  /**
>>   * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
