Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4BC780AAD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 13:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7079110E4F3;
	Fri, 18 Aug 2023 11:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D5D10E4EE;
 Fri, 18 Aug 2023 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692356609; x=1723892609;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7L87dGvj9Lwe8KR6+W1GL9dDCAiM+RuOpadmu1aakwc=;
 b=ekLQiib2C5x1mAFOQ3+LaJK5zWpcF/1BSVH1CfP7TvnT1t5w7TKTADZ0
 sq0ulRBsaYo7MmsmWETfr3qTPdW6h1SBXGWW2iWKLMCTn0PVmDEceUo4L
 AckE250fLUcQ+m7RXoQkQ4qM/gSFBzVYjTL4IyRfyd2StaO1BGy9O7DlO
 MbBYzvgDsr3vU7C0Rw9vKVvwUPtbPEZx0X5+08ZaoFO+KUHn4SIn0HEZc
 shCz3VktwI+G89eSHl/J+y1qBW7YBwglxj1rGZHdq0W0Ue6y0s1zHa6ZS
 765y6xc5FsIdr1kRziNuVTls2AttZ7bCMKBTbEV6Z5K6CFIhzPp14EOFm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459429842"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="459429842"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 04:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="711967132"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="711967132"
Received: from rladysz-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 04:03:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Intel-gfx] [RESEND PATCH] drm/i915: constify pointers to
 hwmon_channel_info
In-Reply-To: <87a5xskbny.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
 <87a5xskbny.fsf@intel.com>
Date: Fri, 18 Aug 2023 14:03:19 +0300
Message-ID: <87a5uo8vew.fsf@intel.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 May 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 11 May 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> Statically allocated array of pointers to hwmon_channel_info can be made
>> const for safety.
>
> Btw if you want to further make things const, the compound literals
> defined by HWMON_CHANNEL_INFO() still end up mutable, even if they're
> only referenced inline using a const pointer. If possible, would be nice
> to add const there too.

Krzysztof, can I persuade you to follow up on this one? ;)

With HWMON_CHANNEL_INFO defined like this:

#define HWMON_CHANNEL_INFO(stype, ...)	\
	(&(struct hwmon_channel_info) {	\
		.type = hwmon_##stype,	\
		.config = (u32 []) {	\
			__VA_ARGS__, 0	\
		}			\
	})

and initializers like this all over the kernel:

static const struct hwmon_channel_info * const hwm_info[] = {
	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
	NULL
};

You'll actually end up with *mutable non-const* struct
hwmon_channel_info's being allocated in .data sections, and having the
const pointers in the arrays point at the mutable stuff. Check with
readelf or objdump.

To put all of it in .rodata, you'd need to make the compound literals
const too:

 #define HWMON_CHANNEL_INFO(stype, ...)	\
-	(&(struct hwmon_channel_info) {	\
+	(&(const struct hwmon_channel_info) {	\
 		.type = hwmon_##stype,	\

But I'm not up for going throw all of the use sites to see if they can
all be const.


BR,
Jani.



>
> BR,
> Jani.
>
>>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/i915/i915_hwmon.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
>> index 8e7dccc8d3a0..e99e8c97ef01 100644
>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>> @@ -267,7 +267,7 @@ static const struct attribute_group *hwm_groups[] = {
>>  	NULL
>>  };
>>  
>> -static const struct hwmon_channel_info *hwm_info[] = {
>> +static const struct hwmon_channel_info * const hwm_info[] = {
>>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>> @@ -275,7 +275,7 @@ static const struct hwmon_channel_info *hwm_info[] = {
>>  	NULL
>>  };
>>  
>> -static const struct hwmon_channel_info *hwm_gt_info[] = {
>> +static const struct hwmon_channel_info * const hwm_gt_info[] = {
>>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>>  	NULL
>>  };

-- 
Jani Nikula, Intel Open Source Graphics Center
