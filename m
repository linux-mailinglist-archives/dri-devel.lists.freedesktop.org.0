Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A3AB994D
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765AD10EA1A;
	Fri, 16 May 2025 09:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJrLLXT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486610EA19;
 Fri, 16 May 2025 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747388902; x=1778924902;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=E8hHokSYiknM4wfbcbYPmZeauO7Fqiy7Iy/M9ZRBbgQ=;
 b=CJrLLXT+EEJh8dsxfMMkwZZ9O73sp8sBpIu2OKEvnE7Su1vCAjcvw09X
 5SSA2ifUs/rwR1KnX57taKjBZ2ICLckAyx53fj6tsXDlIOy7XdWRmo2Sb
 9ULhGfqo4ekP193HTv4Z5yEWsdE7y44dRkMwqakhMuNQkT2IeA8Hw3MYR
 BvwA+rHahVYzIcWyyLH2i3HsNwbyjhcbqKhbBLOtS6n9spx89lF6qzt6l
 mlOzUlK73zynjEd/+EGg1nODHRc2rQqbtU/B81gi8hBxMgB5i4lK7Iogp
 uJw4mJ10zgGQbChOChFLwT1jjSLXldzSWsem4frnWxMa+F2JpLpRKGn8K A==;
X-CSE-ConnectionGUID: k+gAVugdS8uf6pi0O8vCag==
X-CSE-MsgGUID: nr3Yehi2QLaH3ZVqB6YMfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49051222"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49051222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 02:48:22 -0700
X-CSE-ConnectionGUID: DFjD7rQQQ0iEXRYOQ7F61g==
X-CSE-MsgGUID: 1EXQVm3MQiySvPagkZ/Cdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="142652590"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 02:48:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Bill Wendling <isanbard@gmail.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, gustavo.sousa@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 linux-kernel@vger.kernel.org, kees@kernel.org
Subject: Re: [PATCH 5/5] drm/print: require struct drm_device for drm_err()
 and friends
In-Reply-To: <98201050-82eb-453d-a669-036eeefa354e@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
 <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
 <98201050-82eb-453d-a669-036eeefa354e@gmail.com>
Date: Fri, 16 May 2025 12:48:16 +0300
Message-ID: <87tt5kx4wv.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 May 2025, Bill Wendling <isanbard@gmail.com> wrote:
> On 1/23/25 7:09 AM, Jani Nikula wrote:
>> The expectation is that the struct drm_device based logging helpers get
>> passed an actual struct drm_device pointer rather than some random
>> struct pointer where you can dereference the ->dev member.
>> 
>> Add a static inline helper to convert struct drm_device to struct
>> device, with the main benefit being the type checking of the macro
>> argument.
>> 
>> As a side effect, this also reduces macro argument double references.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   include/drm/drm_print.h | 41 +++++++++++++++++++++++------------------
>>   1 file changed, 23 insertions(+), 18 deletions(-)
>> 
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index 9732f514566d..f31eba1c7cab 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -584,9 +584,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>>    * Prefer drm_device based logging over device or prink based logging.
>>    */
>>   
>> +/* Helper to enforce struct drm_device type */
>> +static inline struct device *__drm_to_dev(const struct drm_device *drm)
>> +{
>> +	return drm ? drm->dev : NULL;
>> +}
>> +
>>   /* Helper for struct drm_device based logging. */
>>   #define __drm_printk(drm, level, type, fmt, ...)			\
>> -	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
>> +	dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
>>   
>>   
>>   #define drm_info(drm, fmt, ...)					\
>> @@ -620,25 +626,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>>   
>>   
>>   #define drm_dbg_core(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
>> -#define drm_dbg_driver(drm, fmt, ...)						\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
>> +#define drm_dbg_driver(drm, fmt, ...)					\
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>>   #define drm_dbg_kms(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
>>   #define drm_dbg_prime(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
>>   #define drm_dbg_atomic(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>>   #define drm_dbg_vbl(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
>>   #define drm_dbg_state(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
>>   #define drm_dbg_lease(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>>   #define drm_dbg_dp(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
>>   #define drm_dbg_drmres(drm, fmt, ...)					\
>> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
>> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
>>   
>>   #define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
>>   
>> @@ -727,10 +733,9 @@ void __drm_err(const char *format, ...);
>>   #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
>>   ({												\
>>   	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
>> -	const struct drm_device *drm_ = (drm);							\
>>   												\
>>   	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
>> -		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
>> +		drm_dev_printk(__drm_to_dev(drm), KERN_DEBUG, fmt, ## __VA_ARGS__);		\
>>   })
>>   
>>   #define drm_dbg_ratelimited(drm, fmt, ...) \
>> @@ -752,13 +757,13 @@ void __drm_err(const char *format, ...);
>>   /* Helper for struct drm_device based WARNs */
>>   #define drm_WARN(drm, condition, format, arg...)			\
>>   	WARN(condition, "%s %s: [drm] " format,				\
>> -			dev_driver_string((drm)->dev),			\
>> -			dev_name((drm)->dev), ## arg)
>> +			dev_driver_string(__drm_to_dev(drm)),		\
>> +			dev_name(__drm_to_dev(drm)), ## arg)
>>   
>>   #define drm_WARN_ONCE(drm, condition, format, arg...)			\
>>   	WARN_ONCE(condition, "%s %s: [drm] " format,			\
>> -			dev_driver_string((drm)->dev),			\
>> -			dev_name((drm)->dev), ## arg)
>> +			dev_driver_string(__drm_to_dev(drm)),		\
>> +			dev_name(__drm_to_dev(drm)), ## arg)
>>
> Hi Jani,
>
> These two changes introduce undefined behavior into these macros. The final
> code generation becomes this (from 'bxt_port_to_phy_channel'):
>
> 	__warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
> 		      dev_driver_string(__drm_to_dev(display->drm)),
> 		      dev_name(__drm_to_dev(display->drm)),
> 		      (port + 'A'));
>
> The issue lies in 'dev_name(__drm_to_dev(display->drm))'. After inlining, it
> becomes this (pseudo code):
>
> 	struct device *device = display->drm ? display->drm->dev : NULL;
> 	const char *name = device->init_name ? device->init_name
> 					     : kobject_name(&device->kobj);
>
> 	__warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
> 		      dev_driver_string(device), name, (port + 'A'));
>
> The issue, of course, is that the 'device' may be NULL when attempting 
> to get
> 'device->init_name'. The compiler sees this as undefined behavior, which may
> lead to unexpected outcomes, especially with Clang where paths 
> determined to be
> undefined are removed entirely under certain conditions.

Would it be better to just revert the drm_WARN() and drm_WARN_ONCE()
macros to use (drm)->dev directly?

It's not ideal, but as the quick fix.

I don't think adding the check in dev_name() would go down well, as
there are roughly 5k users of it, and feels like unnecessary code size
bloat.


BR,
Jani.



>
> (Note, I'm working on making this behavior less draconian by adopting a GCC
> pass, but this will take time to filter out to Linux devs.)
>
> Regards,
> -bw
>

-- 
Jani Nikula, Intel
