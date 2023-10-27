Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA67D9C0A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877A710E9CE;
	Fri, 27 Oct 2023 14:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65A910E9CE;
 Fri, 27 Oct 2023 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698418069; x=1729954069;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y4P9Bqeterqdl3jqcGwjUkIBi2NtNxgmJccLiuc5rHI=;
 b=gDBeQykvwtLguwvkT2t+ruVqzLo5Gcnc0ABQf+q453K1G3fJifhiRPmy
 tsEdZc95wM9YXJXypJaSkrf45Wri94oPoum+0Yy8n9Yk5QN4YCbc3mwPJ
 QPq25MYni9kjOtfHudNWJL3ulrtD4Jy333fg/eHCL89RENI6PTUm1Zbm/
 yTdxz9NoqKGi3ZbWulCw1iifmGVUg1at8idHHskLmLIFDLtpJ9r0HefpH
 sR8TWAjNk/aLQCZsvmyHBtJReXP/4M4cez3DdxsfYCrY3aB4cvuKUDQ/B
 pw66lm25C7ubjCegCt7lcovYVd1rePVhhbVX4E+hnK/iyTzqLT70+lpMh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="384990204"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="384990204"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 07:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="1090946608"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="1090946608"
Received: from dhanlon-mobl1.ger.corp.intel.com (HELO [10.213.221.114])
 ([10.213.221.114])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 07:47:45 -0700
Message-ID: <4d850f3c-c199-470f-b83e-00bd9fddbd7a@linux.intel.com>
Date: Fri, 27 Oct 2023 15:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i915/perf: Fix NULL deref bugs with drm_dbg() calls
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231027140729.2505993-1-harshit.m.mogalapalli@oracle.com>
 <1e844f00-fc16-4788-8d90-ebe115eb9313@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1e844f00-fc16-4788-8d90-ebe115eb9313@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/10/2023 15:11, Andrzej Hajda wrote:
> On 27.10.2023 16:07, Harshit Mogalapalli wrote:
>> When i915 perf interface is not available dereferencing it will lead to
>> NULL dereferences.
>>
>> Fix this by using DRM_DEBUG() which the scenario before the commit in
>> the Fixes tag.
>>
>> Fixes: 2fec539112e8 ("i915/perf: Replace DRM_DEBUG with driver 
>> specific drm_dbg call")
>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> 
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Please hold off merging.

>> ---
>> This is found using smatch(static analysis tool), only compile tested.
>> ---
>>   drivers/gpu/drm/i915/i915_perf.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>> b/drivers/gpu/drm/i915/i915_perf.c
>> index 2f3ecd7d4804..bb48c96b7950 100644
>> --- a/drivers/gpu/drm/i915/i915_perf.c
>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>> @@ -4228,8 +4228,7 @@ int i915_perf_open_ioctl(struct drm_device *dev, 
>> void *data,
>>       int ret;
>>       if (!perf->i915) {
>> -        drm_dbg(&perf->i915->drm,
>> -            "i915 perf interface not available for this system\n");
>> +        DRM_DEBUG("i915 perf interface not available for this 
>> system\n");

What's that struct drm_device *dev function argument a few lines up? :)

Although TBH all these these could just be removed since I doubt they 
are adding any value and ENOTSUPP is pretty clear.

Regards,

Tvrtko

>>           return -ENOTSUPP;
>>       }
>> @@ -4608,8 +4607,7 @@ int i915_perf_add_config_ioctl(struct drm_device 
>> *dev, void *data,
>>       int err, id;
>>       if (!perf->i915) {
>> -        drm_dbg(&perf->i915->drm,
>> -            "i915 perf interface not available for this system\n");
>> +        DRM_DEBUG("i915 perf interface not available for this 
>> system\n");
>>           return -ENOTSUPP;
>>       }
>> @@ -4774,8 +4772,7 @@ int i915_perf_remove_config_ioctl(struct 
>> drm_device *dev, void *data,
>>       int ret;
>>       if (!perf->i915) {
>> -        drm_dbg(&perf->i915->drm,
>> -            "i915 perf interface not available for this system\n");
>> +        DRM_DEBUG("i915 perf interface not available for this 
>> system\n");
>>           return -ENOTSUPP;
>>       }
> 
