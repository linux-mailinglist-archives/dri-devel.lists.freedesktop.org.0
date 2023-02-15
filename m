Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323E697F97
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 16:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8148F10E164;
	Wed, 15 Feb 2023 15:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE8F10E162;
 Wed, 15 Feb 2023 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676475460; x=1708011460;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7IMC4TKCsaB6fCeSRB2vScmVNKbwvw6HmFhZYBTr5u0=;
 b=KrIwGNvur4xVWEe8TttN+XObm6mDrLaYHdffZvZtGH/HSfDcRvL93Pl0
 s9ID0rfEm710EbjUHMrB5T5QDsuAF/dVnkq+PclApjSHijrYkqqQXuuFY
 gS+oJrZyc6aNbFepAPi9zhtZ2fluHRny7HHHKvHwQerW8Sejz+GDf2tRz
 91bS7YFDCejI4Gd2cJyPPPNjBVmlXtPG//YK+9bEDpi1o9tiknaw8JPsl
 2eh4WcgZwSS0eKwz4rOn0f0whhI+TSknacjQNaT0FbtkLKYK+kQ+BKI4K
 ul+xWiYpk+u79wV3m2Cx6u/etv0xroO59PXynKxUY2TsUYp3yjW16Zqjx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396078874"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="396078874"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 07:37:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="778835346"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="778835346"
Received: from gchung-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.51.244])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 07:37:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915/hwmon: Enable PL1 power
 limit"
In-Reply-To: <Y+QBJLXJ7uTo3p7l@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230208190312.1611335-1-ashutosh.dixit@intel.com>
 <Y+QBJLXJ7uTo3p7l@intel.com>
Date: Wed, 15 Feb 2023 17:37:30 +0200
Message-ID: <877cwjq6rp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Feb 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Wed, Feb 08, 2023 at 11:03:12AM -0800, Ashutosh Dixit wrote:
>> This reverts commit 0349c41b05968befaffa5fbb7e73d0ee6004f610.
>> 
>> 0349c41b0596 ("drm/i915/hwmon: Enable PL1 power limit") is incorrect and
>> caused a major regression on ATSM. The change enabled the PL1 power limit
>> but FW sets the default value of the PL1 limit to 0 which implies HW now
>> works at minimum power and therefore the lowest effective frequency. This
>> means all workloads now run slower resulting in even GuC FW load operations
>> timing out, rendering ATSM unusable.
>> 
>> A different solution to the original issue of the PL1 limit being disabled
>> on ATSM is needed but till that is developed, revert 0349c41b0596.
>> 
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
>
> pushed to drm-intel-next and removed from drm-intel-fixes.
>
> Thanks for the quick reaction.

Please always add Fixes: tags also to reverts.

I suppose we should fix dim to also detect reverts, but I ended up
cherry-picking and pushing the original commit out to
drm-intel-next-fixes before realizing it's been reverted.


BR,
Jani.


>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_hwmon.c | 5 -----
>>  1 file changed, 5 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
>> index 4683a5b96eff1..1225bc432f0d5 100644
>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>> @@ -687,11 +687,6 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>>  		for_each_gt(gt, i915, i)
>>  			hwm_energy(&hwmon->ddat_gt[i], &energy);
>>  	}
>> -
>> -	/* Enable PL1 power limit */
>> -	if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
>> -		hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
>> -						    PKG_PWR_LIM_1_EN, PKG_PWR_LIM_1_EN);
>>  }
>>  
>>  void i915_hwmon_register(struct drm_i915_private *i915)
>> -- 
>> 2.38.0
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
