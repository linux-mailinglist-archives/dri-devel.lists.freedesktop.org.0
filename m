Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3AC8C8982
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 17:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC70B10E091;
	Fri, 17 May 2024 15:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5WjZo13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC4D10E08D;
 Fri, 17 May 2024 15:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715960569; x=1747496569;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FUXQZbfspfZ8SCcNINadRqkhNgiXPf+U1KcSOzNYtZo=;
 b=Q5WjZo13HyofsyVdnEFac77mV9f7WH3V8Ym9ZOtpHyVvvgEM4xNXDBmd
 dg9RaCEUe9oGELzGeCAlqJA/a3PDJArFwQWI4Jn00qvbItA1detG8KEuP
 B3kk4HD8vo6UKrMTTzUEcQaeRXThbbshxfS3doEsfSgQXZ5pg4/jbZ4k6
 Q8rOD587hAAJc3UcS7OkHeXvjhpxqPpViHNHl9ax+NXAhm9vSY789++Ol
 NPPvXTPrjU+k556FXtd39fJAQ2ACUljc26v5A+YyGYvp37dYm0S/sJrc4
 TJsADWNhCtjeBh3kZ1/dAkmaUwAbdWAqlxysyPx8uoZ+nsxGIxcC+TJZ1 w==;
X-CSE-ConnectionGUID: cMPta5WOTBalof84O+m8pQ==
X-CSE-MsgGUID: IK1Nt6sQTAuN5U2ok2ENTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15934097"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="15934097"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 08:42:49 -0700
X-CSE-ConnectionGUID: ub1jckZKRgq2KIvwf2bNgg==
X-CSE-MsgGUID: ucXBcUhoQUCgQJnUYBEdWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="36240473"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 17 May 2024 08:42:46 -0700
Received: from [10.94.252.59] (mwajdecz-MOBL.ger.corp.intel.com [10.94.252.59])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4566228791;
 Fri, 17 May 2024 16:42:37 +0100 (IST)
Message-ID: <41afa7a4-57ab-4f88-9b54-b4f7a83c633f@intel.com>
Date: Fri, 17 May 2024 17:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/print: Add generic drm dev printk function
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240517125730.2304-1-michal.wajdeczko@intel.com>
 <20240517125730.2304-2-michal.wajdeczko@intel.com> <87seyga7h7.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87seyga7h7.fsf@intel.com>
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



On 17.05.2024 15:33, Jani Nikula wrote:
> On Fri, 17 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>> We already have some drm printk functions that need to duplicate
>> a code to get a similar format of the final result, for example:
>>
>>   [ ] 0000:00:00.0: [drm:foo] bar
>>   [ ] 0000:00:00.0: [drm] foo bar
>>   [ ] 0000:00:00.0: [drm] *ERROR* foo
>>
>> Add a generic __drm_dev_vprintk() function that can format the
>> final message like all other existing function do and allows us
>> to keep the formatting code in one place.
> 
> Nice idea!
> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_print.c | 49 ++++++++++++++++++++-----------------
>>  include/drm/drm_print.h     |  3 +++
>>  2 files changed, 30 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
>> index cf2efb44722c..a2b60c8245a1 100644
>> --- a/drivers/gpu/drm/drm_print.c
>> +++ b/drivers/gpu/drm/drm_print.c
>> @@ -187,19 +187,12 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
>>  	const struct drm_device *drm = p->arg;
>>  	const struct device *dev = drm ? drm->dev : NULL;
>>  	enum drm_debug_category category = p->category;
>> -	const char *prefix = p->prefix ?: "";
>> -	const char *prefix_pad = p->prefix ? " " : "";
>>  
>>  	if (!__drm_debug_enabled(category))
>>  		return;
>>  
>>  	/* Note: __builtin_return_address(0) is useless here. */
>> -	if (dev)
>> -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME "]%s%s %pV",
>> -			   prefix_pad, prefix, vaf);
>> -	else
>> -		printk(KERN_DEBUG "[" DRM_NAME "]%s%s %pV",
>> -		       prefix_pad, prefix, vaf);
>> +	__drm_dev_vprintk(dev, KERN_DEBUG, NULL, p->prefix, vaf);
>>  }
>>  EXPORT_SYMBOL(__drm_printfn_dbg);
>>  
>> @@ -277,6 +270,29 @@ void drm_print_bits(struct drm_printer *p, unsigned long value,
>>  }
>>  EXPORT_SYMBOL(drm_print_bits);
>>  
>> +void __drm_dev_vprintk(const struct device *dev, const char *level,
>> +		       const void *origin, const char *prefix,
>> +		       struct va_format *vaf)
>> +{
>> +	const char *prefix_pad = prefix ? " " : (prefix = "");
> 
> Too clever, please just keep it simple:
> 
> 	const char *prefix_pad = prefix ? " " : "";
> 
> 	if (!prefix)
> 		prefix = "";
> 
>> +
>> +	if (dev)
>> +		if (origin)
>> +			dev_printk(level, dev, "[" DRM_NAME ":%ps]%s%s %pV",
>> +				   origin, prefix_pad, prefix, vaf);
>> +		else
>> +			dev_printk(level, dev, "[" DRM_NAME "]%s%s %pV",
>> +				   prefix_pad, prefix, vaf);
>> +	else
>> +		if (origin)
>> +			printk("%s" "[" DRM_NAME ":%ps]%s%s %pV",
>> +			       level, origin, prefix_pad, prefix, vaf);
>> +		else
>> +			printk("%s" "[" DRM_NAME "]%s%s %pV",
>> +			       level, prefix_pad, prefix, vaf);
> 
> I'd sprinkle a few curly braces around the top level if-else blocks.
> 
> Side note, feels like using DRM_NAME makes things harder, not
> easier. But that's for another patch.
> 
>> +}
>> +EXPORT_SYMBOL(__drm_dev_vprintk);
> 
> AFAICT this could be a non-exported static function. And probably moved
> earlier in the file to not require a declaration.

true for now, but I was planning to add Xe GT specific printer that
would use this function like this:

+static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct
va_format *vaf)
+{
+       struct xe_gt *gt = p->arg;
+       const struct device *dev = gt_to_xe(gt)->drm.dev;
+       char prefix[8];
+
+       if (!drm_debug_enabled(DRM_UT_DRIVER))
+               return;
+
+       /* xe_gt_dbg() callsite decorations are unhelpful */
+       snprintf(prefix, sizeof(prefix), "GT%u:", gt->info.id);
+       __drm_dev_vprintk(dev, KERN_DEBUG, p->origin, prefix, vaf);
+}
+

but I can add this new custom printer to the series right now in v2 to
show the usage and avoid any confusion

> 
> BR,
> Jani.
> 
>> +
>>  void drm_dev_printk(const struct device *dev, const char *level,
>>  		    const char *format, ...)
>>  {
>> @@ -287,12 +303,7 @@ void drm_dev_printk(const struct device *dev, const char *level,
>>  	vaf.fmt = format;
>>  	vaf.va = &args;
>>  
>> -	if (dev)
>> -		dev_printk(level, dev, "[" DRM_NAME ":%ps] %pV",
>> -			   __builtin_return_address(0), &vaf);
>> -	else
>> -		printk("%s" "[" DRM_NAME ":%ps] %pV",
>> -		       level, __builtin_return_address(0), &vaf);
>> +	__drm_dev_vprintk(dev, level, __builtin_return_address(0), NULL, &vaf);
>>  
>>  	va_end(args);
>>  }
>> @@ -312,12 +323,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>>  	vaf.fmt = format;
>>  	vaf.va = &args;
>>  
>> -	if (dev)
>> -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
>> -			   __builtin_return_address(0), &vaf);
>> -	else
>> -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
>> -		       __builtin_return_address(0), &vaf);
>> +	__drm_dev_vprintk(dev, KERN_DEBUG, __builtin_return_address(0), NULL, &vaf);
>>  
>>  	va_end(args);
>>  }
>> @@ -351,8 +357,7 @@ void __drm_err(const char *format, ...)
>>  	vaf.fmt = format;
>>  	vaf.va = &args;
>>  
>> -	printk(KERN_ERR "[" DRM_NAME ":%ps] *ERROR* %pV",
>> -	       __builtin_return_address(0), &vaf);
>> +	__drm_dev_vprintk(NULL, KERN_ERR, __builtin_return_address(0), "*ERROR*", &vaf);
>>  
>>  	va_end(args);
>>  }
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index 089950ad8681..bb1801c58544 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -366,6 +366,9 @@ static inline struct drm_printer drm_err_printer(struct drm_device *drm,
>>  __printf(3, 4)
>>  void drm_dev_printk(const struct device *dev, const char *level,
>>  		    const char *format, ...);
>> +void __drm_dev_vprintk(const struct device *dev, const char *level,
>> +		       const void *origin, const char *prefix,
>> +		       struct va_format *vaf);
>>  struct _ddebug;
>>  __printf(4, 5)
>>  void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
> 
